Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B047C34B1B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060205; cv=none; b=NivbUHiDsg+7LgwY/fDiGVWXFeF8B/zczMQazUfZHbVgI+b3/lMZqEmyY18Xob/nRfxx7nzIgK8yZ9BJHdb+5uSHzlppQkGPaf1dzxeyC5pCqXLHLsDXoxXJn+wKLleCrOV3wEpBdeixbJA+XEj4dMle6OhnP7ELEnvm5KXBNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060205; c=relaxed/simple;
	bh=EEMyodNYyojqUKJ05/pjKpNEGStpNn+ckLnAWXOb6Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGYUsn321QMDj2qjRQ/0oYmlGTU7NMB8Scy2125x1EC8Y1s5exDMeWIcud/1tDOeo9T2etj9H2wdN5VwwvPX5/rfaK+lu4Ecm9od0XSnIxMLTKsYDrw1lC6qSEifaTeDIBn1PdPa2v0RRIprJj+pPveQtqizaXoBDn5dRWlSXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYQksjDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7jNKUIg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYQksjDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7jNKUIg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jY7e2966392
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KplVd/YKYqENYMOmHIFo9y+PVYEEVdQEm3m9itaMaCE=; b=UYQksjDkUbOQufaB
	+7pgiELkyXGXOFV7uBU91E3rHdJtvmf7pIrrr7p+h7AJ7b0gtLEjZlvOz7XX2BnU
	oVdjPQUh8uNtY6kr0pwt4rBUbAJtixSCISI90BGxewMN5XKnYRdDlwvOg7FvCHss
	QZ6y5c4xh3sDeeZZUUOr5pKxda0u76aatzFwvN3n6F3NV27604z/d8l6pL1RyHT+
	vLrhcZ2gMJJA2nBY5qgUWKjkVRvTqTEdksSxd+3LFJuE0ToRvDLN4XuLa6TUrtvU
	cnemjFTi3ZvD9qjCXUmeho00a2sWD+XLpkbeukgb8NmeIqNUgL8YGEqgzIb3hzDe
	846OpQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wujqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:30:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd633da24f8so1294299a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060200; x=1792665000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KplVd/YKYqENYMOmHIFo9y+PVYEEVdQEm3m9itaMaCE=;
        b=J7jNKUIg+pfnKJzoklmo3A+CgXmcC3GSzj4EvU7fWLwJh128rvveDCkyMTawWN4xs8
         ksKGe486Gm19UBOYef3z225I1wdyOHwfq2yzu/L76K1ZV5avLxJZRq4Ebptjg/2f1+Bp
         bKI21bJWhwSxMc8W/T5HpOKYxXX9leL1A8onf4L2JEpiX+g+4VaJ7nV/Zdd6YM7Rypy5
         4bErgifdQSWtzODkLpd8x2n6+5cTTDLWgPBmBVbPXIGPZR9fAcSD47iBBt+lhChXPm/M
         e8t1z6Vhh0rcYDQltjFKKYZtfONBfw4LgDAIrbfhWUBf4mpLexBQy1R1JXj3Vsbstrbg
         F1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060200; x=1792665000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KplVd/YKYqENYMOmHIFo9y+PVYEEVdQEm3m9itaMaCE=;
        b=qRcPHn+dFhypQrmrV5+KUg+zEB4YLRwwvd98QgWPM/Al0Y6lxQqWPx/m6XrcA5kevc
         KuDRtWSrtWCrk5wF2DfYeIWxGiiWknMkeQM0C2zKmlmvKZ1RUFdmzMa6MYMxWIPfS3D/
         fGJcXwrjrciW+X6qc/BaIFmbD7KDBQnw/SmDKjYAD9Qq/OvBkRA4/OKq/B+o1mgMbJ+V
         dJ0iNWRxZ58rWb990Fo8t8uZ46TftWlDgzlcos5EuUG904xzhXCuMLnvT5rex6+MZALq
         KaxTD97j+pwQcjtHM9LZfhnMXW1WAO1rBKxx0RfEhzycTpeIDsqR5S6u9B6rORW3C73u
         6DYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0N4/ZS8qeMYrZZzFADWFTmij6J7jisORS6JjLi8vtwDO0hIva4KEYF6H9NIaKCADUz732VJRLuuJNRs46@vger.kernel.org
X-Gm-Message-State: AFq9FYLe71Ln5SiIb/rMWrW3+Zu7BmDdjcbKobi9zSDz0PMk6wqhCouL
	ATg5FOcqnMycnOWYhzPN2f8Jk0ePmbce6OIvyHQFth2tlLU11vay1DmwsOccqP+7UUchdXnF8dT
	yO2gBTrclAuj88o01zdycT3XtOFeypZYgJ18zmwsMtanYlMFvr/GPdceSxnbixVbn/fr6
