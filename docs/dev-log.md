

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









