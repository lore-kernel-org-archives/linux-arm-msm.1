Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1126B223328
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420400; cv=none; b=igLE3zGswdr6p3T/M4BezDZD4ZfLemSJjJkfi4SSjFOJtPJTUxfORDFXdvVNJC6jPpSES4yYw222cHwOEv7bkC4Zdq/PqFWBAbksaqYHVXtVHvsiYjIIMpXNjpfAQAfj/I/zG6MmlONVw0DUetnfrkudPy4peGzejxPkbvuXq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420400; c=relaxed/simple;
	bh=cBx2KYokQieQkn09GfACSVjIHXBBt9w5AS1zTR8uLVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+IFvNdCUUm2ZQV1V3lLxR/VHZPECn8szLeT/tCo+00sUGSylBi+zAt9SQsGmGwQnM93uXS8z82tge90milgHWGJ/4TstqX6aEKCHNlZ5k7uWHAVy+p1hWTd5lEgPSfihWHDmjC57fPlEZgxjgPPrLUy3VklaRolgN7RYlgvM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IE5Dv+vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqgsclHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IE5Dv+vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqgsclHg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lVAG3244889
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=; b=IE5Dv+vLFSsykooZ
	eriohbqfVxeFdcKUZuklkdAOD+jVsn2dGHctM3Mai+vSHF5sVMADe4QHGHw/SMfc
	SE80FOy7RXgz8gr5hLDGhvuaLwr6USRQRAKWSWZ87AlDILQ7Sa4fpvdDsIT98dyg
	oSkTfyxEpDrUa2BFmm7aI/2B6BUGumGScrv+RLvtzljeM8xWjMPD4aYzSHv/ltkE
	AIwOk8FqoRK/xzdVnATuB+1AJ6C96TP19Bi9umraIMNQRy4fPBw3N7/VPJf77lcA
	v3qCWo+vtRzmjTyGzsVxEYebOiNr1BT1MAB2Bdzcge+di6l/FVShWLOqVQ7lIQa4
	90eshg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcec9mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:26:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso35984685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788420397; x=1789025197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=;
        b=dqgsclHgVm7VRpckXCqR902wlKsDQHdxvIfOkQc6FgAswMorB9LGtFsn2uTatMvqKa
         T0ntxN0ZFpNZE4v7r3nm9pX5e86o3vDf4Ck2jftqfBMkZRanm7YwFu4xQCVu2iwUx/ti
         Y/OrNsh+De62XtXmeZgqWyc4XPY4rDJ2BOyqkMSNTpPq6D5qCOQLrM+PzF7ZEsVVCHt+
         Xp8alJ27VvACe1b0u82xqIcFW1MBlTWgBQ4qqYvKkXRngGtjott99uV5v4YbU3x4EnPc
         2t7ex0sNAcfjEANhi1H1fQglWfNdDVGMWr7170pwjv6Uyh4TN0z9Cb0nljfQLeIae95z
         XPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420397; x=1789025197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGhkDRkFN4UB7oiyyITmRHwra+Le5AfKlpzBgCZzEcU=;
        b=Oaarp8M/GdHRvvrayiAR5xtJTzqfocf/5/kEJZHCIGVT5udQyIexnUMTcqQc+mWC5f
         ClZ/ZCvQqgCCS0vwXArJp4TN+iGOyJDZ3hsEBd4pYY5xEjQ63+y+d7D43SR3pBehi33d
         AFiynu9QCOZ4Pu83tv8weAlxwClCcTEL16pRptfJM6Fc3RhKJhojW/Z57a1QmHX5WfHb
         FOPv94f78OR9K+utN2A5t2RimrKMGJ4GQnWSC1xfnANMWyddfFTlj266pm1q5cAyTL/a
         jIUj0/eaaJwwuDY6Sc/2JHVUefs59/N6a190tYADeox6mxTYPPRVgQocVzVwjNitDvuL
         lnPw==
