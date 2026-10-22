Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660376;
	b=eArXtBGck21LMengG2+00RHg01SRXM2j+IE64fLQYIKYo6/oREwQlajdBB8UueQLJI6z
	 AXqKGgLKObI/n9rgitx0RSX7LT9eNm1ndxW1uDUiiBTkZAz10ooOAegAbmHTqNskuqdFo
	 ch3Dj4F+mcAVzZcCl1soermvPIP2ogdO8FqP54M938FXIjMmD2NfmWWIerTUFHp1uhOmK
	 xRKlzw8TPufCLbmo/KhCnm/IofbFm2yQfVM7hSbf9m+L4iWZJrSkjsensR2ontZ7M/RtR
	 UWD13QLpvAJQc/NNeZFWOwiBlmTA3QcrnhU5hn2YZXsy4GSVB2Q6bWjALv/sPRcfLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3XLkALv1ZtKbBr7DQBaxTTQ6tJpunLMCnXGkx15R/wk=;
	b=vrjArcply5Tyixj/okuSTf8CVrk0wD6n4BWSaWw0U6oOTHIdlshnYb0eH2Q2+AoZ0WE7
	 stUp8gUUTezUXLUU8l+Bkc5Z+D+6BkLVxu4rmVnm8ut3xR5nY6amjZR9onOLuYHXH7ZZx
	 I/AGhOOSsF0bz6bHL6N/fqOyWOPiCO7N3dxtYchAdNVi5BbEL/LwGogOYRMX84Qpy1P7O
	 dS7dkSkOQHywqIDV/yohGavucVX8ZageEN1dyPnXqgmdinbTZ7JPenydelFMaZ5+EXBWi
	 nq8KD/FXn5Fn3E8SIyrf0/2rOvRQqX/ab1CkKajsEOEdtjlvYhtn+u0HMZD+u00Sk7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhT5LgPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ACqmh/84";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563F606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B563F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhT5LgPR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ACqmh/84
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8IfZ23766784
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XLkALv1ZtKbBr7DQBaxTTQ6tJpunLMCnXGkx15R/wk=; b=NhT5LgPRhz3Fh/rM
	6hON3lWW3mfeR38zf6ESTKVrCdX33OKb2pWSqIVSCccu+pjoaW6UjRgJ1YdFtjNx
	Dk57roSh6UBuTyvRrll0CPSx+8KQfN32EKwKRZSUXxAXKIYoDHKweL0YYugb5//L
	L+58VB1hYBZT6T20DL4AUkLnzoKurgxJ/b6+uidobcFAJD4wnVfl3WnIy8PtguB+
	pRnsf0Q35vB6y6yuERGjVbJV0XD1ahBICTjVlD3rAme/qqNSpz4vIsL6b6Tr3XBN
	V/D7E6e1yJL0BpIOnt6sjGeh2n2WctbhXK1SsBNgBdi78/j5SaeDi8iMsCpTf+I2
	o25phw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9jyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:12:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so30464585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660374; x=1793265174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XLkALv1ZtKbBr7DQBaxTTQ6tJpunLMCnXGkx15R/wk=;
        b=ACqmh/84GdIKnQ4TPkhfjaBYo4PbJ+26t0vGxqDzoJ2xhu38UceN9B/1VzvYI+dRld
         DEGY94qirf6dYmm0ObLwOyAqmbUX9AHIkzGtvciQy3yKs90xoVzSyAttxqPCtt2ppG7+
         U6ST50snCDddd9WK3MXFA2VvQVv4MS9DP139Q9o1yFlfOSgwVycfYKp34GXcEbjON5ad
         ZsNilasMAOLV6lACUu029TJ9Yf4OY1Nm5EpGZlyAtHpzBPuVH3WG++CDeNPBs5VL3mNE
         OGFIVBxb8ANcMi8XKKDeywYQOlYusWNtqpKGaesh2nyrGpL33xpWyjrfMs7c+Fcdz4YD
         XtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660374; x=1793265174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XLkALv1ZtKbBr7DQBaxTTQ6tJpunLMCnXGkx15R/wk=;
        b=hLHOnvWMzbeNnKGydHzOhkV0ODy/hDC20OM05GmZ41vUQYkgfqn+MthW04sRaC0Br/
         m5y8ZlI3FErFVSsNoKjx2u6oht1Lg5VzygTR63p7B4b9ypkDFs2AVX+Eh02u5HC+vHYr
         MLL9xDjv/3wNEDSNscmozosAXUHCTSdmEsdszDbp9GiktEhoamcMP+Qsp1YAbervGMDB
         DELBDYI2r0GPvEKNVc3jsBcEQusvTyp1Q+fmCYp3wPb6kF5nCr76mdaM16fYKxqjU5bf
         pMLFoOzWlIRNbRt7SpbqoDr+KTAi3IhyQtscd1NS4qp0uJxvPmJ4BMKobFDmOrFtYNJP
         m4dA==
