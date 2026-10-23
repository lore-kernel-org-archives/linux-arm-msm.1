Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744345;
	b=z8GWYoHxN26Qjye69tdcVjSlp67pg+49t6LVASktJB2/xgf3vOHM6wVt8Z9PXNoCMt0P
	 v5/LMkp0lcP5/g2jLMFkUg9hOxVuhI2j9fxGCJaUDmDpYE9HOiV6H1kUX/7+JrHfVDdDP
	 SmpsA0FOiSExG2phLKvOkJXLD5pk8cZNViyDfgwryOJEyOhGe5qE7NBWHc7JaVWlbnhS/
	 PGlCMxAcWVVvUhNTdFg+vLsKASERszsAlkmtzvbPvGZdexV3vtT9bYmfY409uEc8nW1yK
	 +9p658Drj6aNteovUmosZWC+HKzD/FJvRfJNuTUSWo3ahDc1cEsmPKco5dE0jT+yWqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=;
	b=vXJY2ipoKlY0api0yTT4NB1VSwnHLQ4iTFGgbBvulDXNx4pqT3SfVuhgpSzu3edwPxKh
	 b9WTAr64oNDcznVcYKFIRynkvYHJ8wY1UHlIOxviUxdqHjDKwkQwhvEfoX+OVXMBjeWzc
	 gozJpZhj3m2s983F0bCTg2V7KA3J0lLQrS6//QCDAm/8wteejaaWmm+Km3Mp/25B5SHzk
	 VVlfQV529L92wXgDTYY5O9OyNqUcPaBA+ox62sSmzWReISAWHtaBVV8oBtbYuFduixeUW
	 IMiIahEZcopjaO7Pm6FjPkcFqMjROnOKsbW9GrpFRTreY4kWuFnQ12y7y+zEkQ/P1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JglFhSEp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgOxohVd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E9606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JglFhSEp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgOxohVd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FKEO1552217
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=; b=JglFhSEpN/463j+0
	h9Q7fxiikFUpCb1mOWbGbX55shsWg+75t0La1Ctrv9XWte5rq22Y9eG56Gzam/u3
	C7PhBBu0uIFFqTjFSSXwmRKjTuYlsZ2fW+Uvhfr8eZP3VfvTu8tKyDaBBYdRRvFN
	JmAhCmEVn/9NKLk0fjloCCqL9kTm02pebHvvcegUAEyJq+27AlP9RzOQaTvwgnec
	2c2au3mR+Ali2k9WF1zNLxB3n4yhB52hPo5c2dLFp+5/5Iqcsf61mkRziR92lNjt
	vTBg9ZZuy+oMSb9NqrnGW0HjTyRaGlt1AFGXjQKdQT6gmn4zv6LH8LilUyczlnwV
	7AhggQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttr0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so15380485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792744343; x=1793349143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=;
        b=jgOxohVdwFPa/g7MA0of6LWr8XevoduAlw94Ul5ZZjgaWO9M3wOrcu9C/Dj8zNHEih
         +6sXfeL+5VUCbpbuLrWrtR4G73GivmkRfStf41ey5LLX99WfbQMjPxyN6r5g/CfTBqMq
         /lJ2pgZTm6EmZKGVCBtfIGBUCT+sMqsGrQaBW0eeVd4CGuyKrBWBaGCzNeBByjI/NekG
         /mR3WNuwL9RjQjIBYdg4lsMgv9nstX65W7ExJbXMkNMtfUnFal8hrQhjvNrZSwqFn54H
         /7GmPJUzK22pys56V75OAt7NuArr++qHVwWlP4wkHIqTa28//ZAUXge1hMCgrRrTG2gT
         qDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744343; x=1793349143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=;
        b=vkJwXGkqR6ka7ZkGQobofiayIKSPN6C5V1UEhPr9PnwbArRn2ZchUXl2YJOLzt+8ix
         ESxipetwdrQ11bC6jEaDcMe/k5y70L6efJgnPVNFLlZVS2k/a3JJCSYyuksAc0qC3IDR
         GH2Hiq/C9wijPm+kPv1m7fLsovz79B62fRCEMDLN4+D0NRceBUJVJf0RKh7pR1enIng2
         Jl2oQPU7yqgW+UDE3PMekx4WmN5A2D0ZXAmLu5yf4oyv2R4N1Iat0vqbMe+o70t2ZxiK
         c+CY8FZUSW0XE613k4CnnbhVprRCBe3HboUzknZGL5Tx1YRVxsCl2RAhGSn/U2mjkBXc
         t/rw==
