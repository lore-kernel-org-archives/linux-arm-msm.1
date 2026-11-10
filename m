Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297402;
	b=C4MTEneuch1KQFldCBtUfwQXES9Y1ylOK3aO6n388d3gjvOAYqHJbetLGPeN9mRaFMTE
	 U/W18zrLU8iQTQ62f3mZueIyhK4emB0vddnLqADcZyQsTw9qbZzNXnIIR3nUTrv+Q+pMC
	 SarJu2yjnEmRgcbottyv0DJ3RvnxICiwXy1oQmBb5puZuyzx/bdGW0VB8kHrEDd97Atxo
	 An+pFVwB9qZxhjLi1qd307jjNq/FnNKcbWKYTRCnDfMDXC9sPXA/uuFnmqsXSJrbYzBe8
	 5KlDFoTynQErS0l7cS8GNzEhh5sDZh3UZfd9KzNgKozGUxFh4NYU3lRMkQNOY0ogf7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297402;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=;
	b=YbbThc440JOgvtX8Yny8Mw6fH0Dti+tWe6BWCzEMCs4olKfsT/BHcKA0DkUfdOgRuJQh
	 eF8ku97yIQeC903M2t+pWmf6Mji0bGqRaJOIqM7Qq8BVTukJ5n0xt+N8HKqY8U6k2R4zU
	 IfG7B+kj/9d3cxM0JPDL0LOHcG3KUWbMwW0aQRmrIlCPbPvRouoExHZ5xkcjZAHV3Xy6X
	 IEd/CU1aOyXeZqQvi3tnN1ErCVG7gGAK8Zm4Rmy7Qy1GjBgDr+D6+dQuhJI5ysNyMS925
	 SuMzgXtWZ1K9HTWTiHaNONTj5Hulpdr3Fr2Kv12sm6MBJVgNzXAZ2HSThLVdmjyfl4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljsfuuc2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKmQbN1y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4246606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4246606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljsfuuc2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKmQbN1y
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kxAk2770471
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=; b=ljsfuuc2KsWw7B5T
	3XVxHovOvzdWxvYu/9bBcn0MoJ0t+dWQqYKmmU2roIv5RIOmmZfnul+3Kf7FTLs6
	Gkk01m8PNpMuMFsJ+sIESX6ko15V8MVNBkUN0X6z9qB48/GRqexjzFXy3YEiL+lG
	pp/lK7ZT/2PgbQcz3SLo9toHIRXvuqFfu2M84yyXIPLEJP6Xy8W+GQ3tc1EoLBxq
	VbKRGAoSTDQwsc0lFA8Of+bSekvAcg3vSSJxB8zlqhGzq0BOoIpjKZ+gvS0ybocV
	KY/45zklliNqyjxXQ8mgEjiTxjH/3hCve0Deo0lHU3rzOeRQOXOqVH3uWSWKbF+D
	7C6q0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd8ndu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:56:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso31198085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297400; x=1794902200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=;
        b=MKmQbN1yfUraeTtjcm62G8ToVfjapv4L2P9iFBZ+bv24wUb3MwQ2a3CezouXEwUj7L
         Si9Wdzt4SztskO4Ug12OimpI+X0mfFnVpUUnQPNHzMGEW3+DnNI7FD7q0k9fxOAAyD60
         dGXTkp9s09INwfo7DWk9vPGdmGd0O82RvhjVk1JproaZ7u3efGPZCSiCMwJOiZYKCv+d
         n7e8PucvZ4v/4cEsOo4xPk1L1PQvSzsZwnizeqtTr2SuolYZAIzCMMBX3j18av0flYSt
         g+iAkaI9Mih+kQgNMP+x/EVLNZh0c4KfBoFjk53ibD8d0vvwK5t1qkdX/S2usJMdPdDp
         xATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297400; x=1794902200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=;
        b=x8ErRqLKuBkIX3oqmhuTL3XDDz9E93+WqSUeb/qgHT1ybrfdw3RuK8bdhBuJTLB1IO
         69zKzbmvpj9xr5R54MYKpUEbJXzMtCsSDUOIX+auqF6uCmOnYTm16Xe9YlC3P2drZBQo
         bWDnzj5aiwvOyZtro24L7gzeQB3IeTj+Y16eLk7cAqukeswUMOCx9dyBD29+zMLp7mRm
         YjaI5EDVHbQ17dcVXO0eZsM25M3SCyvyuUEnfGtbndxHjHNtG5Bx3qlxb1BNg22cqMFg
         04Kx8WqlKNwH/t0d6a2cFHdvb5BDANWbHrGOmyxzTJXRjbXsFvd+XFt2FMcqd/wDSQU/
         5rlg==
X-Forwarded-Encrypted: i=1; AL+hErFS4//HtFuoQdkMwwYtbsHAHHTDxnVxL+BBfSugctjwYfuDp7nAnkBcL/MLvEGwz5D9baHNLq98wTZ57l+k@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZJ1b5AkPCBRodKRPU7NE/Xn9/HTkGuKyQURwQnzZTzuZe1bu8
	kFxLeVNVNfKwFOQJ7sT9JB+ORqeTYnAhARzr7MmA0tgqV+hgQ5IEJ5YrbPlr01sfgwTuZTKd2VX
	MmLju37+7RsBMyj91EPBE2Xw81c8f0s4mGKv5dgBkdZvUyBjXXhN/hwGURU/w4eOglwvQQ4bvtD
	dJ
