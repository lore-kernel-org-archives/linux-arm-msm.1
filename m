Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62613E51EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553917; cv=none; b=KDmdLWuYNJSd3sm5svvqWsmfJxgnOChCXJdvHfYo+W5U1IeKh4I5Io2t9gRvIfTwrh5vR8KTzcMQIy1gedtKvY/KGmQJatJycHJLPOdm2QpOsd4pjVzejQLjXYEc1Mht8I5gUSJ6iBeNvdGYrRahnju7cWcseWQCDpYAOKWZlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553917; c=relaxed/simple;
	bh=WZ3tJX+yLmLG4/RcMOs4NAbfrXX9rM/iECf9M06v8qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEUMosSISFU1uRvsK3DF2V+hcY39sLFKFAnfo5RlKAxfuEPdgiPk79QACN09wPoUT+zVBHA4D0A96wpbRjcopPZswyI6WowwmdJFSfZOAOXdyUEtQgi6/aQB7Ywi3gc5M+Z6MPhf69zBfZUPjcU0gNSnuPJW9B3feiOj0kyAY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pY7CJ/AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdWoN5T2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pY7CJ/AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdWoN5T2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGAZ1577177
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCM0rJzRNUvpi4o+b/ryRKlYNeynIIXpwQqsF7Efo6Y=; b=pY7CJ/ACoRLKcOc+
	pLNfV+2ApxikdhRRC+NUcJGCyUb4skcC2pW8XTlolB56YQse1eSznvotqM59r924
	pmmPVexA2CNmizTO4jdACvYmcn+xv9krvf171gqcpbXcFFfDAS0No7JwuV327eWG
	yccJE+2wlJeNrQLFP4+hUxCDmByO7DPoN8lpo58nGXH4Ti4nC5/B6rL8Ijk69Xfu
	t1nXidK39M3j9Dz5+FDf2Sum78KfH4l1kjYTYQL0HKlkUNtkB+dfWVs1oV4ANh3F
	f/Rug6obIgJ6GgGB/o23QKhxCxgO0EYhdYXi2ZYGTz5Y50/iCDfhmhLUhh2NLpVW
	AD71hw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcwjr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:45:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so3503137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553914; x=1788158714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCM0rJzRNUvpi4o+b/ryRKlYNeynIIXpwQqsF7Efo6Y=;
        b=NdWoN5T2smh1YWZiq+uzi+Sh2Sa4MW1+2zuSSRFdotwLnC3mkEv2a8BYLIWns6mBXS
         yTq481SPweHaNrJpDGvnMscFSkXuiMyIV9USauiGBnRlIXgVM2o7rHyy5PZ4b9ztW8kf
         xwJ94Z151oeJFBp1wOrWYfItpqTSm5sZD8d4r3CHU5ZUgsmlOrnCb+3fLExo6WDrSOM2
         /C9YIOzNfnhfWh7H/v8YwpJhG+WBBx7kSwckv1SFDxA6QhSvqMbNo1iNEhT4bXiuBTle
         y66Ix0ldDcs/T9UqN6uT9L/8Xq5w7+XSZ6ARBtMPunRhjYahpYfDBuQB7Sxm1rnVNn1T
         j9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553914; x=1788158714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCM0rJzRNUvpi4o+b/ryRKlYNeynIIXpwQqsF7Efo6Y=;
        b=Tw3kd2QlD/Zz9ELpqd849VjCkrYvwlr99qsMhOZFuDt10kWglukAG38DxQ3ZaazRR4
         nr2svDbDRgD7XEgCDvHRzXGWiv+bhyL7UOR1i9RvjAskALHYk8gEEGETePqWJIKwMrTL
         8Wa4o9Il582EEuVZ+pGIk+gb3IxBqzcNo6SBbVBs6Hjr6E2iHeIcbpzv6EmgHtguYz0S
         x5GogDr1FYdSf2AvyGuq8fP1ZEiuN37in89+syJv+sx63iz7Nn4AddDxxBi+v6rHqJRc
         pVykbIkwzHVGEQB23b1MmeiLGOM5YbKVxTxnh7zCDUZdCjgCnLBfDNbslZyXfemrdb6o
         fR5A==
X-Gm-Message-State: AFuF++lpiX6tJYHf/+ij5odV+Ff111v54vqHJjGIr2hW8RJVoaoYgxM+
	zpB4AS5Srt+/MgNvoMm0cA5OHCgyQmGavpOosZEElEGFvj0bMTbhb3aB+YgO/XYVizXmBMNVp+S
	2+hzomP6AiFd5L6GHBeWb81SAsg9PXdFvlCDCDXBHqm4xeXdUc/yXRhrGb+Z95IQDixfC
