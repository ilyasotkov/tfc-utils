# tfc-utils

A CLI helper tool for Terraform Cloud.

<a href="https://pypi.org/project/tfc-utils" target="_blank">
    <img src="https://img.shields.io/pypi/v/tfc-utils?color=%2334D058&label=pypi%20package" alt="Package version">
</a>
<a href="https://codecov.io/gh/ilyasotkov/tfc-utils">
  <img src="https://codecov.io/gh/ilyasotkov/tfc-utils/branch/main/graph/badge.svg?token=1O5F4A71A8"/>
</a>

> ⚠️ This project is not affiliated with HashiCorp in any way, shape or form.

## Motivation

I wanted a simple way to get all outputs of a Terraform Cloud workspace from a *different repository*, such as a repo with a [cdk8s](https://cdk8s.io) app.

Wrapping `tfc_utils` in the below shell script, I can export all Terraform outputs as shell variables for local use or for use in GitHub Actions:

```sh
export_tf_output() {
    export $1
    if [ ! -z "$GITHUB_ACTIONS" ]; then
        output_value="$(echo -n $1 | awk -F "=" '{print $2}')"
        echo "::add-mask::$output_value"
        echo "$1" >> $GITHUB_ENV
    fi
}

outputs=$(python -m tfc_utils get-outputs --to-upper)
for s in $(echo $outputs | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
    export_tf_output $s
done
```

## Usage

### `get-ouputs`

```
Usage: python -m tfc_utils get-outputs [OPTIONS]

  Get outputs of a Terraform Cloud workspace as JSON-formatted key-values.

Options:
  --tfc-token TEXT            Terraform Cloud access token  [env var:
                              TFE_TOKEN, TFC_TOKEN; required]
  --tfc-organization TEXT     Terraform Cloud organization name  [env var:
                              TFC_ORGANIZATION, TFE_ORGANIZATION; required]
  --tfc-workspace TEXT        Terraform Cloud workspace name  [env var:
                              TFC_WORKSPACE, TFE_WORKSPACE; required]
  --prefix TEXT               Optional prefix for filtering out outputs (case-
                              sensitive)
  --to-upper / --no-to-upper  Convert output names to uppercase  [default: no-
                              to-upper]
  --help                      Show this message and exit.
```

### `get-output`

```
Usage: python -m tfc_utils get-output [OPTIONS] OUTPUT_NAME

  Get the value of a Terraform Cloud workspace output.

Arguments:
  OUTPUT_NAME  Name of your Terraform output, e.g. 'instance_ip_addr'
               [required]

Options:
  --tfc-token TEXT         Terraform Cloud access token  [env var: TFE_TOKEN,
                           TFC_TOKEN; required]
  --tfc-organization TEXT  Terraform Cloud organization name  [env var:
                           TFC_ORGANIZATION, TFE_ORGANIZATION; required]
  --tfc-workspace TEXT     Terraform Cloud workspace name  [env var:
                           TFC_WORKSPACE, TFE_WORKSPACE; required]
  --help                   Show this message and exit.
```