X-Gm-Message-State: AFq9FYKC9agAgif7mRT50bhxgDfgJ6FUAqDUdVWg5DSuYMJRTjj2Nt/b
	NCSle21opb0zZ2rDhQyPF/n0ssXR6mTgZNjJ/ijEz5IgeVvKHCEYxm8AX5pocjBwzxkBppIfXaU
	GpJ93auHCXnTUDRDr8FKr5duDF7Ehinl2qdDT3R51VOl/KX7NByse7JIcSPMxNp7rGsfi
X-Gm-Gg: AYBFou1rXVR1UreijtlhduzhZhAn753RUCNenPKsidGo6Rb0URy+X395HvRstc3Mddq
	jZS/LkFg7Bf3IgV4+n1i6nzN+YPW+nYh63h3DVVo+POyWKedbgAe2QJeOVKQzpZ7FKLLr0e7uwv
	ebNQZdactUbXzc/PYlB1/IhvAWiB7fpe2PkhaOvstNZVrv75iMOz0xejNTbVcLiZaj97FaWyljh
	Cb4SsN0n2BOHrKp+vLiJhqptpZaQXrfMqeY8NUQuzGLj9sNPXKJTZuJYvEm4NnQz8Ylo/4x6ga7
	OsJZmTaImSThUcYAVTy1K5UpfIoZ8rK/iUGwYhaJkLVVCyGPpcVuqA2QhXsgOX0TpDXNYw70dc0
	v+CmDl/wo561h2ONZMPx9gg==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr985494785a.3.1792660373973;
        Thu, 22 Oct 2026 02:12:53 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr985492885a.3.1792660373554;
        Thu, 22 Oct 2026 02:12:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm82894366b.31.2026.10.22.02.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:12:52 -0700 (PDT)
Message-ID: <87e38bda-7ec2-4b7f-84c9-29a837696572@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:12:50 +0200
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
Subject: Re: Tips on tracing bwmon?
To: "Dr. David Alan Gilbert" <dave@treblig.org>, krzk@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org
References: <atd6TRv4HQApcPvY@gallifrey>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atd6TRv4HQApcPvY@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX/EZd5cnvno0I
 KunyrtWNgvlmVG4UGSM+KuAY+uvKfj8CaNZ5+2qN95aTS68yLbWwBscrqfFAPMus2YNXjHP0Ac4
 ozf+rof9c1YJnU0QX+/kumHRZdNZyRg=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9d396 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6TpOpv-F7cGRVI9TH2cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: s_6sowDIh-iu4feUlPHBzXsdSNphXl2L
X-Proofpoint-ORIG-GUID: s_6sowDIh-iu4feUlPHBzXsdSNphXl2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXwnTzPB0ndSFR
 5L/8/jj2C/JFYlp3gbPsocdCe9ndyKT7oQUTMgp4Ps4gk467m+1bh0Yda8dC6yrVoGwNAiHnqd1
 By1Dr0Gnst06Y5dlef2HmrKoa54iwZbEZ94LIgWvrLoj3RlFaq2xdAxM66xieUa/LAWw/JAuTib
 2lklve+Xx/ZNE8klcKePqfCq1/oCuJWhaDXsLirOX7ptFXrHmLixLPA09w7qTrahNag/gc64k4p
 +RDXI3xx4CeROt5gRCIyxwb7eWnMsrh8Ry/E2tJ/E2aYmLb3S4ENjcRVTHsvjvzj6+OkkamUTFh
 DX7qqd/Eq42TQ0/Cm2KcwfkxB2H13iL8skzFO6zuM0bIObCQ/9gsXjBD6FUbPPmwJZs+633C2b1
 zmAyJ7p7DVqy3Q9yvT//sAGvGyx0mS1VOUITBEcowgu4epXzBiajj6liwB8IAVofwBMUJrti1R5
 ++vgaOgns7Zdn2XVI9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/20/26 4:27 PM, Dr. David Alan Gilbert wrote:
> Hi all,
>   I was looking for some tips on if I can use bwmon to see what interconnect
> bandwidth is going through the dwc3 usb controllers on my x1 based Asus Zenbook A14.
> 
>   I've got usb-ncm gadget wired between a pair of them and I'd
> like to see what stats are available;
> (See details of my gadget stuff setup in
>  https://lore.kernel.org/linux-arm-msm/atJn2jfI_cZy3UMo@gallifrey/T/#u )
> And that's struggling to get much over 4Gbit/s over the network interface.
> 
> One reason I'm curious is because the dwc3-qcom glue sets an average
> and a peak icc limit, and I wanted to know what the difference was and
> what the type of timescales were for how long it allowed a peak.
> 
> Are there any docs I should look at?
> 
> I did:
>    trace-cmd stream -e icc_bwmon:qcom_bwmon_update > log
> on both machines and during the run I'm seeing events on exactly 3 of the
> monitors;
> 24091000.pmu, 240b5400.pmu, 240b6400.pmu
> 
> (In the numbers below I've grepped for that monitor and sed'ed out
> upto the 'measu_kbps=' part so I can then sort on the meas_kbps)
> 
> My reading of the interconnects_summary is these PMUs are
> somewhere under the llcc_mc@interconnect-1, and in some
> cases under both chm_apps@  and qns_llcc

These BWMONs only monitor the CPU-DRAM paths

Konrad
