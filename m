Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E03AFAF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217777; cv=none; b=Q4DopXmhHKgA3X1sQGE+MnYmkj4fnCkBiZJrhSyoJpW7DWDWgHRi/bnvVcBC+quMpBBAmVAC6tLsD6pBSdrY36inwmywzCBiMuF4d7GPecJLHh/iWC/TuHg1CBv3l4ghMrUrFrOiSUAz7A8OOVyvLeB7JmCdL7H2Ya24hh2zWiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217777; c=relaxed/simple;
	bh=XOx5Rhua9OWaqPeaVQt7XQ4y3QPc43N3uZZGlsa8DMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG0AdEZQPg07YVpdkmXizahVYTwWWIz6dj0slLdjPPi3hPwFKb0dz3EsLfro50gzCb2n0hRPUN34hKxb4IZ/pQbCafLwRDxIEnxQgCkVy01CgOclBo/q9Ed02hSsPpzh0YnajoiKRLqWp7yLCxwuLDfZeMEhGrNj69tWm/jipms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wld2p1uP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT5WTey/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wld2p1uP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT5WTey/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K9JB6K2927086
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEg+BW0+VrS0plyWZ7tPL+T6IqZvRONSfa4SWkTUYCg=; b=Wld2p1uPiy7YRBnJ
	1GnL1uB51IJYNO6ufEkKNpOfNr4/HFPC2g9mhWCQUNTTIG0z506QAtTBw/LVvO6H
	V5VcFYRJRz49jGkRDCB4ZBwgpb0J/s86erAV8kgmapZVo4igiGdj65UozA9Ir9C+
	LAdW1SCqPBPHnh8zqngrsq2Ayh5xuK4k1hRv0J0aMh9RKyDaIFOrLYxvZnfbZNIg
	9kynygmKEzSL+r4LdzBcIzSGseC2xWNx6CeL3rCuwdFOU/JVv4IGYl755QzPZPlW
	A9OoLZQ5ryHv58ZSpwJgPFq+RbN/0hhnJCPCXbEuptPcDN5g8MMVzGEwX0Up/p3M
	EIcFrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk00j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:22:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso3388585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787217775; x=1787822575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEg+BW0+VrS0plyWZ7tPL+T6IqZvRONSfa4SWkTUYCg=;
        b=MT5WTey/Ut8SR2hqBljMYI7aWPs9mFDs5XYldsB7y8rN1sCkFrvMxLuwUGBeRZsVrL
         5u6AJ5VfGpn4uy3Ei7CUqVYi/OHllGJEIP0SI0csw2YaArsVllCovOd/cnQC3CYffw8s
         OTMsviSU5rTHZQ4hpDWfAj0CGLCEYYkXj0gUZ+RSU6l2cgEQJ5Gord0CDJjeBRyzFXja
         3zd/7g0FsJneRLyimuvT5yMcTJ1QyYt1eq3Rj4i5cK9ssrzAgQMk0qBtBSe9+mjfZVZY
         FhHHZgRoWhWrb6Gz6y4milHGjRJWHuD5sXFC6wdBy+4Txqj/OZoly7g702Ix+SscKZz4
         nmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217775; x=1787822575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEg+BW0+VrS0plyWZ7tPL+T6IqZvRONSfa4SWkTUYCg=;
        b=W6XA4Z5F+la+OXv2OfxF4rUtc0yw0TruDNi4gl8foPlxDSVSXuQWrxIl3kra2caU/F
         x9fbsLN6WiU22lOwseebIZyO7fZ7sApSm9TTI8zZq9vpWjiDeTu+whVB98e+wyU89Gy5
         HpnwOjlFgPYPHYDlPjrpWr4+FvEZtzRNhmH/+bCSZPbeWeVMEpMH0QDtIE4TXW5IIDTc
         9LOS7vBhBqpW3ihse9arw1lx096P5PJWQsA880OBXoX/gmUx1q0Bar7BLF2xN9JVVVWx
         b5daRYS7wxvAcvI05shTT4dnFCPKQQWvNY6TAfBzgressfDikmO0rKrTLZfLmubP7Rhm
         IdKg==
