Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697232E6116
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595212; cv=none; b=mwHnT0rxBOGTVt1Snpdv/bwIM0afE/h9LL18dmkNBcBprBi3woAtLOZsczgVOS9zsMkzztKDluTSHC9QYfclu0GFZ2sxtrq80S0CWOctHOI2ItefhYTGkzmsvuFSnjLZ5TvvFL7aCOBQ2Kf3JEeemNTZUVxMFoTHnBjW32oMGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595212; c=relaxed/simple;
	bh=sGDq596Ovv6LR3XKa7fiXXFjU5SI8CRjK3EmOFCri94=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UtqN5eM4Vev3Volks6kXLdSzyAIuqpw8FWr94P+/jQygrjsbGAcAv7pR3hZevVMaDZX5yfYnIhkjtLJgi/fSjwd3VjZBEi5ThyhhR32kSKtjRL7HctMXzYC2RLfU4zE8hNY1RtkNB3MjruufKJaN6i1OkEWACVOVaZPU2Y8u5aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MraJaKJA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MraJaKJA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4957eefd361so4681955e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785595209; x=1786200009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGDq596Ovv6LR3XKa7fiXXFjU5SI8CRjK3EmOFCri94=;
        b=MraJaKJArKLE0UABmi3vpP+qu//EMW0tA5iUFghservfasAEayQ1CmPQxLUYAdqfVe
         84kV1bjuncLLDl4Ura37T3IgsHn6M0StLDx4jkDZtUcbVMWpgp7r2ojOfDOueR3tfez4
         iyrK6vNz7xrqExMZDzB8bjmYJdwzn5MaQGVYAkgXwDyoeKYTSSMYG2g0SBHpoi2AVyJi
         McJmW/Cm4X5HKbydUURUhhAuK/p8JvgV/Wu/Nxdz1+89JijxMX6FMZZbVUFW5Oq237Dc
         ahqzBtCWnFJ318IZXxajP2mspcyryPn54GU9dDYOOayi+lpfpJxEVgwHiHXFWbnhmPz/
         00Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595209; x=1786200009;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGDq596Ovv6LR3XKa7fiXXFjU5SI8CRjK3EmOFCri94=;
        b=pbnpr3kukbzjTlme9Pt5XTipBuTvctMK4zGkDq2Z5vOH5f4KvJgoP38f7aVss++DN8
         vyYooMZJ9mdc02RGoL6dOFfDMHatmBV7iQJiBtoZU2X7RmBlzE/Rq4Jwt38LhKmDI2Uu
         CfIjhX4EnRqHDwpcwjG2GaNh28dgqwH7x1Kh2ZAwh3s7YAgJZnhUPBYq8RNqCzs1v+sj
         lk+RB4kKJwHipWITNmRt54xffD2xMdY8TE1A5Qf2SZp2drDHSbu0WPCZddbDTzvogzx+
         9OjYuS+OG2pAhIrxHBi1aiZMMMlDqZhxzF/hk8bvna6bgZZDyeieVnCkMHw+w81LKlAh
         MoSg==
X-Gm-Message-State: AOJu0Ywcezef+MVAFLR2CP8LReqHKRW6Crwu6RldvLuq8aGsrxesv/j/
	BbUCs0IRhU3A96wTftkHjKvr4wjHPsRA3iiN4vFbEzRh6UIx3uHF+qKb
X-Gm-Gg: AR+sD11or+JRk5m8MZaVylQZ1zqt1EP4UtaA6mhJDFN0/Ndo9iU12wSlakS4Hj+CCfz
	nRut/Zl4RgtNqg+nc0PKoVJ4a7eIyr9JppXnahjValgzaSqwRmv0FjKtL/RjbdrmWQKPgewYoux
	llaTmPMrA4XMCUXERCGuIcM5qaGCMeKMZmkg4mfoQjGDN6KIc+F5NwcxGs62CEwbpFLki6jIeTI
	0iwq0sTDuIRnCPxtdO0ZRN5ZtIyvHamHb1CIPLg/hoXfISHuGFHa9SzUiBGfOcMGgBpCI0sZm/2
	IomN94bs/13dnklFd33Fe+6ErZPBCG9Y3MxsiU2x8gpcDPVrgEbQxJjguLobd6piHsQcui9zrEi
	lI6MN8T8VjGwDncbHZwi7ML94kRchYSv0evn/cANeYM8MTi8vaYyHUN0neRUp6R+AixX7NCPxSe
	DjAyH6wL9HprVb4QKDl5BeeBkqKPzoBbGCCZfoQg6jep3vzjs/cuTSNBU4jelKpEv1
X-Received: by 2002:a05:600c:c4a3:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4980c64b5c2mr44983635e9.8.1785595209415;
        Sat, 01 Aug 2026 07:40:09 -0700 (PDT)
Received: from [172.23.0.7] ([64.188.68.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm97739755e9.13.2026.08.01.07.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:40:09 -0700 (PDT)
From: Neko <nekodevelopper@gmail.com>
X-Google-Original-From: Neko <neko@altlinux.org>
Message-ID: <0e1a65ba-68a9-4517-8050-87f0eb9f8a86@altlinux.org>
Date: Sat, 1 Aug 2026 17:40:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra
 wide camera support
To: Danila Tikhonov <danila@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Achill Gilgenast <achill@achill.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801143125.267054-1-danila@mainlining.org>
 <20260801143125.267054-3-danila@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260801143125.267054-3-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/1/26 5:31 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the ultra wide camera
> (Samsung S5KJN1), connected to CSIPHY 2.

Tested-by: Vasiliy Doylov <neko@altlinux.org>

