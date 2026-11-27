Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747992;
	b=Dwfb/ojKg1yPDRGZB7hcOrgkvoqek/kNCXb1N7nrnMd0tQeq42iiw67OU3Y1mcWr5WWT
	 Pb2wiQFrGxqTRTIuwCgA1OPpwpcBUB64vu2nEk98dKPuB6g/OhmaDJ2Vf2+hnGtsRK9Du
	 uohRQ2d1JJroQM/EJefsJcQnsm0G8PqBfPKX4ejLWVav9zj1R9aQGxXwfczeEyht0Vus8
	 FqaXVkXtAwQHpU7icpwSUdofQSvCfr77Q5nBjgFKA4pyR0KovtmHdwdygERB+8jRQU00l
	 VLKLuVtY1NKShGnrmv1FXQv/EK8pJoVery3WrOAGs7Drf2b/jfIah8u6ffVz3DUwADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
	b=nBNqaI+sLOvlV1V+OEfc39sf3S19p01n2EPwUC91bFp7YOYZ5nRjgVJM3pwvipfdADBR
	 rDxfDStj2VgT8exdvFvmFGxuu/oEVhmAWR2x3kZkNo5kdYgPnUov5zgpup5R5p6tG0kzP
	 JuMizEMSFSiANLRf0wp20GfPqcL5o77cXUoRt9wQyOtz7/CiKu+B3mvgb1fQAy95/u19I
	 qsHXq6tKExLA8EOqjJgP9ybkSMqRLDM7vIY+zQcZGoYQ9TpOp6h0Ml96u3ZLXgT8OQN8i
	 4KuHmL5ZWNoekfO377Bbb0+NuYI7sfdcwp5cnQIljvtLybCs0M2+bI7x6OBDQv2NbMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/pTGnW3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhd0EbfN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFC606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/pTGnW3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhd0EbfN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw7LY1011132
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihb54u+kgrrE1U7Av2KFgSmC
	Ki3tz7MkRPHnycgWiQc=; b=G/pTGnW3L7T1p6kJiSc40Jvqrw2jwPX4UjJ9KzJ4
	6nRa5ZdWe/88rqF9vaEtah+LhXsrXJi6A8c/zR+3xo/ZjT741gIdnvb+buaBTL/K
	UyJrPIhY8NjFi0ooab/iFFVVlRqKlnbR0+vgAQFgZMgWGo29lCOk3UF5bQM2Yj73
	PdD+nSZfmxLXTEpTqGUSFmTyeHh5yZ9yuqm55ni7gf0ox+CzKSPYUbr6ZHXWetlM
	7qLuHRSxNp/TjeK/mGiRB0uEpzcHtfkHH2TEnAgKbqG5RCQRv35F89IWzEY3kQR9
	G5dr8YIJZ/g4uv5JUiK26xOm55kk4xQhxjOvD7tfDyyocw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf91erf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b56c696405so11296247c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795747989; x=1796352789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
        b=jhd0EbfN5IufckxD3j8IsuxRwLKc8DwiFYnBFwUvLBzjAIPrEuPPUpNVdpiyxYb/+H
         YCLz2GqSN8wxnheF2xHdSvnM3prhlknlGqITmwXOuNMDDHTlZpTskXaV4NQTSNN1bT01
         yNB/FQc8RjHvbKcdA62HnSx/01/0wu6jvYstqeXX4A6PNHVQ7Ro8Xior2g3861BXBiTo
         iDWAgQZSKbFtOd3LDzzPw+P4BYUMVpPMEYhOl60EEPhXCuybc+YiJC2SD+Ri4dtvKfp3
         F7HQJloDypdfvpT2T5N9Baneajn7SgPsKw0hj/NGDHw9Zao++Xkg6BNuCXG4aYUul7UN
         RV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747989; x=1796352789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
        b=JYvoXeN8NZIOOV6W3xC+DmzFeLamNfXx9rH3ok1J9oSIoxkBM5JbIxKdtLztEg3Tog
         isxXPntE1FaXYmQOxHk/zZKGs+SQNIEzXpbo2uSbD87jfjuTecq6QtvvfF4HkvsFh9VJ
         rNSwPnfVOx9knsgbanGrg4lCPi5A4t1+qpuTkXbXtVWoYmhzgT9wQEwM0o7aZbY8+1xA
         ITcMkO4NHOAObQxrvuSHlt2gDTtWEB4GX+hU3qkFg0H+t7v07u4CccmCeS26X7T0hIMa
         XwagTfLr6e9Arrm/cvwNkU/KBVP86pdINFOWQi097E0i+oafFBNvpdfP/Np/4QNfWL1Z
         pMyw==
