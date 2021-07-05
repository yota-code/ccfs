#!/usr/bin/env zsh

# this script compile and install a software

if [[ -z $CCFS_prefix_DIR ]]
then
	echo "please load an installation environment"
	return 1
fi


if [[ -z $1 ]]
then
	echo "please specify the name of a software to be installed"
	\ls ${CCFS_archive_DIR}/nix
	return 2
fi

set -x

touch $CCFS_prefix_DIR/reinstalled.log

export package_name=$1

echo "\n>>> installation of \e[1;32m${package_name}\e[0m in \e[1;32m${CCFS_prefix_DIR}\e[0m\n"

tmp_DIR=/tmp/$(whoami)_ccfs

mkdir -m go-xrw ${tmp_DIR}

setopt ERR_EXIT

source_DIR=${tmp_DIR}/${package_name}
if [[ -d ${source_DIR} ]]
then
	rm -rf ${source_DIR}
fi

pushd ${tmp_DIR}
	tar -xf ${CCFS_archive_DIR}/nix/${package_name}.tar*

	build_DIR=${tmp_DIR}/${package_name}-build
	if [[ -d ${build_DIR} ]]
	then
		rm -rf ${build_DIR}
	fi
popd

cd ${source_DIR}

# patch
patch_FILE=${CCFS_custom_DIR}/${package_name}/patch
if [[ -e ${patch_FILE} ]]
then
	echo "\e[1;34mpatch application ...\e[0m"
	patch -b -u -p1 < ${patch_FILE}
fi

# chdir 
prepare_FILE=${CCFS_custom_DIR}/${package_name}/prepare
if [[ -e ${prepare_FILE} ]]
then
	echo "\e[1;34mcustom preparation ...\e[0m"
	source ${prepare_FILE}
else
	echo "\e[34mstandard build dir ...\e[0m"
	mkdir ${build_DIR}
	cd ${build_DIR}
fi
	
# configure
file ${CCFS_custom_DIR}/${package_name}/configure
configure_FILE=${CCFS_custom_DIR}/${package_name}/configure
if [[ -e ${configure_FILE} ]]
then
	echo "\e[1;34mcustom configure ...\e[0m"
	source ${configure_FILE}
else
	echo "\e[34mstandard configure ...\e[0m"
	chmod +x ../${package_name}/configure
	../${package_name}/configure \
		--prefix=${CCFS_prefix_DIR} \
		CC=${CC} CFLAGS="${CFLAGS}" \
		CXX=${CXX} CXXFLAGS="${CXXFLAGS}" \
		CF=${CF} FCFLAGS="${FCFLAGS}" \
		CPP=${CPP} CPPFLAGS="${CPPFLAGS}" \
		LD=${LD} LDFLAGS="${LDFLAGS}"
fi

# make
make_FILE=${CCFS_custom_DIR}/${package_name}/make
if [[ -e ${make_FILE} ]]
then
	echo "\e[1;34mcustom make ...\e[0m"
	source ${make_FILE}
else
	echo "\e[34mstandard make ...\e[0m"
	make -j 4
fi

# install
install_FILE=${CCFS_custom_DIR}/${package_name}/install
if [[ -e ${install_FILE} ]]
then
	echo "\e[1;34mcustom install ...\e[0m"
	source ${install_FILE}
else
	echo "\e[34mstandard install ...\e[0m"
	make install
fi

unsetopt ERR_EXIT

set +x

echo ">>> \e[1;32m${package_name}\e[0m installation done"

datetime=$(date +'%Y%m%d_%H%M%S')

echo "${datetime}	${package_name}" >> $CCFS_prefix_DIR/reinstalled.log
