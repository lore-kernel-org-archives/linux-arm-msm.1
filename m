Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019877;
	b=46x/8j/30DOmV49WZKE4pklwAxMJIxXOlo0HKrgvaIYIgciHkh1YUUxZhVU3HQYMeu/X
	 t8eEy+pjGTTnnAju5jI0fxhWuqn4Tw+yTzzZ1M55fVx/I+JL0DZo+5QA0GeRmW2PxE7ZA
	 PeZgRZFAW58Rga7X58KanLYM/R4NApEFeRvxR3polhIJDPKBafHLtW/yuMMWsSkpBONCJ
	 w1gXJ/BMg4nizbJ9TH1O7Bg8d5GLsT3cLMBji0EW1OkenSzEChvDZs2Jj9Lyi89PMoyYI
	 Ax04tga9QNMW8Aib78hMTMdT27cqg1IJiqskd6en9QnwMa3yE8DIezz96XuB4UR3NAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=;
	b=YYk/kdjQfrbJjW9L1tmBozXdabWvxhVL44skh3JBe1VIGV6QjhPh95EdyaGYmlNSe/rX
	 NpAoXkema8pSRfE92FsJDPxGpUIQfd/nn7t3TvkduNz2+nN/91F5BJJTz/S+2K/CTB8uV
	 RkhICKXYB9wsptVODLr5oOmLYYiwMLxLc/bnlLbHLaj7Yg8YB844xVNgBgRhkUeSYxoUV
	 NkalXu1gwB4M+5Q1rhLF/z/8kXbbtyy63vorWUmJPJ4IAx1vDs55rnMTxkqqIbcf42aIP
	 nIIaqQI3UPFyydTgdnUzLotsS+rKxQQXn86Zg/gmJP7GbXoA/DsQaiYpdLU60hEeYzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j31RrgOU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuuhXFc3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79466606A324
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79466606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j31RrgOU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GuuhXFc3
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1Pb4131942
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=; b=j31RrgOUjSSFrksc
	5i8WpzadNLO8nMuKnl2WgsWEDTUo3UiQOkBhCzdti/BOGnv+BqueC/PgNzwwUTkJ
	tzO45m3+VwpacDfcZF7NXR+u9CHPWrs7HBuJ6Hgl+gnMuUzGAWXk4EaGc5nUc1Wx
	gEwJcs6OsLiJoxf/ed7qt9SU7biesZzKZwUKC9FBL3Lolw9NnGvCYo+kkc/B78S2
	jX3p95HuOAg6/mj10NEszE/mpxSYLogzROT8/H/XA7WenyTX8GFkmPLe42ywhltT
	o07vrcOFpd7R3shXTd3FLQ6wKSKCrV9nIaSbvrchAy6ZaLorLYmrxw82Z6WmqcQp
	ulSR3w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0ht6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:04:35 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-49e5451d6a5so3636593fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019875; x=1793624675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=;
        b=GuuhXFc3uLvTohNHTjuZAVHj7qyi0jJ6E3pe2dH7RICT5Ie6d6rvNeRQWzS7yEwk89
         W/s32kctPsVoGBuDd68ZP+aE6YQqM0Dy87e4JOradgKYLsbfPCahJ1KbHPFZO+pA7Glh
         2Q4XbA+TW1W6AKpVDGbIQpLSkV4+AiEysDvqkEXtoU5WoYHIpPWm4nVvvdEhO+9+Ps7O
         VIDDPNXusfwLJ/7LJtAv7gn/8GLvIxuznPoWPE9v8uUUhbNF1brAwnlQ/FGNdiUQj3Ca
         9R7m/VrZUFqm5v/OmsFta2CI4AqihWaOlVBrAwv1mJwyyhIUELxAiSgXKoiCYmX3gezs
         uZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019875; x=1793624675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLD/r6Gz4+An61s5hBdFiidrjOGPaqrooCSaDwERtz4=;
        b=dkuSr3Y8u0dT7uY/HaAPJPBa+Om5d2So5evt536ZEsk45JLscpKzoczysa1SYbxrF8
         kSZpOCEmPqfbC8THWmjZV5dVwcwirImzXrGzIdBQ4mSioF2MHpMyt04ZZjOIJ+NEYd8K
         Wk7AwDPMH9EdEDXTtclC2taLTRz6L7YatDu8iFAAD4fnp+zofxtnQygiu0jkvmGXgCTJ
         W7zxNl/aYbj+6DDDP8VOsM+2FI/1VOgwL+Yt9lTMIFf6uS95r4NL6aYKUEC4UhwQMXL/
         kn+4iJxye4xl1JoidLIsrWc6HNRP/9WgFmNWJgh+kPqxOK5RVNsPtD0Ac+7jb7cxKmJK
         yshg==
X-Forwarded-Encrypted: i=1; AKwUvByuO4bh09rUcytoS4SX0StN4zaExSYGastQEGziQdqU4F9xeh3tLtkdUd3igtPIfru0bFgWLmkhikzYBh9v@vger.kernel.org
X-Gm-Message-State: AFq9FYJKgoB3lF+f1Eo/3eItb+q5jtGbi3G9T+GQ+5UExuC52Gfsy4mc
	EaLdhrKjjrfya0TyAVxvOqhYWSYl7wJ6vHg4DXOMcm0bfXZ9GUdVO4uA7kdhsaUEOMm4arVwlIl
	xWSsCMYiY4gjptQF9Fhlp7KRr6/BpPMUjWOH69RS7n4tVs2p/HRLA9QTu3bKE1/pdgyxf
