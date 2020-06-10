#!/bin/bash
# Licensed Materials - Property of IBM
# (C) Copyright IBM Corporation 2020. All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# This script is used to download packages from quay.io/opencloudio
#

CS_OPERATORS_PACKAGES=(
    quay.io/opencloud/ibm-common-service-operator
    quay.io/opencloud/ibm-iam-operator-app
    quay.io/opencloud/ibm-metering-operator-app
    quay.io/opencloud/ibm-mongodb-operator-app
    quay.io/opencloud/ibm-ingress-nginx-operator-app
    quay.io/opencloud/ibm-healthcheck-operator-app
    quay.io/opencloud/ibm-management-ingress-operator-app
    quay.io/opencloud/ibm-elastic-stack-operator-app
    quay.io/opencloud/ibm-cert-manager-operator-app
    quay.io/opencloud/ibm-licensing-operator-app
    quay.io/opencloud/ibm-platform-api-operator-app
    quay.io/opencloud/ibm-monitoring-grafana-operator-app
    quay.io/opencloud/ibm-monitoring-prometheusext-operator-app
    quay.io/opencloud/ibm-monitoring-exporters-operator-app
    quay.io/opencloud/ibm-catalog-ui-operator-app
    quay.io/opencloud/ibm-auditlogging-operator-app
    quay.io/opencloud/ibm-commonui-operator-app
    quay.io/opencloud/ibm-helm-api-operator-app
    quay.io/opencloud/ibm-helm-repo-operator-app
    quay.io/opencloud/operand-deployment-lifecycle-manager-app
    )

curl -sLO https://get.helm.sh/helm-v2.16.7-linux-amd64.tar.gz
tar xf helm-v2.16.7-linux-amd64.tar.gz

git clone https://github.com/app-registry/appr-helm-plugin.git ~/.helm/plugins/registry

mkdir -p manifests
for package in ${CS_OPERATORS_PACKAGES[@]}; do
    linux-amd64/helm registry pull $package
done

\cp -r opencloud*/deploy/olm-catalog/* manifests/
