CUDA_VISIBLE_DEVICES=4,5,6,7 vllm serve Qwen/QwQ-32B \
  --dtype auto \
  --api-key "EMPTY" \
  --enforce-eager \
  --no-enable-prefix-caching \
  -tp 4 > output/server_summarization_model.log 2>&1 &