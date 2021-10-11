# Companion code and data for PolEval 2021 task 3 solution


## Data

Please find converted dataset in `data` subdirectory.

* `data/escaped` contains a MT oriented dataset with escaped control sequences;
* `data/un-escaped/standard` contains a dataset with texts grouped by manually created buckets;
* `data/un-escaped/no-buckets` contains a purely converted dataset with no buckets at all;
* `data/un-escaped/bucket-per-year` contains a dataset with texts grouped by year published;
* `data/un-escaped/clustered` contains a dataset with bucket assignment based on k-means clustering algorithm over the n-gram character language model (this turned out to be the best method).

In order to use these file for your purposes, please unpack them (for example):

```
cd data/un-escaped/standard
tar xjf data.tbz
```

## Fine-tuning

I used HuggineFace Transformers library to fine-tune Machine Translation models.
The script to run fine-tuning could be found here:

https://github.com/huggingface/transformers/raw/c76de1053e76010340a3cf152e51d4d9f5a1f755/examples/pytorch/translation/run_translation.py

This is the script required by example files and has to be downloaded manually.

The example files for fine-tuning process are:

* run_mt5_fine-tuning.sh - script to start fine tuning process
* run_mt5_prediction.sh - script to run predictions after fine-tuning

In order to run fine-tuning, you can just issue the following command:

`./run_mt5_fine-tuning.sh 0 un-escaped-standard-mt5`

where `0` stands for GPU device you want to use and `un-escaped-standard-mt5` is a target directory.

After fine-tuning, one can generate predictions in the same manner:

`./run_mt5_prediction.sh 0 un-escaped-standard-mt5`


