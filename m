Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CB435A9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626100; cv=none; b=dsLZcaZqHr8r0yzrZ0TStvS1vYniiLcKSEJkvfrIP717sb6MmRBOfkH9sGV57ueVSMy5PShi4CRQJ/gBhqK8lTQaRvkil7722spDcgtri4ugC6m9yP2YBRaMXOlQs5pwp1Wty4GHRcJ/i+oV4SVjkv7kcHBCQhLWnqhvoStYpfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626100; c=relaxed/simple;
	bh=U06TBo/mKu+eYZDBmVcAl/yURIbM3o/0W20aN+oBebI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdmCDQ748G9ffudlsSfQiUH/QeqOOslf3ONuJZ4K2sVBfF50N88Gzkr4zdjyVl6Y8bbx5ntJhBIEcXVt2vksKKJXAzzDa6KkQq0nR/slaLVlyA9IY0uOTdXWq76o6nffp0pbewce9m0nS8KQl3EDHBdQqsITDp+f72LUPqqlJV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSa3/VkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI0TWzfn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSa3/VkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI0TWzfn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8jKUU568564
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4ValDJqxvm9G1fPP8csg7waG171yv9cetqT9BwGI1g=; b=VSa3/VkSvMC4Nxbu
	itTziw8biLB87CwbGyzLOXix44bpWK7zDks49475SWWeHK7Jegn3AQXP//AT4wEq
	khSuMJ/tqIjUFhsP415aWbRDCf+6/dqyaVIRfLWM40eapUfA7YsSG9aCZKWriq2l
	G88ipSXrUOG+jlTUR1EtAGTtLw4Hp/vH34X+0ZypIAARr3VUMrd/nOPpZ/PVASe8
	Q25jX1e2OIb3O+kvBfQKtW9iVHLobYxod1id8O1XCSVZ31kv4hLueZTjLL4phO8j
	j0e9FOsa78oXzz/sYyumucfO+hDtJZw7m1QPZQuyWugXAHx9vns1ZJ5lJj2i3NNd
	XAp+1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvsgsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:28:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf27789c79so62496005ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626097; x=1785230897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4ValDJqxvm9G1fPP8csg7waG171yv9cetqT9BwGI1g=;
        b=KI0TWzfnk7bmk1lxXO9w+Pc2stPr5b/KVmk8zk7dMu/P+qhHGVSFfJtsPLS1rTXWEK
         nirB/JJtWUP+OpnWoz6grYTFA+w8l9fIgR2nitOWJLCb3FHKZRA0bPrsq/wfg9ffeXqv
         N8OxABKAvS0KjEk4zUCDcD167gzLIAKzjqWXQitmH4gRtFFcwZWl9a6pSrERkheHtpxt
         gEOsdEpEZzIYdbrDN6yj4tY/A1ZrBfyMWvARsZQXAC7o+IiazNEDPsxzrrZ3/FVC4M9l
         c9iB45Tv6iwN0Zx6WmNjXi8NOK63WILuPIGCu7FnATGlzYoympnawjgavNiIGHgIDsAS
         oXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626097; x=1785230897;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4ValDJqxvm9G1fPP8csg7waG171yv9cetqT9BwGI1g=;
        b=lRiKPFd2T1UAWsTq57S5e5eXCiKOWNELX6sivbGDTqw02YoKMREt6+Ud7AY1Nz2BQB
         iQDRm2wUCiZjZ3lfXQ5OMBUyWggB6yzIsPKS99TkDTd1UGMGEOzdK/X9GXyPVmsDo+Zi
         dDkHBsYdHtcwpwj47sgblVFD9HR8uJRQ8oPRlC4m18xn+tg1MXGxPkbWppqe+yspNRDw
         ikIYAUXSCduBq19GjiaaCJ//mfbHDOBznKd8EfcyFYAGzRs3GrqBY5p8FHB25pRAcYCp
         gp/xAtRMzcNH+go88Cnc2OnKYCF3A4PsxuoYWy5DqJDSy9re58Edk2AA9YY+aWwCpayO
         aMcg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8QDFxYAsh/stXjzRxpZHJz3/kDJMLc3qPUChDZMLqQOEKl77Caj8PK6Q+FoaWZ25aMmPHBLicw+G0jNfq@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDzQ0esvBUVSI6Ta4QQm1sO9GQwZjtMV4jLZxeS68UvDf4grH
	T0P+HpfIytqovV99xRA2zUcqYs5eNvAIV7XmaZ7aPsKKGF3CVzLI/S0l3TOK9d1kt8F8VIPwGnW
	fycztCSVy4ZMzhzDNrFSrgLkSSgIbrjp69p2SnaTdasr56MHt5Onx5lfgVrDnrUlDm3IG
