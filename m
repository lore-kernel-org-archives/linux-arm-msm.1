Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD773C3C11
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850092; cv=none; b=GfLDsWx2t0RWPYOkPusOojAsmCLgrS1ulpt27JhHRozdI/mxykNtx9oDfdV7yDQ4m/FVTyxwaRIOWvnv4saRm9Bxz5N8IBaTjzrCfZk1rpZ3OAvTapGC5du7ilKQWtCnUP3gjmNtKFBD/+xNn7bSvR1N6mKOmSb9ryxvb9oOKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850092; c=relaxed/simple;
	bh=OI+AYVRzzUsdH6nYeYUtW8oevvh7wVTGPG+D88nYqZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5E5lglUIJUjHaxfopsBsFlnsevSFZ5ZQenHysmA+7veGCdm1GQFbPf+8U6mUly8JJzg60ZFTLEwkMn8SP6dIhIXUMIWSeWcTgvJymj/hm+UOtnsIncHeZhnUUX0EHUdOMAzOFhVydKRft+5x77utcZg8ZJHJnLUwro8AENut30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mO+DyMEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yalp7Ywl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mO+DyMEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yalp7Ywl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xXam2176881
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPn5s17QpSTwtWTx8tytTx3YPZ6V1k7TqNVOGS+iPXU=; b=mO+DyMEWwR0UTrF0
	VSw3QdWqOTatQvpQc/csQWho46MdyNMBbTzpG23UQkhcNHgKUMC71UbKEAb7Thhc
	OZoL9hmrtqhFJTJXP45BpFJy349FUsl6tEFRU2/jF990Owb8NjeMGBEorgfEAX/M
	wFoUjJ+p6mSxPzIkGe9Y0h6Ovyw8Hcv7qarJLsRsTQ2ds9j3cI2Pr6TScaWR2Kj+
	CLUPasLy1A7Y6krC4dXcoOIAiheVvp2w6VyAiSQsMA8Gl8kA+FeolZYJHHiFHdHD
	JtHdAgaJt9miVlhjFHe6wNsudLmZK6eyUgT1gt3m2dS8S4oDJ46JhnKFmeRspUy6
	jrlLvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsabn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:21:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so3932861b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850088; x=1791454888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPn5s17QpSTwtWTx8tytTx3YPZ6V1k7TqNVOGS+iPXU=;
        b=Yalp7YwlBjMkqB8tWK7dfgvbtzBs9QPxIDRCYtDsV/1R6Dao8OntTPNW930YajMKnl
         lGQ0zIsWvVRecD7h6eZw8JdS/rc9UskHiKousYkFoHa9Jt/Sv9ztsOZdNkLGwglvPW2D
         DmC+jboWAQq7GgDwryF6YOHQ38ZeSXd3zscPf/ZgUsP2W7dg6xTpTyO4lSLuqBN9mmmR
         +UwMEI9s4fxsKFKuLTXffRtzQWCbyMlUzdwu/t1Gs/MrrGMdrkxczJecZ95SsgG4vhjN
         cfppyaX2UjOXPbe03wNmuePa0HCuoPFbKxvQdaVn5GpTuw6MpCLHmzMda71aV/1M6We6
         81TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850088; x=1791454888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPn5s17QpSTwtWTx8tytTx3YPZ6V1k7TqNVOGS+iPXU=;
        b=k9asrG+IG4gT4Av6JmZByp2b1gIYnQeOehzN+RkrtGFcwpvHNGjxxJm4U6yzqpxVxv
         4qZoz2D1pBEysq/FobQq8k6ss+QzGxSu7etUgoTa6YLFRqkrqv++lmnlVpZp2HGv5YHV
         MrjUAFn5jgbQQi5CK/I88jPTgmozjhI0CA3Cutrb/Pn2aWhhl/Qm8rS9hj5yUu30zvbg
         2UABEOBCWHn4arFN6jjK5yeJpq4ZMHrvpbq3LS7uwDLXA/gHHGAaXYymfiZ8WIMpGLai
         dILUNcXUYdTdZdSVQHqVhEfZMfp5ivYqHAoLeUTkGAAufSVOsiEqul1T68R4NXQZTyiF
         8rYA==
X-Gm-Message-State: AFuF++kGhRN53cL5EMmBRzJR6mQn2H5uLBXfGrk5U99D4XyMsTuMELPT
	tn1xJxyjooZdEEJiysyYMCV/KF5NSNYV5qkdZLPShzjCU4ntQ6tEsVybU6U1l4zfMYxr/Hy19LQ
	t+Kt2oS+L8dyo0CZR62SiAa359GloVlasVKXGqvYYvapbh1Yb1Aup6zigvhpmAYJGLQ6i
X-Gm-Gg: AYBFou3RtY74TbKpgPygLqEOnGMV4rq0yr/Q1LVa04LRWekBkWd4jy/HmQ7DC15SbFX
	j6L1GS9HAUyJCC4AR/RPGJtBdfwAuyeG8QopNQ5sD9JN5u0u5a+EDTwzQ1BvP7btdGAIbrARnOr
	30+k54Es9qyhqNeBUQiFmoJhF2kwtXOYog46THeK8G1HwbPGs9yBhRxc0blG/w97IGIgvdsmgrQ
	IvG/8F/ubuTV1A/0D/+jGyWetrH7z9l5XKS16NLY9ytKLwN6MvCv+0tK2GxXLatBTHPa5MA4tuN
	QeqiTDdZQSudLOWcfxx8d8l/4UhWM/1LuEDpM9NkO8wqcXCVX1VthQsudRZZTje3VTsc7l+Sh5f
	qsIucyoI/HOnjox45ihvooXUdFARYEw==
