Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834180;
	b=F/NFr7JhIxJT9e2MC9IEjALNHr9zG0EqY99r+t/7Ojtdwozp4YtQoWxNoVAKYGuOi68f
	 h+F2rTNa6eTm+YOcwtoWNUKBMC4SLbY/pCrEBa9gImsK5KoKgcl1BzrYco6NXX//hZgoV
	 mnCHG3l4+5l9dPYb3JJJm2ME+WDrJojkE0XN52xEOaRCQ+uknrTYn7IdrganzvtHy+eY9
	 HTLDJ6sFGy6A/S9Xg9ONEWS9qtNh1WVdu0Ufcv/QM+Mj3xCZpksX/1du3I1quLezhaOBx
	 60m8fPRd1mxCmBSLLMfoGrKzsfNZMBHntnmWABcmF90/Nyjwa7pN0+SFwKl+do6f2cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
	b=FparnKu1Amsf77ApyCVgEkOK1WdnxBjpdu0UXZbdcpgOoSWb50S1mRcHIk6kf+IdyRVN
	 eCzLkStFl4caCty7bfcEPSEjFeFQ8fPXk6Bj5G2icy/vGdlpX6M1/dphl0gWz6dSNn3+q
	 fPH0sCGGzCB4ypXN8jJ7/suIH6aG0ZeGCnxkWM5hprirLyice3bIqsSqt3BBVjCZogPrX
	 K6Bdy2QOKBqozWuaQ0ht/P3iEihEyckh5/vQi1kXOuMB+XsKtJWfdZE/fgTsqyL/9ozvs
	 odyfd+j61vwgz4fVLqMQ7JCktBl2q8g2KE274bI1MPpmEL0/mAMJHccZI3v8p2eUsGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A15606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A15606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acd263d530so2339151fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793834178; x=1794438978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=MaYfUrSxNAlGHW/moCDpL5dx1KkBp8SvB1mgsR5RSl3YCfz5pCNFJbBf95jzougjqY
         3K4uhPqKWhwHat31Ew6snmPNkN226ndz+bHT3x4mViR/RCa0pNpli+Sfj6yN+SeiNjYK
         lpY2CwrLM3kleG8LY9Qehd92WyD0u4NVaFktuJaXrf9FWYkRkUAE9P2A/W5lM95uAEFi
         hrH8ohl5VS2MRP5wz7D6Jq2bWrtcU0u0+xfkSKTFALPKSsH0aZK2BwRVMt2XPQJw8vor
         9icmWQSGsHKjuzumqm+SnEE+qUUbtVXw96HJ+WRwpmlQahi+iSWSCXss5UQ0zNKRhFST
         +3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834178; x=1794438978;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=VHP4B5bN4fV9q01Fz9F2xPpiaW/AOLUFD22+kJh63ftX0BPcq0h5OYmkU7zYrqQTh1
         JVBYB2Ool3LXBmYMOIFr0I5L+jt4TIo63XsuLm0ZsZBtrHvEfK/LtF+CHG4gXd3wLi1M
         1g7t9ApRml7+EVsR/ByT4cZQzXrNl/u1FqVU9MEcBZJa7XEcSRswnE9zEv6yoohxqcpa
         kHFYNNEKMtba9DiEgjHJgpGMu+tTk274KgMsZPSoIXLJbcGCX634xrfCB4Rfq9UGL75M
         4fXN1HmvzxzLedEmCYBp+/bH0+Pne/dC7AeRShtAN5xbBMx4Fp4VbRFBMHtsP4CkrRod
         xykA==
X-Gm-Message-State: APuU4Z/krWsRCJxOXqda+nR6lphE1RTcz2DFinjVkcV96IsbbnIrnLH8
	AEYAqsh1U1a5a894UTMLGx/ulG0ixwjHGVKLKkVpHxe1LeOHVJ1rm4YpQNwsFQzZ09g=
X-Gm-Gg: AYBFou0LdSiyD36nRhOYxP7P3ihdHV/TV/A4Rpt/ktkVGGrMyn1ayTpJFaA5e7G7+Rw
	0KQu1drdHHp65+gglyF9Ghh81igCiv5TnoaVoc6rMOVH74JCEW/wMns4li2JDYang0rC+wJUUXS
	tIz6Y7TsXLJnjvY5n4nEjppBlodwY2fZ0oXqgW5lD8apgsYPKdtuOC5BRfihHuAJ9/wjj9mTclz
	IFuKibxY5bwmyVIMLNBuIQieao4l8FI5KPi4vpn5owRuOdPPpEcJjG5AdteEKKeHsKpQIj7jYSU
	AGepOgNQXks20zVeRiTunIP7BeXaJTsLIJ1fN/bRflQRrMGvift8+bBeIpyefN/ZdQs8HxRqcXL
	ZAynH9KbXKfqq2NsGzuJI7oVhvvkFZO2ougsdLCcMpEVe5c4sbsR9/v90iF3B4bjkueKLJ8Qc/F
	NY+KL4cuiROtJyI5QldfXCgLmbsIVFvArMrhs1WNnYjMswILF8XuESMeRqOCtVNJkKtC6C6Vz4v
	lxHjGuckU736xT6WIsfpyPmalYeemhpZwNhp/NIXH21MUvGpW2y2JVjmf2JYLSVB3yOa0HElCwe
	wBrs90dsH7a7Dgp7f00d8/pXcdxNgXN37KedNT/SmydmWb9mW+I/rcgO9MGWscvwxoOR99cO13q
	bCPl+6w==
X-Received: by 2002:a05:6512:39d1:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5bfd95510cdmr7238038e87.3.1793834177876;
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38de44bsm580359e87.84.2026.11.04.15.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Message-ID: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Date: Thu, 5 Nov 2026 01:16:16 +0200
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..a65067352b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src

Please switch to the new model of describing and exploiting
the stand-alone CSI2 PHY devices.

Any CAMSS drivers based on the legacy description of CSIPHYs
should not be accepted into the upstream.

-- 
Best wishes,
Vladimir