X-Gm-Gg: AYBFou2+hjxG8duIk4ceItwU7uey7dBzulRwT4F+FFCvSovZeXPJi1J9uh4GWi4tCwj
	RLpH/sUYGHMs5PeSPosPtplN1/2F6KWxWlTkK2UnP4Fmub4eIsLyIjdLY9Mq557xqtV8GkRQPFf
	jauALOSJa0Zd5BA90A/rTJ0KiMlfsMAvvIhp1mnw71kpZVg2LLNXLP8t2dVMQly30nr5hFURgpz
	r5/2TKo1dxEyNUsVa0GeKLK1C/rzgv7E8aMNFTTP7e3dw1KLP8KCEq75zOTFxoUk/pqQAYew/gi
	iYGwqvG4x/wvjIEeQEjE7/tK0hlsuhqd0kOC0AzWzB5utY4if4MohxiqJIV0ICpnGHOb/1NkxjA
	sc5M5v2OmI10aTiixEBAYsS054ADyxVR8jBtSMrSvKlbOp3Os0y7m131NwBmAGGuS1vfTw7o=
X-Received: by 2002:a05:620a:a084:b0:93f:740f:5a62 with SMTP id af79cd13be357-9479f396038mr301512485a.6.1794297399930;
        Mon, 09 Nov 2026 23:56:39 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:93f:740f:5a62 with SMTP id af79cd13be357-9479f396038mr301510085a.6.1794297399490;
        Mon, 09 Nov 2026 23:56:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm824139a12.3.2026.11.09.23.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:56:38 -0800 (PST)
Message-ID: <6e498ce7-01c2-4c68-a152-c0f86dc1f4b1@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:56:37 +0100
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
Subject: Re: [PATCH] soc: qcom: socinfo: Add missing PMIC identifiers
To: Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
 <qcxc7XsXmVOXMH3T-UIFGOexo2Qh1KtJspYZ15UrL2Tu_Jg6Uq6-PfJYTlJoipYPZnMnpNXN6wbs6pnJkkLTiQf4O9uOnp-NLJc-13wxigI=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qcxc7XsXmVOXMH3T-UIFGOexo2Qh1KtJspYZ15UrL2Tu_Jg6Uq6-PfJYTlJoipYPZnMnpNXN6wbs6pnJkkLTiQf4O9uOnp-NLJc-13wxigI=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6yfVJ0RmlrKbm-BMU7qPnb06PHRh2mnm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX0J/uugHnoVww
 MPN9egCGGCvVcJMeeMNoAnCvBpcKiDMIN/fv9QsHMNSet9OGsRa47vq/DxxJ3IoVoPy5IqUM4jf
 L/feh8DWNOeonccv3Xn5zwT1kflJ3gU=
X-Proofpoint-ORIG-GUID: 6yfVJ0RmlrKbm-BMU7qPnb06PHRh2mnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX3toXHr+jk+m7
 /XrZYSRBGIpjqtEjvMUkM8sUQkCS6Gst8FpGtnSxWH/9ADRdmMX9t9lLo5/vVgeUBoYwvtpcb18
 PIfbqRuid6/dN6EIXsyJuJVs3SpoEorYUS9FDcTGVpoyIibDvSfut3qaOmu2uU7NcJ5rI/1koW7
 W3WOpz2+X9U7mAjnmmp3ff1B9z+dvTvj0DWBneDWW8fCwPrqwRztW/VcjEFpiPcVQxT4Jt31xxF
 LbPSZVKi7NT5sMgRxLfuIlIOZQQQOeAY/cs+32hEiH8yqw6YDLay5OukI2Y6c4cQ1p6BzU0IN9o
 CjLxYCs4qb0yvybda+fCBTnO/Y0kXLaPRfqxBE5wHfEnf1fDwd3L1tdXJPrTB8/KAz7JKCg0eeX
 /rz95sQVKPKr/OWQSFD4DZJvoM+B0dL5jk49JXmJvPgFiP+MfIrwAHAFwYfawLW23MCnAbZIJWy
 WEunwRXcxmzD0nU0ZIg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2ce38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KowMc1ZSYTFx3OMWIoEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100031

On 11/9/26 9:42 PM, Alexander Koskovich wrote:
> On Monday, November 9th, 2026 at 10:39 AM, Konrad Dybcio <konradybcio@kernel.org> wrote:
> 
>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>> index 38efc5db7fa8..6ed8a4686e2b 100644
>> --- a/drivers/soc/qcom/socinfo.c
>> +++ b/drivers/soc/qcom/socinfo.c
>> @@ -154,15 +154,22 @@ static const char *const pmic_models[] = {
> ...
>> +	/* 68 is unknown/reserved */
>> +	[69] = "PM8550VS",
> 
> Duplicate?

Indeed, clang didn't complain.. thanks!

Konrad

> 
>>  	[69] = "PM8550VS",
>>  	[70] = "PM8550VE",
>>  	[71] = "PM8550B",
>>  	[72] = "PMR735D",
>>  	[73] = "PM8550",
>>  	[74] = "PMK8550",
> 
> Thanks,
> Alex
