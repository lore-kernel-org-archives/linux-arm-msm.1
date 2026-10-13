Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240333815E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879058; cv=none; b=FPz69C+iwUHuhiHzSO5JhEzz31roPhhxuUjv8J7zb7aNFngOj64i3aEZUHbUcpfb+xI1dx5dh24k76WDDrTmxzHxCcuLD++tUYG86Tdhyub4bedEaYuLiXEWZbfpE8ggAhLd+hL5xK+S+XMuuCs1qBp/cE4jiKmzwOBFggN9tRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879058; c=relaxed/simple;
	bh=nH8MQ40z1Mc2exT425damuYKC9jptyWNp8h+R5cRgA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl/+e8WhIKQ7pt9iEarE2MasPY993txOQx8dsbMs7kt+mw/Z6M9yqs6COpUHV4C2FXej38Co4s1e5z+2LaN0Hw+jN308dF2fYtOTRNxbtcqWWwDmjy9uFzh8CrqWVpko1XfN0KZFxrp7ZFmLOjPX9+Qi5J/tasoYqP2lAOxwfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhsn0Zu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECCyCS2D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhsn0Zu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECCyCS2D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21PMx3908692
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J30WEc69x7Icrco/7FPPqYma2S9shugrlmxRjW4uihQ=; b=fhsn0Zu1lMTl+aO/
	qXDVkAi7v5NoTntV0lMNqI9qLVM/blUNJFRpebfoJPaJXNiOQpfxFwodIJ83dPf2
	bpEekraM19wha9dLLKY2NQeDf5E7xbSDrlUcE0WW/0qC/m83XD/5amuIuJVleKg+
	4XrzSXO5OERSTppBw7PiJBCDuIbm0M6ud9f7lNa38MWvpCxWUQ35TLDpP9CDRb6J
	/al6BUmMC3MMy+sTSqT5wQuqmmbC5Pq6eaII1MX+yv9oq+sN/+4YX5YoVXot6Er+
	hoJD2ik4slzSaUfw+VqJ7iqnM2Z2e5W0GaZjEYznFeQzqmNyNTlo4V5JNnegHiMg
	vxAKzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtexs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:10:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso34385585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879054; x=1792483854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J30WEc69x7Icrco/7FPPqYma2S9shugrlmxRjW4uihQ=;
        b=ECCyCS2DvO/qzeQHLjq0NBGCb5U8BIRY5RCqoUr1Zp6Gpme0+KDFjJk2GiOcyGdYv8
         0Vmujg9qTASremMEiGLV3ckBrH+AH9yugPmTeMrC8MRigjG7lvW9fYqK1cWENibtnWKJ
         OehSm6o5O0nI3z/XtlwD6kV0Lp1iDHwcyJ3npznA4aUJ0eCrdBE+vQpslJeSo1/P35hS
         xVW6drBLqgK3V1zTOe283RBgcjjT4CGxycRn9Xxi/lzUG8IL/snOGIAGorj9GHUAWEHz
         kdpxUj170a66kv/c4LljEsdsaVf6mnm0aLb+qJTqrbqEPc+Y5i6U2ZLihPHDfrmqQTGz
         qWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879054; x=1792483854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J30WEc69x7Icrco/7FPPqYma2S9shugrlmxRjW4uihQ=;
        b=l92WdNt0/SjsKB7R2LKA4TL0BB493YfrwnnEt9Eaif5ddgqaDYti5SBwNs8CCaLRQr
         Y2GxrcJ2/umGyLYj1qNaoCNIEWy5A3NIFYSEG9XI+v09Bf4FhXlriclGnzo/v8HWpTB1
         tlirTLJTVwHzxeZ2mJ91hM+ndFJZJQwI1BkaXPcDxxNpXnNaJy2w0EG0HiENfNzBpkbu
         Zzn7W8A3hhFy+5Nt63Uwh7aYvjIU9U0A01+pSVcSzJSfglfQdKa+w55/80W1vuEvnpIq
         3kNgB/9sF7PBEMvLiI2zoKczECMociTIImiYJ+/uxkU1Xj+LrbJjgSfsyXzQASq9zzDH
         qQEw==
