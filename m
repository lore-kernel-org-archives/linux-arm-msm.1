Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749140EBB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220883; cv=none; b=pcW2F3FfKYaALdJ/vUIMnAEAoKNtv9guCd3btJTzJgFVvf3Wp4eoSaAVZsdZv5zk53ixaAcP6f+9uVu5bp91sANgHFj6Gniz481csG1QA97SHUlGThgPykla7t6QdQFAC00DACapTf3l/4fxX/AZwR+r+q6a+dMA0IuwBs72swA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220883; c=relaxed/simple;
	bh=X8y3v8iSC3IAclYNrqRIQfkR16kO7jg414q29IlRxqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyfOqyoGMDeafMGv0W2cmmxd+PPnfMYntR/SN72RPp9tLiSLe8xKyytz1wZ7Cdw4L1dGw6Jx+bsziIte78yEY+tSCl6OWzJfMCAtk65dSGCV2ri/5zyzITBU8WHpUR72mPETiZFUKAomDqZunopMIX0DPCFqSL/ORqN2F2dxBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6OF2lEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBm7sTNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6OF2lEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBm7sTNG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3G5u3454853
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHYsELtpGLLEt+3xi1H3gM/7xSFfDKi5oNRL0o5VJZ4=; b=R6OF2lEgK6gOcZHa
	vIv1bRpXxjXfv7JjDWrPzr8Kmn8uXHCvgC8QRerddtRsjlYdiqAmuFiWr45ffaQp
	nVuoxYkoNsMBi1e4bQZNUdOTWiJXi2a8qj3JnkwBgSkr8j7eEiWRU1TEDFprYKce
	hQrnDombFedtjMuSHbyVOAMLsB0UBz1vox8mz9UyHZXpGy6CenNsqhnEhUbs6Rvp
	h4bXJNfvP5MfwCnsBuUdY4Yhaq4nEyDeLRhjx+Z1ooAUwItPAZQYevTezeYlECFG
	njXZdy62UzSclQcmuNp9umjJUDqEaiNIG9uBxjqrzNrlIi2OuWp4teAYCy+48dBW
	Wklv6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg881mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:14:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so248951cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220870; x=1787825670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHYsELtpGLLEt+3xi1H3gM/7xSFfDKi5oNRL0o5VJZ4=;
        b=RBm7sTNGqUktCCRwz69BPpahDNtXAKTrtgmi+FpwqL6qU56RzCZHYsWfqIgOx3302K
         t3lXhCOoe4CmVqbQdR+guPXEG2Y6XH2Ue5DxRN25nO4dkXLE5SMB4fWflp+NrMngpvkN
         f2vT9J9je6i8w+SnlaRzbGsNjmY2yLT2CKT0uE2XSnS9BAD5WImflD0sSkY45UBfdLZC
         Y0/riCCmo+eklwuRWbZUhbNjbNtwceQYpq2VveApICxMAmFROm1siJrVZs1MIrkh+OIh
         fUB7zqUVJZ2mQl7jvmVtC8gbPgmaFUm9+YqyD6K0L/sQbutozjjHUGgupbQTv0v65E33
         ZooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220870; x=1787825670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHYsELtpGLLEt+3xi1H3gM/7xSFfDKi5oNRL0o5VJZ4=;
        b=Lg4ZyT99MxCZg5gvGMXXMgZIhzbCxrZ5DR2QRWXSMuXH2kTLOt7c5nxOU5eTn30Pnp
         H+KChdxjqgTDYdqep45DjZvEBYHSXEZcZXv8ltsai1t0AHpDiO5irE4o04V5oKfWjDUx
         7dVnHVZ6vSEsz4J8NOj7C5GNAVEv/ptmwzfh0NszTGiFrEcjossCKK60RFKeKJIfeaiC
         QX02f87SHFhFIEs5eXwqxg3VrT9mg2nze78l1Q/p/zOm+697gmletBgxYutv7/77On9Z
         J9PYgSwJkEE6ZLCxk1okAEZ87xzkrHkbFb2pWBKpuVv7opBZ0yxS/u0nFLn3KQgBKsIS
         Eh9A==
