Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA840F753
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 04:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445405; cv=none; b=mxBaAA5wy/R8YGLfKTQ2HJg4Q7GS7LeU/q1R9O4/AwbdIXmgU7mPTzbX4padQizRMfd37+WJBfof06BzsgaQtKgNgbC/xHXCi1kcN0ilW4yLDodPhCYFCuUGEzUc6jbG9LDEAQK65bYv8hihPEAQPzIahF/gFNGCd0bLPgJ3p2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445405; c=relaxed/simple;
	bh=5/UEmGyvjUelTNLqKGyOF7yi6ipRpSDMVbVtq6GQUXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E18HaVPrJtouCEJLcJoALI3X0BFVW6T/ee828YEMwowogpdQ4TpttSIvr29Bbp5Ub/C53rZqhKQgg9i5SZE2oXz0lVX/Wfa+/ploFA3QiqYKJtfhlhcL7p0OgenUD7hbz+wqOkgDowZnuKnHjxOuAfHw6GmAj9pVucQ0D7wBAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1OQ6dZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4NZurCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1OQ6dZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4NZurCr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nR0B2623193
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 04:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNC+AUAFKHA5K8kSQtbDlsobu4uabDN4gJV60Y9KxbA=; b=Y1OQ6dZF07CH00Tf
	hprHuvIGb4bvJNQDbcMVkh3LpO/AbGsD/eg4JcNPVi43fOK8BoF2Nai2sAp8ixGl
	XBv3ITxnkADsjS1YZNs0QIWWRxcxDS74HhL96xc2b7q9qUbFUQxtoN8pt6ZYcyoX
	/Oj6MjecV3QLpc7dB7mjVg0ncu62Rz5AJv//o85s3KNlOZBjm6iVy/ySztLRyn4e
	kuSP4Bn8crR1/KQLWqGz1/OS0tQzurWDovjSUL173zLsZ1M5QcQMMP2I/YwCqB/e
	1Okd3Qa/copeUIc2seHNtH/hUuNBdPrZRnXTTfNhoy1/ZaSCbtAoOgurcC/6rQ0Q
	KoCiqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9t89k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 04:10:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5025549a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 21:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789445401; x=1790050201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNC+AUAFKHA5K8kSQtbDlsobu4uabDN4gJV60Y9KxbA=;
        b=b4NZurCrctj+FJ7Md9oXWISEpd+v6Cxx6ClEwKTeChmkC0QUPHZ8c7HEy8fyNEdiD+
         DvEzagZbHkOFt5ZMvpzkfNdhueQBMJ4xoLc5ZwNAMKJo3oB+QfDKfvsPRcfTo2cXgBiq
         uQAP8fFahb3ES81N5h89Z+betxxbMfNMtikkZohhYgpeJh8PeJZ712gwbk+W4XdsJViT
         0XKS6lSNrPdUH41Rtxjb/dsP+LITWuT5KXhkSO8aPh9w1kZABeipoN3F6Fhac2GBJkSb
         BG1vdUINP1gOLfNbIrIMS7CvUzyVegwSmddsEcFx/fMcAKNYjkEXDm4xLLcLj1YwOqEN
         wNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789445401; x=1790050201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNC+AUAFKHA5K8kSQtbDlsobu4uabDN4gJV60Y9KxbA=;
        b=ShAHWWMHvQFCTvl9RWJSdGSgpQnnHFRbz/VB2yeobV2tS/B4aXB+Fv3wug99V5u081
         1RfW4C1CNSwpz26o6CI3F4W3JRLd/4pEqWuu61oTDezCYvLuaOt5YL+cOQwjIomX1cL+
         u+hFhA1ipaaPa3YPgLkiOmbefDaohH8bPbWckc/DR9TLXtx0S0OqkAfa3mxFYzJ+avmb
         OZ3qst91UUlOzAG84ORg7iz5l6nv7U5M4mxnhdxTF+uWla6qmOcEOww5J4aGyeu6clLt
         nVd/zHEAu5PoDhtg4RLE6UudaiEo/3VNZqfqAKMsA+Yx4gXdccgc4lI51LCHOlqPP4Pv
         wC9A==
X-Gm-Message-State: AFuF++ktRc5oVsAg6KYWoFiUJYcoPW3Wl6lIQWjy6lUiX4iT4x8NN/qB
	oPF1td9plRXIzDsCLs59+HqesCzYjjj8G1If+DrReWbuRfAMaJSqbU264TW3HAevrLyvwBW47v0
	MKKmjE2JvnrH/QIK8C5fPL1cD/SEJm1yAHk40TGdJ55na3KcrogrTvX/Ztyp7P9oQearj
