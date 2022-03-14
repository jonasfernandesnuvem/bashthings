#!/bin/bash

#A finalidade deste script é reiniciar automaticamente todos os ECS task definitions

# Author: Jonas Fernandes <jonas.fernandes@youse.com.br>
#prod
#list prod cluster ecs services
#

#list all sneakers service

for $SERVICE in $(aws ecs list-services --cluster production | cut -f3 -d"/" | grep prod | grep sneakers | tr -d '",'); do
#list all tasks to service
    echo "iniciando stop das tasks do servico $SERVICE" 
    for $TASK in $(aws ecs list-tasks --cluster production --family billingcloud-production-sneakers | cut -f3 -d"/" | grep -v "{" | grep -v "taskAr" | grep -v "]"  | grep -v "}" | tr -d '",'); do
#stop task service    
        aws ecs stop-task --task $TASK --cluster production    
    done
    echo "finalizado stop das tasks do servico $SERVICE"
done

# fim das instrucoes