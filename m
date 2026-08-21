Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60164D8DA2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329185; cv=none; b=uKUCvroB2mXj2SYgx3NG7/5xUylJGxisqjk39OakpCZB3aMiDnAIvB2CQjwR5JTYHMTpDCboejGs1SnXo/Hc991O2jH+uYDgAmbDU66uhKoILaNekibrfPD8RBh3PU+n6P8MOsX0z8igPgQot6Ia7SJlSZ7DXzZU0ML29qHDcrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329185; c=relaxed/simple;
	bh=X10fgcE/VdvZBiLYK96ZfvDAsItFNmfond2stuPddA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rh3I9spEihM+LTK1spj7atctf6eiMxx9XVpzLUd0devFEpHc+KxEEyWMOSAI+LF9DYS3ulw7I0iTSLLv+AnYyzdl91XsoEwgKkSLVFqTndpETsZK7Y1rTrHeHPS3S/7MXaifNLD8jh+DoJplGDXGA/Eii9mXPGeSHmlFam/MDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N71lhcbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1IPRsxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N71lhcbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1IPRsxu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmCfG3876604
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=; b=N71lhcbr5rc5+Ma7
	v7CHr5pI0zWKHpS5WKfVzmaKWSDa0qPLNneY6rafufgyARMVgi9FcrqVaWYBBHrY
	COagBa67FingibI8pSKl3ZwRQA9CnJ5QMJBs6Z4TjfF2GhOwIr2vp3P1uMeIIG4t
	qmYRQR3ydxJpNjiwhamZ4GfR6vuUGjPkmNG/wjhw7aue4GfQo+tL4uDY2pkovlLi
	+dcVHB5V7ynk77UYXI9igboWYJBlMlZ7vZXn8ML+KVjbaIDJLqogTXzyrh2tERZe
	Q6CfduM2rbDDPPMwB9E36inNdUhnSpN0Zzd50lct6zIe71nJpniAs06X+P+IOYuD
	gULumQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9tk7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:19:38 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb64224fd2so2410634a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329178; x=1787933978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=V1IPRsxuDG6rg7FbMrCs755o/yJHxniVx8t3O/XDpKeH4JHqh1Ejeb54QKZEzfxhOZ
         D4RY9/mo5xct8nyGObaLIoZ+0V7t/vcTnzrHpjTQ3ccBZ7tqbcfS1lAXhUK+yR+8ShQc
         bRKNg1rGygzqSjmoPFo5enrWMg/tvvVdLSbuJv894LBcpbGV2wfmBnelUHzNzjOoLV8d
         N/xW0oNLqVVMi+eVmy5Dj6fAZ6BIsDVgq6QTJRFG2Ek4sDf8emYqY5Sy/z8+ALYrTRd0
         aF3qqjks6zjWzbAjPeetunghHd/HnjMrh5OHsa+VqQC6SM1ZPpdo1YmNkQi9fgjjBX6o
         ad5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329178; x=1787933978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=sC2YS/OOnfeEyrD/adXT6swBPCH/+/LnNyuWKXotQpvZ20o7FodQE05PXA+M7t9Bv+
         7rVblhdkLmcBMYq85j1M6KVKSD5C1vVt3Qk0RSBbmS1l/Uw1Fb2YEYYcc889fnn2QSO5
         qPVOipbmF02du5T0rrKRkZWAlgwoiRNRackKbzziWW1LtJgqk59Xp7M7pRVuyU3mI6Fx
         iDMb1XpB4xgWxoqqbhb8O9u+LpjsAASMZsMRIObPuTQq7G5Sz1xI3cLS9sYnIg4MfUky
         RfKY238YruvTIn5f90yV5Tys90wLH+7pGae3fy00vj3RiCvegkuhrLZVh6zOT1ZRtsyJ
         yx+Q==
X-Gm-Message-State: AOJu0YyhSa1tBX/Ay6+go+pCcWuBUDC67dVmqhv1fw+O6ZNp2e4MRM1u
	bzyGzzik7sYD2N7Q0U7G4VqzuVXMzPpZrS5PD3fjPYdR9RLsF9tgTJSytbAaZ2E/yJ4GIwgOqGp
	cyN5lAAyM0gLRnA9ynvzLVbVfdDmuVxh+/Oa90YZ+U4Nag8YBABU3P6g0CE54AKFwybxgE4t7I3
	hh
