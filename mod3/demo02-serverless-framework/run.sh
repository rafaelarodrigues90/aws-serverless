# instalar
npm i -D serverless@1.67

# inicializar
sls 

# sempre fazer deploy do ambiente ao fazer alteração para verificar se está funcional
sls deploy

# invocar na aws
sls invoke -f hello --log

# invocar local
sls invoke local -f hello --log

# configurar dashboard
sls 

# logs
sls logs -f hello --tail

# remover tudo
sls remove