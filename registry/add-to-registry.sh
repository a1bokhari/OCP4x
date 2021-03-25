#export LOCAL_SECRET_JSON='/root/OCP4x/registry/pull-secret.json' 
 
#oc image mirror -f /root/OCP4x/registry/mapping-missing.txt --insecure --registry-config=${LOCAL_SECRET_JSON}

podman login registry.redhat.io
export MYREGISTRY='pool1-infra.pool1.com:5000'
IMAGEID=$(podman pull registry.redhat.io/rhel8/support-tools:latest 2>/dev/null)
podman login ${MYREGISTRY}
podman push ${IMAGEID} ${MYREGISTRY}/rhel8/support-tools:latest
