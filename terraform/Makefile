
TF_OPTIONS=\
	-var-file secrets.tfvars

plan:
	terraform plan $(TF_OPTIONS)

init:
	terraform init $(TF_OPTIONS)

apply:
	terraform apply $(TF_OPTIONS)
	make output 

destroy:
	terraform destroy $(TF_OPTIONS)

output: 
	terraform output