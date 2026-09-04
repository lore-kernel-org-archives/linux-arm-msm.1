Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A608B339397
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507456; cv=none; b=umLHUOVFnD7cTwOTb9fWql+zjON/IqLJcfg7zq1nVirCqXgrSAmux8nYQQPxMv8kl3n44/b3QuKyOu366DVA5N8vG8KrBAwrJQwMT49bf8YRtDNXRJ1NxthCMt/KtJ6IlpSy4zQbU84iB2kvl/aKv6aO2kAIOvE+/fbRn7wUcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507456; c=relaxed/simple;
	bh=yy3y4J7ZfHsuzJjAQbenODv7ZIpL0T92jMWOauDhI5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLapXzDuoN2A+6r1BsOfUJzwRHyYRGu/evF/CNN6pbGR2w1LyLdTqQHAzos5HiHzYyWRAEUiOV4SM0Pp50uJsVbhwg8HM+d/XVZc1EL4+zUezsWQOlPbWVQeqFsLPrzdS24TPN9acKvdJutmPy/b/UXhRie4yhqdlj11oD9rEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxO5jmp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEV6iBl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxO5jmp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEV6iBl2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462kvd1545517
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 07:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtsDQSU5VHlQkD6IyBO8zq6EWAcPowQCqqnoACC6TYk=; b=jxO5jmp8Cd17CrCW
	oBbiI+f6jxmaFnqyN/KNkUO6XyWHFZcOGyEWPgcV2jnR2f/4IarE0PaHz2MxsI4g
	npQynGCi41ZEg1NbWURD2wfqWPRGAzdoDMlEWJOYJjPPK2WtnHvoTV3RHdWPwZTM
	a/WUy/6s78IS3SCqx6bJZJpg96t/54rq9JcW/NykDteYHpITyFb9NcQJTNAdV33A
	ZF6lpqd4DLWeAG7Tn9G3w1tRp7iPI4dlwBcrMXQ0dUP9WeBivEB20HIJ8YEn//jz
	D9ybA501YqSuDYyDHAJ1DLiIVjmbmMO3hs74VVRVyqBHBw6UGBxlvhcxPjRSTKGF
	NBjwCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrnfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:37:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ea38b1e7eso1810951cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507450; x=1789112250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtsDQSU5VHlQkD6IyBO8zq6EWAcPowQCqqnoACC6TYk=;
        b=UEV6iBl28oSjkHVXPXGMK+LejcKDPieuGKp/ngEBxjMQr7lPif+QQMSRisB2ERX1r8
         KE3EYGsB1CD+63tTbzl2WlX840TAxbTDDV3ImEK9s3P1KKt7xkfpEI4auVO6Tg8HZYkn
         G8w7bOeNIRLN7txuuMaznW1swqJX7fBvc9hH41QVl/tw8Lj7Un+7/Jrn+ct0ETXxjwQD
         y6zUxcsDSU9bhVDU2Wr58lmqwix8yW4vXyEjoK6WmcDaYUuXrzaR8xyL1mSCAuRvHc2Q
         F7rkzZNoOnFg08rBtvUmf8Ro4Lc5SY8qPQ5GcRxzq7W9z5qKXJ317X36cG8ZnAuzcmYD
         tzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507450; x=1789112250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtsDQSU5VHlQkD6IyBO8zq6EWAcPowQCqqnoACC6TYk=;
        b=rL91bmWBkvKIJfpaRUUJd7oVho88MpBZftuAS/um1W2pr/lw2NTRrB9LssRGTX8iML
         3mpHVOxxaW4QDZoxp2jVxd/sanTHnxreYxH4e1mK4ZVglVR/eTsLHA1242ZdJMjB+yv9
         NRscx49Ei9Xm9jg2nhKelI8RRjZBtaoqo6zS+CD9RqeDBYylmAu21Fb61nPrbdnO3htV
         ZfotR8s5diW+qCveEG+oYeN8XPoSACg3i7TsJzL6jm7R0UaPhoHX0TP7fpfnsgHcL5ZZ
         7u1rFh0uoBZiq4rbLmUqoNQxFf/FwAAL9xWswTaJyBA41A6slOvk9nkp4qQIUU5nKhUW
         uMCw==
X-Forwarded-Encrypted: i=1; AKwUvBw2cfYFPA1aGpVf71x1sInCnd3xKbRA4RpjMgadNRV2McsBLIkqkwuNX1aTW5b3evwqusuYr1LV+dCoCfDd@vger.kernel.org
X-Gm-Message-State: AFuF++kWhKI+N4+Gi8C1qeXO1FvN/vvOwbhMqA6PvzjjNeAFdYwfaOBx
	czCUGnNinXh542ulNnzOGQHNVRljQhkLUN9sVFnZdDvfGAb/Ivyi2EpEUyUTUlNV5jr92TC6kIA
	6bpdTOLJAjlwdObw1qJ6O8dYI4JDLY8B2Sb2Goa5KdNsmCiPq5BB2ahCujTqBr7Yvad8m
