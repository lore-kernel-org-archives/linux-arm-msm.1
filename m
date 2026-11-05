Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871876;
	b=M/HM7SNA+C5/nvkXaNB4Svw9qaT0213utZuRyBVq8iGdkR+jmQLNw2XaFLv1Pu5sLqvU
	 WM/acqhk3saNXbdeINCoAh8sW8E33JKsEKXPr62aI6OGLKVJJpgl2Yx7MLVaWS9lYDXVU
	 jHtANgZ2kcxWnKn7Vmme3gVVxz+njwI9iChAIdHFbiEe0UF2E1e+eFFf9+3QrSJ8lRHeX
	 2B/SMCQoc9djcb9v7ZEEVvCy4ta5kJSAQYIQPjZUo7sz+GQkabUi7I1YOCZ3kIaaEt4MZ
	 Cbt2YiQtIK6/Tb7Kg0qLW8mljptfp8NC/6xSukNF5v5Gwyqonroyd3z/Drv+2VN7Zmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
	b=qcrVbEhL3Fu0l4n3h6wWCoBYmdN7010447y6gpER9G9YnJXY0Rtd0PdmssgRrKvMN5Bd
	 Q9Pf4wpft9CxzVrxje25oAlhnPh02iVOhDTs8+ZyWFJlifXIaBocq92Cuy/Mp6k8d5AJG
	 3sTAEXElUovPMxEEmIImo5roNIh1UGDGKSZg9GFrh80NG72+2Mud5Y6y1ycUgqlD0QXav
	 QzM6AQgqhufwHM5RASLadbSvzIua3SofoTHktNVWUoY2Dmfk2SJ0w26gU7Q5TwmS+ZgR4
	 2HqSt9Ez7LjyhC/PeOeru6DoNI1vElbKcdEAgiueyxtet7i3c+MLphXn/OfwXUR83mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRkOqEU4;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF316606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF316606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRkOqEU4
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so1288381f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793871874; x=1794476674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
        b=tRkOqEU4xOzE7XVrSahnzZw+u+Bg+xLCpTkl91fr/FbW0pcnhNr9FAx3T+l1yNJqNY
         wtu4o+HNeSsr3GQ9Y4PIY2gJ0iNQSyc3FVJoDgC1M37qnJzbxCySN/8cUiR9s2Va+DBk
         KosHb7H0Cxd5RsHmRdULYyyBcbwoEqsLCzSl0vH+p4RN3/7gmRXOBbwpaAHG0uHWyxcL
         +MqGCI7/uKRT1akFropCNXnuEd072gwImdusnSv2T2vu1tM8gCeH10HLraP/JALreFzu
         y1Dy1i3xxfUDA/QuIkMRBtbFdAOM4gqDbju3s3PkxsA4RoiBUjUP+k+eHki80E+TxhiH
         8KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871874; x=1794476674;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
        b=XfLlX8aSngc+PbgnIM7S+i/3W1DeMRyU+In6rk9Nn0RZtN5RHRMP9FftltlXtmE3jy
         oGXGwZcwwz4eKnsFvM0QLzDPhJtsTtb20LaiEQ25HW/PUh9fS4Dfo0Sowsb5FWPWuXKD
         XggZQUN5bY3wNmvUaRHF5/gHntesKgU+zWQ6njgp1kHskyXZ5ef1lEg68Fv48fahk2Mn
         c0aEfc3ZoZXgA7MzZQJgk590D7SoCYzvfYDBzTw5dAZ6O3XlYwC4B0AF23Y7vS4mLefD
         Bn1lkyeHFkP5nSyid3NBf7U+Q66tA5YDqG/Jt+SkLurxy5kzu7s5eswgAqX84m2bha8i
         +W9A==
X-Gm-Message-State: APuU4Z+XYXGuG6GbyALry7DalG/NLyAScYGBModeFL7dWAZMmgQvBY01
	vTYJyjW9oL2h2FuL1EjuNTO/2ANE0p0DWmKy6IG/iN3ZBrFZbf0w3m7yAcskX92Zb5Y=
X-Gm-Gg: AYBFou1t8iTLt5u/VXbxyDHtqXM/Zq4H/qVyGla5qnrxIJG1Cs5fK8gV3fJIufyQ0fS
	h9S2uEloT6+Nd8uaUEtdGyNGFf8Hm1zoQb3uNv+mwFDfTBePJlaHhh92PjiMPSas1/KHhE4E3T5
	/+l3gSyi+VAxxsjiv6oMH3YhsntWRr75W7FyzMMcbLrAv+Ugptvx13oSyFTmxmCVwkXsyzZA13w
	gE1UKK6A0nIN8So5aWk8xiXANeHQWvqWZ1gYUhpEy7u6iQbGFHYZ87pctJ+6ZXcIpQwA+XLH2e5
	5Qin4RA2d0W3n5jybHaPzCqZ5OwLR5mD31t85dNHBS5vdVaDAvuZNt9Islr1lzlmROW5AVO285l
	8tqiOknsdk7XNfRWf2+lQYe6lzqbnpzoTno3unp0s/2bQSIIcWBObLR9l/LoxTyg8W/MmaLlURW
	F4jLMgM5NGIpUMTa4idp/+b5vIL1I+JSjVVqtNuGj7t2MQTxOlEo/dlorFzHPts2CQGJtBu3XIY
	cBliK7u+UlOud2/8sGhDNdUSEUOx3foFGukeOIk2ocSz9zRvx5lQ7C308aKp+NsRR/yW9xNpTEy
	FslqNK3/qsDf4Vzf1HTKC44Q9tESVbOz9H3X2z0j
X-Received: by 2002:a05:6000:2997:10b0:48e:5e63:bd23 with SMTP id ffacd0b85a97d-48e6e2ef96fmr29363335f8f.30.1793871874143;
        Thu, 05 Nov 2026 01:44:34 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm8628740f8f.10.2026.11.05.01.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:44:33 -0800 (PST)
Message-ID: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
Date: Thu, 5 Nov 2026 09:44:32 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.

That's odd. sm8150 and sm8250 are proximate both seven nanometers 
sc8280xp is five nanometers.

PHYs are about converting the analog to the digital domain and so 
process geometery - ends up making a difference.

You can get the PHY init sequences here:

drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
├── cam_csiphy_core.c
├── cam_csiphy_soc.c
├── cam_csiphy_dev.h
└── include/
     ├── cam_csiphy_1_0_hwreg.h    sdm845
     ├── cam_csiphy_1_1_hwreg.h    sm8150
     ├── cam_csiphy_1_2_hwreg.h    sm7150
     └── cam_csiphy_1_2_1_hwreg.h  kona/sm8250

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_1_hwreg.h?ref_type=tags

So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.

Hmm so much for my understanding of how dependant on process node these 
sequences really are.. perhaps the PHYs area fully synthesizable in RTL, 
probably.

Anyway.

The one thing to do here is to please _verify_ what's upstream now 
against the tag provided there.

If there is a divergence then we need to upstream a 8150 compliant version.

...

Actually its fine, did the verification for you, the 1.1 init sequence 
as is upstream is fine.

Just please tidy up the ordering of the 8150 switches.

---
bod
