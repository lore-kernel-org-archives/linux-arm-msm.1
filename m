Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479683;
	b=l3OvOf3cM/DbAK84Yo/3WpwyFVTeZX7RyF3ks3qdepx+uJRt9IfubncuEMVJbHh2doJB
	 wf2Ck6faDHoluNHnJIMMJB1z3pDafcOIzr55uyW7hZnihHUpj11wkYZJlQAddimi1eHNx
	 flA5uXDYyweCsPFhzucFIiBDZygzxuaoyOkyN99MvfF8WwGu0mBtV2tUR96DZGEjW2+m3
	 E3gAoIADGtrwygTRw09Gcfwk/j1DfjaX/86FwKF4mEk56PCli8uemR5r4EUvA0ADBOIvM
	 s8fSak1OHb/S9l3DJZ2lXuutxR6I+QvK3lcuVmaHMiaqj0VtEHTIsazVD7z/gcfeSxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
	b=PvotO344bVWnhWN4A0THL7UagByxk4d0vKkkCeKo0AwATFwHyv7M3F61okXrX68njFjr
	 dtCyUwFiD6o5vzWWG/oX75O2UKpSo7keE7g3wBaMh1f8djY/nqVYV+6V4fujZCB9DeHpF
	 EYyHa/BvBxamL6YsPHzFGJDaoVBiauJKGyQkMTLCmPvizdA6M/vUYE80U5hFcP544Hd/S
	 oBPtE8Q1uYWDQr2oCrnvwBCea6uBBsGOPRwkCpe3WY9/hXIqkscuAllGjVOzKyU0dsU8H
	 FjMRdEs6VPGt4eNkTi+ZcpqXF16xK8Bp7vejTD3piv/sv4coSBT7ZSIIOVWDKpED7Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JA5rVTMv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C821606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C821606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JA5rVTMv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tMpu1211267
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=; b=BuLAlDlfzU/52Ipj
	vud1Do+m+MWPCF6KOAKryai1uJDwWpOaacr1VwelR76jsOIR+Ci0sJ8Sb4dECQxi
	4wZqTMqwrfZoeMQ+PcoUbiBCMhkgBS0w7iXbPWZGB0Vii3p1t+3Lt6Buy+9rUgcA
	/xcDv08qSMmUPF98ue1hHB2ezAYf/+n7YE6T1pFWVt+GxaJZwZhfE9Wtir0jafS/
	GrulP77SOsYzaHDBOAsJYv/ZpQQOu/GurFqmBAArgn/dQB7Lr6VPbWT5f5sCJxno
	tkeVWDzirRA1LNgFfxbPcc3E0z2xbReevoPLX2ziBof0zeO0ivND+N3DylUuOsZX
	Oj5OTg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p19pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:01:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc2c798d76so66409137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479682; x=1793084482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=JA5rVTMvn/iK/gOEBeppClhOp1sP165I2oKZ8uOh00o5uLTxcU9SoZFSjYHHt4Fiw1
         N+BKsnOdiyTJMEODvKmYd+sc9BE085bJaGVlm6NaT2dy0AeDgyTd6Uxyuyo7gVefLeAV
         FFHk3HOX5BwzlEJ/PYiUjBVRbS3MyEnuhSX19uvtWmPXDyHNEfcptvwsSijBt6P3Yul5
         8kcvaCQwFP/NbX9jrgATFVZ6og7r3obdDNVeut0tSqhk5hX4fBZIky7nmYZXC7QinrT2
         N236rFNLloa4jskED0+IJyjzdBFfu3RcQ9JhYZmX1veprNFLYYLfxl0Suh47/kaHoUZR
         biHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479682; x=1793084482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=mXOFcwU6HD1c2+LbV+T937lkfvlMuZTNiKzOgVNhrw9ixY91giWbwt5uLZqmROYXC9
         heVov6lUHk2Q1MJe975k/ZDf+5iQ4B0nXuQ7EMs3sD1iR+LSiP9K63eyX11uhyOOhS9l
         sZ6Hq2QJHLHxsv5FIj/HI1ONpVdENt6m5187KQUrY1wGn5uH0LRaddI6LfRfpYs5kEfV
         42vNbVtour8KaPo3rdUiXVcVDvcUqCPWsK8Rs+rssZPpLRienARAQgGTDALuzXEiB0xK
         wIXWLadP+QrKdDJS9SHfKQILnaiUmlRGoRAOnZrJo8jIt6Ok981Mf1TgxburYYKcaMUB
         FduA==
