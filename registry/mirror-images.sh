export OCP_RELEASE=4.6.7-x86_64
export LOCAL_REGISTRY='pool1-infra.pool1.com:5000' 
export LOCAL_REPOSITORY=ocp467
export PRODUCT_REPO='openshift-release-dev' 
export LOCAL_SECRET_JSON='/root/OCP4x/registry/pull-secret.json' 
export RELEASE_NAME="ocp-release"
export GODEBUG=x509ignoreCN=0
export REMOVABLE_MEDIA_PATH=/root
 
 # Below command will mirror the OpenShift 4 content to your local container registry!
 
# oc adm -a {LOCAL_SECRET_JSON} release mirror \
#     --from=quay.io/${PRODUCT_REPO}/${RELEASE_NAME}:${OCP_RELEASE} \
#     --to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
#     --to-release-image=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE} 

oc adm -a ${LOCAL_SECRET_JSON} release mirror \
     --from=quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE} \
     --to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
     --to-release-image=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE}
