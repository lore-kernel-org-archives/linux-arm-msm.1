Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B32C14B950
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784521993; cv=none; b=gsfQgFriu5rZPiw5j6ZriHKQoGgqk0B+dMh1KC3bEzZ261HBJwnW5tqPBZVXRoHDPJ5F0n6Cv58SFy76VZ6gpyaL91/v/BIVRoFAU5URy5b6ITIRXzQOki4WXJtqqQ84AE2YBry+t7YC2fmGTrgHpawqd8U2sUAd/1PIphqMxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784521993; c=relaxed/simple;
	bh=JRdk+BxsO3a830t66m1mPw/xN2FiDriyXhdiNUWm0v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQMc7kkqZTW3OqaLQy6xUboC0hwFUby64Z8JXDebDmNpmY2uh1uKPuDFy9eqrf9Esm8IQ0r7DIW7GOTf+DuOOEteUXtR6wgtA5sabe8qFMeHHVxe/QGcX1HjONkqppCPXjpOewjodrxl9ygwMSTt/niFg/XRswqdCpnX/4HYJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSFReaie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5sm9Qy5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSFReaie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5sm9Qy5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNt2C4902670
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ivx0P7AbHnUHDddB1UiLNCNnfFcAQc7jRFHJZVQl7A=; b=HSFReaiexWua1A/3
	tLsb+Tp+qh8jy2q9fO1CE6Dq/hk6OtOEhK2Rk6tbtJsx07hNOwpszJEU5U+xDndv
	ds5xOCXJTMrsJu2CTHkM3C+XCO/5w3flt7RcXMlby05Mk8kQk5mhdAglkMI31uin
	s5zctMA5CqLxVCfv3Va41ootpHftWK6Hq6dPLZyUKL7FqJrl60x1dnX9VqwISz+Z
	+z6cDOjAtKkKnzWtV88YdU0On/+jrEllb8qNdFK7UG/+A4vcrJxophcRhQ43lkA+
	11XNej/kpwlPESFI3yjgHzjtmwdvvL9CdVmxHUb9C9XPuRzxxm+jJnZk9KQUuTKq
	rq+/7A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnmbcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:33:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848551b54f5so18482086b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 21:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784521991; x=1785126791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ivx0P7AbHnUHDddB1UiLNCNnfFcAQc7jRFHJZVQl7A=;
        b=L5sm9Qy5XIOZRGX0RHuv6jF5y2UQDtSbnZzurPUGQ56C7xAYlveuPFKUYXJG43pzfH
         meFkZF+VizmsGij9lVUbAKQyFUozeq0VGH7xHW+r9rWjK+Ine9Dtvaeq0OXLB3Ai32d5
         Ov/KUn1/a+lAame+cHJVd4AUCnjJyl4woJbRC+4vtaL+ndsPfzGtbx5X6f4kTZL1K8qQ
         SCeLpEdu7IPsLLF6WMP7IfqoOco0SOfZ7Y8BFYYZM6AdO6UP/G05wMYOlaiGf3MI3d9b
         yjgDvcJZoEBaPyGBSXXZ9HmrwlQPYTKoha1M1H22J2jP8Qt6NwQ4Sf8sTSmRQO9vIjwF
         UOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784521991; x=1785126791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ivx0P7AbHnUHDddB1UiLNCNnfFcAQc7jRFHJZVQl7A=;
        b=E/YEQLUFe04ndwKSdJeYkyT1MbQ9JNujWc9L6lCMwP2JtfJqnP3WnqDBd70RfbVwbr
         COfuBF2s+0QkidRbtE6URErij6ltGgBuGDMRmqnsrPF6dXsxGQhKh2VXcJ04ltSHRlm2
         LUqKY4fcjvPQRhTBRsWIxFMvgJ7l9aiwUX8kL2X6BcMu4fy1XPHAakfX99onMUbKJYuu
         ua6aibt9+DytB1gNAQZilNgp+77k9CWWwxcKzY7mgmOjYQuJJk/FrhP91qBoSnporpHk
         +JkB9oOo1BKDKdn/W5eewMiq1xljScX6BfQiR8KrnoLsSRowuYFgzHTA1imfDavAtJfU
         STdQ==
