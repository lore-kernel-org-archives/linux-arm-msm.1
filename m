Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7576630B514
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143907; cv=none; b=BtCvL+qvCflEpAxi1BJ/NHqjKWPySSsSt2xplCDO4BPWEL890RqSWJ3eEuCZ7D4FySiivdC35hGTzzz/pHxDT0PM7fPND67BvU4MQf+e7OYo5yu9wWrD/fYUqqeTD4M5EacdvVfRax+mJCwwSj6KZjoJDQbPXJI+KJ72hcOFnTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143907; c=relaxed/simple;
	bh=H7OKPWJuUeFFGVG93EmuaGLdvu9chhbbtSd1p4K1jbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tr2Sc10O2h/HvMtcICggOltcNXXvaBI2aJIqtuqjDv0JhZJlenu/TwymWY/Jmt/brkfLUIeUSA/I8OL+GHQL4C3UJ5AFPba+V7fKeT70imbCXH1BcKSQ6P1wG8T8KlEy7v/JnJoULRy7D+3xAFDHcJodszOX2EMtAnImM0PwzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqXl8hjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlBy4hXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqXl8hjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlBy4hXD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClSPx663304
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=; b=fqXl8hjVhnT8IBFI
	3NIvXOPw9jo3tHSiQAAZzXaUeO1m+c/tFyJNfcpdgSlOQWKfqYIPNJo6s1IsoVkW
	k/AUPpiEwCNZlXupB8Z1tDhoUlh6RsQ10Lt+wUB6ziJ+JwvWw96d9EvcCAHa2rUe
	fxydr1GF0WL46gOwcPLZRPkLwa4zRH4xC74vNjEvMR7U3HbaS4yJxYO/J6B+3ct4
	0tzKNolwQ9eXQl9oAMyDVrzmcOjlutQlOaislIWxMq0+o7gPUUG8ZVk6HlF+L8vI
	eJPKfLKxb/cIQ+Z3mcXGZapDr507VIRm9ECSjgenu2g7SQ3HaFWHg1mAbv2hSfXJ
	Obw5Ag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb7jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:51:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848d21bbb55so1747243b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143903; x=1787748703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=;
        b=RlBy4hXDZeenZLvczupBFHrV7VVPrBCZSMDAgMZaDwRgtzm928S5rObQRcbGQi8qHV
         /pkkzXwBO6Cj2orFgTlJVUjQuSCforF7TVVlUqkWOKKZAVAf0bA34Eq25wTQqu6+bfmW
         DAlfVlRF48Iq1Kxo2ni2LZdhMNkxIDMNMc/5dhBBdVZ9JhJ8M2Gs1qo5N1J+hZehdDI7
         OkzjNyxDTFX4nsyFGUsfKD5yiuaEUpBkgiceaH5MvPBm/bDKcq46T9895J/SW8nvYQnd
         W1tA/tS+cvlsy2yK+cnDBmhqMexnfMM+e/lL46/8P5wd3vgcQVtRhMDt+/yzTOjCR2Lb
         GN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143903; x=1787748703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=;
        b=YbeCaMPiIl0fa+TOtCwaOEY7lkAWqQnBKXGw+ZEpP42+omyX/LUiaDENL4Wrb7zNfI
         v5rYE9hFEz6MV6j4bZf4YMqh+as8nnOx+WMJf9KZyou9bkBBl30OuskLVttBTu+EqCjE
         0KyvQHIiUUhUcW7cVK0YGAiciciDAF9x71Vp3aK6DGaC0cuIsSHsxGwf9VaZzbkqkmy8
         kXtP7VEg5QfR5m1OCRo4nPcFhsz2GKElXPAP4DmHkMilFwBXFv60PuecnzoGTlTTQkc4
         OEmgq8el/FIPf2uF78N9FqCZ2INxU3ArD9FGtnVVl11MRtX3+X5G1D4wF0vNjPsAktuK
         c3nw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9uxh7HRJk06C62v0EggxJOGp9a3gV8/Kv9GjKbK4NPzzSz8056by78LE3V7a2BKrzVZaPMfocPM1N1RcT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7N4J1ohyQOHYM/4OMRyt2tl1vS/4YOOgNI8ddP1e0d8yp2f5q
	4tcFIel4csMFEH6x4WhQPiOox3Y7DSc6hzbDU/O+4MfWGhIHYbZn1N1NExJWRcSdN/rF+RKLYCU
	gSMURhUPt2nII7+ozslc6E8Wx1vMfLGcbV04p8JUUXIiBpKsHLgfGk4IJyvDZoigFoLOY
