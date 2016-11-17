# scripts
Scripts to make your life easier

move_repo.sh helps you move one repository into another, while preserving the git history.
Usage - `./move_repo.sh <Repository to be moved> <Repository it goes into>`

For example, if I have a repository dojos, and another called dojo7. Running `./move_repo.sh dojo7 dojos` will copy dojo7 into dojos as a first level subdirectory, and maintain the git history.

