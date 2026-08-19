Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5DB53E0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150435; cv=none; b=fcYzfwrYQQOPRMKmbL/uC6cLN9fpODPubKD1gCK4yjE0+u0VPyojephNKHhk1ZyZteY0CObkryGWdIazcjYEQ/HOgykj8znlaZGPj8EH5sZUjBazrg5dO/sSrfEbbKSt2U3Goypgjutw3ElqwG/48TF00Iqhqw57AY6h6s42wOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150435; c=relaxed/simple;
	bh=0ycwrCeAk0rnsJPxku5p0isabvTMmEX9tdO40P0aPrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udH+WsiELyddLWKhT7ZnL2LAIB93Q7ofh02XW48SoONqgl+Zukhq99GlsXRho9XMIGi45YQRjjsPe/Ne8g9l2BRPnYnaH0hO/dMzj4qgoJrHt7VamykVLlxSY+EboZzE16Py9FrocdR2CAWtOOSNUdripF3qoeF7yAG0THZhz7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7ymNLZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoIJ4teD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7ymNLZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoIJ4teD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbZB8158010
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkxApuLR3nH6kHIS/ueeOQIr419fLolFuozcNnUKvXQ=; b=S7ymNLZYY1/ADDbu
	DH1VqoRhEtAuiPXPnGap1L8y7UZ4hNSCxy0yrjSdt0lfRH6bp1r0J1iNK3jti8ta
	uybb6fahSH40TJPtEdI8es8KsaQ5LDJxvckfbdKJPgQ5uYpO2mzLCP3Wjd1FW/9X
	PjulT2/FLQNAmu04Qw5HG6GWZY2h4+z4QqFFwXXY1T3nMtOKrpQBAUEFToMQcCFr
	uaFItHQPYCL2LWwRAORDp0zVhtNvoige3dFKwpfYN4SqGHQDI93vg0TmLHkc/dtc
	PTdS2SHBqkGzhTbxuUJBwa3mI3K35BiuLyUt1D0w/9dNa/aU97TleiLidS6sDuGT
	PNkNeQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffknvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:40:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so2485526d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150432; x=1787755232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkxApuLR3nH6kHIS/ueeOQIr419fLolFuozcNnUKvXQ=;
        b=RoIJ4teDlSH6ZfnCjEahtlQZWFtK83jbxFSkI9JOCBN7cTcntIR032fhoTZ7BZ8cFU
         EWuHEy52UULARSi3piNzICpvoWFMWgoAcg44leKMAEnMCnbUxHHkWw4HQ2Mlp07ATi8N
         YkWqJBukiY/q8J+IZVFD1Xgphrdmh37qN5Fi6hvjmnv8zSctEEeYgjEziE3SgH0h2mFw
         yM168c0c+yQndy+yKxj/KZr477TcRAKutbluSeB6fpHyZ9lr05SXoVJChTjEags0vlio
         B/80mg0arfGqntMbnJ10q7nZGXI0f+2fVZ0dP3u17GCbaHO2Z5+0gAD291nGiDJpYoXv
         xV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150432; x=1787755232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkxApuLR3nH6kHIS/ueeOQIr419fLolFuozcNnUKvXQ=;
        b=q1AgeiE54i4L7bbR/sxecUDX+hDYr4D5S8kg/gG1vQRGcoiffGLVr4PbBJoMV58rd7
         gww6OoiTIANukTC7V/kOOyvS789zcCjG0SpkyY2cuN+l5IwgDu7Hn/iCv340uRJzrEMv
         inpMDb39unGdz+UBOx3+vuqOSV3POh2KaTvZdNkY/X0a5WRBy+LddcLNjK/QIfc3/HvM
         JcS+Ed4W5vVyzLEpkkFmeS/Y4TcHWHNFF1q69EYCM/tgDGZ+cIZr0X9DpFG8F7Uz3/xv
         JhY1ehLbpxUuoCxKfH9tdRGYMVNFAl8pmEdc5xd+f/LOp8ByDjkWW8Yiqew5L50fk2Pr
         /qQw==
X-Forwarded-Encrypted: i=1; AHgh+RpVUdMiY4bxzU+sZcPei9FEfzNkwBnClQxi7iXHLBNqqqlLTfAXW0dUaVigIM8JyLreoWnkyldpL68Ax7f7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3xzvWuVCJZtq29EkOE00g75NV3w4G6Oqzsrs1wd2FYxP46NM
	3xKc1Z1L4Mm9rpG51cTVeRnPkuhJIcb6itlStUR0AQ/EqlGQeKV8XiO03i8YXJvmBz9pWihW/i/
	Wd1YViaTR7saiB1Z5gPniez8wv9TMe+kZfHf0F1gfkaIbeKWebeYQaxJnU3kqG5h8oNZm
