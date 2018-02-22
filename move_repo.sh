function usage {
 echo ""
 echo "Usage: \033[0;34m `basename $0` <Repository to be moved> <Repository it goes into> \033[0m"
 echo ""
 echo "Example: If you have a repository called dojos, and another called dojo7, running \033[0;34m ./move_repo.sh dojo7 dojos \033[0m will copy dojo7 into dojos as a first level subdirectory, and maintain the git history."
 echo ""
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
 usage
 exit 0
fi

if [ "$#" -ne 2 ]; then
 echo "\033[0;31mError: Invalid number of arguments. \033[0m"
 usage
 exit 1
fi

if [ ! -d "$1" ] || [ ! -d "$2" ]; then
 echo "\033[0;31mError: Directory does not exist \033[0m"
 usage
 exit 1
fi

cd $1
mkdir .$1
git mv * .$1
git mv .$1 $1
git add .
git commit -a -m "Preparing $1 for move"
cd ../$2
git remote add temp ../$1
git fetch temp
git merge --allow-unrelated-histories --no-edit temp/master
git checkout --ours .
git add .
git commit
git remote rm temp
cd ../$1
git revert --no-edit HEAD