Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934404;
	b=mD+/OqwT9trRDUVJbpWf2ONx/FGGJtrC38STxuzDfgKWXccJI0mn9KzAQxLbj/B/jln9
	 jBkw5DfS6XSphsOBWWZfP+4JbsxWQEGAa6Hbr07EDMexJ25cVhkXedxv8FnAM8I3d/nan
	 /XV1O7AsBAvJBj02Yc1CL9BXl4Q5i9th6owpiPha/U/7PKov3wqtRalH8F0E3Xyc0nalX
	 hnshowDo7azYC2hctmnsVd9SjPpxhq2veucpwI4ZYJbPbXxNIYmXykogTgyDiARu0Mvas
	 NCeVc1NW/v368rpC/PaKrkD6PP8qCySysrP1i+9lvwxC+2CHCLcFko5hQO0Wu+foL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
	b=uhTksnMa4fMlJjklB/RVZgJ0iEEqBhhdMJimsFcSV8C7u86ErB2u5kwa42ggj2zMviS3
	 5rKNCLwbpHKC/IAA2Bcmvfa+W+K0NHLhOdeI/ougpzOCMaz26CR5ycM+4BDy5bA2+utRs
	 fUTCku2S7FLv0sZgdZ94+Iwcen0wYMH1xtuuoK9ywaabwrD1nH3ddbA9OB+PzYAlN87dV
	 bRRdT2Qyer54Mu10FAJSydUORlFO7UchNhB/1jQQ4jiL+i1mZgD7N52LGWIAU6WUuae4t
	 /nLH5qbnUCXnF4OnKbkz6jC712UByWSDkXdTJ+t79fU9qQyKUIEmk3kQK9gJgkVnWYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C69C606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C69C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a49a022221so713551fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934402; x=1794539202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
        b=SpKhYjIH3QLl5gqZxcyu1lF7Jow88yYHua1qGfAh+VRCkQDLP5UYWjDx28bqbPOnmQ
         OrZ767QNlhu9b8JQldpDuVO5PMWvNJ45XCUGbzVvBA8OY8DvFY7wInBY3Ngkv1nSE5bi
         ro4456IaO/1T8EX/vm7deBNPkEqUgZYhnJVJA7g4XFde+2HCL5VCm15lz/yFoznUnPoz
         iiCizeoSkQi4452MYQwVQrdMTT+KYxJdIf2eUPU0FcaEE8TbNVySqcY5Ed5sT4LDAE5z
         q3nhXS7oDNdaYqVmy+PC5JAdAsoBPukv0D7ZLhHuqFdpRa72I7946BuTNKpTy75AetYC
         0Urg==
X-Forwarded-Encrypted: i=1; AKwUvBzINVR79bg6ozPGnPeIGCMLja+5dRRwFKjbLP6taTdLJDXoqHmBjtVzL/RQ6Gb5izXd4rH2KcbGyOE8SsHi@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uqr7QDEp1OlnLhTVkKVBtxMESUoBeOYWyAI+7avWXYS5KuZUp
	ebE6nmmq5G1PbOtIW0Y8yvrtdfJHhP/HuIeuOjYGsWq1ROVeWudovNe3QOc9dWG8Fjoabg==
X-Gm-Gg: AYBFou046+s8EQA4SdNkExrbRtZfk1umNEaU3HZ8N1BkywCinI+wcZ7yKcDf0XvGPWi
	lVeOg0K8kh5eX2TTLu4Wz3DxGtdr48YsNog+lUNTvVwqTBybLSV0LSV3z7M914IngU9cjCHUdwl
	38Txl2y5fIa8o7y1aJWA7O0A+uoDnG+3Qq/l4p5eDj9bKrVEcXTMxRYXyp219nU8z5QcOBho4ya
	pwssEM04r8VkBbsOKZSdl0vzZyDJ2jESFzJUqTBVgzr0wR7R6MLOJW3A9VD5ZzhP3veOvCp/xLo
	1ajL44AYpxWOxbdff8B+gnCqhyTLRqAFs2FGIdhh5Ba3Ir0HqaeUOWRGucdy6D356BCPM5pOajc
	XsOVRMi/xU6OE/1oUyxfmcXjH9+cg81ZoIY4XQchdkDoKPWDzW2J1bLb4BRXnQ+wZyat9cEPfDh
	pNIUYesObzGgB2RbcdykBPbZwl4I5EwMaYsMQ9cBQFRlTpJpDyxpKp0pT8KfUiuhft4qmvdvvQc
	G2HR6UxFfDHS4QbBOpHcTZSa4jCQFqWzbXGdk7F2egzALoOC8aZcOQEjFiAUa7njpnVwDaGZu+p
	rQtI6sPHKqPe4B1Z0J6r49kCLuJwcOXYPNp4904oyNqW5qZLJhMi57SL4vAmj3HEtyA=
