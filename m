Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6A47F2D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328577; cv=none; b=jAleok2DKVvzaY4md4YZ2EqQKK6w3CKzM/fu08pBFR93qyhBRvMau3iX5Oi4WSBH1TFUcbPVSo3bJQ6WmIz8SZxqqaWmaQHIJmhFV9EQKdugtxsFyNqelmVHr/EcN4Cq7+VJC++pwJkkVy1R5saDaNhREQNcL7h5WfmWkk0TzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328577; c=relaxed/simple;
	bh=b+iNsDFEHoCrdY3q7/dXhBGQBGrcI1IKuOBRzn7zAds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWM4AfNIS5k5xG5K+6MPkLYFrZdazixF8ZXcp9fNQi9iS8oN+EbFzOc0qogZlZ72f4WC/qPJtS/BhcT7+XnCPPmk+9rossWN5qr7IwzgefeKggAHWMoKGwYFPEAE10oQ7LprmMa+n4D7qIhgSVnLxh1bhoolAGWSFa/LgK3fTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LugtbWXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLOw6gEr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LugtbWXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLOw6gEr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCJrUw1977101
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y1ew/AaO4a3TiUoZQMqr3KatEChOpw6KP2tFHQUBBM=; b=LugtbWXWveq7yjdD
	e0MFujqOckmzpkStmmE3+Rw13C7v3VWBzdN5bkNQY5cH1I7pon74vnJTkxwz82cg
	9wbcJA6wkRoH5OKfX0MPzHQyDcBB42VXoFBF/1Zk9wu+mFabiFARInRY+Y7YTBd3
	W62vV7pfwrlMxE06Q9dbSBW81JxW6AO4+FaYR1SyGlPjRV8YC9SJJG3UE9jlRw8X
	rcB3V1SN3gRPmXvFPus1dd7wt1HhDiBEivE2Pt4o2F4TDGkuXswBfyTvudTIBkMT
	OVVguOuP29t8TRrkDlUXsu/PjWjZ3Tr4W221Tue7Bb1zPq87sIkH3WYpivOnXtGQ
	1HP21Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe9824b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:36:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so8676051cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328565; x=1785933365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/y1ew/AaO4a3TiUoZQMqr3KatEChOpw6KP2tFHQUBBM=;
        b=DLOw6gErmb7qnBWp7OJ3GW+TIPdmHeZ3Z0l45KPFjliIcYWnWtiZqPGtRc9oq1F84Q
         a1ySHoPjCWhrsK30nymNy2/dABdZQw66VMIJ8BfG2OSFAZ+pV2VNF16z5dMM2MR9zaDc
         sH38ht3K/4GJR7cw7hfW1j6TwjrMV69ILMEpt3P0C6NMmtQF27COiRHsN+kw1t8ZTv4X
         r3WDkztdqhKrm3xnfXSqVxnSQUKMCAA0wq862a9kze6AjMlu8G5OsaRiQwv1T5CeQU8l
         690WywJeC9SknaZYvchMGtkO/JDA/5G9kroxorT8btjl510jqNDp/gt4Fp2T0xsMOT7A
         N6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328565; x=1785933365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y1ew/AaO4a3TiUoZQMqr3KatEChOpw6KP2tFHQUBBM=;
        b=qWCyrsQ5gz07UzvoBdKNlJcQbGugu6ntrxNIpwyH0tfHmpic4bpFhPWANzZIIhRNPP
         YHh2R2F01GwYD41Lx3/9ZzmahcwA2YDNi6YHhMzTfBG8YEpi0Oq0kT10LaBTg9aUSAaP
         zRdCM47d0sjVWot9pQkLyCB0vLOyl8BcwiHu9RjEMWBZ7K22lVtv/+r9s/vEg9wbLzt2
         p0CxeC13IYXO9PQqEUYYX1kBUSOwmN4AO481JEtLsTq3n+1AvMtX8vGd6xiqxiEaMScE
         V43sx1jl1kBP12hwleS0kANgFbLAVIjIARQstL80283JZli8qLY8SYqV7TOntDVcEh/p
         TB9Q==
X-Forwarded-Encrypted: i=1; AHgh+RptFgPCQWLA/RqCRP402mq0ywk/ZxvAaRSLr6XNGqGfQyuz3TLUfj0Cysv515OyLNz6XnIdHop3BruXBMgA@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxOko6P09Dboujj8K5yjniGUiRdLKN1TkNBfY1qYnR/MzozUZ
	46SfGiROD0c2wHqaWfVe92SQcgT7DVCChFXuENASTjrm0Fg1plIAspSthbVgsD9TK8Hs2BXVKhy
	jXJFA5KP11fz40t36XeD1XXh7WRixIzKwE2EqZ3Qta2JQGcDBq3PCfwur0kLz67cORclM
X-Gm-Gg: AR+sD11AvHNViLUZrnQbXtpDHLRpjZDY5V/tE18xiLnuixX409gzPRcE58PxzVpRKp8
	17xxJHUULF+LsOwZgLHi9ExmV0VXJdqK7snffkG2LBW+sHKRuFj3ppb5kmnL4+Jwn/W7Hje0CT2
	Q9xCey4ykvf5Fobg9MN5tuzVdYN8Ljgja66zAfieJSN3Dl+VAA3N3SMouTaqR0X0v+HyWDJuPRD
	QB8eqzpE29FCENRCsJCSzG3n1aYvFpdadlqWfGM21IX+/PWWzllUkXIZlxivXDlNs7LL9GO0ndc
	7iUdVd41kJN8JnLXUgP75JhyXLLvp2YHNMAGgKrFUcTrePmOLejesZH9Nz4dBcd23Iz8SmcVjfR
	rUw0/DqdhNfz6gAKqkGGWyRbMNFQ=
