# tfc-utils

A CLI helper tool for Terraform Cloud.

<a href="https://pypi.org/project/tfc-utils" target="_blank">
    <img src="https://img.shields.io/pypi/v/tfc-utils?color=%2334D058&label=pypi%20package" alt="Package version">
</a>
<a href="https://codecov.io/gh/ilyasotkov/tfc-utils">
  <img src="https://codecov.io/gh/ilyasotkov/tfc-utils/branch/main/graph/badge.svg?token=1O5F4A71A8"/>
</a>

> ⚠️ This project is not affiliated with HashiCorp in any way, shape or form.

## Usage

```
Usage: python -m tfc_utils [OPTIONS] COMMAND [ARGS]...

  A CLI helper tool for Terraform Cloud.

Options:
  --install-completion  Install completion for the current shell.
  --show-completion     Show completion for the current shell, to copy it or
                        customize the installation.
  --help                Show this message and exit.

Commands:
  get-output  Get the value of a Terraform Cloud workspace output.
```

### `get-output`

```
Usage: python -m tfc_utils get-output [OPTIONS] WORKSPACE_REF

  Get the value of a Terraform Cloud workspace output.

  For example: `python -m tfc_utils get-output my-corp/my-
  workspace/instance_ip_addr`

Arguments:
  WORKSPACE_REF  Reference to a Terraform Cloud workspace in
                 '<org_name>/<workspace_name>/<output_name>' format.
                 [required]

Options:
  --tfc-token TEXT  Terraform Cloud access token  [env var: TFE_TOKEN,
                    TFC_TOKEN; required]
  --help            Show this message and exit.
```
