# Companion code and data for PolEval 2021 task 3 solution


## Data

Please find converted dataset in `data` subdirectory.

* `data/escaped` contains a MT oriented dataset with escaped control sequences;
* `data/un-escaped/standard` contains a dataset with texts grouped by manually created buckets;
* `data/un-escaped/no-buckets` contains a purely converted dataset with no buckets at all;
* `data/un-escaped/bucket-per-year` contains a dataset with texts grouped by year published;
* `data/un-escaped/clustered` contains a dataset with bucket assignment based on k-means clustering algorithm over the n-gram character language model (this turned out to be the best method).

## Fine-tuning

I used HuggineFace Transformers library to fine-tune Machine Translation models. The script to run fine-tuning could be found here:

https://github.com/huggingface/transformers/raw/c76de1053e76010340a3cf152e51d4d9f5a1f755/examples/pytorch/translation/run_translation.py