X-Gm-Message-State: AOJu0YyZ+VUYotWGaSGWiaMfaoIimjmoyRyC7o3Km1fP56eze4jBGsD0
	xYMBVwF4f2AlsrjQtqQSz94I65f+MlKWPDTjOeVWTBUJ3/vSzdBhKstnm4W4n4MrT1I3DTpKfbs
	W4qVPhuX8iufw7AuN1kBbgdVh5e3HxlBikgifpUfgzjOFXdWI4ZRN7ku1tAT8oi9mIQWF
X-Gm-Gg: AR+sD13tV5/VKxXW2u8rcyJy0hwYVxlUkg6Et47qH5YnH88VkdbSrQMvGBvjvXtDUYb
	lWeHdPT1lf8AX6swJ9Al+fhaOqDuvhkz3F4Se82914D2+T/AbQgemirezyrQZOavR8L3YRopaYX
	10/bpFy2D0W7eaaqpM0zKTY3g2wk/R0xJNpZqwEnqe++ti32M4sJkFE3xboPQR34QHDSP1dS/v/
	F2YxWBOZncTGtPaURqdqwEKEj5T91zzGtwj84Z6LL0+poC2n73kfCOG/vbQ7JQp6dKO5kkZw93L
	qzbBf5FhuSpXm80QgsMmX4GzV5KOGDdRwqEi49B8RSpSMaupAU9dF4raDTGkwGKI96HgWOzKll+
	z62dMeEzIykoGWOWt53uRtPUW
X-Received: by 2002:ac8:7f0f:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52dd5dfdcf9mr78319741cf.4.1787220870021;
        Thu, 20 Aug 2026 03:14:30 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52dd5dfdcf9mr78319291cf.4.1787220869552;
        Thu, 20 Aug 2026 03:14:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm49055166b.53.2026.08.20.03.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:14:28 -0700 (PDT)
Message-ID: <f0db00f5-af61-4bc3-b607-1ae3a399745a@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:14:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-7-7130d68183d9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-next-patches-v2-7-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX96vv8kaAuqPl
 X26KKtlcIPbqHZYUyn4ZI7hS9tcOKxWyJg2iTwsDmAyWZHh4EOznbHOVS+ZS933yk/lNsKwteZv
 uf7CXk1N6OTWlx19JqoRba7rHE22W14=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX+L+rlLS4uZ05
 6GGCSgMuPetz12wi3TLmIXxDF1wccWaWoPoOM0D1n7OtVbMIrsCbVThK1U9hp3dptklkSUONXDE
 +kRO/KsClHZVFbm9baLFHUtItEwVrV8X9qT5xCtRXbA1KHjICRIxYoFqKLhVzRqXT0CYNLwP3SA
 Vim3P2vaSBvl6AsRsLMk8HW7hsDFujCGw32HafguRPoPNCkAOoNddS4qRB39SBf5NAZDz22Tlm+
 6QCjgS54rGXwahZYW+RX3UtEGZHrkaVxPurMPEP7UdvJMtYH68JQQA7FxfXs2GgBhgnEhYC3Eur
 sQJiFvpe4aLvtk6BYzceQL+wlsYQXqy1CLMabsk/QBpNzANda5DanA0Yi9BDnl+yExVWDIDbcON
 onRik8SaTwc0Qt0ulwk130PDR7l0DTerHPo5+9nCjxwRvHCgDqhCwTZq0Tza+kH2zb/UxJBNNPX
 Mc0rlTTBxyg5qwoVgIw==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d386 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=m8Yw1JhN3ITPm4ObUbYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7fmzQSjgq48EbnecdjLxTZR8v1D1m5Be
X-Proofpoint-ORIG-GUID: 7fmzQSjgq48EbnecdjLxTZR8v1D1m5Be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

On 8/20/26 11:42 AM, Adam Skladowski wrote:
> Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
> on the Bengal/SM6115 SoC.
> 
> Supported functionality as of this initial submission:
> 
> * Display via SimpleFB/SimpleDRM
> * GPU
> * I2C peripherals (Backlight)
> * Power Button, Volume Keys
> * Regulators
> * Remoteprocs (ADSP, CDSP, MPSS)
> * UFS/SDCARD
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