X-Gm-Gg: AYBFou1LXZUc0AUbwqP9rOxptmvT/xMb1jRNOi6G2EixNr3kUPBj11Efhke60t6Z/GK
	mqEGjK6MoRb4Yw+nj0p8OoA5b8+745brvhL6M6C7QBsfIhkm46Fo9WOHmaVwVmWvb6+jrCUeXtO
	wsikI9PIALDZJOJkmVpmDBcl3Bt9sigMnse0JVKZ2Gfxme3Qjlih4FIZLvzMZ2DFq/IN37BHKBP
	5TQ5+FhmQUQ4XZ2BFavdL50PmhCjmALExVoO3WtV9tethV57M/nJwPLy+F6wwjEJ8tvMmeGQZrd
	NEe9z9sBZCJMuItU06nnJ8w1X3PG1crbHcET5g9XRYCETqLKAtcKGHQO+z/zOOCN5TR4/s2bPG0
	zTOzCio9da4mqqXYpIfzzvA+VHT1E04H2qZnJjTgy2JBpgrxYD5MUyV5zbtnNINKV5gz8c2GQyP
	UXDHNCFtY/Qkh4xsUSgU+1fRQ8jlM=
X-Received: by 2002:a05:6871:2b16:b0:485:d31b:7767 with SMTP id 586e51a60fabf-4a83f5c5dc3mr3995555fac.37.1793019874788;
        Mon, 26 Oct 2026 06:04:34 -0700 (PDT)
X-Received: by 2002:a05:6871:2b16:b0:485:d31b:7767 with SMTP id 586e51a60fabf-4a83f5c5dc3mr3995525fac.37.1793019874362;
        Mon, 26 Oct 2026 06:04:34 -0700 (PDT)
Received: from [10.190.200.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431bf31esm4742983fac.12.2026.10.26.06.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:04:33 -0700 (PDT)
Message-ID: <23c34b9b-2692-4fb6-9a8e-6c11e4787f76@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:34:23 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX7IG+doKD5VC4
 1jEJcmCXOtzCCxjewDKUGvxVykuRZp4N8KkXVHbB2M94er4lolSXfxX0XrJeEjI08JJcJAzsfBe
 m4sZfuVUmIAA8RW5CL4D/6G4uriFKok=
X-Proofpoint-ORIG-GUID: Y_FGkdhsMzqByuu-lejrmyMUexDTRx45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXyJ+lVYf/hrb8
 g8iO0e8Gi2xLYpEZBc1XBquoYmsuoRkB6eLoo3DAxc1xA3P8d/E6aL2P1gyJdzLNomf0DBkZMwD
 +5xXKo9W6/IkDbbDvLUDEatWssw21zzlwoq0WDCoD4yiwxqK+VcEM7oFOdHlw8QclHLv/3QZKhG
 H5qxtY77mmuL2G1dMVzAg/SEd0CLoTRsFRRunxTmCQTvaIcxTBTqrnorRCcGHT8vZBY6Nptxtl9
 4/Afz2Wik8HSrxBfbYpqiyY90nwatxlni8f7ftwUl8vqKo5qGy1KvkPPmoHlw8Oi8GJr3/Nrhsq
 bAUjLr7wQVJliMB/2+Gupkyp7yZ3aHSGc5i6MeJTHtCkqhQbf0ZpqvI455rB/027/saGEKsaru5
 y086Wzdz5wdWgjnqZoKscD1YvSqbGfeOeujWZOV0LD6bCd1wrOyH+PBMr34JYtg/SvYP/Uv83cS
 PzbXFWHYHv5EbY4PfFA==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf4fe3 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Sv1olGuBKYLPw-ZkEP4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: Y_FGkdhsMzqByuu-lejrmyMUexDTRx45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052



On 10/16/2026 2:56 PM, Sibi Sankar wrote:
> 
> 
> On 15/10/2026 19:02, Konrad Dybcio wrote:
>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>> Hi Konrad,
>>>
>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>
>>>>>
>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>
>>>>>> Signed-off-by: Gopikrishna Garmidi 
>>>>>> <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>> ---
>>
>> [...]
>>
>>
>>> Thanks for checking. The only matches I see are in the MPTF thermal
>>> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
>>> else mentions ROT.
>>>
>>> I also checked all the ACPI tables but didn't find a codename there.
>>> The tables are here:
>>>
>>>    https://github.com/aarch64-laptops/build/pull/176
>>>
>>> Following the Lenovo gen8 naming, would something like
>>> "microsoft,surface-laptop-gen8-13p8in"
>>> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
>>> whatever you and Krzysztof prefer.
>> [...]
> 
> With this is mind it might make sense to create a common
> file mahua-microsoft-surface-laptop-8.dtsi that all these
> boards can import from as well.
> 

Agreed, but I’d rather not do it yet. I only have the 13.8-inch unit 
right now, so I can’t determine which nodes are truly shared. Once I get 
access to the other variant, I’ll verify the hardware and move the 
common nodes into mahua-microsoft-surface-laptop-8.dtsi.

Thanks,
Gopikrishna
