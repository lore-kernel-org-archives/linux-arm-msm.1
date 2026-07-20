Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C52E3DDB1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542594; cv=none; b=N/zzzKwmI65KdutabP1HiqvUJTZnsD8WsV09+qkbuK7nC+Xd1ffsSnHECOmIHCcXEn04emx3xRaNjRZ+NzN2w82CSl2ZxEo55n4CQg6m2p562m6cU9PPdYgbdRE3PEDuBndGSvCOjK9rJrYt1Gc7RJUZrvho8WP2nB7G5sz8jko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542594; c=relaxed/simple;
	bh=/ApkUlArnWCPavhZoSSb9YSm2/p8YDwN7R9PnhvXSDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uH9++50V+EG39MQHxh+Vscu/LZribpzRzzTlbBTttpTUBBnsuVGgGkCAo+rLABawUeC9tcXTXH3AcQpasYLC397c3w8SaCOxULXZFyQ1dkPJAeNnJqxU0zyJ8XCJqW+r4cynkzlTVzRkcI4EhQYtOgB/gxE+YEmjv3xotiG2Y5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGWUDIou; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGWUDIou"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c160420289bso1392860466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784542586; x=1785147386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOx6MaG7GbwwmP9sPom9tgQuj6r337XSLuTL/XR7Shk=;
        b=LGWUDIouuLfyTy5R0aOLN+w5LAjcuHFHbXyCIWgjSHSKA79WI6x1fs4LejyWkyuYRq
         2V8TTqxWERxZW1ZKtBs/zMcFgqPuwjJr3+1b3OTxM1MC5J99DcnU05Jbd8dwOc9YjBpT
         Fx59NrbqjUHtEY3yQdHmF9d6bohxKp9O+i21GHMO7zsvIY4gP9GtDysQzkFrxpxNkJ1M
         9c5MslEfMlUl7ackokm1nTeN58LaXg1DPzUV7kQ16Rb81wHdbRDEcCVGkW/hjFFE0nWx
         M0dfWDz0ChpDv+VxFxc8SGoQT/6/fXE9QjLc5RYiTPHpWsp3DXTkQuqoNzjOuJgc2KCK
         djfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542586; x=1785147386;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOx6MaG7GbwwmP9sPom9tgQuj6r337XSLuTL/XR7Shk=;
        b=Yc3IJwGkYkKDTdbuG5DUMkWruHvgzM4EcJgp658RgTiZW9Msubw5NVfUIcw8D5e2pZ
         28pQuOOhSxgQZQevvLDJIr7zA6HErpOjeXxSkKhH4ihoKW98PfJPAiz8s87KFQXWxK71
         JsQkWAzNCBT7giy44SdXkDXiMBE+p7LISnJQ658C0Y4pxlKFeNl4pg4tsEzzdbELnXhj
         9t3VSEhKG0CZxybeRz7f6qiFS/4/Um270+YVZOPGrlcWvO++v3Ir+3J346wcz9lI3k08
         8uh/BcFDhLk2CK4FSASoP3V+MxoELsiqfwomEKAwyQ4RQ2EZAMcKjcGqhK0jRmr0Anp4
         UImw==
X-Forwarded-Encrypted: i=1; AHgh+RpLFEPPa+1Kui4yogJ/USNuSjpi7insfVSGM3L2TBbEhOGaJVrM+OSWlDk9+rrEwKDPj6JkWC/mXm4nCDZn@vger.kernel.org
X-Gm-Message-State: AOJu0YwaFhBZ1NFVCmZMZlB+6XhAEpuaOYHFlVtTNvFSNcpV5r/HIfsI
	gSm+nJGvV8w2VTTxCtmrQOSSnoZZb0l8a9abiu6A+dcSSNpuc9Lcmf7i2EHNvVQT1cs=
X-Gm-Gg: AfdE7clPVPjjCSRHf3C2gCxJl5YC9GmVbtnbzqSwf+8qEh2NuXRGx+JYYaJT7e2AMr/
	HF/eQAF1kv4VBLR/+DsIxMsusajpGmamGFMifjCcJnoGs2HKulx52JuCFt6MOJ7WEcQQtn6Lbgu
	vRj2gJfa5GjQSaHFtkKoEf4k9hVg2pwfRj+3hy5mXmgWCBjmSdaRAuz+yMYixZR1e5UaWcAbsni
	ppowxDDzbmA8f8/QjJAqYFb+29adiV+L6MiwwrgZknhUIZo6xmaA+A+AIR+/TUaTXimhdokiAv3
	1n3LKADgkOpPsAW3WglUDZvqQwqnxIkXd7M1PFQVnCU4g9QpVurdymIgL3ovA//iQFmCW0WDtgT
	+EpBd+ocTaQysbUHGPMnQIojCEW4c6mQSmsB2gCDk9XKRUwZ/e69zPW2WE+9EC8xSfnk/2QM5Zx
	+HUOBwR0zTt+twqIr9sDqfJaZm