X-Received: by 2002:a05:622a:4d91:b0:51c:164b:b240 with SMTP id d75a77b69052e-529d6faf287mr57170231cf.4.1785328564547;
        Wed, 29 Jul 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4d91:b0:51c:164b:b240 with SMTP id d75a77b69052e-529d6faf287mr57169831cf.4.1785328563999;
        Wed, 29 Jul 2026 05:36:03 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be9a91sm839143a12.13.2026.07.29.05.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:36:03 -0700 (PDT)
Message-ID: <0cb5a2dd-c49e-47e3-8cc5-ab2ffd397a32@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:36:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax
 <ckeepax@opensource.cirrus.com>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX27DEZj8aCrOu
 UHTeHIwrz2a9q4soYtD5Z6bhew1KYqfxFzxrIRt0cWtoZlw3Fy3ARZRD+pcf8W6PlF2hTxBODFV
 znM/knyOsqJjQbjf/tqzOCzgWZPcY0ow23aK3Ka4CXQND2auzcDokSoIs0sgkHtdo3h3C5Bn7I1
 6ISp/fndf8rGJsRUr11jbtlzYNN/i7eJBoVuIzsRQSgXGH8IroGW0JwbXZpKHL9zO8LAbrG3PUk
 uG7MqCRXSgDrweuBr0rBAWC7hgU2SmshhsSDt/ed0C3VrF7d85N1oTlq3bg9AP7TGCxl2Rvx8HO
 iCP5TMsy4qXy1AVh7um5IDvJC4WjeEIiZ7ob6sfXS87yFVMTdyPcKXHCQGnivumxA2Gem5G6JyG
 /gVjJEd95lwDKMOBbxhtZK87Luw08/mb+Au11ulh2HmKsE4jjJ4wPUyiWgNQLo+OXRbmNz3B5ak
 McijRnOigIzTH9ijb4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX588Tvl/ovBvL
 27HzIqqLNyoT+0bQUFwEQPJenE1TqB93K9/EnJy3FFkzato9KAkyayV0sBsoVLOSTPbEmDdqVg7
 bczK+u1DZko10+HwYZQ/QVgJ7roVBSE=
X-Proofpoint-ORIG-GUID: xvxhuj6JODCDoefwuoN4DYJDDbstu6RI
X-Proofpoint-GUID: xvxhuj6JODCDoefwuoN4DYJDDbstu6RI
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a69f3b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=ueJt-ghu4yImuhG8B5YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290104

On 7/29/26 1:30 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 14:17, Srinivas Kandagatla wrote:
>> On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
>>> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>>
>>>> WCD9378 codec can be wired up in 2 different modes.
>>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>>> each of which has dedicated control and data lines.
>>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>>> single standard MIPI SDCA class device.
>>>>
>>>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>>>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>>>> live on the SoundWire slave node in compute mode and are forbidden in
>>>> mobile mode (owned by the top-level codec parent there).
>>>>
>>>> Assisted-by: Claude:claude-opus-4-7
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>>>  1 file changed, 200 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>> new file mode 100644
>>>> index 000000000000..2ed4ad92958e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>> @@ -0,0 +1,200 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm SoundWire Slave devices on WCD9378
>>>> +
>>>> +maintainers:
>>>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> +
>>>> +description: |
>>>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>>>> +  class ID sdw20217011000 in both operating modes:
>>>> +
>>>> +    * mobile mode -- two slave instances sit on separate SoundWire
>>>> +      masters carrying data only.  A separate top-level codec node
>>>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>>>> +
>>>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>>>> +      master and carries both control and data.  There is no separate
>>>> +      top-level codec node, so the SoundWire slave node itself owns
>>>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>>>> +      marked with qcom,compute-mode.
>>>> +
>>>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>>>> +  decide which mode to serve; the presence or absence of this property
>>>> +  also gates whether the supply and mic-bias properties on this node
>>>> +  are required or forbidden.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: sdw20217011000
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  qcom,compute-mode:
>>>> +    description: |
>>>> +      Marks this SoundWire slave as the single aggregated slave that
>>>> +      implements the codec in SDCA / compute mode.  Only present when
>>>> +      the codec has no separate top-level codec parent; in that case
>>>> +      this slave node also owns the codec's supplies, reset GPIO and
>>>> +      mic-bias voltage configuration.  Absent in mobile mode.
>>>
>>> I doubt there is really "compute" or "mobile" mode, so you just wrote to
>>> match use case, but that does not match hardware.
>>>
>> This is hardware fuse setting, its not just usecase based but it changes
>> complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
>> devices representing tx and rx side of wcd9378 however in compute mode
>> it only has one soundwire device dealing with both tx and rx. compute
>> mode is sdca class compliant device.
>>
>>
>>> I think there should be no separate top-level codec parent in the first
>>> place, thus this property is not needed. You always list here all resources.
>> There is no top level aggregated device when the codec is fused in
>> compute mode.
> 
> There should not be a top-level in either case. This was always Linux
> driver limitation.

That is not true, its clearly a hardware topology thing.
Codec has two devices tx and rx, Only one of the device (tx) has access
to CSR registers of the codec, so rx and tx are pretty much a single
aggregate codec device which is why we have top-level representation of
the aggregate device.

--srini
> 
> Best regards,
> Krzysztof

