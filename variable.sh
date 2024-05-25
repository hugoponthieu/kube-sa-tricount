export SERVICE_ACCOUNT_NAME=tricount-service-account
export CONTEXT=$(kubectl config current-context)
export NAMESPACE=tricount2

export NEW_CONTEXT=tricount2
export KUBECONFIG_FILE="config-hercules"


export SECRET_NAME=$(kubectl get serviceaccount ${SERVICE_ACCOUNT_NAME} \
  --context ${CONTEXT} \
  --namespace ${NAMESPACE} \
  -o jsonpath='{.secrets[0].name}')
echo $SECRET_NAME
export TOKEN_DATA=$(kubectl get secret ${SECRET_NAME} \
  --context ${CONTEXT} \
  --namespace ${NAMESPACE} \
  -o jsonpath='{.data.token}')
echo $TOKEN_DATA
export TOKEN=$(echo ${TOKEN_DATA} | base64 -d)
echo $TOKEN