X-Gm-Message-State: AOJu0Yyltq/GDS82hIn7bvxODN9ShHNe+bmc/ws+XAmjDanVopmPrLta
	Ja5nXBm/Q4/bhfqZGt7gd9CdiPeqkZL7FHf0eraauC2Sa8Pcfx1RlsW3QfrKvrZEm4XT7KsjKK2
	S/KjFhvxyMV5nmxgQqT1JCwBiKvn4PjJCneLZC4IvmQo0G3JQCcDASxct3E4It+XAdlnD
X-Gm-Gg: AfdE7ckimoIn0nEIJMuRhaAZcgTYIIuJZR/npCjZ0Rc3fDy9x9CJGr1BfGT8o2lQ2k3
	8WTOEMTR7c0IBA8l2Lgw8tN+by1EUIOweo6+rHuzw9JuLJ153lxn8ISslAFpP+zdnHUJjidMi0k
	vzAWVO3lCkzPQvOGE8ME93x72kGSa1JLAd+jOezeQqZR2xIOb697buuyiL1/x06Wtw6z5Nt48XN
	6YavjMmwgBwAjWvKzYTICOBusPc/ASKrtcmEB6XMU7C0MOK4OGbDc6Siq9OkFqWgzRpvHdVJIqR
	E9+0x5JSteMXvb56zbVq5ZX5c6OY5adqH3LQ74FhUtqwiz+QJQzkS9nrP4Ma7fKE4M7x7EClz6+
	RbZlgSQGmPCMITEeXhsCp7wEhQQ==
X-Received: by 2002:a05:6a00:ccf:b0:846:2f5c:dc39 with SMTP id d2e1a72fcca58-84c2948a780mr12663019b3a.42.1784521990983;
        Sun, 19 Jul 2026 21:33:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:ccf:b0:846:2f5c:dc39 with SMTP id d2e1a72fcca58-84c2948a780mr12662984b3a.42.1784521990496;
        Sun, 19 Jul 2026 21:33:10 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9e922sm4909994b3a.54.2026.07.19.21.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 21:33:10 -0700 (PDT)
Message-ID: <a08c4bfb-9f8b-434c-ac71-8df76a1d9540@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:33:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
 <20260717-qcom-spmi-haptics-v4-3-b0fe0ed30849@oss.qualcomm.com>
 <alpWEL1hJgQ18I7d@google.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <alpWEL1hJgQ18I7d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA0NyBTYWx0ZWRfXwg8acxZ9GUJ7
 xjK2swiJsuUDd6Ywg9mfJ0X414uU/wH6f66F3sYatlfYucS4DDrdj9PiOb2gMnqck/NuS4dCLZj
 1GGHMbz6jnAI+wiOl186gxSuq0MJBsuGZawLzbO5usSHZ76X40wmO9DjAKgrUeEwyCljQJq+9uk
 Rw6EE2qOvLj9LDunMf7jrd9vJl6nJo3HLspSQ3a2pWb9Im4qyNWvYjp/bAv26MfwuODyZDIOJId
 pIxBMAusv/f1+xWWaBvJV927QmR44IHOj55PWQK7OVww41s2XKzoliFp3x5FwXMzLAKFnshh5jJ
 NLJr7XlimKYyrgkWRuaDTANfjsw5kT6ZD4rTNtHpXCuSF/Uf2nnEQSd4JeAnBIIvt8QmKQx/fcM
 CjDgKqRnJTniO0XDGyMY59MpXLn5bs3KwTCcKtgzOh/ifdMMGrdeARbKVi6mevii/E9+8hDqqRk
 18s+aLGOPF1chn9oQVA==
X-Proofpoint-ORIG-GUID: nQJtfkUSoimJpeGNAqSaSs1Uk7JKisOt
X-Proofpoint-GUID: nQJtfkUSoimJpeGNAqSaSs1Uk7JKisOt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA0NyBTYWx0ZWRfX4PB5stQticsm
 2IrZpJ/nlyTdEARARDfItu8x3n8KuYEjPv3PVlG46HOUqlhqMe3V226itfstvtGolDHxjNC52Cs
 rPxoWmZJbt2FfxfzyOTKNbeXlDSHzHg=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5da507 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sQ-7ciGxWlWRhulWx3gA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200047



On 7/18/2026 12:51 AM, Dmitry Torokhov wrote:
...

Thank you for reviewing the change!

