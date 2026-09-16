Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A54D0CE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577563; cv=none; b=NFeXKYyMZtDf/Fx0RWKDb2Oox60V+vBI9zEKngINeNY8ISjojAM7w8+VLlTxEg+yYhI3pjg2iiCn8fghiwP+T/eFIUxRsrfV0ZBELNSi94Frx8tAkLq8U/9lLbqQtQLi1JRyvf183HBjxZ34Nty3WrqZXxZzK2ongpO9uD53190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577563; c=relaxed/simple;
	bh=3hb2s1nE8GbWF4nFX41LjIjY6GWkRYkXDkCPa4Nu+74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+vWTDK+ThP33K2fe2jgf16e+WI1BWjfF6k92DPcIHhe7fKLzUPazOwFAaFrq7N3+YiESb+ynVlSnRxM7oTQinZi7THezV7uY3vca/0BXFuvHYr7STprqH/+08eIsJqbRoxrmjBxh2BjuQ6KJTOnA/OWlLTvVdPuCyRmD136HzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgNvJxP1; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgNvJxP1"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso9982805ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577550; x=1790182350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=;
        b=AgNvJxP1DMnYNwLESwxLzqy4FJq6Ru0Y+xKhQl4JZTnJ/oEz3AzyUkNtjQZDk75+lL
         NbTXNnUUCJCWMYlYMrLpq5bwqwh6oQQHF7rfrqYw8/5ttFFRYwaJiGWGxJvSPnp/eKNv
         L8M1dSHegANyE7VSneb3fqA7UUKsAP5Y6h69JS+y1rhxR+VHbZlaOqR8HOguTY9xYjJ1
         I8HZKcNKd+nzU7ElY80D6ehaRCjRJYcR7X6iB14S+9So0KyI0zyaEzspsqNLTijuG0e+
         /QF8wtGdsbs1uWTRcT7w073idLupnKJ4cT7dlAYyehm9Bl16qRpZohfnrqfiThkslabm
         9X2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577550; x=1790182350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=;
        b=QFD0TP+JNOe3j+PNwtkD83ayFPhrKbZIFv0rE9GEkqfbLdlAD1UwnpWxC/djHh53z9
         57w2zZ5aRsYG5ail1qe4BO0yP0wcQguOj1PHEkngAHlEpKIDKpio5i9kg2DxEPVTsv2z
         wqdaaVGYI8fjJqHPontGoYH1wbos/yIo4H0KAZ51CfUqIjPhbp8mJnReIZXrSOpEcY5Y
         2sPn6Yfi+0TxdbYgXdVRi7F42uim/AATt+/7/mdZIm2Cqv7z/sR0rixjwzAk45eX3Qt+
         izP+9nx/2NmSpnwWQymSy955pVrwDDMR0mxvwpH9Xl70IJAQidVPhX8JIdCzL31IRByX
         +BTg==
X-Forwarded-Encrypted: i=1; AKwUvBzNgdXVSnPlCrNjNdN5x9JpzYo802akDmbcNQl59BN299GFpYgisEBcsi70hKVKZABO6A410jK3hKwJcuwe@vger.kernel.org
X-Gm-Message-State: AFuF++lVArGdbe6Lf3ufec8F6YtlT1JeWrKSJD/HyB3+klM9X8qL30L0
	ZclKt8nGG0+wDngWfitYVyaBibI+oVhPRujcIuz1mlfvvlR0CMxn6VVI
X-Gm-Gg: AYBFou39WpDMnhoXXKeEjn33UoIfRXnLzOSbN5Ut32U/VcW0xDRHd6PJMqH90K78Nng
	TgtQ0167dt2rni96sCookExMFuNK2OYHhuHH/I0SYGIZom1aMCHH4wsupR3PNAlyRReMZ2jxXHq
	vP+mfHfTOPlv/G0Dgx05+0D00K0c/ZGS1z6MuxSvdEwlMSfrBD/sTwgqAnLN2Rh/UB55B6Hnf84
	W5ZlGWq/bn0HwP43Z2It3ypEaTE4hmdekKl5X0gtLsL2e+odGaefBrOE+eNlJZ7gjdMhSPOsEVY
	V6EKWI5qVl/BCRu0aSRr9WcC7Ykz0tlaGoLpcSCQprCO8NKLwEQrbTm8d5G+B6uqmm5zvo/JEZ0
	h3xaHQYe/jwyvhqzBm9AdGCzecN8qxJ51XxtleSwgfvbnrXMuokVrB6/6DDx550SXh8LN8Lvlte
	PguKuykeX53GD++XEnwrzp6LFunnowyMCSVdAqHT7XuxbxAgxSLoeNkpvZmo2Vk9qSMaSY0zVLK
	IU1nQHv4TQJnOwt1J/TwQfd3Fesjle7WPHw77sKhqWpG1+ThQ==
X-Received: by 2002:a17:902:c40d:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd8e6368a5mr67941175ad.18.1789577549942;
        Wed, 16 Sep 2026 09:52:29 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd90c7b215sm12866435ad.72.2026.09.16.09.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:52:29 -0700 (PDT)
Message-ID: <ce80af4b-5d4d-4fdd-a4ca-3c361c542eeb@gmail.com>
Date: Wed, 16 Sep 2026 22:22:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
 <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14-09-2026 20:31, Ulf Hansson wrote:
> At the point when the PM domain and the topology are registered through the
> genpd subsystem, it's not really known whether corresponding CPUs are
> online and thus if the PM domain should be initialized as powered on or
> not. Instead this information becomes available when the CPU devices gets
> attached to their respective PM domain through dt_idle_attach_cpu().
> 
> This is a problem when using PSCI OS-initiated mode, as we may end up with
> a PM domain that has the genpd's status indicating it to be powered on,
> while it in fact may not be the case. In the less severe scenario, this
> leads to selecting a shallower domain idle state for the PM domain than
> necessary. A more critical problem is when a non-CPU device shares the PM
> domain, leading to their corresponding drivers not being able to trust the
> status of it.
> 
> Let's fix these problems by initializing the state for the genpd's to be
> powered off and in the deepest possible domain idle state, when using
> OS-initiated mode. The support for ->sync_state() is maintained by setting
> the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v4:
> 	- Drop GENPD_FLAG_RPM_ALWAYS_ON.

Thanks, Looks good.
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> Changes in v3:
> 	- None.
> Changes in v2:
> 	- Fix a bug in the call to pm_genpd_init().
> 
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3..5722365b943e 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -68,9 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	 */
>  	if (use_osi) {
>  		pd->power_off = psci_pd_power_off;
> -		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> -		if (IS_ENABLED(CONFIG_PREEMPT_RT))
> -			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
> +		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
> +		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
>  	} else {
>  		pd->flags |= GENPD_FLAG_ALWAYS_ON;
>  	}
> @@ -78,7 +77,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	/* Use governor for CPU PM domains if it has some states to manage. */
>  	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
>  
> -	ret = pm_genpd_init(pd, pd_gov, false);
> +	ret = pm_genpd_init(pd, pd_gov, use_osi);
>  	if (ret)
>  		goto free_pd_prov;
>  