X-Forwarded-Encrypted: i=1; AKwUvBxRkNpUdJxqdlCaUfbIUJqVW6ZCBz/skTLQRtLL7GCc3Tivo+w8TxJ9f3/cLoKseJsw3WIcDxZa3uQxJxbA@vger.kernel.org
X-Gm-Message-State: AFq9FYIBL5MAc07Vk+4NgJmQnrOZ3hboUlQRgOa0NOUH6ABp86Na7Hf8
	rxS+oVSxz/w9pL6p7NniGHP8yJeZw0iNfUMMG16duc4a8LEre9Ewr5pLs3LYAo6EEfpQ1Je5YdL
	sx6DCqDlpyuyHnAE0sD3nWMtr9heCBuNATYpteh3jQ/xkMS1MsTxx3AAW9iKaQZqN8tcl
X-Gm-Gg: AYBFou0z9htGq2ZK0BHMISG2Bxy03HAPGjsgsjeRWylusnLiI+x7VKfytPm5f4fkJ8P
	IWkgKQVGGBJNl52uWru0y2b1P3yI2eBeyMsXodil0Cf4svcinQz8OOTtMFZ+5SJ2AQ2cChBAoZM
	vkU/xcPTXtoUFbZl0xMyjwb42arhzpfzAb8zRy/NwtX6U6GEZXlXXQC1/lXmOLV3I7mKRlfcpoc
	lTQKb755EJif3Kg7uqJ6QPtwmrkLfEreYRo6kg4WTz+IwHQjoScKRmSKPolvAZWOkW4cg+aGA8K
	z6OYLxUqVtUpcFY9n3CgJoQvR6akYZpF/fccg7zzx6fQGDLYz0MUR2HTJUboW2U1gyQH7ho0WaS
	XfoHS/MyI6kTysqZVeQ3QOg==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr310821485a.0.1792744343436;
        Fri, 23 Oct 2026 01:32:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr310817985a.0.1792744342945;
        Fri, 23 Oct 2026 01:32:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c81c1bsm75481866b.44.2026.10.23.01.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:32:21 -0700 (PDT)
Message-ID: <ee86c401-5e1b-4c1c-9f43-fac90fb303d0@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:32:19 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola Moto G10
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792703903.git.me@michaelmcallister.org>
 <9d30c98a7eb0e57b09f239e8276f6d84422d9fd4.1792703903.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d30c98a7eb0e57b09f239e8276f6d84422d9fd4.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb1b98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JwJ85b4fAAAA:8 a=pGLkceISAAAA:8
 a=oW6_BwkcVB5HKUzH1HsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-GUID: X3iy0uVHXTZzJOj6Y3t_gJUxbrtV4UqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMyBTYWx0ZWRfX0EswAsfc/njH
 i1FWZPKCKxoZ1r7XRbMjVmbv/bMaP1Bo/ilgPsMXTppYz3RV4DS8oFSIWjWBGQEemTKsMMl7K/M
 9LfkiC7l9vKbaWPg60vw/UnHAlmaqbMfyR1g9uD3RFAdK/zVswGa4RN7xNyKay0Ug3p9+gyC0fA
 J20xmNHq97dVFr93RrJjlmthZgH8IhVReiIBv7W2t/EcABCV1ZhDC63P1E2h0TUPEjH0VHMIc3h
 pRuG4aSIXeZSill5naFQUPS7AW5SRCqAa9RiGqTcdTc/H0aEnhpKj+0Icaxzj1JrJEH6lSsOg1v
 6ExCIYLNpO4K+hzB65A23jdsKrsotLam999vj28p5uY60U8QuUzouKymlEyKq3Z9OvNRnkuJEFR
 GjhrbDX27yESD6xNLNbZLfeYq/qy97NNernkzlrKl4+8JqnDdWu2AigwqUP6LuSUtZkNNKOxkyI
 L6OeD7XNrIbOxHMb54A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMyBTYWx0ZWRfX/E8ViwMpupm1
 QYUv15ntRZqSG2X566PVvy3duINWzQiv0cMqDW3CRwJbkpT8RShjt42EcF6fchJOdhve/AaEckL
 q3fbNdiPIPqn15RcDiNqda7PwTdX/w0=
