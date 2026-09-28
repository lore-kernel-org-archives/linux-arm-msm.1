Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C54E020A
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617353; cv=none; b=nZWxe3VwBXghxt3lLIoe5tXaKuZhy/p2xSl4p1bF7gmx/1uwQ0795BoFV0OXXrNQxQWGvus/5rZwsRWTnDTG2gH0zYq/nvXFE/tvNWMaucw0gEvkdKGZ3elqTIzn3VWq6gDLCheos6I7EDzNMwKrBB4QcOaSs66rdZcuf9oFr/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617353; c=relaxed/simple;
	bh=aUUSmgHqQhCtyaUyPVrKNdKUlZbWL0wNpisO5osGGFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s57T/vn13VCzsPrF+R4ZT1U6Vu0kS0OnSKzMMgovUBQW6X7dB09Tmtvf068bdOS1dX3myfwauoVtH3nSenCPWoa2eEx0xHWGagpk/FQJZFe81YGss7x2zSK8u8be1pk7N1IiulTIbcgKiBhMFnWeL5eserOZ+jtGsA3WZvpBZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL4Wl/Hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8QAlRx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL4Wl/Hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8QAlRx4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe2vv2756038
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 17:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=; b=XL4Wl/HwJgVRsuK8
	q3RnyxqVML+kI3u/FS7cNh8W4kkcTRT/kJpRRqY1kQ8ncLkcbMYKvlaGj3AbRhn2
	xoLbu5zbfpa2q9VQVN1u18gKoMa+e195I5YqiqzBWXdv+KkG073OJMFSuuVnOyLQ
	xX1gsBhkUEqHGunvIr8WUUyMc3VAMqVc8/EVT3UxdRKJJf7X8HF9gk+AhWpHs0bO
	dHDbvNGPSujYVT8i8sBYlOQsBEmLSjaPsCkANfb84zBpb9ZVt0jwtlua89+aYNWc
	yKnKL0p0l2UB6eQjRS82Tw1nlZembrYY0Z2DNiGKDg3Q0vEkhvqPXG8YZBiASt6S
	+sDkuQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubju7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 17:42:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b4f8ea38f7so1578216137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790617351; x=1791222151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=;
        b=L8QAlRx4L+143jfiWXkZmJmTWsAwVO8zgYL5KYkGw0uwUPOygGUoXdBGvOVtT4yxsR
         cC3owMb2c254BvZkz8aZ7F/C4DrrU/8RyucJmhYITxlwmdjUsFLf4pa36Ohr9E/C4bwx
         IVN8wdAP7zbiVojP8SK+HFsbNsWQEz3e+kQlOJ39tBMT+vNVeIKljA2PT9fF/2LuLICI
         zLNXYrU4TgpZJ3RN+66TqMcxfAj4k+Mg6PFdNqRPitdfwRSm8nV2wjiFqdk8qYf0hV1P
         ygin4OHEVUjY3R5rNEqo76pVB/yTgWqqvgBCdCLIb9fEx/vBnptb8KxPsqW5bAk9b0UH
         NEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617351; x=1791222151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=;
        b=s7agCePg822R2vlJA1iPnPKrr+snqMYLLC90mFROOY5yVb9J48HpiA/T5rCUQKLOeB
         VFaVwlnJBiqNMlr5xQZbq3YzexQZS4BZUbsQRe3/2iHkuA1P3leI7H8DNVfUFYNwgMmR
         Yz0UdEEHyZbJpvc2elvbLIdcaBsae1QIVzsi6kAOWW8rF4/wwf6BW8VEvAigw/sGLJgl
         UEfA9nCfxjrO1x3eua6gX8AvEK/RKZnunOvHPd0hG75A5HBbUEr8is36PIxdsmJvv1iq
         m3xviQpjDY4V7NIKmGGVvQZysKdqZLZG6D6Ou+Eau4Gmk2BIvyVV93wKCGLwZNVxZTup
         DvSg==
X-Forwarded-Encrypted: i=1; AKwUvBypGZQLtitZGI4y3F+98dSGl2eUvCDnsji/IxykNHPhK3moEaG42WTFlQtDN6Z87zVgcyj45TXsuvmXWyMO@vger.kernel.org
X-Gm-Message-State: AFq9FYKsugREzHvygDEOkVP91GuvPWkP7u1Kh/PbbqzTlKxWwCCzSgdV
	To1KRaTGkqy8eG2eHrdjglV7IeBssSnzbAMngK2d+iTrT0V3+NWoQKphYKpe7j4q6BUAHPxOWtX
	yJMmPQPyjAKzdxdfPxka457bDQy/QvwE/V9BAomlKcpEcMoVbjqxHxrj5wEz4t2pI1jbY
