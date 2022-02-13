set -eux

poetry run black --check ./tfc_utils ./tests
poetry run pylint ./tfc_utils ./tests
poetry run pyright ./tfc_utils ./tests
