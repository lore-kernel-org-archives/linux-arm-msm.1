Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB093E5EDA
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498997; cv=none; b=trBbyXRtZjqY19LDz//MvP4vyS5gEkrFPSMGzlmPM0wqF91YTBKY5iY6Ttxfj9W4OzFiOHpFW0x6i+ugKqTy1Lg8Mu5SzEpxsz2GkmLpGOXtMGf/3mlO4GkYjxlYS9CJL9cwZZz5ZRXItAFa6IA6UBpLSncrBc5nI/1wJKlTwOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498997; c=relaxed/simple;
	bh=WLU4r5g1L2R6YbUlpp/0jjkooXm6on4bOd7pGMtkBow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrRNA//Jm+l5Mba7g6ACX4SpmWX7O3KaBJBD9CpnbU6XonJTKCvlLuIpAeqhLxXH0pr7EGUsc2KTvf70AeCwR+mDBxrSh6axLUR+oPqUGtBtbd6WyNfF1BApvTgg/AeDZtCZRQm6GAV/c8Ustk6po73MoS56NBK0Xe88WdBPiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHxERBJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEJUvIdR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHxERBJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEJUvIdR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBbDIr4080513
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmvNUqLdYeomxQuQ2aCdM4gJYixDdHuUmeKKY1QoqWs=; b=nHxERBJlkO15Ziie
	BC/cZindb6UJv5Zk+1d+s79nIIukA2CgJ7lbiMnV3XIBeSTI7zTL/bOjwOExWQF2
	VCLE+GhGlJvtqYoaI66m8xt4kpX1lk41AryLEhdyTFu/aeLG5RGvNB/1NyhcCzOV
	XASalIH9fL8JPh2DS8HwJYsg61DxDv9xcmtO+MVuEp3nKUPV+fjGK9RgqrBJaodq
	qb+bIOw5CvsipXKc7rLMWzuqypLfXOiIfIqja+u/4wlHX75F0sXMKSNzkxjvYc95
	qHcJqL+rHFyCujyupQYz9CGB6y3igMNzeUQTJ+XtiGNBIbpGHuY8pIsUT3nMFRlQ
	25xJew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru05828w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:56:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so1510451cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498995; x=1786103795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmvNUqLdYeomxQuQ2aCdM4gJYixDdHuUmeKKY1QoqWs=;
        b=DEJUvIdRv1GjuIezCG/OTzt/hCt4TNrWe3V0Bl1Z1o3JGReaFKjHSwhFPZM60k5Ful
         VH+aYENXvwkj3H1uh8Rqm7uaI47cKyhw8BL9o+GYdZTwWzNqdpwMw+1g5VASWP5OCNNz
         MquXRlJ7WRBtIVDXW9tbSppCAtNdHiPxl5E/1tZocoVPtlfHKJJcGrv7F3Dnlwuq+/0L
         0xiPMD1V/PDPQ2eW8Pj3qz6vMLPo9s5xpzyDvu4sWfUVljJyUXREN3hDrpBEeexdhmIp
         PsSnugEG6YKBDsFEddfbOR0d8bcGE1oTyRHQmcR8UzHVUdUeFw3ocCmpOfnxlQWWRqC1
         5XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498995; x=1786103795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmvNUqLdYeomxQuQ2aCdM4gJYixDdHuUmeKKY1QoqWs=;
        b=XtH+ULssvEuvsKfU6lR+Ve7npnydjGcxALowbm3DUYXoGpzq04n4wBig5PHmIuBaik
         4xQx4WGNNpf1bj+XvIfHb1Txq7EDRpFCTOfV6QXbJrbwey6BEypW7v4T/wtSA0L10Xh6
         jYwSlb64sZkvT943uUcZLYoT5h8d1Irp+ZQ6Mn/XKokEcIIXOxd/Tu+uGscgxOWrqOlO
         4bN49eo0ptyH7GLIDNZ9Tcc1uHhMWqRVKaszU3AAmZCSWXYB407/MPQP3qmLFfCwno4l
         lj7AxvrzRiYeyHSchGPfxttkVGeywLjIXHRO+6s0EZkK7pW3cQBc9rtGaAmCe9Wcynjp
         ou/g==
X-Forwarded-Encrypted: i=1; AHgh+RowU0/fEAMsFDekyBhlSmAYH7y9hGCduryVtkzTITJguWuLsNrst5hVpkS3mDpfiaDH+oPKzXQTEpzMuGF/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7hu3iF0LIwgXbdniS3qmbq7bAj3tSixGS2WMaHJ1B5rlVqVRz
	deNKgHADMApjpPCVKF+45Kr7SU9zAcrZdxQXUKbBK2HBFySEuNeopOxVN/ksclT5G8Q6ReYlvy3
	lVO4Jt+V4/kvcg+aYHH/hrc5bjubo0wNJz0AqP7mJcoftQx9CWVc+Ykfi55SdH+Aorcds