X-Gm-Gg: AR+sD111h8MaN6XOgGoDmf4ArkJgsrjlobSJ1NC71x3JEnSZSA68mGPY38vnUFj3VZW
	svaGoXxcCy7ADId4AONQXnUPns+HCFgZJYlmUqW1nd24eBR2nG9iwmRZT+4IAqSOSr3uLzLoZpG
	TALmo/CjZ/a83PAQZo7XYQNdsbhvwBYIBRSCAoI4eFd/OwolnL4NHkIlPJ7NdJ3wwtf9ohevhfJ
	PQIaHUxnsiq0RhpoFFc5WaDYudDHs/29mzZchCOo1cqH4HxSJHNawo6xtT5emk9vea4m2JBiOPS
	ANsBnz4mBGj+dGQ3crU+gCSAx01wDiUjNNq5PoS1o7XRFWQW2Nv/Dikda/MYB2xFaCeMopXesBH
	zsNGzdw8RKqFLHQtG+51ZCzFs
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3448818137.1.1787553913894;
        Sun, 23 Aug 2026 23:45:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3448811137.1.1787553913450;
        Sun, 23 Aug 2026 23:45:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm8250933a12.1.2026.08.23.23.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:45:12 -0700 (PDT)
Message-ID: <dade4f36-e79a-4196-be4d-ae88ccae04bc@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:45:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k
 calibration-variant
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
        Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260802133203.259734-1-danila@mainlining.org>
 <2a11fedc-94a5-4709-871d-c63c46d0106d@oss.qualcomm.com>
 <6933112f-dc14-4c3d-93f9-662c36987786@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6933112f-dc14-4c3d-93f9-662c36987786@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -zumnvza3tt4yFXtJAMwtoqMkg3fgb8n
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8be87a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=Jfs0pX_hlHZ1VWsObv4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: -zumnvza3tt4yFXtJAMwtoqMkg3fgb8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX3j8QVCxNC0N5
 Mo98/5F2Gs954kxiS9E+adpi/WY9HCGaFtSU2r3SYVDzYWM4nRkDMs9Xh87u+PmEhpcmJQXEZim
 NCRnEmkbT1Q22W/Zp3D5dlJGGhR6PK7DsEWUnYgGwV56hzijTiWO6Dq1T/9vG81LN8z6IQP/yjT
 dLNio0+28UAvUxccV33uSS2yxHLfvVBq3e5niJ8ERBGBLIc99RIQwogLdzKHvR0NBJW5gwZhgyH
 0qkKjbX/m6/j1VCSBfgeuq6v7MpfEkMB/qLKe7AW5RFG6FS6SENU2bG0JWr5hUEf/lTR4dYvmvk
 +1u6p3LYTpbJ4I7M+ubHs2JRZLlfrc+9tE90DIG6UBnHex0Q3ICRBZ7tlBqp6B+s0xLATx3Dr7c
 u9f1BxNPdujCf12UpmrcrDYR08ynbqjB3mH/gx74WUJMKc93P4lzmVR0U0NecBZxle8pJJUJAWE
 WBA7oGJb+LZIaCMfK8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX5B1s8LIcnvEH
 5Ih3YtCxhlnYtDHbqYylwDWMo+IaEO/wDYmct8By0cgupA942scFeoLtnDRRHroBQaSlUCfMN/8
 v/f6bMPZ968qnWMp8AfXP7XbmX5pGWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

On 8/24/26 2:03 AM, Danila Tikhonov wrote:
> Hello Konrad,
> 
> Thank you for your message.
> 
> On 18/08/2026 14:49, Konrad Dybcio wrote:
>> On 8/2/26 3:32 PM, Danila Tikhonov wrote:
>>> The Nothing Phone (1) has its own calibration files for the WCN6750 used
>>> with the ath11k driver. Add the calibration variant name to the DTS so
>>> that the appropriate calibration files can be loaded from
>>> linux-firmware.
>>>
>>> Nothing capitalizes its codenames, so the capitalization is intentional.
>>>
>>> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>>> index 1e78a42062c7..85811b5de4af 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>>> @@ -1546,5 +1546,7 @@ &venus {
>>>   };
>>>     &wifi {
>>> +    qcom,calibration-variant = "Nothing_Spacewar";
>> Have you submitted that variant to the atheros mailing list?
> 
> 
> I just did it and sent you a copy of the letter:
> https://lore.kernel.org/all/fc1ce95e-f3a0-4534-a315-b091d389197e@mainlining.org

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
