#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_emails/ tests/

black democritus_emails/ tests/

mypy democritus_emails/ tests/

pylint --fail-under 9 democritus_emails/*.py

flake8 democritus_emails/ tests/

bandit -r democritus_emails/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_emails/ tests/
