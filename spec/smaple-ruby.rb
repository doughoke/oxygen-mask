require 'json'
require 'yaml'

#@@metric_product = "PROMETHEUS"

def task(name, file, binding)
  {
    task: name,
    config: YAML.load(ERB.new(File.read(file)).result(binding))
  }.to_json
end

# def emit_datadog_metric(name, value, binding)
#   task(
#     "emit-datadog-metric-#{name}",
#     'tasks/emit_datadog_metric.yml.erb',
#     binding
#   )
# end

# def emit_prometheus_metric(name, value, binding)
#   task(
#     "emit-prometheus-metric-#{name}",
#     'tasks/emit_prometheus_metric.yml.erb',
#     binding
#   )
# end

def emit_metric(name, value)
  task(
    "emit-prometheus-metric-#{name}",
    'tasks/emit_prometheus_metric.yml.erb',
    binding
  )
  # if @@metric_product.casecmp("PROMETHEUS") == 0
  #   task(
  #     "emit-prometheus-metric-#{name}",
  #     'tasks/emit_prometheus_metric.yml.erb',
  #     binding
  #   )
  # elsif @@metric_product.casecmp("DATADOG") == 0
  #   task(
  #     "emit-datadog-metric-#{name}",
  #     'tasks/emit_datadog_metric.yml.erb',
  #     binding
  #   )
  # else
  #   puts "Please set METRIC_VENDOR to either DATADOG or PROMETHEUS"
  # end
end