#!/bin/sh

helm install stable/elasticsearch --name elasticsearch --namespace logging --set client.heapSize=512m --set master.heapSize=512m --set data.replicas=1 --set master.replicas=2 --set client.replicas=1 --set data.heapSize=512m --set master.persistence.size=2Gi --set data.persistence.size=5Gi
helm install stable/fluentd-elasticsearch --name fluentd --namespace logging --set elasticsearch.host=elasticsearch-client
helm install stable/kibana --set env.ELASTICSEARCH_URL=http://elasticsearch-client:9200 --name kibana --namespace logging

