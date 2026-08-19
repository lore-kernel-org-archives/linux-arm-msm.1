Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF9C48AE36
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157717; cv=none; b=q1Uhv52R7z0+EqDHp1fX23WlGi9S55Jtqb2EEpT52SMgcWVA25wZvEVRSVGe+shVl6xoguOb/IxL4flzHLIHBPgq5/LcPky30aoS+7LYn/WnpXpkQufmoeu6BTIio+IZVdH39Om+DyJQ7usuy75WnnpdbuiEBe7KJOHqAZZ7i6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157717; c=relaxed/simple;
	bh=HP7cwLLH8dW1t2oc1FU0NkBsNtWJfCQQ6Q9W9x3ZuTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoimE7tNbeEn7h5DjSShejRkPY/6k6ue8pt7MeeXgtuGmYlmLpbzrL3+qXXeVgWI/p91LzgcJjm3kqvmCxABKx/bv5zLPbFlK9YLb4biSf8DSxfdlIurDK2GfSIT8YM6kzREwM2bpSk1r4WrOczNdAJVy0DtuH/gxBpcTd0k7+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpWoeYVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4dGOo3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpWoeYVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4dGOo3H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2R5C3606522
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8r6EYyPEhzz3zHgDtbwiTb8LdJaEzXX4pw4FkanEG4=; b=lpWoeYVn6V6Yaws3
	xVINMntCwiN2mufWU3rLvai6ixE20n6QtNm4+CuLL4wh7L+oSIzD2dN7E+IwtpKs
	sbz4+k1hxwTbRDnVWrfGXhBmlzZf7ggNYuPJsKwTb2O8TbCwqU0WDNLYI22yDN4W
	ky9uePOFhFr3M71TyyPGOXyTMpzY5hAvg8XbE0P5YF+uo8SlnXlaWMnkfaIm1JNG
	dPo4ar+ybqpb3W815U9CIAR7bYCBb5pMFKQL9ZKKlBbs0KXfx7duY+GFxq7FI96z
	A9CZo1TbaZDYMOmhSo+eRhLQR9mi0zIgxwSB2WF88nJkP+b9w5mL5G8j7xh3q/RH
	wrEaWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esarhgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:41:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so1959081cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157713; x=1787762513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8r6EYyPEhzz3zHgDtbwiTb8LdJaEzXX4pw4FkanEG4=;
        b=V4dGOo3HY+YpQfI0AUWIfzXLJuHXJAnpvcIm1PbQ9bRADJ3s11rSE55BijackvbXFC
         MUwGzXqaBvxXf1o3fYo65QaltKdS+5XgOsmlxaocbC0fp1aDfbTQFt2CnobKGFv6Rw3k
         nBtT655qGhgS6H5TbC0Rk7SH33grwxtg9HLS6MPHbhuIeUo3nHQODSANdzhVRZBJWkOU
         tYYsik/YNUFqTpXpSfDDTOeXpPZBaivJNCMqUpEAXtKIQ3lFQA/ZOEjV6KRVOu9599qx
         BqTv8R1zpTukRd6TwAJ+vSyw1a6lgPDfjFNXjgxGcelgPrFU4Nh6i5cIuql0b5C1dXJ4
         8G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157713; x=1787762513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8r6EYyPEhzz3zHgDtbwiTb8LdJaEzXX4pw4FkanEG4=;
        b=d/sxazTFiXuhprGtL/RmshUXZHxPSw3ZgjAwoFaEaU10zyOdt/ywFYCZSkeEpt7F8L
         8XCH3NNIviXgtAqEIEUZ8lrUB+43Tqq5XUvKDTe/5ZzesvduBhBKZP5ZEFHDRDEizHA5
         jj9jKZ5kBNzp8C9RispyuQEG0KL1ebPxpAcMVxPLWn9x4oB3ngvDp1j98TWwT+j50/yQ
         Aos2sTs+SdgbkpEvir/xEncbxi18qIXu12h3/ndmw51fduu1MzcF+y8hpZf3nCtxy7g7
         xUrrOuPiT+1qnApdT5hE3j55KnPVqdLhd8uZSHyA7lWCo+mXtgdkcXlzxOIeLbKuIWFR
         sWFw==
X-Gm-Message-State: AOJu0YxCSAHZbKDQE+F4ELJEDvwZ63OnqE7snhR5kf5N+LUKmqwkxLs1
	ow5HegJundDPLqLfZYUAx5zP28vYLAAuRtVwohEaOJWlQJBh/ALeK7U8BIgdR3jGRx1/4Q687Fb
	4dpZpbIUqa/SdPtSV/wBOCpJU7NANg9b7bvRLNoZS6trF831eEhoCVE5cNJwG0giNkZTS
