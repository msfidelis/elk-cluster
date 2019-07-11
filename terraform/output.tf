output "server_configs" {
  value = <<CONFIGURATION

Elasticsearch Endpoint: http://${module.cluster.alb_dns}:9200
Kibana Dashboard: http://${module.cluster.alb_dns}:5601/app/kibana
Elastic APM Endpoit: http://${module.cluster.alb_dns}:8200

Go to ansible folder and apply the playbooks to config instances

$ cd ansible
$ ansible-playbook playbooks/cluster.yml

CONFIGURATION
}