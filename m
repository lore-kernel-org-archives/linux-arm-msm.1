Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0F361DDA
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785050522; cv=none; b=o0fWr/5wsgCb/sfreeSFaYU5KEObTtzgWpj2Cw0P79+qaDnFQkEk+2wdRQjZoCn9HL47lOHP5b2wBhctIqu36nNM+T6AAW9MNpz3S62c7K+8mLtgIJ+NS8c9RDK9tM0cRm3Bhuf+nH3DXDG4H/shsadvvaQTx9b5JP8KOwcEDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785050522; c=relaxed/simple;
	bh=JnhirhMNTfdZqoNrR1NhWS5OMYN+WPr8Yi3PrmfgVUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUJrtVDz+ucD18/bXkNnv6JOaGOFgqp5wp5dCPT9RTSkTC0ZAKXofre+yKJS6MNJo/JiuwtaAFDOQ2i4YioA0sp4d8nS8Kc+E6j7asOLHUAdB64T0eRJXgx7pCKQuvmyHfNXj1PC0b7iFhV29Z6TFRqYcZUeQPnYbgPpO0L8+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vgte/whd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJqEgC/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vgte/whd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJqEgC/m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RN5N4179261
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 07:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNhauAAXd0auROo3IlhDzGkuJ52W6BL0YDItQQ/e5KM=; b=Vgte/whd23a5SA6s
	lVkKq+9ZGNW24cTW9TA/i+74FQG0EdhSWRvQxFM4BwjIMPhiRmPh+Vn+8GPNDyTf
	x2hL6mG2wKg+CCgCmH48LUJcTDnFskLKxoVWeh3mJ4DcfUKMpwMcdVyUIH81t5zH
	xg3LYQuZSjFWgfph/x7BJn/QXG4JbRPN321JAf6j+53HFuWxUf4JlpHRWiLwgMR3
	L7GFwhEZLtNpVOxgjE+YzA5t18BVjvVSNrLI37jFcdoz2V2Gz+hf6wZ9yz6Lq++L
	ULMvJrM7kg9kPjv+zHDJZdVCaK0pLSRUKi4S1NJ8b2b/Tw1aakRPnkl7+oLmEl7R
	eFFT3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm572m97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 07:21:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84870e7f498so1596958b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785050519; x=1785655319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNhauAAXd0auROo3IlhDzGkuJ52W6BL0YDItQQ/e5KM=;
        b=IJqEgC/m/ZGSnxSrfaoU+qpP8hbJbmmjOSKq6i/MQ9zbT4jEfV1o7IL4DI8+w+eyyb
         deut6iQH62QaHzRjJOD4FMbOgwyvDYrD+imPnAWrYDfxSE5O96I+nisElx4RzWorfUsQ
         NyftATVfjqWY40sPYKbMp/hUuju7GZuc9fx2xPF3qwtaNyN9aWsjPTYM/YuyD6UVtkXp
         J7Gr9CHrmwzZeVLXejzORk2yzKXaa+MwuA6CLEerby2KzXyXrSG+H0UyHFYG+ewTcY+p
         Q8vifdwBgu5xq2V3EOdGTQU8L+mpvkyfRF3vSiLG+I14SxPrAR3UQK0yYgtpFtgHlz8b
         wauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785050519; x=1785655319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNhauAAXd0auROo3IlhDzGkuJ52W6BL0YDItQQ/e5KM=;
        b=DSq3arcvXGkDcQuY1aRmUP6ckd1zlxAPHAVjkK7IJQacj9LZN8DMjJOxOkKrMkhT88
         XU03KVFVcbZAd3CVeklzIEyjIe82L3e0XOucfcEsFn/3vBAyrVXJKYHPF+PG2vEDFkAm
         V/JIjNnqLsAWhpvy0X8swMiWH2Vi99dxcecEGcaPNYDcLGEy9Na/VZpg409yoo3/uhWk
         nO3v65aACKHw+HYn+kSS5KVvLRca3PlkD1nl0rJT2Fe5dUUGduXtyI0c4f4etE50BFhu
         F3sgbkV1mpmZYez8sThDl2S1tDWV5n4T8hb+xd9mloypnCSiiDnAoxo9J/AxSelQuvlo
         77zw==
X-Forwarded-Encrypted: i=1; AHgh+RqnuE/11ouNU+fqVbnPU09K1jTBgwkg3cnnNLvnFzDYh3Oec0MMdbNm7QXAlC3kErpfgsiC+K06sWzmIH4z@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYVz2TMIg+/bUyIq3vwcNirusjPdFPF92izYjvS+TaUsfEpDS
	IGaOxjukgobZJnl1Ah34ctoDDPzt1VS3ffD0hgGK/LJXA0T/VHgyNOKfoc3ZfIuMqynXk70POLF
	ScFZbhWWnONUGH0w+ouPx3J/9V/dmxD7nrf8NqyJJIjbBMTBxxzqsH1YzAP2/YOrA8dno
