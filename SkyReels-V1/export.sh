#!/bin/bash

########################################
# 导出dev之后的docker镜像
########################################

source env.sh

# 判断容器是否存在
if docker ps -a --format '{{.Names}}' | grep -q "^${DOCKER_NAME}-model$"; then
    echo "✅ 容器 ${DOCKER_NAME}-model 已存在，跳过 dev.sh 启动。"
else
    echo "⚙️ 容器 ${DOCKER_NAME}-model 不存在，执行 dev.sh 启动..."
    ./dev.sh
fi


docker commit ${DOCKER_NAME}-model ${DOCKER_NAME}-model:latest
docker save -o ./${DOCKER_NAME}-model.tar ${DOCKER_NAME}-model:latest
echo "✅ 导出成功"

docker rmi ${DOCKER_NAME}-model:latest    



# docker load -i skyreels-v1-model.tar


# python video_generate.py \
#     --model_id ${SkyReelsModel} \
#     --task_type t2v \
#     --guidance_scale 6.0 \
#     --height 544 \
#     --width 960 \
#     --num_frames 97 \
#     --prompt "FPS-24, A cat wearing sunglasses and working as a lifeguard at a pool" \
#     --embedded_guidance_scale 1.0 \
#     --quant \
#     --offload \
#     --high_cpu_memory \
#     --parameters_level