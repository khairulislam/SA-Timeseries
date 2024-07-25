#/bin/bash

explainers=("feature_ablation" "occlusion" "augmented_occlusion" "feature_permutation" "integrated_gradients" "gradient_shap" "dyna_mask" "winIT" "wtsr" "tsr")
models=("DLinear" "MICN" "SegRNN" "iTransformer" "Crossformer")

for model in ${models[@]}
do 
echo "Running for model:$model"
python interpret.py \
  --task_name long_term_forecast \
  --explainers ${explainers[@]} \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model $model \
  --features S \
  --seq_len 96 \
  --label_len 12 \
  --pred_len 24 \
  --n_features 1 --itr_no 1 --result_path scratch --overwrite  --dry_run 

done