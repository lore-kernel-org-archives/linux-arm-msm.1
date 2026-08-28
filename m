Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A975C613
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890069; cv=pass; b=sLJpBRZKeh2bOP4ZET9pAUAe6QrEOS8bbURbtDMgjezc+ZXZyQrAB8SOm9/2Qx1kOBHsQZFkCRRb4NWT53LgxJiCW1p5+KJylTht5mP2QrgQqWpcBkf53neByySIyaAjH2HV1dGOx7UDz+JYYzs/jAMGj5LT04PFCU1Ym7mg9IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890069; c=relaxed/simple;
	bh=CF4snVwJpsmNrxuorreVZbKmdbnORxXd+hH/uBo1oNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/z3QiWsEMa7LH6S3XF+RLQNC/tKgQcuE00kfLgwZ3T2qc6xef6GpeDaEKMTFc6Lf0DqSlXRiWhKMUYZ0HP9oNPiUx2WJqmmvVnPBbGE1FsXHTHe0gQU4WtTlNkEvP84SOsRbODIiM5G2SDZJwE5HI5cSpB6M9UJ4Y/udCOdTDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/0nWDv/; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/0nWDv/"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1bebd5e5fso63062a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 21:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890067; cv=none;
        d=google.com; s=arc-20260327;
        b=ij5g9t49y5JrPOlotjx1JF1QGCBHnGQGyacwpAimkPggPEeNAiba7lwhGW/peWTjKV
         D3UlO2hgzIBjK4cnss5IOsNR+fz4htjhyzS5/5bDXDHGCGSvFWpL9//3OPu1hFb2jG+x
         xf9dsydOchDxJV6j0njlpzTUeWveJUZw0bzk0KCnpNivEvem0oXu85cGUDbsh6XRXHQt
         Tm0gnIRGhyAi+OXdzIhhfli/ZY/azEsk2OjOq6tYoIC0YslWAlOLLB/+rHW++Eh6S5nS
         jGsabhKAVi3WPJwdKgwEuP9UfLtivAuvq1hsrwup1+/XKpz5CE4+XMGy7yvC/ppgKTBx
         EeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjyZxus3uT9pxC3JoEDD54aUS4Cv4NEWFZ73hqH+6Aw=;
        fh=qgzYwJQu0XCbUPJA0KNTPiQmlNTjLc4wAbXIXxM3sN4=;
        b=s0iVZCMoDjJFMrgrpVtxVj5l8yJuqzJTRVUSvLFR+fQfqosIWhtgAv7+HOhZn9Iwg2
         ke6eI84nAm6+YtHYjtbNix5orVjDg3o0xTjppff9faGICWXt7WcyL7a2tZxz1yxUNSU7
         97kjXW39xq8Wg6dxIwRSgeiRBN3xVZ2vKd8q151AHnXSdVOPwnOF8n+oeJNZt3W5lJSY
         GffrQwH4n/R0o7XLz78rvEoMVt6aM1U1GOGvplWLAOfhRoP9e9gfECWDdD2wI08wDxxj
         ITTkYvVknG+aWz6qdCu/p5gpQZsPeUVHwqsXfHcjFcijnfYyMcnp7D94PuSDcQSRAIej
         gT3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890067; x=1788494867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjyZxus3uT9pxC3JoEDD54aUS4Cv4NEWFZ73hqH+6Aw=;
        b=F/0nWDv/7rFHbrVjPcT4ZnB4X5iup/fnyu0Qa6YPp2dgF0lP8NsXpEmT/5Yo03xVF6
         wzxW8BYTPqeIKOVdYxgKXxNm5QjQCPso+bHZiGu+s0FI8TaVBOO9pGL2V+Cy4WHKkfF3
         Rwl5n8+T1pAVbLHMyYEbhKUuR3eRi+0kfP4S17k03UukxPwsi+60Us/J5a/toASUORRN
         FL76kImhKDknV1ZUiFhYR3EZsWYtyt9H3UrDEwwQW2Y86iqKxzTffu5+hLbwgxwMR0Cn
         N/6VAJqS2bpo1LX8m+HBrzdkaU8NHrCyTEX5tIZiEoEJpv+PRSOXzWCLicj80Hhx1uJX
         s+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890067; x=1788494867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjyZxus3uT9pxC3JoEDD54aUS4Cv4NEWFZ73hqH+6Aw=;
        b=AnHPGiimE/A91+pfp8LWkAaTeGuU5Tze/jL031L7qjKSae+N8iYBlalcK0IjW8XTkO
         /c8WLNfWCs77HvKi2S4GNv/yEkcjyTe70iA48qoUhjmxLWnAUPuczj/8JhfO3QiOkzz+
         EArTQLdH4GqW1Eufsth7PYH1+/JeT+PUMJfQZoPyNCBx3W1LkcoCpVLUPo9MZvuPRXfL
         m5xXa6JUmc0s7khtPdKyCvplWuy9ETIEwoU7APEIFsUENlehTgz6EcPJAwPb26Oihkh1
         iGXZ/6/5OvWXV2l5sdjluATf49/7WZjTRVocBEwNNrC7SBGsotg8AA4Pp4a8/qa7KP3C
         rivA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2BC5DWTjGK40SCBkYv/WTysXJYeYQGsBv28qj5PPaxLJd0fDgzQkvbDnx+vDbdYBupDSqc4YKx+k3U7LA@vger.kernel.org
