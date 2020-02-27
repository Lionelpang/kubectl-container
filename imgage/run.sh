
#!/bin/bash

cat > ~/.gotty <<EOF
// Listen at port 9000 by default
port = "8080"

// Enable TSL/SSL by default
enable_tls = false

// hterm preferences
// Smaller font and a little bit bluer background color
preferences {
    font_size = 5
    background_color = "rgb(16, 16, 32)"
}
EOF

mkdir -p ~/.kube

cat > ~/.kube/config <<EOF
apiVersion: v1
kind: Config
clusters:
- cluster:
    api-version: v1
    server: "https://10.254.0.1"
    certificate-authority: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
  name: "k8splus-tenant-sa"
contexts:
- context:
    cluster: "Default"
    user: "k8splus-tenant-sa"
  name: "k8splus-tenant-sa"
current-context: "k8splus-tenant-sa"
users:
- name: "k8splus-tenant-sa"
  user:
    token: "$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
EOF

gotty -w -c ${USERPWD} kubectl exec -it ${PODNAME} -c ${CONTAINERNAME} -n ${NS} bash $*

if [ $? -ne 0 ]; then
  echo "try the sh"
  gotty -w -c ${USERPWD} kubectl exec -it ${PODNAME} -n ${NS} -c ${CONTAINERNAME} sh $*
else
  echo "exit"
fi

