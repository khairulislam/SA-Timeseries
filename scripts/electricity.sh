python run.py \
  --task_name long_term_forecast \
  --train \
  --result_path scratch \
  --use_gpu \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model DLinear \
  --features S \
  --seq_len 96 \
  --label_len 12 \
  --pred_len 24 \
  --n_features 1

python run.py \
  --task_name long_term_forecast \
  --train \
  --result_path scratch \
  --use_gpu \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model Autoformer \
  --features S \
  --seq_len 96 \
  --label_len 12 \
  --pred_len 24 \
  --n_features 1

python run.py \
  --task_name long_term_forecast \
  --train \
  --result_path scratch \
  --use_gpu \
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model MICN \
  --features S \
  --seq_len 96 \
  --label_len 12 \
  --pred_len 24 \
  --n_features 1 \
  --conv_kernel 18 12

# feature_ablation augmented_occlusion deep_lift gradient_shap integrated_gradients lime
python interpret.py \
  --task_name long_term_forecast \
  --explainer feature_ablation occlusion augmented_occlusion feature_permutation\
  --root_path ./dataset/electricity/ \
  --data_path electricity.csv \
  --model Autoformer \
  --features S \
  --seq_len 96 \
  --label_len 12 \
  --pred_len 24 \
  --n_features 1 \
  --use_gpu \
  --tsr