X-Gm-Gg: AYBFou0mWZrErFVsrASAIilPLRcWNqjS/qghGGF8uxKruuR9aKYPi4PtYOSr98Ln+nu
	X8+fnydkvLrVL8lCshxfsH0wvkrbs9ME2m6avkk8uccY0DIAU7Muja0P/O+lhV+LUR7TccNmETW
	WsxDcHPWTgGbx5qhGGoUvKFEoJ4Z9Sejk/e+SqGCTfmwQfvXwFJxUAXNd9eBISbjXoM27zMkhN6
	WtNpdQ55hKQaywP4FOCdKrisBIgZjgxHqTaZLC83BzLRrgFJXNHyMPqzRA8THwCf/aWsJPz+hCJ
	Ec+JCC74AAo9YjEUOVIulhPDMRaGuTfEYJUNUQooOC8iIJyU7JaUpkhq9HeY1rPGtO25gHkiAZ+
	CCA3y7TRgUM7IDeM2/lq5pa8y/QM=
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr19929547a91.26.1792060200174;
        Thu, 15 Oct 2026 03:30:00 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr19929491a91.26.1792060199340;
        Thu, 15 Oct 2026 03:29:59 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm4093439a91.10.2026.10.15.03.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:29:58 -0700 (PDT)
Message-ID: <6ac22076-073b-407e-b6e5-1f4d0a229121@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:29:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
 <20261014-msm_gdsc2-v3-1-f1ed69014416@oss.qualcomm.com>
 <20261014-elated-hasty-coot-ae3485@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261014-elated-hasty-coot-ae3485@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXzXdCSmMUsvCy
 1mPZOVBp4LhPHlF5U8zVj7xREFeUnTbKrznY5/wEVZCW6jKuDZA0USGxPFpLYJ3zsQ/rhD1+VFU
 j5Ud4/n5NKhs0EJny2V4BNuQ7frez9I=
X-Proofpoint-ORIG-GUID: EodXe4T9VxfucueCPIVdDLHmTjdggzHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXzR7RRETkk6hO
 wHThqC5rqw9A0Po5aQx3nG7IP2jev+kK2KqGovylUShbPQjK3krb4MUdjrYr8D3MIXxKa+FwFFA
 XlG6xnFdXfLXvsIA9LKjvUXAUNR/j88a5fh8WF4q8rm8P6nxEyKbbJhIuo/hx1484QKdZQkpDYA
 fQDEbcUChn4IRueZr4GjdWaJGowjhpnVCX7C1YPgs1ECe4eCCuX+DO3slqtR4mLxYiCIzeKCKr2
 WvRH36Ja8KWvWbXzPmSZJVyRuyj9r5elmMLSry0FdnQp1Mkzu9MFGdbtMPb+3wAuiXX6Ll/YZiC
 QB4t0hrernmFJ+M60VZmBOltcd6WCL+lnVQHtOEtD0vOjqqR6D7XoHWnf/ZhgszyvZicqALInC6
 kJIK+opkySKnExb3EdmXAWN/SR9B845vvqTE5mMC5Q4rOF5hvGYvkdYJ8F7rLY2T8+itpkwEhN/
 KjyDOEST1clty+GWPew==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0ab29 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4m8bAy1w6SXghX4ugIsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: EodXe4T9VxfucueCPIVdDLHmTjdggzHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041



On 10/14/2026 7:31 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 12:38:16PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
>> MDSS hardware and most of the DPU, while INT2 GDSC supplies the
>> VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
>> remain inaccessible.
>>
>> Describe CORE and INT2 as power domains of the DPU device, matching
>> the hardware partitioning. INT2 only supplies DPU-local source pipes,
>> while CORE also remains attached to the parent MDSS device because it
>> supplies shared MDSS hardware. DPU performance-state votes on CORE are
>> propagated through the genpd hierarchy to its parent MMCX domain.
>>
>> Restrict the two-domain schema to the Kaanapali DPU compatible, so other
>> platforms sharing qcom,sm8650-dpu.yaml retain the existing single
>> power-domain constraint.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/dpu-common.yaml | 19 +++++++++++++++++--
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml   |  4 +++-
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml       | 21 +++++++++++++++++++++
>>   3 files changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> index 3f953aa5e694..19b791a857b5 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -25,8 +25,7 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> -  power-domains:
>> -    maxItems: 1
>> +  power-domains: true
> 
> No, widest constraints always stay here. Look at other bindings.
> 
Got it. Thanks. So here mean allowing up to two power domains in 
dpu-common.yaml, requiring two for Kaanapali in qcom,sm8650-dpu.yaml, 
and adding maxItems: 1 to the other DPU bindings to preserve their 
existing constraints?>>
>>     operating-points-v2: true
>>     opp-table:
>> @@ -53,4 +52,20 @@ required:
>>     - operating-points-v2
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
> 
> There is no such compatible. Open this file and point me to it. Why are
> you adding this compatible to common schema? Is there any prior art
> doing something like this?
> 
  Thanks for pointing this out. I will move the Kaanapali-specific 
constraint to qcom,sm8650-dpu.yaml, where qcom,kaanapali-dpu is defined.
> Best regards,
> Krzysztof
> 

