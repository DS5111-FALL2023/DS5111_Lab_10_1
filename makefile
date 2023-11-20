default:
	@cat makefile

env:
	python3 -m venv venv
	. venv/bin/activate; \
	pip install -r requirements.txt

.PHONY: remote 
remote:
	bash setup_remote.sh

