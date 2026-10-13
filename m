Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DDA47CC89
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887587; cv=none; b=kUogC5W3td6unyyEndmQgr5SqR7Vvh7jyKXuvKAW9lwiXxok1dVqEHih6WQmsHU5fHY96bfLMhZjSkb5XDwPn/LeaLG7K0xc3QJ8CApheQ/37G3F2LgDXvKRLNaALwmTv52wKJWI4tx+us3Lrsv7RsZA6pN4SaF+8hNcSRcVGVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887587; c=relaxed/simple;
	bh=sANSgWpteU9Cf9eidNCj99X0xOWnKiEStezKFXKpais=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1+Ijt/LJTyh6PdrTA8yi6bXUWGJjx9ztwDfaI0CRrcjGVaz1kMt6o+vSU9O/j0Kp6maAPOko0NoW1l6lCPEutJze1XO9UyH4IgGr3EHwMbysMF9r3y0+4AlOzR/EX0XYOHdyl1RgNF64HgBKonBE621m+ipqcBuvZJ1qwLrvk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH6Bw6zG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Prhsg4eB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH6Bw6zG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Prhsg4eB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8E8KO989018
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHFj7PGaObXZDiYXMghJftsWqlHAdyKjro0kH0HK4po=; b=RH6Bw6zGSIdAkjYR
	CWZPSSlwSMc+5ePjOVRDc/qgSO2EgZiyC2kgOAKy+8akEvjWPlTvyvPpu5twOYNX
	rXlrHk3kUWL3px0dRW0UqkLLq4SVQojOGMGOs4cKHjpkt+iPIRfdBYh5VDsls3rr
	R6tzgEopGBoTem9yjUDCJxJO0M5AXSsAuwVk3d58xSqaS0dFiYES/tbZAIyq39ja
	lGiGfD/wljfKWStv7AgKVxAF05z56yd8WSSyZxffozmPaqaw/Jdg3hQe+zsbJTjG
	wQPs9EEN8oGSEwkYell5VM54wucbh25W+tC4f7EVYMbo53tv29s4oITlwIfEKC7X
	5Wy6nQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaeud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:33:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89c8ad8387aso463507b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887585; x=1792492385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHFj7PGaObXZDiYXMghJftsWqlHAdyKjro0kH0HK4po=;
        b=Prhsg4eBA0U67XnGK2CWuGKqjPOTXsT9V4ijeW7fO+GYLfHRqw+tXHyuB36oGwMsnC
         7Y2rRg5ehKN7jKg/xYqubvZVtXLKyGnbSmSKCtDOckfDL5Hz0U88SfuW3Ac8oFaV8T7H
         OeNQPKm4h9kp3UFwmqWMV1/wsaXoaCMZxbDaPbXV1M+oxQnmF5kTl0chekhuwcXjPfp4
         iU0cGaPUo7MjfLhfd8Qmw9IjjsushciiMMx0vAh1mP3vd8TO3q4NscqbTorUL02FndkI
         jYr4mB3HpKaafsxSq27zc7qFy8jwHK07SzKCLE+4f/7Q4wA93rF4lZS3PKIasv4D8VNo
         KGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887585; x=1792492385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHFj7PGaObXZDiYXMghJftsWqlHAdyKjro0kH0HK4po=;
        b=j7YSR+kTHABx7Nafb0VsVWdOVTbNcAZ52OdMs7jW3jJ+r/XwETKeWiZVuN1769s41e
         MKow3YqMjvYd/L5NCUGCe35P5b5LWlkTNXrjmtGzag3JC2H5LfE0hhO8ghxuxEcsF8t0
         W1nc5nn1iP4t/Bk3TnvEfHxhtfRzEtDYc29RVP5GR2Bcx6qVOje96MmIOiZkh2MHmcZf
         U193C3cX9yLZMQSo9KiCLp0C/6V2TSKN6zQ/wARC6tsI+BB0mM+iXvinm9vQIAgrVY6O
         E1noH1qRqp+mZM2XHdRmwUfMhnCPuDA1RR+jpg1tm0O39P5jCpSGzTEwV6wYkABSWEee
         FFJg==
X-Forwarded-Encrypted: i=1; AKwUvBy3JxoEard11jsTMJ7gFJ+hg8azEjZeftF/BdOID7DZuOI6BuvKMOM2NjQSe3ArYngcTV/fLmNygGpy9fuO@vger.kernel.org
X-Gm-Message-State: AFq9FYKFpV+UL+4QdHcMAw9i0lENBoFlTnYFhZKTXiESDec1OvHnlnEL
	VvVHfPHK35eTqTMDflfOj3ZNABwYCKpsDSG9Uzh+zrEndcIe6HcKlezhZ9ElJfEBJkE7RkpBZf6
	foyjE0ddeslT5LoADY7+GYEjJdPdwEh0pxqbI5tl2ngZgzmFR5M0o/eh5Wb+6c5V5Pbn5
