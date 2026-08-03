Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CA3AD535
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755019; cv=none; b=AZy04gePthy2r86QKhdDlWrd4E0nVsVsg1V9Q6hi/j7CclwXJ7PCFGT7iIJFLTOds9U9tEfguUV7aa8fKS/t0FKyCRlJ634+q3cAmMOPkt/NJZ2m7cRC/SJ11zy4Qe4VDMLT20re8Uhx0VGjAMvSLRaUiynqlrly/bPaEBPKChs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755019; c=relaxed/simple;
	bh=5zMP7IArrpQ6Xa4Y9ntfsERpVQIAEaFdp1G14Flm4uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYsyVY5ggEdpoUtIuE9FfeRm7CQkEHkBjaf4xtWk2xKGMMfV8RQ71CnYlCVLYsUCh0CP9KSpeq5XUq/PTLcMSgM40G7smcfCWjiS3Y3GLhiVPxXs/fjQol7jCnohyWUbkvmsn6z6B69g0UQM3p+zx6qCCjSFfqq9mCu7744VmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0K5Zghw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXj/RXFP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0K5Zghw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXj/RXFP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673B1KpJ3759185
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 11:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhi1uU7Xn6WTgizHjN2RJSbjsbctqcIUEUH41J8KyPQ=; b=o0K5ZghweMLpYkqy
	YMVg8JD9ORHEI+qLuucNYwefqmVhgVL1SUGbaLPaKlT/4hQ6mBlB5ruES/x8i6bg
	ywlV9MmtdCXcx7e9w24s40CUU1bet9dSaN/tcAh5TD6CzcSxeI0O4mWl+nE/a6rH
	9Zc+p7qbD62DCwkQEAZ2uR8WO1gxRUQBC5tkrUC13HjbYvI7I/L0WDAB/3+joSxy
	JRAXJr3H7WWPpG30olfs2iWchZMgLpn4N69dRu+PwSd1YYAbjtq44pSrNKKcd/IO
	JPkznvngASOulk1H3zESH0TH8oymtE+/IkbTVZKDTu/KvMLZMA3YhvxPwNMu1XIa
	n2HMuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrns5vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:03:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so8682201a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785755015; x=1786359815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhi1uU7Xn6WTgizHjN2RJSbjsbctqcIUEUH41J8KyPQ=;
        b=WXj/RXFP+vUVlhuqAa1EI3Cn1OL8MljqO5i3W+gqj5TCntlyBXMSyOsc7WHVVDKLkj
         a5OX2dmmFDnkfSoDZsE9nFWORty8hQaiMZH4W/DK2frpqHCpSjjlbKWNUb4CHb3A0OBM
         vYbaOygrCDB20+Q0H/18CkCuFrjCIHgozr8EkXirfMeDRZgytvTd7fKAl75mB8XGlmPn
         bcTmMFUrj82t/+0xX3y/f7G6F6FXWYFyTvi8LIxOZ3iYxhCelCONNJ1/pmuXpdTrhAy7
         8d39KwkoDL+9TXIrhswRC0SaiSPl4jbAlWQkn6f77E0NtMqFDhZhApb4TZFAWAtb1IyA
         mRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755015; x=1786359815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhi1uU7Xn6WTgizHjN2RJSbjsbctqcIUEUH41J8KyPQ=;
        b=eJGsFaAV/LT0kQTErGQUDl2/d7lID5EW1gIBUqjnSV2uqlczM8vvht65fjoclgDP5g
         8KBgdOFS51EqjjCVLZCU8yPcxypGa4FHmFFBJwWgPI2kZWt/nV1fa+3mQK5hq3tNjMNd
         CENf56dEJTXQIMoCg3bSk5OJGo1iw2PMr2NlKiGu7MixsRL2l7KDfi55kCxrpTupDET4
         FsjG+uQKQmCABMjfA7cUjuvWUIciRw2SoyujLOKH+TZBQJgfLgDpVsYewoVg32ai4HdE
         BDQ5CGQsbm3e7V0VcC/TnhdIolwJ3kWDELD7zOrWQpy9b3WXfIGobtp3PFZKvXFZ5mqD
         PuHg==
X-Forwarded-Encrypted: i=1; AHgh+Rra0vpbwkdjG+51sz0a1X8zTQNta8bt37Ph+EFnUQyDBkNdXMZKXfMfMUvgodMrwxxKy9art92SZefgQWLY@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQBdMIA+a7MpMzM20COJLbgc4GEGHT0BRRm0FD06cAukdjENS
	2NSlpTPZNauwrFywoiL9HDTuOV2+zXAqBep9og7eEjfL04ka/tDWhWVca2LXOozQ+QdG9+r8p+u
	fQoy0PcLMsoaeToVeYVedbaMilhe5dPgLn3GycaWo2IRiwI1mFOBdE74ZSZmbLKtZFXx0
