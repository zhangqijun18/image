git add .
git commit -m "build image"
tag=`cat Dockerfile  | grep FROM | awk -F/ '{gsub(":","_",$NF);print $NF}'`_`date "+%Y%m%d%H%M"`
git tag release-v$tag -m $tag
git push origin release-v$tag
echo docker pull zhangqijun/image:$tag | awk '{print $0;system($0)}'
echo docker tag zhangqijun/image:$tag `cat Dockerfile | grep FROM | awk '{print $2}'` | awk '{print $0;system($0)}'
