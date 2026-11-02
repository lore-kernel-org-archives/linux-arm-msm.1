Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634914;
	b=O+6oHAtoHJ342O2Hx9a6bqEFwZKHuiLIAQwsa7pHklpCbpgzFMCkFh3+qEjwYIQpapQq
	 13H0OjhXorUWWa391tretL6b2tXew/YP61vRDw8J9ht0ENYBM4iVymtyir4rcf6FBZ9H6
	 xHUl2gT9Pgioi4YeJpR6XoaRZhXH0ujlIe1wi5pfSf9pb8mKcDeqpHcJf5FktkJ9yhxxB
	 ZUYlsK7AKVFRIw+hgtH0hijaoldMNu7BA8x3LY8W//K9NgXfoLrIrONZIDCnGTzqt11b/
	 azyLYihWnuK1DnN3X2CxXydy0bwFSok0MizM3HI4mKGDpmbCuLCY0qP/I3mEsG4UD9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
	b=R8+zMOtdqeY5JRye8s1tmHxSP0V/tjcHZF7HIZw2h47UFqVo/Kmf9Znm9pSelLs+BLeq
	 bn4aWqfM8Pu8a/NWWWhbCHrBXLt3H2rNDT2V8Wh0D0JnnWEFTaj74NKTRQGF9zI18LaXa
	 JxeZA1XftL3MyEDJ6LMcp7pdf7sPrdSa6r+vEpMsNX5JoK7ZRAS6+wgjl64G/p6QxpTRC
	 6LFiUKQx9lbunXg+UuIu9/ax5V6/Ky9GmLm6Nm3drggsAF3skw9Z9B+TMFkXPbrcMajP6
	 ohhMzOhf9aJMXRmWdyBxzREAAuEIlvQhQl7yPZzeX3UOMMPHHMHMvzg8F5kgeUrHsZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWtwP4GX;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB9606A59C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEB9606A59C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWtwP4GX
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1520845f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793634913; x=1794239713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
        b=sWtwP4GXKcc2Ozz0E2dWGFsv9rAtaX5GwXibv7HKepT7gosyKMFZSfc79jRgSpaz1T
         q2VVB8bKk+kB9i+NCbx9Lz4P2zO6zqTVK6XTzKOv6lmTAfhph0pfD0FJPS9mNIdqkdg8
         lX1xW1UUt2D6UH04WmZQK5uvitFNuCM6XMbJUcpbiu13uJ1NIn+rV3zMRwbwvGkb8PpX
         az6QSoLD+x0/PT4OX9paEPH/xv11i7/SgqcfwSAK0xql7NEdf88RP/BcHql7oECQ/RzY
         hicO5p6iZbMI0+Lb03dGGl8J9F88kKN0NIxEt0XsJq3aexaha8AY/NEqt+nKDlFSMIdG
         JTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634913; x=1794239713;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
        b=0O2rIB7eayoehm7Es6bUDw3AkXYCuvA5Cu6Zhfufh8bvrmeEbBlOmnaLVLrR4A+2dt
         9RQMKqmFNjAdEiO2VnGP3kXX6sDgwwPOwfjO1np/R1rc3B5cr5H+5gZlAroMVdvEhcyD
         7gb16kHPNc9/B+uyHCoyBGRs4nD9z0a2y0LjERRr8P3xwuR+HnGRnAOLekQUVxQKWSpu
         67SlE53Iibf3qTPIMz/hez3LrOby8BHUxlhWnVBHIZ0IUfJvAAMM1Gop8BJ+pXNeAgYy
         9kG5ko6Ufg38bb+VtWM0uWNWSh5RzilUtH1wE+wt2xLjDjdyYQTuy7oYiu7pw3daYZ9r
         1ZGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4eAh56aqMBnCGl5CZRzj7RmeOJL5jTG0bvP1hCpugpQF17CtKK41itNfWk6Zpg6dFZanYPi1a2cYLaaXb@vger.kernel.org
X-Gm-Message-State: AFq9FYLLVV0D2031g+FA96Im0+LAxl0n9uqjlxGgYgoeEN664l9yKMwf
	mEZcdihq2M5g0jpH8waR2WSEZnzmW8+anBpy8v1hAWrq/ASZdfcz91BZ8aJsK9oz5/M=
X-Gm-Gg: AYBFou3MnKZfiEv6BRq0SD4IjVbZXm37rBG048wEYyvgFj4hVsgC4PUHb+I/fuku+Dk
	iztaDvadkXqaBcgAam6FQaelJftGLadsdm8VZLl9UW+6sC9qJ0cRkm8ZW9vqxKf6ccjCFsOKuPr
	zkNaXGtmO9uodOum1e/OJX2EhqWpr2F+lObAfjkXv3RaE2DUPGF8MDiNA0nxRb0FcQEpzYMz1rl
	6cSl0PjZ8w2Nv/ErWT7aXPb8KCpW+pFNTAAxg7/QPF0iALtlxuDvstFBiKtO1WMTmd+xK37BDTL
	XhXMzCYj6ZL+V+Iz5Ajsiv66Jv+bMeCGjNa3M3vwJxicuBt6OX8EoqDIgI6CHeDirmjhq9eNHxy
	oC5enGMfWQTXDt8OjAF/iNIKTJYhaGVJ2KAIj5IbooSf16lK2nnC1+RwXZT6xiSRFF+1DISRfQo
	LbZ22a5H0bM+IzIfYIE9HSIdr9b0XNf6xpdX0kYfD1ZwaUvWXz/U9WPzodN4KRvWvgQaMjywIUY
	kFsN8kez3TONn7zTCYHFxc5yH5Usr00G/PDn/Tnqi3IsAJyL4+ubjbrt2Jcjc/lJjlZQmYzp6NW
	lYeIPgI0EPMLNMfFsx/k2oZtwMycz6iJwLaNCbqw7yNhqzY9JonRU2WzoYM=
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr247111705e9.10.1793634912918;
        Mon, 02 Nov 2026 07:55:12 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm20300783f8f.8.2026.11.02.07.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:55:12 -0800 (PST)
Message-ID: <31115f24-054f-417f-8822-c39f3384097f@linaro.org>
Date: Mon, 2 Nov 2026 15:55:10 +0000
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
 <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
 <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 15:54, Bryan O'Donoghue wrote:
> 
> To be in-spece

*In spec
