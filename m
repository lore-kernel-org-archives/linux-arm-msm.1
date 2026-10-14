Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2F47DD50
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966721; cv=none; b=rStSDjgP0LhtfmjNLrimKauSsFD0FSHs9pOvLWyxsirNoM7fMJt7hg5BPrJLUPMzPBPTlUPHwt/AVff+z0XX7VX8DCta9JQr/VvymONVuufzDOmkCy3sX4h8oZyULmopoGNTynlIm/TOWFl9HAbNAIX1epB+UV4YGX5j8ZyfxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966721; c=relaxed/simple;
	bh=rqbuuPDtOC6JuSthwXw+/ObYgmDd/WmCcszlfZvvSCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfIzz9hKxWrg9y89VrzpoyDIHqFAvMXEkmyJyD0Zo1eFUoKypqFhXfLMPkGXRoY1Zk8pjaPgt8SF1Cyy2jEB/Gea9JiCHN70HRNdUHlEEFqZLdLoidn+murEgoaR+aZpHGPKHW6lpfSdXct9qNnM6qSnSB1q+vqr/tjMHGDcGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvthgUr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqY4kOtR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvthgUr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqY4kOtR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5wpiJ3951349
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxEQrqFgEbxmknwdbud4xyAsNsDJ5qIIXexwQAeyz5c=; b=SvthgUr8z59LTWsm
	k14GpiUzDMZuboedWea1LnfX4KQF/pjmiEzK/M1edWaPCA+BeNASHwcSSDXUTXi5
	NPlHrSRLYUakjTlyM+4R4v952V6Ydddja9MuhCMnzignN3dF53IUuxRzZiZQkze3
	lmZjQd9tnNp/abMUB2Qe02nDfaTfWquAFk+Wl/CYSFE2aCbqK/lZ2iL6+S9may4s
	3CXY9rcaW0KD41/xc8qc81O4Da4rre01yb732/sLh+jx8K6uvTjg1/HJVi4yrtED
	q6fN96CvPm3cayrFiZ1ykFA3SX+oe6C41zlgaFzoS6KWtaRVgMw6N9I40/g0FEBY
	Mjl9Aw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p0kr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:31:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso10812286d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966719; x=1792571519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxEQrqFgEbxmknwdbud4xyAsNsDJ5qIIXexwQAeyz5c=;
        b=aqY4kOtRW/8cTzyPGU+gRghW+aCj+9c/TGl+ZVzeWu3Kkgiv3tOAyMOqjHDbWUc00h
         xHnEpHEEYTbuZU/nDYStJyeyeblt111bn9dikxdfFZHD/V7djxwbpmos5wQQZfjpOMgy
         GhTtOEEpVkGWUFriC8koF8oiCK3LjN7IIkKih0dBJzUFdcA8+04LH0SYJoa+2QsSB7ev
         OnTC+FFw4wSa4/1T7HwpoYvbWOFeyoP+lIkI0s287ZOJmULw684sIfWkbvMAf/UofybI
         g/WrdwDFXVAvhQVfGLjT3x3/DZmrk+r4PejzMjQlY+F/ETxqWQuhpiwqjXgnTRNq2K7v
         +0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966719; x=1792571519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxEQrqFgEbxmknwdbud4xyAsNsDJ5qIIXexwQAeyz5c=;
        b=kAbufkVzQqOT2wsiBc2syP+5ZPkmnPZ5/Zea+Ii0sW745SC/OOn1q8d53pRJGoGPB0
         DdQ3wsUBNWvBkpejjTJ1il3p6osfP5jhmRbCmxy1dop+P5pldehf+Yt+IOXusJp5wos+
         a6hENYQ4fIV3MSlj0Oc3q1MmEUtBZ9npknsw+OzWxcd7LnxYFHGRvYpHrBpvNiidigzH
         pWt8OKXen+8Ko21/Mys/ldOWODisC2qy3VOv2e3C/XY4WFqaMndp1OXNyw65cviV8uUg
         V9XQDAd6embMd58YtYjKqzre26BEy6gboZ6Kucc44ImCn7wVvVvD86wNF90MjjuPS66B
         NsiQ==
X-Gm-Message-State: AFq9FYL4JcXfR6xhLMjtRIoFkq5kuNhwktHVugwuG5u/Js1pCyUW97LZ
	mp56OCEaV1gbuMEWtZnmgEYo8jbkVmo0V8t46Nc67zvOqvIteUeLTvTsl246f5uLyM/hz6DUBqq
	Hxnu5nG7UMOFtno4PBwNuO8WxbPXqng3FLmk8hCXrZM4ShF7hHNUh6oj8TocK1RAzH6OF
