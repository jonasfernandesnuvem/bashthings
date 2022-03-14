#!/bin/bash

#A finalidade deste script é reiniciar automaticamente todos os ECS task definitions

# Author: Jonas Fernandes <jonas.fernandes@youse.com.br>



#prod
#list prod cluster ecs services
#
#list tasks in ecs services
# aws ecs list-tasks --cluster production --family $SERVICE | cut -f3 -d"/"

for $SERVICE in $(aws ecs list-services --cluster production | cut -f3 -d"/" | grep prod | grep sneakers | tr -d '",'); do
    echo "iniciando stop das tasks do servico $SERVICE" 
    for $TASK in $(aws ecs list-tasks --cluster production --family billingcloud-production-sneakers | cut -f3 -d"/" | grep -v "{" | grep -v "taskAr" | grep -v "]"  | grep -v "}" | tr -d '",'); do
        aws ecs stop-task --task $TASK --cluster production
    done
    echo "finalizado stop das tasks do servico $SERVICE"
done



#aws ecs stop-task --task  --cluster production


# aws ecs list-tasks --cluster stage --family media-stage-puma | grep stage | cut -f3 -d"/"


# para prod
# aws ecs list-services --cluster production | cut -f3 -d"/" | grep prod | grep sneakers | tr -d '",'
# esse comando ja resolve


#stage
#aws ecs list-services --cluster stage |  grep stage | cut -f3 -d"/"

# aws ecs stop-task --task e3f4b44d8ef94ac8bce29bb9491fdbed --cluster stage
# aws ecs list-tasks --cluster stage --family media-stage-puma | grep stage | cut -f3 -d"/"
