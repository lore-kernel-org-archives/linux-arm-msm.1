Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D963AA1BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861461; cv=none; b=XCXHjcPgmY/RYw1kEaV3zAfwZ05OVJMt30nhAzCmFgno656YL6OPBtSBKsWj84R1dn1IJg4rJ0PtS6m2wmx2nTv0ZTPzBGUUiw4Yn7ktPYBhPKFF7sGlAoI2jZrqCGKWXElcz20qsi8Y05jEOfW0etAMnSb1ziW2M78eNrRrHjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861461; c=relaxed/simple;
	bh=bUB5yJ7aQ+oD0OEtatKSAP+MZmjX/d3fiGJdZw4rV6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DP7Ze1WUcZ5+CK03sP2t8ppNGwObkxZYvTwwz04Rg3Ci8k/74wE6DPVKCV1VrKAhy3kMd63iBaAz4wcLkzjFtZJWIAzxHhjq6c2QeSm8Yr3MyDbt7TqBq/8Dco/YrC4mlhv/Rc+zdo1jv9TZ06XwMG0xF2cf6HBCsNhcoSX95CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnnIkPnn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cItLyrOa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnnIkPnn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cItLyrOa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1Tr2979240
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 09:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=; b=dnnIkPnnQTVV0+JW
	+9edF8QTI7D840X9Ldr6a9teOCePvCBBoSPMtiG+NtsiTE8zEJUuFmXA72Msfzt8
	I+VgixVeB6gctxPtB3hy2rpk9lN5VfLnWr84ojvQCiyLfjkpsHOD3MJSY+fZfjkj
	mKW2A948itWVVt+Am9HdZsIHpZ2oF5bhmvS/X8Iulf8ViQLfXix/KE0J4ZFBbJ8D
	pj1FkyoBIn2gYu1yVF7mO+vp+4nKzsOiGg1FdrPNfqlKdRJkp3nJoXubpE5rgWpu
	FQ3fL6rYkgLkSjpTHy2GtTHipEKM//X5SY0nWE+WVsZeB/j6gmxcQhZelgbvrOJy
	QDh6sw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykc9ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 09:57:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106868fed8so306036d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861459; x=1789466259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=;
        b=cItLyrOakRXFhPAWRJ0zZ8BwdRBGL2ufg5KJCwuZcZSBh/GCJApsHrMHUgbwElXx/J
         Eawh0Sau1yJL8mCEA/qKF1idNhok8gU22Bl+klunRC26KpqU7PZzo0mUqeLkElkbsbYU
         6ma3aQ452SUPaMyAH0bgHiQien/QJwV9x7d0RlZiVIYnNZmVKX3FnK5tXOE6PBuKyuYe
         ZB/ol7UFDJkC8CvH+0uPdPsNCt+IfqI/avq6F18NWfXXnr7kP7gIyaPUIyls5OuT1aej
         LWUh9yPZajfOgXt7kYJRf0MYo+NPXTtHYODdbErmgEFCnwwZ7Ahm8PXS/P3c60A75aEc
         Yhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861459; x=1789466259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=;
        b=tS/l8knd1YODN3LrzPUwKFAcSImw4DjNANBVaBn96v8p2RRNd9jdxC+mLBMMCfn9sB
         E/HJPDyohPiz6OsdRhZqVugXrBvgw8CxvnS8uh8kusUQDpNL2o/kcsFk8KefXB7k4ZYS
         0jPjQ817gn3RXckjEt5YoGCdf9AzzhBlvnP5rMqwx/jHKTaX8kyjw9CKFvi3bXiMwRoe
         sfAG8HQYPsFLLod/ocKcAwEVEB95ZYNBBm+/ua+1Nk3GNi73ORl7meiWEGuL4wPBAsQ1
         u/Y1YAZp/eSrF9Zu56orSKkaPBBIf0L6q2u3aukm+J+kh6O59U5CGd6HN6IfLlyRGonG
         0zEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3HwZHD5l2YzcfobZxmfC65htdxxlL1Rb/V83S1fx7dmXnZ+wMK4KOHSX1iN0dTwC7u8xN6X+JgP06pBgS@vger.kernel.org
