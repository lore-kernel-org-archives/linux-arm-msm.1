Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E751990B
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682844; cv=none; b=ZNNdo6U0tBu4G/3AtpwedOGhfBAvAkH8VHUNCkcA0dCK1Ois4/tYlxbI1cllf4tKvoDj3xMatNFO/vTTD9Cly/tPTuXLVO5LSSeAduZ8gvt78mnr7reCUm0GnzyA9exieqQTCvQg7DshgWzGU6D3cdMRpIYPL5WqpPE8bO533aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682844; c=relaxed/simple;
	bh=GT9A2tkdXT1HEEaDSbXPiPa8cMpMUjDMisPsaCf3OpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKauCY70csr61AjpM3tfXZ16nkNe0ApE+6fAb+/RrTuXmanth2oXUykxee0X4CJfGrorvJIN8MWqQTPI0vdfUyAqsZCLs8PpBwtflhWGY8MaJgnun/wDokze1WdhZ435KnTUI1hEl8mL0ucRMTjd9G4CsngJgv4pLeB3rLPmD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn1DLsOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSJRigtq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn1DLsOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSJRigtq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj52W335098
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXUd+T/wxA5PBNsO/9AWCoJ9/TH703mrW89YGeRui0I=; b=hn1DLsOfhbwW41St
	HX6ueMHMPDyaUjvrwLVwgAl2+5Kj0hPHhg4V8x99N/H5bzPR1+xTRy//017uC/s/
	VPdUk38Fk9Xa/oirWjjIeOlCP2NMyE6BpZSjtRR4A3TjHkumj6BZqA7FxwYd70uP
	kybfVYOL4bYRUNkdnWMXOTnVQh4oHah/Anb+JRLRlZRA/7us505Q4vPL6jM7Ag4b
	wZH0KX45ngDThYAutkIYWPgiQ39ycfeLKbcK/oOnmrdg1GSTgawmUuhoGXIYYDhg
	8LMe4Ptov9UwtB3fTn/gi0H+Nnxv6rDuDEnbYbiX10MUun97uYDOR/qBeXkVUNEA
	RJx0Vg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew28wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:54:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so52848135ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790682841; x=1791287641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXUd+T/wxA5PBNsO/9AWCoJ9/TH703mrW89YGeRui0I=;
        b=hSJRigtqYM5lDT+2BWqidHuqiO26AnZbwGGYmR9CkQpIWgkIxW1fbGE5Whh0im/SNb
         u32i66E8QQxryduUetNi5P/4CgPof38nBqY+Z/oaiXkqyZNB8DQ+Ykr9xd1u/tPv8C1z
         rHJliqyh2hzN106ykI5X6Xlw/YFM6i9e2hqGLXTKENzweRyax9yJhNqLNLpKsgr+nIdd
         0+1kv0BhIxRR7JHt2LSOtBSXOpImOhA8Oj8xlD53s3x08bkmP97qAgQsTQ4a/ZVPTyN1
         UtBvX3mZ5Tmt00NKafCkTCb/9fgjzex7amfBHsLMJbUB2n22Rw4XZsh02vTJ05wqofuj
         k+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682841; x=1791287641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXUd+T/wxA5PBNsO/9AWCoJ9/TH703mrW89YGeRui0I=;
        b=Ic6FJE7PvdwjIocSqOuDWpjGP/xgakSQKj6jyj6EDgJ0pUe5JMSEtVLdg/O/2HkULZ
         ELQL4ekUrdP/z4IIzc+VXIa7mJEnYKE+fkQO9OFu6BT6qXzgFfq36yAeQH6rcfVtpG7v
         /TdiVqEMt3tGU+CeS/lOEtTgO+SLrWjO6C50QzMN41PfgG9jujGJm105m7jRaLck6kFG
         ce4cxvC/YBgBjITGdGG7KY+4maEWpDlz2ynmsylpxe5STBqBd9h8LdwdxzI2zAY6gCNd
         9ujtZ/fV3zdwXprCeknEFU4S0t1b3lqyjjK1Kk2uXOT5GqRL2/qqXKoBboy7idt10+Qg
         PT2g==
X-Forwarded-Encrypted: i=1; AKwUvBwG+jIQs8AICrIFXISVcPn2pc69jbTCJsiXHVGwgFX2m5xaB4qah0J5+TO+MBgwAZGWRQsKVNZf6sgXTOFw@vger.kernel.org
X-Gm-Message-State: AFq9FYLNWce6G8Ddk8Dl2alvassQOVDO/0kBXdpRAgkYG3N1XXE40lCt
	s2mDGFnoXbMuYLrxKJ5dig6LccqM31vG6vL6yQAeUepvmeExT3NewWgDQJJg4LXWrXedpTo6B/q
	enYPJEclSTSWgxKxyPJRjNVawMgu5lVwNL8B6hcxrstxOUs2DTtQglL6U0+Cnvx1VLVGX