X-Gm-Gg: AR+sD13ltGumX4XQfEC1shdGJ7bKhgdycdcFRbYGiFXLuH08ufLvajneYc6FLFsH2W6
	yO4xTA+wkRO6olExgaGoPfB+9BsttpA7OFz7BCOrBU8eLrTr9+jKd890hbaHf8jvy6G2msBR2x/
	0/zAPRyFtmylJo2w33LcdngCYe8N6QCcMh9yuEpdN11Fk3wBL6qkeO5YCwId5FeD8neOyC3P+Fo
	hWKI75O8wnKCqvRjZTEWBpBiMsmRJssOz2N0h2hr9UUlvybgu6x4MeC80ZFO4SqvOSUltWMe3F6
	0MRkSWphifgDkTfawVxjDKXtm0EJmj/ms6IXhUY0WHLq3lYs4Qf+JpxIX9JXCCN8sXFbJYlveNa
	s2gd9nHH/2zRGgxOJyau/A36Y+7TjJtWk
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606887eaf.24.1787329178058;
        Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606821eaf.24.1787329177641;
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a6c360asm4738369fac.5.2026.08.21.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Message-ID: <c82359a1-6b64-468d-9823-a196f291df0c@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:49:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
 <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfXx0nrW8MtRPS+
 SrR958rK6PipkvgwSq/gHuQzV+UbMeruFFPE6Us3oOs4c+bsJMdWW1ZZukbhj1/TIAL6o+toDmF
 CPswBLVM+B3QA9BsM9tVchJp2COZ+mXoznsSwcC3PyBt/XmxwYHUdkf1Z10iYcM723IkRTmPVj1
 IXt1C33yNXT+eEN4H1VLEOM0twEFbgEy9ekc5jWmqtjeysLwlwopLBEg3AiIOH2aGnlMOQk1gLj
 V+2Wtjx6TLkuO9BUFCCFIeV2Esdp8RkKjWoLucyi3QKPVcJtlOpyAP9WzKikjM+e/5aO6qUjpq6
 Cm6vioatJs8WbyrTkb0aqhK2eV69oc30Bu5/J+qDPjD7HjiOh+VHLU+sCFNXAL+hW8j1YPVaj43
 gnsOaZUbWNa7Y38EEoLb0kqaBYs2BahOHT0YxMajuJ9D4Qzi91D0AC/htspv/mM9yQSjf3vVirQ
 Xg9R1vxO3QYvHKDkO6w==
X-Proofpoint-ORIG-GUID: kGyWfKaHqMvgtpdFGrNXqftQ8eTd1egc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX5laB+eiPJh+d
 h8OAkfcu5VIHFD3Ut5QZBSxwPNiVxiuCSIJDX181RjGurb1K9/23RkRaTkHeKTiKJTDeXT+wAQ4
 NMiEaMr3xoIjYvQBIfaLH3y8iJCSQ6k=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a887a9a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A1cAmru4g_ti7Hb5znAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: kGyWfKaHqMvgtpdFGrNXqftQ8eTd1egc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210127


On 8/17/2026 8:55 PM, Konrad Dybcio wrote:
> On 8/17/26 3:42 PM, Hardeep Sharma wrote:
>> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>>> interface through the common pinctrl-msm driver.
>>>>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> Function3 can't be selected because of repeating names
>>>
>>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>>> Perhaps there was a longer name that got truncated?
>>>
>>> Konrad
>> Thanks Konrad for review.
>>
>> It's a real qdss_cti_trig1 line - the in/out
>> mirror partner of funcsel 2:
>>
>>     GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>>     GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
>>
>> Both map to the same name because the driver uses one coarse
>> "qdss_cti_trig1" for the in/out mirror variants.
> But these are physically separate functions, even if the mirror feature
> makes them seemingly one and the same
>
>> Listing the function on both funcsels is the normal sdx convention for
>> these mirror pairs - the in-tree drivers do it, including the same pins
>> on sdx65:
>>
>>     - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
>> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>>     - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>>     - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
>> do it.
>>
>> Only funcsel 2
>> is selectable from DT (first-match), which is expected and matches those
>> drivers.
> As you described it, you found a bug (FSEL3 is not selectable), please
> fix it in all the instances you've mentioned.
>
> Konrad

Thanks for review.

Corrected in v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

