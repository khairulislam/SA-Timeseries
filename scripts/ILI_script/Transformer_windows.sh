python run.py --train --use_gpu --root_path ./dataset/illness/ --data_path national_illness.csv --model Transformer --features MS --seq_len 36 --label_len 12 --pred_len 24 --enc_in 7 --dec_in 7 --c_out 7 --task_name long_term_forecast