X-Gm-Message-State: AOJu0Yz4SbLKrAgoWty8kCsNznXSPN/2yOFPqXNZt37ARK9Nsn5cgJnh
	IaXclRQhc8GuO+D4rC8mqpZlvFAfCqFJNv4nObYn6KhppEvW/EdqgrZoud/BemLP+wu0Z2Socwe
	TTbNc+6ugooHk4w6dsQTAztZcgf9ewzfFouzP4BIPHWQ3aYmJFN2we6KI3rg6up16Lnc60TTzKN
	9R
X-Gm-Gg: AR+sD12WnYH3vJ+97tTv8uGhCkQ1GmYXJZO32IvDaxKXZBMvnB3fBCG1SHVa4D8l7VI
	02geA5zUIxVyHWXeyajBosBNqsB7PPImHoDSH7tLO11nfoHMzC2ZPOU5yClXJ3SmkLFqw1T7moc
	fvB9KFTYvBB+FWHCzNuUM4iP6Tpahu6couM8pXiC9OTTiJszENWnNw1APiGoGxNwLcTcqDHeWoq
	/6WrFkaCx1tg7xC0U55uCH2c8bHQpCU0o4fp9/vzesJ2K5pdjD5EysmaYpwPKme1OAfNXt5yJsu
	eSrfR+KIvGMI4DL3DRNwjsu06Gnu+s5T24u3NZfUTPUUa1GGJaSa0Wmg0RUV/7tvBF8TXx7+jf0
	/7RG+XtSV/XQJV1L58cUFLIY2
X-Received: by 2002:a05:622a:313:b0:52d:9a83:419d with SMTP id d75a77b69052e-52dd4dcf2f1mr79004651cf.0.1787217774542;
        Thu, 20 Aug 2026 02:22:54 -0700 (PDT)
X-Received: by 2002:a05:622a:313:b0:52d:9a83:419d with SMTP id d75a77b69052e-52dd4dcf2f1mr79004481cf.0.1787217774210;
        Thu, 20 Aug 2026 02:22:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198966sm46036566b.41.2026.08.20.02.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:22:53 -0700 (PDT)
Message-ID: <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 11:22:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oDLSSOHUF_o03-aLCWGDuZvpLByTtmVc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2NyBTYWx0ZWRfX76AFdi5mfVyI
 J+8/5yDzdBl7XNqVDwnzJ15tXZpfmUJL5sGkXBcTr0c4MlKetc8F0GJZe/ATUvRF3ZpcQruuEXt
 O55jSComi9vF2NLxbSQCfaYUhcl9UUM=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86c76f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z_9H9m6cyw4YOzOhL5gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2NyBTYWx0ZWRfX5t3NGYo9kwEN
 k7pBJT3BkRIQPzt/VfoLIKDKlSuNJ/Fd/cchMbe7faIH425F8zxfQm1pYHMX043fIrl9BH52LcB
 SMA7HGxhYxSvw2o0SnkWhiSz0QkX3zP2pyukp8lZ+X7teAtCHnoGJqRLNmQYQtLvjX8VXGmY2n1
 skwwmzy+46+XgtsWAIUXjWBmo/OliIiaVmhZqfdST9RwH85WA9iONwebqDoUa+S1k44v10Myl8I
 Sos0UYNeVEJrdckwjlnEIlFZLa+8XcfC6hEdhl0mSYx/x9T8/KSTjMUa9F9WTGB/a7Asc88TsdJ
 6TL1VKSaJDlvGprFX6SgwXqDWN0v2PKLoXcstPbj2JZdZ82yNth6/31LUqZnXvR855MAITE9arw
 OQpgKQl7YjFyEUk/xqxInvL7qW9PWeFO6yl/OoyuqjUJ0ZTjrd3292xDYS3RGMgcoQ5mexUIdop
 SM5MQa5owu7pBWvygtQ==
X-Proofpoint-ORIG-GUID: oDLSSOHUF_o03-aLCWGDuZvpLByTtmVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200067

On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

This is not a valid tag to put in the commit message

Why haven't you sent the two clearly interdependent patches together?

> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
> connected over SPI5. Enable the SPI controller and add the TPM node for
> all three board variants.
> 
> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>   https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++

Turn this into a single addition to shikra-evk.dtsi

Konrad