X-Gm-Gg: AR+sD12LX/zLwk+2LcpHjcF5r80qwAcVWQQOSvr2jzyw/7odwY0vITpVGoaD8t46CgL
	tAG0KlePgR/pAa9IC4b8b/7oO0Sr7GQJasUwr2DmZTmcwj9A05F7mdoIzSh37rhs9uM/5+RuvR7
	zVoqYwEswxy53MKUYDxZrvWUp4q0WlpdmjR0WfGtJPJLY6NylvbLD7/tpUpMT//Pr4CgUwPmx9r
	Zi1obMbQb34nJ9vK/mDX5RHey16Wocv0jDxReM9ugIlkIh90ZsbdWZZG7C1NyjKY3HcdyKdCLq1
	ysizIAZq+RjtrOai8B87LcQ6CfaXGVwrrKvj9YupLEkxA4zYvOyA6NgjEi1/LehYpX4qR2Pinr6
	puhBYNyul9+6NR9tcmTofpx3S
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr42413851cf.4.1787157713040;
        Wed, 19 Aug 2026 09:41:53 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr42413251cf.4.1787157712489;
        Wed, 19 Aug 2026 09:41:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a8204sm105374566b.19.2026.08.19.09.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:41:51 -0700 (PDT)
Message-ID: <ed3dc2dc-69dd-4b48-a5c6-47ca72cfee05@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:41:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
 <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
 <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX8mr97II4Wp3m
 Lw1srtQOBhESEyHBgmElmMl1ybIzB6pGLgQOmMO2KUMHlll0uU0tThec7t1iqoo2xWGCi6b/LYw
 cAk3Fx0aNPQ6Rppo2h3vU4TpEK0gn6Q=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85dcd1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=GwNM78hDF0K4Zjgp8RMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1NndQxpo56t-zc55y0U7sZ_OtZXDSFgG
X-Proofpoint-GUID: 1NndQxpo56t-zc55y0U7sZ_OtZXDSFgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX2DogyO2nJ0ch
 zoKu2T1fv+QRIKcjmgVE6kZu2NDGysEIOIoZ69CNZYY3c+gobkjoOJbxh4zAVBRwa9yl8Hl84mq
 z1COe0LAOMsKowmcEe0uCCNDkwT/2hLpP96K/fJ495a0HWGfQvoKP0Zzm3eFn5JoHcf+16pvkCR
 H35fIuQ+7S1LonhFMcDcaoXOVdRwTk6K29U8FfH0tjL0ywZxtwk63MqdMs4MN4oIrjiBE9nZbE7
 joBflzjJC2aVd2wS8Ho7CDaRlmn+2diVDKR/U+uOvUy0N9zVLW4JwGtCihNeSK3GE5GoiMnxiBT
 MfBVBtIEQ5XADkSGzZ/akm9KjqwHfl4HD13I3wkxPSg5Y+NthhfipsxJWCzfJDetKXMQWF6SjC3
 7qAjmvMKZ+RnajzMSI0Yw+HF9u/AtHM0aIZN2grDj67R7AM5/HMqDBniqHfKJMS9iROcdmQ/5PI
 3LKd+TNUys5/Yt+/pZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 7/31/26 8:25 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 10:38 PM, Konrad Dybcio wrote:
>> On 7/30/26 8:35 AM, Anvesh Jain P wrote:
>>>
>>>
>>> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>>> Add the EC command definitions and handler functions for querying fan
>>>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>>>> transport for the two commands, since their variable-length,
>>>>> sub-command-addressed payloads don't fit the smbus block-data model
>>>>> used by the existing commands.
>>>>>
>>>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>>>> them in per-compatible qcom_ec_lut_config data selected via
>>>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>>>> geometry but are bring-up platforms without a calibrated fan curve,
>>>>> so skip_lut_set suppresses the LUT-set command on those boards.

[...]

> 2a. The EC's LUT storage isn't persistent across reboots, so we'd need
> to cache max_rpm on the driver side instead to skip recalibration.
> Initial probe after a fresh boot would still need one calibration pass
> either way.

Are you saying that without this patch, we could be in a situation where
the fan simply wouldn't spin because the LUT would be null on the EC
side? Would UEFI not do it for us?

> 2b. cur_state already reports RPM-derived state via the cooling-device
> ABI. Is it worth also adding PWM hwmon on top of that?

We have to deduce the RPM number, whereas IIUC we can query the PWM
state (if not, then there's no point)

Konrad