X-Forwarded-Encrypted: i=1; AL+hErG5psw6TKl16iMOIjyyMVWNnL7qjTtv6U+D0vW9N/AhqRjiv8wTwdscqab001FrNP6WmrETdJCLre+Wd8Zf@vger.kernel.org
X-Gm-Message-State: APuU4Z/li8dw9o00Wc5u86v4TrZlY8GhJKHicbrQOpTam1582VVGNgG6
	nbLxAXFr2pDuICV72NipDfdndnx8Y+BVYfaPWnNA3uqIwajhzj8aZX51Qwso5KGxlDERK6byWY+
	kgflvxkmFEc0uk1N8u2az4EZiDG9W80Kbd1W2Soj66N79Q4cjS1uzIn8utf4/5W6m829t
X-Gm-Gg: AZFdTZfbI1YTawg4ciEc/adTqjAWggLoY20WRJFjvYiuwNfmmGSabrcoiUPgpLHUHFa
	jAnZxVhKFr9vd6BALcq9TyeCj5FF20evysa7XS09rJ+OvutNdSt6kxAwhdoahFv0nIGDDykVDB0
	yamiP2T4EzoO5oeOPq2sjxt6llBph5qDFYWvAtb0/t/PSxzmHBjayalRSKZprWVY+5jwULZWBib
	pLLSWddEqo5oVqvei7AYAarAya3tWTss4XFHhPWFQsQDfVcCIrzW/Syq5MhGrLUP91phYK9qUUK
	0Td+/KTbR0HOcOzYDOWcidjLvmOxpUccR0qjjsslj2oPWacO8UaOfdAJtu+Gk5OzeOnVa3/MQlQ
	rr9S0N6Dy1y1IETwc6WXLVp+0mTK/Nu2tkjIhEzynSZRM9gb8hzDWMy5mmzVAZAfTASo7KJg4+2
	hGlXB/PhGpEQOkPdX0hVto9/Q=
X-Received: by 2002:a05:701a:8148:20b0:196:e2d0:129 with SMTP id a92af1059eb24-1b55682362fmr22466590c88.2.1795747989387;
        Thu, 26 Nov 2026 18:53:09 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:196:e2d0:129 with SMTP id a92af1059eb24-1b55682362fmr22466571c88.2.1795747988922;
        Thu, 26 Nov 2026 18:53:08 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm63321776c88.5.2026.11.26.18.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:08 -0800 (PST)
Date: Thu, 26 Nov 2026 18:53:06 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
Message-ID: <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 7VQWctkMKxgMprSPeR8zWQyJ0U0lxbLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMCBTYWx0ZWRfX+eKjqg6+3IS+
 av6sLY1ls2wzZg51HF7ukmxgsW3bHzDFntFjlunvAjBaGTIDBZAAAE7g6pJHuAS9nmqfcpI/n0w
 p/p6lcyuPYXUYWfFOCWmB7UTiyeZHQw/toeSSLe/qLdvpA460EgnjL5Ye8K4P/Yrx3JXIVHlFaY
 tVnJW5vJsPTdGm8yTJPyHgXjTa3tnZjdFIRtMGrlzUNOwcs1ZINGvkhPBG7qVAVWYySTqU/GI7r
 tImfD8NS8RJsiHCMGIFb2/nXk/xjTtCqEdfHR1Ow+oTgeSdEMVH2J7awEwIa2vqKkfLDTUvawDn
 6038Jb1/oENphe/FhJF7NQIl8E4vBP+Jyn7Lieu4SrpVGgFgQE8WxBd2/fMs6OX1pzcJ9KkIDPL
 Uy97CGzYLsjJnCaM6fo+wkhi9FKM+iePOXZ07J7WNKW+gfFTBd/TyBXKfFBfuuVyAuCa9KeU1ti
 c5IHJFbZDBpfPxnQh0w==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b08f097 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=k6P2HFnLoGwu0CQW8jMA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMCBTYWx0ZWRfXxemu5TTv2RMM
 kjMc8pPxCbRQdknXBtnoTdZvn5oXD1PQGMT2FcPlCzAhKeV45oAOnVrf1LD4M+CDHEyBiAiSlI8
 JoEHXQKhkquOlJ4vff8OwF2/D2BW8Lo=
X-Proofpoint-GUID: 7VQWctkMKxgMprSPeR8zWQyJ0U0lxbLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270010

On 26-11-26 14:41:24, Felipe Infante de Castro wrote:

Good caught.

> Assisted-by: OpenAI Codex
> Assisted-by: Claude Fable 5.2

- It is not needed any more.

- Add to Cc for stable tree.


> 	int			dm_hs_phy_irq;
> 	int			ss_phy_irq;
> +	unsigned int		dp_hs_irq_type;
> +	unsigned int		dm_hs_irq_type;

- Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type" to align which
existed code.

Others are okay for me.

I not sure if Greg could get the patch with attachment, try to send with patch
text.

-- 

Thanks,
Peter Chen