X-Gm-Gg: AYBFou0PKOzz4d3n0E75/nKlxx85ZXG+M/X/kZMwrMnNv/B6WlB+8VhNsCq4wztl/Za
	BA/8ke6+G4cByAnMK2pNVLVmR8bTwj9+uppRBOfDJo5PlnXgPyd/znpV8YWAwP+3LIQYXLjOeZE
	wRtXO+Qqj+odevOOp+/NlJAPCLJUOec746C8NusCwgKJR12LZn4P2dpv8CFSIRTJq+LZaLwsXHB
	P9yDoe0DHYPjjdxoWnqBGz+ryDzpF8NSfZmfrYNkfIqMWo9JRPNiR8KvTTOOwIT0HAsWSGIW84f
	Gtn5NH+BtyqPlDXsEyEXWXkQXVwScwGApxEXp7f6zkYsycfCaD1pWDGdQBTC3sMCIVLcW/UF5i1
	Csmio3gakQ6jvl5oTsoxZmA==
X-Received: by 2002:a05:620a:2b9c:b0:939:216c:59dd with SMTP id af79cd13be357-9398073dec9mr313333385a.4.1788507450135;
        Fri, 04 Sep 2026 00:37:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:216c:59dd with SMTP id af79cd13be357-9398073dec9mr313331685a.4.1788507449683;
        Fri, 04 Sep 2026 00:37:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d559364sm67121666b.35.2026.09.04.00.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 00:37:28 -0700 (PDT)
Message-ID: <cc02e4f9-9e09-4d9a-ac9e-4e09c2402704@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as
 NMI
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "Kirill A. Shutemov" <kas@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
 <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
 <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2OSBTYWx0ZWRfX/YEfWkxP39xG
 aLxPSp/2k/ypY0M3QS7Cd9V5jO1c0G+sASM7q46IjvvrVAz/Vt/7A4CDq2ff1b1qkVa8mzRIYLp
 TQ205dJu9neCuTF8AbsFnNFgLw90Or0=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a753b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qgheIKeueeX6PycM51gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2OSBTYWx0ZWRfX12WDUqsfch/M
 w5Fx2StT4WFmYlMrJEA+xXG9nbcgSCgr1bxLds50xsym6AAS6XNGr09DfMR9N5aZf+RMRE2I/3x
 1ngNcmhN17JqPwjDII8NqpMhZFI8jz189z3KVJfnvxbUH9pZyXUN+9Zt2viuzJVCePF21tTtL/U
 3su1WTpdbwHiu3SfrKHCXT/ROJ9s96dZ5iP4BI5GHmLENbxKij3+MyIXLahvagYU8FenWy1pfvg
 WPfZXkwGb+m/QPKVqs7h7K725UjDXULsGgTizarD/lCFJ4rpv5fALqdHJAToemG76tPM0dxalpK
 HHAnKQMx1lWRU29NOsAZVD9sJ8IfHRc6fQSHWkZ3RUfRU/L5dJrXoS1qhF/wKKuTta+UHLo2HqR
 QymrHgEF8PDVrrSu6DhpmsDdB/2Sbm4BNPobGmPXlE7aw96DFipXoEDZnsEUlXAIjLzBYAJAIUh
 q9hpezns07lF7VbjkNg==
X-Proofpoint-ORIG-GUID: ouZt-AZvwR_j8frPaCbIA7TSQMk9Puez
X-Proofpoint-GUID: ouZt-AZvwR_j8frPaCbIA7TSQMk9Puez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040069

On 9/3/26 10:58 PM, Mayank Rungta wrote:
> Hi,
> 
>>> When a system is completely unresponsive due to an interrupt storm or
>>> deadlocked CPU cores with standard interrupts disabled, a standard
>>> watchdog pretimeout bark interrupt will fail to execute, preventing the
>>> pretimeout governor from capturing CPU backtraces before the hardware
>>> reset bite.
>>
>> [...]
>>
>>> -                     ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>>> -                                            "wdt_bark", &wdt->wdd);
>>> -                     if (ret)
>>> -                             return ret;
>>> +                     wdt->irq = irq;
>>> +                     irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
>>> +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
>>> +
>>> +                     ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
>>> +                                       "wdt_bark", &wdt->wdd);
>>> +                     if (ret) {
>>> +                             /* Fallback to normal interrupt if NMI not supported */
>>> +                             ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>>> +                                                    "wdt_bark", &wdt->wdd);
>>
>> GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)
> 
> For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
> this, enable_nmi(irq) is called immediately upon successful
> registration in the probe function:
> 
> For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In

Yes, you're right. Both GPT and I were fooled!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
