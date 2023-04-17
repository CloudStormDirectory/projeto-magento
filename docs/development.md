# Ambiente de Desenvolvimento

O Ambiente é composto pelas seguintes imagens oficiais do DockerHub:
- MySQL 8
- PHP 8.2-fpm-alpine3.17

## Container MySQL
Este container está sendo compilado baseado na imagem https://hub.docker.com/_/mysql sem alterações ou implementações adicionais à imagem oficial até o momento.

## Container PHP
Este container está recebendo como adendo o servidor HTTP NGinx para incremento de segurança e customizações futuras nas tratativas de requisições.

Em adição estão sendo instaladas as seguintes extenções necessárias para rodar o Magento Open Source.

### PHP Extension
- bcmath **(default)**
- ctype (Instalado através do [DockerFile](docker/php/Dockerfile))
- curl **(default)**
- dom (Instalado através do [DockerFile](docker/php/Dockerfile))
- fileinfo **(default)**
- filter (Instalado através do [DockerFile](docker/php/Dockerfile))
- gd **(default)**
- hash (Instalado através do [DockerFile](docker/php/Dockerfile))
- iconv (Instalado através do [DockerFile](docker/php/Dockerfile))
- intl **(default)**
- json (Instalado através do [DockerFile](docker/php/Dockerfile))
- libxml (Instalado através do [DockerFile](docker/php/Dockerfile))
- mbstring **(default)**
- openssl **(default)**
- pcre (Instalado através do [DockerFile](docker/php/Dockerfile))
- pdo_mysql **(default)**
- simplexml (Instalado através do [DockerFile](docker/php/Dockerfile))
- soap **(default)**
- sockets **(default)**
- sodium **(default)**
- tokenizer (Instalado através do [DockerFile](docker/php/Dockerfile))
- xmlwriter (Instalado através do [DockerFile](docker/php/Dockerfile))
- xsl **(default)**
- zip **(default)**
- zlib (Instalado através do [DockerFile](docker/php/Dockerfile))
- lib-libxml **(default)**

# Instalação Magento

### Passo 1:
Acesse o site https://marketplace.magento.com/customer/accessKeys/ crie sua conta e gere sua chave de acesso seguindo 
os seguintes passos https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/prerequisites/authentication-keys.html?lang=en .

### Passo 2:
Copie o arquivo `.magento_template` para `.magento`, dentro dele você irá inserir as chaves na seguinte ordem:

`username`: `**MagentoPublicKey**`,
`password`: `**MagentoPrivateKey**`

### Passo 3:
Copie o arquivo `.env_template` para `.env`. Este arquivo contém as variáveis padrões do ambiente de desenvolvimento.
Nele você pode adicionar outras variáveis que precise utilizar dentro do container caso instale ou customize a aplicação
ou os serviços.


