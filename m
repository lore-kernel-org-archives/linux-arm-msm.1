Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9476423A85
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952824; cv=none; b=nB+edANVSoNYapoFZlYtu9KrLDpOuG9E0KPL5B554YPUxdfcaLYJQtaDFAGDNxqWB0nqGB1NDXRAwdd+njA8PLNpVVEqDRFeStXsjEBE8bpK1zr8a+Af2kXJd0pUQ2SRmK61wRPxJ5v419Fy23cz1+QgrhuvaReFM8Wbobrosn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952824; c=relaxed/simple;
	bh=DUsYlKkvwKjjsSNqIoQQxP51Bvntujpq0lq4unmaNL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxCe5Uv9/8fje4sv/IMmIwIYTdGBY6ah48KBkTdjT7kKPZTFa74NG/oCSJSuhRKoS9k1Nyxne3owG84JKTiaiUwSjdEBSVeePWybsGdWeJABK41SNZxxCNyUpPu5x9t7PPEV8SUF86ffu3pC0ffGS+XpZncHHJHhzgYdkCpv+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECFrIsn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTiP1I5U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECFrIsn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTiP1I5U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ApWjN2569132
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQtQQqwToKFipRp5aPXLXVSkmG9dKnTQCGGbK9gORPM=; b=ECFrIsn8p5LdXh0B
	008jOPQ4K4CKWRWQsmOHYYxhJtvGIah/owRDrTJwK87nEDb/SIce+cTYI5anaw8u
	aJ/SKqbT0yDtH2sud1oI8hfSIS6rxTu7KGQcoNtTNO88Wn/urWLOi0XmoWD+PVZt
	inriZavsQwbnYzkwF68vxXVB9EGDdkJtjeXAT8mFXFzabLDXSoKvCUdSsAYPgIEB
	L1NSOpC9g6GMyeXpfBneNkvk+TXmBFB+DcbLLHolwRVkClvV3mGewqN+U0bEDpPq
	v9syV2Q8+p31PFSEnXTU8ew83iGW2hf4IETsh6mQ7qKWNnDTRvRj7gIV0/0g3QR1
	gCyItw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3rh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:20:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a28482e4so61208685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788952821; x=1789557621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQtQQqwToKFipRp5aPXLXVSkmG9dKnTQCGGbK9gORPM=;
        b=iTiP1I5UU2T+zIIQxxj2FCgpHWQqic5PBgYYfILSZ/Ezge3IGt9HMD8J46WtSkn/w2
         rBMvQyWn6ubgEglkDT0oAGmMGvCVViMcSvfyOA6BXhspGg83WQBL2IxEvBwi9QwyrXVb
         uSaaFOyf+3J4rqbGN6ZNPer0pETaA/S6iVE87R5zx5EJm7nL0RzfkQWBemi6ViTVHobw
         1FJB02Qpl8iU3nX9UvrscpHPBhR+9M/CJDUdVk5VAGqCW9Abyn0QV1ebXuuTA2W/3g2o
         TWElVMgUDoYu2bYUPAA244JGxajSdHC9gK1ymJ+dz9NMPpB+djxYeNW5CdQ4ol6bnRrf
         Nntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952821; x=1789557621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQtQQqwToKFipRp5aPXLXVSkmG9dKnTQCGGbK9gORPM=;
        b=ecEOrkGcFAEEdg/U/vDcHDoxVPzTJYlu5J0D4ivlOq/wp8pDBJ4bqAVHvmvc//enU3
         /eh/pLXCI4BkD75galEcDdo9mXOz3JQnGjuwV2MbedftTiJxK39DTkg4rnuzmgWvLYvB
         KiGcbxOpakyT4bL0Tp9sOKXoCe1aRC84pbahAyfreflItk6nsb+8iwOqppGdEB5lZK3r
         Gvkxm4mFvHCTQN1qDBS6U8WTE65/ESNfLLTcSukWp0euf9Zpb+0A2O/zQqOTXemqIHTN
         Hp21qTXaWjFYO3U5hoJZSBpxI7KJQTDf7X6hCirppM0vd9l7h8bD6xoKpwnNp5AiNDfX
         CGAw==
