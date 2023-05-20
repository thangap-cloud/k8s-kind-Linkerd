.PHONY: help deploy clean destroy

help:
	@echo "\n Deploy Linkerd in Kind . \n"
	@echo "Usage: \n\
make deploy          This brings up kind cluster and deploy Linkerd. \n\
make clean           This will clean .terraform and tf.plan files. \n\
make destroy         This will destroy the kind cluster. \n\
"

deploy:
	@terraform -chdir=kind-cluster/ init
	@terraform -chdir=kind-cluster/ plan -out tf.plan
	@terraform -chdir=kind-cluster/ apply tf.plan
	@sleep 10

	@terraform -chdir=Cert-Manager/ init
	@terraform -chdir=Cert-Manager/ plan -out tf.plan
	@terraform -chdir=Cert-Manager/ apply tf.plan
	@sleep 10

	@terraform -chdir=issuers/ init
	@terraform -chdir=issuers/ plan -out tf.plan
	@terraform -chdir=issuers/ apply tf.plan
	@sleep 10

	@terraform -chdir=Linkerd/ init
	@terraform -chdir=Linkerd/ plan -out tf.plan
	@terraform -chdir=Linkerd/ apply tf.plan
	@sleep 10

clean:
	@rm -rf Cert-Manager/.terraform*
	@rm -rf Cert-Manager/tf.plan

	@rm -rf kind-cluster/.terraform*
	@rm -rf kind-cluster/tf.plan

	@rm -rf issuers/.terraform*
	@rm -rf issuers/tf.plan

	@rm -rf Linkerd/.terraform*
	@rm -rf Linkerd/tf.plan


destroy:
	@terraform -chdir=kind-cluster/ destroy --auto-approve
	@rm -rf states/*
	@rm -rf kind-cluster/cluster*





