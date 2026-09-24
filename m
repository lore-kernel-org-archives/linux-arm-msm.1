Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243913E3D92
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241375; cv=none; b=g/geKyjI2elHUs2wKQtuB5XL6my42DT0jWEVVjsCjF+7fwFNwt05ZNM1JiV8UdGo1HEPQt1wM3Tq36P/JxHDw3PJgbwE8/So9muPH/IWELxl4KhlCjNnue5YZ8ke1FzB28tZUDH/hz/znv4ZVrla+2EXecmzTB/M1xVrZCtN9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241375; c=relaxed/simple;
	bh=vewmRmetomWN/f0y0O3jROqLs8JZarNqoE74wYalsqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlA/FJoqVaQt3HOLGxyg5C9kSc+04WpbvUu5h0Czhoi6Gjl8FhqMO8p+BJ6XwMepJMkSFKZGaYF3qfePwd47mYz7DVMNHg8yiZadF+Rv/k4ZMddfkDFxYSJGTg0k3bEv83mgOmnFvWi4+QieRh2iRUKMLyKJ5D7F7gce42QrPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZeQjDsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctTlX+sh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZeQjDsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctTlX+sh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e4aw567408
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O64k/r6CyhxA1FU/Q/Zk3HO6+8HRYJQe0QxJg2dFEd4=; b=jZeQjDsbU6lJlAS5
	a62BH+U0Kce1JfWh2cdG5byqLJ7NWSU3oLWYj2IHoMipay6S0vMiPztjwIP5ePR/
	jVQ4mlwRJfD/eZv8oC5nZKMr8d/SdcHG50fQdepv3qeSMgaUe3xdGq8KKPsob17K
	UF7VlSEK4ez1F8oSsH635l6PhkeCGmUNRc2Y5/LfILkE6RSvN/Yn2eHLnFnLLZOn
	zWEm91ry9PMKNl5FYqyrDWsgA+z6vjd+xlz/V8ThgSnaS8qE06trV/wM7hyjFRA3
	+Fz1iiE8YNfbFyM7nqqaC9001Sk/VgEq8Q3dS+xhpxm9mAVPtYPhTJ1q2jwE8uE5
	7/b5ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9481-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:16:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso45518385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790241372; x=1790846172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O64k/r6CyhxA1FU/Q/Zk3HO6+8HRYJQe0QxJg2dFEd4=;
        b=ctTlX+shB97ninlwNeuR8mGrbeFcwJzMTuI2Lrs5ycb5vR8vzbFLjqHm7cFXQHThLq
         KyGijPaEFrlncbbaMkfGwpAF4d9u6+4+rsOWIjZ8hiBEeCDqPUTDc9q59VyPBVRuWPyt
         lcR5jhwr4JBQVhQgah/6ZQwv/PAuunWg6479EvVGFOUSSEN2lhsuWZThCRM+4+inqosd
         S7fmWbBH4JeGKsa5ZGt+MSi/KlmrTs5JBgNd4ldGRVN+OMmMRLYWHiKRw0z8e4BJorun
         FqdtJE37Lqt1coXdFJ+tPSmkCypfNtY45s0mBa4BU8a2MD8fLrXY6FmNa7mlmKs3PDWe
         3SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241372; x=1790846172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O64k/r6CyhxA1FU/Q/Zk3HO6+8HRYJQe0QxJg2dFEd4=;
        b=XWYglG0DxSGTIT7M815JQlZOgXVSkCu3OoHT+/ClcjmJBxWqZveDMJzXGoJ2T8aq3l
         yQZW5M20SJG9o5TaAVdNKq+EJZBOplyoftpYkCyhJ2U9YESJNnkv7fslU5qT95SRlqag
         2zkctiVNhdu/5eVMgxX7GvqpEvIdSwoQESp9mSxssj/BRevURm3rs4ilHrgEbrcqXWcd
         IBnBqKPuBs7p50COG8LlDgxoBNnXu4XbtAyo+1ac0EELdW3bOpxwIvBDluNy9rFXsR1j
         ogZuOe7I6qfaYRLQkRv5S7SzgIpMVTHZSUsWYVM5K3Bevjygt0nfWuBR2b8mWA4jSVx2
         M0FQ==
X-Gm-Message-State: AFuF++kuJd8c4vvQynG+L9ILGBKhqhRtWpo8g2u7v9u17mYOeCG6o9Qx
	dd90zQJdsaukPgk0I8F0RHezcfJ4hrdgs8pi94YhhZioRxaxAgb00aB3LIKHukyI2BE/aN2sl7r
	FvCSF//alcc+3SBTDddml/MlIW58Fit++lCPXzl03IZGzuLnK8k7EKBFMDJqVHN1A4WDq
