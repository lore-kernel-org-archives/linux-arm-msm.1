Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88487471D18
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806262; cv=none; b=m4nrGkM2WdFjB115LDxh6tUCBj+/miC6CCeOrwvk1eQSApuBLvUJrDoN07G1VGZwlRNWDisehiOQFw4FgTm/m8rbfvxduIxMjJylVFTN3oUNgfiJOGP+f8OhbLmk4unYJl1DDkHzCiSPVxP5kTaCOzeVUZiYBW1TFLi7g0iIKVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806262; c=relaxed/simple;
	bh=4f55Wmue7rWVrMQRu5qQEvu454CL76w82D8Y6+yNhCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlHYg13HfxMVkJlUZ7bjlSmrKsJJZLrFX89gJSZydskjGvdjGmno9eQ1hidNHswCdQA0A2aMCp4CAfwhY5H16QzSFXMcHGUaRVoajWYqsnsbSrqaPcgFxM8sBcDjxad/WycRYykuUwek5zDdyKYymqsA9d2SlfvvA9Mwj4uS/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoxLwpOT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoxLwpOT"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aebe49b227so216968e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784806256; x=1785411056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vv6vUno4qgjTH+OYVVQNA1sqBXT8T8DDiSHLEOwcpLY=;
        b=KoxLwpOTR7M6n4IXU2LzutfxjZ9i3iqCb8PNkiGwMB6YySaG0azcP81WFRQrvXQdij
         L85G0eorO+wD3QJPrRSU4moDsu0liyddHNUz+8gPOhU6s88Q7aci7L5eXvaOxzwu5xue
         7sNroJOL4ZZ92vBd6Yv21E7oBqFf2hN8bd4pOm/jRbYHCoMuCwOGcF7jepLebzhZwBZ6
         xyhv9kfcyKL5jqkPdZs5dAHBe5flldCMAXtWsoQKdp99EvUdxtRj/vBFbxkVTAmZsKA7
         khd0NILSFpJWdrlzDAQpDfCUK3HTaGjX4K8SZkG2FEjSjMIu2bE/fE1VSjJu0XL95TSM
         X1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806256; x=1785411056;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vv6vUno4qgjTH+OYVVQNA1sqBXT8T8DDiSHLEOwcpLY=;
        b=XyrVt6kHEpjDvn708FF8UeZ4DbGYZw7VZmcZBWiPpzaD6dGoIrASh4bkjukn+ddpmO
         VQ6f5zstk16wFp3JNItNz1E2bdxE7MiHukkfdohU/UejRVQYj/1PxYfgkWk7eKtdfdQy
         s2eGxeh0s5x8KfhU7DF+ZQ8wUb0c5Vb3E/ljvFh0eZtX3XC6q1VyDUauZJvA/m+VIOZ8
         YO57GhoNl8r8TTDehT/M6b/KxzQlEUn2FZgh4rJ2VnDvL8D/qqt9Zxi2OaxELBOGdF6O
         MsQz7rJlvsUAn/VCDpWT7o0kLpTJBY0WCAtkYBF/O2sf7n8m19rpBZ72Rj3mn+tq2k52
         avPw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4D5AfKUWm6T6FxE/5gYRqd4lEcXpQ2O3Mv7jpooVunpfFy+fPpsRS56p6+9tOd3QmK3lxIWeBL3IDVHjg@vger.kernel.org
X-Gm-Message-State: AOJu0YxdK9lF9KtA4BAGqZCOHsxD/ClbOv6evKIBLws3CW50gA5gWRlQ
	qrJa/qJ8W0guF3V7JSmr6PFRiK5q2dJRG/rH8lo2SblMkJVg9GvPCemFuZ7ul86/aJw=
X-Gm-Gg: AR+sD13XJI0ik5HVlQwRMyZVtzdQ4Ax6QJkz601f6BOKW11yYYKwx+9bjDKU7dms3/d
	eO/Dzw6rGdFeemt+SBxcAhWxC9Xo0JftdOIE1PxLRloD167iT1r+qH0bZxBjZVCX2b9XG2soK68
	EC2SuAxNZFtEs8aPIOCZ3qSEJhPcl2fIvsV81wuOxr6EURsXU8FnplMIWVjxSNWap5eA4xwD6Db
	ZAjF0LRZ4xF0IaqqyYjABHFk4RcGK3aQOc8R28WSbBz0i5mbk/NUyShomTSRyF4bxmTLiltKRBw
	6PxoNwIKlPUIMy1exe030JLDw/ttxIEYT9Wl5VeK2wM+qUvYGxhxWqMhsYqFk/NCwC1MHSQlJ7V
	KMMrRkMzF8sZIYWEMMMY2Uiao00XCYltXBxeZKN7qyXpAp1cbKYBiGrkI8h7DxRsnktwxeNymgk
	/f9ACk0UWDQulsuoVDxeGNbbKT3cBUwvyfgv7ZjqwJ1f3LhUtNAcy4HZAk
X-Received: by 2002:a05:651c:1993:b0:39c:67c4:4eb0 with SMTP id 38308e7fff4ca-39f15170d72mr136651fa.8.1784806256225;
        Thu, 23 Jul 2026 04:30:56 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68885a0sm9745521fa.3.2026.07.23.04.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:30:55 -0700 (PDT)
Message-ID: <d4dec9ad-0cd6-4666-bdb5-11daa00226c4@linaro.org>
Date: Thu, 23 Jul 2026 14:30:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource
 table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
 <20260723110952.55597-2-johannes.goede@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260723110952.55597-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:09, Hans de Goede wrote:
> The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
> icc resource table and qcs8300_resources already uses the sa8775p resources
> for most things.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