X-Forwarded-Encrypted: i=1; AKwUvBxWD43N2myvp2We2h20/19scuTdgEQjb56s1ITSYKsdkbOhbC/4sV5i9O2hpytq3OWddWNT3WVk0j4lIVMR@vger.kernel.org
X-Gm-Message-State: AFuF++mx2juRecD6l99qSSSRCKt3K3rGmOqNZveQEgWv0ZDXwjQbG7Bo
	oidQywjOh1jTB+SF4crzelG4HN9Ojb3fH85qxHK1vv8vnPlxf+kCxfSJI3NdETT1VgHJcXSp4pU
	DsBm5eIOmIp7ZcMG4W/KfJ/dNZgvr0SkcKHQs4D+ux/SuPv6+XdLap2eL/Z6mzD1FVk/0
X-Gm-Gg: AYBFou3JqatkH2nURjg+5iRSMd3OY5xkXjpu9vhWXWMaSVzVPdymlK3eqpsaDY8RfRR
	QPJ40cwMQXIPlLFEFaXPOyvGWDk3Hm172PZGvC29SrX1TJdeHq46km0fH9nd3VKX/5pLZSTm6L/
	TQkFlL/gmVzOzxLjrj20FhQgbFacUdua/TZRxC9t3zz0PfaPzgroue7MLhHBljLXrCF3gni3Dw2
	ZnsMa7/e+jPz3vL+KWpa51n9eSQXdnZo9DKvLfaSlPRGCodHLibmEpsjwBy0wMUPpln3hkbR1+i
	0UUBGN+5pp0+naw4GK919OlpssDIC76QmK/mpJLT1oEt7bNjk2FtQvgSoBFkkc8xJBMwhoAIIcJ
	1vMiBw07HrNtR9OAzrNt2iA==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr2960057785a.1.1788952821033;
        Wed, 09 Sep 2026 04:20:21 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr2960049485a.1.1788952820503;
        Wed, 09 Sep 2026 04:20:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm760422566b.1.2026.09.09.04.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:20:19 -0700 (PDT)
Message-ID: <d56e598d-e598-4b9a-a6b4-1d1965aca656@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:20:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
To: Andrew Lunn <andrew@lunn.ch>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <169b2cd5-d0d8-4682-8756-bacf545a95a0@lunn.ch>
 <aqAQ+BxwJstTlnU3@oss.qualcomm.com>
 <6e5624f5-410e-4413-82de-84cf864fd654@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6e5624f5-410e-4413-82de-84cf864fd654@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX9q5F1wmXweYr
 V3AAwZlPlx8gU2ROp/hUlUZsFZdaICSi6TIDooEqTwDXGOnhqmohNRAfkYPuz0ApL2EfJIFA7p3
 scM+9L5Sjt27UdlepeFgeaWRfi3COQ2dL2wjD+99d5dwNTOPKw4qu5aML4IbdXAgfBMRi/cWhBr
 h96GlaWmf/Uxdv3Cw/ge70gKDHLwukiL+xMpH+kc7UYe07JFY7Q4SoelNJ+97EocuAVhbyqjB9n
 fWnUpjhbsQUfjUreG2Pz0vWXrIClpvDUP4A6/wRFmKwV8CBDfpKQ49lh8e22hwr7wjiB1EaV3sq
 gJdnY044YeCXIWWvN8Wjuguco/GDiL3sPLRUxDD2X9cqDz+/w575fkaglDduQKh9QVYVYAK/pZc
 R91yWTcCsMA29FCWeqqPTPlQ5lfEs08Opgh8WDpJIKrSOFpgRfjLH6M6ci8gvpiK7rfDMiAcF5E
 pzRtH4Mw+p6wRToeulQ==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa140f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=aGMi1ODkbYrmhBfOWAQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YY5oKZW8_9thHf2JJwRB7HTZNmy7VFHl
X-Proofpoint-ORIG-GUID: YY5oKZW8_9thHf2JJwRB7HTZNmy7VFHl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX0a3xmYCjQlhO
 uWxRktUP+Kaif8guogoUblDhbhgSnY/vibgp3eJM4QEm0ShcVB+buBMy7A+V8iutBjokLrxiuPu
 vIgl/vTJC3JBsPeRBSS8haYCfo201AA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090126

On 9/8/26 3:57 PM, Andrew Lunn wrote:
>> You're right that it reads like a standalone fix, and that's on me for
>> the commit message. There's no functional impact on current users: the
>> reserved GPIO (138) is unused today, so applying this on a released
>> kernel produces no error and there's nothing to backport to stable.
>>
>> I'll reword the commit message so it reads as a prerequisite for
>> enabling Ethernet rather than implying a current break.
> 
> And drop the Fixes: tag. It is that which draws the eye and makes the
> Reviewer ask the question.

I noticed this subthread only after leaving my tag, it's still fine
to keep

Konrad
