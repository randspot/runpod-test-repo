README.md file

Iny approach
- Skusime nahodit zakladny pod s nejakym zakladnym image-om (nastavenim)
  - NIE: image: Pytorch 2.8 runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404
  - image: Official ComfyUI runpod/comfyui:latest
  - Pods:
    - NEFUNGUJE: GPU 5090 (32GB VRAM, 92GB RAM, 12vCPU) - (cena 0.89$/hr, 640$/mth) !!!! ALE MOZNO JE POTREBNE SKUSIT S Official ComfyUI image runpod/comfyui:latest-5090
    - GPU L40S (48 GB VRAM, 62GB RAM, 16 vCPU) - (cena 0.98$/hr, 705$/mth) - FUNGUJE !!!!!
    - SLOW NET: GPU RTX PRO 6000 (96GB VRAM, 188GB RAM, 16 vCPU) - (cena 1.87$/hr 1350$/mth, standby -0.33$/day 10$/mth)
- Potom tam nainstalujeme vsetko co je potrebne pre comfyUI a vsetko ostatne a prepiseme to do Dockerfile.

- Vysledok je v ./ComfyUI/output/

## Manual installation:
wget --directory-prefix=./ComfyUI/models/diffusion_models/ https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_t2v_14B_fp16.safetensors

wget --directory-prefix=./ComfyUI/models/loras/ https://huggingface.co/htdong/Wan-Alpha_ComfyUI/resolve/main/epoch-13-1500_changed.safetensors

wget --directory-prefix=./ComfyUI/models/loras/ https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank64_bf16.safetensors

wget --directory-prefix=./ComfyUI/models/text_encoders/ https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors

wget --directory-prefix=./ComfyUI/models/vae/ https://huggingface.co/htdong/Wan-Alpha_ComfyUI/resolve/main/wan_alpha_2.1_vae_alpha_channel.safetensors.safetensors

wget --directory-prefix=./ComfyUI/models/vae/ https://huggingface.co/htdong/Wan-Alpha_ComfyUI/resolve/main/wan_alpha_2.1_vae_rgb_channel.safetensors.safetensors

scp -P 50323 -i ~/.ssh/id_ed25519 RGBA_save_tools.py root@160.250.71.214:/workspace/runpod-slim/ComfyUI/custom_nodes/RGBA_save_tools.py


TOTO NIE:
- create disk
- setup ComfyUI + WAN transparency
- try out serverless ?

## Steps
- Create disk
- Create Pod to set up env - dowmload models to the disk, etc.

## Create disk
- runpod.io -> Storage->New Netwrok Volue-> Select country + volue size

## Create Pod
- runpod.io -> Pods -> Select GPU (RTX 5090)
- Change template to ComfyUI (official)
- check SSH terminal access & Start Jupyter notebook
- set the pod name
- Deploy On-Demand
