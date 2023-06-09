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


### Two Factor Authentication on Dev Mode
```
bin/magento module:disable Magento_AdminAdobeImsTwoFactorAuth --clear-static-content
bin/magento module:disable Magento_TwoFactorAuth --clear-static-content
bin/magento setup:di:compile
bin/magento cache:flush
```


```shell
bin/magento config:set system/smtp/host mail.docker
bin/magento config:set system/smtp/port 25 
```

cd /app/www/magento2
export PATH=$PATH:/app/www/magento2/bin
bin/magento setup:perf:generate-fixtures /app/www/magento2/setup/performance-toolkit/profiles/ce/small.xml


## Backups e Restore
https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/configuration-management/export-configuration.html?lang=pt-BR
```
bin/magento app:config:dump scopes themes system
```

https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/configuration-management/import-configuration.html?lang=pt-BR
```
bin/magento app:config:import 
```

https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/tutorials/backup.html?lang=en
```
bin/magento setup:backup --code --db --media
```

## Extension install
https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/tutorials/extensions.html?lang=en

## Caching
https://devdocs.magento.com/guides/v2.3/extension-dev-guide/cache/page-caching/public-content.html
https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/varnish/config-varnish-install.html?lang=en


### Servidor de email Fake
http://localhost:8025