X-Received: by 2002:a17:907:3c85:b0:c15:fc59:cdf3 with SMTP id a640c23a62f3a-c16b46abda6mr559095266b.12.1784542586343;
        Mon, 20 Jul 2026 03:16:26 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c185c59624dsm426506666b.62.2026.07.20.03.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:16:25 -0700 (PDT)
Message-ID: <948e5f75-aec2-412e-bc99-d1da01a10a0a@linaro.org>
Date: Mon, 20 Jul 2026 11:16:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media
 controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 15:20, Loic Poulain wrote:
> Populate media_dev.hw_revision with the top-level CAMSS hardware version
> so that user space can query the exact hardware variant through the media
> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> identify the platform variant and adapt behaviour accordingly, for example
> allowing libcamera to apply quirks or enable features that cannot be
> discovered through standard V4L2 or media-controller APIs.
> 
> The version register is exposed by some platforms through the top-level
> "top" reg region (offset 0). When present, map it and read the version
> once at probe. This is a no-op on platforms not mapping the region (yet).
> 
> Reported media info on Agatti/CM2290 (Spectra 520):
> Media Driver Info:
>          Driver name      : qcom-camss
>          Model            : Qualcomm Camera Subsystem
>          Bus info         : platform:5c11000.camss
>          Hardware revision: 0x00050200 (328192)
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 34 +++++++++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1e97b0b7ec463f1fa2615704d09ce465a8964176..2caa253fc4ad48f7f04580417d15553a710cbc6f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -33,6 +33,9 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +/* Top-level CAMSS version register */
> +#define CAMSS_HW_VERSION		0x0
> +
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4677,6 +4680,25 @@ void camss_pm_domain_off(struct camss *camss, int id)
>   	}
>   }
>   
> +static void camss_read_version(struct camss *camss)
> +{
> +	u32 hw_version;
> +
> +	if (!camss->top_base || !camss->res->pm_clks[0])
> +		return;
> +
> +	if (pm_runtime_resume_and_get(camss->dev))
> +		return;

If this fails, you're in real trouble.

Surely this wants to be a return -EBADSTUFF;

> +
> +	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
> +
> +	pm_runtime_put_sync(camss->dev);
> +
> +	dev_dbg(camss->dev, "CAMSS HW Version = 0x%08x\n", hw_version);
> +
> +	camss->media_dev.hw_revision = hw_version;
> +}
> +
>   static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>   {
>   	int ret = -EINVAL;
> @@ -4866,6 +4888,16 @@ static int camss_init_subdevices(struct camss *camss)
>   		camss->csid_wrapper_base = base;
>   	}
>   
> +	/* Optional top register for hardware version info */
> +	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "top")) {
> +		void __iomem *base;
> +
> +		base = devm_platform_ioremap_resource_byname(pdev, "top");
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +		camss->top_base = base;
> +	}
> +
>   	for (i = 0; i < camss->res->csid_num; i++) {
>   		ret = msm_csid_subdev_init(camss, &camss->csid[i],
>   					   &res->csid_res[i], i);
> @@ -5454,6 +5486,8 @@ static int camss_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_v4l2_device_unregister;
>   
> +	camss_read_version(camss);
> +

Make it an int a bug out if it fails.

>   	ret = camss_parse_ports(camss);
>   	if (ret < 0)
>   		goto err_v4l2_device_unregister;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index fe5fe25d5f18d8a3ce35b48077a975f1453c341f..cce79e56f58c8bdc0097f4a1702df22c4248f2fa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -133,6 +133,7 @@ struct camss {
>   	struct ispif_device *ispif;
>   	struct vfe_device *vfe;
>   	void __iomem *csid_wrapper_base;
> +	void __iomem *top_base;
>   	atomic_t ref_count;
>   	int genpd_num;
>   	struct device *genpd;
> 