X-Gm-Gg: AR+sD10MPGuzoi1auyvzRU4seugRcLjmM5CoWyCPWapJc3W70lHOR7b6OFN70yk2yyN
	lbfAOykPIGrBerEclkDQBfDxZfrze3XJskhtqrSse5NRzUsZ4DPvB4klQ21++m4wkGmHHyrzaHO
	iTwG7+D9mMJ0kIlHo1lr1P/+Yd07YKDFOHnNDWbrSv1OpZsxJt3SHrmiPhqn+vpvUxM1Ek/lbSq
	ztyKcXaqu45GxRkM/Rk4vknH4KhShIy1J3jLhNsjvJ20F93EisZF5AcltqZhi4Ul4/Bphk45lUL
	BhWZAAd0oQx0bLhyTn+uSJh2PS/ob9r4LvGpJC2idfiftKDvy3KnVmhskcQEf3I1AVrjgluZWHm
	Qjo8QAKiairPIC90bxJIURAsEUX4f
X-Received: by 2002:a05:6a00:2988:b0:851:c1ba:7aa6 with SMTP id d2e1a72fcca58-851d3953697mr7335760b3a.11.1787143903114;
        Wed, 19 Aug 2026 05:51:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:2988:b0:851:c1ba:7aa6 with SMTP id d2e1a72fcca58-851d3953697mr7335663b3a.11.1787143902490;
        Wed, 19 Aug 2026 05:51:42 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3671af8sm603932b3a.56.2026.08.19.05.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:51:42 -0700 (PDT)
Message-ID: <7ce6df04-474b-4c68-a878-32f4df89a973@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:21:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
 <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
 <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
 <haajolsmvil7adq4pfanmdrkvgqygwioncpikawhbvvar5kpnp@rese34d5wt5j>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <haajolsmvil7adq4pfanmdrkvgqygwioncpikawhbvvar5kpnp@rese34d5wt5j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pym9xtOoOMCDYvN4xsJgzinyCOYovGt0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX1nji7SiNb68h
 +gSZA9IvvQ6oC1ZuWJrK32h9gvvml1V2vrLzrCGyEzH4HJoJXcUCrwjA4DvCpXQqihC5w9uRg1X
 bigBGf0vo+5WTRIExoBleUPL5w9EWuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXxMAKuAHveiQS
 FuKNGcGqo0hE2xiSzeohs+b0Zdx22K7/EI520JwyULXg6HTbENr8dCPRRf3zdU4nD9wkvRpoz8l
 AYxwo99yotA0VnzVqHn1hv+MsxWXvH3H0+UVT+jcj1xfM49I2n7VXAk88g4Qclm6ZCRsb0552zf
 8IUBbdslGUXNVEV2EJaC1U5tRwjpbVTT0+GUuyU/lXyfNRtVz1b4xMhAW15J1dku+MFH2IvLz91
 rteubpwHyHObCOpnxVgBUFm0q0AweiO+VDqRs4l6BgI4zQMBHyZhHv7TRR+9QOk43mjvvTuEj46
 Nd2mFJlb9OkxQCa54/pzWBWsCuV1bdYDrF9Tb+X/Xc47PWmqmhB9LMEgLoWBYVYdGUyl3Q0LQA1
 gOLPFZxtCMpldpKaE34W43HPwL2pHpiUpZzbMqNp8EhNkzlHh4gcZTbJtABFMRSaql7tp/qK7aN
 xb0Xvt0sj/2LWiHfAfw==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a6e0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JvE9p03Ddw1cDLIj5dgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pym9xtOoOMCDYvN4xsJgzinyCOYovGt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100



On 8/18/2026 5:53 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 08:39:41PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/20/2026 8:10 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
>>>>> On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:

[...]

>>
>> As per the design it will be applicable to all targets with MMU-500,
>> (Even though issue hasn't been reported for all the targets on MMU-500,
>> e.g sm8650/sm8250 but the nodes will still be needed).
>> It's independent of adreno version i.e A6xx+/A5xx+.
> 
> Ack, this sounds reasonable and allows you to easility select if the fix
> is to be applied or not by using the generic compat strings.
> 

I'll share the updated implementation in next revision.

