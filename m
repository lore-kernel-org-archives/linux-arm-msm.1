Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0D3AA1A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243136; cv=none; b=oD7OAPVU8hCTcpyfUXRc4IXFAt35BS7s2vtR915xxPNGe27wCJLADmmhpwawNDi9xpAtoKsNsqmW3M2eSZPXIJCJtAxJOaOqLKU1ww9qFma+jJYjvo+OEm6MyA6arEmUdHbgl34EexM4BnSTifTsWdlzOxODiIO+r/WFrX6STlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243136; c=relaxed/simple;
	bh=FMdMDb1hsRT2zerT6pupP/XGqPrIeGTpfhSoF7SeLBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSULy888tVwokUSFk+e7BZI0H+2MW990nhWzKyj7bi3KA1ty3qQQ0Ir6WVVAYtAv7YZ83TbcEP1u2eWzb/yMI9TVPWiNmXFoposCz5gltjkCEDG6pszTaT5d+diol2v4XNG8xjc9A4XeNWkW1X1hzsS43sDT2gpXSw0FjjEMpRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVuEeVgv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVuEeVgv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1f758014b8so48630666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785243133; x=1785847933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CEzrLHR91J0dNl9cxgDm1rKeXDnUWpCXkb68sIs8ng=;
        b=lVuEeVgvaH6RZ8PTiEAncKufX/MFlrRTYav1+NEPLJwhc/TpTZKzuvPo5avKNuPA8r
         nA5PeMln1hGBBqiD994YNDE4d7i8AmIzKLlyzwPpjNvvmJA1tGy05T7KYQVs+4JOYZ6G
         L7S29FQdKfdtS8JK/nex1/ywtCMX+hkqdVVtNaf5HgFOwzB9EgDGdi5H0BH33WnXLZYD
         Fu/20JOyKV77I8Czubto2j5hlM+ifbhcJ3m0/7Dk4Qglvd1KeNnks7XnVCpkrk6XPQAS
         ZGiolDVKP7vNv4xsCr2q17oLlPS2v3UVihnLUIwHdOXQYSOVglVXwCq8V8jcTHbAvzYh
         pwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243133; x=1785847933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CEzrLHR91J0dNl9cxgDm1rKeXDnUWpCXkb68sIs8ng=;
        b=dvhFQek4kiBStnIQrJA1AN8oX0VWcLmY5f6Voaja0fRvBCTSJtG1IreEXOhqRKIa5v
         cmY+8dmMIiQ65PhckJcszb0+0eGkoxzv9m1/pAUkaC817rojPDyGeOYMuem8tFGPGhtJ
         lecTvabx9Cq4jsEGTzQ4ifsVwAjU4tdB/31m8T3xJlyYyjoafgxhStYYA2a7nZlIQAsL
         0Db4UnkV70qJJnSj/8NazfhOBzpHsDcs7N58OueYc8iCsX//aYatX+gpL1NfcU4hnG3E
         wvd8QiVq2sTEP5//1Aizs6SKd7Pe8aqLVqcpy4eXgo84IDGQVKO55l+pG3wSxmmDdk+e
         Xb7g==
X-Forwarded-Encrypted: i=1; AHgh+RpabtqCt2+qGmq1kmllW41Rls7MiihD7Ce1y6T6+hzwl5n/7PQqMrnRDrjAJoqFalKb2rrjcVJy6+chwxQz@vger.kernel.org
X-Gm-Message-State: AOJu0YztaCqoWmIGpLTa+dRvcH4ums4PN4lKv07IobCf8nhN1OpR1Mt9
	Hx5AspaJ5/vsC4OIThZWMDnWXWo2DlGlBeeqoaUzOc2u24/8ny4RbI4ahDbyRlp4Iwo=
X-Gm-Gg: AR+sD12wBVqglBS1TfWlZeVhkGgHtl2pjR7j3qZ+YgH8GKs9c2BYJ1jswLeojU5Bmh9
	pkY8igTWpx9Zz9qhUSEw5TLwqtzQkGjp/QQJc0/UxLnlXFy+QlgSOzFqKlJ7Sp6odlEJwEd81Se
	pUdS6R9rEjBZlS5vaAuKirG0VQ7lWkGegMnL+5sxIruIFdd+6T3wfYdcT9MqtPDyAsQAePnnpDC
	0iJKCJ30F/vKont1brK1z156ZKWN3DO5lONFzFXcNYdjR8jrAOwJqMkT3xX3ln3A3SFJMlRHm/5
	yDkHil8igtmybhybxuoH5RKCl4S6i0Nk7CDPEjJzJ07uRb1WumxKPx5Qiy494gxfjsy4m4wBsnk
	KqpgXo8SDKMRpxDGHUlWE8rG7ID85OLFPFiYFhyRcQQWgJGHUL+xTQ15Oy06kpFF1WAv8URY8my
	OSOjd5WfBfG6z78Q==
X-Received: by 2002:a17:906:6a18:b0:c1c:254c:16c1 with SMTP id a640c23a62f3a-c1f719f4dbemr120090466b.0.1785243133082;
        Tue, 28 Jul 2026 05:52:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm773063966b.56.2026.07.28.05.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:52:12 -0700 (PDT)
Message-ID: <cfd2e58c-e42b-44e3-a901-2048e496fb08@linaro.org>
Date: Tue, 28 Jul 2026 13:52:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: iris: handle runtime PM resume failure in
 core deinit
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com
Cc: dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
 mchehab@kernel.org, stefan.schmidt@linaro.org, hverkuil@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tR8w2GUkOUcarBSbnLxQsLPJsDQrGHIxWcizc8oRS0vu5wWNbeqYLWN5I8JKOpgJg61rd7q3XoGBl0KeV4V9JQ==@protonmail.internalid>
 <20260604050451.41583-1-dennylin0707@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260604050451.41583-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2026 06:04, Hungyu Lin wrote:
> Check the return value of pm_runtime_resume_and_get() in
> iris_core_deinit().
> 
> If runtime PM resume fails, skip hardware power-off operations but
> still perform software teardown and state transition. Also skip the
> corresponding pm_runtime_put_sync() call to avoid unbalanced runtime
> PM references.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Keep software teardown and state transition when runtime PM resume fails
> - Skip only hardware power-off operations and pm_runtime_put_sync()
> 
>   drivers/media/platform/qcom/iris/iris_core.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index dbaac01eb15a..bf3c7f722490 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
