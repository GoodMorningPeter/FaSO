PORT=$(($RANDOM % 1000 + 10000))

dataset=cifar100
imb=0.01
lr=0.1
batch_size=256
N_GPU=1
epochs=200
data=/data
root_log=output
loss_type='BCL'
optimizer='SGD'
many_shot_thr=125
low_shot_thr=31

mark=dataset_${dataset}_imb${imb}_batch_size${batch_size}_N_GPU${N_GPU}_epochs${epochs}
output_dir=./${root_log}/${dataset}/${imb}/${optimizer}/${loss_type}/${mark}

echo "mark: ${mark}"
mkdir -p ${output_dir}
cp -r ./ProCo_cifar ${output_dir}

# run task
torchrun --rdzv_backend=c10d --rdzv_endpoint=localhost:${PORT} \
	--nnodes=1 --nproc_per_node="${N_GPU}" \
	ProCo_cifar/main_bcl.py \
	--workers 8 \
	--dataset ${dataset} \
	--imb_factor ${imb} \
	--lr ${lr} \
	-b ${batch_size} \
	--epochs ${epochs} \
	--data ${data} \
	--test ${test} \
	--output_dir "${output_dir}"\
	--many_shot_thr ${many_shot_thr} \
	--low_shot_thr ${low_shot_thr} 