X-Received: by 2002:a05:6512:12d2:b0:5bf:cfcc:5440 with SMTP id 2adb3069b0e04-5c0037ab088mr268937e87.8.1793934402347;
        Thu, 05 Nov 2026 19:06:42 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed499asm157563e87.5.2026.11.05.19.06.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 19:06:41 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso149844e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxsqYb0FejX1QQ/L+G/wEVbrBlbCTKEs7Dd1N/Lb5EJBChGKHjGDhxvEX7E3RMH+HSHTHk0100nkoZbwRu+@vger.kernel.org
X-Received: by 2002:ac2:5692:0:b0:5bf:cabe:23dd with SMTP id
 2adb3069b0e04-5c003a87d1amr290258e87.27.1793934401749; Thu, 05 Nov 2026
 19:06:41 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org> <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
In-Reply-To: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Fri, 6 Nov 2026 00:06:14 -0300
X-Gmail-Original-Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
X-Gm-Features: AclHuK-k_LlKDqZXI1tBCGgD-G1XeUrAUABAuETiZnNnNKc4iM6mV-xfAtboOL8
Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, mail@andrewgigena.dev, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir, Bryan,

Thank you both for the review and for taking the time to explain the
direction.

Vladimir: I understand your point about the stand-alone CSI2 PHY model,
and I agree that is where CAMSS should go. I hope this series does not
give the impression of entrenching the legacy description; that is not
my intention. My concern is that I don't think I can do the PHY-API
conversion properly within this series: as far as I can see,
qcom-mipi-csi2 currently only carries the x1e80100/glymur
configuration and no upstream DTS uses the PHY-API path yet to take as
a reference point.
Converting SM8150 would also affect the other CAMSS SoCs that
still use the legacy description, so it looks like a separate and
larger piece of work.

If I'm missing something, or if there is an existing branch or series I
should base that work on, I would be grateful for a pointer. I would
also be glad to help with the conversion as a follow-up if that is the
preferred path.

Bryan: as the CAMSS maintainer, could you let me know what you would
like me to do for this series? I am happy to keep the legacy CSIPHY
description for now and follow up with the PHY-API conversion, or to
fold it into this series if you think that is the right thing. I will
follow your guidance.

This is my first submission, so I appreciate the patience.

In the meantime, I will send v2 with the review fixes so the series
does not stall.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:47=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
> >> +maintainers:
> >> +  - Andrew Gigena <mail@andrewgigena.dev>
> >> +
> >> +description: |
> >> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms=
.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: qcom,sm8150-camss
> >> +
> >> +  clocks:
> >> +    minItems: 42
> >> +    maxItems: 42
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: camnoc_axi
> >> +      - const: camnoc_axi_src
> >> +      - const: cpas_ahb
> >> +      - const: cphy_rx_src
> >> +      - const: csiphy0
> >> +      - const: csiphy0_timer
> >> +      - const: csiphy0_timer_src
> >> +      - const: csiphy1
> >> +      - const: csiphy1_timer
> >> +      - const: csiphy1_timer_src
> >> +      - const: csiphy2
> >> +      - const: csiphy2_timer
> >> +      - const: csiphy2_timer_src
> >> +      - const: csiphy3
> >> +      - const: csiphy3_timer
> >> +      - const: csiphy3_timer_src
> >
> > Please switch to the new model of describing and exploiting
> > the stand-alone CSI2 PHY devices.
> >
> > Any CAMSS drivers based on the legacy description of CSIPHYs
> > should not be accepted into the upstream.
>
> I mean we are just adding a new define for a SoC here - not a new init
> sequence.
>
> We could move all of sc8280xp, sm8150 and sm8250 to a new driver
> topology but, I don't think that's a reasonable ask for a small change
> like this from a new contributor.
>
> Certainly would welcome the transition given above as a defined and neat
> series but, I don't think there's a need for that to include this SoC in
> 100% existing infrastructure.
>
> ---
> bod
>
