Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889750;
	b=GmiVA1AYbSENHw66HVvNEfaOmKvLKNMwXLRVYjz7iTzzinjrmYmc+2CFkXqb2SMLhPan
	 XoBLkOa8oC5Bg17yQ03GQ0qoygX5kVubfHl7m4+Vw97XLw8Bx9x21I8tyYyfsDFDa+CaO
	 jY0gnzkNI80DNjbbxB/xAlJRMcSGFpJ2K9He4U9VNl/hl0ZxYhqe356pxzpSQxBdJcvzk
	 fCBKwBhxNN55ZHfdNlcM2sMSn1jLTCR4i+QW9pWvxDhbjEJwMOeAg9r2TIs2HffkZjCxF
	 oCw4dIEon8PlZRY+7gsOoABwySwmeqGVmYrAMax3zybnIpMMc9Fj+L1ETd9Zg76KMew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=I8lzz7Uf7IU3ekgI1P2Xdbvnzj46SIiLqZ5SrqWy4/M=;
	b=WujaWfGPUIdWCrNA/g25IcGL8rSCIPED6PVzbZQgNRkdDTsbav5r0fcYKux0qWIUt8s2
	 qJVeaHfBVkdXHSaCSG8ct/rMbs4yNLzhzLKb+4HaMS4jZQXlT7jKiLQZZTbgELIXQZ/A3
	 qfQW8gGeNutYBob16DIgHgsxRAq2gfdGnd92xBiZYbvRS4L+E09APrZiH2A18iBmme470
	 SNK+8EJy976Sq8+JBmI8xw1XJ8mEnbGzqMyyv/qS5MPzz/ssOX4O7jgY4azS7Ar/DTCpt
	 BS0fbueaCbGyTFl5x6Sw5E0aBvtMvNO52c0I+suCE+j3lbCJG1fmeh7KQ3qbYC1xNsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CClrY1FE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02BB606A328
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 14:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02BB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CClrY1FE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so14017095e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793889748; x=1794494548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8lzz7Uf7IU3ekgI1P2Xdbvnzj46SIiLqZ5SrqWy4/M=;
        b=CClrY1FE4fnO15eAPVNi1dnk5JSXobqsUXGi2Brt7LVFsvKr9fjQJ+VdARCZL/OgOj
         d0JyINUVd57UZi+WFex1vdqra9+CllHB8BSajTXoOniGKooTZqI48DRJhm4XCy2opu3y
         lZquj5ldq+zkyo01oJckHippTpB1Jq0BwzZvRnTBV2+yaITh1euCD8Wy8e+ZKNm2AtRl
         L4QM2AAafeNXicgPC6fsA3F6GI4FrjvDlJrf6lLsFlNco4nCV+6AdvIH2L8ZJwuFhNUu
         htMyWVWN00tF+dhr9VVpfLCQ20mjwbpqtGuUedAJUY0cm4oZl9V2a9JuCizQlD9DqhGl
         SSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889748; x=1794494548;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8lzz7Uf7IU3ekgI1P2Xdbvnzj46SIiLqZ5SrqWy4/M=;
        b=uzyXgWdasi5wecXsGJO8050vMcAngq+LsKYnxFCmwEUwVTOnAToSD8uOZi7aUy05HU
         emyfZreeJFJgDpmp/tt8sVZnwcJNGkhWyLp/Q63TQc+m3IWQOp590t7Xls2MIPFi39np
         4+8z8eI8EdxJ42SZqKKT7B5+TIVBcr6qBeVJmzeMQ96m2ijS+eAdI4P6/0/NXxW9qy5b
         gxSJuUQM0MPku7Fgaz/pAgCLKkpPwXxJMJizIN95qdmpzvvXnEMskkH2nV7eT/aZGqxm
         3dU3w0j413+onHYVkwibgV+SVmumCpW8terht42jCVIEZL13z3vUvygSyL/gQvKFdYNP
         q4tg==
