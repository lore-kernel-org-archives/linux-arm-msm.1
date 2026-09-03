Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FF429CDA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423505; cv=none; b=hVGJZb2471iQ6qk5FKo1LGGS/OidUFwryY555HJnYeg0y0HwPZisc+9/Il307+CGb5m7KcoWpoepuXE8UTTWE8uFBQJv6MlZECoF3pwsm/ufxbWNmODjB1knwVJE9lt7QgujZGoDXIsMRs9zVNvr67okw/6gCboJl0EDh7GJyMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423505; c=relaxed/simple;
	bh=OJPoONQm/fqzkmqO5WFzMXs6fGooqSq3sNVBu7SNsXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFZMipegczsFMISvrhjQOuOo5VymCEDwDYD2ELptkKu7WF8y3oOy2pwr4qJx7mVEYYAhtxi2ULzxA+svSJHnR2sR5uo9tVneH14R5jrBWGbMsyKk23PhFXGkl9v87cwlfMaJhvFRMM+MMjpl3kV4V0eIv6JY6/hGoBzqeEfZoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brEbegD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwHkx85g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brEbegD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwHkx85g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835ldPT2596853
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7q3lzG40vOdDQkotL1Pw6mndO2bNuNBDqu1ukd2D0yA=; b=brEbegD6nvOBG7mn
	0y9YvRaLwW43cRv7CmQzXnnSm/kOphpDtKMSj6dz8a8izdanE6fxFGifYjM+YAG2
	fuxMFxaYuuI0kX11qv6HFeJXEk7paY2LG9QEHI/jkTEiLu8RKkeNRHdWyDBS9d+i
	tvSq8aIFlrWFOdA0b4K0tKUB4IHHiAlk1CMx1vMbHzbdZZO5clwlKBkGaRJb0sL0
	OqCEaFXNP2G2fCfzCAhvESBJeabk4ycF2nRM74jSA/TCRp4L2ehzhag09oa06Wgj
	gG6lKSWNOpHbxa9QxaiEEUPxqvpJ6KmvMLyAeU+WbY5VilwXOI9tLjlKzo3A3Ufe
	Ha6Z1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja4b7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:18:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso47646585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423502; x=1789028302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7q3lzG40vOdDQkotL1Pw6mndO2bNuNBDqu1ukd2D0yA=;
        b=hwHkx85geOdB8bBzIsWxFi6vJhC5LN2RBlTWrLB6/ccW6ek9MrNi67FUZY8l2azuYB
         G5ggG4rFI3mMAbAWr6J9yeqTRQIIXq6xL6BAcUGUUhDUqaL6osbdHr5rU+cX9UZyMt7w
         iEyqKuWaaWG7J6IEgF1CsE+9BE3lndZp9vdx9HFeuKr+hKgW96jaX4lCgWhLLiD5hHTr
         qfELqXbbXeogJ/h3jw/afz0Z/E5ywrVhL2HIM1Jp2QpB+TN9jcEDdiIpIy9undfZ/HPT
         XKGYyfGSorKTIdwGc6Z6qYUsuXapWb0DqEXIcmeOqbZoaEKMHgeX3lX/r9uLsl4D7TlW
         4j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423502; x=1789028302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7q3lzG40vOdDQkotL1Pw6mndO2bNuNBDqu1ukd2D0yA=;
        b=IUPXm4+95bdEQUXSGe6AvI09ixQh1dF+hyrgzt+y2FW/Ie0UYvlSOGdYuVQ9fKUp5t
         b+C/yTpnGysraJRCc+eKcM0Wf7qi3AOVQ5YvmptsjQqa92ytyx5Jld3UOCBYYdCV27rE
         6cOBxDNXCF17mQ1ryKbL8/z8o4aDS12MpKKJUC7jkskQdubvxL4Ay8g4IMeejfyaOmfF
         xvhe0ek7L821YFFt+xRjaWv0UqS8zEu4XZki3rJLuJ8H+uJ7RmTmYZTTg1SqBJPdTP14
         RjhC7Ha7q9qbxoNlMtOHmWcju6kT6flJeBULFUqxn4TF2pimxFeAIC/dk6ahzWDM1KKi
         GlIA==
