Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F63FFFA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966833; cv=none; b=BcOZmFSUBzb26kHVeWLSez/lvLLcyaW5EHh0Ip7VZIV8R8fqNR/4oNXxO8NSyIW0Y5dcY7eessKOmhlg4sFE1R7kpbUEryg9dmfGiojs+1ik2kqCvQ6q6jLibC3dudTvsnTzIn9vZMdh8DL9GWG52kR2FeZ3vbWTs+YSZOJLXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966833; c=relaxed/simple;
	bh=6XixP0z1G9CMQv8ekstqyNS29bUTZB+3sD/GaUwTFlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLJZakxhzmYQIBfZu24J702UdNGzLt+j+IXvvmuqJX+M4MsPV9r26zlhU3WBOvHooLGoHunoaHf6kTTOKy58RqjlbN/H8f3p/tBt3TMEsPN6XxU3gm6XTfVbiptlWSExWvTP0n9huxAril7L1KCMI2Z/IFKVzm6fVvauqW9Sjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSwXca40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEz9cEqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSwXca40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEz9cEqy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663MF3365337
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PybHZgrIJI7iHE5wfvg6rW/UxWF/Umu+Ib5PZJNnMEU=; b=iSwXca40Y7/5zsiw
	hCFu5AefdIRXjjLp3TTr8xnW/ZkdQW+546q9zBl4ElqfOLLCbelfFyehcqA57br/
	Zzah2sQdJhyxpbC51s6k/rjLhbAZTCtqw9XX0TR3kw9OpPKeZs9fEp3eP4mNPj6s
	VjW3aZvbmwkWDIj2utt0jdN9E4pH/qq809Y7uSpVC+GZ+s26kR7rOmlq5HUVwxGD
	VUE3owj38zHOXyy5HyMCu2Jcot47zhqCvZjdXmLL+SQMGybCTAxiwdwhpcYpX+sV
	+xpq1cpdN2h4bdclezcbuGaTeXliSpfSg4e5Yayr7JdTLiT6cPbZh3ztcrB5KqJW
	/MImpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620k51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:33:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e651510a5dso34184355ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966830; x=1792571630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PybHZgrIJI7iHE5wfvg6rW/UxWF/Umu+Ib5PZJNnMEU=;
        b=DEz9cEqyPCqHBNgmKrHvSv775zt6X4CrzWUjn/H6uJeqQYSOMaztCmL8LgDxwsgJJw
         wtOhc96QXN6lfqnepVwt8L2lbzkHWgCiusMGCwDwnMDUezWXVs+NAgAzS4ISjEmXlbDq
         7j082UiL4HHzml9Ot+vlTfybZNXJQHj+o6VykXQZgLzZZYjQ52pzw4KHpFjJr0hlhCjb
         8ZqcbL3aee53SgRhP4WsFEqQQpws8FgiernaTnLgwRWucRR3Ys499KeMcqz6kklZ1svN
         Z0tqNu6JkqbOAIwT19Ng1F4XXfoCXGug832uYl/x744bP85W2PSrxfZrA2t02n1+pZtT
         SBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966830; x=1792571630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PybHZgrIJI7iHE5wfvg6rW/UxWF/Umu+Ib5PZJNnMEU=;
        b=FRwmRIel+/c5605vgYKKYQhQal+cSN1TTNt9HlNVgkZQQdCoQGSvKtMgTRRnkrbxXv
         ow15Z0GmwCNYOlTuBz9YJAJDgoUUfa/ut4bAFTMPh2eQ0vq2A7X60ij/pikigmWX/IeR
         nSIdveUKIjkt2buoBGlX2tKNLhY4f/Co5ibcNaGFDiUheu7uyHbbgg7oD8+vJHabIYPf
         IN9xOKZednRdmxHGZRdYnMHFtaSt7eLFC6AbQ5eYTza41MZ9f+5uoREE0JESqGOyNFFY
         I79/QOBQsO+Nudxd7QUSkkAwOTx69CvDZnLAGFYsSvGdnF+ACzUhcwQvuW30+iWf0912
         HLOA==
X-Gm-Message-State: AFq9FYKgEatmC2+PUdZYWIUpwpNRoIh5Qr82Savo+MwtSPLctKGDG9UA
	myi/l7iPPyO/rgdaiMXr1kZnnZmY6RiXXXn1DgsjCM7VQgD9moJJxFpwl1i2gr3dK4Q0AX6ntEn
	Kz1uruLfJNclhsHaxqOSCaCMMjvLTagqaVjHeznrM0peiH4jhhKd1dtrmrl7xGAAtbR73
