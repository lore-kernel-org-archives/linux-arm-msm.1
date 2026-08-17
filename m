Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EF41B8C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970241; cv=none; b=V2H1JdlN1GWMrJo0H77OT0Das+CnfkOwuGbPc+xoRIl6T29M3eg4EPM9oDf9HizOiUAhFA4dPVG40hmVjRJMCk/gROvgs/YLKprE9/YttbHnQQu6DJCdO4McEVJimwj7gInv7mZ+qxhcILKDI+0a8uUhnpVdUOvRV01kuK4gE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970241; c=relaxed/simple;
	bh=XI5xTyvbfGiAmFocmMfUlPa2OTEVl2XwGWUa7ebZ/fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhgeToJ9e1UINiVuDF7h/atk16iHbP1TvOc1QCfVaIUY0Xlj3Wau1BjjZ313DS99kom1ixns6NxRlpyEvKA9kZqqpHGb0nVmh3IWhLA8j1HxjANqLFs3CRtwosQwRw+oFsFRtnFcs/OwFFKe2e3Jm3dBYxZQ9NwHNCQKJnB1OdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTe7mwKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQEmAdu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTe7mwKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQEmAdu8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCAn9r2307822
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=; b=gTe7mwKonglaFvUI
	W/VdR/tCuYIHhlhbLWIlAEjoBjWFoSeACqiZp3K9a+FNGw55ZAgKlUaB+KXPNfUY
	S/yhUzlM2ZyaCfBkDXtI4VChJtLvcL+v4ocogXjtrl/Ld4AXv5JzoKjJ9hZZLekM
	BkYp7QzSfCKAIYItA1a2rc+lsLBqiHZfl3nN8cB9ZtV3WDqLSinCZAO7JDvYGxZ9
	AyoeVZpYD9Pqvp3qLpUGhYDmKcBqe9l8sYf6Xr/OGVCOZFQyd5cwvJHT8kSUb7h8
	TZYF+2XjM6YjO2bbcfo8BoLOs/lEuEHzX87Z9gB+7CAtr2FgZuoU0VgeSxu71882
	sSBBWA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wreh71w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:37:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-756fd28d906so80408137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970232; x=1787575032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=;
        b=OQEmAdu8Fstu8CUT3RMcCu8V8Bp3V54PxHz08itl3Cg57QEm8B+roOrjHsnX8XzKB/
         ec70ZrGMQEsuMtaSF1bjTYhQMHLIkRVT2g88T3GzZjazwdpNiHtdgnw9fbFi+wfov6wb
         2pMxPnIz8YMTCSdZmH1XFHIBDmlrymh5KxzePe0LlIfsNoCSwBFkguBBiIsKk0lEM3RR
         +Co8kBamAhrUZftcWiT9g5q4zwK8gHquJUiqfQgvlR5OgnyBNEgIWamcszDekF0a6Kyh
         D17UtzeUgr4Efue9mBdE+XSAoG5UjjXkPVwB3AXiFs7/XSkrGmqJIAeNNaCWw8Nu0pgy
         wsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970232; x=1787575032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=;
        b=DtLCW7Jbp4vMfZqeUXKKJvFam1lTtZt6Q4JJMNnSMOONvPfZbKQkmBnpjdXLMj6IHQ
         il5cqDj5oSXOpxEacoDJjwQLoTiQPrbwN3/mhK7sM230XUHDxXqf6fgj1koodY4ploNO
         IxHcytArDhOFeB+9+8hHZBbv+XAVNNHe1yY8UBXd2+K/5xXIo2Ya3PCD4ZNa3X4yVENt
         PuPUJitrDqYr3FHctQCloXu13yOkrh6cC633zJc4XgY09AS9ZcmSCW8Lt9JAHhy3bUVe
         snftQ6BHA6l2NGBBQtSVnhKlHok9ZXczChrZwq5bHvuVMG0cZlbggFxHLEGtjtLUHHzF
         MRHw==
