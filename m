Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34C4A99BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363286; cv=none; b=T/JA6ZMFKdfAfEmMvXqLs7WeaQqNysNYL+a1KMiIVuPKKalpdQJ+4hZK0iK9OQd+dd+lpXq7Axou9qVfZFmyCLcDvxPTE670aGM6uQXQxIgHvWoR0TIb5xH9E0JSmfuyK5z47//SoonB/X0BY2+MSodQRiLAIUIAOdOBs/skvWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363286; c=relaxed/simple;
	bh=111HryzAB3+BmsU9N8tLYwKEyvYhIGzqqk3NSmGK9+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6Ourz0oAur+xsVlzR8BEDSx2CHdV4006fFzjX9/grrK+QHvJ3OijqXwFJm7BkdvpUuyzYJy4qdM2Vk1lPX5BV2/FNK/HJ6UkcTtHNwfp+XiFyY25y7iZ49cxweTO5wZsYvxHsBJmry7qHGtBvZ32BKrpi9PRSl0mtwgvLM8At4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpJN5MBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCztkWi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpJN5MBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCztkWi4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DHWqw468434
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=; b=OpJN5MBfxd7f5L0I
	usmbjBFo1h+2/8y7RkUKk2IJkFuy8AbcnK1GzmlPlnfnjsCCSRL4asH6GM9eBJ0N
	cDUC976k1JRmxJgYhxxcGH/2s+8rdST0guLo59KiWiBzVMHF2og13jCceXKcqvdG
	KQ6VP4AkCeZcLv0XEmP/BRWW2hfvJhn65AT722CJ/hAXap2dts+ONm/GhRHsG1xl
	T5Fzvfr7YPm+NnrwIhM2+EhuG0VA+xzMJER7RJbOpgjPsWaZe9Ktlyqh1mJwfynz
	BSNNkcNFM1+aYz7WkCEoINJ0EmLYZ605DoflJjH4VSwcRc5jBa2yt5cEbuAEfXb8
	df3ISw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0grp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:34:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so44464137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788363271; x=1788968071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=FCztkWi4iSBs9Cbps0bL+f46Y884BqBCv4WkdH0ee0JCW3cOTk8ipYiXerPsWizetV
         axmYOhQJFxXvVvCvkd8Qmcz5ZW1pleq0pTd6IqPbTAaCLLR/ZoRs9uaOHnFu5ir5uYKS
         9mTvGxfOxJDQuLxQG7k1vAzrqGvjrpOdG3xEzvFeKrGEMqV6Kfy4rUGzp+zLZfanxzzx
         qr8iN1QBweBHf1s4AGINaR1+c8rBaFOvXroq8rtmDF2j2wrGvisxGURJrlwQM9v0ckU5
         pQOKFdLZALggI1Fst9cIIlegAPkm0nERoly+VP7hCsC5yWU0KjAtKgBnYkytilFjv7fn
         zceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363271; x=1788968071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=E5Rd0iAniPD472nNSHUbmEWxa0zs5+QUIMckwH26rUmXTxoRf1ahY55IsNS0tubQNg
         ipNnENgcyD8iX9ne1TbBjFzGIq2YQ8T/yvTKSTNZSdVJQxOdbf68vnbYo2gtEccnR8cR
         L1AXKYo0Wv0o2qINIkYsfipOpGUw4yGeIXT+eYPm329c5EdNSw7ESeRh80t+P6FowB0x
         k2gV/qDnR5oMeVtG0McyfOF+uBwGieJUnRbBKlYA2dOSzZu0/e3aRmX7Mz2xtxi0cflF
         JGAzddj8tAeP/h6krCSQP8qDGx3xqsu0jz31UM34boMyUlB10aGXeSP77qvH1j76k0pv
         J/zw==
X-Forwarded-Encrypted: i=1; AKwUvBxd+XdXghbyfpTU2P1/RPGhF0SaYaczZ5vrf4DkzoBZZHlwbm+40zPkvNvpZlFIv7J4vP71kStWSJhXAGbD@vger.kernel.org
X-Gm-Message-State: AFuF++kwysohzfeXVEE07frWRXzZkYym3VTi49wF5IrLOEMNLHx3qo7X
	kEzja5BxzNv4gRzguOJgehona2XI6Ym7DEoc4WjAsDak18AXRTTx+FTSOV2KcLnF5I7gkFwzjgP
	TniECXPC0z6pDKiYqBUSsxXQO37f29HwUJ2RbYlmm4hfVrnaFROf1pLKu/cWAvFO2ilN0
X-Gm-Gg: AYBFou3cBXN9cQ0wFUK7ZaRUaiR1tDS+rF1t4NFGDXmauX2bagWsqcIr9SZjfQAJ0nq
	gyYfZMKZ2Jzy+HFjpeeJ1/vyDU4gpVIXoCA41QVPzF6LkPqAHAwqkWDRG3iX9c6bLZZBZuqxpSF
	2mhjs9kDkb8LgxQVy0twtVKygqqubygoGiiNyYQQn9HBKD6K1TVYXxwt4xZraNA8+GCoXw061zN
	GCvhInHEwcPX8mJ2in1rrIlbNHIFxzUmfppYcH/KxSqEx/TBKk3Hu6xlyTXCpWAkyRQxAyPuHrj
	83f7hoD9Y8o0+avIBXIZiGfgBY4+MxVDUUZ+4dpxq4oPNWWfHHTEaRFKX55gWSH3/jowMiy+3IS
	3xwzXMcfqPrlaUUoI4AQAcA==
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928052e0c.0.1788363270884;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928010e0c.0.1788363270357;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a35a5e887asm1147281fa.33.2026.09.02.08.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:34:29 -0700 (PDT)
Message-ID: <e1d809dd-0972-4ad3-9dba-0b7d573d9190@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:34:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260901-pixel3-camera-v8-0-99f159883348@ixit.cz>
 <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JlbDcoiIEnhmeON06PdPcEbkOHsf3gPq
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a984207 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX3xURuQJsyNG/
 9qZNyIlxrdopHLODngoJbUESjkLcQ0XnX17Xai5Dn1PZuVwmF3iCRkXub1GXcoveYmVfTYfeb7t
 NjNv3C31CQ05TxLpxld24zCuYDrDtYs=
X-Proofpoint-ORIG-GUID: JlbDcoiIEnhmeON06PdPcEbkOHsf3gPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX1nodTs+LhNEq
 7mYHLVRbw2QQKKipvXilTH2wSXmlrXY8X5t9j+/VJHSTyE57/LFEJLwqWS2garwrv+5zOMR/B/a
 kbDgdGlQbJ8EMyJacmlHoHhbmEgW8hQRUpMl80mP1005LHiYe7Zo5aoNmZzWsaxZ2Qtv4vERaIX
 r3y0vWLxXB1Da7+jX22u4SP4WeTOLP3Na7LG/cjcYovToenSKYTZHPSeQxjFaKzOBhiDpMARo3t
 zAsGzOkF9Gy/33HKVjpLEBJfF64ieUs8PLKgOIXB60+qSy7M340PN1RDzBotmzzgk+Vy1/OWBad
 +QCSDwkoZ73iHnpkbGl53WvdtYy38Cd11JKz9u6S8OiulfVpyzVGv2wtlKVtkZtksFoiLguHEEv
 tyYYpmPK07G1MjCRf/FlaX73q7EZtzWeJomjETaahP+ehuPPOjVF2qxS+bb366arbm6RAVmvPGD
 odwvE7PVnrstuflWOdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136

On 9/1/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
