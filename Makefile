default: ./dkr ./stk

./stk: tmp/stk src/unpack.sh src/eb-init.sh src/dockerrun.aws.json.sh src/deploy-template.txt src/eb-create.sh src/cleanup.sh
	@cp src/template.txt $@
	@for component in $^; do cat $$component >> $@; echo >> $@; done
	@chmod +x $@
	@echo "Finished building new application binary"

./dkr: tmp/dkr src/unpack.sh src/dkr.sh src/cleanup.sh
	@cp src/template.txt $@
	@for component in $^; do cat $$component >> $@; echo >> $@; done
	@chmod +x $@
	@echo "Finished building new dockerize binary"

clean: ./stk ./dkr ./tmp
	rm -rf $^
	mkdir tmp

tmp/dkr: ./build_steps ./dockerfiles ./src/env.example
	@echo 'bindata=$(shell tar cz $^ | base64)' > $@

tmp/stk: src/Dockerrun.aws.jq bin/jq src/deploy-template.txt
	@echo 'bindata=$(shell tar cz $^ | base64)' > $@