X-Gm-Gg: AYBFou1vlcrucU4c6Qlxz3a7nz8ASvxrDQHQLFEJfBURI/RDYGPSIPDTpE9D71oVokz
	wSl5KTkPN4OPgu5wbxIY13vW3gBqX+W9ZlpZGAfqMJSbh3pS2QkqzncyjSJAOLwcEc9l4AK5x6B
	JRhQOERHzhlPy5u7CEfvOMv47XzVEVnFdfswDcX6jPy9hVJfZzCoZyjl+fmdNE5Pi/ZB6rOCYHG
	fInLP2P3P7R3lYeQ68v2V5Uf7pzggZmWWR1MlwqlgAKNgR3Z0gJeiWa4MqjGr4dur3zWSbbDLay
	Z+oIvHp+VVRh1z6RDfKXef4eFYxeVxeFK5Mng1pUDnvY7QaAGYOUAMJJ9PI/Z8fdDcWtAChz8aC
	y6dQd2MD4hBCcXXiwd/7tlvx6MkzQMI71y+3YDVYKXWHnWkYGVCJcwpmQBcy6WNQ=
X-Received: by 2002:a17:903:1ac3:b0:2e9:3ff7:b0ec with SMTP id d9443c01a7336-2e93ff7b26fmr10064795ad.1.1791966829836;
        Wed, 14 Oct 2026 01:33:49 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2e9:3ff7:b0ec with SMTP id d9443c01a7336-2e93ff7b26fmr10064565ad.1.1791966829323;
        Wed, 14 Oct 2026 01:33:49 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d9asm65203255ad.62.2026.10.14.01.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:33:48 -0700 (PDT)
Message-ID: <ef252ebf-ea61-41e8-b37f-ea3b1121746c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:33:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jiegan@qti.qualcomm.com>
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
 <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
 <2a6b9567-e07e-40ae-a214-2a4d6bcb29d1@oss.qualcomm.com>
 <1a8f0ef0-303d-4173-bfc2-ec8dd952f367@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <1a8f0ef0-303d-4173-bfc2-ec8dd952f367@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tg_QFt_Fno-KOxynrMHkNEXqsg7zlvMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX1ugF06WMg0T+
 /s7JacU13LT25LCzQHGOK/9B1kfPyniU+l5AL6YxXDKpotOxh9vtY72v5a8pwUUbE73wyMegNWO
 HK1jVGEIlNh9hUmB9VINHAPAtoh6OnKsG33DNBMFv18QUOso/p+gdd1oMXwIGCWEOC00UaedeKW
 QEGAA4O016brWrfrpHsuseE0DVPfTxwVBP3z4QJ/eHJS8lXDvsnfBd0Gqr7Weyfo8q97MctbXRM
 9rf0e3qjKcd9Y9JhCr5opIbgO+q/3QAYljmKSeMr5fNgA7dU0oJAmOaan4urGfDCQ3CSJPIDsEJ
 7CgpcIEr0zK4p3zUly0qJOceNukvj2VFAsNGw4F6tOOFivub2ASP3PlUbhDJ2MF6kB37zDbj5wS
 zY+o4kgNooqeymbQCebKO+HWPYuhdDA0nrtO9+VpGcBeyfzEXyPOPtIQ3h6lWIeIYaCBx61JZWS
 rwv60oUh2BQlF3qSqCw==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf3e6e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ESQR0jG560GBcKQeWBMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX8kR8pohaqUz7
 jnExgJb0/Zh3UfLQYpxSM9i9pA6VqSh1XzzrPlyE8QFsZDhKN01sCrl8PNHlGfe0x88MqDtWmx/
 u51BLSofnPHXuiaVFw5qr1+HLTIISpY=
X-Proofpoint-GUID: tg_QFt_Fno-KOxynrMHkNEXqsg7zlvMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033



On 10/14/2026 4:31 PM, Konrad Dybcio wrote:
> On 10/14/26 10:19 AM, Jie Gan wrote:
>>
>>
>> On 10/13/2026 8:38 PM, Konrad Dybcio wrote:
>>> On 9/22/26 5:09 AM, Jie Gan wrote:
>>>> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
>>>> but do not implement self-hosted system-register trace access on
>>>> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
>>>> so etm4_init_sysreg_access() correctly reports the access mechanism
>>>> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
>>>>
>>>> The CPU ETMs have a memory-mapped aperture, so switch each node to
>>>> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
>>>> its MMIO reg range.
>>>>
>>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>
>>> Do we still need qcom,skip-power-up on new SoCs *with* MMIO access?
>>>
>>
>> Yes, we need qcom,skip-power-up for all ETM device with or w/o MMIO access.
>>
>>> GPT has concerns regarding whether we need to add
>>> arm,coresight-loses-context-with-cpu>
>>
>> This logic to be handled by HYP on Shikra SoC, so I didnt enable it in kernel.
> 
> https://lore.kernel.org/linux-arm-msm/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com/
> 
> We're going to, in parallel, ship Shikra without the Qualcomm
> hypervisor so please keep that in mind. Should the submitters of the
> non-Gunyah overlay add these properties there as they respin? Does
> that concern all Coresight components?

Making sense.

I will add the property.

Thanks,
Jie

> 
> Konrad

