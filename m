Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3F93DCDAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542269; cv=none; b=Z2pu/SwhTQsJ7C8RgHb8zyBLFc0n+W0dqK5H6L/kI8dAacZuPoiXDFCqQwWU+5LKkXGesPv6gcgUtRUYajVQrRKOwI83gCzMkQLyKVFQ3sU7HfCe6mIPRs6BufZoMCS84KWiflTLJMDKUUckkd28qKoOKhecPh2PSXUK3/Vn6lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542269; c=relaxed/simple;
	bh=3VGzNIVavy4riBNoVaQGq83t63k4CBx5YMYFOuF7l5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/gfO/RAy/QR8vbPOcT1RE6dFRL/+B8nr56Mr0rX7A4084JXwrfIk2wmukLGZYVxzFFvLjnnn8rbvpHaHDzrlrqLa+WcO2mVswddwZNMKliS69UyNdYF+bQaSjWyVvj/u6sUNPpaQL3c4wLsVy+TeLNU82hsd96AdO77O80TXpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Prv0kC9j; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Prv0kC9j"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15e03c2763so843151866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784542252; x=1785147052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKvQpFa1elvV0qe/8C8Y/Fz5QGnzRdhnFNUsbcgsZbw=;
        b=Prv0kC9jS6EpSBzK5FA1R46Ng1uKoRXe1xT8oHaD8vXv8V7mL9xcljj6f0Z9uaKNEZ
         ofGJe+9q9giZsJvSUQVZUur1lcFnpKi+mvGgpeyecUYu9pHN8N/JXQ5evkmyH2yIAfVv
         PJOo/K+qllyby4rRMFUjxjJgRa0zlEqRvb8P1RAF+fp92ksXhmvPFosubgS5P0o+elpL
         czCrBTK6yilk58BH/eoliKDsYXcLLeOw8wdf0ITzVZ5/bUa9tbOcjWrbvXLoLk1pqu6T
         zMTFhaggR42zNhTasL6MpiCv1yN3Vdy2HhdtZjalG4tUcNF6f3LRjSCt95jM3eOvsq88
         QR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542252; x=1785147052;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKvQpFa1elvV0qe/8C8Y/Fz5QGnzRdhnFNUsbcgsZbw=;
        b=VYZwrpx20gQqiBla3fXQ33FvGaB39CkvwFgS3vgaxtTIdz0bzVmbSMYTOlLvqUD18Q
         tQ8X8JKkondnbOD1QmidDs3BUXsQGaJdEnyj6MLYyzJu10GsSx0znAWIcTgNlvQpNUK6
         f4cZNAqQnVG2RCrRHF1piRCGqXgxDrn9E/Fz8DG0LqTni230+4jihJPB9IUr5BPMyNsO
         NDELVFXRSnCA513aEB3YjunrBBdXo3JycR9huGk4waPBtJd+l1oLmK1snca8+7v6AHvZ
         BUQTMIkmxBSOlmRiFAF97+VuMYCV78ltd2pskvK1n2FxKpJONDcsvXCQJeir1n0KwCll
         6iCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ0dQYcmowvXh5d6ahvNJOTwGfPMIfXupuyGCm3URha41/Ot1mypm1zZh7lRrIf/k2DJrPpoTCYzlMyIRd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7yGobdTCqcN6sXynsgZ23pkOX4qTJ+sZOI5kBlQZK1vfRhHI/
	a6ZK2kkBMHabUmuSe97blWbaGjNONyx+wbeifzt7qhXYEginV4fvz0VHL+Z9QoCEHpQ=
X-Gm-Gg: AfdE7cn5IaPwjKJjZ55HuJ8YQR5xyCz9M3NVxG2a+1B9n4c677hCv/aAMI7G5be71my
	4etPE/Y3MGKvKF7/CpJ+QDEa95kysa7gZC9MHwAlipWn5MWu8K+3hci29mgGVO1oLjdfYJvW6cN
	eqAyzlhP0Dy9D4c2gaNKX60Cf2+U0QVBJimyjO64kt5g/noGauoC9w5UorgkJ4LhbNjVuoh5s3J
	krycwkWXSwwsGj2TiAY+zgfVaSl0/R+X8yJf3aJ0dbarcj43F3nmmOXO9EeqNI9uJNEi/pHoL7v
	FZyLqrPOjhs190myHqNj1kUJgGLiyBN8lZOLKKgONb0T25P2n4AQrwYWYpiDKQPnEpHPs3GHcbE
	LKtj/JN0RSlMTrb+dm0RKWz6mfXBhQOYW3YAhj3R1SrRXtZcz2MUNbrsnfFc+VweaeH0yGILY5W
	dIvBHeOztyvW0uez5Ia4HJx9SB
X-Received: by 2002:a17:906:f584:b0:c15:ee17:47a with SMTP id a640c23a62f3a-c16922d7b1fmr921088666b.15.1784542252253;
        Mon, 20 Jul 2026 03:10:52 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afeb98sm441332466b.22.2026.07.20.03.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:10:51 -0700 (PDT)
Message-ID: <edac77f9-ad83-4576-b233-e3a7e602791b@linaro.org>
Date: Mon, 20 Jul 2026 11:10:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 15:20, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subblocks.
> 
> This avoids the need for each subblock to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++++++++++++++++++++-
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..6a2bf3373e8755805c8cd0f8fe5037b788d68fa2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -18,6 +18,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
> +#include <linux/pm_clock.h>
>   #include <linux/slab.h>
>   #include <linux/videodev2.h>
>   
> @@ -5346,6 +5347,35 @@ static void camss_genpd_cleanup(struct camss *camss)
>   	dev_pm_domain_detach(camss->genpd, true);
>   }
>   
> +/*
> + * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
> + *
> + * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
> + * top_ahb, axi). They are managed automatically by the PM framework.
> + */
> +static int camss_init_pm_clks(struct camss *camss)
> +{
> +	struct device *dev = camss->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!camss->res->pm_clks[0])
> +		return 0;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
> +		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
> +		if (ret)
> +			dev_warn(dev, "failed to add pm_clk %s: %d\n",
> +				 camss->res->pm_clks[i], ret);

return ret;

---
bod
