
# ln -s ../models/SkyReels-V1 ./ # 不能用软链接，不然docker COPY的话，路径会找到源文件路径

cp -rf ../models/SkyReels-V1 ./
