Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A8244692
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786148601; cv=none; b=I8V1AUGja2Lbzan89vkaRcu8zA7h22Ll4db7mGQfSWj2DJo7R/uW0TUworBaw8ZyCDeUOQAMNRYlDEEvFoEOe4vLZbnES4c2lsRMB/QS4aMSEtnXhyJraLp+aZB8jn+8jsn9aaX4Hz6PxaWV+DfUzV4Be7KMVt2VHYgWQMb0Uvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786148601; c=relaxed/simple;
	bh=oP7mZJOYoB0pLBirX6itXcK+wnWyr2qfcM4FkvRXQJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLGxWMcUoRRvTvOhfv0ubRG89rqalLR11TY/SypFvRSWY3zIUw8Ksa6hQKX7O1Mw8fFUv1lSWC27vWjsVPj8hZ8zTQuMizaN6veQItWZ9UmKU/vSR1i+wLaUVlWqNT26oNz0WPfILQUECjwIB1eoxd168qXBZYZA1jYBn+Kzufs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsZM35fB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsZM35fB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d01663d816so1183355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 17:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786148600; x=1786753400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=;
        b=SsZM35fBsyxRXwVzvS9R9FP3gv/fvnTUEIIrw+NgE0Ky39TiI7TVRS69zEdt42DVMj
         hcqSDf0crn5kKM4ksLbMExTd4gzOOIjZAeXQiGtT1PSct+KsfeFTBKJYs5MHNnKTSLem
         1u99aYWquBaXEnMIXA0vu/ooKs6UcJU00md7a5rI2fL1JWQpqjjL4J7UBW4fDrlGnJ03
         GHlOOjd5Rs0HPojeNHqZQD/NJoI/yPlguXBpnX2A3EdTrKGX82yqy2EpmdKPvM41rRdV
         HW4a4mteSi8rt3sV2sC53inqFOUqHVkwCiHcauq7NlYqZwbtwCCLOKz72TXX0NcSfJSw
         DfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786148600; x=1786753400;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=;
        b=ReE6sepgvTF/9xp/cUUFEU+h+WnHB1miqTvEhxJQEslu1l8Re+x8CwNyIjSAvLdpd+
         VVvcrrntkFvNi6UT6YwRy4c6tx1dwZqfqb4l2MKFJ2quWany00JC16LgKzpySbDjIHU/
         UGvGeI4xeRxvznPQlOvoqSgKp6nz0nh5I/7dNroBkkgvRfuCFgSq9EZcNqPcVtjMw4yH
         ulWmuHYZ2nWZNuDKsTNvvyBEXMysVXcv51xYK7oMWCtsKwqjBn1bNAcLMTIMjBCH31rB
         W0U6xrN7XhLy5iPFQ+VFGyUxpCSjTJ46iihdsfht/mnMqTKd9xaT2zm0pJULAhsS4Yfd
         VhgA==
X-Gm-Message-State: AOJu0Yw6e/tdjrL92tQqNeUNwLI3b1qX0tGJwPtG4EiKldSsn+aVBm5K
	xQp7DrvTSD6mYcj39VTiwi7UwOSmU9RYtZSdk2yOuYd/IVfqPanjakdo
X-Gm-Gg: AR+sD13DmHuNeTOH38GFHIX8RgpR37HnigkIVLytynOkvmd5fek7013Oy0vqtXDGQC4
	iDtLnNVkhDJmKfTLZ19yNehbS4rW8AGPbEJT1HJgQWjWIARLwkOfwLT5WuyvkN8RaOreBdR7/EM
	reDwUqYlcF+uVmGXfst5uKLKc9JOAsvLLQ9WN5j121nU2ETZ20bYFf/9GJvHi7SybBDlLDQPSED
	6oEpR7ACPkfQzjLovB9bB2kxUU/7HbxpBsy7f7HwEJL96DXoHWDzcY8KCxWNv0cFVAF9Td6wxAD
	NNT85KADdAFj22PPMiVkje5JqewZDfSBID9eKVwRpePxXya7ceorjdMr9iON6jWVm811HOHBRr+
	MA4fFMX+Gaip8DFP5Ye0pUxO+QLpP7+Ll+j50D0YSeLH1q3YLQVQqYXtYFuBx5KTRqHPC9X6ddY
	/ZD4Xy+N0OP/IlNBT9iWcwxtNksCtSEfP3Zt3V81Rnp4dldjJRCZI3XkE4WDaCn01CCjSAKRqyR
	ou0nsHXyYisH+d2Auxc15y5pGafP3D8JdSnc41hax00+i+47w==
X-Received: by 2002:a17:902:ced1:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d106a1a2d5mr146246905ad.4.1786148599808;
        Fri, 07 Aug 2026 17:23:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e7e89sm14214285ad.74.2026.08.07.17.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 17:23:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
Date: Fri, 7 Aug 2026 17:23:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 01:16, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   drivers/watchdog/qcom-wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 49bd04841f0c..a8eb1d8f24f0 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -298,8 +298,8 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   		wdt->wdd.info = &qcom_wdt_pt_info;
>   		wdt->wdd.pretimeout = 1;
>   	} else {
> -		if (irq == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> +		if (irq != -ENXIO)
> +			return irq;

This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
even if irq > 0.

Guenter