>>
>>    Adreno SMMU — upstream Qualcomm targets
>>
>>    SMMU-v2 (QSMMU)
>>    Platform   Compatible
>>    ---------  ------------------------------------
>>    MSM8996    qcom,msm8996-smmu-v2, qcom,adreno-smmu
>>    SDM670     qcom,sdm670-smmu-v2, qcom,adreno-smmu
>>    SDM845     qcom,sdm845-smmu-v2, qcom,adreno-smmu
>>    SC7180     qcom,sc7180-smmu-v2, qcom,adreno-smmu
>>    SM6350     qcom,sm6350-smmu-v2, qcom,adreno-smmu
>>    SM7150     qcom,sm7150-smmu-v2, qcom,adreno-smmu
>>    SM6375     qcom,sm6375-smmu-v2  (apps only, no adreno-smmu node)
> 
> 	adreno_smmu: iommu@5940000 {
> 		compatible = "qcom,sm6375-smmu-v2", "qcom,smmu-v2";
> 
> 
>>    MSM8998    qcom,msm8998-smmu-v2 (apps only, no adreno-smmu node)
> 
> 	adreno_smmu: iommu@5040000 {
> 		compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
> 
> 

I see, these targets are not using the fallback 'qcom,adreno-smmu'
compatible for gfx smmu node.


>>    SDM630     qcom,sdm630-smmu-v2  (adreno binding to be fixed)
> 
> What exactly needs to be fixed?
> 
> 	kgsl_smmu: iommu@5040000 {
> 		compatible = "qcom,sdm630-smmu-v2", "qcom,adreno-smmu",
> 			     "qcom,smmu-v2";
> 

Binding seems to be correct for sdm630 as I rechecked. Missed it the
first time.
This combination is already defined under
'  - description: Qcom Adreno GPUs implementing "arm,smmu-v2" '
So no fix needed here.

> 
>>
>>    SMMU-500 (MMU-500) — with qcom,adreno-smmu
>>    Platform   Compatible
>>    ---------  ------------------------------------
>>    SM6115     qcom,sm6115-smmu-500, qcom,adreno-smmu
>>    QCM2290    qcom,qcm2290-smmu-500, qcom,adreno-smmu
>>    SM8150     qcom,sm8150-smmu-500, qcom,adreno-smmu
>>    SM8250     qcom,sm8250-smmu-500, qcom,adreno-smmu
>>    SC8180x    qcom,sc8180x-smmu-500, qcom,adreno-smmu
>>    SM8350     qcom,sm8350-smmu-500, qcom,adreno-smmu
>>    SC7280     qcom,sc7280-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SM8450     qcom,sm8450-smmu-500, qcom,adreno-smmu
>>    SC8280xp   qcom,sc8280xp-smmu-500, qcom,adreno-smmu
>>    QCS615     qcom,qcs615-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SM8550     qcom,sm8550-smmu-500, qcom,adreno-smmu
>>    SA8775P    qcom,sa8775p-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SM8650     qcom,sm8650-smmu-500, qcom,adreno-smmu
>>    QCS8300    qcom,qcs8300-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SAR2130P   qcom,sar2130p-smmu-500, qcom,adreno-smmu
>>    X1E80100   qcom,x1e80100-smmu-500, qcom,adreno-smmu
>>    Glymur     qcom,glymur-smmu-500, qcom,adreno-smmu
>>    Milos      qcom,milos-smmu-500, qcom,adreno-smmu
>>
>>    SMMU-500 — without qcom,adreno-smmu (apps SMMU only)
>>    SDM670     qcom,sdm670-smmu-500  (apps)
>>    SDM845     qcom,sdm845-smmu-500  (apps)
>>    SC7180     qcom,sc7180-smmu-500  (apps)
>>    SM6350     qcom,sm6350-smmu-500  (apps)
> 
> All these platforms use a separate v2 QSMMU for Adreno
> 

Yes, on these platforms, apps SMMU / system TCU is MMU-500,
while adreno/GFX TCU is smmu-v2 variant.

>>    SM8450     qcom,sm8450-smmu-500  (apps)
> 
> 	adreno_smmu: iommu@3da0000 {
> 		compatible = "qcom,sm8450-smmu-500", "qcom,adreno-smmu",
> 			     "qcom,smmu-500", "arm,mmu-500";
> 
> 
>>    SC8280xp   qcom,sc8280xp-smmu-500 (apps)
> 
> 	gpu_smmu: iommu@3da0000 {
> 		compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
> 			     "qcom,smmu-500", "arm,mmu-500";
> 

Ah, thanks for catching this 2 platforms. It would come in
'SMMU-500 (MMU-500) — with qcom,adreno-smmu' table.

>>    SM8750     qcom,sm8750-smmu-500  (adreno-smmu not available yet)
> 
> Yes, patches pending, I think.

Yes, those would be part of drm/msm support series for sm8750.

Thanks & regards,
Bibek>

