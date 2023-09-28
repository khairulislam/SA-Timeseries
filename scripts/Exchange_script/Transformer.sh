python -u run.py \
  --train \
  --use_gpu \
  --root_path ./dataset/exchange_rate/ \
  --data_path exchange_rate.csv \
  --model Transformer \
  --features MS \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --enc_in 8 \
  --dec_in 8 \
  --c_out 8