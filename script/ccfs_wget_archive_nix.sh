#!/usr/bin/env zsh

export CFS_root_DIR=/media/chassagne/flash/reinstall/root
export CFS_archive_DIR=/media/chassagne/flash/reinstall/archive

function cfs_archive_nix_find() { # package_name

	package_name=$1
	pushd $CFS_archive_DIR/nix

		package_pth=''
		for e in 'tar.gz' 'tar.lz'
		do
			pth=$package_name.$e
			if [[ -f $pth ]]
			then
				package_pth=$pth
				break
			fi
		done
		
		if [[ -z $package_pth ]]
		then
			return 1
		else
			echo "${package_pth:a}"
			return 0
		fi
		
	popd
	
}

function cfs_archive_nix_download() { # package_name

	package_name=$1
	pushd $CFS_archive_DIR/nix

		while read key value
		do
			if [[ $key == $package_name ]]
			then
				package_url=$value
				echo "download $package_url"
				wget $package_url
				break
			fi
		done < "database.tsv"
	
	popd

}

function cfs_archive_nix_get() { # package_name

	package_name=$1
	
	package_pth=$(cfs_archive_nix_find $package_name)
	
	if [[ $? -eq 0 ]]
	then
		# package_pth found, we return normally
		echo $package_pth
		return 0
	fi
	
	# else, we try to donwload it from the database
	cfs_archive_nix_download $package_name
	
	package_pth=$(cfs_archive_nix_find $package_name)
	if [[ $? -eq 0 ]]
	then
		# package_pth found, we return normally
		echo $package_pth
		return 0
	fi
	
	return 1
			
}