X-Proofpoint-ORIG-GUID: X3iy0uVHXTZzJOj6Y3t_gJUxbrtV4UqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230033

On 10/22/26 10:40 PM, Michael McAllister wrote:
> Add an initial board description for the SM4250-based Motorola Moto G10
> (codenamed capri), including eMMC, USB-C, buttons, GPU, Wi-Fi and
> Bluetooth. Use the firmware framebuffer until native panel support is
> available.

[...]

> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026 Michael McAllister <me@michaelmcallister.org>
> + *
> + * PM6125 regulator definitions derived from sm4250-oneplus-billie2.dts:
> + * Copyright (c) 2021 Iskren Chernev <iskren.chernev@gmail.com>

Did you adjust them to match your specific device? Otherwise you risk
some magic smoke..

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "sm4250.dtsi"
> +#include "pm6125.dtsi"
> +#include "pmi632.dtsi"
> +
> +/ {
> +	model = "Motorola Moto G10";
> +	compatible = "motorola,capri", "qcom,sm4250";
> +
> +	/* Used by the bootloader to select the board. */
> +	qcom,msm-id = <0x1a1 0x10000>;

Please add a line to socinfo (this is SM4250 as you said), include that
header and use the define here

[...]

> +/* The stock firmware uses CPU mode 3 and affinity level 1 for these states. */
> +&cluster_0_sleep_0 {
> +	arm,psci-suspend-param = <0x41000023>;
> +};
> +
> +&cluster_0_sleep_1 {
> +	arm,psci-suspend-param = <0x41000043>;
> +};
> +
> +&cluster_1_sleep_0 {
> +	arm,psci-suspend-param = <0x41000023>;
> +};
> +
> +&cluster_1_sleep_1 {
> +	arm,psci-suspend-param = <0x41000043>;
> +};

This isn't customized per-device. I've confirmed these values are
right, please update them in the SoC DTSI in a preceding patch.

We also have this state:

system_sleep_0: system-sleep-0 {
	compatible = "domain-idle-state";
	arm,psci-suspend-param = <0x42000343>;
	entry-latency-us = <10831>;
	exit-latency-us = <4506>;
	min-residency-us = <15338>;
};

but this is definitely going to stay pending on this series:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

[...]

> +&reserved_memory {
> +	/delete-node/ memory@53800000;
> +	/delete-node/ memory@56100000;
> +	/delete-node/ memory@56110000;
> +	/delete-node/ memory@56115000;

Please remove these nodes via a &label_reference at the top of the
file instead, so the compiler will do some more checking

[...]

> +	/* Bootloader debug data. */

Ultra nit: usually comments don't end in a period

[...]

> +		vreg_l8a: l8 {
> +			/* Handset ICNSS DT overrides CX/MX to 640 mV. */

This is presumably CX/MX for the bluetooth chip?
I find this comment a bit more on the confusing side rather than helping

> +			regulator-min-microvolt = <640000>;
> +			regulator-max-microvolt = <640000>;
> +		};
> +
> +		vreg_l9a: l9 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			/* Display and touch share this rail with Bluetooth. */

This will become self-evident as you add support for these pieces

[...]

> +		vreg_l16a: l16 {
> +			/* ICNSS WCN3990 XO supply setting. */

This comment feels likewise a little strange

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <14 4>;

Do we know what these map to? Usually that's NFC eSE or a fingerprint
scanner. If you do, please add a comment, like in glymur-crd.dtsi

[...]

> +&usb_dwc3 {
> +	dr_mode = "otg";

OTG is the default, you can drop this line


> +	maximum-speed = "high-speed";
> +	phy-names = "usb2-phy";
> +	phys = <&usb_hsphy>;
> +	role-switch-default-mode = "peripheral";

And this is the default too

Konrad
