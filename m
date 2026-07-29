Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F147D95C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327695; cv=none; b=WdlT2gzkiy+uJnFRlM3bbugpKPp2hsNCSfeRQM9ydEqnSI78JlevzratiIOA38F9ez5tsPo8qVqH5UEEuEAm/i/zOiZEUQ+3PJ2GiebaGV0/BSK+prPkFjn+os3iA0d7qDqqrjvfSR1z0p5jhJy1/j5vEouRyBGwmY2idk9TfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327695; c=relaxed/simple;
	bh=7ICtZdvXRJV3EmjLJJIYKJYnvr+oM/oLWK2mf4A79nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6FAPyYJc/CqyPdd3qkTGDJoyhhZjm/iNmUYgshihiPB4DOwFyEea9zvfJvlizdbDKooyymcyqD/PVnf5dDilG0t9jZsXRrGDFXH6eanVy8eaKSJ2r0Df/ysa1Iya40+3g1/fUtBcrY7GJzT5q7qkHWrl0gYjJiIvyKpcr5AaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRF/pWGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L28ZgKo1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRF/pWGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L28ZgKo1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBjele2136639
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHpog9Rk1OST8cI3WlMIogXhYpKp3S0j1bZgLhgfGkc=; b=QRF/pWGEiD6EQDEl
	mOBpM9V+bsquTM8xpsQjXSNtA5ZvETht83BabEMGKX6C1bQREWFB6JfdnpMiTtzf
	LRWdrFgjLit1ilhjH4OMZMIzQELh18Rprm/2UetHw5qu+GH42ECnFjy5eSRA+ACZ
	Ma6RoBQ8gNynD6qxC45RuXWitlsNzpDre/f/Jg8znLLYs4qG3+uZKCErllmgzZQv
	2ApTTtnbXRE0JtAGDurfv5hprxbnfUbHzaB8E0A2PC0SAJ+p+TooZPEigjGPAA2d
	DcSqGg+ZH49vOTX0/fT3XQj02OwHxA+iwlt1oSBV2RasZcdjhhbvNv0p6WUkn6H8
	dj2E2Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgx804en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:21:29 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfce251749so10850e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327688; x=1785932488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHpog9Rk1OST8cI3WlMIogXhYpKp3S0j1bZgLhgfGkc=;
        b=L28ZgKo1VmKw16Esp/YZpcljq12bNf7UwxQKfSbHsE4NCYAlBKgj+R/Ybn+ZVcqw3L
         T0rKq/32FaAmFlgFYaum8yOYbhSKUHxmwAma9aMIAR1l5Yhb9g/dszoSN3zWc9UqOUYr
         z4NNc1I+28MnH2QFIAbkBMpOtDD6GytZ20ROwh6GUHLrH6MIMfBKETucaAxHu3B2+jm5
         TBdsUBvaxzNa7MWAPtVZ2hCfpBQl6ny2AUA910nKUIzJDo7Q8PqS+hiNWFDNOrNtRiHg
         sRCmcKcMUclBzn77Pjtdm3UeYX2n/zTp7+0/dMVSvGvRA83DCyZFt4Aq7PRxcCxWVRJA
         s4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327688; x=1785932488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHpog9Rk1OST8cI3WlMIogXhYpKp3S0j1bZgLhgfGkc=;
        b=f1erHySEKh52PYtHX9n8XO5FK+1CtB6w9fw5QNDvB70uNZlLtRYS/EzISZvzDRvU6D
         eoXdrR37oL7Xa6m5Vx/EHLMLQ+eSkGI4bwvBUXqo7HrqHoEo5kkyfEdFFFFfC+FA6R8w
         wCCs+h11oBF4IY73EkpL9KG5lrCxuVTYq8k7bxYKM9D3AkPF82FQrdHU0exVlbSj47dE
         mh/mEwLMI9RmwYXluhBuDmmZOcJtx0y7Ac/62acSQWYvgqclZtbhFiVH/MQCVaJrz6bo
         Sy5vU9qVr/YdxSNwFCN7opj8qNaNev0q2VI+NZgxAQ8SuD6eNd6VmiiR51WMv8QeGKPc
         SO3w==
X-Gm-Message-State: AOJu0YylFeNI6Ked6lQutJJGWIHPqqDAAOh58kKSPmiq3jX/1EttZBIg
	J6vZiA8uiWLBG2SQAszvpdZlnAvYN5u1+RDZj96PdUqpguM0Zv+4Wnrht+V+won5H0YOSDFa/gd
	S3XQqFX/Izm3YHVj71ypddvOUFQA+HLg6w4NiYWquSKrqlVFLPi0C967qRyyKcAyrHWq/
X-Gm-Gg: AR+sD10mbCurgSYyzalPDwOJ7vCBQ+MmtKe75QJ4JZWAH1yg3Diz2MqpcbVGP7hDEMU
	Y2bs6I43kTg65fdYhFsAb1DaSM/pdC0ZOWh0HKWwecZ6iOlhhqweEKznOtrf+M80yTXoY1A54kt
	RgENY7lTIA8LWDiKwq51IucLxNiqw5oAy+GTlrbMZzXpsAahar84YfpcLO0iKaPNrWlI1vUO91K
	d89da75bF3cUJ3Wk9tKhVv2k0k0zruVrA+Swh6aXIaCksJIXTK38zFSswEqem2TNW4A30dRkr/+
	dBbzF9S5MrcrpsrcbEJiZo1Tzq1pG9lE6DpeX7jddrcXH8x/AIImCPdesfKn1nGPcoEuvm5qQDs
	KdNy0aooSMRO+22ceKjBxRWYi
X-Received: by 2002:a05:6102:3752:b0:633:3bf6:977c with SMTP id ada2fe7eead31-7554b743414mr2286005137.1.1785327688193;
        Wed, 29 Jul 2026 05:21:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3752:b0:633:3bf6:977c with SMTP id ada2fe7eead31-7554b743414mr2286000137.1.1785327687786;
        Wed, 29 Jul 2026 05:21:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c6c9casm736909a12.26.2026.07.29.05.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:21:26 -0700 (PDT)
Message-ID: <7a77bcd6-3c15-47e0-bbfb-f3d1790edda5@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
 <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
 <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
 <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX/7NLjut0YuG1
 UsYCchj/UtzDlo4B6eoQbxfZfF1eDaINVJHfQ1No+saBxpkmEWC0HYJor5XsMHcTJq8rKNqnqnr
 MEvA47TuQC/5DGbEmQNJZrJNuO11mUM=
X-Authority-Analysis: v=2.4 cv=MZdcfZ/f c=1 sm=1 tr=0 ts=6a69f049 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9hUut4TBz1VDe5gvW30A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LWAYvatzI555WST2-yqJqZP2ptnTP1jY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX4huXU26Zgx1Q
 ChMMa/nSEw998C17VGPwgm9bwUPleWH+fM+igJvUPDhyeXN2WCb7Y/UCaprpzXU4uk7WZgpa8h0
 AUyA39bhZB1kh5usgHVNu2ooh1DMIlg5ujD+RDz+jtxMZFlY5xcn8JIGcivomFfBNTpvOLoTx5Q
 ga0Oq8nmq2Ln0TDkHO1kRlCdEzmUfALpODlskf1kaw09q+bB6EQN2us/Dd66Cw7rP4PjpSj6PKm
 cX3hAK0kvSZRUVEvzGz/gFlxMN0F48QfxfurPf2PxLALHhQ2tM8B+/P1DoKIdL2jm5Aa2RLCDQd
 hNOhG2wU5KsOcEoRpS0WRtJoVjIxqz3Sl7XcEVljBZ3OPaP/TlqRVjI7FLzKyqrx39XeRHThh+1
 oz5nihbpJPe12FqNeJvLaAR3jk/JNJmqktv5kdkvGghcRYaUsfPOvZx/9cqh+y4uoFFl6WV6aqv
 eMCmQoGZ24iv8LxzaTw==
X-Proofpoint-GUID: LWAYvatzI555WST2-yqJqZP2ptnTP1jY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290102

On 7/29/26 2:21 PM, Konrad Dybcio wrote:
> On 7/23/26 12:44 PM, Vikash Garodia wrote:
>>
>> On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
>>> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>>>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>>>> Update the memory-region property to support two regions:
>>>>> 1. Firmware-loaded codec carveout (existing)
>>>>> 2. IOMMU IOVA reservation region (new)
>>>>>
>>>>> The IOMMU IOVA reservation region is required to restrict usage of
>>>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>>>> for specific streams, which could otherwise lead to device crash. This
>>>>> change allows platforms to define separate memory regions for codec
>>>>> carveout and IOVA restrictions.
>>>>> This schema update supports existing DTS having single memory-region,
>>>>> thereby allowing gradual migration of DTS to support two memory region.
>>>>>
>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>>>
>>>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Doesn't this cause the same limitation that the initial patch
>>> by Daniel (all HW contexts can't access 0-600MiB anymore)?
>>
>> Yes, it does, but for cases, like Shikra, which have single streams (with SMRs), there is no additional benefit in going with sub nodes in such case.
> 
> Please note that somewhere, I was under the impression all venus
> impls suffer from that

Or.. is that a difference of "linux uses iommu-map today" vs "doesnt"?

Konrad