X-Forwarded-Encrypted: i=1; AKwUvByRWOMBlcrQxY16PJ2VdOAjIClnS48DCi7F8z2XkdbuWPam1tVSakxbd6lUuzOkfSssIuXmDQwMN/HXk9dt@vger.kernel.org
X-Gm-Message-State: APuU4Z90F9+bHX4UjTwXH7ayCV4IFsevkxVb0rW/Zk070YWFa7rOVIWm
	G0rrc+97P1hi7plqPcNY5u3XeBp8Cmo0HU1A0rjdRzXoCdxVv6i4C6tM0LAL5x5B8bE=
X-Gm-Gg: AYBFou2SNoEz5JjUxVOsrxM+NlV/mKR5shELzc8Jz+G1OqcezJK5DXAoGS8A5xymmAD
	NMf0M8lGlxLw/u7DBehV/se5lIWhVT8rvDuYmBz9fz6GHYOIHPKrVgu07DKN71areRNqQZjSumK
	C2Uj140L3CFJB17AZN4G3yR5AJdPCAXHILXnzzlKJ2M/lOTw/ThIJUE8w0sqC2DffMFI6uEPshG
	Z49XwCiR7CiKI4cZvJpJ9DkUrKg6Bx31d87lFcACKv9mj2xyhboJPYKrEc2Pwfy32MNlHDbz4WX
	hUwrFN8dh69lbQHhjtOa7bCLjQyzQ4DCQOcYXAqNzl9VddcLl3/ZI4yWuTVAYbYF+yYBIW6iTUx
	oS7ep9FNh6W8sd3fa30GnFW9g0SB82zxkWN6t+r6nzhXpJTCvMLAAWGFRCPWVHd60YJqRHhytTW
	KVlt5gpXLY6pkh7bmtuSKaVQwmeSmaFWQmJIZed43U+7ELTbCP+EoYfATCTZcv417chnqS35qKB
	JbFYme9zkUxhpOEOYloXjg/EKsjWwvvq8crjDoSNKXC/tDFampUvSg6FCyAm5oIjbd8tIvipqfb
	5tM/EmHCR+rwB6XomFJtMFF1H7tmmH+Xq2aywkI9LNqbe4EftlEmpGH6RJ/vtQ==
X-Received: by 2002:a05:600c:3b97:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4ac18e5dcbamr447013505e9.27.1793889747814;
        Thu, 05 Nov 2026 06:42:27 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm71985495e9.1.2026.11.05.06.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:42:21 -0800 (PST)
