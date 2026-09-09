Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DC549383
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955027; cv=none; b=FlbXGGXFkEb8HS2buS+fRIY+Qrp0DBr5WHS4QpemYuQafqguD9VTYJgC78XdCts7mgOFiRp/OkS9MK3W+vP7D4OgIRLtkq4PyYrYvVb4U0pjI99W9lcaUWNhru/SP6Ar/ua5a0h4ob+ntFq0KFGyZvV4cfMULusaBCtk18DRRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955027; c=relaxed/simple;
	bh=VSoZ+5UrfcsfNQDhSOGZNUTtdpmGDgMxNfBofIM8t2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gppEccKHBx2o7GGdiXDOuhlMuAsP95YFNN8b6HbgRsEqol6TBqJGjQPgblhGdw45DKZXVQCNPBOJI+q3sN4A0Hj0zzvlHHiXz5CqD83Fid4hHjmZMwUsQ1ffkF2Tr0JzHZHfkyFkE/9FvCZRF0magjiqJMsZUC5LeMAUBmB0OA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCK4JwTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPRs/vu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCK4JwTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPRs/vu+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU19E1810021
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC2YYjOteMceeJsi/+bDywip9wdja0orTKrSISO0m+0=; b=oCK4JwTP/UO87gD5
	TbTn5MLHF845ijQc4ATlitLP1SCXZb0l9RwnpZ5sRakcyzRa+DrwN00VkyzIomxM
	iTHFPDeEuDjvxfNLMREKMdqL66G9r1odih1e1jKoYMoP+FQ/roOYBcfO+6M3jbyt
	wIwBEXrlkVnTLAQ0s+Nrf8iT3DK+vjbgmdFY2Q5CH8ncNXpvhVtSiAPCZm3JmO7Q
	ge5YOCRcV1GqXdMLRdEH9ktCRqSFCVSbyGyd/lTO3zvK4yVfHYxKHCuo2u8FxAdP
	VCWb8J2KyMajZ3UCUTxEyHnj2zeteLI/sJOf8mydkpTKUBlzwz2dyOwef0LGJQB0
	DXP9bw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0gmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:57:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390890ae83so73031185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955024; x=1789559824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC2YYjOteMceeJsi/+bDywip9wdja0orTKrSISO0m+0=;
        b=kPRs/vu+XyP4i7aeqV/K5zFG2c+2w3qbVIfc9RgmT92kKWAb96VM0wcUR6wXGfBQyX
         qCDv8TFKgBFZH/75+HdU7geeQv0dPaT0EQ2Qb1mWUl7OuxcRFZ4jZHpcto81m50QBoce
         4YMpuPJ1QWTi7qIjJbs2SnyVeXwxSzr0Bq48/4K3XQTrQQpIQdbLMcz+8MDwtDCehAn8
         TnCNMZS7oH2Qr2VpB+lVoTlGbt/FCifVmEU5hx3ibZ053OEAM4UXko1A0EqBvthTLyoV
         1IbA2lUlYPVRxP/4XuuIRVvXt6DAyBSts+3hfLmlVdoGg8HejzF4dPaKIoRGbPCjUZiK
         y6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955024; x=1789559824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC2YYjOteMceeJsi/+bDywip9wdja0orTKrSISO0m+0=;
        b=K/4Wva6MGWaG2HiXhbPAFyL5/LNdsRCH9AJ8pD0R5UCOxxaZhD1ZznuH2tDV9/h7hR
         SR29ljXleeD2fs2IWdgqVt9Gh6Y1FBFSVBPv/bKq56zgf3CH9rA+pcQrgJNST6Z/wFK9
         ZfK9K4kRHa3ZF9MypWBhYRX0HsqSZvNb/+iGKAyHhTw97KduARy794zEApU64qTJQ2EN
         VwyT2xMPuYICZqmCFuw5bxnttkssQwWWdQpJoaaehG0NQ6JQPFa9NnktQfAZfh/fhNx+
         VXhiMGZkNVbcxp8EuiW02RraahLtCyyO1jPQIKW19BRfZqd4cusMjZh6mCYab6vdev1S
         L21A==
X-Gm-Message-State: AFuF++kG5ccGbLHzgSX5P4Hd8CTQb1joA62l06vzCaWFfFxi5J0NhM0L
	i/m5IGcy1ow6/QdsvllbyWcCaX+6hk1VtUdNx8/JzbMWmrOCCrmk4QLXCB/Smw5FxTASa+NheSa
	lFW0jJxsLhEsP+fWCdGmp8LcuJZnODQ76HrGX6IQNp04a6zsLhBN2VJn/q2Pr/H8ZjbEQ
