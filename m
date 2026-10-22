Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661048;
	b=ouItORRpZXbw1jNeGCohEwc986p/x3lVasSeW2azI038jwmIuasyvcKs8vFuyYxeFnYt
	 JnQ/xMC8ixGeC/vq+43b/LeHJhmOMMthgJ1W+rjUKQMwv4L/1gtlBUFRLRjmKtcu3qb++
	 pea5JMpCu8RLBL9JbW7koPaANzrkXNBxvXEugr0gcU9oNBtorZcRjtjGrBitqU2vOuWZR
	 y5Ucouy0IUbYLb4kHed+hyzeLtFJoeS7iYxo/Ef6tIz19CsUKXvSmg+rXI7c0mwjux1Cy
	 qlMxCQqfD51cIpH9ZVJ7u7YOGRjOMEe3AczPzPum81CY6Jw1q2un0V4DBpxRV/S3qWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
	b=zOCdGJgR6HElg2LRjakUHt7WCIfuh6ya/zzvuS5R4I5VW0Cehirk0SZe/g+0s71Kerwf
	 9ZsFeBro3SgxqFUOTCUdDfFZzYk1Io7E0ixuhAg0NYunS288O7t0vnXr4RuB1kzVOaxOD
	 No2xg4OalO3OhABsIdOu33tLJGMet8YU4F3mDfQwhn6mFbW3blGHFPP+bh0pcKaTwQPW1
	 y7/FrnDD/QcKuz0XaAR9IkH1u7ZFJ1iTMkedtfZVFTMDZydiV8iC5CwhXZME+sKZxMAwt
	 0DxDigMRK/wDpdp5eiMUwHPQqJz2H9X3JZE8Zx6K6ITEW8X+qwSe07XuIQm/yEeKH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/vFE1/m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bxfxs+re;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F375606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F375606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/vFE1/m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bxfxs+re
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705Vn1995922
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=; b=N/vFE1/mSFa1ukaD
	js8Y9n/UES/1A5o0ZBcxd7RGhw+5/9hVxywK4c9OUPG64JY3SqJ+nqR4ouaZUhcb
	jgS8mFF+bLVkexlScNtM+dmXHGrySH3WxTnEJ46co3aNwZ/QUIWFfeT8tWH9X22v
	hT9Rj3ATyXDnkbYFWNgY9FydISUj8y4z67cHv/AjuvK3l5dsaL3C67UYKoclRX0y
	5v9UWWFPeFunnYrqMbUWweWvQOuBGPBKI0qi7plXvRG+rz6n3e+LmH9fc/KLkXG0
	cddLivR76IM6IO98gGbM5dNMKsF/wDULpj9ZbZAmwzOEQXN55/HtMHac870WPKnD
	pwPz0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsn86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:24:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso48800585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661046; x=1793265846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
        b=Bxfxs+rekTZ7XMEy202kKQ+cS+YdsqYn7i7eFnrv91PFpsPTe+gAb1EGge9dhLuZhc
         2z5qkzsldW37/05NIGE6YxnnSho8dFaupNy9u6gvxI/9LhUrA9NNg0ZKXJ21qZ6Z+zhS
         KFkcLOEYymnJSN8ZFr0FDfuM1cc7Bsgw69coimBtAFK/HF4qxBYp+V19ngY47FPeWKNf
         0KiJGoVHpD4lbFyxFqv1tc/Bm+N4XgG+s/nxgzhRk2rAEGPJrCMmWEOwtTVZnhlNWC5W
         aY2nuxvtAsmWvAWiYkeEEARIYPj1TsUWGV3AS24cPB3VtF+GN85qISJa0DggzaFKEdpk
         GqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661046; x=1793265846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
        b=YgHJ/HkamaQBs586HDmN5+yFO0hBljHq6NxavGO7DeL75vNunuFer76wwCSBEMuy/G
         ilIphcXOMW7uHWebRt/eycuPMOTBMO6L5Komxa5WISYwyjG2j9gyll7vJ8HCptNMmfEU
         1w02lHE+FBedqf9POlQWAUOUtaiorxZttXoWORjNKXSb4Xx291mH9d8PcLFQienXTO0H
         YLIcfsZAqViSrDabzZ9TA0nQs5jvXEI07AcK9F6dLGr5rQSdzftJ6SKt7TioRixtDEIB
         RyrT4hZL8FLIA3EL7Qab2cgX7MQxkFW169LlEO+merV7VpYx2U1mhRuisV7XVz8pvlcg
         Y+4w==
