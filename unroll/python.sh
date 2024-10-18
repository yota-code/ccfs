#!/usr/bin/env zsh

export prefix_DIR=/dk/vertex/root/platform/debian11_skylake_202402

source ${0:A:h:h}/install_path ${prefix_DIR}

pushd ${prefix_DIR}

	./bin/python3 -m pip install --upgrade pip

	./bin/python3 -m venv ../../py3venv/base_${CCFS_compile_DATE}

	source ../../py3venv/base_${CCFS_compile_DATE}/bin/activate

	../../py3venv/base_${CCFS_compile_DATE}/bin/python3 -m pip install --upgrade pip

	pip3 install --upgrade cherrypy mako cc_pathlib sphynx
	pip3 install --upgrade numpy scipy sympy matplotlib control
	pip3 install --upgrade h5py hdf5plugin
	pip3 install --upgrade jupyter jupyterlab



