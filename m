Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72942B338
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618032; cv=none; b=DmqDG4G1UCRnKOTI5wUMW4Y4SAbWUOs0NzDPQqaaqc92bXhgpXbz/Kw4Q4yrYZFUkliyag+/LyLp7fyRBNTq3e9rbLDtDEW1lYrIq4dvAgEYsABaDEWHKJah0TwvVupk2cyMYNk8jRsZtx1FPnD5c080LNPvlI5naN0YmEN7Veo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618032; c=relaxed/simple;
	bh=8dWOdosvHKLasQAClEDlKcz44n6sFg5XGD5Z2XjO3QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9QoF0sjd6FOzdnGC8FxtzqQXERNkEzxnz/AF6O7J8TYSI38JC6n4xhiuQTTge1cdyineyklmLD4eALOip1uSPe9rdxxkJpiw7ySGPcRwj9DY4WNUR8iFjUiiHEroZPVSCfu91r1xtZ9C6JYGLeH6v1ZaBLiLWTd7J6zHdk32Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0ByNzyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6X13C3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0ByNzyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6X13C3S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6hvhb4150322
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0D3MRA4/yCGupOnzbC9cyTj2BB2vCGBPfFPsgDuTflY=; b=D0ByNzyixyygHLHT
	rm8eJFZrBj33FB3MgAXFJv1HGu1BSiRnZ1nzWRUtiSazI6S4fxWE/+PWyPeV3SUY
	MbwLv2Q9HCD60/ZTvaqZUuT/gfrmwGrwnE7tLLXnFF6VjDXJqEAosFeYTce+/XLc
	MmQ2joiT+d9yioMWoyiW7rOc6H2niq5Ju657YxodS97ltJf98BUn8QO2q/t0gBTU
	2T42Rqu5a2vOty6lQt6S2u5ZW4T9H2IoOKgWj3rGZ7Hhqcy/VKF9rtd1QMBoPF4E
	9FIrJhK8A9cK6OfjU95xEEZhc4BBILiH5HRw/DTl2vby3zmN/pOT/XnOfVf4mwnz
	AuifJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff32ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:13:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so238038435ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784618029; x=1785222829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0D3MRA4/yCGupOnzbC9cyTj2BB2vCGBPfFPsgDuTflY=;
        b=A6X13C3S1JK+EpByKjUTyrs1DOlpet08bT+v7nf0VlfBte6OYyFNoWZ6MYKlvoVaWR
         9H4IQYLKd27YJcYxCGPNpWYNu0G+ODDDgSVRMFvzxxlLe6iKBVl8ohZpfLtm2CgNlsq5
         sy4QX9R1ktk9MSv9M9o8qcL0o78tuIj8yw1zHhlVYuLjEkbCzdZEpFiWe6wSAl1hs4r3
         vzegwPjbfWF4P/aJ9SJK17BgR2jK3DkGPd6y3DvgjgPMZsvWHWzrfdi0w4KfFbp0Ed45
         OwVz4YWWMOryDIc0WRXWVbVoQjg1IP5t7uJUeobQrNP/sGpFrnZsGjb1Aa3OeuJP/WVQ
         mmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618029; x=1785222829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0D3MRA4/yCGupOnzbC9cyTj2BB2vCGBPfFPsgDuTflY=;
        b=JFhlJMb0lcOzS0jGDIUSvpXNDeIEGV+gvFvmpbyuHCsinH4ep5Iszh6s5Uv32i3l5+
         4t96EKzxYdiOz+CLPmmqLBHHtDoHteY7+fb81HM3BpW4Q+0AJLqgC7W+JCjsxj4S9hsb
         vWVhMk7U+RgJZMeuVkz+tXZbHwS5KEMRxuqTRNrgOaJApyottEuvDdyytM2GtjBq6wZ+
         5n627gSIU+WdNl0IYGCqRE5I2fUPM/iBFEcxRmIE6r2kwRs6IaquezRBqHwLkuNCTi9E
         X3Ex44UL0KsvYSgmd1oRrunjhCDmoHozLsOrqxzneiDKS3xeR+aMbi6a2LwcQy4c1azj
         gF2w==
