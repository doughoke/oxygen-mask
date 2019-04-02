## Oxygen Mask Prometheus

Oxygen mask is the concourse SLI montoring suite. It sets up pipelines that run periodically and emit SLI metrics to prometheus.

### Usage

##### Prerequisites

Before running the pipeline setup script there should be a concourse team setup for monitoring. This team should support basic auth.

##### Setup

Log in to the concourse team you created for monitoring then run the setup script.

datadog
`scripts/setup-datadog -t <teamname> -u <username> -p <password> -d <datadog_api_key> -g <github_access_token>`

prometheus gateway
`scripts/setup-prometheus -t <monitored-teamname> -x <monitored-team> -u <username> -p <password> -d <datadog_api_key> -g <github_access_token>`