X-Gm-Gg: AYBFou0yJj+mmVintR5JH9h6kBXoujqJfALJWREjdSNi7LQkdiO7+USKd/KcsoyQwtF
	lfQ2Ry4BfsHNR5gv2wD9kjuIP1w6o07neHvQwQ3h1BsWTyQsag7UNLBtXhyd1KuzVEYr/f4i99J
	CU6BQY9uKzmG0xr9wznoZHxael810uxHR+fwaX0LxhyXEQ8nggp1qTVLDjHdtxx1oS4h+raCur+
	Em6MufdgQ2w2X+mzMz+wcPjqhFmT3XaEukKXXXyhECtIEjZW8F8GPMMdMaClEZwddRsAf/6iVZg
	LLANrBxih37Ii9dl2tT97uqOhDrSvvm1mYmxfJH/YKIQqhZSX4nPc/hPf7+OfMo0dvj/engD7au
	JC0Jt9h+XvgtZd06Cm5auGQ==
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr2302551885a.3.1788955024191;
        Wed, 09 Sep 2026 04:57:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr2302517785a.3.1788955018905;
        Wed, 09 Sep 2026 04:56:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8ba1sm741348766b.22.2026.09.09.04.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:56:58 -0700 (PDT)
Message-ID: <d77b8f39-113c-4ce9-9b0d-dd8812246c0f@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:56:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Yoga Slim 7x Gen11 (Glymur): hard reset after X.509 certs /
 before init
To: "D. Heine" <ds.heine@posteo.de>
Cc: linux-arm-msm@vger.kernel.org
References: <d8d76226-1abb-4b28-a2cf-b47cf83600bd@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8d76226-1abb-4b28-a2cf-b47cf83600bd@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX8vVdzd/VdaYd
 a12QpTdVswzyKnXm9WO99PRf3nMAcjgxUxzUf8qW9P7KecmmlUKlBg/GKNLt5/nMTqtxWyHCv6Y
 xkPWbR3KRtJNbI0mtiHX5NNiCRA+2SQ=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa14990 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IA0wh2spAAAA:8 a=zlL9Ov1VzjkzwrMYKjEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _7uWGOlUHO-npULYuTMESSsBGEjeiR_U
X-Proofpoint-GUID: _7uWGOlUHO-npULYuTMESSsBGEjeiR_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX5xG2nCoHCT3P
 lKAFP50Hv11BFdNe6lP3XZDPavnny+PsB6l6Li7H656vRnjiDVXyAjVYrAZzX/zDXh2dt/hMX2U
 1zl9nseAr54cU/toT99AnLmq0cR5yVdRakzqFyQN0jJoOj/jFiRw8WV5cvliWzUYHYhNMuB/kDS
 0cVcin+7dGbpN/RaQCp8ZGpSTp+lTXnrEgZJfF39dbHQbGJPa+6FbzSZ4jRu5/8tYjWr988JHC1
 INdNRFDMivXy6cpo+JURbFiQsxGOjxetEpqkAlbL2d3oXrQ0rshN1BWGZJ8ctPb2JJzNbIfUCEk
 nPrjMDdYA/toBR0UFHXtzCzMJjSuiFOXBvw2S1mMCPARFhRk58Q6tmYguA4i3VgUNyPl6gOutnX
 jLsY/cA1ItRy0jE9qxYkPlHWZcL1CwYNu+I/glxiOLruTI2aPQoyrxTkD+vORciFUSx0VADpdOV
 ES+++8/qBJZIXc7JgiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 9/9/26 9:55 AM, D. Heine wrote:
> Hi Konrad,
> 
> I'm trying to boot mainline/linux-next (7.3.0-rc1-next-20260901 + your Yoga Slim 7x Gen11 patches) on a Lenovo Yoga Slim 7x Gen11 (Snapdragon X2 Elite / Glymur).
> I used the patches from https://lkml.rescloud.iu.edu/hypermail/linux/kernel/2607.3/16552.html
> 
> The kernel starts, loads the DTB, progresses quite far (PSCI, memory, PCI, USB HID, network stack, X.509 certificates) and then does a hard reset.
> 
> init=/bin/sh never reaches a shell either.
> I already tried:
> 
> clk_ignore_unused pd_ignore_unused efi=noruntime psci.force=1
> extensive initcall_blacklist / modprobe.blacklist (qcom_scm, remoteproc, aoss, rpmh, spmi, etc.)

You probably want root=... rootwait too

The board is not going to boot with these core providers blacklisted,
PCIe/USB will never come up and there will be no storage device

Are you using the arm64 defconfig? You may need to ship some modules
in the initramfs

Konrad