X-Gm-Message-State: AOJu0Yw5Z1ky1IHPLY0Mfi3fc7vr03ZJ+Xpu3A6zW18VqbJ9wTyjOasS
	fAQaNUT7J+NiqJlg0GmD3F9soWzZhFlj0F/GgzZaRz4e8FVxV/iYjkgPjtETYcpO5Zfif0hcBj8
	9PmCzOdhohoz5fvAQ1kRMWjk8ljYT5c5W6EOAnsM38N4k+0DzTznByMiF9iA6LUrMeY65
X-Gm-Gg: AR+sD10urEon6PCBYvfvtSGXiNQmImODCTibmWBsxrg2IdaGp8u9CY3cJ1+R2n+JJ/f
	+GGhodvTK//kyYRnh1jAoj7L67KkKJEDwO4B8EBwmwABDv7cuzp5UTJ+ZK8iGREj4nQN5Vo0qbV
	2s/W3DEVlVe9DKLsUuGLKl5a4bRaFJ1O/QWNCfcbt/npzK9cBzWpU4xwN7rAwLsFbXbfe7mXdd2
	azqqdVTtc+qW+DLLK4CWAm0Ew/LOZUdAFuF0RgPIde5CqsWqulWfiwfmNtD/rOJBIVR7UwuKP9O
	TcgnpwxnJy24iYpftxKdEO9B1/dxpXBgEEB+wI5GpBGlOELkVx+vfeyYGJTyzo4UDDB4BUbukAC
	OOUePCWzeFQUYEC25YDdAF+zgFHEGNJw=
X-Received: by 2002:a17:903:2ec5:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cf349609admr208058465ad.24.1784618029018;
        Tue, 21 Jul 2026 00:13:49 -0700 (PDT)
X-Received: by 2002:a17:903:2ec5:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cf349609admr208058215ad.24.1784618028532;
        Tue, 21 Jul 2026 00:13:48 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346d9bd5sm70713285ad.45.2026.07.21.00.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:13:47 -0700 (PDT)
Message-ID: <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:43:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX5vUnhyf2PYnT
 18Oa1gn2qwjgKDJP0bdCZoeCtWMg+5ON80dZ3hLK3SbVlH74G6YA85Be2suoGtic/xLh/dVMhew
 XSkoG4CdnhNVuKC+e+jW5Pbozsi1b8A=
X-Proofpoint-GUID: BD8PyF0t_qUCPjPViS8o5NL7Qq5RL2b0
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f1c2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d4n2MIuDCtTFDTNuvswA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX+rVr0ytKg9w1
 TJpXpi+Uim/fnYllF6poILmy8/rBhMt1RwL9DfMKSsij0W6EfkDlbdVyPDoHLAp7u9CzVHUZdCd
 09ST0HN2z0LUQoR8cnNEkLdd38X0U/V6cg2hu1qmA844NuOShkGxbzVLRlI2xu03wOxh/fxAJpf
 GSGhgDkxk8QHTuiITu2HdhgtnbhjSdJ/belvuouD5Ox6Q5IPnCl3VXcqB3Bz46dlYwInAgb/c4W
 ymJXqJatsbk7fa6eEkgpGhR40MVan/sGMk8Hobwa+qBMf6NdkDr6vjg0CmS/LApcuws+dWewPyK
 Pj/tYz0i/olNbzdTchLWwY2W7A0zF6VdOULbHzMlXOAFhJmlPlO3OWfQZbQU88KPM0Mccc35ekA
 qrsnGYkbUK0SAGL7+jiR8sdYTKEIwupmJeBgcYKlYOxdHDbcsrH9ES+PePZj9HaQYTuvIG9o5EG
 aOBNd2I87ShfHz/xBoA==
X-Proofpoint-ORIG-GUID: BD8PyF0t_qUCPjPViS8o5NL7Qq5RL2b0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210073

On 07-07-2026 12:41, Kuldeep Singh wrote:
> The series is combination of below 2 series sent in past. Since, both
> need to be picked together, combine them and send as one series.
> - https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
> - https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
> 
> Document and wire the SDHCI to ICE relationship on Qualcomm platforms
> where ICE is modelled as a dedicated DT node.
> 
> This series:
> - adds the qcom,ice phandle to the SDHCI binding and enforces the
>   qcom,ice vs embedded-reg modelling rule,
> - enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
>   node,
> - adds interface clock and power-domain requirements for the ICE node in
>   affected DTS files.

Konrad/Bjorn, could you please review and let me know for any comments.

-- 
Regards
Kuldeep

