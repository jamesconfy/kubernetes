setup:
	minikube start --driver=virtualbox

createNameSpace:
	kubectl create ns demo

configureNameSpace:
	kubectl label ns demo tier=test

createDeploy:
	kubectl create deploy nginx-apline --image=nginx-alpine -r=3 -n demo

configureDeploy:
	kubectl label deploy nginx-apline app=nginx tag=alpine -n demo

exposeDeploy:
	kubectl expose nginx-apline --port=8111 --target-port=8111

createConfig:
	kubectl create cm --from-literal=version=alpine -n demo