X-Gm-Gg: AR+sD12yIwxMo3Eb2++KQP+1kDor46BWdQFgP+ez+1LO5EJ7R+H1rvUUtP+ns1jyzfD
	lgJF2LI2n8fA6mZnKaAN57KieJLrU7qkGBsumrnuW2P9TxaJAbfVON46UtVjp8n+OIvOKbxUojb
	5p2EtV/ARDX+SGMxemGDCMHZch2DtBPmmgtegmRs1gkMrOf3/fdbYudpL/m78gj7NlyCuUrPviW
	EuuFlkkm1SJpkgQ5dFCSlXHn/Hz1eMjN1BokCBPaAc46N3YbwdvUSPwHnCFyHBkNP1vJwtr479x
	T2zdMP8VbkVtxVd84JEVajjiiWXYSXs4BEaBszaDtd18LMU2KOLPHCPJse5D3vF6poq0bseNQSQ
	ZxLigY1jW6bgQoKTWXfEhfZMGdOBAi1QmcahXdVU=
X-Received: by 2002:a17:903:2441:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2cf34a30f51mr197917375ad.45.1784626096687;
        Tue, 21 Jul 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a17:903:2441:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2cf34a30f51mr197917115ad.45.1784626096243;
        Tue, 21 Jul 2026 02:28:16 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1348sm72292195ad.18.2026.07.21.02.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:28:15 -0700 (PDT)
Message-ID: <28cde774-bca2-4bb1-8629-f61f1f92c469@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:58:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260721-fiery-sheep-of-piety-4fd04b@quoll>
 <67179d90-6201-462c-9004-9b4cfd114250@oss.qualcomm.com>
 <2d4513e2-7e14-49bc-8b70-6c07c9f99d6b@kernel.org>
 <e2e50e30-6da2-45d9-b472-dae7d41d100d@oss.qualcomm.com>
 <571d0b42-c566-4426-ad55-514c280b9b1b@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <571d0b42-c566-4426-ad55-514c280b9b1b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ooNMH0OtC_I1Z6DAoqFtKjrikywQv2cJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX5Qf6NgNZOhYl
 F/ITIJvZ0TkXgf93s3Z/Zz5FSrOxxVflRT/wUxA2VxqETYmukHCnEyvyS7rIZjqa6kpur/7V30V
 0iW2Owjg+5k0VITwD0A5+gf6iRUPPeY=
X-Proofpoint-GUID: ooNMH0OtC_I1Z6DAoqFtKjrikywQv2cJ
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f3bb1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wdb1h0LgAAAA:8 a=bwXcMLKI7JprXPFKUcQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX5m9NR/3RiRxi
 17vrWY1PBt44dKlZXY4aKZj4aYGwgz88YZ+xUCi09rPrlS8o+8Tipik5q9eUpUyRX7r0TPxxzYS
 is0pPbN0FlPaOP1vqSlSkUqNiztjhxfRe7Ta9CO30XcMJgMvm5EVbvZOv9itYmqyziuE3h3BiRu
 0bRDAOypPhkZQ9+O0y4D1J8lvrcq63wHQlXj28lmBPTAq0vnzi2rlXrCEYXH8xNA4fn8iCnRhfl
 P7JfgbRNbAcqNli3sz6lqs7+gmu/ce+LfbD0IMaWsV5ye9RfVFW+PkGZngfHGEepaFB5kAMosm/
 MOiAgiY5giJ4ccB7wHoxV59M590RGGgglRja4sr0ZaPdH1YViNfDQ9ZwiH2Wk9maYPRDPKHTA3l
 u5Q+AuFFwrdUgnPq0zbb5FbIfayfc2nW4CraMM4BkT+Mm4apPO7WVqXxRCmDLxhhwtusBN5hewF
 JfJE1i4PJ4rm7rG9IQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210099