X-Gm-Gg: AR+sD12zqipc2VYAq61PGzYwrMJjvuodtfPTyQ93bicyb7FgmNywWJjFS2/1fuwP3ME
	dpllZTyc+nYUe1KbFH5Y+yvTAhj0GVFmqWfWgx9bv7K4LcPj257PFMC8beaK/bbIqajCHIIKJKO
	g2LXMoJjdSAC3h8dODeQsEU7knIR2BZrkjGUQVaAdnSgyR3d3cjcidoxw4GJ9lO/co6T6AaviWW
	7uoXU5ZllyItyzgMmzcf6tdN5PCYTHcVtYD2qBSQVQF5QYUFXjXn1r9W+PdMKCZGwai1f5s865o
	QyFD5ODlukXKM5qBCqOvSb1issivfmwMYJ3Wk2+hA9q8w0BgqJV9uYIwzclqCLwdEViE5lODvju
	76A/hRdE/yaXlsRxCNPz/QIqhkYfRGu8=
X-Received: by 2002:a05:6a21:9991:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c67e01ee1bmr4195218637.72.1785050518332;
        Sun, 26 Jul 2026 00:21:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9991:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c67e01ee1bmr4195195637.72.1785050517734;
        Sun, 26 Jul 2026 00:21:57 -0700 (PDT)
