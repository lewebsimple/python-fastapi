install:
	@echo ">> Installing dependencies"
	python -m build --wheel

install-dev: install
	python -m build --wheel ".[dev]"

clean:
	rm -rf build
	rm -rf dist

build:
	python -m pip install --upgrade pip
	python -m pip install pip-tools
	pip-compile --resolver=backtracking --output-file=requirements.txt pyproject.toml
	pip-compile --resolver=backtracking --output-file=requirements-dev.txt pyproject.toml
