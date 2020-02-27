kubectl run k8splus-exec --image=lionel:v1 --serviceaccount='k8splus-exec' \
--env="PODNAME=nginx-7cdb6cc8bd-mlht8" \
--env="NS=default" \
--env="USERPWD=pangms:pms" \
--env="CONTAINERNAME=nginx" \
-n k8splus-system