X-Gm-Gg: AYBFou2TqGC9GU4c154jOI/sb0kAtVDq9Bu4KlxO7jzZJm97Vja3qjab8wHCrfJoGYO
	1QJ4fHmUlf3KKkhcWj/o1xszbzYKzIb2nQoj5Db7wx0u+orxhVhJbmecDjhkrTBTFAHJb3I7tgx
	zJwWtECEMBMrFmzFh4eLR2nr0zUHjGdCmFKt/xg1shqSd4udCjjLRYyOHmvRfTIgiPy9F9SRMx7
	v2mWqtRkiBT10ZC5qSgTeMQQf1DUpfoZN911Ox0fszru14rbzkwqrmOBXqEp2Dqaad8/z4pRZtq
	DGFdhuPb+mI5IauSLPG2LYDTbC1c9DTxNJdu0acQmvchPlJXo+84LJQU9IHEdN6XDGq2eTNe9hY
	ENGGd0fYBpsq5mdqUko1AKg==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2789488285a.4.1791966718621;
        Wed, 14 Oct 2026 01:31:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2789485885a.4.1791966718133;
        Wed, 14 Oct 2026 01:31:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm876229a12.6.2026.10.14.01.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:31:57 -0700 (PDT)
Message-ID: <1a8f0ef0-303d-4173-bfc2-ec8dd952f367@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jiegan@qti.qualcomm.com>
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
 <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
 <2a6b9567-e07e-40ae-a214-2a4d6bcb29d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2a6b9567-e07e-40ae-a214-2a4d6bcb29d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX5rX4ojb+RnbZ
 unrhKftLrXDCjnae3zNoYYghktBI8SXzTriCeO7D0PTvp6vmQxxnfm+nHmOt2Z9+RDWgzjk1Lqm
 te+7QMwEJ/KXk7dFwerAoM0hT0B+spc=
X-Proofpoint-ORIG-GUID: BwvwKyjcWQrs8Hqm6Dm2i9ICE63Y0kbP
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf3dff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5AA7zoZjs4rQ5UttiagA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX13/Q7xDv40XS
 sWtGtddCnCo0dI696SiLN4c1LhGAghB6BnEwzDzTw3oh/irOlE5cbooBT0psXD5gInJEQM5nBM6
 1Yjpy+l1y1SCu6O7hvDWtkmmOsOm1KNIrTVbG7UWfYwUq59vQiKQIYSgyeoHpnSbNb8EH891blt
 bOR/GqQv1cm3n7KBTQFaCA441hVsV5f8Ive21rFsODyEnUucBXqmBCylYNqW8gcJV5DUmjiLdfC
 axru8lrg0VfpR3qAUmFeG2hhaaQuYjmZy8NA8HN1RQZkxJ+UE93ddelQNnndj8T5JCfkADqPdaP
 lJOjxCgBA3/Uaa144JDSaNeq3lNLUYhW2fcZZqp21O1WrYS2trGvFz9SnP2GhR0nGfaOsQnGWD1
 DO/uNbXWjERH1i7MsKZXq3/qDt3rvgq5s3k2vQ1hQy4AiDPUZGFHLQRR9+lt16qttkoVnCDkU14
 Wi3fyMGIn1cb4zH7F7g==
X-Proofpoint-GUID: BwvwKyjcWQrs8Hqm6Dm2i9ICE63Y0kbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140033

On 10/14/26 10:19 AM, Jie Gan wrote:
> 
> 
> On 10/13/2026 8:38 PM, Konrad Dybcio wrote:
>> On 9/22/26 5:09 AM, Jie Gan wrote:
>>> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
>>> but do not implement self-hosted system-register trace access on
>>> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
>>> so etm4_init_sysreg_access() correctly reports the access mechanism
>>> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
>>>
>>> The CPU ETMs have a memory-mapped aperture, so switch each node to
>>> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
>>> its MMIO reg range.
>>>
>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> Do we still need qcom,skip-power-up on new SoCs *with* MMIO access?
>>
> 
> Yes, we need qcom,skip-power-up for all ETM device with or w/o MMIO access.
> 
>> GPT has concerns regarding whether we need to add
>> arm,coresight-loses-context-with-cpu>
> 
> This logic to be handled by HYP on Shikra SoC, so I didnt enable it in kernel.

https://lore.kernel.org/linux-arm-msm/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com/

We're going to, in parallel, ship Shikra without the Qualcomm
hypervisor so please keep that in mind. Should the submitters of the
non-Gunyah overlay add these properties there as they respin? Does
that concern all Coresight components?

Konrad
