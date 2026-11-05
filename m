Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872670;
	b=0OmDt9Xc2qIiNyenhrd1t7biBN6TCMouyZBogPhu6aHXLQw4AUpkszFox3Z7KbvfVlgx
	 4rFyMTGlKAbjmnTO++5ucpZzXxLtZjdfir3f1XoAgV7xCatpswZeHh+78pinzzBjoBxHE
	 gPMMUVedDTVOqxdB/QwL6JgVgeMk8igI7L12vGJUFYLXZdFtskr9x99/EnrsbeuYs7VGC
	 q2HNAJbiCcTBCgAhiBBlidta1loXZJ+GLHRPHUVLz6oMon2CjrIxISdQELrr1WLT+gX6T
	 /amfLXrq9CTyTfKpJwHCn8QJlagCqFM90z4ykR6zlqiUQUJ89GAFU+qyMOWjySWAQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
	b=SaTqKha2ZJG9VhqJ6e2Uh4nWISEJ0m2UEDOtVWncOHL6txXETBaO6xHmR1a6iv6dEPjZ
	 O1lDLIldRWSahSX3FCBF+ziOzDxeWMl7BY2KbL8Arx3zgczXJ+eD3EmfJsu8nNu+bhDwL
	 g9kd1mPUHT9eA2tN/4iigl6XfXRatQZCOT7E0NZVxJPo7SeAPZjTbFUjD50IG+tWcR3Yr
	 zYybia/7ONegPKG8U/IMeBP1tP6SPhw3K+FfWncNJ18SyqGuFZQRlLHY5C59Oj9Lwe609
	 AkLc5apse7ew6KcBb6wTZepX+zhDakKXYOTI7+SdblLU2euSEaAlFFoZ7oWi0Ku6ZTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oDxVwy4Q;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE04B606A330
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE04B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oDxVwy4Q
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so284003f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872668; x=1794477468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
        b=oDxVwy4QjautS5UcbeppFUfZvhwy5qT5Jv1UH4ghJVU/8virZccbyxZ4fjXAJNCGLS
         esvAzFkveT02dJ2kpQOpbE0amiqcPFMSdi8ynCoZOHwVo8gOOvlbUSHRbi2fmWty+hmz
         SF/qPukCL3iwBiS47562s4lLr5ovhjElVybA4VQuy5zC1jNUg1/4IJHEVTR35ZLvtEkb
         VOcKToXIEgN+pARuf43SKAEh1ygFy3fmRuZq81JESr80ic+c/6Tz9seths4MLJfP1ec+
         VjBmDYILLJ6RZ2wc++GgtqHXVqPtrLbf49LkOTiHY7cXw2h9UNYfyiVuAPQIPlGQ7lFE
         kHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872668; x=1794477468;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
        b=G9bGR4q677pryYhmuFPgRFOInqRnbAR8+iL+SKJAE2kRxQjs8W/mYmSATOMleiNkV8
         8fd8vdQ5lHCSYEaFOIMFYFvcNAptwHgEDVMQ94Sirdt33vNZ/P+33Q86W9E8XA/wpx8b
         RrrML6pFRezghCBNmrAbKFnp33zJ7iUEHmAOBwcTdEqcm2rdRKUJfoSqug9aDtJSbxhg
         0Pfy1BmZS0VvPgAea7TK9XyFDU2Ztean16UrkHDC9fgD9z07ln22gw5lyT8KaMVOrECq
         umPy6JMWCi5bP0d6dhhNSMWZgK3nyVGO+gfFzsQmghdiIcC/c6LZrMFghU7lyqYzGq4l
         eMYA==
X-Forwarded-Encrypted: i=1; AKwUvByssDUYOTvTwmstWfHd0xDoys3cxmRF2GatqR592dDi7sHuOFUi9S71SN/e7CWij0AslMPOm4vp6CFzOHoO@vger.kernel.org
X-Gm-Message-State: APuU4Z/6JlyGUiFdfouT9Vrpbgi4Lre2mh6JsJYFSpxJHViJWGTKbgjj
	KbDoHAeFJFSHD4qnslOlk3dv+8fFvfn5LJvgzGr+E1+Ai8RzuA8b2JE/mZMilSAQS/c=
X-Gm-Gg: AYBFou3QWbp0IknYtuiVQhtC+oqyKhvfDAn1TrgeDLPKoBX58OLSBdEAXLCdig/F6ie
	L6rnJasVYm1V9mwcxY8ZgrzmkLFvOtraloolvBPMARnSdBYzI0ala6NcubXEhOAYG4eXXSh1lw3
	EqozNVK34QMyh1pjCflARzx1WxeeBka7+eYgEzQbTyPeJ65aVZ/EZuWnK7fcQkkbIzzb/r6zp8I
	uNJMzm98OfeaJOXYdx89uyWn/nJJVKl6pdz2l0jj3AWzSZESBci7iILqTdhfFQ5ta7aQAMgLf9W
	2tPH2v65691/AuYfYDf3S9L7RSEOG/YYcvKkOGCdXIzexGNvCoj+IVnjoISsLnDpsnQgo/8EHJT
	sqUvPl5Tf9QLi8RlgZGx9+lCJVJTxQg1E0btCSh3C8L34mlDP2Y4MJMGfE7pyk892Ypg631VQWv
	HHZ0O0C/JjgVn27ZVFGvHea/kPtRQHwBcRpPNPXysPj+RMdqqdBk8rq17NAiJ81kInygcQADj6X
	rpPRc2VReyUDKFQWZ/d09viCC7fApGkYbf7HI3IqNB0pJbt7lVuLXbq9GstI1K7O0Gf/AX1bB6I
	o9Lxttyca62z9C/cWtiDvQivjfamqlnN/Eg42lN5
X-Received: by 2002:a05:600c:848c:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ac17471091mr428132765e9.6.1793872668197;
        Thu, 05 Nov 2026 01:57:48 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm49867725e9.10.2026.11.05.01.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:57:47 -0800 (PST)
Message-ID: <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Date: Thu, 5 Nov 2026 09:57:46 +0000
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
> +		next += sg_dma_len(sg);
> +	}
> +
> +	*addr = sg_dma_address(sgt->sgl);
> +
> +	return 0;
> +}

STOP SENDING THIS SLOP !

---
bod
