Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198294;
	b=dAOZcnT7mmFN72R//jTeEk2w1WVwqsX5brr7kA5GrvHYqRtOXs7/YE8CDZ/VFR+JQ0KO
	 i2CY/i9bzb5chDBmsFuSQeHIrFi5dlsGcWOaD0nIzPDEw8aEtFIPvxl91gZttz/C/wnYD
	 PV45J995jGaYiqYhjy18/pbgTNx/Z5mrxBdYUX+MbuyeEm4kzV0o1/4Dep0MRUN9qkt+f
	 L4nwpiSiKppAGIZvyLVlOh8/fuG65DBEFNPRJTSdsrMooeJYYt0f4ajhSfufnKG3hVrRV
	 udjMyHTSfEcpMwc5U/upPnj33OVik1/zUxZTBnyF3CQllJF8xmgWLnXnw1A3l9Tn6RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
	b=EkodQBLb+eXhiUZG7ezbX2eFL8ynZrnGtMoKEbE5nXLf8RYzeQzeHwHBB3RVg1HSr35R
	 JAHyKPsK8neE3dc9SY9SvuspxAaGYBUK0+OpXaQBJb/WU7oIzisxtC7X7z0gHPu07R9bE
	 n3qoe65q1GoMbsk4uNL9zWQk7NfJhhBVuxRa53JXdsnrrB/4ON0korGXLhMlggL3F9HRN
	 fmKINvmPATKF28VbT7IZzYOLG0agcvy/1j5LyB0L9Iq8vHGnERw48Mxzvq45U49O7EwxS
	 TDTtLwABBLg3e4r/2WDv74WMHUhnTyf6yOwTgaMO19DuB126zalMJVmDt7WUXpD+rbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxMcRL79;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvHgIrna;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF1606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECF1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxMcRL79;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvHgIrna
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBduTn137571
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=; b=JxMcRL79w8Fs+cCO
	CSpN/e6Mkk0iwRwudoSDfaeVSpU3cgyFXVHMGYeltSsk1VSSmIAKEzRz0unFRScL
	H6By4VjNuYCbLZJzbbIt2wyE+IXf06OO1Iwo+ouPgu710e+0jFgLvEqMlWko3a30
	SX31nxLl8M/ayV69LUGRd+daS8vM44VAn0LuufQsW41c0mznqSUMjeLGCFC92VLa
	HCg2uVrrIyM4vCYnqI0hc2dAOpMZqtlN/I02IZcl167abb9ApFN+Y3ipQGL3qlL2
	1+n7Yh1Qr5bP882WiUnVEgvfWoGTYc/SWCs1z+HEGEjS/Nwe8YekGQAPcOGsbdHe
	OE/nlQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92xej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cba2460f8fso37798137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198292; x=1793803092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
        b=JvHgIrnaXYv8eL4Wyzc6hc4HKp34m7pU0Qwh11UArAXelRV6dqrRFVWwkoUQg2yTPY
         WWi1j/1iebRa7ngeOZEXDOTNgM7lBuIfqTJoGFwSYr0g5D48uJfCyuuel2rkrgDvbsnl
         0+vZMqPfXJmUWFiP4UAthBqQsPDz28IZ9CvYA8dVR1IMXcOV7tY4fUvzTAnvn5tgVC41
         ZkxIq16NqUx2xF9UU/qtQdW8dUAYlH7pwVpywE5TLPAKJO+bbbPEX0LyWdF0taeFGSDq
         FS8SX24V1790mjTg++CSVyK67O1HHsCFH253ddaiCq6aB42v49t38RmVxaiLLrUMiL6/
         4rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198292; x=1793803092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
        b=XJn59nuPP7ef5WLdxs6stLGp83tzzNTex78Fp79LF1szCKhrk15r3+xSmoy8X2Y8I/
         QbDUmsHrvKOs3Hg+IbniN51sKRHeWGmqDDggu6AiUHbRd3n49vHDOwSsAc/sOjLjKun+
         ikbsiLqY0p+AsiZ8EEFpJzAYiFaICjzgysxMjCyUPhDdTHRvfkS+6wquxz2VkvxoW92g
         o8h+EugQCEjh9haFn4a+IeC8ZUHrdJPorFJWaOXqQ2BkVDaVuC0egeLCRej8fPuB08C0
         uuAT5vb9l5Mt38vKDukoGQ0Pfiqw2kNJXaEyevZtrRJuxWHAsm+yKx+TZFCJFvYbu9yL
         OcKw==