X-Forwarded-Encrypted: i=1; AKwUvBzTgvr1l7fe36ObaqaWXUSTp82u+7WE1UyW2XPtW8sJUrQGjiZuRflIy47X0TuE2x5OH8eBpG4j5zhyQaZz@vger.kernel.org
X-Gm-Message-State: AFq9FYJVlzWfh82/wrWDmtnP7c9UfhXAs2xo9Spcwkt0QK8G27rsd9ba
	q+u4Q+tubPKVrJLpIv7NbpFuOBV1uI278vigUEWOp3XUf6Q7cauzPgj9gVX5dlN7ol8kGq3jLpV
	sMnSd1E0Yw9a1yDB+EADdJU+aqd0WjExvBwyeYArLXY4zxkTO3qtVPTzqPWXAlE1al+yu
X-Gm-Gg: AYBFou0fIKKHsQrQ7niWkFS7VB/FyOYT50EOWy1O1om6BNtbRv2jY8soY6EcduX/g1z
	66buuIvda7PoCUJiU4raN0CoGEh3Vaa7Fs9A2NusLLMNRnQ/YkFedgsjZChmKB3pqqi56E1IbnU
	mFu8AIGg0OlES/cCqct6yxGzpbXfa0QtTxp6uNmsDpt27AmVKJ3vuYSRjlW2zH1kgVszgWKYVjh
	si3zD3++sGJb3fH59eoZztlFnETww09k+ho7fBAVRpApHm9frXnPLvMAP576UtFrxHhp0TqGG/E
	bgQIgC7C0AX8djgcG8AHIMJ9/relf3qJW09/i2C/pE8zhArhDscq7al9OCTXLB2HFmqe37K6pgS
	Ta/S6q8qJ/dMoYwd1lTsNrg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2332840285a.2.1791879054184;
        Tue, 13 Oct 2026 01:10:54 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2332837085a.2.1791879053651;
        Tue, 13 Oct 2026 01:10:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31b8c4b407sm505684666b.0.2026.10.13.01.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:10:52 -0700 (PDT)
Message-ID: <82b9c2f0-5876-4076-9275-98dbb0658449@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for
 monaco-arduino-monza
To: Pablo del Arco <pablodelarco1@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004101849.34191-1-pablodelarco1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261004101849.34191-1-pablodelarco1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX7WvRRFLIxsKv
 8fKnoOC1n06LKQzqgquehm1/tR3pfvqmz7A7gm6BehYps9UnHjhNLKKrkPQ9nSDrOkYlrlyEMPa
 /SQxFD3t+B+vJg8s5KzcoFzUwBs7AfAewPIX99I1pMSz3LiN6lPMDvRapwhewPDSk4zyjwoZvQo
 /pLq2vMlVDtvQkznQj2SsrAmQBGQdv/jIKN0Qejew7jxp+58dF9eZtHrC3i2IFGKxd6pidoq9by
 ObN6PgRumWlsTbm5ST/fjXLQCBtn8ZRHi02jhU31+blBeMLHwEBpggQJbLImRBx24Pa2mzorBER
 oA5oduauboe9/Q6rWtF3ZhIcC3PCxj+q+NDVuSGLndDDkPYWs9hvjJAeqFfvTW+0hfPn8tB42k0
 4Bb108cSX7SO4FxCPGq9SrWqaNaBVllT8rr1aZcaM099Siu5HGExzVV5KBbkqZSqMuzQGqpFiCP
 Kic4V3JKQHu2AuPzJ9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX9l6abComE4Rz
 1nivv29NuRoe2swXXVHdrveVs7huTg3OmQQY2ri9WZGTlAOERgofBh6ozzi1w2u5V9usLQSSEea
 6IBdPjIP+CWcRYcfvK5d5D38X5JHKRI=
X-Proofpoint-ORIG-GUID: DS6noObkR7SF2JdSVQlET72ZxORVmaAY
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acde78f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=05w5BP5Rb16C3YaoyMoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DS6noObkR7SF2JdSVQlET72ZxORVmaAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032

On 10/4/26 12:18 PM, Pablo del Arco wrote:
> Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
> from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
> for the Monaco EVK.
> 
> The board boots under Gunyah by default. This DTB lets it run Linux at EL2
> with KVM when the boot firmware is set up for that.
> 
> Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