X-Forwarded-Encrypted: i=1; AHgh+RqMGrkBEKhnXiF+EcjEog5LQyerHCOrFcKhFajuM0f1a0Y2dtjNbQuxAKauB39rYpGAwwAKqwhVCwTik5s5@vger.kernel.org
X-Gm-Message-State: AOJu0YxbRI3wgZLqskfs0PrgTRWLHGD/S9Xp6K4+w4uRWgzAuepNyghT
	rS5HGUdU3ZDfiHwB75PC6II/B2XUiSWG3hQmJu1JI8QGo56Fsgs7zL/OOG8wpGYv22cgtifsag7
	0h9yvIzZyHCvoGocDiTnU34UVEhfF+ckMzkWHyiRz8kkI1j6YLW9Yfo4cQUI0XgdWlZXF
X-Gm-Gg: AR+sD13VxoXYyXS1R+WhDJBX+uCvii+rxe7vIaLNEHMcNr2klVjrGekmowU6ft2gNJL
	azvKVCOm8rlAJLcKK+1Bw2Lo3O6RtBwJ6DhNr2Tjindpc+MsTtcoK5fa6i+yHFaTH8hXwCUk5as
	FxrQrDuGQW/BKjtJcKNE02xn1n/zFg4mR6syImrbV6bbIGDViG1A6wlKFAME8YeAf1GPe/xK/TB
	aqjcJARlZvf8X+cfr2xqJ8yQEvHJMISvkSmKKHK6ncNSV7VKtNP5iNZMr1N3SR+U6dN/+kVqTmb
	l75x5pOKMOWyXG59HrW6QWKkg++OEcE5oWViagidqTTD1uqElp9dwkFe1xZ/4lLc/6AF+lgY7Ox
	D8Q14OCA3SPupv8vpn3FxE/Sn
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-76f2cd6ba90mr1393147137.3.1786970231968;
        Mon, 17 Aug 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-76f2cd6ba90mr1393132137.3.1786970231506;
        Mon, 17 Aug 2026 05:37:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00ab34sm362466e87.58.2026.08.17.05.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:37:10 -0700 (PDT)
Message-ID: <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:37:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a83007e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Wkax7JBLRjVfAwrBdP0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: _65Q3dJ3lZa3MAcvxWuXFIXcLKW1-tx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX/Xmif9YEbHRy
 cNZ7WQsXvA5gLg9Js0RxT0I7DKJe6jNkAuEkdGmxJ2J8fVsKYlLUaYfSDCEvrSCWfWGB6yxZ0iI
 RS/ZG3OfDv1/9axLOxVR5eIHdQxXnlvgfIY51fWRBSjDPE2sMB2WPh6U8b0YmDAfMCr7qC0WbrA
 dXVd5dQh2xPUd0uypEsnl8zx+8847iAosGRSKwML5VO7ceaWXbkXg4puEJk4tgbc9z3Bs2u5Ze/
 C59ehJFg5v1Ho/p32oFBvYGOb407CJdBi/2qQSa5Up2HNIf249A0NA/JUkK8Fhwyg8eNkNJ4E0x
 skwuEUTn4nH2ejYlT5ZCdePVty9hTBBBeTSgs/1JIKz+Q+ZDMKZoH517VsiWuHCikOhDAMGodpq
 Km07SlJUYoNMid7VP5In26FmAxqftu3yRB4ctSdPqy+9qqE/rXzg0tXEJvD4ttpES9yFhKXHk0o
 Hnj9m3M8HcwwVGEP6HQ==
X-Proofpoint-GUID: _65Q3dJ3lZa3MAcvxWuXFIXcLKW1-tx3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX18itfUH+mRKP
 TjN+B5fnZ5MFWc4P6Y+2qyQqcKJn7BBcMKhr+JSnhjRPvoBHAM/xgMl/wCGZjcrX/yCfb0x7cTz
 miizR5j1sRQbMQaPJ7PFGVOwCdKUf8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170096

On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
> On 13/08/2026 12:28, George Moussalem wrote:
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>>>> +
>>>> +    phy@4b0000 {
>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>>>> +        reg = <0x4b0000 0x800>;
>>>
>>> That is the same address as PCI PHY, so you have one device, not two.
>>
>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
>> same MMIO register space in IPQ5332. To enable USB3, the compatible
>> string, clocks, resets, and related USB3 properties override the PCIe
>> properties. In IPQ5018, the PHYs have different register address spaces,
>> hence representing it as a new devicetree node.
>>
> 
> Same MMIO space is same device, IMO, especially that you have the same
> registers (looking at the driver).

It's indeed one device, fittingly named "PCIE+USB COMBO PHY"

Konrad