X-Gm-Gg: AYBFou3j5/G/hf6mPyrkyH1sYDsiN9r4BXGbeShktXh/44W5ykqb0oZcYR2yim+3tWv
	toTpmH7+PqadQUxrohjYjkW01da1+fzPCW7ooEUKcNDzJLMw/f4Z17J5K6r71dBP9hcZZzUTDmj
	Z3vQ8OP0GbyST5qVQQPo0byUx7EWoGbP5rhdDgZbxiHZ/9BWzrQSd/5RnO3ekytwGboKXWzhDek
	7TAl+eSV821COYmokiC0ZTL5Y8CL+5Dj1KDNQUAG/pwECA931a7Ik3rMwFSowcpb+AV3FSr4EdO
	d67XMIV2f67Kv0lF02qiuwqTu39Cw5qIm//YfOaWYOmwEyUBTFqiflAL3EpNwUu34MrH74DVbLT
	aPSvR1uX/QavAQbyow18nb+jRNQ==
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id ada2fe7eead31-7b79926dc9fmr1077952137.27.1790617350545;
        Mon, 28 Sep 2026 10:42:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id ada2fe7eead31-7b79926dc9fmr1077918137.27.1790617349866;
        Mon, 28 Sep 2026 10:42:29 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00cf868b5sm15293635e9.1.2026.09.28.10.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:42:29 -0700 (PDT)
Message-ID: <b037133f-3a5f-4957-84b6-6eda14739f5b@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:42:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <20260928-ancient-boar-of-persistence-629a9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-ancient-boar-of-persistence-629a9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P5Z_3U7yZsEdLhFzpFR4hj2OoOv0Z4q2
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6abaa707 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMBjfq_dd7qU7rFTbikA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P5Z_3U7yZsEdLhFzpFR4hj2OoOv0Z4q2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX/PJP/ran4+LV
 rA98UfTwj1E/L9BPi7tJiqcKm/sS2qeF88Y1i7Swxq5pvCQyhQlxaOXOmQRXFLV453qEbfvpxol
 8h/ll1bEz8AZ28l49H0mGdhIw6w3P1jeWUqzlcPGaxj8ENvFY3Ob+UtzX2tI/vPAu9N8iQqDuQZ
 lHAQr8byk5/WPsbc6BfYCWajW36QpR/W8z+/VOz5gpz+w71ZPFUo4SurYWycsFtn0p64llNmIPI
 lEcI25ojS6CNiBTo3a1/RmnvIx1I3cmqxT6Z9a7YtfG21sZ6LOUeFvIUUvY9u/gDT8SiY1Wqz1W
 XURhAjgvS5C3fRcgUFWDIDZzjkntZWIbtxRM4Z2QXfEDagOgPxhLI2TN1Bh8dj4pZmALPqu1qLq
 c1biytfabCFRmy+hy6se99Ik+WsFQG5cXXRxmo8RTIJQoTEccvD7LsEshr2K4dVvB8fdzIAeF/R
 JeFSO6hy6zg3FRSPbiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX+YTT/ce/CMjE
 ujX8rN8oB2xyKPJoINR9ZghtGiycL0iA2lpYGeThRQTYnC5kKDMulfBfXwWhViXsrS0fMDCsRxj
 pyHCZtbpZmOrQ8U9gW2AMpF7HW4p2CY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280070

On 9/28/26 11:09 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 11:11:24PM +0100, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
>> Audio codec has TX and RX soundwire slave devices to connect to on-chip
>> soundwire master.
>>
>> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
>> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> [Srini: reworked the patch]
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index f6534e9e9912..d750da31ae3f 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -148,7 +148,15 @@ patternProperties:
>>  
>>    "^audio-codec@[0-9a-f]+$":
>>      type: object
>> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> 
> This had three compatibles:

That is true, things have moved under the hood.
Thanks for spotting this, I will fix this and send v4.



> 
>> +    properties:
>> +      compatible:
>> +        contains:
>> +          enum:
>> +            - qcom,pm4125-codec
>> +            - qcom,pm8916-wcd-analog-codec
> 
> This has only one from that list (+a new one).
> 
This model was suggested by Rob in last review, I will add the context
in msg.
> This must have rationale in commit msg.
> 
--srini
> Best regards,
> Krzysztof
> 

