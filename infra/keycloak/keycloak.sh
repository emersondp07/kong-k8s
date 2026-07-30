#!/bin/bash
cd "$(dirname "$0")"

kubectl create ns iam

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm install keycloak bitnami/keycloak --namespace iam \
  --set auth.adminUser=keycloak,auth.adminPassword=keycloak \
  --set image.repository=bitnamilegacy/keycloak \
  --set postgresql.image.repository=bitnamilegacy/postgresql