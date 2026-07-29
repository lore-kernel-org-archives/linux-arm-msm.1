Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783A486B9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330170; cv=none; b=AhPTyBertrIbL6ceUskdNtaPnRhs1O0cyX5TJ4yb/tlk5Jo2t1d3gEpEMZm6X/CP0bHeCluD4hm5y8H9cVE6aUSUH/kvlzcnzBJTE94fa6OdA6xs4iqSLF8FwpFiM5qlYVg+rXwwTmLEyqPqW4mZPIMEwUriCGiS4/tAgEix5tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330170; c=relaxed/simple;
	bh=MCtTFsBgiMKuSPU0viJO2vBQAkoqsXjzOHlzyF8bXsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBdXllGekXpKN0fQT4ZB7o5m3Pp2huicsiWHKlvT/t937KF7J8nwI0T/9PlrQ37kFxAHw/7qW3XHBezy8rNUh3lc2PXEPa3E8vRhZ+R7QYFhOJ3ad92JVN3ueLjy8AUuD5m17+9NhLf58FAot5he+dCR443qmG5eCqFM9jmuKrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aofZj3Dg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ku/hAxqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aofZj3Dg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ku/hAxqs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCOIUu1814605
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eyYevD9BwUwoCNxtRnZBfyIBLfOZ0QksRn8gxgBDIw=; b=aofZj3DgVtwwaFNT
	/HTAlvHKZ0BsIHImPKTAZtCFBaFrEZCsnojaDjOocMMNFMotQlV79JaASo3BW3xZ
	MtDkqQ3MKXC3BqTKz3r2NwWAlvmNPZ7V3A36IVS91/G2NQAMBVCD9asDPZH4yG7B
	E+mthjS13rGxyDnfEfMDAenaPCh3X05pPr5fj7qhqnJaheRI5uiGCY//Aq7+vQSD
	+erTL2gSeqBNKZxgm2Fox1Dj5WlY8Nwbm0+MMGHIRyhFTy5bKUtZbGeFfV29MSxp
	Dzjo3iZ/kGIfwExZ37mLLLvUwaP/60UxRLGoVk+UsCdGtTymR4dhP/RQo3wyk8hQ
	lq8ETQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhg8r4hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:02:44 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e74781faaaso2135144a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330164; x=1785934964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eyYevD9BwUwoCNxtRnZBfyIBLfOZ0QksRn8gxgBDIw=;
        b=Ku/hAxqsbp21BJOz48M4B9oBNzXa+EkV8iZLzYbPIpAb6F34evAWVve2ZnCWZMRPY0
         0p8B3lOkNP4MJfKa3quKnezGT9fV3IjgZNet9zDeHOOJ7p+V/gEqQ6aBqBfe11p2cewq
         8r+ugLX+X7IU3rHbeJZ5iS6uI/xXr/bg/T8AZ5OSYtk/n/jH83CXZ1woBel3ak2cSZam
         G+2uiSphkpN/gkVcts+au0uWnm5iqtLHK/q5b7cpUUyHGwe2chrZoXlr2VriBSLdDZnn
         Pkrlx17nyQG1deVsV0JGFDfmjOPKIqVSyZPz1sI5HxfkiFj6uVS93E3caNxfoFOTZk/e
         wvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330164; x=1785934964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eyYevD9BwUwoCNxtRnZBfyIBLfOZ0QksRn8gxgBDIw=;
        b=Tcsg2+NcJGfI/cL7YvMPGRErljIhUREXtKjnV0kpjmpUH8mKjIpz3uBVqes36bs6Ne
         5ZKCx5XYztW5uOl/X09+oRgDlMiNuCc0Kkn3z3bNxBaXxeldAq8IOY2t1xbiM1Rl4YbH
         VKdMdsgrJkniEadBpajknAIDw9JV45UJtSQE/sVFtdvut5S4WGGg2cfR6Z+owFysE849
         XHbegBpNQckBvcqZBwgeBxr/OYgIJY94yzDxb9vx8nVYkAXm5LnETVZFSkO0uKCTqR3V
         sctquZSIUy1+X7JEJL5EA4M8JQzILqGRAMipZ+q3LCJDO+BtUsECv0UTZdNtjRB+nnra
         tWdg==
