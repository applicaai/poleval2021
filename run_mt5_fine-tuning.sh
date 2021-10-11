CUDA_VISIBLE_DEVICES=$1 python ./run_translation.py --model_name_or_path google/mt5-large \
--train_file data/un-escaped/standard/train.json \
--validation_file data/un-escaped/standard/val.json \
--test_file data/un-escaped/standard/test-a.json \
--preprocessing_num_workers 8 --max_source_length 768 --max_target_length 768 \
--val_max_target_length 768 --source_prefix correct --output_dir $2 \
--do_train \
--source_lang opl --target_lang pl --per_device_train_batch_size 1 --per_device_eval_batch_size 1 \
--overwrite_output_dir --num_train_epochs 20 --save_strategy epoch
