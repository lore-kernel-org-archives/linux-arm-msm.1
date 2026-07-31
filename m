Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96525A645
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481267; cv=none; b=Y/WH34KjMKqOE9uktfqX5zm0OoAMWP+OjF6yfv3N1bJ+ihQImLDFSTVzsvKcM/UHTbsNZ1qULMqaT65vpP9qJu+xxB5GC+vlOdWBwmfkrTZp38Uq8D55CoVNI1kYF3uFD/cvjyZnM0X1RXHbizAwlhl4CRsb8sxaiCSozN+CY1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481267; c=relaxed/simple;
	bh=QGQ3d9vb4/7C+eY3sa8A2q32dQCfVLx28g1un/axigI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bi/Z6ixjWp8eWt+z64//EdOrjZKy+YDp1EmuY9Lm7+VRYuGVnGuYelVwefPpib73rg+248Vh8Vnd2FNYauHsl58pbaZRTgzbJnojN4RNqolIUCydnLj5z8/CTVg7xxQqL82nevYhjg/NACf76iL9HGeLPCkCHzfk/qUomuIIqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmFVAqPa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdWwXKXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmFVAqPa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdWwXKXM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67Dfn144293
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5sTfjjlq2uI29W8jz7rYrAgM
	zdGCoiuD8xbRIVVJiY4=; b=RmFVAqPaYEFc45eTXV0yyF+BwG2/nnvLDW70uK0H
	s3uI5WLDARH8+CaslQzvoPMPZW9Dv17/5Td9p6BoJrPFQ2PBZzwxuzihKgd4svBe
	WVzArUvH43lhuNKmH8GYsmyaOX0vlq2uUbfd3/UI2k9XopkiC5+uB1j2mqnlgK76
	efPRaa3c59E8BOWWzZfIc10inH3Et5lCwC1TsjIFjaErJ0vQ0PCm5+B9/rhUB8Yw
	IwCsl3ZSOAMQzl8Vfu4FxHfNic/ppNFY+lbq+8mWlzC9M07YBehsmgJCJpeyQsTe
	m9wKLzCz5tTBKipZ8K+NoVkzkGMnWOqClFlcgOFmJehKbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5k0663-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:01:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so58397385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785481264; x=1786086064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5sTfjjlq2uI29W8jz7rYrAgMzdGCoiuD8xbRIVVJiY4=;
        b=jdWwXKXMRxUcJB9yQDO+vCyh//TNsducplykTEmiIksidjHUhJ8cOnYGMzmUKManeW
         cvP/frs41/mIu8rArcUfyOPM/+g0QGN3l4/ZQ7nPHsUWfZLDwsJQ9zVGa6nGQVrZgtrQ
         hL0fbAnsdvYU8Ujc2lseCxx7dtXbnh0LoINKxgFI3R/GPBfn/YvRrBWBW8oGBCeYUuOC
         S5pkXJV0kLM5PrHjHlrBIynXHkMd75FYTJjgQM2CtdHg10sM0uPFT7EugS0I6UwLduRO
         tpHLYdbuQ2nAsMSZJvujGwj5okYOesiNu6eo4QODtzX8Qoej9ypxrlSRLtrcREiChSwR
         nYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481264; x=1786086064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sTfjjlq2uI29W8jz7rYrAgMzdGCoiuD8xbRIVVJiY4=;
        b=XKjc88bkfgftm6Qtuz57DE2WKrN+JKK6G0UxMMuXGm5Q/FXWIQoDbTdtX4pwy/uOmN
         wqisewg00YkrrefJOln0uOFw/l5eEfEo0LL4xRJblNaMlSAftu8IbHPghUK5VZ5CoPSH
         oQ7epcxO55g3qoYBHvxqaYO1jXhgqM7w6jZlIeqOrj7v/8Wable5YPDjai3YqWwip4Qq
         tGGqJRXM5FxMjOLFQZTUv/EVW4Hbq7i76TjQHmVHamwgNoXhB/a+koRhSmZYAwpAPkJu
         /r6d00S+UczvLAGDDWGWaP6PDFKK3HXoifxPLsaGT5jxxBPi26c/LXT6rV0LufAVrFCG
         Dfxg==
X-Forwarded-Encrypted: i=1; AHgh+RosIs0WBHznfPeAnhx8vvuMIXOVmfuYQJQyKSIBQonklO+HX20a+PEXy2F3CWvHCVg+0m+gzksQrMZtHWzD@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSfp2PpWf/Fko36bCKbOgFNKoMfkyT4OrSB1MX8ag7ZNm10cr
	h+0RL9817zILZ/WcZCapFFPvMMV1xp/TMyDC6BHeStCrDM6QwH6b0XRvWCjd9sb7AJFRUOcmrPo
	IkSzaPupsTNphGRdTF2QBUbx9sC1zIZz4MU8ypFBfn0cMb1WXrI2ShPAh55xVH2KL8CIT
