CUDA_VISIBLE_DEVICES=0 fairseq-train /data/yuanhang/wmt23/wmt23-jaen-fairseq \
--arch transformer_moe_ep4_top1_cf1_ecf1 --share-decoder-input-output-embed \
--optimizer adam --adam-betas '(0.9, 0.98)' \
--clip-norm 0.0 --lr 5e-4 --lr-scheduler inverse_sqrt \
--warmup-updates 512 --dropout 0.3 --weight-decay 0.0001 \
--criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
--max-tokens 16384 \
--update-freq 64 \
--max-source-positions 256 \
--max-target-positions 256 \
--max-epoch 20 \
--save-interval-updates 100 \
--keep-interval-updates 1 \
--no-epoch-checkpoints \
--amp \
--eval-bleu \
--eval-bleu-args '{"beam": 5, "max_len_a": 1.2, "max_len_b": 10}' \
--eval-bleu-detok moses \
--eval-bleu-remove-bpe \
--eval-bleu-print-samples \
--best-checkpoint-metric bleu \
--maximize-best-checkpoint-metric \
--find-unused-parameters \
--log-interval 1 \
--wandb-project translation \
--save-dir checkpoints/wmt23-jaen-base/ | tee logs/wmt23-jaen-base.log


