Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288984;
	b=L5f6iFxooBLqTK8TNsWfLhSjWihH2eYtHtNXOaFPcQW1gIgs6LstnPXH69iScWgxfkD3
	 tbeIUIAj8EvbxFTXcd5jsqIjpBjXubhnICJNZC96Fd2dETER9abqSIqTiqbN3Z05wkiQx
	 NnrxKAc1DqBzG8toIefKSpfZ6Tik1e2Qm7JJzA7pSvEZI/zLU3oYCfR1vv3A/KgXeknmv
	 TjDXjJIoSiOak222QdHw+pwLqpyY9br227Ha+TkJ0DOEDugF4kHbj01xHtxgYUFYAfuI9
	 HDJQtdrD7Dyoi8BWobZkSU+I0+pcYQYS6XEx8DV2HRq1orxP12UUHmeX88J4NfXCdeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
	b=GUtUxxGluB4V+ZOSr5mgy+6mJmkeu8iI8acuMVAhOeaHR7Wcs5v307BdXO9Sui6eT7pv
	 +YHVrK3HA/kEie1R9xLBtbS/vlEYHtO5O3XwTVIxW6DqwLSPkf+y7rpEC+ZO+ltOpDNdd
	 Pcio0i1SkcFHFh6RXHwjkHTz9dK3HPKpzL+lyFi3qNeNzd2bhYX+qHRMqgvc2JvmjbceJ
	 4w9yQZPCnrx+XTjP5R+5Iqg/JpaXi0y40n7nFGdxkt3TXSQBmG26ahCvAsakIqmJBDKaF
	 zatY/TaA4p5FrVem1YE8003Ey057jVVG4uA975eRRomMNSUc7Xf/dAjMWRrIDRP4diA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2KtIZVB;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22680606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22680606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2KtIZVB
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso336350066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793288982; x=1793893782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
        b=y2KtIZVBXtmEzm9KYq10is51yoTw2GIuRE3BfODGCqJBgLFAABS/s3IRpKGSZ6mac4
         4PgDjfCDYP9pQTkCT+pA5MmplPx6MILiJ2tWeOUVLPnqgPZbrFQPP0pkgPr80YCI4TfC
         WYGNyfMVMpzS+ZFqxQ+Ec6IYWAw+K8DzAvADEdvoM4lHZEOGSKdCCeq77fF2DL93h2zD
         PGgEoEQDm1axADypCf0Gqic0C9Xy+iwvJ4CjrhqSV5w27ATAT5suICLAp0KCj4YKNi91
         SgUORdM2cB/nXVPmXDwKtLKdO4TQ0jxAoMMlVJ0VMqjBUMZZe/VskxGYJDptGuMrho8C
         pUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288982; x=1793893782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
        b=W5s8AE2MtD8uap/fEH48SNmddgfcv4o6EZQx6n6EHIRmvNzpuEUmtgF/Jwqdxhn/kz
         3rysHHvHMEUWKccau64cctg02gPrbSTJwn2JkwzNZwgWLOYEcma5Ew/JoPmyxQNi74UW
         Ox7rYdqp/GyCtdTfqclMw5I9X8Y5n4ggcitbHbvCA+sQYEU6fDd9xzRC9qD5zykYkDp8
         ifv5b3PPWZqe4kqgPiNSvZPCbUEG8mJrEF9MwYtrZUjIlKNxsqLLV7bb0hjmQynop6A3
         wQjgn+CCEP6yS/QBBCES+t1WWqwh4ZWEq2JQDwI+vpD0pLMCC7mgiPDK+pd7hfMrXgml
         V83g==
X-Forwarded-Encrypted: i=1; AKwUvBxDvhnaVvY/wIcsp4L0Ngi2nXQrLcAy308QBrL9HO8Uo0w4bufVry8btY8QepN78850UckOQFsu3ujJn9d6@vger.kernel.org
X-Gm-Message-State: AFq9FYIoW2kwEp1MBsFZhgNmSD5zdN2xoiLSB10t/SjiWlI+X8SakU5f
	px5CKm4RPzb3uaVIZHNyHz4Itd0RVBLh38bc/aRlwjGrtCbt9Arni360HMaimJhzPBU=
X-Gm-Gg: AYBFou3++9nAV6/7X4Vpsu0W96YaT7xVt9RT5eDswTi6lx4h9ERwbSbofWLT50S/Zof
	wBIxNNT61hRfJ01zxB8LqyXJRYr6Lg5XegWkquB3EcOtFfPoTxkirMBQ7rC1CuqflMHoLh9Ft0B
	5hp2GcgBsPprhNSavw5orW5V45iikDRbYTmRRwV6gj662mkm5b/0aEtsTJ682lhG9VfTDnD+GwB
	nmuH2xjsozMblpFwjqKfG0NZlJfo7/c1UcExz93/3ZcLtfDbieV+tfiw6yujx7mMgrNmGUZ5YBg
	DhQxU2CV+f1avcFBejgV47DH0f7LysdcEooUTpdTJF9aUq3D7H8pWmZh+u34cK+0KLQ1y246Cfy
	4W9J97v2URZeKh8dpbtx+RpiXzxglyD78xpF38Cm9XVztri4Blq9mfkciLBZZXs6ueSpszeDf0K
	DP99XGGjnNbuv0C7KAupFE7fcPGYxk2HjITEegDayPQSsSkgWjwvVcuV1JB1v0UCkGdszUEnlV3
	FnOqYPtL2ybkPRPPkVzhXnQ5FNffZ6DyR8tcWazMDqvQsJEL0nG/R6BlOrhKLucbdUpEDBNLCqY
	K/G++v3lidN6sv+7V2WKAbKEz+6GzQehDaeg/DSE
X-Received: by 2002:a17:906:7312:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c49bdf7a5c4mr522279766b.43.1793288982497;
        Thu, 29 Oct 2026 08:49:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca264d484sm7985666b.27.2026.10.29.08.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:49:41 -0700 (PDT)
Message-ID: <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Date: Thu, 29 Oct 2026 15:49:41 +0000
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 15:46, Loic Poulain wrote:
>> Is this something that should also be tied to frame_sync_en?
>>
>> Also, just thinking out loud, are there cases where we'd want to
>> toggle this dynamically at runtime based on any V4L2 configuration or
>> pipeline path? For example, should it be enabled for the pixel path
>> but disabled for RDI?
> Obviously, if userspace subscribes to the related framesync event, we
> should enable it regardless.

That's the behaviour already :)

Again though we want SOF so that we can drive seqno which really 
_should_ come from the CSID signal not from buf_done() *

---
bod
