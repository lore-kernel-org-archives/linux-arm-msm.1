Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894802;
	b=WA10dLPqa1ZLIyB60ebgR58JSPSbpSFA/DgvWXkL40IZKJRs1QZp/cAIww4JFABi8d87
	 Uj5zsG4eb7hQchVOl3NM0vR0PXYeKiaR7cJu4lpPWJQyfxEULTiZ7nQttEuC3V/yZvpUo
	 /AC0jLQGxr9OY9gSHmxXmSuDFCFQnaEwS2oEwpGymXQUbKBWDhvTDiDcKhgooiLVKwO4X
	 TGHBDTPHQ0t4di6qUWFQafcwpVnO9ozCVnaQkwfKmd1AdolZGJO9yblmiN5hCrKdoL5rL
	 t4paMQpROvanA+eqd+N+s6b5x28BCydUhvkiUSXb0l34Mn89wVZGVMHX/MAfTBgg1Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Oc104d8dubVkVVOeovNlpZRvCxc8r/7mBsga0gOA0Zc=;
	b=XygkG2LzI2Mt7gLHozcs9Pn+Yx5zNZGCjRTEZvUj7ufa3Q2zsDzMzt7k5GfRDVH+/syf
	 at/8Yx49tVlIrdAOLUR1yULd1UUDpGTIWPzrldOMbIk9vN+nXo0lcKvNixWYSzTtnD7ui
	 EC9p4RNrsR87mFuk12kVLpqAqgKvvtrwBT2aYE5dd2OX9oQnY5hNssQ9xpQxH+/2J8vfb
	 oaZ4kU9YT2uOLO+K8KyBAop/Ud7w6qL44AajICzAagbIA35YId9sFBRg81p5rX6hAE7mB
	 XxT4FjIT3qfUJ2Jc66vca7kbjqs7l5O9g+SV0zOZz7jLs63msgwUufPQuz/4JXIYGDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="bZN/dLgT";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AC2606BEA7
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AC2606BEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bZN/dLgT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so24039875e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793894801; x=1794499601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc104d8dubVkVVOeovNlpZRvCxc8r/7mBsga0gOA0Zc=;
        b=bZN/dLgTnwp3fVVxvRKU30Fx8i1rNQrjZjCQICPIYUDtFBMcNfXrz13yJLAP/Lag7D
         sM0fRylYUGUx9byUV6VmGokaPZhUs1RL/o8x9cHERoSkp8m9dTLG9eFqZ3F8ua3kIZyA
         TqnkIpYWzGYjtTVpFhrd+2emTG9VOHrEHirJ0Yho04oZsBkZ/DTQCOn7Lszf9NUQwu6H
         K/FxM9ySoLX8UhIFXx0oegPlstft3EhkIbYx82ggNtGeybiohK0FmIIhOtDrx4ugzrvw
         g1854rsGGOmmgAbre2IlSyJOs4ShUKOOsyUcBB5YaTwIv1sShYNju1wnbnu+h6QcV0rf
         56XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894801; x=1794499601;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc104d8dubVkVVOeovNlpZRvCxc8r/7mBsga0gOA0Zc=;
        b=shqVO5DNTxZ2+NjhVxAYZb4Ec42YgLhB/WJoF+ivFTRK9LxzLFfxhNZFzkOvBmXUe3
         ODXeq+Qev2QwaTILHjZsMd3G8a21yxiNVbm8BtcybrxbyRk8SyLpmIchSXb+Ma9ic0Lr
         Ie5d6egWs5LwN7ObSOiUGDWx9OdNybAB9I4o5KUFnY2lfkwiu1yrZdGYwYHhBeTer8Tf
         e6AitBmx5pbukWXPIqtif79KmvZ8dqbRq5+fscxe0UaWK96cCmn4B0ExQ+DE9e9ozIHs
         GsrV0/+J60yjCepFN1C1/LDE4fZqbTojEmy5PrsGJneKv8R2ueQJr7kFvgyIfUS5ugOc
         WTdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOJUZk076wuVBQCGmRSMT5HXyOcwAKRavly3JLJvxVItuwVYdFyd0SBurkHrhvvhfM4MG9JTKv8oy4PeEw@vger.kernel.org
X-Gm-Message-State: APuU4Z+OYYlNa4wvxtUW0lkjPrzt1jA9yDBd/WIfqkWwAwnxS7v73OGw
	OqPfTgZ639vGfEYQsI56bZpjumYjr4WeP0ekJ92V2Zjphdn3SSIUsjFieNQJYGknBvEUx4GUCET
	/Oqcl
