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