X-Gm-Gg: AYBFou1ItGdh/MfErTehcCh1lhMnofimshv6PkB8/FW+Xu3W7cGQ1tqYWQKu46RNNJa
	4fWHCp8/JG5v6RRh8p4F3CuopKBlA9yGGECafG1seti609e7p7MQTqabhnXclF2E/LJL+jFiI9G
	GujjkXUCvPWiz/W8ywW6b21LdwCDvCsqRCE2/ZYwmzvA0/5g70G+OO0jCOrKiHLpuCDbKKtybXM
	+8+STr1+6db8Gj4rp3nBxfrdS6/kpMnA/DDvCi4Jw00VRCMZ0ZXOsviiwXmm+7HbfP7KOkekLO3
	ZxawPE3FK6w9UBPx840DEd5Vm7VdX/D3QvsX9woe3/QMeFZ8tP61TrlDaf/SuPqbND+ZM7t+6jR
	BhrF9Mar9t9qc2kJ9sG7wZw==
X-Received: by 2002:a05:620a:4482:b0:934:95d9:85fe with SMTP id af79cd13be357-93c363bb776mr190962685a.3.1790241372050;
        Thu, 24 Sep 2026 02:16:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:934:95d9:85fe with SMTP id af79cd13be357-93c363bb776mr190958885a.3.1790241371449;
        Thu, 24 Sep 2026 02:16:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6d9732sm264583366b.60.2026.09.24.02.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:16:10 -0700 (PDT)
Message-ID: <6f7d4bc6-ca16-4293-938b-0e5b7ddcb44e@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
 <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
 <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
 <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
 <09715ff3-df00-4ba7-8d9d-52b15e8b86df@oss.qualcomm.com>
 <CAMRc=MfqztXugCfGQ9_x8spNeWGH6C3dHLzdknH42Pt8WV8HNQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfqztXugCfGQ9_x8spNeWGH6C3dHLzdknH42Pt8WV8HNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4ea5d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OIwW3chDm1YJotNPmsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: oYoG4giTEFUNh-YIfb5Ray8Jz3QEc2Pk
X-Proofpoint-ORIG-GUID: oYoG4giTEFUNh-YIfb5Ray8Jz3QEc2Pk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX3tNZrA5yo27/
 mZyn8v3lzH/VRdFXj+tve8rIiH8WdsJUUefFWT4QFUBzKDBEegdO+WCkyUFY/ZJAkZeXgTve5Jl
 LDTg065pamOLvlB2AwnbzlCuXwGWrtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX90tJy56HxYpF
 DXQoosAPKDlFJ3rwjtZGH9gL0nl5mahi6nrFGhHn53fByspGF/tZycGfRRYr8ERWc2/9GjvDbgC
 9tOGlmScxvXk7q2PEf8ci7AePdiIR1xpR7o3UE5BTS57avo6DlO2uWWDeKxYdatyw4i+hOGtUb3
 EORwFbC5WKZpzYRUQ7QH/E4HaD4EzDyf39wVYidpB0Zd8s+/iKt8XQpwxx1hG1eGojUfgFCi4E8
 bxix3k5uway59cgj2c0Eoyv+dRhf4SkZ+tMs99/qLvAD5LCyu0o5IAB+SQYu3A3RnZCs/imc8Ug
 HNcitqZ/EQYyrhSdb3tJW8MHTxrbP523wHP2LuK8jq1lvw62cS4Auv2XVbANQX5DHKR3HW0Mna/
 6Ej2SYbrpW4E0LI1EYH4ZV5AIHqeV63icfvEPNjsLsgXK8fubNW8gFBjKHmD50MihUee7NsbWtV
 WYFIeu9qHkPn+NU3/iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038

On 9/24/26 10:55 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 24, 2026 at 10:50 AM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>>
>>>>> we should be keeping GPI node default enabled similar to common QUPv3
>>>>> wrapper node.
>>>>> status = "ok" for all the nodes.
>>>>>
>>>>
>>>> The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
>>>> SoC-level and only enable them at board-level.
>>>
>>> For no reason - the DMA engines may be reserved through TZ config,
>>> but for the past (high) N years that hasn't been the case
>>>
>>
>> There is a reason to reserve this from TZ. Some use cases require GPI to
>> be available during early boot, before Linux is up and running, which
>> necessitates keeping the GPI instance enabled.
>>
>> Also, GPII is allocated per SE, while the GPI instance itself is shared
>> across all SEs within a QUP. Given that a QUP typically contains eight
>> SEs, it is likely that at least one SE will require GPI operation.
>>
>> For that reason, my preference is to keep the GPI node enabled by
>> default. However, if there is a strong preference to make this
>> board-specific and enable it only where required, I can work with that
>> approach as well.
>>
>> I think it would be better to align on the expected default behavior
>> now, rather than revisiting it later once additional users start
>> depending on it.
> 
> If I understood Konrad correctly, he too is in favor of enabling the
> GPI nodes. I was about to resend v3 with that changed.

Yes please

Konrad