X-Forwarded-Encrypted: i=1; AHgh+RqFgKh8O3gxl5BmKY2bG0nqMbbsxvzn/TsvTZykr0C5dd0KQ5n9G5YVHJ3hVXOAtmQ2iEeGNK9ZC2Vq/d76@vger.kernel.org
X-Gm-Message-State: AOJu0YysBS5edEwAl+kcBIyQq2WXirgBr0nplESLTzepEEgfTDuYjloj
	UGiOmWHVZXLLlFW0zAPW9dJk2zv6WhFWmJh5BKjpoq0UH5x/L/PKFR4lirp1H23apbxzwLAudO5
	BYDn9BLaTLi/bZ6Z1z+vl2Z0RRNWieJIQfO90XvBvJ+ymf2EJ+G7EgkOzbuFHLbmbZ14i
X-Gm-Gg: AR+sD12jfAgt8vA6/4mr2sI++fEh2Gf1Z/1URG9EewqGXAm9a0tfpdcqq/esOHVhPJ4
	2ou6mlinquYAkcBZLFZqIDGorQyhSVKKt6/o1wIl28Djk4M1QDfsMsSqa/INyuRKzveUdRM9Tea
	3q8Aj5tCu99s7aOfFML3ZJqeNE8y2v0mNjHgLUibBpHGY16bkwC3p4qjDutKKjBVRyHmPdtMmmP
	RZYcg8O/TstWNcrr0fT+gDnZ6JoQOFE5hDBNd7xYyG4x1zDeRbpgBtmQtm7dQlNbCHPdqcBw0gL
	oNHPt1YMXOAti5qQ/KCZxdi84JA/AhvIiASgpuasiKM6udecUflyplj7kYpbtd4Ko8uP/Aq+H0f
	eTj73+mPOBUD36ITTrB/0s5I7B2A=
X-Received: by 2002:a05:6830:2705:b0:7e9:e860:6f6 with SMTP id 46e09a7af769-7efff3244d6mr3873200a34.30.1785330164128;
        Wed, 29 Jul 2026 06:02:44 -0700 (PDT)
X-Received: by 2002:a05:6830:2705:b0:7e9:e860:6f6 with SMTP id 46e09a7af769-7efff3244d6mr3873156a34.30.1785330163502;
        Wed, 29 Jul 2026 06:02:43 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1f83fabcdasm110147866b.48.2026.07.29.06.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:02:42 -0700 (PDT)
Message-ID: <54f1c3e5-0b84-44a6-a03c-3cd65792de9c@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
 <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
 <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org>
 <0cb5a2dd-c49e-47e3-8cc5-ab2ffd397a32@oss.qualcomm.com>
 <ba147ca6-3788-4cbe-95c3-949ae73ee8f0@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ba147ca6-3788-4cbe-95c3-949ae73ee8f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfX70zfJWCDAWKq
 4Vw9JBm/GNB1eeeHbX7AqCEQyUJ2VCrJkUG672MB2gA58Lr6AJVTc5/FkaJWeqNxeWmQe52Q+QY
 2fgJ71fC4QXLEwQCmXGOl7xV6X2u6Uo=
X-Proofpoint-GUID: h5Uz5gMCL_E3EOfqGQfQO6ZA1pVvlhFL
X-Authority-Analysis: v=2.4 cv=LOdWhpW9 c=1 sm=1 tr=0 ts=6a69f9f5 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=Cn2VO0AzQ6tcIWzUNyUA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-ORIG-GUID: h5Uz5gMCL_E3EOfqGQfQO6ZA1pVvlhFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfXyukqTulKl2Vj
 84pB0+7XK/et4LsYgPw9NLQYq9sbzkjongtGkbCitcr3MYpLvkVBzuPSytUA3HvW1DOHK8+adlF
 Ut4rZj8QdKKBSdQ98ClRJluQB/s03ECfPJxyJExg093vT5IpFoVNX2rBuC53Rwi3jdZv6WAWALW
 ywcZRo19RnV/On8cdoMjaOb86y0v8N/Vgekqf+Qhu/5Jm4WVyMjt+vkfQZha1hjkx++u2Iadcp2
 8FpQ1fNZ9Fu/x0wBVlB4kWl8IOAO4ZXVOC/gE1BkJ5H2bZdiBv72Nf8jvhrC6r8suHluJ/rDlYC
 3HRp5QAdMamgFTcp6xV21Br88XS2G9Z0qT7O6Bn6lpYFHk1+QVcZMmf/yil9Be4lYO+bsJRcnUB
 ObViTV9o6Co/4WVdBT5+yF8iEe2yblC44BKFe8G5As9e3QSzOnPSGRGcURItp9msR5CLxCUuG6j
 RldPtNjalvnDZMGxuEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290108