X-Gm-Message-State: AFq9FYI9Ibtyzlkq/aiLa6tSuOk3Lr9I4/hXxJ7WDrXfOONina0jNL5E
	Aq7qBBgMhWHoQQizY7fPJoiZ1tqy9nu+qLrHa3Unl0X4uhv/vLUrlitw4mnDdpHYPYpirwAuCdR
	cYDCIH7Cf7KwUPUvAfgZG2Y3iV7VKVv6kqrXVnRorBpC0kYolKnwLPSTrUo/Q5RweHxtP
X-Gm-Gg: AYBFou3VyTQ7F+2k0ZxIhpk1NdkooEc5YWXiHyEhNRpqUAMcmbyXRDyMYy83XWXYbJ0
	Ui4lrmyPhkDd73Bjeu2E3youjO7dj6KGSc5e55GC6ItyIxTPauuP7q/N73McuHXivH/jVtr6uO1
	A85ZO9//1pxLANGTIuzQLJ++HzgkN8v0Sa0fDdZa7ID/OcTRtwk57lNyOsCHP42oM5ErIeJHZ5s
	sz+uzE0AiRDE5+bABslCDiv8xm6Qb4EswRKTO9py8l5li7aXYyItyi3ZARldx5FA78im+P39WTn
	vTEJKJZAqDhWiVDgPc1wz5rGQgzm6Shrj8M6YVEDtgzHLn6wqMHCHu83BNff1tbKo+f1NeSow5e
	jBYry1wyIJkx2+Ke39SIKAkT9vC/9tUJW0nB0FxUZ+AMvHB7/48P6cahSlBllPfvKim4505E=
X-Received: by 2002:a05:6102:3c04:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7d03a4d89damr1130785137.2.1793198292136;
        Wed, 28 Oct 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3c04:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7d03a4d89damr1130751137.2.1793198291691;
        Wed, 28 Oct 2026 07:38:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b497ff5fddsm1482885a12.2.2026.10.28.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:38:08 -0700 (PDT)
Message-ID: <35c0fe02-88f9-4845-b37a-daa9bbc6a5fb@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:38:05 +0100
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
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae208d5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uZIZgAQFpoYdS5itBGQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3HcjFMLZ9HD8
 Y1yHyjoXzQjH87CKR94OXK/HW6CjGsrQ82iVM1sUM1qXSqXSxqYlwSmh3Z6nI4lwLzqDgTH2scP
 PdacUM+EbxL+3EzljSzYPvO2A3aJgNo=
X-Proofpoint-GUID: PY4qfkqSzZsemSMdaOkCeEze7bCVTW_q
X-Proofpoint-ORIG-GUID: PY4qfkqSzZsemSMdaOkCeEze7bCVTW_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX289IgNoT3uEx
 BkorjW8ZBKuf6ujZ2kFwbKDJtGaX+FbkC43qXMb6TL7Y8e4lbaEyjtIFI6c3CY4xW09e/W+okbP
 /kEsP0DV+5pFCnZVru9kfIbiHrwprJSRwqXQrfHm6ZzJadD59Z5ptwMTV+85xUh6bKQiVE9dry/
 m7oQ8CEWwBF28dKGSqO9clgNwsOgkzGoMaI/yoJp0ngs8g3Mt2KrApDKexWwfpbl4Y/K7A5fzIv
 rAi2Gp9qREjKvP54XXy4aQXLzvQ2u2V2pzkr6pQqc/atGAfKvjsUAplx8pXpmQUnJa0Q5IIhsra
 G57IA5fg3Bk8iUMtbcDvhoYmtXcDdhC00fToH/RCjt94QnaBuzkcM4qEPQ91XyQWCgrk/T/f8c1
 bZG3JdVrg2KeEpzdHcJz4OVlSNhKaY4Do1igZK0b5VlfQYdrG5bYw/5xK75Fv/OJyB65hWdLIQM
 iJ6prVXlQE9m77Arf6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 10/13/26 12:16 PM, Qiang Yu wrote:
> The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
> which in turn requires two separate LDOs to operate. Without these
> supplies, the PCIe PHY cannot work properly.
> 
> Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
> as required for the Glymur PCIe QMP PHYs for now, even though it breaks
> ABI; other platforms having the same requirement can be added later.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
