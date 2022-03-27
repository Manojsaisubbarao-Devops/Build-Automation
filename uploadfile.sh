first=$1
second=$2
if [ ! -z $first ]; then

export repoPath="$second"
export filepath=$(find . -name $first)
export FILE_NAME=$(echo $filepath | tr -s '/' '\n' | tail -1)
curl --insecure -H "X-JFrog-Art-Api:AKCp8k8ES2TeeqNBXjXJ3LhFf3w8FmgYdLvTmqBnLJruRLxsoyiPhwphVsYmwbAibRRtM6jbk" -T $filepath "https://artifacthub-phx.oci.oraclecorp.com/artifactory/cegbu-bfs-generic/$repoPath/$FILE_NAME" --noproxy artifacthub-phx.oci.oraclecorp.com

else

echo "provide the reqired jar name"

fi

