Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599238;
	b=hYyeICPOeY31PFXbnFFfaTxuEvk1s/iD7pv071hvQIsNRnKv+uDOoW7AWTWr8E04RYaR
	 D9ark/eK1FMt3/4EQE541OZAKVByNsPloSRyh8n43/Z7HvyyquHmIgxxDBr5v2o5K2NTb
	 SyIwzwiqskeyqPAIzIMB5KbZEVfh9l1VsD1h1HAvfFyQXkGV2kqPPy4eQMVl2d/rfy+8z
	 MzYILi2AhlMrTSrtdHRc4HdZQJCPj6PdORQ5+zov4BFJO52TEGCxPu7uWH47yyjDY2Gyc
	 j0yVr8rz60xgCKPyew+/QqXn4iia7bPtPt2n75AXfceql+Ju3fWSdGRjP9r0Kt5RbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
	b=S++DqXrQCDyMY2S0fP/1FLaCGT1uE7hCSDqhyL7AZguYY1LeRiknhTI2BAkz4o5jJNdn
	 9Y2U4JtZPjXaCqmdRfxQ5OqavFD6zaIX2TXvpdaMZvs7DXgW4tDxLrplhl2mpJAZMVY0T
	 sDZ+edpzklqou7yPLBA9SFDu03T+0pHLkMmN/JuRLVdpRRmZlV3uYxS5qKkkf+8/cuJpM
	 5oixWmym3+/lGxILwiI6Hl7OmRIHTG2cP3hIY5eff38wC4vsWAxFRkUuFc/bWvMDr3EpL
	 BIOTXuMtya0oTHa1ofPR8Spm1zlRJrf8z40ZKbY8/FAMYmR9iWr206Uf/mVe8uxIp7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGpcEftj;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F22606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 19:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F22606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGpcEftj
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so2086673eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599237; x=1795204037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=FGpcEftjGf/8FeLN5xx8lCOAqwDTwoq4kDQD/mgzYbfy+mu5nR+BGXOJ0a/01GFvSx
         Eq53qQ35WUOg89/AJrzV5OQu5EVEf3qMAdin182glN9Yl0/NWgtVQYH//8aOcdKYqavQ
         lK10NcJw7FiG4CTWFP95gxEDOspGbopsMws5QHEQKGHGVPC2d6jLoeUeDBTfJvg+V8Mr
         Op7NpOmFiIIWblp6grKK+UhaJ5tTzIoVh7hSgqJYlYx9M4ot0z3Ae4T6pxW/hQzcQfPd
         GKjPKAbhFHA12Ato5S20OJM6PdX3IPwr/KngIqGmYk13Znt7ecuUm5ULe5biyqNw5LuW
         K9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599237; x=1795204037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=eCqr7ukQObeOOl+UVYUzNxGqdFFzQHcdJiZnCmLi1HusI51rv/jtDfwbJm1x6kLlx9
         m9+tsz2H9nIvlr4RVe2PJVzog18wSiW7LmpLpPUFgsgjx5xE09OVdcCZQoJBT4mbGLx3
         Rd4KlGTYkKjCeVtqGLtNbS1xkAkuJSvhqeDW2nEoaUlQj17NeezDuFO4IjFdjxAqYliA
         Yh6e2fXT6j9OF+8xA9kIQ8U7lxlr0Q4niS7v//F+vcbGeI3hCxZdpP85yvaW8kFa4kl5
         464N5XPiLgp8Yq8ZZSu7JzWEbW8Qp9Y5NHpVYMzd9/+pXbmXhTceYgkyYkXNYLfc2nJs
         iV8A==
X-Forwarded-Encrypted: i=1; AL+hErHW94MBekK8UHd7R6+cDC8MwT8O/C4jiQXh9H8sFHd5nr4SCpaMLQvLM7NSJzN7CVjcGJdnZdRJJdj61OHX@vger.kernel.org
X-Gm-Message-State: APuU4Z8XWc0n52i8caDAjP3+/WxG6zfcw8+jW1usq/6y1ZM0yaZsH6QW
	KPA5sFfH6dCJGhlZNCY1OpV+sTaI4hsoyVKxqKNRTnl6IycqWY9yB6l0
X-Gm-Gg: AYBFou3gcQ+mAqw7DRYY70sS26UsZwnrvmnRf4fJzS1uVdlJgn63zeBYIgTcB7NoXPY
	JtA92af3Q1be+w9/HNFXPehzzxBSB8cizKLjvC+euYyGyUCRJ2PijyFJzsfEPsORijGa2lNtvpC
	KeO3+mnnD/QZrjxz93aigxj6RgcpqPg+RZFd27Ainq4R8/pTnzCKLKn9Ldf81RzVUrV1U2S9ytm
	HpkPuPONgh3iczV6LgXaUvhkOXwXplXN4WQLwlDzVda2hCp0l+Owgfv8hEA/vGIRWiF8JmQs0og
	oexLmcs42gxTULiLszBbZ2EzQtaDqwH3gnOin+69zRhwGxbvEqFEkIUkaJYj8yj2ZlgiHuAmbd0
	2FMbbXZSmv9me+hq5EA0XvyjHEryR2nWoS0v5D7kHOStCsgzPYtbSOFOOc5KMdUHkOVQe3BwuYv
	wRtLXj4PJ2Ioio/RaGpfaHUqAWrPwYkJYBLHlDxFF3qNF3VoIS4hcbU2ua803nEhCko308QlPr1
	qTIxZUZ6SSA5uQRCf2rl8VME2GAEDbYzY8FSDotnGBbe6SRiunEtAy6QdG54ZPBjvadfZ+CX4T5
	bl0wFeGPKg0o+yGl2qvm2weDIhSBrpNi4zE7cNMuLeTye6PVXIlTKW0fqk5QxzXhTQ==
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr2832268eec.32.1794599236582;
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Received: from [192.168.35.9] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm10172682eec.14.2026.11.13.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Message-ID: <953597c5-80f6-4ee7-b8db-ec7264d99e40@gmail.com>
Date: Sat, 14 Nov 2026 04:47:09 +0900
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
Subject: Re: [PATCH v2 2/5] devfreq: Use %pe to print error pointers
 symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, rafael@kernel.org,
 krzk@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
 thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org,
 sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org,
 wens@kernel.org, t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Language: ko
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/13/2026 4:11 AM, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
> -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
> gracefully and prints the raw integer value. This makes messages more
> readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/devfreq/imx-bus.c    | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 49798f542d68..dba76d8b9e5a 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
>  	priv->icc_pdev = platform_device_register_data(
>  			dev, icc_driver_name, -1, NULL, 0);
>  	if (IS_ERR(priv->icc_pdev)) {
> -		dev_err(dev, "failed to register icc provider %s: %ld\n",
> -				icc_driver_name, PTR_ERR(priv->icc_pdev));
> +		dev_err(dev, "failed to register icc provider %s: %pe\n",
> +				icc_driver_name, priv->icc_pdev);
>  		return PTR_ERR(priv->icc_pdev);
>  	}
>  
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 52beeb5b7d65..28d7c595fa17 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>  	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
>  		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>  		if (IS_ERR(opp)) {
> -			dev_err(dev, "Failed enumerating OPPs: %ld\n",
> -				PTR_ERR(opp));
> +			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
>  			return PTR_ERR(opp);
>  		}
>  		dev_pm_opp_put(opp);

Hi,

Applied it.

Thanks

