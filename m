Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241B471268
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806282; cv=none; b=OECDZVt7+uy0+oZ4NXAqr5WrdXP/9oFdUFoTYc56N8/iXxXcDcSZFD3vwpnxpoR9gqKI8+Kv0bQBSwQEFpP6zlm2DpqhmOoDUfLixvQ/ssmNPrMvYI5EjwHIxvT8Hpyr6E0hMgTy1q95fWe+Oek0OZKTqnjhWYuyI5mKxfX2SyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806282; c=relaxed/simple;
	bh=ObWNXK3VJx/3xTZqQzKKlhSpfFWFGtxH9w5Top8hHrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib/SGBmItd2tT+MC5lOqqqeCScaRnTlmFFTE/Q5f4Qw7NJs2dtnKsK32OHVfN3ESCMdt7u01D9hVy/adUr54obmKlH603Kbmg3ktKjP+oNIdI/KdanhUDrOeN53HwykwQvf6h7Wvmr9ip++cbrbmcK3U7/xCxm7rjOKWcxTeTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TM66bAew; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TM66bAew"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c6b6c54b3so1043291fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784806278; x=1785411078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EFWUR72bAqyoXSmK1v8OhlBz/5Yc7QEf3J9VzYccieM=;
        b=TM66bAewR8MkEZ3gY/Ud9FMkdOZwa0Mw/AKGL2UuzED4YjwgfLFIc3jx6QcSwdgX6v
         O0GC0wAJtWEyD7HkFqZ/LXgkggNnJgJEgb9BpHx8hkb68KsqHeok46EVaOgm/ZtkCO1n
         NudKX2z8Rw3oCWUthsenC42dzFCgrvqLhVN0vO17rUlyFJiv0XPFkf2p3qENZ/gs7TQ7
         tn32EWz3/5We1j7WsHN6K9PRcbYh6pw1z0fI+DSjQ1Ko6EJTjMzeUw28GrNjwrFyzENs
         ofAmBO/KAawhx9vxAJUNsVWCAHM2NxU+8u0QryBNr6NCy3m6fBBmMqqirtnFCRMogo6s
         nWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806278; x=1785411078;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFWUR72bAqyoXSmK1v8OhlBz/5Yc7QEf3J9VzYccieM=;
        b=KxKcAMfq0n5/37Db4Y4sAac/nWHqOX3WswrXGnM+A3+esUxlWsQ5zcaa+FnrnvwixB
         0HpyDJmBscdmvEWfmIyzU5yZy5mQAcVRB2BWQ/t+2mNV4HR+AgUbgnnRyeH780ybG9mE
         +4MXlhxJ9Fv+0UkNjBjGRbGzr9D8/hxWj3i+mw7yjZTbc3Q5aOYiHfAxGbW6ZypEuGPv
         sJklpl6OB19Nk8M93INUoVB8djQslzH5n/rrUmByyIe27pWfwanZn8LBbpoLX0gf/Cou
         Bid8afcqUmpneaMquV3NQUfDD8RuMX09Pzhmx6J6748EtBarEN9SK4Wg0CRpo6jYYeG/
         oVkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLoGCv6k6L55cezKyO4bSJjfjeVyorWnDMib4d/QpZw9XFyyh+jO//AxVmy8NAXpv3GZHnZgRl6ko+TbRt@vger.kernel.org
X-Gm-Message-State: AOJu0YwAep+twzaIKOUOttqfAMNgrRNCMO4KD0Qr/6tISTjOqn8+tfM4
	f1Vie3bpGHtgg5autEaSuNnpQ7ZQDZ98TiVQdGOA8xCrT2flnoRNrwviKDeObz7NPS0=
X-Gm-Gg: AR+sD139pSoB6w6AA4F8ChInsEnyTnI94yyFLKuZh8jgA1/MwK/6FKoF2637h9weDgm
	xy0AppdCMN+sxI7Qy/cI1W/3895KsJR013Q7e59iIzK/XNn+MBhg1XY9scP58cAFCtVHht8NyfN
	TMWDDsrHM1sY6zfAwAixb9BNFcz2yk8NFWVqFAVvSsaQPY6hKowOZ4Lt4SR0lOh/ycKrCJzRfd1
	QhKTcn8QnUkr7MNI4b6NLXEaWihFFgs9c5MahpN/iR67imxOYoQRthQNFXP5ydfREha0ZKSEyMW
	PfoPbf7dJnMSdujcyp/MjL2fbHM0GY2FpYGkBlIADZG8JMBFCAb4CfwEMhNW+iYhzQSkqrAQ2Rh
	G6jZ/bjQ77Re8lmneWFVdlJ4aehNHikx9A6eUZYXeeLFgfYCwRmioxuD5n9AaxdFobGPpAq4aYL
	mmosAzk7WwJq3rGvbss3OVnUQJPm3Bevscdr2WLy/NCAHyHt7E97xssIQy
X-Received: by 2002:a05:651c:b22:b0:39c:6b1d:4569 with SMTP id 38308e7fff4ca-39f150ae0d5mr150241fa.4.1784806277877;
        Thu, 23 Jul 2026 04:31:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d558d5sm9492781fa.30.2026.07.23.04.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:31:15 -0700 (PDT)
Message-ID: <a2729b8c-5e03-43f8-bd76-5dbd47c8816f@linaro.org>
Date: Thu, 23 Jul 2026 14:31:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: qcom: camss: Drop csiphy_res_8300 phy
 resource table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
 <20260723110952.55597-3-johannes.goede@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260723110952.55597-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:09, Hans de Goede wrote:
> The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
> info and use csiphy_res_8775p[] for the qcs8300_resources.
> 
> The only difference is that the qcs8300 has 3 phys vs 4 phys for
> the sa8775p, so explicitly set csiphy_num to 3 rather then using
> ARRAY_SIZE().
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
