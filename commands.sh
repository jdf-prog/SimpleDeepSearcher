sailctl job create gaia -g 8 -r 1 -p high -f ~/sailctl_high_shm_config.yaml --debug 

export SERPER_API_KEY=""


CUDA_VISIBLE_DEVICES=0,1,2,3 python -u inference/inference.py \
    --dataset_name gaia \
    --cache_dir_base cache \
    --output_dir_base output \
    --model_path "Qwen/Qwen2.5-7B-Instruct" \
    --summarization_model_path Qwen/QwQ-32B \
    --summarization_model_url http://0.0.0.0:8000/v1 \
    --google_subscription_key $SERPER_API_KEY \
    --google_endpoint "https://google.serper.dev/search" > output/output.log  2>&1

CUDA_VISIBLE_DEVICES=0,1,2,3 python -u inference/inference.py \
    --dataset_name gaia \
    --cache_dir_base cache \
    --output_dir_base output/qwen3-8b \
    --model_path "Qwen/Qwen3-8B" \
    --summarization_model_path Qwen/QwQ-32B \
    --summarization_model_url http://0.0.0.0:8000/v1 \
    --google_subscription_key $SERPER_API_KEY \
    --google_endpoint "https://google.serper.dev/search" > output/output-qwen3-8b.log  2>&1



CUDA_VISIBLE_DEVICES=0,1,2,3 python -u inference/inference.py \
    --dataset_name gaia \
    --cache_dir_base cache \
    --output_dir_base output/qwen3-8b-vtrl \
    --model_path "VerlTool/deepsearch-qwen_qwen3-8b-grpo-n16-b128-t1.0-lr1e-6-512-64_global_step_40" \
    --summarization_model_path Qwen/QwQ-32B \
    --summarization_model_url http://0.0.0.0:8000/v1 \
    --google_subscription_key $SERPER_API_KEY \
    --google_endpoint "https://google.serper.dev/search" > output/output-qwen3-8b-vtrl.log  2>&1