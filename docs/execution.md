# Ambiente de Desenvolvimento

# Instalação Magento

### Passo 1:
Acesse o site https://marketplace.magento.com/customer/accessKeys/ crie sua conta e gere sua chave de acesso seguindo 
os seguintes passos https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/prerequisites/authentication-keys.html?lang=en .

### Passo 2:
Copie o arquivo `.magento_template` para `.magento`, dentro dele você irá inserir as chaves na seguinte ordem:

- `username`: `**MagentoPublicKey**`
- `password`: `**MagentoPrivateKey**`

### Passo 3:
Copie o arquivo `.env_template` para `.env`. Este arquivo contém as variáveis padrões do ambiente de desenvolvimento.
Nele você pode adicionar outras variáveis que precise utilizar dentro do container caso instale ou customize a aplicação
ou os serviços.

### Passo 4:
Execute a build de todas as imagens: `./docker/build.sh`

Rode seu ambiente: `docker-compose up`


# Debug e Ajustes
Caso precise alterar configurações do NGinx ou do PHP, é necessário fazer a build da imagem novamente, para isso não é 
necessário fazer a build de todas imagens, você pode rodar somente da imagem do NGinx com o seguinte comando:

`./docker/nginx/build.sh`


# Reset de todo o ambiente
Caso precise reiniciar todo o ambiente eliminando por completo seu banco MySQL, ElasticSearch e outros que armazenem 
dados, você pode usar o utilitário `./docker/reset.sh` **CUIDADO, IRÁ DELETAR TODOS OS DADOS**.

