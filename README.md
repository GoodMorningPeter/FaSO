# FaSO: Fast Sharpness-escaping Optimization for Long-tailed Learning

<p align="center">
    <a href="https://openreview.net/pdf?id=I19SJW09zn"><img src="https://img.shields.io/badge/OpenReview-TMLR'26-blue" alt="Paper"></a>
    <a href="https://github.com/GoodMorningPeter/FaSO"><img src="https://img.shields.io/badge/Github-FaSO-brightgreen?logo=github" alt="Github"></a>
</p>

Transactions on Machine Learning Research, 2026.

This is the official Pytorch implementation of FaSO.

## Environment Setup
### 1. Create and Activate Conda Environment
```bash
# Create environment (Python version can be adjusted as needed)
conda create -n faso python=3.9 -y

# Activate environment
conda activate faso
```

### 2. Install Dependencies (via YML File)
```bash
# The dependency file is environment.yml, run the following command
conda env update --file environment.yml --prune
```

## Quick Run
### 1. Prepare Datasets
Ensure the CIFAR-10/100 dataset is properly placed in the specified path or automatically downloaded to the default directory.

### 2. Run Experiments
```bash
# Grant execution permission (for first-time run)
chmod +x bash/*/*

# Run experiments

## run CIFAR-100 LT under IF=100 with BCL loss and SGD
bash bash/BCL/BCL_CIFAR.sh

## run CIFAR-100 LT under IF=100 with BCL loss and Muon
bash bash/BCL/BCL_CIFAR_muon.sh

## run CIFAR-100 LT under IF=100 with BCL loss and FaSO
bash bash/BCL/BCL_CIFAR_faso.sh

## run CIFAR-100 LT under IF=100 with ProCo loss and SGD
bash bash/ProCo/ProCo_CIFAR.sh

## run CIFAR-100 LT under IF=100 with ProCo loss and Muon
bash bash/ProCo/ProCo_CIFAR_muon.sh

## run CIFAR-100 LT under IF=100 with ProCo loss and FaSO
bash bash/ProCo/ProCo_CIFAR_faso.sh
```

### 3. Other Details
Experiment results (logs, model weights, etc.) will be saved to `./output` or `./mode`.


## License
Code released under the [Apache License 2.0](LICENSE).

## Citation
```
@article{luofast,
  title={Fast Sharpness-escaping Optimization for Long-tailed Learning},
  author={Luo, Jiaan and Tang, Ziyi and Hong, Feng and Hu, Qiang and Xiao, Shuai and Cao, Xiaofeng and Yao, Jiangchao and Tsang, Ivor and Ong, Yew-Soon},
  journal={Transactions on Machine Learning Research}
}
```
