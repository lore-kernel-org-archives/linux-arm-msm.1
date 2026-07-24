Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C11282F31
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892992; cv=none; b=QHWqJ9X3THVHV/wnMtIXQu+nz5XABWZihQNxBhXDQ35iYwDJWy6hygtqWnSbRgkMfmjyKFdQw7w06bLNEJ3/pgin6TMP2pa9tyA3vHWDHLvcgUnk7p0bYSnj6FlD3Gwy9nNtkpc0oRvG5kApNw01/szNaPsrDwbLgiNHuBFlUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892992; c=relaxed/simple;
	bh=C9VaEBw3KALFzc6fqUUVF2hgCFnr4UuiuG/YCyTZl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSnCDyK3I6pcyZLKDOrXGQDD+0BGh6XPtbFiRAxKSuHFCVXAx9G73gKW7iXFixWwE0F+uBjUOVeufyfAECH4FKRUsE+Bw4s31XYeilkeOdFf3l2K3Cw0c8A12Atcohvx07PSh59DSv5I6E20MrRelkmabEagB2pM5wITJRJxBxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKU6e3lK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3NABLOe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKU6e3lK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3NABLOe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADNB73889174
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=; b=mKU6e3lKz9ly3v3+
	kfneJ3aBPtfNXhFheFKsKirvBiJTQToegUolaAM+lpLDj/LeJGtgn7qtFJNc1Pex
	omSdwvMsOlPJk/BUmHyipDhResUbVzig+fYDrpZjdPB4kPiI8av3n00g0ok9Nr/v
	Q6p7l16iPus/YPyFur9ZtxvAJq7rJgxC40E9zY+WJNDSR6wxntjhK4z/n3KzwntP
	v0K3wKbuXvyFTXscPR+l2C2iN8eaWefVxeaJOun+0kF+vJjxo+r+zxFan0fT0Qyg
	kAh6+84qUJ0mo00HSRgtuCiEnPFWXLlQBrJK5T2ffvZT7Q1CGxuhAMPVnFHDZZem
	a9DUbQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f68asm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:00:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so537203a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890820; x=1785495620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=;
        b=X3NABLOeu/jqDF19R7JT8SR4HL6ei37TwYkafir8WndrL/wbiaBhvPLqoI7tlHBKB3
         PR1ycewoaPRSPw+jhRXydhDLZzRdziwRbrw4GcendGPCslNHLhkL8CJi3NRSkGxKy0CC
         Xh60dun+ZWKlq2/ZEBpZzfXiD0y+ClkgDsWZUsvexX3UO93NjCuVjzNSteNDHkC6lHMG
         IXbHfoHffQPFaXcJ8T+QyWCi79LoBspgRYRztvb5gcTy793EPSw1Uw+2zfXeql9NyIpq
         +GpyN45t/BchgymWistFCFHq7kWz0qCnP8rZNhKJllVSVDF9nkNbi4SutiDzd77Sz2W8
         Cjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890821; x=1785495621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASVOI5RwmTVGCRU4btP8OOyckPBLGKw/HyewssycLCY=;
        b=jq+WICH3bbbjYarg1oNj6JHU6/RKAU4oTaQKIFbxxcDPseMF8PSeZP9ZNJQIEY1UxR
         71MO8O5TMiRR8TqlfjkPX9BE9rIwpRXnBYrSUsWiAVHg43GSNtewPKekef0f2+XA5DPK
         szASfD2j6NavKxN0N9Pq7snezyi40GoNADNMMujbMVyT0Uod67AhDve713rDEMshRCBx
         9DzbBnG07hESxz8EdHXByvqvWRlZe2ZW5ivtZI/++9pvV3EDHxHXAhdnUhYLDGcbgjM4
         dULKOqRIckdYDPVZCx8QkAARNYFFrOgtP5S0ed+MJ8zE6+Mq3jU3bSuNPdxbXFp/zQZn
         WCJg==
X-Forwarded-Encrypted: i=1; AHgh+RrQc68HaTtgDX279+xED2nW5SxhvYiaj+xnZJA4TzcbOSG4eCmcXTVM/SiNhMZgahksCZswbHDsKYjRwvr6@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrVKKmC8i0mq4P20cYUCoD+HnndVj6M3NZQjSqk3ZV7FRn917
	XZP1Bo6S42HcGGbW+9x9ieaHAF4yjd+uFE9OcFsYu7O9LC+eAkUuMk8RRSadXxisFUzkzeLUoRC
	Ug+SfIHs8xklOxbaqnILKLuyX+JlCDCznbc38H13fHnB70Q+c8y7UgPu6DO/cqX5BsdW/
