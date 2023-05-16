
## 15/05/2023
- Implantação do Varnish e configuração da integração com o Magento.
- Criação do documento sobre o testes de performance `docs/performance.md`.
- Primeiros modelos do JMeter para os testes de stress do Magento.

## 26/04/2023
- Criado o `my.cnf` e adicionado ao DockerFile do container do MySQL para que seja possível popular o banco de dados usando
o utilitário do Magento.
- Corrigido o envio de email com a instalação do ssmtp e direcionando os emails para o container mail.docker que agora 
está rodando o MailHog através do endereço http://localhost:8025/.
- Mesmo com o email funcionando foram adicionadas ao `start.sh` as linhas para desabilitar o 2FA para que seja possível 
rodar os testes de carga e stress.
- Identificada a necessidade do uso do Varnish por ter intergração nativa com o Magento para revalidar caches de páginas 
inteiras.
- Feito o downgrade do ElasticSearch para a versão `7.17.9` para compatibilizar com o Magento e eliminar o erro de 
ativação de produtos.
- Adicionado o comando de ativação do cronjobs para o Magento no `start.sh`.
- Criados os scripts de automação do Magento na pasta `docker/nginx/magento/`.
  - Use o `enable-production.sh` para habilitar o modo de produção.
  - Use o `disable-production.sh` para desabilitar o modo de produção. **Não está 100% funcional**
  - Use o `generate-products.sh` para popular a base de dados com produtos fake para testes de stress.
- Adicionado o arquivo `magento-performance-testing-guidelines.pdf` para uso posterior.
- Adicionado o redirecionamento do domínio `magento.dvp` para `www.magento.dvp`.
- Renomeados os arquivos de configuração do NGinx seguindo o padrão de ordenação alfabética para o parser.
- Criado esse arquivo de log para acompanhar a evolução do projeto
- Conclusão sobre o email. Ele está funcionando, porém, ao usar o Sendmail, que é o padrão do PHP para sistemas Linux
O email sempre será convertido em texto deixando emails HTML quase ilegíveis, mas o suficiente para coletar o URL
de validação do 2FA. Mas é indispensável que ao entrar no sistema pela primeira vez vá até as configurações de email 
e adicione um servidor SMTP para que tudo funcione corretamente.


## 24/04/2023
- Despendida a tarde toda tentando receber o email do 2FA para conseguir entrar no Admin. O sistema exige 2FA por padrão
mas não disponibiliza um comando de linha para configurar o email por onde é enviado o QRCode para habilitar o 2FA na
conta. Para configurar o email é necessário acessar o Admin que por sua vez precisa de 2FA, etc, etc, etc.
- Identificado que é possível desabilitar o 2FA através de comandos do `bin/magento`.
- **Pedro Santos** indica a página do Magento que explica como popular o Banco de Dados com informações fake para testes de 
performance que com certeza iremos usar.
- Vitor Meneghini fez um pull request no repositório com a instalação dos módulos do PHP em uma única linha de comando
com um excelente benchmark de performance e redução de consumo de espaço em disco ao usar esse modelo. Pull Request 
aceito.


## 17/04/2023
- Trabalhamos na implantação das regras do NGinx e fizemos o Magento funcionar pela primeira vez no navegador.


## 10/04/2023
- Trabalhamos na montagem do ambiente Docker reaproveitando códigos e modelos de outros projetos usados na CloudStorm.
- Adicionamos os Módulos PHP uma a uma logados no container para validar o passo-a-passo da instalação e adicionamos
cada linha de instalação ao DockerFile para automatizar o processo.


## 04/04/2023
- Buscamos informações na documentação oficial do Magento para entender os requisitos do sistema e entender os 
fundamentos de funcionamento da plataforma.









