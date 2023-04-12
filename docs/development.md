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

### Método Git:
```shell
git clone https://github.com/magento/magento2.git /app/www/magento

cd /app/www/magento

bin/magento setup:install \
--base-url=http://localhost/magento2ee \
--db-host=localhost \
--db-name=magento \
--db-user=magento \
--db-password=magento \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--search-engine=opensearch \
--opensearch-host=os-host.example.com \
--opensearch-port=9200 \
--opensearch-index-prefix=magento2 \
--opensearch-timeout=15

```

**Cons**: Utilizar 1GB de espaço em disco.

### Método Composer
```shell
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition /app/www/magento2

cd /app/www/magento2

bin/magento setup:install \
--base-url=http://localhost/magento2ee \
--db-host=localhost \
--db-name=magento \
--db-user=magento \
--db-password=magento \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--search-engine=opensearch \
--opensearch-host=os-host.example.com \
--opensearch-port=9200 \
--opensearch-index-prefix=magento2 \
--opensearch-timeout=15

```

**Cons**: Necessita de chaves de acesso geradas no adobe commerce market (https://marketplace.magento.com/customer/accessKeys/).