X-Gm-Gg: AYBFou2SH7DjcMm5S12JtC1DWYph2VL1FxFTorECsw4g7CuLcmuo8smLrxZkCaUAvvY
	nq1Pqi/+X5OcdsvS1um1M9MliHIrGFHYpcvTyqJWWneCsv6sMPn8Hcm6f8mGqyQd3wrw7HTRUvC
	KI5UftWyQqE5dfDWZr+SUrQxihoQYw8tDTFZd52j7vIM0qbvb0XmSVDzvyJ5dNoL/FKf3ECmhzi
	mzw22r8UnkHV6a2nuoobojjTR036NRaIUMTnC9zKcydx5VhhK+tdqjxoDG+zfx9V9d/V8W12NBe
	aj8nKXfD+6pWHn6Re66jKVDxeKrSP4zsK5touRnRBrtrE4Z+d3o2qb54N9Q1ayn3EsajB37QFFI
	nP1dpAS4S8xcIrBE60MaJRkAKq7Mb2h4QxocA
X-Received: by 2002:a17:90b:4fc1:b0:39d:fce7:f63a with SMTP id 98e67ed59e1d1-39dfce7f7fbmr5244339a91.6.1789445401406;
        Mon, 14 Sep 2026 21:10:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:39d:fce7:f63a with SMTP id 98e67ed59e1d1-39dfce7f7fbmr5244291a91.6.1789445400986;
        Mon, 14 Sep 2026 21:10:00 -0700 (PDT)
Received: from [192.168.0.184] ([49.205.227.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm34800663eec.0.2026.09.14.21.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 21:10:00 -0700 (PDT)
Message-ID: <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:39:56 +0530
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8c51a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=liDgL1ZI6qKGmvkE44Npcg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=axu8wqy0O_QUbl4U0P0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA1NiBTYWx0ZWRfX69WsSDjaXaew
 P2IEsHQ7dFZR6lp8G8LdwW2ErqNtffc2O77VoTTlKe6PtgzaT042Bjr3H8tHL45iocrcgBGXSIp
 VWGBSHNfFeEFFDs3mDd24op/ohKlqTjAVPlA3EdDXq+Rqxw6L+UkSacN5CjpqpoTvOcAyruarTf
 xoSKl02qm/HRl8hbJTjcMoRmZFqlL13oi3ZJDiiVTnDER+z9rVXy0VdiSXe+Nx9aCfioMhubboC
 LiqelV4SIQDzbG0mLGkuEXegkx419ZGpp6Rt3BiNOi7s5jCR7347SKtjnfEACEMA3Ida60QlqUI
 jAegCryiK5I4I/FOVKsHzGqbtWYFnidCRFHUFVUfWrTqFK0PQwOnsFd3wdf2vU4zK1iLj3dd2E0
 Sosb0OZTaXi5GwgojkUf11/zr6KbLpH0rrE27rWwcPudwriA+SsE5LxUPLp1hCk3TsrtZ3YIiu+
 XmiGzL6oZyUHM0IEzng==
X-Proofpoint-GUID: DYC3GbxGqpy1riEZFIVtHZQVwr2gLxWh
X-Proofpoint-ORIG-GUID: DYC3GbxGqpy1riEZFIVtHZQVwr2gLxWh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA1NiBTYWx0ZWRfX/yKNr0Ea96MH
 oUe82j++rfiz6mM0xqodYuJsOK1BV3r7r6EGPQeH39K7s2gX4u4Ym9Cz49itGxW5zwZ99a+QrUJ
 zptxNZhCXChnI1L4fzjI+ykkSo0wBNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150056



On 9/8/2026 3:33 PM, Pankaj Patil wrote:
> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>> Add SMEM items for four NSP subsystems stats which are present in Nord
>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>> id. Add new entries for NSP1/2/3.
> 
> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
> 
 From the stats point of view, they are the same, we used the name NSP 
in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]

[1] 
https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/

>>
>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>> index 06923408bfce..91f2d1293124 100644
>> --- a/drivers/soc/qcom/qcom_stats.c
>> +++ b/drivers/soc/qcom/qcom_stats.c
>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>   	{ "modem", 605, 1 },
>>   	{ "wpss", 605, 13 },
>>   	{ "adsp", 606, 2 },
>> -	{ "cdsp", 607, 5 },
>> +	{ "cdsp_nsp", 607, 5 },
>>   	{ "cdsp1", 607, 12 },
> 
> Is cdsp1 not the same as nsp1?

No, cdsp1 is not the same as nsp1.

> Adding cdsp_nsp_1 is very SOC specific
> 
No, this is not a SoC specific setting.

Thanks,
Navya

