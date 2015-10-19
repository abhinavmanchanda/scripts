cd $1
mkdir .$1
git mv * .$1
git mv .$1 $1
git add .
git commit -a -m "Preparing $1 for move"
cd ../$2
git remote add temp ../$1
git fetch temp
git merge temp/master
git checkout --ours .
git add .
git commit
git remote rm temp