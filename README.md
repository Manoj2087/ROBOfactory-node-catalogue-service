# Node Robot Catalogue Service

## Run Dev locally
```
ENV=dev DEBUG="ddb*,robots*" \
docker-compose up --build
```
## Run Test locally
```
ENV=test docker-compose up --build
```
## Destroy Dev/Test
```
docker-compose down

# clear the local docker images
docker image prune -f
```

## Deploy CF - App Pipeline
```
aws cloudformation deploy \
--template-file cloud-formation/infra.yml \
--stack-name <stack-name> \
--parameter-overrides \
ProjectName=<project-name> \
CidrPrefixe="10.10" \
--region <region>
```

## Delete CF - App Pipeline
```
aws cloudformation delete-stack \
--stack-name <stack-name> \
--region <region>
```

## Deploy App pipeline
```
aws cloudformation deploy \
--template-file cloud-formation/app-codepipeline.yml \
--stack-name node-robot-catalogue-service-app-pipeline \
--parameter-overrides \
GitHubOwner=Manoj2087 \
BranchName=master \
MyAppBuildSpecPath=buildspec.yml \
RepositoryName=ROBOfactory-node-catalogue-service \
--capabilities CAPABILITY_IAM \
--region ap-southeast-2
```