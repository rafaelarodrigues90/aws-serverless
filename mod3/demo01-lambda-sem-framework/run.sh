# 1- criar arquivo de políticas de segurança

# políticas da aws => https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/access_policies.html
# 2- criar role de segurança na AWS
aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://policy.json \
    | tee logs/role.log

# 3- criar arquivo
zip function.zip index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs14.x \
    --role arn:aws:iam::696690535626:role/lambda-exemplo \
    | tee logs/lambda-create.log

# invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# 4- atualizar
zip function.zip index.js

aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec-update.log

# 5- remover
aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo