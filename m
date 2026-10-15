Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45E5208AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068436; cv=none; b=ZxqdU5SWG4sVim0Yx9puMxuZMYPYxZnrmzN2L5+okwsJxE1yTIMf48o2T1Gb7emW6zEK9Yu4irEfkD47rOQWOzvSWA0FO7TFHBIgjbyogR9JuHrz23x/n1rorFtVWZ8h9IoCjm+E2t5X/OImAB/2PCQYCshHCsNJMsnwZ1qoCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068436; c=relaxed/simple;
	bh=NvtJIWZ0/wm4S5ZIwddjTQHskoaL8sTa1pMVe2+X+Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ftk3yYcGpj58B/i6iMi1+foyltd5a8XJqi3H35BJRoM77qCIriGeJLvx6deqIJK5d3XBAQdiXACtZZCBKbG1GX9zq643BUQVBOEfkAPObszj/mWowEysm99bzisFpBxBeNYf2c3Sfy9jMb4zXwZkKp+JBR8tRK4wmTmBiUcj0ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOCppP58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDDZ/thV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOCppP58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDDZ/thV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWrM2416991
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HpfO9Gqu9uFueM3NL3ptgyrxDHq1TmvbTG15ptsawcI=; b=DOCppP58g9XesA42
	IzTA/UW5or2UmvB9V4Pr89taVGK8r8vfLoATAnO983XeXGrD/ffWQHZ+XnZYtCCC
	zZhuxOs6AouPCZTKqywEr+t3LsB1cRQITcKYU2Haqq9ljE9hAwb9gevOsOoER43E
	Ehun5k3qu99pCMXurt6wTdLjGVWrbF2WitXGEuR0BAbGtBlCYuLZ9etz/uFjQo8a
	f2fMx1FJ3C2hUyhiCfi9lILVoGWAlz6BfDcP6VssNrZ7A7XtdZIvqrhYjJ4wUccP
	2ElQ+h0/WnshHtdcYh4UAHG3g5TDFByvsl4X0m+fZpUiOkr8eiCOc1gnhmw9Xp87
	6SmC6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhj47h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso1719972a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068433; x=1792673233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpfO9Gqu9uFueM3NL3ptgyrxDHq1TmvbTG15ptsawcI=;
        b=cDDZ/thV1JTFEJv8kz5yRcPB+VvKKvJGv8wfJgNPUkqEl1aMusC6IQsa6z63Wd56pu
         PXl54OP20wm6fo9mmlX2hPnz8lMWXNFjbtxypuxIhdwZ2vBCqfpDVgRnEK5h27NQan67
         UjLfg9m4jl4GEmSXNc8Y/eIPs5s1WoNUkllYYzGRMZXqoKH5j5IilEu3bm6ChwukiCpO
         XbPo/3xTmLDPAlJVXhhULA+/9vWVYlQ9wo4eyXrksQapUcTXSQR2HhnoeA2a8sykP1wE
         o7X8qiBm0soOT6VGxpo15y7mYgvskCrTRq7r6unf3GkUGu601TqzYd1f15WuCRS7ffym
         e+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068433; x=1792673233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpfO9Gqu9uFueM3NL3ptgyrxDHq1TmvbTG15ptsawcI=;
        b=iRT7Lvkrl9UIwD/YvM2KgM+2jjk1CPxZAfio/Pdr4sF0+xM8ii9jrtM1gmF3pO33bK
         B2e9TGPtW7vXkefZxUlV2ulPVaiVMhzxfHIlt29+RyZulzrPHqSIedVCXdqhHHOSJuGQ
         zh+od0R4iINp30v7E4FnOc3qPY21YhkyUCwsQLlD1s9LNhblFa1EPZcJ9a89bZu6r5Kc
         grxGyhlUCpP8IXah6glLJ3Z3jzoQvdY6MMqA0GQHvcENLXccBqeCMzaiynOU9Fgg6o8W
         i7qiOwf8VpdOD+BeFBfTCrbugAlAMr3ncg4MMCvCIh9NL0/oZQ2mJTCpNOA86aSjcBNk
         xJ6g==
X-Forwarded-Encrypted: i=1; AKwUvByoKnaXanir6aMoOWGaJU/1W/VU2qiN69B+LCs5JaIxgf1ylEqRu1PXFA6ar44IVvTqDk+kbB5fudH4ORXA@vger.kernel.org
X-Gm-Message-State: AFq9FYK6h9V8ajLdrXnzm2URynjIfYvDmyHfoMWpz9QzPMnTbOA5whys
	Od8a67tnv8rEeg/o24j742A09xBYdl36Q/qwOcW7QuEFpzpdM0NGlvGHFfIbxF/0Q4pfgpDtjDe
	ZuOc9RqzARo+e1L98doKUk5sTJppwpWzUUl8husIOg3JBoPdLfnRsKoW1qY5y6Jfkw0C2
X-Gm-Gg: AYBFou1uCcthc1adMomSRxLhm2uJ/QXrA1swEl8n0erRynHbIQ+nkLeYuwQAdP0x0ni
	o0v1NKA468Rh0DUIH7AgIbVNz2ryrn7Pp2xRbcxeu4ZNJVqv6X6d/0fO2ZZfeVCIGz8g0B8A3n4
	fMa8FCRLnofOntvI/awY+orzgDwdj21QAdOaSG+UD0xezmFQK55gsxwl+gWKB5aej7Gk7Jwzfh+
	7ACy0SmxWnvxLn9tPvmVnz/YM3jgrmaDjsat2DwCeZu74FhUj9IarGGjKsqJN5mhyrkUupO3Wfe
	hDViEk/qQc5qXu+2Wd2z4cZFVYaaYY7yIqWC5J1OeVsB013Oe1eYiuvz+nuYsJ17aHdOMW4ozLS
	yNxJR4yRuEYVv2xb9vRcMXmCFaof4/FH2UJP502X1jTcmOTLefi/7Euxnrf4OXhKqzWsme3BVNK
	xDsHRG7fjdds1Zas48jRzOqNO/TA==
X-Received: by 2002:a17:903:903:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2e842aaca0emr153740275ad.10.1792068432730;
        Thu, 15 Oct 2026 05:47:12 -0700 (PDT)
X-Received: by 2002:a17:903:903:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2e842aaca0emr153739435ad.10.1792068430276;
        Thu, 15 Oct 2026 05:47:10 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm81962855ad.60.2026.10.15.05.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:47:09 -0700 (PDT)
Message-ID: <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX/WgCyPBmZtl8
 FFxjJOtUfW7WuGgeU3oBhLzCrLqIs3x1VoitSfgGB2zrX9mh8CEmkAEoyHBy8m/WuC6m2Y2Yr7j
 uoYaCuwc3eIuGA3JqdXzazIPdEwevJ53jmxToLRNI6DUxuxc+UGbfwwyDpToI/7sGSdM3543BmI
 nmljVigtqXhUjJAU1VO4FfcIoZnUMvJrJKgI5i16FZC1EiyatFR+zTOOxO6Y4FpHF4l6nYV+iqy
 xSwDjrRQqD1GBXqzNR9dJZWCagTQTgcSYdzu/Q+QQDkcLslVVI8Vbeh22Cc3zGX+cSO/LnzmqME
 Cc65q4Wh9u6+OXiwOeSnkuzki2BvJs9Px3clh1+OlID9jQQZWuXaoJSAzELWIkzbHM+L5HVsU14
 eZMer5rC9SQxMDzfYfroTB9a0QnkJlhmUq7MydiCnJAPfT5WLr7AxpEZhlQ273aVE4rLkpzOzxw
 UW+UgqPCneT7n2G10wg==
X-Proofpoint-GUID: lqqMSyPEwg1yZhZ-hdAJf1DkutXkqj8V
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0cb51 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=g9vuQ9wz1Of9mYxFF6EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfXzCYFmRtMhIzY
 tIM4X+g721LGa9q0Qa/s+IPvkOS1Gl9rR0VvDc4yCwM80Wmy4/anHy15KK7hRiAU5he6jbNuVmj
 oijs9JuZzjoaJ8ElmjASM77eemonwEo=
X-Proofpoint-ORIG-GUID: lqqMSyPEwg1yZhZ-hdAJf1DkutXkqj8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150050

Hi Konrad,

On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>
>>
>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>
>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>> Before review, I'd appreciate your input on the naming.
>>
>> Surface Laptop 8th Edition comes in three sizes [1]:
>>
>>    - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
>>    - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
>>    - 15 inch:   Snapdragon X2 Plus / X2 Elite
>>
>> This series adds the 13.8 inch model only. I named it
>> "microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
>> -laptop-8-13in.dts), but that clashes with the real 13 inch model, which is a different board (UFS instead of NVMe) and will need its own DTS.
>>
>> I couldn't find a codename for these, so I can't follow the Laptop 7
>> scheme (romulus13/15). Could you please suggest the naming you'd prefer
>> for the compatible and DTS file name? I'll update it in v2.
> 
> I can't find any. The LLM suggests the 13.8/15 in codename starts
> with "ROT" based on the INFs.
> 

Thanks for checking. The only matches I see are in the MPTF thermal
package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
else mentions ROT.

I also checked all the ACPI tables but didn't find a codename there.
The tables are here:

   https://github.com/aarch64-laptops/build/pull/176

Following the Lenovo gen8 naming, would something like
"microsoft,surface-laptop-gen8-13p8in"
(mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
whatever you and Krzysztof prefer.


Thanks,
Gopikrishna
