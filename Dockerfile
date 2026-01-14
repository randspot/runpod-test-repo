FROM runpod/comfyui:latest

WORKDIR /workspace/runpod-slim/

## download models
RUN wget --directory-prefix=./ComfyUI/models/diffusion_models/ \
  https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_t2v_14B_fp16.safetensors

RUN wget --directory-prefix=./ComfyUI/models/loras/ \
  https://huggingface.co/htdong/Wan-Alpha_ComfyUI/resolve/main/epoch-13-1500_changed.safetensors

RUN wget --directory-prefix=./ComfyUI/models/loras/ \
  https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank64_bf16.safetensors

RUN wget --directory-prefix=./ComfyUI/models/text_encoders/ \
  https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors

RUN wget --directory-prefix=./ComfyUI/models/vae/ \
  https://huggingface.co/htdong/Wan-Alpha_ComfyUI/resolve/main/wan_alpha_2.1_vae_alpha_channel.safetensors.safetensors

RUN wget --directory-prefix=./ComfyUI/models/vae/ \
  https://huggingface.co/htdong/Wan-Alpha_ComfyUI/resolve/main/wan_alpha_2.1_vae_rgb_channel.safetensors.safetensors

# Custon node
COPY RGBA_save_tools.py ./ComfyUI/custom_nodes/RGBA_save_tools.py

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY handler.py ./handler.py

CMD ["python", "-u", "./handler.py"]