.PHONY: plan
plan:
	./bin/terraform.sh plan

.PHONY: apply
apply:
	./bin/terraform.sh apply

.PHONY: destroy
destroy:
	./bin/terraform.sh destroy

.PHONY: show
show:
	./bin/terraform.sh workspace show

.PHONY: init
init:
	./bin/init.sh
	./bin/terraform.sh init