X-Gm-Gg: AR+sD10dsihZ56qy//KO1+eGTBL25DOG9bBGFtSYj9KTP16+ylBAKXaPwQHOXBietlC
	CWimdDZMR+iataxUHChr7vqQ18ebjZhPNsXOAFnMvDBaJNrM1nxmf8HD8uP3pWnp5z0D+XtKA8I
	iRLHws2ibhaegP7HBFlhO2w+njpDhQyiRbLDFA3//NCtIZgR4hz63rNUtUx8vQzKI+Hh3MZo214
	J1aOpwT6+SJwgbKuwYXfSO+Q0D19sWbDX1Xcb/9W6H1SLAZNZAAqxQR2bczZhQQiAiBLpJHlWsT
	EKM9Ir9MI2ogsxXHpxMIdZ6lut1nC/eDjf+fm6AaLyE7h+jPVCRYFShJKdz3K0rPdPON9aG/SRr
	wHFMELpeFRpRfEky8Aw6qNSz4
X-Received: by 2002:a05:622a:2cd:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52dd4dcf390mr38628201cf.0.1787150431698;
        Wed, 19 Aug 2026 07:40:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52dd4dcf390mr38627581cf.0.1787150431215;
        Wed, 19 Aug 2026 07:40:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38b029sm86575866b.47.2026.08.19.07.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:40:30 -0700 (PDT)
Message-ID: <bfb68688-aad7-4eb2-8981-4a4d1f116ce1@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:40:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: rob.clark@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org>
 <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
 <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX2pZn/SypFU5O
 9oRiGYnoUaTUEDbOvAjdUY2wUP+50ylMAR3sLF/6MPgVx6lYXtZxQ6uSoy3olkwHaT3ZdsdgLYM
 iA2fgoVMiT7pUmzqtDXsce2pQH2TvX4=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85c060 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DxY1U69r6NhVaGGOtf0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: pgggWo8C1KE16ln7ugaOPXPgB4qyMkmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX/ZEqjqTyooIs
 I9QWss3gyPcZCQZADAljm/olXHnfHR5HvD3P9WU/0rTlzbsW/t6Z5uqjDJGaok64BW6LLFm1WBr
 uex0DkNZvD5Dheu/Np84Lb0g+/e6rQ0zcMBq8PNyCql8+NyQvW4KKIlDqMJKvP4j5rm+WufpGee
 Wkn6mU99fBtMEODQICm8wTjxYq3o+QNkMwp5A85GkNs9MnXJvBL02p4A+VioBFWuK54KRAgdWFc
 fEk3TuOkzsq3xTBmf9+HS+eKyRv2Mmjy/1+mHz+t1hgOWjLAPLgDk3/8KFXy7reIfgMeA76ciX9
 yMPO+sQre1maYbt2FUsQQLbx922UYPFBTwqJe0UyjmEExsYn4pPqnLaoW3Yz/o3v2nhAGDPOrt8
 98mxOf098oQyQ4knCV2ujr6Yfuxl5WBCnqiqz9/isetI2y6CeE4c6PgH5MlCjKlC7dGmzpm7j42
 CUK3oR0Ua1pjcZd8lIw==
X-Proofpoint-GUID: pgggWo8C1KE16ln7ugaOPXPgB4qyMkmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On 8/19/26 4:38 PM, Rob Clark wrote:
> On Wed, Aug 19, 2026 at 7:21 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 19/08/2026 15:26, Ekansh Gupta wrote:
>>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
>>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
>>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>>>>> standardized interface for offloading computational tasks to DSPs found
>>>>> on Qualcomm SoCs, supporting all DSP domains.
>>>>>
>>>>> The QDA driver implements the FastRPC protocol over the DRM accel
>>>>> subsystem. It uses the same device-tree node structure as the existing
>>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>>>>> to device-tree nodes while coexisting with the fastrpc driver is an open
>>>>> item described below.
>>>>
>>>> No. Grow/replace/improve existing driver instead of coming with a duplicate.
>>>>
>>>> That's a standard upstream requirement, basically given on every
>>>> upstreaming guide.
>>>>
>>>> Please watch old talk from Greg - "I Don’t Want Your Code!".
>>> Posted discussion threads here[1]. Would seek comments from Dmitry,
>>> Srini as well.
>>>
>>> [1]
>>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qualcomm.com/
>>
>> The rest of the comments is still valid even if you did not acknowledge
>> them.
>>
>> Anyway, regarding above - again, watch the talk from Greg.
>>
>> You have ONE driver. Not two.
> 
> Long term, moving to the common driver framework (which did not exist
> when fastrpc was first created) seems like a good thing.  But does
> that not allow for some transition period?  How can we get from here
> to there without otherwise breaking userspace?  Is there some other
> precedent elsewhere in other driver subsystems?
> 
> I suppose drm exposing legacy fbdev on top of drm drivers is _sort of_
> a precedent if you squint a bit?  I'm not really familiar enough to
> say if that would be reasonable/possible in this case.

Also, venus/iris, mdp5/dpu1

Konrad