>> +
>> +static void haptics_fifo_irq_enable(struct qcom_haptics *h, bool enable)
>> +{
>> +	if (h->irq_enabled == enable)
>> +		return;
> 
> Should t you know if given code runs with interrupts disabled or
> enabled? I believe this tracking and the wrapper should be removed.
> 
>> +
>> +	if (enable)
>> +		enable_irq(h->fifo_empty_irq);
>> +	else
>> +		disable_irq(h->fifo_empty_irq);
>> +
>> +	h->irq_enabled = enable;
>> +}
>> +
In normal handling, the code should be able to track the IRQ status. The
IRQ is not auto enabled after the registration. It's only enabled when
the upload data doesn't fit in the initial FIFO fill and requires to
refill based on the interrupt. And after play is done, the IRQ can be
disabled.

There are error paths or concurrency cases which might cause the IRQ
being disabled multiple times, for example:
1) IRQ is enabled when playing an effect with a long FIFO data
2) During the FIFO refill, if any SPMI write errors, and if the SPMI bus
issue persists, there would be an IRQ storm as the IRQ is still kept as
enabled and the HW FIFO is still 'empty'. So I need to disable the IRQ
to avoid the IRQ storming before the play is stopped in step 3) below.
3) Stop the play and disable the IRQ, either when the play is done, or
when userspace issues a stop command.

There are potential multiple times of IRQ disabling in such cases, I
created this helper function to track the IRQ status to prevent
disabling the IRQ permanently.

BTW, Sashiko AI flagged a deadlock issue on the 'disable_irq()' usage,
when a stop() command came 1st and acquired the 'fifo_lock' and then the
IRQ thread is scheduled, in 'disable_irq()" the IRQ handler would
compete the 'fifo_lock' and cause a deadlock. I will need to change it
to use the _nosync() version consider how to prevent the races of FIFO
resources being used by the IRQ handler after it is freed in stop().


>> +
>> +/*
>> + * haptics_fifo_empty_irq: Threaded IRQ handler for the FIFO-empty interrupt.
>> + *
>> + * While a FIFO play is in progress the hardware fires this interrupt when
>> + * the number of samples in the FIFO drops below the programmed threshold.
>> + * The handler refills the FIFO from the effect's data buffer.  When all
>> + * samples have been written the threshold is set to zero. The HW would
>> + * stop the play automatically after all of the samples in FIFO memory are
>> + * played out.
>> + */
>> +static irqreturn_t haptics_fifo_empty_irq(int irq, void *dev_id)
>> +{
>> +	struct qcom_haptics *h = dev_id;
>> +	u32 sts, to_write;
>> +	int ret;
>> +
>> +	ret = regmap_read(h->regmap,
>> +			  h->cfg_base + HAP_CFG_INT_RT_STS_REG, &sts);
>> +	if (ret || !(sts & FIFO_EMPTY_BIT))
>> +		return IRQ_HANDLED;
>> +
>> +	guard(mutex)(&h->fifo_lock);
>> +
>> +	if (!h->fifo_data)
>> +		return IRQ_HANDLED;
>> +
>> +	/* Refill: write the next chunk */
>> +	to_write = min_t(u32, h->data_len - h->data_written,
>> +			 h->fifo_len - FIFO_EMPTY_THRESH);
>> +	ret = haptics_write_fifo_chunk(h, &h->fifo_data[h->data_written], to_write);
>> +	if (ret) {
>> +		dev_err(h->dev, "refill FIFO samples failed, ret=%d\n", ret);
>> +		/*
>> +		 * If data refilling is failed,stop the HW play and disable the
>> +		 * IRQ to prevent the FIFO empty IRQ being fired continuously.
>> +		 */
> 
> Is recovery possible after this?

It depends on how serious the problem is. Ideally, the SPMI write access
error above should only indicate a bus transaction fault but the haptics
HW should still work on its FIFO data which has already been programmed.

If the SPMI write fault just happens temporarily, it might only cause
the haptics driving waveform distortion and impact on the vibration
effect. If the SPMI write fault is caused by SPMI bus hung, then the
haptics module won't be functional anymore as all of the commands are
SPMI based. For safety, I stop the play (doesn't work in the latter
case) and disable the IRQ to prevent the IRQ being fired continuously.

Thanks
Fenglin
