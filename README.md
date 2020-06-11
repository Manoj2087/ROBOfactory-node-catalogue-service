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

## Deploy App pipeline
```
# Create\update
aws cloudformation deploy \
--template-file cloud-formation/app-codepipeline.yml \
--stack-name node-robot-catalogue-service-app-pipeline \
--parameter-overrides \
GitHubOwner=Manoj2087 \
BranchName=master \
RepositoryName=ROBOfactory-node-catalogue-service \
MyAppBuildSpecPath=buildspec.yml \
MyAppECSRepoURI= \
--capabilities CAPABILITY_IAM \
--region ap-southeast-2

# Delete
aws cloudformation delete-stack \
--stack-name node-robot-catalogue-service-app-pipeline \
--region ap-southeast-2
```