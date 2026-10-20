Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483798;
	b=C2y24jX9FQ1k/iGjcBMg0v0+oKSAZh5lHO3VwhSOFEep/dI1IUDKZ8ALMb3ovMS1Cup+
	 ISAWU8BRXjYPYXq/Mr2jxsn6fEh0PG1bIL7aicEgye4qvMF4d36+QZr2yQP3dJDAJngLX
	 aaMT6h/4qQNh6kivbEYoGmDI4eZEbuzUoMlaaqC4NdOYv+Xfa8iAupsDJdXWTyLKLWRkh
	 OAvVmbSJxnnxcHClYe6Eqta837JUycOrywO11phJjzJQg56+Z7tj7qoCxmpYajEUCAaXR
	 oEFWcszPMNgLVMbUkESklezkx9VILKN3ywwmTp6DdO2Gb0TIT6X0wykAaIxhQrRewbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
	b=004o4Olu29wPA3G0J/RZ2N95LbjuNwmiUnui+rOFdA3XncnY3/+0vOKA4IS3WIYvdpLQ
	 TRTIrbHFh1xYz/vjfHp8iLrvSiaSFSboB/8vhE1Q0S31mVLiNfbmkDQVELthlh2Wnw5Ie
	 4zbKo8EiuMmrBa6ZmqBBLsKHpvB5Fp4vtnM9MDl0Zn+Rzrb0Hz/GvsveuCO5aPadMUl1v
	 Q1R720L0dXaDkMUkzqmBnpwA+9DxZq2rDmDLHNqXclDld8yaZVEDknmCDxAwnzSbdIKWR
	 HSpxzj+Jzw/Jv6taPBf6uWlpoY4jJs9QGblh5LD7Knvi2OF7NYaPUCXXUEqow7jHdiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zqy8yAS0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhL0uyRo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F528606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F528606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zqy8yAS0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhL0uyRo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K85r7R1069588
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=; b=Zqy8yAS0HNfPZCxk
	5Fd34JhwwivmBU37ziGeF/JjsPsdKLEfmviRKkzXEEHInkcH0Vxy9MrmD8+AOdF9
	SkyYOO2+OvLs/YqTZjOFIg4y/iKnNTwNZp8xAsCZjj8+pPrfxhOTVWjwP2l5RkWQ
	h90v2uA5p7foKwKsihwSWWRRpDtOGoNJ7puC7vhmabpFKd2oa47viFsLBl515v/X
	kmrR+fr/9lKrURe8HuZt517CzTaxXTqcswB+0SOH+zSmdXBYfY5RpcZjrGlFg/Rx
	2f/ud8VEW4TLDJ4oXNMFM9ApnhSyobvYFScjBY5XBiHgy+fDPlceIJ6qLYHjMhsV
	obMtJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1jrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:09:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso5477541cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483796; x=1793088596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
        b=fhL0uyRo4rFfHBfiJr2o5gZoaIQ16uaEeoTvFph2LLUIGCRp3MegL440ikZVqrzIUb
         55eMCzUMIVfBWdZB3H5ecuOX3+/N+9rCs0yz5BtWc/udP5kvrQL4sfrvhcO5x12sw42Z
         Sp+lJVSwQ7KHvr/eCrwbaOW2cWUAd+SFqoqWXND1aFfCJYY1SXpbSOJ2W8vQ+niUYUYe
         9z8ydNWEHyiGrOMy3E7tm8T8n1pV1opvAIbTShc87QzSgOzYVBLnDjqs2MsOUX0FmPsv
         XajUTU2kABHursV/iQTARiHWqBEMa2fhL+BBIlIvp6uYah1/Cu46htlf+npbbH/aftLQ
         OFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483796; x=1793088596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
        b=Q5R3pM/xjq4L1dc+gTe0PfR8Fq51fdG+yEJbvxL1okEZpvneq65K835pynnSAhN7PE
         7EA7AOO4UtNxXQHOZT9xB6IjNBs7dSK5R0kogJA9W7uHPP8Ht20TQHuByiU3SXTtRby4
         tyEZd7NrqYv9f+BD5eC6qSogOUAPYlE1tNpT/xJ7RkqqVKB9iwFVKylyfhquHKDNo9B6
         kjS5NujqoyYoz8c1nZo6H4Da+QG+1AfDJ9owo+4L7IdcR8CmmdUR2RCjeqWGkWuq8nxA
         ywl9dgJ2kv201M5/ycSDdxSoC4T9oMp1NkEwqooQI0mnxnU68q4Dk+3DTwJNx5hZSool
         D+iA==