X-Gm-Gg: AR+sD11LsSBKKugigzfxImvVB8gMGHBdXSvkTGo8SM53C4Prkz1uCUFfyV4CXFvKatj
	p05JZQObssBPUqvSolijCTORM13ZSnAtHnkYwYHsRwD0PaOjQ9ghAwiUqSmDI87DM63PKtIDJrn
	kkDMwHjsJuvRf2TGovFlLkdmgiBygX/0QWxPDpRviYA8Y75HQ1jbyOe/+rKcB3aNI2p429RmTFz
	3HUJag0iRC8iKImwL6OTr9t8EaBjRh6h/Pz5eXFfh/CiAjtIBDYAn+VBuxHEmUJsbZRIEbiw07c
	BTurXZ1/P0CSoIt+yNBqPJr4FyOMSNQGU5RatfPjp/71lomh9VPzYvLXpc5ZlbAUd3T4g4S6qtq
	IA1hrrcnYJenkf1s=
X-Received: by 2002:a05:620a:4041:b0:930:f306:8275 with SMTP id af79cd13be357-93496592600mr94120685a.9.1785481263629;
        Fri, 31 Jul 2026 00:01:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:930:f306:8275 with SMTP id af79cd13be357-93496592600mr94110985a.9.1785481263033;
        Fri, 31 Jul 2026 00:01:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bf7csm1478311f8f.32.2026.07.31.00.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:01:01 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:00:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ
 delivered on attach
Message-ID: <2ceqbonzhaqyfybvxemps7pw2tkkgvn4fye4lsbqz3grxx52tp@pe463ssnnbtr>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=L7stheT8 c=1 sm=1 tr=0 ts=6a6c4831 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xjtSybpkJE0pIeR9kFIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: C04j14h6fSqEZsrqxJNChxwEoAtmsiBT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfX2SH8XKiuP3ui
 3FI5hac/muXECpu5M1JjVXg76pPHUDbWtcOr+LIwBl5aejGqlutp0bh36v+ugc7OlwYg9yksKur
 nXpm2cbxayVz/c98Mzzu+a4FIZdKx98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfXz8VHdcE9gCcG
 IUqzz0QHE147EmeGc/94NQxYSJYDqZu/BRP88zOsTARUYZNPQ9FuWkv/SRIm4tVuALf5ArSWAu9
 zvLSD7/88Xds2Kz0uxs6sAMMs7GGRi8IoDS7CkbI15M6vSumnMCLULUiauInhDvQNDLA9HMOyVD
 juHSoja1sxSxXyzUrMKj1NeG4teXw8RJP0XBlQNjzXmJp7inhhxs+Nc905E3sC3o4oOcBI8S5BB
 Ck3dEw6Q9FidKzNp8nc8mXA/wXdVALahCMteFyS8jIQyrjqAm+VmtsBIVDJB00Up3+G2PusJpXA
 RWeawR68qkpXGABOBs7mXnoFD4JRtSEio2xdsfJ0NP4QGDdYl3SU/gvOC6OC2OS/73okzmipGJR
 rIEjj5MQEjUBUs4LBLeftWAY33Z0UVZt9VQXEWvpVZgC6saEuZEmqnYZToeuj9vCj9WTNXIOEyH
 lXp4YUMfQQmbfOYsR2g==
X-Proofpoint-ORIG-GUID: C04j14h6fSqEZsrqxJNChxwEoAtmsiBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310047

On 26-07-31 10:56:54, Shawn Guo wrote:
> Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> dropped the check that ignored a handover interrupt after handover
> had already been issued, relying instead on disabling the IRQ after
> its first delivery to make it one-shot.
> 
> That is not sufficient for qcom_pas_attach(): when attaching to a
> remote processor that was already booted by the bootloader, handover
> has already happened out-of-band, before this driver ever probed.
> qcom_pas_attach() sets handover_issued = true and unmasks the
> handover IRQ to keep the enable/disable tracking consistent, but the
> transition that signals handover is latched at the interrupt
> controller while masked, so unmasking still delivers that one IRQ.
> 
> Since this driver instance never ran qcom_pas_start() for that boot,
> it never took the proxy power-domain/clock/regulator votes that
> q6v5->handover() releases. Running the handover callback for this
> stale, already-accounted-for signal disables those votes without a
> matching enable, producing:
> 
>   genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
>   genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> 
> Restore the early-return when handover_issued is already set, so a
> stale IRQ delivered on attach is dropped after being disabled instead
> of re-running the handover callback.
> 
> Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