X-Received: by 2002:a05:6a00:1d93:b0:87c:9094:b72d with SMTP id d2e1a72fcca58-8874980140dmr2986596b3a.6.1790850087568;
        Thu, 01 Oct 2026 03:21:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d93:b0:87c:9094:b72d with SMTP id d2e1a72fcca58-8874980140dmr2986570b3a.6.1790850086707;
        Thu, 01 Oct 2026 03:21:26 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881871a46bsm824442b3a.9.2026.10.01.03.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:21:26 -0700 (PDT)
Message-ID: <9b1c7c22-bd0e-438f-8af8-33b47a19d193@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:51:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
 <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
 <2cfbbff5-fd79-42f1-bd7e-a72067f54fbe@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <2cfbbff5-fd79-42f1-bd7e-a72067f54fbe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe3428 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ePNLKXxWUt379338LPAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXzIc8ZlwLki34
 X6mhgh7XHZrLN7e3Hxpd4FjUSEPv/qjamGybbzD/vi+QwytqGrJd1+aYFSYuyqlQ3d01U/yIs/0
 nl3FZk8YMrJmhBAESQ261Zx2U0HvPe0=
X-Proofpoint-ORIG-GUID: COYUQm3jolMFgvB_mx26XPN7XGQVP4rK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXxUH0F0/4LTf4
 f6iall6yQADrIuYNL1diAF0fbWEXrXYyIWPfWvpDaqIcFV7lVp4juS/rNnlG5U9Cj8CLI5UcPcO
 6av/9yyX4bh/nvCmBVPhjorzsH3AIGd0/ws3A2R5Jp3IKDy1e8WKNU1ZiQk8lopC04bVxKjmb3j
 uGl6hWO/r8yJoZjGulHpfZApzjNEdnUYbJBN5JJoOny5/GxlYmsgMqMAfbPuJLFrmYB46C9uzzv
 CbsEvFRcW9+ZxQL8pErTPS+xNnwYEAWg4Zx6de4LUdEbr6buQ3NtkX2xMS8a3BiHUZaxM3EeSkV
 +LwHTJMXO1VRoNYHK7HIL3l7GxO92HAW+Ie9OBUTnxPGL4G9XDlxAyQbXCOgl3JkBIXK1j4ZEep
 Wymvnf5XZTuArWt3AMGn9ggl/ih4hIZo2ez+/zatti04CLqthRLKDkeQhYhrQY+Onceb4sNVyB2
 y7cEczwl3RA8/ceMtGA==
X-Proofpoint-GUID: COYUQm3jolMFgvB_mx26XPN7XGQVP4rK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041



On 9/21/2026 8:57 PM, Pankaj Patil wrote:
> On 9/18/2026 2:04 PM, Konrad Dybcio wrote:
>> On 9/15/26 6:09 AM, Navya Malempati wrote:
>>>
>>>
>>> On 9/8/2026 3:33 PM, Pankaj Patil wrote:
>>>> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>>>>> Add SMEM items for four NSP subsystems stats which are present in Nord
>>>>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>>>>> id. Add new entries for NSP1/2/3.
>>>>
>>>> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
>>>>
>>>  From the stats point of view, they are the same, we used the name NSP in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]
>>>
>>> [1] https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/
>>>
> 
> Downstream conventions can't be added upstream, if upstream dt entries
> are not named the same way. Please revert this
> 

This is upstream convention only. You can find that the name NSP was 
used in upstream as well. The name NSP is in fact used in the CDSP nodes 
in the same link [1] shared earlier. You can find one such snippet below:

+&remoteproc_cdsp0 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_0 MASTER_NSP0_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP0>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};

[1] 
https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/

>>>>>
>>>>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>>>>> index 06923408bfce..91f2d1293124 100644
>>>>> --- a/drivers/soc/qcom/qcom_stats.c
>>>>> +++ b/drivers/soc/qcom/qcom_stats.c
>>>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>>>        { "modem", 605, 1 },
>>>>>        { "wpss", 605, 13 },
>>>>>        { "adsp", 606, 2 },
>>>>> -    { "cdsp", 607, 5 },
>>>>> +    { "cdsp_nsp", 607, 5 },
>>>>>        { "cdsp1", 607, 12 },
>>>>
>>>> Is cdsp1 not the same as nsp1?
>>>
>>> No, cdsp1 is not the same as nsp1.
> 
> Please explain if the dt entries are named as remoteproc_cdspx then what
> does cdsp_nspx correspond to? Subsystems are common across all soc's
>

Subsystems are not common across all SoCs. Few SoCs have only CDSP, 
while few use NSP. From the stats driver perspective it has to read the 
SMEM items using the processor ID which matches for both cdsp and nsp 
subsystems.

Thanks,
Navya