X-Gm-Gg: AR+sD12AybkxMAEJEu3EaxYBflD4dgmeEOsw9X7A3vrs7mzzxYa0zg3zw0uHVKq/9SA
	lLHAurNYAiapLzY9+IY0Dqj3yt9TDAG0VTcOHeQDJ5TydDb/ghSP0XOp5+VwriseQ3IYZLSWI2t
	c7hIxcfI/RghzinxNzm4Uwj+aU5bz42DazXEpsw2Bb8cCTi89bA5h8DaYVhQgrbhEgu9hXmrYVR
	Gu9g+0hEgVH/QLDCnczmr1Joq2vAp5lyigTJWXDoLFDM6XNn2KbvTaVatjQNry8ZQDxl7dtTWIu
	aXvRXppNEDKHKfz88pXBPiLG/4ne9wP/hcK+5ec33+QCBJAUnz/w6g2wr0qzCVPena+oC1X78z8
	BssfVMT9Jsc89WFvkkZCFqnri
X-Received: by 2002:ac8:7e81:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-52b4b12c2famr20189841cf.5.1785498994685;
        Fri, 31 Jul 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:ac8:7e81:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-52b4b12c2famr20189521cf.5.1785498994273;
        Fri, 31 Jul 2026 04:56:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537702sm123113566b.53.2026.07.31.04.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:56:33 -0700 (PDT)
Message-ID: <36a7bd8e-7e00-4df0-abd4-e22b86e91ca4@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] watchdog: qcom: Register pretimeout interrupt as NMI
To: mrungta@google.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com>
 <20260730-qcom-wdt-nmi-series-v1-3-3aa86d162914@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-qcom-wdt-nmi-series-v1-3-3aa86d162914@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNVQXsZl c=1 sm=1 tr=0 ts=6a6c8d73 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=1XWaLZrsAAAA:8 a=knYzKYFgTjH3_HfYCsAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX6PXHKfNwx2M0
 0bidScwTysAdYulA/mbpf1nmiset4u6qITWJIR/mqo+ji7u3zNdIg12OJCDT6bLdQjpXkj4iPBN
 KzXCvtKasQR9m5N2E4oN5goB7HgS7ZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX9ZMZE2xxXnLi
 Uxw2yDryafLk2jCS1drm5u6HZ0WOF9EnvOA0l4zJSy5rtPidiZ+JWgjYciJNzROwBlJ1YG2ZGdG
 hq1Zmub5gsHY4/qpvojAW6RNnW9mRvpo72HG3o/eSFyYKGtK1EAljF3JilGNIui9paALEX/UW1t
 KpewdEQvit3IqLbbXJSscLdu9rq2McYy8lYH4r9dTPbHIb6hGznIAYbtwJ1/YnSozyItrvcaGAe
 YTlRjvcHCUKldEKnyZ7snE/HJlzcYWYvHaNdIBOIfZwTrNQ/Jrfv/frqgpamgG0L1EkeJj2hc1/
 O+MZdvHdRBMWbkXUX8mqCtr7wbVsrkPz4Mc/njcJFm4ltZ/dZtgMuFlnL6HeDnqgb9p1jcp67Ty
 yNO2NNVq1OSfthZ4CdHBP/nSj9BPwqxRsIE6MT4n4zhWtCSssguKzqvVq40s/Ld2TarJ5HGG4+L
 3OW8TLf/obtuEvaMDxw==
X-Proofpoint-GUID: GKO5sUntprymsi6juRwWrVh-h2ERz5lD
X-Proofpoint-ORIG-GUID: GKO5sUntprymsi6juRwWrVh-h2ERz5lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On 7/30/26 11:32 PM, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> When a system is completely unresponsive due to an interrupt storm or
> deadlocked CPU cores with standard interrupts disabled, a standard watchdog
> pretimeout bark interrupt will fail to execute, preventing the pretimeout
> governor from capturing CPU backtraces before the hardware reset bite.

[...]

>  drivers/watchdog/qcom-wdt.c | 55 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 49bd04841f0c..19d8e91cff40 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -51,6 +51,9 @@ struct qcom_wdt {
>  	unsigned long		rate;
>  	void __iomem		*base;
>  	const u32		*layout;
> +	int			irq;
> +	bool			is_nmi;
> +	bool			irq_enabled;

Do we need to track this? I think we can rely on the framework
NOPing out multiple ops->start requests

Konrad
