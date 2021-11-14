git add .
git commit -m "build image"
tag=`date "+%Y%m%d%H%M"`
git tag release-v$tag -m $tag
git push origin release-v$tag
echo docker pull zhangqijun/image:$tag
