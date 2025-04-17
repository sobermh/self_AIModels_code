export PROJECT_NAME=SkyReels-A2

git submodule deinit -f models/$PROJECT_NAME && \
git rm -f models/$PROJECT_NAME && \
rm -rf .git/modules/models/$PROJECT_NAME



# python video_generate.py --model_id $SkyReelsModel --task_type t2v --guidance_scale 6.0 --height 544 --width 960 --num_frames 97 --prompt "FPS-24, A cat wearing sunglasses and working as a lifeguard at a pool" --embedded_guidance_scale 1.0 --quant --offload  --high_cpu_memory  --parameters_level