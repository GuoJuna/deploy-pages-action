#!/bin/sh

set -e

REPO_URL=$1
BRANCH=$2
CNAME=$3


echo "REPO_URL=$REPO_URL"
echo "BRANCH=$BRANCH"
echo "CNAME=$CNAME"

# 生成静态文件
npm run build

# 进入生成的文件夹
cd public/

# 如果是发布到自定义域名
echo '"$CNAME"' > CNAME

git init
git add -A
git commit -m 'deploy'

## 推送到coding
##git remote add coding git@e.coding.net:guojuna/blog/blog.git
##git push -u coding master -f

## 推送到github
git remote add github "$REPO_URL"
git checkout -b "$BRANCH"
git push -u github "$BRANCH" -f