X-Forwarded-Encrypted: i=1; AKwUvBwtgI3MmDXgQF87YLQtIkCdyPqA971ek49NUbqBXLr6tzIwK9TWMPXYMUb7ikg6bmwuH0IKDVMRKT6FzMKS@vger.kernel.org
X-Gm-Message-State: AFq9FYLFBvldvg4+hOW/F85JON9tbKEccfULeabPYgdw0GXo47QtE1fl
	QrgamVXW6w9nfDrmBIVRHClLICKfSmai7qsZzcQfkvhjjADPaIsrjIeG5jdSdMTLh6M+t1i+lSS
	mDhEdelDE+P8wVTnSVPkGtbQVpGtMDllI/62KfeOmGn29jLtkgZPT8V9pNYg0QHL1jkBPcM3+2n
	LS
X-Gm-Gg: AYBFou2n2a/ZBB/0tKRon7pvDHtXO1x4sywSyVcF2JfSXFcXzRALoj0InqGwonB6VqO
	Pc3bszj0kjykeZYpswBuKGi87TsbuHZp3sBDMy19W6ppA9sqCDkmzxIHZFzLcXFcWyiGaC6z1Fj
	kkgv4QQv8HLhflVZoQ+wb1rW7OlAbOdbpOSZhjor8JviFuBRemPwHND7lI2k34TjdoMPERibjwL
	NQybd2cYGytTp/iG0il8ilIx6oG4JBmJfY3gzz33B/6+kJBSwJPmLQTWF++Hwcn2sXCVofBM1B7
	3ZG6wp/Z8KwLtk641Hk4wTyWBxmOilY6I1uDoxKHSUaCCb7DZCmg7Abqd5iEdR68bW7FAYr3SrD
	779/ipQ+J/n0dns5DiLIBGA==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1116780785a.6.1792661045752;
        Thu, 22 Oct 2026 02:24:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1116778285a.6.1792661045267;
        Thu, 22 Oct 2026 02:24:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ccabsm83948366b.33.2026.10.22.02.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:04 -0700 (PDT)
Message-ID: <0b829c36-ea7a-472f-85b2-c32ca8121047@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:02 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
 <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i0CrqMAITWM4IlWXL4lIhyRz01Ki7m5w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX0/AWg5wFFd6z
 mLc1ZDMSj2AgEWGCFbgXwr2IuBtg7HujZd41TNEHs4se0QiRvaQP7QPdV7raWFVIyNkEj99BDOU
 rCpNV5SI1mOFgaEl6Mcfv0DJ6Vf9zps=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d636 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hvBRWEyMk56MnqwRZ0wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: i0CrqMAITWM4IlWXL4lIhyRz01Ki7m5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX3T5jMTjVDhVU
 VinvBsZ8oOTsjITzebB68VBXr59Ph+4CtuMeeEIgSeHczCo6UTVcukRABmxlGXDZ+VEjBBEmM7r
 NbQPma+wRFZIs4LZuQfNrIM+5Ey6hzuCDH+Zr8P3SWnFv8H3oU29OyYW8MLt2XTzSdox4yFPhgN
 Cc2S5asmLiJg1og5movsB4JWbLQF1I5zkD33VYJ5+4Ar9PtZNdGs98kmUcCnLYejKK+39hyLp/1
 TLxV01Sqmzrm8rAoCvIak3oPBGPR9MOP/BiRq/qJ/oUJrSC6S/1agxJKlGtrr5GQOaf9fxs4tUA
 u8XQAOI4LYmr/rQj5QsGHFm+a67qgME4ixOLYr+cC3gxitXUrJ7EjXWVuxsyG0HtO0FCoEkkkIc
 9VaqCVikNjrzdF9rQdE7YYCZoYzaNgWIo+oI9l+8wISKle/yG3nP1iM/BdocY/j/gdAVpIXnUkc
 8NKi3wDBR2nW1yjF+vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/20/26 12:42 AM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, so the
> modem memory regions are removed and no modem firmware is referenced.

[...]

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8550.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/* This is the Wi-Fi SKU: no modem firmware is shipped. */

FWIW at least on older chips, the modem would still be booted to
provide e.g. GPS, check if that's not the case for you. You should
also boot with memtest=1 and CONFIG_MEMTEST=y

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