X-Gm-Message-State: AFq9FYJRyj1BD4aS2gzMKTiBoXNpyoO71L8jw2k65QyiQAleRY5bsQt7
	Zw6A8oxd7VX+SevchRK4yZ4ossYFCaIyETgK0Cb/nuxKxhou9rRuwrOz8bWEmmiu2NXCTSpSuVM
	i45zJLjV9kPMIALgBZdbMP5He4h5+7s/hz7fRb3AJI0VxisIy9SOi1x8zkdx31wr4eGnF
X-Gm-Gg: AYBFou1XP3AYWYIkTWywmOyWlM6CqBLFrqFIprFTcHoNL+79S6l7VYoxQsbQZMyF5PJ
	vD8HSVwb45Z2hLKICU+IYRq1f6CvcKmgaogMKBxRqEsXUAEXpvPaBYsRkyFY6cdPFol648a9Q1/
	UMYEb9HbeHVqQ7JMeag6aR9C8Ku1suadtVzvtt5sreV2Xg1vC2WdpdDjlrhsVBu+pFzI2T6a33z
	XGhlDO++OaOe4zSpsvQS1IBtAm/w5uHy9QShnNvUFoX40X3WtWWjRNaFgN4f/jzrOU2YSoMIhOK
	cfGIo938bo7fB8rtXXEQ0OSPBYGwVSyVNynUkV0iPcwiPVNWImGxOymR9FJvoA1ddfzJlV4fTp3
	h11rdjWB2MBgi8Euzn7nCHg==
X-Received: by 2002:ac8:5a89:0:b0:536:34ac:1a1b with SMTP id d75a77b69052e-53645d3c8f7mr186999291cf.2.1792483795527;
        Tue, 20 Oct 2026 01:09:55 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:536:34ac:1a1b with SMTP id d75a77b69052e-53645d3c8f7mr186999031cf.2.1792483795094;
        Tue, 20 Oct 2026 01:09:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm461081766b.62.2026.10.20.01.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:09:54 -0700 (PDT)
Message-ID: <0504f1db-991e-412f-9f7f-2840beca2ea6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:09:52 +0200
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8937-xiaomi-land: group status
 leds
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rc5eIBaSnqrYkDRLRU8fPWTO4XaR1iIX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXz6enp/IJ8ndw
 w4RNBEjh9Soxnkm1V5e9qEEFZSJ3hJqwnaFo+RTvYtweTv29cozNV5GZBF9baa+LIpcN+GcOn7A
 QN7TBZ7I9V88yGTtKdE6G3yqMpD/1mY=
X-Proofpoint-ORIG-GUID: Rc5eIBaSnqrYkDRLRU8fPWTO4XaR1iIX
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad721d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OuZLqq7tAAAA:8 a=enxl3d4HI8DR7CG5SUMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXwua93WXYQddx
 CTXDrDznNK62/z9GZRdusgWbsW5/C0BSpfMj0F8IXgcbQceP/qV6EoOSchLZayhGLzMOQYNe44o
 +5Yp4W2eWShnoW4bPX/ge6urHjD526q/mCdOFYYeTF8SrImBGbruMf+gQCIf/bLiTTloieSd9gh
 mRphbiFkT30T/XU4n5yyQffVN1WVB1EcV71rOXhHUkcLHQSTByQks6zQxRcUNiOfFCyyHlFRkcj
 TruLS4kyDMXISo8hDx5AHJuKHfWSRBhrA+VrAzaKewvZPHo6PLaUnmIAMJJjrGfPfWtUTDRrcwS
 nD60VXvxwo0kevf+Cs9vUY7chdB2aq4l1kbj/YCx+JHK+J4MC2EGDrXIhGDOMpvQ7Zg1xRY2X4R
 5dKRIyH3C56utQzMovZrxtzmC3Pc4OAp1Q+XHCTk6yUxs0PhK8iXLv6wPZ5f+eBSuT68ftoFga3
 P0ElmLmsN3RRTJSzG/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Use leds-group-multicolor for handling the RGB notification leds
> together.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

You can update the driver and bindings to make the LED controller
itself accept a multi-led child

Konrad
