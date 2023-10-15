.PHONY: init format

init:
	poetry install

site:
	hugo server --disableFastRender