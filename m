Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514278;
	b=ZUbSr+AyB6xK9NJKsjrkoRe5H9g24WGChahMchKzRVaOQatbilVtusxJEeMQelVHILdk
	 FML9E1HEq0nrwCUpT5ByPRhW4RlzvEWoIdUCJZg4KiDjm6Bs3yaIgjtem8HVaC4/yybyK
	 ZH9QZl5p61AJ5zjTlg/env5YbH/zENPL7/Z/zgMW7qC1cuMJn/MihdTDEGEP0YM1bGdpg
	 hDYfdoZTUaTIZjAGxNFqgvvaAYDBTIhgwftX5UyUUsVmd/tp82+V1xvKlFt9GNTWpXT6R
	 rIUH8Kd8vxlethuQUSFFpSIg8/ACyiFyVp1WrcNGEbSEzWuwXvrmR22x8XrE6xmnH2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
	b=L4J5oNKLCtZHZZIpXfH0dRuAKjMOUwXiph6jJcjB8GQ9dQK50RCcMyklKrPCSQtaYjT9
	 Z0zxbS27BGkNCGaZGpi+ZlZ8vgoR/E+0pF0P6pl5fzH+oRd2Q9HAhzevB69UiniD4wa13
	 6A354rwrkaZsdxmPYXBiS/c416+R1wrygv7mMz/Sf4/L1n6IT0heP/FIyN1Wox3bkdbrp
	 wi8ZMw+kUXNFJdFLsxZQOdxIan2SzcFTykFs5IVa0CDTUev51zPEos1ZPnFtHQfqClTRl
	 Iftnm1T/DiHxFOgc8TYd1cKzP0VUBys9IifEBjy0fw4kVhmsm6KLSf5pejxgFZJmJ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t5feP5FS;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6498606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6498606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t5feP5FS
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so3339312a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514276; x=1796119076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
        b=t5feP5FSqUeh4OUPpz/G2qREcYdQLeO7DmoP0KcDpNlxLW5YDVPbm/4Y+9l5pIfOLg
         VTJdJsniqfbvzKi32+gjtTylG+NLszNUoLK8grYIn7MZz/2KY/vNC4ikLKW3INcctV59
         MlDfs9WlBH8JxRd+ehnBXj6MaJ8bZhRyk38kNrlsopV9B0bit7eK6ORPlBo7IpMN8DlL
         n/qiTjcsvSQJuDp7OIdkYsVg/DnLTEg7M/S9v5ZG4wEJbXxoRaFKFfrT7EhT91u+EECX
         4wv3o1IfjbwfPggyiQFREhKZWgfch+xyo2W1f/GlGAtwzj93Gz4SVLOV52hIZtWrXdNx
         yQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514276; x=1796119076;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
        b=CTLEKW4xbAgHcsHG4E0VG6Pe1LUag//9ZTlDv0i4SZNN3N/zwrGPSMRft2lJhEIgL7
         G2S9+OprqNaa3/wxr4lDWYQyCQzZ3CEEsFu29FK67hMpw7fOentcsO4TAK+MRvU4Sa3y
         SMn2LBvD9uNYketuFjc16R5KU8Qn9SEMa5qEaM9zF8gvgPiqjHoRS1NV4No6wLqfAnWQ
         NPcs/YjWw067lvoN+NKaNTrYMGYeTcEIQp1WERKX9hfuwG9AG5A82PgfgLIAVeRPDrWq
         WhRvgnM5OWloFK8Jou4b6+KzLHyQlZNwhaUrj/WMq78xkxGW+bIbAvkk3RSl3sf0P1HO
         jebw==
X-Forwarded-Encrypted: i=1; AL+hErEtT9y2DtUhWZBnVJOkYvPg/MjLiP7qrFzRTr2/MKxoUzI5kOYZfWZ81H9o/hvQqW4hlm1qLZ2YKmDF+NzR@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ibfg9b8JOZ2eWhar32ihF6qZ2fbJVU67ZSq9pb+iiD3nc5MB4
	9hUalZAo2s5kaudaJFnsKWDXUswhwArd6naDS6OoOhki9gohJ7KstQjCiBkBCnsa76U=
X-Gm-Gg: AZFdTZcCc5ESElNrOCwK2Niij/lmRIczExcRCpDOAcebG4bdixF+KJXRD9XEKC7Liv5
	PUxvh5iBFfSpYuO20cuJBakn0JK2sSCPlXEre3nIcC5VY+zsJSrTNJIL9Rd2FJfR6THOd8wssaF
	LZa69xYUZaTzvmN6cY9C6PGeWEN4VSJkadTsKL+YVcqIZJlSPlo6CvnHsuRN2s0hYCYr4vDRdT+
	e0j6t8GmZlgOyYLLZl5b+7wSbsRhOU3AEpbuQ5vtajHiqXxmBoqAInjO6XNNYtmHmf9FjUWMSbs
	NFn0auAV9z+WGxE8OwqJz5XuYgBlnMspDT6iY0Kypv7yol0sqiV0wtLeDXiHLIzTddM0lEci9s0
	4VpBewiMvHJON41nXJwibF184TW6kshTHuWLZYDul9+QSp//WC3lsl6hMCna9d2oLlt5WOpWeGz
	eHfMf/IisEECTb30q8aSK07zKsSVLuEvyMlfgivYtdWcuF3gYt5pfMKdlXOHlsIrrlPtKib58Km
	8EFmRnBwrjlPJGtH5PKsMw3y1BifDoV21TmDABrVv+GhV7qGk3+kePgTi+VSQ1g+92lYJulnoKk
	4HqrvDgXzXYkVRIwutHfYduQvZoEL726UhsAOpysQXtCqHTIsVu12u86H0J7fful
X-Received: by 2002:a17:906:370b:b0:c51:34ae:dd7 with SMTP id a640c23a62f3a-c5134ae12d8mr835789566b.17.1795514276195;
        Tue, 24 Nov 2026 01:57:56 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm492806766b.80.2026.11.24.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:57:55 -0800 (PST)
Message-ID: <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
Date: Tue, 24 Nov 2026 09:57:54 +0000
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
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
> +{
> +	u32 lo, hi;
> +
> +	/*
> +	 * The pair is latched on SOF rather than counting, so it can be read
> +	 * one word at a time without tearing.
> +	 */
> +	lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
> +	hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
> +
> +	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
> +}
> +
>   static irqreturn_t csid_isr(int irq, void *dev)
>   {
>   	struct csid_device *csid = dev;
> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   		iface_val |= status;
>   
>   		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
> -			csid_sof_event(csid, i, 0);
> +			csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
>   	}

I think a callback in csid_sof_event() might be cleaner or some other 
way to not have to replicate all of __csid_sof_timestamp() for each CSI 
decoder.

---
bod