X-Forwarded-Encrypted: i=1; AKwUvBwtrCVDeMH9STj/acgNZPqGO8XLz+6C7YhJXTkLYZ2W4mdtH8ARUm7ZE0F52UcVntFD0bI6DxOEC87tO3PN@vger.kernel.org
X-Gm-Message-State: AFuF++n5ckwdtNU4iJam2zXq69uGudjZtzTlFLAH2knAU5EARHT3kFrd
	Jubv4Lxpk3ZrnzblmYgJad0WdAQH5XJnVsbJ2fGMrKmTnyHHqPu3sx/f1+GyAw6fN4iIYpN/BRP
	Mqs4TsrFbhsspWEkKS6xMerpn/MdzDOwAEfCkEaw2dX99uLQrsqVQzPZ6rxUA2/tPO3at
X-Gm-Gg: AYBFou37sdLsbrJVz38CGSVInaCmNP47ZFO8dwgICwtioAj5d6s8SnAASfA59ALP2xm
	a4QVYtnCdQ8oX48ugECBZiFdDPRgnSlBFXjtzbTC/Q42se6CwTfEs8GbwazRWWNICSY0+8AhSKP
	cWCc7gQsYFcPOSAijHjgbHBOLkT2hhVnQ9lHbK+Qnqlu1AeJan+8/Vkp5XqhD4IsolIH9l+/oCb
	+g9HT8wjjSLL9yd+Vw95irDk01MCdLci3kCtdGB/O4ZCRsAxdxvbVCqf4oF4DqLUo3PYX5ALjza
	0r19V7SdXBIQkPJ08dJAY50AOVhQn5TFCJmz5G2CmMCkO6dM4yxhYwwJtsHXSOargeV0UhlofwK
	tVWXP5q0jcWKy/4lvvwvBQg==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr724256485a.4.1788420397302;
        Thu, 03 Sep 2026 00:26:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr724235885a.4.1788420392092;
        Thu, 03 Sep 2026 00:26:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm44785366b.35.2026.09.03.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:26:31 -0700 (PDT)
Message-ID: <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
 <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX1TMcCMvzeDfQ
 uz0Lo6xwXxjBz/2+zyzCH+cYALxtfGAWPYhydG9Nl7/MiDobcNmm/QygSuT/EGR4cDUU4igZUVX
 I6Q0OFkDkXGH5Wme8IDqn+CICjAJDV07/Sw/xbqOvyIyAua3azkNz0QR6jw5Uj+TTa+1/S8nXhs
 1hWlOMZpZ3HTNOXgz4Cx8jNywMemkjzFniRnfJDKTTmwV2QsaJLEnv9ZCQNTBIh3yt/ew0l4Tnn
 1Xq0w2/cLsD2Ji82q4HhWf5fHnP8vWEwWuSQitvjO+dC0lX0LnDVJdSvtGvyG0LxU32dphehqK9
 MVnRo0rXCCdQZKB9iCFW+Tf61zQIH2alpJWLiyUMQIlCRFZ5YUXtTZAIc7m2YsJGoBAMZYIo8xw
 xRmUTTgDyVpVKW0uetR6aRVRt7l73jerKheV3DHTpwLqRePx7bUJwp+IeDfjoC5VtqPCsQuf6LJ
 yDBsMzj0NKqQhlOJU9A==
X-Proofpoint-ORIG-GUID: -JvmAfh6sJrJfPtUxNxp9iSjLkP9zv16
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a99212e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ULLzqpmbMi5bXA3aPCsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -JvmAfh6sJrJfPtUxNxp9iSjLkP9zv16
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfXwr7VqYI/fzPt
 aqOpV0deJ2+V9qLs2W7MFKtgLybdG5kXQXfuJstuo3j+XcVcyXOP+qNCiLZiNw1ihQlF5iE9thG
 ML+8NyUT0IqWSIr0h90vQwOv0lZj/Yk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030065

On 9/2/26 10:52 AM, Abel Vesa wrote:
> On 26-09-02 10:30:38, Konrad Dybcio wrote:
>> On 8/24/26 3:45 PM, Abel Vesa wrote:
>>> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
>>> and Volume Up.
>>>
>>> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
>>> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> Can this go to eliza-evk.dtsi instead?
> 
> They can, but what happens if the CQM variant remaps them to some
> different gpio? I don't know what CQM looks like.

Can you find out?

Konrad
