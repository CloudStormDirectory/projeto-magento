# Performance Test Procedures

### Gerando dados 

https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/generate-data.html?lang=en
```
bin/magento setup:perf:generate-fixtures /app/www/magento2/setup/performance-toolkit/profiles/ce/small.xml
```

Na sequência é necessário rodar os indexers
```
bin/magento indexer:reindex
```

Você também pode rodar através do script `/app/docker/nginx/magento/generate-products.sh`. Este script gera os produtos 
e indexa novamente todo o conteúdo.

Para rodar os testes de performance adequadamente é necessário colocar a loja em modo de produção.
```
rm -rf /app/www/magento2/generated/metadata/* /app/www/magento2/generated/code/*
bin/magento deploy:mode:set production
```

Para reverter para modo developer execute as seguintes linhas:
```
rm -rf /app/www/magento2/generated/metadata/* /app/www/magento2/generated/code/*
bin/magento deploy:mode:set developer
```

Ou para o modo default:
```
rm -rf /app/www/magento2/generated/metadata/* /app/www/magento2/generated/code/*
bin/magento deploy:mode:set default
```

### JMeter
Baixe e instale o Java Runtime https://www.java.com/en/download/

Baixe o JMeter https://jmeter.apache.org/index.html