Received: from [192.168.29.179] ([49.37.131.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc57ae17sm15700072eec.22.2026.07.26.00.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 00:21:56 -0700 (PDT)
Message-ID: <406cba64-f426-487c-a1b9-4c50d05a8042@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 12:51:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
 <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
 <20260716-starling-of-heavenly-symmetry-09a73a@quoll>
 <almDHnEcruBl-I3l@baldur>
 <64bf3979-51cc-42ed-b66b-c7af04536481@oss.qualcomm.com>
 <amJcXDcI0QYqtOnK@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <amJcXDcI0QYqtOnK@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA3MCBTYWx0ZWRfXx0dYUgf82pWG
 moRslPd1ha1RcelrhHplMm/mrIBA3baYTX+H2AbpV+1+YO3biTDaKjVImbQTiWdfe49r3Fkh+6n
 EM7fAzr6gkRHsVNtqUncFFDem1Di3Zc=
X-Proofpoint-GUID: aEUSLugFlq6aL6GhxkzfkDX3xn6J9VwT
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a65b597 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=SQcxhaUyy38hUVr1c2lJ/Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_4R1KaovSme5d24hyL4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: aEUSLugFlq6aL6GhxkzfkDX3xn6J9VwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA3MCBTYWx0ZWRfX56xea7ksyFtR
 vvgqhiAh+T5vOGUy1qXmi7eRv2zX5CLSmBhIY+KvW/gM6CKFjHmkHG5CoAnReEKHPKuU4P+Ggvz
 G8wB8TQs5q4hwadaBq2xFD9Ok1SYXQxCyXopUae2jtCNwZAquSotFwPAsdpeqVay0OS0iJHoA6f
 aJg1sUEcsy01ni50IjlOaWihDudL/xcXjJ86VVW6He3y4TAIVHW5sc5C27Ou+dVHbnEaMsKHZQd
 7y8B2hYhDormKQkuUbrWSmUhDLGb/1nk9NXISschwAXPwDONM1k/9fN6YOV4meJUgZiG5KRVyoo
 zJ6fehhch+HT0SkFJUqlBFFy2hJ3fTwDgbF7m7PH35S0pZu+B9PbNE8MDhi93HbSivQPW1v60G0
 cRis0r1HbwOVNGo1luqfWrDUToJkDBOz9LkiYnE91ze9a+l1A683IsNdtWWpze46Xs/YY4UUOgS
 Q6xkt+TVDfmuFkQ794Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260070



On 7/24/2026 12:02 AM, Bjorn Andersson wrote:
> On Fri, Jul 17, 2026 at 09:11:28AM +0530, Maulik Shah (mkshah) wrote:
>>
>>
>> On 7/17/2026 7:38 AM, Bjorn Andersson wrote:
>>> On Thu, Jul 16, 2026 at 09:59:44AM +0200, Krzysztof Kozlowski wrote:
>>>> On Wed, Jul 15, 2026 at 06:52:01PM +0530, Maulik Shah wrote:
>>>>> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
>>>>> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
>>>>> Workaround hardware register bug on X1E80100") is already fixed in
>>>>> X1P42100 silicon.
>>>>>
>>>>> X1E80100 compatible forces the software workaround. Use the X1P42100
>>>>> specific compatible string for the PDC node to remove the workaround.
>>>>>
>>>>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> Why does the DT change appear in the middle of the patchset? Please read
>>>> submitting patches documents - both of them - and maintainer-soc
>>>> profile.
>>>>
>>>
>>> I thought I had figured it out, but I'm not sure anymore.
>>>
>>> The claim from the cover letter is that patch 1 and 2 are completely
>>> independent, but patch 3 depends on Bartosz's thank you letter [2] that
>>> arrived a week before this series was sent out.
>>>
>>> We're not merging the three changes through the same tree and there's no
>>> expressed dependency between patch 2 and 3 (only implicitly by the order
>>> in the series). But as Konrad points out, in-between patch 2 and 3 we
>>> would not enable the secondary GPIO in the PDC driver, so Purwa would
>>> have broken GPIOs for a while (not ok). I think merging them in the
>>> opposite order would be what we want (i.e. 1, 3, then 2)
>>
>> purwa-iot-evk.dts where firmware sets pass through mode, so current order of the patch seems to be ok.
>> (patch 3 as such is no impact for iot evk)
> 
> But to reiterate the critical point, this is going to be merged by two
> different maintainers into two different trees, taking two different
> paths to mainline etc.
> 
> So, to preserve this order, it either need to be extremely clear that
> this order is required and from that maintainers can figure out if it's
> possible to jump through hoops to maintain it.

Sure. Let me update the cover letter with order to be picked up.

> 
>>
>> x1p42100-crd.dts where firmware sets secondary mode, applying in 1, 2, and then 3 may leave crd boards
>> in broken GPIOs for a while after [2],  so yes order 1, 3, and then 2 makes more sense.
>>
>> patch 1/2 - fixes the purwa to operate on correct registers.
>> patch 3 - Allow crd boards to re-set the mode to pass through
>>
> 
> If 1, 3, and then 2 is a valid order then send the patches in that
> order, if 2 must come last, then we need to ensure that the dependencies
> are making it to mainline first - which you can do by resubmitting the
> two parts separately.
Sure, by resubmitting two parts separately, shall i send (patch 1 and patch 3) as first part and
patch-2 as second part? or only changing the order to patch 1-3-2 with updated cover letter mentioning
dependency? 

> 
>>>
>>>
>>> But this series implies that Purwa has been broken from the start - that
>>> the PDC driver has always operated on the wrong registers.
>>
>> yes, purwa always operated on the wrong registers.
>>
> 
> But by accident it we never touched those registers. So, is purwa
> completely broken now that you have gotten the pinctrl wired up?

purwa touched those PDC registers as direct SPIs were already wired up via
respective device nodes in devicetree. 

Change [2] additionally wired up pinctrl/GPIO used as wakeup interrupts too.

> 
>>>
>>> Perhaps the impact of this was limited as there's not that many direct
>>> &pdc references in the DT, but the patch that Bartosz's thank-you email
>>> was sent for got merged as 77fbc756d9cb ("Revert "pinctrl: qcom:
>>> x1e80100: Bypass PDC wakeup parent for now""), and that would make a lot
>>> more use of the PDC.
>>>
>>> So while nothing in this series states it, it sounds like Purwa might be
>>> completely broken right now and this series aims to fix it?
>>>
>>>
>>> It's not clear to me why the driver change doesn't have a Fixes tag, it
>>> seems like the patch that introduced x1e_quirk was broken and should be
>>> marked as Fixes.
>>
>> x1e_quirk in the driver via commit e9a48ea4d90b ("irqchip/qcom-pdc:
>> Workaround hardware register bug on X1E80100") says only about x1e/
>> hamoa specific bug, it seemed it never wanted to enable the quirk for
>> x1p / purwa. the quirk rather got anyway enabled for purwa due to both
>> hamoa/purwa sharing the same compatible.
>>
> 
> This patch series is the first piece of information telling me that
> Purwa did not inherit this hardware bug.
> 
>> Patch 1/2 of the series aims to fix this (and patch-2 carries the
>> fixes: tag).
> 
> So patch 2 should be backported to LTS kernels, but 1 and 3 shouldn't?

LTS kernel do not have pintctrl/GPIOs wired up via PDC so patch 3 is not required to be backported.

patch 2 should be backported to LTS kernel, so purwa operates on the correct registers for
direct SPIs which were already wired up via PDC on LTS kernels.

When 2 is backported (new compatible) its documentation patch 1 would also be required to follow.
however fixes tag is only kept in patch-2 and not in patch-1 as per discussion in [3]).

[3] https://lore.kernel.org/linux-arm-msm/655b8897-b3f6-4a49-95df-fc07c520c5c6@kernel.org/

Thanks,
Maulik

> 
> Regards,
> Bjorn
> 
>>
>> Thanks,
>> Maulik
>>
>>>
>>> [2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>