X-Gm-Gg: AYBFou1Q2An/jzpTwsgKwe41KkY2Nl74PEtITrdvm7dhL+MobsKyhP566SFFvwcE2hp
	uNIyn66yos/ghCd1E51VUhgbmJZhhxNSZ3vIyE1iXGybZycCc1phKI6U9c+PYf9CAA2pbRhF11k
	VU80LjzG6K2To1jbhEI2Z2kGY/SUCoTwobsH5nGZcWRIEEJYH5Cjp4zKnY+03uojFeS7BPKXVLZ
	R7JAChJcAUzt7tLndjxktNb9y6kLY1aXx7rJRF1lWF+GnC1CIVo1NRekW1nW8uv56W60dXPu2jT
	6nz/iAk0vTBB/wVbUPd3F7PVxpHGDJ0D6ZhRTB1WCym8gzZQGum0Y+HeFhaux/3FTTmiZtC1O/D
	GzdM4booEKy/0P8A5nQgSl4NBYD6ep0FNv5bjuX6Pm8bPxBvMLgKxbJphmVF0imm2G5K54S9IEd
	R/zSwaOKWi6G/ZqHzKZoK7XibCr/gH9a189UJlaOO4U/NgGMTebnuzP1D/ErXXaenuUDU04KO76
	2TwD+xr/2jmfpqInSxXeAsU3orhsgZG/BgJVWfQocgBX5xPXybOVB2fPE41YID2KM5JAupUwuKP
	KyxlUhgWi5UaLwbTT82mLyneKLsGZrrDarG9nKhc
X-Received: by 2002:a05:600c:c088:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4acda922e24mr314506055e9.1.1793894800616;
        Thu, 05 Nov 2026 08:06:40 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f0237aesm77536955e9.9.2026.11.05.08.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:06:39 -0800 (PST)
Message-ID: <770ddb46-2f4a-4eab-9ce0-fa537860c310@linaro.org>
Date: Thu, 5 Nov 2026 16:06:38 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use contiguous DMA buffers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Todor Tomov
 <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allan Siriani <allan@fatecpompeia.edu.br>
References: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2026 15:08, Loic Poulain wrote:
> The VFE write masters are programmed with a single base address per
> plane and then write the whole plane from there. video_buf_init() took
> that address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole plane is mapped
> as one contiguous range in the device address space.
> 
> Neither the driver nor the hardware can handle a plane split across
> several DMA segments, so scatter-gather buffers were never really
> supported here. The issue stayed dormant because vb2_dma_sg gives no
> IOVA contiguity guarantee but still tries hard to keep the number of
> segments low, and with an IOMMU dma_map_sgtable() usually maps the
> whole table into a single IOVA range. The mapping therefore almost
> always came back contiguous in the device address space, so reading
> only the first entry happened to work.
> 
> Where that does not hold, the write master runs past the first segment
> and writes the rest of the frame into memory belonging to someone else.
> 
> This recently surfaced as patch proposals enforcing contiguity in
> camss itself, walking the scatterlist to verify that the DMA segments
> follow each other, which amounts to re-implementing what the dma-contig
> framework already provides.
> 
> Use vb2_dma_contig instead. It guarantees that each plane is mapped as
> a single contiguous range in the device address space, one IOVA range
> when an IOMMU is present, physically contiguous memory when there is
> none.
> 
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
> Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
> Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompeia.edu.br/
> ---

I'll fix this

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Kconfig       |  2 +-
>   drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
>   2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c5175294eeb40fe1c1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
>   	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>   	select MEDIA_CONTROLLER
>   	select VIDEO_V4L2_SUBDEV_API
> -	select VIDEOBUF2_DMA_SG
> +	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_FWNODE
>   	select GENERIC_PHY
>   	imply PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -13,7 +13,7 @@
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mc.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>   
>   #include "camss-video.h"
>   #include "camss.h"
> @@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>   						   vb);
>   	const struct v4l2_pix_format_mplane *format =
>   						&video->active_fmt.fmt.pix_mp;
> -	struct sg_table *sgt;
>   	unsigned int i;
>   
> -	for (i = 0; i < format->num_planes; i++) {
> -		sgt = vb2_dma_sg_plane_desc(vb, i);
> -		if (!sgt)
> -			return -EFAULT;
> -
> -		buffer->addr[i] = sg_dma_address(sgt->sgl);
> -	}

I hadn't even realised this existed, ick.

> +	for (i = 0; i < format->num_planes; i++)
> +		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
>   
>   	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
>   			format->pixelformat == V4L2_PIX_FMT_NV21 ||
> @@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   
>   	q = &video->vb2_q;
>   	q->drv_priv = video;
> -	q->mem_ops = &vb2_dma_sg_memops;
> +	q->mem_ops = &vb2_dma_contig_memops;
>   	q->ops = &msm_video_vb2_q_ops;
>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
> 
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261105-camss-fix-dma-c32288664dd2
> 
> Best regards,

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