X-Gm-Gg: AR+sD13d7rC5XIxbkBn3PETmRhpYB8GDVSkM/YKfRWS6ZnQ+6nMypagcfDk5ng4mnAj
	PK160zwxWJOu9iLRUQdR5h68YKJUk7pmyv1zpT8OqcWApUe9fBi/ZyLVFG0L/wJVoE+O+mEptTa
	YOwNvX95+Had7D5D2hdfceyh4e72NmTZnWe7zVrXPLvmRFRlVdt4Rv7vQOCkapJWXhBPS9G6AAj
	lrN8VznhkYwS5xkd5lVYk1aYr7h+2xeCZxcSEQbBdXVHF342rYVExtCNOLAb2s/v0+GbpmcjAGE
	T53edn0ghBb+diHW/GTEklyZEOUxrhII9r/5keZe4cE4NRDCG1Q250AUXxXotuOib+S0GrDRfK2
	w/O97fv797hFUfB/kPDAoWunpQ6g=
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr7464215a91.34.1784890820584;
        Fri, 24 Jul 2026 04:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38ec6661b73mr7464179a91.34.1784890820045;
        Fri, 24 Jul 2026 04:00:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af892bsm1290553a91.9.2026.07.24.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:00:19 -0700 (PDT)
Message-ID: <abd6cd95-1e27-4eff-809a-2d97f2f71fd5@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
 <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX14Rwf5DoRnDd
 /YCVWA/e1KgeavgzDegO+zUWpp2tiDZm+2Bq6UIUT91qIgAHM3mWBlG3fgJJi+iafkgKhIA8LOd
 B3l0+1wpIu6wVrYtrywCOA8rv4sMsbI=
X-Proofpoint-GUID: oY8fd6TCk8n0eZxGE_7EUv5MfEEwiAS6
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a6345c5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CcRILfWLW4tHOLBHFjEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX69ANncpuWKqm
 EvIt1W5lt1gLrU/hbRngqw30ObQDPiirUjkXtl1a4jmYe3mn2j4+gToy0lIKkVHiS/9cw7UfjiQ
 zSuPZdDP6ONyI5AX0772wjoFZqYEr92/F8rN2WFJnNUeqW+MRxpAcb0M8pCjSs2CxUtqqHg6D/Z
 tlkD+Q63Yym8A4lYVbPDDoUX4Gkir3H6Yp5243scelsRGV33gjMm938oaSpcdxJ1aYrq3LUfrrN
 Hn8eQ48ka6/oyM44+jZBLARS6SKZfgD26j2LoaYHzFxFYckKabUFgCwUgG0oD7JGUVtsObQq41T
 gPbMMSWarh+I4MkaLjROVwyZwdGhrGXIJxTyCQx3YrZmSDwxXmIbICWuEmKg6ic+tN3dXDm6tJZ
 z9RhnyFGbKeGgnXdMx7S5VqnXlt84Q==
X-Proofpoint-ORIG-GUID: oY8fd6TCk8n0eZxGE_7EUv5MfEEwiAS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240099



On 24-07-2026 04:19 pm, Philipp Zabel wrote:
> On Do, 2026-07-23 at 21:15 +0530, Imran Shaik wrote:
>> Some clock controller descriptors do not define resets. Avoid registering
>> a reset controller in such cases by checking desc->num_resets.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>>   1 file changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836af48090323248de 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>>   		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>>   	}
>>   
>> -	reset = &cc->reset;
>> -	reset->rcdev.of_node = dev->of_node;
>> -	reset->rcdev.ops = &qcom_reset_ops;
>> -	reset->rcdev.owner = dev->driver->owner;
>> -	reset->rcdev.nr_resets = desc->num_resets;
>> -	reset->regmap = regmap;
>> -	reset->reset_map = desc->resets;
>> -
>> -	ret = devm_reset_controller_register(dev, &reset->rcdev);
>> -	if (ret)
>> -		goto put_rpm;
>> +	if (desc->num_resets) {
>> +		reset = &cc->reset;
>> +		reset->rcdev.of_node = dev->of_node;
>> +		reset->rcdev.ops = &qcom_reset_ops;
>> +		reset->rcdev.owner = dev->driver->owner;
>> +		reset->rcdev.nr_resets = desc->num_resets;
>> +		reset->regmap = regmap;
>> +		reset->reset_map = desc->resets;
>> +
>> +		ret = devm_reset_controller_register(dev, &reset->rcdev);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>>   
>>   	if (desc->gdscs && desc->num_gdscs) {
>>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> 
> Is it possible to have num_resets == 0 but num_gdscs > 0?
> If so, the now uninitialized reset variable will be dereferenced and
> passed into gdsc_register() a few lines below:
> 
> 		ret = gdsc_register(scd, &reset->rcdev, regmap);
> 
> The whole gdsc reset handling looks very spooky, with
> gdsc_(de)assert_reset() calling directly into the rcdev->ops with no
> regard for reset control state.
> 

Yes, sashiko also pointed [1] the same issue. I will check further on
this and submit the updated change in a separate patch. For now, I'll
drop this patch from this series, as it is no longer required after
separating AudioCoreCC clocks and resets into different devices.

[1] https://lore.kernel.org/all/20260723155515.68A0E1F00A3A@smtp.kernel.org/

Thanks,
Imran