X-Gm-Message-State: AFq9FYJTPLPjzFSzaEyCb7L0ZrHB77sXKU2H+dFJ/LUFzIznO6u6Y7jU
	Slk8bvg98zdeXfUVZWIBAWuV8+2RAsktyZPU2XRoyguwj1A/XRiTGEngvJsr/N0C74/bGufkfsO
	fxRW5xxjx+dF0R+bCPL5VKQPZM+5RLgi4XLzjEqcqC3+wLch8PN2jU4ADjE9JU6z9LTwT
X-Gm-Gg: AYBFou0IXfCnqmtl3ueAWzcFtFgBQ/xyXsp/AccJksXlcou14wLYyqUWR/BwN1iMj3/
	evNQL47bp7ZFxkwxsbdLZSho7/rWnHLM+FSELzEi2oVqU7kmDmKP7If+cyb6g4tiYXqGu3TxeQJ
	e3E/TXhHFzMt1UvOLJgwM57NjeUVGVOQtfeP64xkopR8qYKvzm1kdBOqL1DXqaMD5Ww5O9LsbVl
	gwWZS28QVoL0ovKXhXrBgBuvm+JDmv3sXxiz6RAFmWUAVyzrKVyYhFo91DsopCLu580DOu1IMhY
	/DXwXcEjOEilrE/CnJeGiTe/XNG1ACcxQUU+z5xLzqEd0+COcEHkEJTcDKibhPsymf/810hdDSb
	sNZmTFf+pFbfSKgYsdU6uQw==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535659137.2.1792479681268;
        Tue, 20 Oct 2026 00:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535642137.2.1792479680435;
        Tue, 20 Oct 2026 00:01:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm4659866a12.36.2026.10.20.00.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:01:18 -0700 (PDT)
Message-ID: <2640c0d2-e251-4f7e-a6f8-44bf721341ac@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:01:14 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZVt6S8EOF5zE4JRwFdoOW3DPnqaENOvI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXylsu/ioxOYGt
 e9mU54sBD93MI96E0EZ51xLZTxcHk7zspzmj3cSeTyf8pYuA/KAYCv652pOjNgl5HfypmKNOSxl
 QLVxIt4iLWT4kpH8mMNeD//SPazCYUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX6RsuNIBNpbP7
 xyPNn5ZJ3t7ce6/pFqItLuK85xUAUX5p9e5ETsrUg5Mm3L8okM5JutrCb1s0NUUoHMsrhncb8ek
 t46Y9M2wwQwBui1aI+IoXRD20jHs2s6j0uSoZuyxMwX7SVf5RpgKn1YoqgavWzQJzHAtScSTbBD
 oiWCn+gWjCmJWszodYTZgvkU9EXUZv0j+GoA3Z6DtxjpAI8Lh5YXuxVYE25a7fRzrHh8mun74es
 oHwjSwWsi/1UUGUR0FQQDmxUHrHWBWYd4rXQG7V1xcTL6lZfUcYcy+MjFS5x2MXPHBzQHqeP6MD
 oIKKE0a/3oiRfrz1He6rlMT9IDkhoY5NRIPoEkdByp/UtRNoBRp5WtIWbCQOeRk7DEre8jz0A5b
 kVMpWpX0K65YaSzYWDoWviG3F9djb6+wAuHm5Ad5p0AHIIpt+dP4mT0nLBV11RPpgc4WjPkRPer
 NU/9P2cfRfLEUnzXnrQ==
X-Proofpoint-GUID: ZVt6S8EOF5zE4JRwFdoOW3DPnqaENOvI
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad711c2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 4:30 PM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