X-Gm-Gg: AYBFou3ayc8Uz5WViFaP8N6iCvDO+NvS8n7KiM7JBzlLPYvekeRAy3GtTQ49J54UyLD
	1/xqWZ0xkhU2zogs4Iy9zf1/1F7TC1JSeLt07bk1+P4uFTeNDp0wUYvKnNyu8lYMP+NisVQG6O+
	w+sBrDSWJnhaVgwtas5vrEd4vfPSvXnnEzh+YxYmHgNFhj/50YJ5oTAzjNEuRjJVN8ByHZ6EteH
	X47cmaRlMKkECusUA6BvJr/5mqyJYpLJUWgnehM1i4NYpPepfr4uCju+PEh0fY74DXoR/v4cf3G
	gfw21v1PVrG5IIYGta12ydGtb41os7/qMgJ7n+h1yK4W1Z/1RHqov2RSqM90MU+VubN2/n3bPmB
	IP2kD45JPa8OzyTBIiXIm4Syhug==
X-Received: by 2002:a17:902:ef4c:b0:2dd:ad74:ac20 with SMTP id d9443c01a7336-2df7dea7d02mr125455635ad.27.1790682841317;
        Tue, 29 Sep 2026 04:54:01 -0700 (PDT)
X-Received: by 2002:a17:902:ef4c:b0:2dd:ad74:ac20 with SMTP id d9443c01a7336-2df7dea7d02mr125455455ad.27.1790682840858;
        Tue, 29 Sep 2026 04:54:00 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2d5b3003dsm738875ad.2.2026.09.29.04.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:54:00 -0700 (PDT)
Message-ID: <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:23:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
 <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfX2pZG34b7cA1r
 rJVklq7Azm8XbNzIxSGtaWmEuHiq64NT9VfugTl5MGna9mBmD4nndcS/DtNk2gDYj0SCeFH6pPy
 JxesH582GXpfyCRCE6iGTfd6QzFH6jo=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abba6da cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZFDP3znGMn-eHXZQcewA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfXwZ6HUCgaOqyv
 Wk+7EceL/0qdyaKMKhC3ZD8d+qQIY3PkbIPdRrNMvZfgjqCOurg1p/AoqVnLZuoAg1TvJ7f/n9g
 rGWyh2pBpNZz3tRroH2tdiordwbNMW0ggNXph2/aVN1nxSdOteahpxM+vLyEBJHhoJLfF6j0Fkb
 7zKR4gTDtMT5z2KfKU2e6vv1kefEpwww24lMrIUAc/F9Xs+0yiSchnoRdSGpeSwbVHSpkS4Drf0
 iLT9bbsOB6j6ne4vQ2A/1C9mGmXFlf+ppXLlv658/pRZnkAu9Z6ak8/nYnXceHzprTJwCtkdooP
 4nv3ovZ+YDVwLPgN1eQc4HDuHTF6eoQwBR319E3Ob5sBi5+zXCCRzhuYRiew7p+RTuYE9RGVGb5
 GGLPsr59GgY95JVyTc2IxORrTukm1cpVkSF4A5/QzT+FeZGDtlvrx0uiEF26Lps7qxHo2Oj4rn2
 OEgHfxtBNJOQACMB1tg==
X-Proofpoint-GUID: 8QQWUBCBmhow89C3hfqfhz47EFQz8s_J
X-Proofpoint-ORIG-GUID: 8QQWUBCBmhow89C3hfqfhz47EFQz8s_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290047



On 9/27/2026 11:55 PM, Dmitry Baryshkov wrote:
> On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
>> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
>> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
>> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
>> is only meaningful for CBR rate-control modes.
>>
>> Low VBV delay values (34-100 ms) require the encoder to run
>> with a single video pipe, so extend iris_set_pipe() to force
>> work_route to 1 whenever the configured VBV_DELAY falls in that
>> range.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   5 files changed, 50 insertions(+), 2 deletions(-)
>>
>> @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>>   int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>>   {
>>   	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> -	u32 work_route = inst->fw_caps[PIPE].value;
>> +	u32 work_route = inst->fw_caps[PIPE].max;
> 
> Why is being set to the max value instead of using the .value?
> 

fw_caps[PIPE].min/.max/.value are all seeded from the same platform 
constant (num_vpp_pipe) at init, so .max and .value were interchangeable 
before this patch. This patch now writes the applied pipe count back 
into .value (used elsewhere for power/cycle estimation), which makes 
.value stateful. Since iris_set_pipe() is re-invoked on every resolution 
change while streaming, seeding work_route from .value would let a 
previous single-pipe override persist as the new baseline on the next 
call, even after the VBV-delay/CBR condition no longer applies. Reading 
from .max instead keeps the default pipe count stable and re-evaluates 
the workaround fresh on every call.

Regards,
Sachin>>   	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	u32 vbv_delay;
>> +
>> +	if (inst->domain == ENCODER &&
>> +	    inst->fw_caps[FRAME_RC_ENABLE].value &&
>> +	    inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
>> +		vbv_delay = inst->fw_caps[VBV_DELAY].value;
>> +		if (vbv_delay >= 34 && vbv_delay <= 100)
>> +			work_route = 1;
>> +	}
>> +
>> +	inst->fw_caps[PIPE].value = work_route;
>>   
>>   	return hfi_ops->session_set_property(inst, hfi_id,
>>   					     HFI_HOST_FLAGS_NONE,

