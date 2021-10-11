# test-A
CUDA_VISIBLE_DEVICES=$1 python ./run_translation.py --model_name_or_path $2 \
--train_file data/un-escaped/standard/train.json \
--validation_file data/un-escaped/standard/val.json \
--test_file data/un-escaped/standard/test-a.json \
--preprocessing_num_workers 8 --max_source_length 768 --max_target_length 768 \
--val_max_target_length 768 --source_prefix correct --output_dir prediction-$2-test-a \
--do_predict --predict_with_generate True \
--source_lang opl --target_lang pl --per_device_train_batch_size 1 --per_device_eval_batch_size 10 \
--overwrite_output_dir --num_train_epochs 20 --save_strategy epoch
# output file has different name...
mv prediction-$2-test-a/generated_predictions.txt prediction-$2-test-a/out.tsv
# ...and no new-line at the end
echo '' >> prediction-$2-test-a/out.tsv

# test-B
CUDA_VISIBLE_DEVICES=$1 python ./run_translation.py --model_name_or_path $2 \
--train_file data/un-escaped/standard/train.json \
--validation_file data/un-escaped/standard/val.json \
--test_file data/un-escaped/standard/test-b.json \
--preprocessing_num_workers 8 --max_source_length 768 --max_target_length 768 \
--val_max_target_length 768 --source_prefix correct --output_dir prediction-$2-test-b \
--do_predict --predict_with_generate True \
--source_lang opl --target_lang pl --per_device_train_batch_size 1 --per_device_eval_batch_size 10 \
--overwrite_output_dir --num_train_epochs 20 --save_strategy epoch
mv prediction-$2-test-b/generated_predictions.txt prediction-$2-test-b/out.tsv
echo '' >> prediction-$2-test-b/out.tsv

# validation
CUDA_VISIBLE_DEVICES=$1 python ./run_translation.py --model_name_or_path $2 \
--train_file data/un-escaped/standard/train.json \
--validation_file data/un-escaped/standard/val.json \
--test_file data/un-escaped/standard/val.json \
--preprocessing_num_workers 8 --max_source_length 768 --max_target_length 768 \
--val_max_target_length 768 --source_prefix correct --output_dir prediction-$2-dev-0 \
--do_predict --predict_with_generate True \
--source_lang opl --target_lang pl --per_device_train_batch_size 1 --per_device_eval_batch_size 10 \
--overwrite_output_dir --num_train_epochs 20 --save_strategy epoch
mv prediction-$2-dev-0/generated_predictions.txt prediction-$2-dev-0/out.tsv
echo '' >> prediction-$2-dev-0/out.tsv