X-Gm-Gg: AYBFou3t19D+twCB8vl4U4gG5m/Ave/8NIrepx4AK6qQr2hV3qC9T4AWgJkPmJM7s2m
	3SakFgJ9gvv95Uj7btvT+h/O3NEHBZMLu6EZpz9hA8nXOr0J6zhsBvHzRkKLpFJ2Ii65qPH34Qk
	f2kM9yUecTHmF5tFem04Kmttm/6gwi+DD9aPtNKYR9NFk4REZXy+4w4BPCykHsY7GS3FQohIvHS
	Nt0PzehRNwyHbmnkGMJdEhrzXYOZ3mAiMKR6URGIl4ARPeo9/FdssP/aWzI2yYfPK/Gq8wBClvJ
	nkl9AXpXRVeKpgblCCoX0NVWJHFwE1m3xC48cT/RXn+qKERjLamY6EkwBfoMzFBgk6EtdRSUGVy
	saVaMdKF25nT7MyxYTlR+JxSQzg==
X-Received: by 2002:a05:6a00:2181:b0:89c:e375:1de9 with SMTP id d2e1a72fcca58-89ce3751f88mr965777b3a.4.1791887585087;
        Tue, 13 Oct 2026 03:33:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:2181:b0:89c:e375:1de9 with SMTP id d2e1a72fcca58-89ce3751f88mr965756b3a.4.1791887584596;
        Tue, 13 Oct 2026 03:33:04 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm3040594b3a.61.2026.10.13.03.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:33:04 -0700 (PDT)
Message-ID: <869f6981-38d3-48cc-824e-98b5f662bd01@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:03:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression v3] SM8750: cambistmclkcc + camcc together hard-reset
 the SoC on display blank
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
 <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5aADizdnZ9OB
 GUC0jM7RVIhqWyMuIuOAuxmIqs+/KieY5QLmD1pyJdE73JZtG+xYI1uac3iuX2yr24eU7nNVlPR
 LySmnqqDoNRXltaJXJlTFY53rU0GL5yKs+wQLeeSCB8daxLxTzhmypw8fuHl6Z6/tD+Go9ISU32
 W+idkGWVrE7p6M6gU8mIW80IXdya/prDYr7fmJdby7hNPd1ktW3ZBSwkw3icYV1uVDuWO5vDx6b
 tGn4d+ztrBeIoJdCXOV6mJhPI9Y+YBrx0aretHMDCfHg2y8OxoGzcmXmygdkR3eHsN/1KV3vReB
 WZCMunWMTs0AocnyMUfnXWBfRXppSRBu8jxlGm/y2QAPLBuBVocnjiTmBrzM4VQfvkBtAMEyf2O
 364H7Eoc9RKRTJQZazMYGWZFS+sEaXCSewgJUhIgItDVnOHXQ3xjGENseYlqsQ75NnNJC19ghQr
 9SGNAUCCrGSsBSPY3SQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace08e1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=J2Heq_bScuKQZqPe_Y0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uKivp9j8sfBa42bLSQjawkrGoZmTY0TH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX/ltQ9eQc5+Un
 x8hXn91jZYEonrF/+sX5NYo4zDPaojhuKu3HEEjfJlS8Meieo2SgsUoSBGws8htalluI8macPWg
 QcBWIc7UAl8rQnyGYdO3yH7rbcG6et4=
X-Proofpoint-GUID: uKivp9j8sfBa42bLSQjawkrGoZmTY0TH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041



On 10/13/2026 5:43 AM, Qianhui Xu wrote:
> Hi,
> 
> Two upstream data points that look relevant to question 1 (cambistmclkcc used as
> a bare clock controller with no consumer).  Short, no new bug, just context:
> 
> 1. The Kaanapali camera DT overlay (PATCH v21 14/14) uses cambistmclkcc as a
>    camera MCLK provider:
> 
>      clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> 
>    So upstream does have a consumer for the block.  On our SM8750 board the
>    reset happens when cambistmclkcc and camcc are both probed with no camera
>    consumer attached and the display is blanked.  Is a consumer (or the camcc
>    side being powered) expected to hold the block in a different state, or is a
>    bare, consumer-less controller meant to be safe?
> 
> 2. The v7.4 clock pull contains "sm8750-gcc: Add CX power domain",
>    "gcc-sm8750: Tie the CX power domain to controller" and "dispcc-sm8750: use
>    common probe handling for always-on clocks".  Our failure always ends at a
>    display power transition and the last RPMh write before the reset is a
>    cx/mmcx level vote, so this looks like the same area.  We are rebasing onto
>    that work now and will re-run the pairing case (camcc + cambistmclkcc, real
>    display blank) with the same three-state instrumentation; if the CX domain
>    tie changes the outcome we will report back with the evidence.
> 
> No fix patch from us yet - the four questions in the original mail still stand.
> 

Hi Qianhui,

Could you please share the complete dmesg/console logs and share the
below to analyze further
1. genpd_summary (cat /sys/kernel/debug/pm_genpd/pm_genpd_summary)
2. clk_summary  (cat /sys/kernel/debug/clk/clk_summary)

-- 
Thanks,
Taniya Das

