Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156DF41D637
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229928; cv=none; b=nrMsXZq/330ohUxa4kg7EMHxP7T28ATcdxc6mSmM9ASP2veNY7xNKpceVuvGtKusSJH8yM32ayUXY7wLtLJ5M9PesghUyf0YT/pwIoKjkkgyJMvQqGmo7SLvOigIZbmfKt4lU9j4XbXma1mv7t5V0Qg5zHjYuvnFxXioxr9xDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229928; c=relaxed/simple;
	bh=kgErTsufV9ATBvVYA8GXFM3ncLv44xFl+o0icwsDL4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USAjueLeH8iON6IYEr4DHSlw+xSL77hwDonPkMnUjIxlrwLHR8476itVEG3HFkJdP/vewCIz/TB5yNvYQdHOoka3QNWgiNTgPEepRWF8lppVG36KkxjxU6uUbS82+y6jiws/DtVo13VYHyzoziZW5vX4pZh7+H8DGDvIwq8/f3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNiSA9ok; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNiSA9ok"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so2438017f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785229925; x=1785834725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acK9/eCNX6tWAojgJUr92sgI64va36twFoTe50cAbqs=;
        b=SNiSA9ok6B9SVibXBAeCg6/xdj5UK65PEVhfUcwOefBRkWp9/APPau/+x/eEOFB5HH
         iLpSLe9aL6NVAA+tODClnu+/8xjK/+IVdjnTRhV1SOs3UFTEHwsk795ymeuA9KYLhDXi
         3xya/t4/AofW5iraZur8l+phEG+O2RsY/EkNDlPrfCOWWxpdzLc4Z/oVOrBIjC3MuRUd
         gqfNVod8DndBxn0aVtpsDoG4qPz0J8Nkd/a8sKcbCYiJOf3ihq3ddwgR4cS70pTjnDid
         N0yCEt0l7IeFwEfWWGUrFvc64gidd5WGQgyf3WDfdYCF6fsp11W64FewQMgh32l31jIb
         Tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229925; x=1785834725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acK9/eCNX6tWAojgJUr92sgI64va36twFoTe50cAbqs=;
        b=YNjFfZ8Kv8gCRBYwOUzPr4fR0Cvu5Ksfypx1SJjK4QkSuJp+s6ab+8g55sqiZY3dyj
         Juoozhk8eSJQgiEJJnvG20z+36PBc3iTsYfOYKnVfeNYIpsAl3k+bePqcu6KCEkb6kGe
         n4af5i7S1Gw9C4AOzSDz52HkgN/4ifQCNAsyh6eY2KNXSlTN6uur4tdVSzekb1wzBjuV
         DOSEk252WuhRdGFAyJqG6N6ViQ/3KP6ORIxkv0rR6mBnKeRg3T0t9ObzI9qcJMrJrMJw
         6Ogfg0AVYvyE1dF3sBNRK4OhJHyhEMs18bKnGcrtfe4BXB5TvSClUx9+MzIvevMkopLf
         6h5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXdtKPSxQ9BFKEE0oD9nMwfZCd2VcG8J1kktUbbC8DDSTt1nn1vICXSxl4S5Gx2anuNB11xtVbtYMhnHVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyWs+cInQB+SDktDDUlTlaYt4g585IEst+kFHVvPomjjz6viuVZ
	mLj94xd50aHZql+pkWQkAy0lPCqaqdNp3bsYW5921kpAYVE9mYmzorTJanOfTuyPsng=
X-Gm-Gg: AR+sD1033Hvt3GV8UI/81DPydk3gfOqNlYfz5S5z534gM5I+YohurxqFmToxWAYZlQW
	TMkc7jgjPNfif1epKAORNAVgCU6wxFfT4wmA8Ch6SVCr7NFrVJHtQK4wpbJp9btaVxn80QZl5YD
	CWKm7hyWuJf02cE7qTBRrTjs27py0iWLSCQj2KSBoSfMfPZYMgW3HoCHzpwMMf2MBUFZZ8lVG6D
	Chn9y4FS2Ebl/CeS1kiWG42/tsbxvb5pcxTVMHibdsBY85IoTrUBVeGPRjdNpL4UI3QD154pyhh
	cpVVeDvqr2MaRtMnwG1tKNl28+GWjkP7A4GjnH/sSZLTlQg0XEb3P6tHu/jsfmDTtHv3ayOXmwN
	9vdSfJe+uirulh3VJnvT4hjPuMDzIRS8VkCc2arJ0Im2CC/XWOZN+dUpC3H3g8v7A+oBTYEWihg
	eAatGNjdFDfCBDCL59Z0V+YUK6
X-Received: by 2002:a5d:5f83:0:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-47fb1edb552mr1578570f8f.22.1785229925096;
        Tue, 28 Jul 2026 02:12:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm59809618f8f.31.2026.07.28.02.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:12:04 -0700 (PDT)
Message-ID: <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Date: Tue, 28 Jul 2026 10:12:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 09:25, Atanas Filipov wrote:
> +
> +        power-domains = <&camcc TITAN_TOP_GDSC>;
> +

I'd expect to see MMCX and MXC in this list.

---
bod
