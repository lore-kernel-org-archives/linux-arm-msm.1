Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441602;
	b=Sqsf8fKmumlluuoPe6458a1kFM3hjDOeesn7SlE9Y+vZWs+9RtrIAnIsGHYCuSCuxNtD
	 l13hAC9cfUQouwgTWKnsO9eTQ2ArI8P3IENaDyshRLoqcwUKFJUXAm2Wsy6rw7c5p5A1U
	 IgN+uRiM7quEt/MDj2jS/zR2zkR12vJ4QpMjnC7yte893CyEMyT2yvWYT3plJHDGMtsvw
	 rzhD1Xr/LHs7OOmhunLXt+0TaoFbCNbngJYmr95bmAn0N8i5NsexxX7wJciKTQ09ULa/j
	 QPG6Ch8+bmGO4Bof4QVrWA//hJ1rIVno5p+U5iu7adRZAlU+lUXnyoY/YkWNNe7x2ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lsN4s6O7Xr+GMG16LhGLC6kalvFOTVR3XV/FNFkglY0=;
	b=MVvXVya0BTitI++gkAcTbmmGbYWwcyhJRb7Rq1tdqiZCH/5f2NCUsAHgwse3uiRR67+I
	 SWWUxhpXjdSIMq9Pjlphv23BKRI1D2gKn3SFXwh5d6EI6XJR+OkYwbMzlJPzKv558w7yG
	 qx2KM2P7pkCjC4UTWVJuZq5MM9XQL4DXTG+U3Uc3Oovqgv11Y0+oSR2qDQuj0xwoORVfy
	 xh2FMe2AQpdmLDVP5vdrXsGmHw1wW12X5isOGU8iuSd1CULAv62hu3x93cHawmDC8GrYP
	 qaocm2BaO1E9ICCteV8VLKnDOsKCR7ut0HaoxioTVCBhOFg3kzyKHKA5zbr47Sdfy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ccozpp3N;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF2606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14EF2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ccozpp3N
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso4100040a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795441600; x=1796046400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsN4s6O7Xr+GMG16LhGLC6kalvFOTVR3XV/FNFkglY0=;
        b=ccozpp3N5Byj4oTwgwYyuvOldNCFsY1t/OrR0Fq5MYx8mNcd4xBxCjKVWIgnyAQ9J5
         XwxoaxUZ01Egxu8d72jhW3VdACQGbCWBtVaMWIfCRcc2MSD9lJyIIYaXZzizZ1HO6ud+
         ML25HSLdxQiN19Dbq4GY7FXavhFhNLtnDrbbCTNmW/jQxL96WOaSw29ma482BaKpGrqk
         MmRmW3GBSa3ry6H0fNPaIr9VE289ia7Z8zaaqJDSZWS3x3/dkkuIdCYz8MZmdrGW3kih
         xmIGk4C3Vtv9ezw4dETbhA3It+i/E1O4md1/i3yBh9mYQoL2YkqOCQgtEN9LJS1FJc5S
         PCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441600; x=1796046400;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsN4s6O7Xr+GMG16LhGLC6kalvFOTVR3XV/FNFkglY0=;
        b=Z9cFvvu8irAGl5r1nZAml6cnTfSi6j2mt2+UhdlemKx4AzEcGEfCvLmHCVITsFxTfy
         NBqyo/VVwa/CW/8Bsww1lkcD8jfeITkT4+0j0dEvT1V2yfuJshi5fkV5s/Qhxbia9YBS
         14AgMLYE65Z7Vnv1n57Dh59LkHQhTLD8oAHeKX73fY6JP5Zed9U7HRxQRLNvP6AMLj5a
         S3d7BdpahdlHOGgdyOXRF2RLBqRb0IqOlDgAIRavM/Zg2NTAj3MEtLEAqjkoLO6vJa2Z
         DfYNzQV8s8T0TG1/flS4Z+F6+giU+l0E9FecaSsw4GM6/FePlqKHt1gGM2tCaOvJBC4l
         LvIA==
X-Forwarded-Encrypted: i=1; AL+hErEUmVoIHZHRG+eyiny8gBBxGrQPWkyJVRCwuNB568ixvo+pAuDhrpmsPhPnzF2TvhDruMlWfLwFzZ/wQu0L@vger.kernel.org
X-Gm-Message-State: APuU4Z9iLkLlOGoY6avruSS5DaoqOxdkWmF6tg2NDH5Qkm6oT4IolsLU
	egc+mH8MBx74fJbq0xXO1/wnCGnuHJFEvzB04IYfNblEAJxA7n1HWdf4ICTQgoIz+fY=
X-Gm-Gg: AZFdTZcZRDiNBdcUImGvgrXf3CoNHkNPDIpJzj6bPo/4bt6tJEsqDXHWOCSf6Itc0ww
	bljXnYCPOAISl/VvA3CfT0/pNSh39vGHq5zEzcCXR16Q9WNvdwi02tNIPlUtjFZUIsPtOtD8WfY
	rj6PfgohG9Lu/tFlHljCsBMiH6XeRgD/yOI+3fgz4vC5r8mpnCtHxNbKQM+M/3eUCAjdtIzzBiY
	UrNyxAt5rEC8lezMY4jBYO7x/luFrMcL8hhuS0WLt+UMdQR+x7TdGlPbJfMPfA9MpPaTXrTlZxh
	t+SYJGTwm7UHLDUnYEwDRN+8swN1D7rDXaEVbRPHgfTm2KXKLoJKSPnPerjTsx3Mx+FmtYHGlR8
	7hNFtBn4wGTY6SQUEpSxcmnFRTlFfTaYdwovMrhVi0UzxHNiXdN7+1y+AGw6lb7Q1xadptoSKdS
	hr+DzUDzTflI8XDFaCkNy0SGVGCSeCWv7b1Q+VPOGHD5VIwVHdBgiXD7X0vxMUhbypqHURxx7/H
	lBW+2D6g4GNfiVfQj781LHaHnyM4TA0tmnkBgqeM8b6FL1cnyZCJ0E0jnHvy7JSjto30g4gAfXt
	y29DCLJv4edA1/HIyGDBqAOwlr/+H2A7QIB1vZl5BQ==
X-Received: by 2002:a05:6402:23d0:b0:6b7:8aaf:5cc2 with SMTP id 4fb4d7f45d1cf-6ba37d5bdfdmr6955266a12.12.1795441600314;
        Mon, 23 Nov 2026 05:46:40 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm5457431a12.31.2026.11.23.05.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:46:39 -0800 (PST)
Message-ID: <e4e2e0ac-103e-4646-83d2-dcdb7a0a9c04@linaro.org>
Date: Mon, 23 Nov 2026 13:46:38 +0000
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
Subject: Re: [PATCH 1/5] media: qcom: camss: vfe-17x: check status1 for RDI
 SOF interrupts
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> In vfe_isr(), STATUS_1_RDI_SOF(i) is a bitmask for VFE_IRQ_STATUS_1
> (status1), not VFE_IRQ_STATUS_0 (status0). Checking status0 instead
> tests the unrelated STATUS_0_IMAGE_COMPOSITE_DONE bits (27..30).
> 
> Check status1 against STATUS_1_RDI_SOF(i) as intended.
> 
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405..502a0d4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -356,7 +356,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   			vfe->isr_ops.reg_update(vfe, i);
>   
>   	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++)
> -		if (status0 & STATUS_1_RDI_SOF(i))
> +		if (status1 & STATUS_1_RDI_SOF(i))
>   			vfe->isr_ops.sof(vfe, i);
>   
>   	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
