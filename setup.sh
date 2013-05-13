#! /bin/sh

echo "What is project name? : "
read project_name

oil create $project_name
cd $project_name

rm -rf .git .gitmodules *.md docs fuel/core fuel/packages

git init
git submodule add git://github.com/fuel/core.git fuel/core
git submodule add git://github.com/fuel/orm.git fuel/packages/orm
git submodule add git://github.com/fuel/auth.git fuel/packages/auth
git submodule add git://github.com/fuel/oil.git fuel/packages/oil
git submodule add git://github.com/fuel/docs.git docs
git submodule add git://github.com/fuel/parser.git fuel/packages/parser
git submodule add git://github.com/fuel/email.git fuel/packages/email

git submodule foreach 'git checkout 1.6/master'
git add .
git commit -m "first commit"