Message-ID: <9c6a1a7c-4179-4bd5-b646-e5af804cb382@linaro.org>
Date: Thu, 5 Nov 2026 14:42:19 +0000
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
Subject: Re: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there
 is no IOMMU
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-2-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:23, Allan Siriani wrote:
> The VFE write masters are programmed with a single base address per plane
> and then write the whole plane from there. video_buf_init() takes that
> address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole buffer is mapped
> as one contiguous range in the device address space.
> 
> That holds when the CAMSS is behind an IOMMU, but not on SoCs where it is
> not, such as MSM8226: there vb2_dma_sg allocates scattered pages, the
> write master runs past the first segment and the frame lands in memory
> that belongs to someone else, which quickly brings the system down.
> 
> When the CAMSS device is not IOMMU mapped, use vb2_dma_contig instead,
> which allocates physically contiguous (CMA) buffers and checks that
> imported USERPTR/DMABUF buffers are contiguous. Keep vb2_dma_sg when there
> is an IOMMU, but refuse a buffer whose DMA segments are not contiguous
> instead of handing a partial mapping to the hardware.
> 
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
> ---
>   drivers/media/platform/qcom/camss/Kconfig     |  1 +
>   .../media/platform/qcom/camss/camss-video.c   | 64 +++++++++++++++++--
>   2 files changed, 58 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index b51745c94..3d3555b55 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_CAMSS
>   	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>   	select MEDIA_CONTROLLER
>   	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
>   	select VIDEOBUF2_DMA_SG
>   	select V4L2_FWNODE
>   	select GENERIC_PHY
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0852eb6f1..2c15546c8 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -7,12 +7,14 @@
>    * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2015-2018 Linaro Ltd.
>    */
> +#include <linux/device.h>
>   #include <linux/slab.h>
>   #include <media/media-entity.h>
>   #include <media/v4l2-dev.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mc.h>
> +#include <media/videobuf2-dma-contig.h>
>   #include <media/videobuf2-dma-sg.h>
>   
>   #include "camss-video.h"
> @@ -146,6 +148,48 @@ static int video_queue_setup(struct vb2_queue *q,
>   	return 0;
>   }
>   
> +/*
> + * The VFE write masters take a single base address per plane and write the
> + * whole plane from there, so every plane must be contiguous in the device
> + * address space. Without an IOMMU the buffers come from vb2_dma_contig, which
> + * guarantees that. With an IOMMU the scatterlist mapping may still be split
> + * in several DMA segments (max_seg_size): accept it only when the segments
> + * follow each other in the IOVA space.
> + */
> +static int video_buf_plane_addr(struct camss_video *video,
> +				struct vb2_buffer *vb, unsigned int plane,
> +				dma_addr_t *addr)
> +{
> +	struct scatterlist *sg;
> +	struct sg_table *sgt;
> +	dma_addr_t next;
> +	unsigned int i;
> +
> +	if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
> +		*addr = vb2_dma_contig_plane_dma_addr(vb, plane);
> +		return 0;
> +	}
> +
> +	sgt = vb2_dma_sg_plane_desc(vb, plane);
> +	if (!sgt || !sgt->nents)
> +		return -EFAULT;
> +
> +	next = sg_dma_address(sgt->sgl);
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		if (sg_dma_address(sg) != next) {
> +			dev_err(video->camss->dev,
> +				"Plane %u is not contiguous in DMA space\n",
> +				plane);
> +			return -EINVAL;
> +		}

This is the part that triggered me - we've already said NAK to checking 
that the buffer is contiguous and TBH I'm suspicious of being socially 
engineered about it.

20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn

This patch does a similar thing checking for a contiguous IOVA 
allocation but this is a wrong approach.

So, if an allocator returns a buffer you have requested as physical, 
linear or iova contiguous - you don't spend time verifying that - its a 
waste of time.

If you genuinely needed a single segment out of a sg mapping use 
dma_set_max_seg_size() / dma_set_seg_boundary() to constrain the allocation.

Allocating and bailing out is not much use post-fact.
> +		next += sg_dma_len(sg);
> +	}
> +
> +	*addr = sg_dma_address(sgt->sgl);
> +
> +	return 0;
> +}
> +
>   static int video_buf_init(struct vb2_buffer *vb)
>   {
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> @@ -154,15 +198,13 @@ static int video_buf_init(struct vb2_buffer *vb)
>   						   vb);
>   	const struct v4l2_pix_format_mplane *format =
>   						&video->active_fmt.fmt.pix_mp;
> -	struct sg_table *sgt;
>   	unsigned int i;
> +	int ret;
>   
>   	for (i = 0; i < format->num_planes; i++) {
> -		sgt = vb2_dma_sg_plane_desc(vb, i);
> -		if (!sgt)
> -			return -EFAULT;
> -
> -		buffer->addr[i] = sg_dma_address(sgt->sgl);
> +		ret = video_buf_plane_addr(video, vb, i, &buffer->addr[i]);
> +		if (ret < 0)
> +			return ret;
>   	}
>   
>   	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
> @@ -699,7 +741,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   
>   	q = &video->vb2_q;
>   	q->drv_priv = video;
> -	q->mem_ops = &vb2_dma_sg_memops;
> +	/*
> +	 * Without an IOMMU a scatter-gather buffer is physically scattered and
> +	 * the write masters, which only take a base address, would run past
> +	 * its first segment. Use physically contiguous (CMA) buffers instead.
> +	 */
> +	if (device_iommu_mapped(video->camss->dev))
> +		q->mem_ops = &vb2_dma_sg_memops;
> +	else
> +		q->mem_ops = &vb2_dma_contig_memops;
>   	q->ops = &msm_video_vb2_q_ops;
>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;

