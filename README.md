# ibm-common-service-catalog

The Operator Catalog of IBM Common Services.

When you want to deploy IBM Common Services, you need first create following OpenShift CatalogSource:

```
apiVersion: operators.coreos.com/v1alpha1
kind: CatalogSource
metadata:
  name: opencloud-operators
  namespace: openshift-marketplace
spec:
  displayName: IBMCS Operators
  publisher: IBM
  sourceType: grpc
  image: quay.io/opencloudio/ibm-common-service-catalog:latest
```
