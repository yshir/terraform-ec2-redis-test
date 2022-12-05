.PHONY: plan
plan:
	./bin/terraform.sh plan

.PHONY: apply
apply:
	./bin/terraform.sh apply -auto-approve

.PHONY: destroy
destroy:
	./bin/terraform.sh destroy -auto-approve

.PHONY: show
show:
	./bin/terraform.sh workspace show

.PHONY: init
init:
	./bin/init.sh
	./bin/terraform.sh init