X-Gm-Message-State: AFuF++lM2PHMjI0s7KwcZINCWSJpcN7VYrg30Z1B82A2aVSBLnYEOf6R
	3rCWKvsy3pmAHc8LogAvYgtQuraZgzziLIHlSih/DqkJVRn3Nx+bFCQ/dCzrQ7d3BJXEJc94ScL
	UFuWv3urCfyGq1KZUC9Orv6JqUZvWR3wGgI4pqpUaFhwcioR5QQaSFhaQTcgV90gzFa0D
X-Gm-Gg: AYBFou3xR3N5x/3j1BI+u1o1sALloa1F3khpvEPkTg86OCw97cC5YCnGmcf396K3aJz
	9ICanbYUz4shOYPV882glWCSx0EcAl3VRVnpOn2AG3dfnq/sNDWZt4Xc1gVrgdZx7occajR8i4c
	XmjmRP6lubmTY01EaQ0tDaSGVrFq9VzMfopa1ypLlsVKNCklxNbpvrHAnBduiFlIoj7kjugRDMf
	cO0P5k7+6UcazP80UqeIb53b0uc6+HhKZQdQ7miCkzaqXprDKK9nj4zfo8IyaAaUh8XVmzD5QfW
	CKSF7Ct1921bncEekWmCVKvS9YT1HaEzh9JS1pnYKf4bKN87OR1hugASDjaa0CQoYZUzY2GA9M+
	29Ep437yKLsyMkhL6QdUcFQ==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr230021041cf.1.1788861458548;
        Tue, 08 Sep 2026 02:57:38 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr230020281cf.1.1788861456867;
        Tue, 08 Sep 2026 02:57:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm5164740a12.7.2026.09.08.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:57:35 -0700 (PDT)
Message-ID: <4d2c00e1-8331-4a08-93f9-6564d0c46aa6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:57:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
 <ap_RKfCbXAVBRtSY@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ap_RKfCbXAVBRtSY@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNSBTYWx0ZWRfX3jMgQ2sNVs+M
 td/Bk6X+dN2QNTr4h118WVuQ6hDhLsf04WafMJhRrBPjyR/gswhwQdhvom/CTIRXGUG761x9hkt
 1B4KYDuxGp1PFhsU/rIvuGO4acwMigY=
X-Proofpoint-GUID: X8rRB6sGcNpkqsYjbGwXtCCZfYGP5qE4
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fdc13 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=MhUYJUi1OxyXR2b_k0QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: X8rRB6sGcNpkqsYjbGwXtCCZfYGP5qE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNSBTYWx0ZWRfX173DFvC819md
 jD9aXKPMKoejlSLa3okf+uIRBpsxF8s41qB/V89e9KmEMppMhyRfOff5e65n1HClm0pPrfFJxd0
 hPXKO2QkacQrrv+Y57vUhMJO2TCi0b1Inxkz5ydn+8GIpfBKCy2fBvsjkvUk4+wj2ItelvMm7IP
 VjNIH9ScWnPXfyXiSEQEIb5drGYZc5gvT5HlGptHKI2D8t2PFFvNyuvNDpS0LjXqHNwGiFW0xoF
 eeQOE4hmYykHzHlFmGsOhHa+Kd6BAwD5SDdTZfE4xAZVmgcnV1BC893InT+lNlCmguVeIrBk6nO
 klsmyjwMs2nfTJI2RpJpY9UKl06sxEwcobfIIXyi1+p6qwlr8gH8IyauDcBmttEcuuINU0cUo7c
 ktj2AOVs7YlWQQ54ol39uLWnIMNyiDYRwRoJ9PMZ6YtYV6eWp2fn/2WWw6yeAqEqlKK0VPnCgCC
 ZQdXKsZqK8/q+pLVjiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080105

On 9/8/26 11:11 AM, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 11:05:34AM +0200, Krzysztof Kozlowski wrote:
>> On 08/09/2026 11:03, Mostafa Saleh wrote:
>>> Hi Jens,
>>>
>>> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
>>>> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
>>>> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
>>>> chassis, different silicon. Stubble and the DTB loader need distinct
>>>> compatibles.

[...]

>>>> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
>>>
>>> This series does not apply to ToT nor I can find this base-commit
>>> in it.
>>
>> It's a public/standard commit, next.
>>
>> What is ToT in upstream development?
> 
> I am using Linus's Tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/

This tree contains the latest release/rc tags, linux-next is an
aggreagation of each submaintainers' branches, effectively "what is
the next release going to look like" so essentially that's where the
development happens

Konrad
