init:
	terraform -chdir=terraform init

plan:
	terraform -chdir=terraform plan -out=tfplan

apply:
	terraform -chdir=terraform apply tfplan

destroy:
	terraform -chdir=terraform destroy -auto-approve