On 7/29/26 1:43 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 14:36, Srinivas Kandagatla wrote:
>> On 7/29/26 1:30 PM, Krzysztof Kozlowski wrote:
>>> On 29/07/2026 14:17, Srinivas Kandagatla wrote:
>>>> On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
>>>>> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>>>>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>>>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>>>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>>>>
>>>>>> WCD9378 codec can be wired up in 2 different modes.
>>>>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>>>>> each of which has dedicated control and data lines.
>>>>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>>>>> single standard MIPI SDCA class device.
>>>>>>
>>>>>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>>>>>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>>>>>> live on the SoundWire slave node in compute mode and are forbidden in
>>>>>> mobile mode (owned by the top-level codec parent there).
>>>>>>
>>>>>> Assisted-by: Claude:claude-opus-4-7
>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> ---
>>>>>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>>>>>  1 file changed, 200 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..2ed4ad92958e
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>> @@ -0,0 +1,200 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm SoundWire Slave devices on WCD9378
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>>>>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>>>>>> +  class ID sdw20217011000 in both operating modes:
>>>>>> +
>>>>>> +    * mobile mode -- two slave instances sit on separate SoundWire
>>>>>> +      masters carrying data only.  A separate top-level codec node
>>>>>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>>>>>> +
>>>>>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>>>>>> +      master and carries both control and data.  There is no separate
>>>>>> +      top-level codec node, so the SoundWire slave node itself owns
>>>>>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>>>>>> +      marked with qcom,compute-mode.
>>>>>> +
>>>>>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>>>>>> +  decide which mode to serve; the presence or absence of this property
>>>>>> +  also gates whether the supply and mic-bias properties on this node
>>>>>> +  are required or forbidden.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: sdw20217011000
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  qcom,compute-mode:
>>>>>> +    description: |
>>>>>> +      Marks this SoundWire slave as the single aggregated slave that
>>>>>> +      implements the codec in SDCA / compute mode.  Only present when
>>>>>> +      the codec has no separate top-level codec parent; in that case
>>>>>> +      this slave node also owns the codec's supplies, reset GPIO and
>>>>>> +      mic-bias voltage configuration.  Absent in mobile mode.
>>>>>
>>>>> I doubt there is really "compute" or "mobile" mode, so you just wrote to
>>>>> match use case, but that does not match hardware.
>>>>>
>>>> This is hardware fuse setting, its not just usecase based but it changes
>>>> complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
>>>> devices representing tx and rx side of wcd9378 however in compute mode
>>>> it only has one soundwire device dealing with both tx and rx. compute
>>>> mode is sdca class compliant device.
>>>>
>>>>
>>>>> I think there should be no separate top-level codec parent in the first
>>>>> place, thus this property is not needed. You always list here all resources.
>>>> There is no top level aggregated device when the codec is fused in
>>>> compute mode.
>>>
>>> There should not be a top-level in either case. This was always Linux
>>> driver limitation.
>>
>> That is not true, its clearly a hardware topology thing.
>> Codec has two devices tx and rx, Only one of the device (tx) has access
>> to CSR registers of the codec, so rx and tx are pretty much a single
>> aggregate codec device which is why we have top-level representation of
>> the aggregate device.
> 
> So two devices, but not three. If TX has access to RX, it does not mean
> there is third device. If there was a third device (that top level
> thingy) you would have it here as well. You don't have, because it is
> purely for Linux.

WCD codec is a single Codec IP Hardware block which contains two
soundwire interface devices. Effectively we have one aggregate device
representing codec which encompasses two soundwire devices.

Third device is the only place where we could represent entire Codec
rather than just soundwire interface devices of the codec.

Am not sure what is Linux specific here, its purely hardware topology.

--srini

> 
> Best regards,
> Krzysztof

