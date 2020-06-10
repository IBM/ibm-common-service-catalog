#!/bin/bash
#
# Licensed Materials - Property of IBM
# (C) Copyright IBM Corporation 2020. All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# This script is used to fetch packages from github.com/IBM
#

CS_OPERATORS=(
    ibm-auditlogging-operator
    ibm-catalog-ui-operator
    ibm-cert-manager-operator
    ibm-common-service-operator
    ibm-commonui-operator
    ibm-elastic-stack-operator
    ibm-healthcheck-operator
    ibm-helm-api-operator
    ibm-helm-repo-operator
    ibm-iam-operator
    ibm-ingress-nginx-operator
    ibm-licensing-operator
    ibm-management-ingress-operator
    ibm-metering-operator
    ibm-mongodb-operator
    ibm-monitoring-exporters-operator
    ibm-monitoring-grafana-operator
    ibm-monitoring-prometheus-operator-ext
    ibm-platform-api-operator
    operand-deployment-lifecycle-manager
    )

mkdir -p manifests

for operator in ${CS_OPERATORS[@]}; do
    curl -sLO https://github.com/IBM/$operator/archive/master.zip
    unzip master.zip
    \cp -r $operator-master/deploy/olm-catalog/* manifests/
    \rm -rf master.zip $operator-master
done

\rm -f manifests/*.yaml
