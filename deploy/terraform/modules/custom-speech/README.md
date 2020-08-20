# Module Properties

This module creates a custom speech resource.

Example usage and testing

``` hcl
module "custom_speech" {
    source             = "../modules/custom-speech"
    custom_speech_name = var.custom_speech_name
}
```

## Requirements

No requirements.

## Providers

| Name    | Version |
|---------|---------|
| azurerm | ~> 2    |

## Inputs

| Name               | Description      | Type   | Default | Required |
| ------------------ | ---------------- | ------ | ------- | -------- |
| custom_speech_name | The service name | string | n/a     | yes      |

## Outputs

| Name        | Description |
|-------------|-------------|
| n/a         |             |
