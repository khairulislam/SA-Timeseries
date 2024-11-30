#!/usr/bin/env bash
#SBATCH --job-name="mimic_interpret"
#SBATCH --output=results/outputs/CALF_mimic_iii_interpret.out
#SBATCH --partition=gpu
#SBATCH --time=24:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem-per-gpu=11G
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=mi3se@virginia.edu
#SBATCH --mem=32GB

source /etc/profile.d/modules.sh
source ~/.bashrc

module load cuda-toolkit cudnn-8.9.5_cuda12.x anaconda3

conda deactivate
conda activate ml

python interpret_CALF.py\
  --task_name long_term_forecast \
  --explainers feature_ablation occlusion augmented_occlusion feature_permutation integrated_gradients gradient_shap winIT gatemask wtsr\
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model CALF \
  --features S \
  --seq_len 96 \
  --label_len 12 \
  --pred_len 24 \
  --n_features 1 --d_model 768\
  --disable_progress

python interpret_CALF.py \
  --explainers feature_ablation occlusion augmented_occlusion feature_permutation winIT gatemask wtsr integrated_gradients gradient_shap\
  --task_name classification \
  --data mimic \
  --root_path ./dataset/mimic_iii/ \
  --data_path mimic_iii.pkl \
  --metrics auc accuracy cross_entropy \
  --model CALF --n_features 31 --seq_len 48\
  --d_model 768 --overwrite --disable_progress --batch_size 16