On 7/21/2026 2:16 PM, Krzysztof Kozlowski wrote:
> On 21/07/2026 10:42, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/21/2026 1:50 PM, Krzysztof Kozlowski wrote:
>>> On 21/07/2026 10:14, Mohammad Rafi Shaik wrote:
>>>>
>>>>
>>>> On 7/21/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
>>>>>> +# Digital Audio Interfaces
>>>>>> +patternProperties:
>>>>>> +  '^dai@[0-9a-f]+$':
>>>>>> +    type: object
>>>>>> +    description:
>>>>>> +      Q6DSP Digital Audio Interfaces.
>>>>>> +
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        maxItems: 1
>>>>>> +        description:
>>>>>> +          Digital Audio Interface ID
>>>>>> +
>>>>>> +      clocks:
>>>>>> +        minItems: 1
>>>>>> +        items:
>>>>>> +          - description: MI2S bit clock
>>>>>> +          - description: MI2S external bit clock
>>>>>> +          - description: MI2S master clock
>>>>>> +
>>>>>> +      clock-names:
>>>>>> +        minItems: 1
>>>>>> +        items:
>>>>>> +          - enum: [bclk, eclk, mclk]
>>>>>> +          - const: mclk
>>>>>
>>>>> This does not match your clocks.
>>>>>
>>>>
>>>> will fix this.
>>>>
>>>> clocks descriptions are misleading because they imply an
>>>> ordered bclk + eclk configuration. I'll drop those descriptions.
>>>>
>>>> will keep only
>>>>
>>>> clocks:
>>>>       minItems: 1
>>>>       maxItems: 2
>>>>
>>>>> I gave you exact syntax to use, then in previous version you used
>>>>> something else. So I reminded. Again you used something else.
>>>>>
>>>>> If you decide not to use it, sure, your right but YOU CANNOT come with
>>>>> clearly invalid code as a substitute.
>>>>>
>>>>> NAK
>>>>
>>>> Suggested change:
>>>> https://lore.kernel.org/all/2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org/#t
>>>> minItems: 1
>>>> items:
>>>>     - enum: [ bclk, eclk ]
>>>>     - const: eclk
>>>>     - const: mclk
>>>>
>>>> I tested the suggested schema, but it results in DT binding check failures.
>>>>
>>>> DT binding check errors with the suggested change
>>>> 1. Only mclk enabled
>>>> bedais: dai@10:clock-names:0: 'mclk' is not one of ['bclk', 'eclk']
>>>>
>>>> 2. bclk and mclk enabled
>>>> bedais:dai@10:clock-names:1: 'eclk' was expected
>>>>
>>>>
>>>> With the current version of this patch, I do not see any DT binding
>>>> check issues. I tested all supported clock combinations, and
>>>> dt_binding_check passes successfully in each case.
>>>
>>> Your clocks told story that you have up to three clocks, so indeed if
>>> you do not have three clocks then my syntax is not accurate.
>>>
>>> Before we go further, where is upstream DTS using this?
>>
>> Currently, the Shikra DTS changes already present on the mailing list
>> include this patch as a dependency:
>> https://lore.kernel.org/all/20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com/
>>
>> +&q6apmbedai {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	dai@40 {
>> +		reg = <SECONDARY_TDM_RX_0>;
>> +		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF2_IBIT
>> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +		clock-names = "bclk";
>> +	};
>> +};
>>
>>
>> RubikPi3 DTS patch series uses both mclk and bclk:
>> https://lore.kernel.org/all/20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com/
>>
> 
> Thanks, I did not see "eclk" used.
> 

Yes, you're right. We have not used eclk in any upstream DTS so far 
since no such board using this.

include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h#L156
#define LPASS_CLK_ID_PRI_MI2S_IBIT	1  (bclk)
#define LPASS_CLK_ID_PRI_MI2S_EBIT	2  (eclk)

My mistake—I understand it now. Both represent bit clocks; one is an 
internal bit clock (IBIT) and the other is an external bit clock (EBIT).

Since they are functionally the same clock type, we can use a single 
clock name (bclk) for both cases. At this point, only mclk and bclk are 
required, so there is no need to introduce a separate eclk clock name.

Sorry for the confusion earlier, i understood wrongly.

so can we keep like below syntex.

      clocks:
         minItems: 1
         maxItems: 2

       clock-names:
         minItems: 1
         items:
           - enum: [bclk, mclk]
           - const: mclk

This allows:
bclk
mclk
bclk, mclk

Thanks & regards,
Rafi.

> Best regards,
> Krzysztof

