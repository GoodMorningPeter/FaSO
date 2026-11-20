PORT=$(($RANDOM % 1000 + 10000))

dataset=cifar100
imb=0.01  
lr0=0.1
lr1=0.2
batch_size=256
N_GPU=1
epochs=200     
data=/data 
root_log=mode
loss_type='ProCo'
opt_level=epoch_level
opt_strategy=sin_prob
many_shot_thr=125
low_shot_thr=31

mark=dataset_${dataset}_imb${imb}_batch_size${batch_size}_N_GPU${N_GPU}_epochs${epochs}
output_dir=./${root_log}/mode/${loss_type}/Muon/${dataset}/${imb}/${opt_level}/${opt_strategy}_${mark}

echo "mark: ${mark}"
mkdir -p ${output_dir}
cp -r ./ProCo_cifar ${output_dir}

# run task
torchrun --rdzv_backend=c10d --rdzv_endpoint=localhost:${PORT} \
	--nnodes=1 --nproc_per_node="${N_GPU}" \
	ProCo_cifar/main_faso.py \
	--workers 8 \
	--dataset ${dataset} \
	--imb_factor ${imb} \
	--lr0 ${lr0} \
	--lr1 ${lr1} \
	-b ${batch_size} \
	--epochs ${epochs} \
	--data ${data} \
	--test ${test} \
	--opt_strategy ${opt_strategy} \
	--opt_level ${opt_level}  \
	--output_dir ${output_dir} \
	--many_shot_thr ${many_shot_thr} \
	--low_shot_thr ${low_shot_thr} 
