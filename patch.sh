readonly ARGS="$@"

cmdline() {
while getopts d:c:i:v: option
do
 case "${option}"
 in
 d) DEPLOYMENT_NAME=${OPTARG};;
 c) CONTAINER_NAME=${OPTARG};;
 i) IMAGE_NAME=${OPTARG};;
 v) VERSION=$OPTARG;;
 esac
done
}

main() {
        cmdline $ARGS

        kubectl patch deployment $DEPLOYMENT_NAME -p '{"spec":{"template":{"spec":{"containers":[{"name":"'${CONTAINER_NAME}'","image":"'${IMAGE_NAME}':'${VERSION}'"}]}}}}'
}
main
