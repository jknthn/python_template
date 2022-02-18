check-black:
	@echo "Checking black..."
	@pipenv run black ./src --check
	@pipenv run black ./scripts --check

check-flake8:
	@echo "Checking flake8..."
	@pipenv run flake8 ./src --exit-zero --config ./Pipfile
	@pipenv run flake8 ./scripts --exit-zero --config ./Pipfile

check-isort:
	@echo "Checking isort..."
	@pipenv run isort ./src
	@pipenv run isort ./scripts

check-mypy:
	@echo "Checking mypy..."
	@pipenv run mypy --config-file ./Pipfile ./src
	@pipenv run mypy --config-file ./Pipfile ./scripts

check-lint: check-black check-flake8 check-isort check-mypy

run-tests:
	@pipenv run pytest src/tests

run-tests-coverage:
	@pipenv run coverage run -m pytest src/tests
	@pipenv run coverage report -m
