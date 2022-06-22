#! /bin/bash
set -e

function help() {
    printf "Usage:\n"
    printf "optional arguments:\n"
    printf "  %-10s    %s\n" '-h' 'help'
    printf "positional arguments:\n"
    printf "  %-10s    %s\n" 'tag' 'name of tag'
    printf "  %-10s    %s\n" 'workspace' 'path to project directory'
}

while getopts "h" arg; do #选项后面的冒号表示该选项需要参数
    case $arg in
    h/?)
        help
        exit 1
        ;;
    esac
done

tag=$1
workspace=$2

if [[ ! $tag ]]; then
    help
fi

project_name=$(basename $workspace)
system_info=$(uname -a)
os=${system_info%% *}
arch=${system_info##* }

cd $workspace
bash compile.sh
tar -pczf ${project_name}_${tag}_${arch}_${os}.tar.gz $project_name
set +e
gh release create $tag --notes ""
set -e
gh release upload $tag ${project_name}_${tag}_${arch}_${os}.tar.gz
rm $project_name
rm ${project_name}_${tag}_${arch}_${os}.tar.gz