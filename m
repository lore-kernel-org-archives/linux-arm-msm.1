Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82EB3F5BE5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549820; cv=none; b=NwAH3lWTUtc8E40U3yBhYHB+wR27OQINI38zl1Kg68fAhk5b8/Lz3g3kXPxQYEBIvTp7K0UU/cDeIYI6oAEo3sgetHMcslogLEVgQchRSNJz0z1eDp4QV5l801IgkuJmlAtTWHYPHIhqf9zCQ7ysGO2fIpQ+BK/NmS2tfO4xKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549820; c=relaxed/simple;
	bh=Ucy2b3MPSEnBCBhKVkHMWhghZFra35xFFNj5Qb50XsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HV293V/lsaU5MqPAvhyQmr89+EeFqBXoB9PikjKFSZvG+J8WwysFNTsFJZ3XYTYOi3BqhBK5H9DW3apf8g9sxBYWNROMH1zL3MLDGBm1clnajRB+9eODU6xYRiATN724wGY+BdbJus5YI8/qG8CkavRqA4+JDg1ZUg5RqYdxVHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lqi1o7+w; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lqi1o7+w"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47640541585so663564f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783549816; x=1784154616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=90IOI9EUyLOw2eSiEVVHF1LKd1Sg9MHQdR1C6WQNJ10=;
        b=Lqi1o7+wVIWB3ifqgsn6xdp6t1KqFZUP2XjUycj/9SQqPoQyi7tZLKo+a9JxKQ8nE9
         116s3PnM7+hBDGuQBggD3Wl5NUaISy++kYlfeg7TysKuENF+6gJMh6m6lzX3EDRsdkc1
         g2NPTSLcja1Y4bA7pJytWr0d0g3AZdDecJl5fHZDSNkwMmLdHWJeSoPs6u8UFtrsz+yW
         zaspY21tFQdqgD0nZG1vAJRNcYuQodKA+jTPqkLfISKsK2EVgM22nOHD//qvP0wuR20O
         nE4ymz1SMwv37kJdeWZQ9Fw9ArOvqMfFAVoZgHAbOnPUxwDpBffAUxKO53V2zSKjmiH5
         o6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549816; x=1784154616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90IOI9EUyLOw2eSiEVVHF1LKd1Sg9MHQdR1C6WQNJ10=;
        b=YTfwvRz6UlmjT8WsLB1B3JMNwj1BVvTbR//6qn04bnyftbWu6c8i6CKpiGhj/oBOgS
         oT4s02489xR9X3OEd6XdDl0RtlreBDmuKzWpogn72WOfq4KzncBY5JG2Xp0M8HEmLoh+
         lNkZted1UvhdieYWjMMF6E17QfvaboeuZCmcCx9l4VIazSKh+wrkYAtIKly2CBqDR3GF
         LURhDcjHrxjMsXTt8ITpU5nTVjbZQS8OApKO4xaFwU3GRVSMKbTJOzHOrPT0Wm5ozi+0
         vh50mHy0kj+LuuIcyOVVnExhnolwOZNFQseyDzmEeH5Hh/qwWiJDBf0tY54J66DFMWW0
         hpzg==
X-Forwarded-Encrypted: i=1; AHgh+RoECLrwgOAHqekLr1nKBGvd1uG6tW03zysM5x347v1AFrK6pmYpoMGD2jrcbMq6jNwT7Sfd915rA4si446z@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXRYojbzip41t8OB3TlOYLoJ46wxTOkyErurigoioSMdoghdn
	3Y5ESYbjgAahxeLd+egZZZPTki47a1x1f/gzrEqKUHDZbwCaisgSit6CZm+g4bYgQJM=
X-Gm-Gg: AfdE7cndN1n7ZIC1KyqnP+ASrSuo23ccUtlDKx9feMiIPSbXd8ZzOFa7ee9OuTuKvLg
	/P7twNsDngzgJcBtEy63ezd6SWT0sa+7zJ65YM/mH30YUywz+KzWW8T2Vy3KN+kGV1Xr18mCSYt
	6Ki0fvodk94OYV/rXC5WEVE20RH9oExORC3V5VrC2NOvLZuh/9MpjX8xUaIZFvjuq5z2KSKeAHZ
	invSJnkIKbeZJavPRYL1wz24nICBOh8lHGytU93lgauqJjWVs+bDwiVgX5IitCrecVIrkHh6I7g
	3N/PmcNTY+q/YPBf2Sl2QbIXEZP3Q4f2Sypgufp9I4trXqIsoM+tOzDncFwAleOPYOdEsglmpqo
	l7VJSjlPjurrE9UI2eQpow5KNIUDYSMiAYusXbrY+/PP2+H84vycK3GTD3X4Ur1/wbtovgVt0FX
	0tw6YoFouWjW7lxXRst2IaVR6etn2ztbACEq+Luw==
X-Received: by 2002:a05:6000:2013:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47df077b2e6mr4491121f8f.47.1783549816190;
        Wed, 08 Jul 2026 15:30:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm46711271f8f.26.2026.07.08.15.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 15:30:14 -0700 (PDT)
Message-ID: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Date: Wed, 8 Jul 2026 23:30:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Use devm_of_platform_populate() so that child nodes declared under the
> CAMSS device tree node (e.g. OPE) are automatically instantiated as
> platform devices. This is required now that CAMSS is modelled as a
> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Looking at my commit logs I see this isn't my commit message ..

Anyway.

> ---
>   drivers/media/platform/qcom/camss/camss.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..95e655a8b6aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
>   #include <linux/slab.h>
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss)
>   		return -ENOMEM;
>   
> +	devm_of_platform_populate(dev);
> +
>   	camss->res = of_device_get_match_data(dev);
>   
>   	atomic_set(&camss->ref_count, 0);

Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do 
the same with the CSIPHY and Loic the OPE.

Modelling for subnodes is nice if you have the idea the camera block 
should be a bus.

But for what reason ? As you pointed out it should be possible to both 
compile and run JPEG without the compat=camss node on sm8250.

Making the camera block a bus is a nice idea for "reasons" as this 
thread has shown, its a problem to implement with an upside we struggle 
to define.

When the facts change, I change my mind.

You were right to argue to have this as a peer node. Lets do that.

---
bod
