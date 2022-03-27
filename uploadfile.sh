first=$1
second=$2
if [ ! -z $first ]; then

export repoPath="$second"
export filepath=$(find . -name $first)
export FILE_NAME=$(echo $filepath | tr -s '/' '\n' | tail -1)
curl --insecure -H "X-JFrog-Art-Api:apikey" -T $filepath "https://jfrogurl.com/artifactory/team-generic-artifactory/$repoPath/$FILE_NAME"

else

echo "provide the reqired jar name"

fi