X-Gm-Gg: AR+sD11lv2+m3tEcokwfV/Ps1S577ZilO/HZXKMQzmJ0UoBlON9t3mzqGsXosKn9vrV
	hO2aVmGMKQnjR9zA/URqD1pz5UAygIKmN7Yn9wWZcj74LrHm/TuW3c3PAB1V69KkrBAuRGC4FC1
	UQ9MhVY5kjv24/+mCOINhQVjBp/GxOKTGLunGSoNPdcZaLpejMZhJ7a6JRTw8Akfe3tPVssvgmN
	HITG8io/iPYsXAKy7JT5ZaINDJsp5EkmbddiE84nOHTmNJUFrr8EkrPaZYHcPd+QqpfDeZMSj0j
	mE8mX7+kwIUc+aixckiS3NPuk0zp1Rq95me8otCqSRCNQzr+r88rt4J8inaSGwcT/9aIk47/2lK
	hdTxXBEkhTZjjFFKdonkXSoOZvosU
X-Received: by 2002:a05:6a21:103:b0:3c0:9c1b:d0c0 with SMTP id adf61e73a8af0-3c92a99a476mr9183316637.75.1785755015298;
        Mon, 03 Aug 2026 04:03:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3c0:9c1b:d0c0 with SMTP id adf61e73a8af0-3c92a99a476mr9183285637.75.1785755014787;
        Mon, 03 Aug 2026 04:03:34 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm49107229eec.16.2026.08.03.04.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 04:03:34 -0700 (PDT)
Message-ID: <d5137c66-8895-4b08-a089-42e16fa211e1@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:33:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-4-3d858df2cbbf@oss.qualcomm.com>
 <87h5m26hqv.wl-maz@kernel.org>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <87h5m26hqv.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5OSBTYWx0ZWRfX3qz/kT2uV2MP
 1w8uULzMOYHEQoTHpGWeWmhiEKm0yuUjpDrFq/sRdbSMwsWf5lCKzO/v4YISvisbGsM8My4JyMa
 sq1QRPV7Z8+lVZYBmKqeTeNUMGWq0ss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5OSBTYWx0ZWRfXxilA8SSpdPVU
 LCj9cTBPCg0GlaFDdWxJM0hfc38LXzuae1c4EKwQzXlttqP9xEqXjbsvgh8vnMfp2XiQ9sFjPO4
 YLPB8a/2fhLaZ2SP74Y4zPRslFSXFyOBb8eH7TfEBLCAlas/tZsL1hNxIKsFQBsBRz4WTuukag2
 LaZoyM8xgnO1K0AuIszos7qeGGBOecL8TDhIpvNrIF97ZSqb9/MMSlQHA83cM3D7hziXHF0k8RW
 rdCEGngu25Lnj5FUvVabl/vMrt+G0Y1yfSVobUBZC6itvglm7EQqa89way51mImjddu3bKKvF3d
 1MT5mFtCrt6D3lG7URBShwxx82RqSg+D0mMZWzFfoDyHoqRHovYZ2j3rJQK4m/vqqPV2cTqxnvi
 lhIkRId/4ZIgPAfg3ExPyn0iFP44gEtYu6OB54QxslQECw2QFDUWt6SGuGG6cnqqCqlPzHKg89H
 n3rt0uSQlYKYr5Y21+A==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a707587 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2w1JuJCqnWd_qW_YTkwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: a6E7UDpj3T4-3bgmspS3FwC7U9hxmV_Y
X-Proofpoint-ORIG-GUID: a6E7UDpj3T4-3bgmspS3FwC7U9hxmV_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030099



On 13-Jul-26 8:48 PM, Marc Zyngier wrote:
> On Mon, 13 Jul 2026 11:25:44 +0100,
> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
>>
>> The next wakeup timer value needs to be set in MPM timer as the arch timer
>> interrupt can not wakeup the SoC if after the deepest CPUidle states the
>> SoC also enters deepest low power state.
>>
>> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
>> timer and the Resource Power Manager (RPM processor) takes care of setting
>> the timer in HW.
>>
>> Add MPM timer programming when CPU cluster enters power collapse.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  drivers/irqchip/irq-qcom-mpm.c | 44 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
>> index 763eddee99dc4cdd5edab22ce54808528f9ef165..f43c4a1c35f78b6cdae194dc7ae88c5c307ada94 100644
>> --- a/drivers/irqchip/irq-qcom-mpm.c
>> +++ b/drivers/irqchip/irq-qcom-mpm.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/io.h>
>>  #include <linux/irqchip.h>
>>  #include <linux/irqdomain.h>
>> +#include <linux/ktime.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> @@ -25,6 +26,8 @@
>>  #include <linux/soc/qcom/irq.h>
>>  #include <linux/spinlock.h>
>>  
>> +#include <clocksource/arm_arch_timer.h>
>> +
>>  /*
>>   * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
>>   * which is commonly found on Qualcomm SoCs built on the RPM architecture.
>> @@ -77,6 +80,13 @@ enum qcom_mpm_reg {
>>  	MPM_REG_STATUS,
>>  };
>>  
>> +#define USECS_TO_CYCLES(time_usecs)	xloops_to_cycles((time_usecs) * 0x10C7UL)
>> +
>> +static inline unsigned long xloops_to_cycles(u64 xloops)
>> +{
>> +	return (xloops * loops_per_jiffy * HZ) >> 32;
>> +}
>> +
> 
> Do we really need arch-specific code to be literally copied from
> arm64's delay.c, without any comment or attempt at making it generic?
> 
> Specially after having added the same stuff to rpmh-rsc.c 4 years ago?
> 
> See a pattern here?

Agreed Marc, there should be a more generic way to get this information. I will
work on it and post.

Thanks,
Sneh