X-Forwarded-Encrypted: i=1; AKwUvBzMBnpCWZuh150gdhve+wh+5o2cE95MHdChyWU/w0wE8ZgIOfvxNPR7y5HLfOOJh1IGVZWISwpY/Lr4shNm@vger.kernel.org
X-Gm-Message-State: AFuF++k6MWB1+9Tr59NR8MmEe74cqXuuwC7E2Oa24wXIaEJqtEEzkQDA
	sVM59qAH1YCW26Pm+nI64sl/V4nrykscnRM15RQVOuBxQdwlBvjzpZhY6lvH3TDCyHIy8IpT+0C
	9gzvb8Qh8LknjYHnqXisP+4AVM8FhF1VGvzyPuM/ufOjzX3kYKG/Wa15rMM2nqzDVBsW2
X-Gm-Gg: AYBFou1a2QnDcO/tQpUZOqULi4/t4spvoja50trznizOFmz15OpO8KoiFxDNY2sy1f9
	yYirPFqC///y5ZmWTjFrQUJeJlsZfAUs0DDVB0o75uFWq2bVacMXhDvitY/vMRSAAAwIz8QWMo5
	rEhDKxiD2tspLeO/5t8MJcKtMTItSV7Jxh4esbKjHjazYPAxKSsI7mld18xp5yBwlZZi9La4kIV
	YvwYQRi+oupzLK8EPr8DNZv3tx28yebfybg+FTCrTnTHXTgBvWaDO3+tgBYBpNk7MBVM6vAw/h1
	afNqeEVEUu6wb+n8LjblQQSksshMuULEAcqDN3kkhmUGerBgS8gpWTT/HPZ3LlZguRW8fJxxwd6
	TFpkeZhgsA+xfLvkiQZh6mw==
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr778730885a.3.1788423502404;
        Thu, 03 Sep 2026 01:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr778708285a.3.1788423497214;
        Thu, 03 Sep 2026 01:18:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm50161266b.35.2026.09.03.01.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:18:16 -0700 (PDT)
Message-ID: <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:18:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as
 NMI
To: Mayank Rungta <mrungta@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vzXVDWs22pHRVtuKMfUyNoriiAa4xUqd
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a992d4f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=9ANM9Gnv0aYF1O8oay4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXyPLNo2Aj2gPW
 Q+UHedBW3C2CW3bpkBJ9pkyLKSzPngxLtRo75bXsPCZ7u0gRV0nXPqbpeM3GJdl6B8mGLAtlZIM
 E0jLDnhW9UYAqYKSArcIsdy2TG2EaKk=
X-Proofpoint-ORIG-GUID: vzXVDWs22pHRVtuKMfUyNoriiAa4xUqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX/UP4jratGPXP
 kRTvZGMCBWjbZDzpB80g7KivsdD+QdzYl3eLyRBW/uolwBsVHG+BQ+GPLFaNI65jpMoyfT2JzHr
 PlG/epUVqXo9VOdSNMdvSmjrCVzT9XFGHpK1DotZ5PL1z+B04wRlpk/G+FfdRx/lDQyhJ8y44rf
 EHEEg6Flxk62k0p4vhurJnydSYpQyMA1FEsbfhhA6pPviWtG+9NNuVjqgLpXYMelsR3yqV97Sy1
 QB/HWlAs5vFsIt7BCQ80lZMt+xnw4iyI7EdVmJzcsd2kN+7KcngaOlY/y/oJSI0r5xhx5iEf33y
 JTUBy4ldVpVEjr+1fVGHyyES6RADP1JVG2ofqjjTCsHD2BF8HIU4DX0Vpd0gmeOlRsJ2x8zhFat
 oD9LLRo10m+h3bRFAKsk+BhnkNgbSvf9aRbvaNvfLMvRnRub40CTkhRtjGGGDdzI6TpyX13OBR1
 S3tWU1bq4OyQNk9nkQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 9/3/26 3:54 AM, Mayank Rungta wrote:
> When a system is completely unresponsive due to an interrupt storm or
> deadlocked CPU cores with standard interrupts disabled, a standard
> watchdog pretimeout bark interrupt will fail to execute, preventing the
> pretimeout governor from capturing CPU backtraces before the hardware
> reset bite.

[...]

> -			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> -					       "wdt_bark", &wdt->wdd);
> -			if (ret)
> -				return ret;
> +			wdt->irq = irq;
> +			irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
> +				    IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> +
> +			ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
> +					  "wdt_bark", &wdt->wdd);
> +			if (ret) {
> +				/* Fallback to normal interrupt if NMI not supported */
> +				ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> +						       "wdt_bark", &wdt->wdd);

GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)

Konrad