X-Gm-Message-State: AFuF++kqPs5kPXAKzxIP0ue1A6ZkEowdLcfsDjgGTGjSwraBrpgCL8mD
	3ifPhAsFAHM6T+ihtBLN+RyNFoKuz7MM9xaEqe0BCTNkGHZvMEdEPoXHSkp5AN4AWwLhkT8/OUk
	cQtVYwc1AqJXX+08dgJcr7JEWWvNDY6I=
X-Gm-Gg: AR+sD12EHrzQffBrBykQv121whFDVaUhHUBM+M8cyLrk/B50xCOs97n2yI82n66lYJr
	Q2EE8QE0OX4n+YCAiEy7btCmvgiaBIzJV4NEb8Nt5J3/tjl6aBUt93DPwEYXfnPXeFPZFLeEg1z
	wzBwF3JWTvQDI2Q1vOlT+146EEqFDN3JOJ1PxG0drQb3jfxNHoU6UJ+5nF3dY7SnjzNzuZSUgT/
	IhL20MaeSiMGYfIXx3Yhg44cBQKBLlJNBGyiUR5iZCShYYDOGZ4xupI5r5+TpU8j44Ws/KEoNqy
	HYZSvWbxqSn+K92nF38Q4IbTbM32wrS+aIbs9iP3DzMqh77SA/7/Fzr5IiPkIOwwNTOc6zLGddB
	tSbi2nNYHixI=
X-Received: by 2002:a05:6a20:2444:b0:3c3:94bb:ceb8 with SMTP id
 adf61e73a8af0-3d267429a52mr3685786637.1.1787890066689; Thu, 27 Aug 2026
 21:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
In-Reply-To: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 28 Aug 2026 00:07:35 -0400
X-Gm-Features: AcwNN1XwharkwlC7cSncUV7uNpjfVtyCFXp0PJJugzLcPCDR30LNsSXNbwLuIPg
Message-ID: <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> zero whenever the GPU is powered up again and the timestamp reported to
> userspace jumps backwards. On an a702 six reads three seconds apart all
> land in the 500..1200 tick range, stepping backwards twice, and on an
> a530 the OpenCL device timer conformance test fails because
> clGetDeviceAndHostTimer() returns an end time below the start time.
>
> Save the counter in the suspend path of the affected generations, while
> the GPU is still powered, and add the accumulated ticks to the value
> reported to userspace.

This is useless because the entire point of clGetDeviceAndHostTimer()
(and the similar thing in Vulkan) is to match what the GPU itself
returns, and now you've broken that by adding an offset.

Connor

>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zer=
o
> whenever the GPU is powered up again and the timestamp userspace reads
> jumps backwards.  Accumulate what the counter reached before each suspend
> and add it to what is reported afterwards.
>
> Measured on an a530 and an a702; the GMU parts keep their own counter ali=
ve
> and are left alone.
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 ++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  5 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a4xx_gpu.c
> index 6392126f48f2..7d9dd9460f5b 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -593,6 +593,8 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         int ret;
>
> +       adreno_save_timestamp(gpu);
> +
>         ret =3D msm_gpu_pm_suspend(gpu);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index f1df2514c613..c5552f1085e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1423,6 +1423,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x000000=
00);
>         }
>
> +       adreno_save_timestamp(gpu);
> +
>         ret =3D msm_gpu_pm_suspend(gpu);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index f9de9329dee3..106cc2ac55ff 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2252,6 +2252,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>
>         trace_msm_gpu_suspend(0);
>
> +       /* only the GMU-less parts come here, and their counter is in the=
 GPU */
> +       adreno_save_timestamp(gpu);
> +
>         a6xx_llc_deactivate(a6xx_gpu);
>
>         msm_devfreq_suspend(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 3370cd44382f..f83960b31901 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -226,6 +226,13 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
>         return vm;
>  }
>
> +void adreno_save_timestamp(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +
> +       adreno_gpu->timestamp_offset +=3D adreno_gpu->funcs->get_timestam=
p(gpu);
> +}
> +
>  u64 adreno_private_vm_size(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -398,7 +405,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
context *ctx,
>         case MSM_PARAM_TIMESTAMP:
>                 if (adreno_gpu->funcs->get_timestamp) {
>                         pm_runtime_get_sync(&gpu->pdev->dev);
> -                       *value =3D adreno_gpu->funcs->get_timestamp(gpu);
> +                       *value =3D adreno_gpu->timestamp_offset +
> +                                adreno_gpu->funcs->get_timestamp(gpu);
>                         pm_runtime_put_autosuspend(&gpu->pdev->dev);
>
>                         return 0;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 114a40f79ef3..db080a6d515c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -207,6 +207,8 @@ struct adreno_gpu {
>         uint16_t speedbin;
>         const struct adreno_gpu_funcs *funcs;
>
> +       u64 timestamp_offset;
> +
>         struct completion fault_coredump_done;
>
>         /* interesting register offsets to dump: */
> @@ -610,6 +612,7 @@ static inline int adreno_is_a840(struct adreno_gpu *g=
pu)
>  /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI *=
/
>  #define ADRENO_VM_START 0x100000000ULL
>  u64 adreno_private_vm_size(struct msm_gpu *gpu);
> +void adreno_save_timestamp(struct msm_gpu *gpu);
>  int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>                      uint32_t param, uint64_t *value, uint32_t *len);
>  int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
>
> ---
> base-commit: 140b13475302601368c0cf4e193e66126a49feb3
> change-id: 20260828-b4-adreno-timestamp-f4c846391b97
>
> Best regards,
> --
> With best wishes
> Dmitry
>
