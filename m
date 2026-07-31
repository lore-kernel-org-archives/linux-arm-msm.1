Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B343CB57D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491605; cv=none; b=eCTRKOSP0KUJvS4D1DNQuV6QDeOMQYM6QhDDT6Bn2H/gmgZ3NPrujHkobbT3TBFVrV3NvwzWYlyDIAUjMcjWfcryc9SUG8UhFLhM+ND1pr+WQkA75LE86t+3IdFOFCaBX0ri+4yLP1Bn0M/ZqhMOw3qRySuijB31lK6LC5cjqxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491605; c=relaxed/simple;
	bh=H1LZa/KrxatxurmpF0jmErkpLMHZVVy5f1CpaCtqq/E=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gFd3AeS8zMN5w/nmnUJ8mWNvu652PZI1lbwipKoUYor3Io/k6KFytm+frAIJ25MaU64iFf13XRk4XBv+FkVIv0Swexce99ELt7L7+b5FXk0Di+u7uIR77WFz0gfT+SVwHm9/sYOJtlnP0MDpPIfM17Bzg7NLQJKxi3Ecty+4dSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuWxOq+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy/6bYYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuWxOq+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy/6bYYe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V9qYSw3466659
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvZg9BaI71518j+dVN+0raZ5nJoSq6JKDTdb3ojUPXs=; b=FuWxOq+vNWU4cliy
	CS+GJZbQ4iGyaIFUYSTpu/ZBuHhBHJXSjWcMo+h596X8DMeMwnkNCLkkzbMkUznO
	qIIi7sCEhQs4xI1X5rOzzi9ixUNOB6c9ZgGjX74tHBgtpv3SId8aCzgb1X34aQ50
	7Tby/eKIZCwic1g90XT6SWp8p5oUaSE7qLYDRAprYPYSF3A28/le/Xw5NLxYDXvt
	lHpbleu36gb2hujIJC8o6tOC4kmmWjuEDcdTx/1KDgD9W+qf2HiKrz6+RlEizqiN
	RmkZwIj5yosqtaCNQi14i3Z6kXQuaglGvNMtjHTLHQrQ1MM/IjwCfolCGBcmFIdK
	ytl2kQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsf2g01w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 09:53:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so1254106a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785491588; x=1786096388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvZg9BaI71518j+dVN+0raZ5nJoSq6JKDTdb3ojUPXs=;
        b=Yy/6bYYeUg6o2w1sntgJBGgvgjI1b6Qzj5GPrEbB57MWoClhdeGeflJR6NWZZXIxzu
         rbMYvdUNhXOjy99INl9CqWx+fwx3Nj7LOWJaRETq921hSxy/YemxiF0HL+vlvF4P86sB
         rlPh4QuVn8X+7eLqpFbWflGHlX00wZGrohPVjH7bQ+tZtcTEZDdjMCCX8UcgwUYHshUj
         jkC760oDjTwMIamBzAtB8Nyni7kkisPIajlM6iQGOm3HGBjja+6ZQjNi6jlap8d+9abv
         CaHSioekF2L9P2QAQ7QbVWdYPO774HF46ScOk8TUUqPagnrkmnVrtjrHpgkj/Uypswr4
         Y9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785491588; x=1786096388;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvZg9BaI71518j+dVN+0raZ5nJoSq6JKDTdb3ojUPXs=;
        b=W4J0h/oCHFYJmk1V1+1Wgi0mWrjC9vOQB3leMoDFi94bvkikS5Tg4NL2wDgYJL44da
         tyOLCGFbZiUkPiQIy19YIsjCTW6Z6JBvf85vaIff7hSlwOyiEtkL+6rfMISopYeS7VaN
         YX4hx9+9wzORdV/ZRHR728FdL3057ZEvpZMn0ycBeTFvoOzZJrsCPSMQVu+YZMFMyt5c
         vOcsJOXx7whOI0bl8jz2rPlxRY3AU6mB/rhCZd/gOEknaUBv0f/kSnTlRJt8bmhKiJou
         1a77Bb45Ae5jnXxzJEveEty8xUVpcp9RrrlOD8gu8voa4x64hsP4wMgHT1vR73S/4FWm
         JiNw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8CQv872iE9YlihngY57sB2J2gtQcjeBeIWYz9VmreVhHNmb8Mv+bEP6pCVdur50rOiz6jU2A/hdwDz1Ln@vger.kernel.org
X-Gm-Message-State: AOJu0YypRPbKKq21ag4U4t9NuYYkw5DJ8D4XAHX76HSF8de+Jqfh49Ro
	Bc3cQX9OqgvBV4MrmxLbijN+rQTUdoszr7LiKMwdOMfehFOG+dAoRs4czWvcJFltAtKSTFlOwoW
	rZCOCtF8rwnyrYpDJU0WYMlSlJABwVULMYMpIp+LIMBI+ccRUOf8tbwhm5yl2QW+WCPHBumY+Jn
	yS
X-Gm-Gg: AR+sD13cTguha8ImvhfKt+AV+PMMs19dwcO7znxSeIQZ7vx8FbRNtmgDxRoHfl2CN7i
	8xF+uE/A4L412BmeZxecxkcoS437q5x5P56HkbWy1NKJydMM7zArd3juVtWnljuFn8A9uC5SGig
	n4KNn7LFieWj3X//kCVSwoIgOtvIz43UVjDouGPwulmmGEfwf8aIQTeyPZcBXRvXllOhTwlYAfM
	RuTeUmHlWIqQbz3XYcSDzRvyPxRW4pFt7SVgd0qaumDDRxUHYP5w2vVg6aRDCXQIJUQqwQVP2mO
	Uq9fWv2utObDXFoBnrSycT72RuKvgAdZAH3wqwzUVjA6rzyYkUHgaQWYX39gTBwtaDRNJa0aS1X
	AkpXEO1O1YcB76YPACCoJ0vTqvSo=
X-Received: by 2002:a05:6a20:a109:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c91b09040emr1228382637.14.1785491587810;
        Fri, 31 Jul 2026 02:53:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c91b09040emr1228369637.14.1785491587419;
        Fri, 31 Jul 2026 02:53:07 -0700 (PDT)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab14475asm1615245c88.5.2026.07.31.02.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 02:53:06 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] mmc: sdhci-msm: Use pm ops instead of macro to
 restore crypto keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        ram.gupta@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
 <20260730140822.1976635-4-neeraj.soni@oss.qualcomm.com>
 <20260730192336.GE3139@sol>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <a18f5699-0337-a4b8-369f-138c140fcaf7@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:23:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260730192336.GE3139@sol>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6c7084 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HjoYPmhRGCijR8R-PCoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: kOPYZQvQkXYENd65Fq3CqabdZDxm2z9G
X-Proofpoint-ORIG-GUID: kOPYZQvQkXYENd65Fq3CqabdZDxm2z9G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3MyBTYWx0ZWRfX+mzGIpgHpJzV
 qUvxGBHtENkEt0kVrQVY4p2nlmW3Kd3WCrGcEo6+44LHnWBxy2phKHtwSn5j29y3swOtMfeAutJ
 Y9p6JMSp2/BtBi5HGoLEElNDKXz6j3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3MyBTYWx0ZWRfX5RxFaXvJFOkB
 Re2Q4iCgwnBKP2p+fJF39z4RzzkpPfixrX3xiqm115PP2kbT7asKJPOSV5gxLwZGuiNhhnmqcOh
 JucQHAEpFv2huYwWhyBnyVbbsnXLxvg9xv+CNCp61u3hCM1J0iOvvIHih6jIKHrYu2+ufJH1N5R
 VpZFKbnXHDwCnTi9LFY8vpPA6FOOcFN2iD0gnCh3j0P+2S63H9Lbo9EmeJyr4ZyaJ5JZVg2+3cH
 Xn9bWBkeOLXXvmKIQr0E56lqBPlbawk9rZg8oEe3nM7x88kSPT/NIXExhZsJStjafBBjAAu5zNb
 4Ojmykx52n1/NUgt2fWrTHCPM6+vTRCBDuVCuhnCP1mM8bHYSXefH2s/cRPKjL7GLpyMt2JIfvL
 jq5jMajrHMzjNXheHx3cSUYI/eeoVZfjd5U+3mfaGo7wnk1+k9aHirXU1I1u9Swk+eOTuQbn1H3
 TKZFR+NBuMMKQOYTb7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310073



On 7/31/2026 12:53 AM, Eric Biggers wrote:
> On Thu, Jul 30, 2026 at 07:38:21PM +0530, Neeraj Soni wrote:
>> From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>
>> Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
>> needs to be restored when hibernation exits. ICE keys are re-programmed
>> during sdhci_msm_ice_init() but it may not cover cases where the
>> hibernation image is already restored.
>>
>> Unwrap the pm ops and use directly in driver to add the call to restore
>> Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
>> same state as before hibernation.
>>
>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 7d71dc6f388d..a4998e74a2bd 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2986,9 +2986,26 @@ static int sdhci_msm_runtime_resume(struct device *dev)
>>  	return ret;
>>  }
>>  
>> +static int sdhci_msm_restore(struct device *dev)
>> +{
>> +	struct sdhci_host *host = dev_get_drvdata(dev);
>> +
>> +#ifdef CONFIG_MMC_CRYPTO
>> +	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
>> +		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
>> +#endif
>> +
>> +	return pm_runtime_force_resume(dev);
>> +}
> 
> Is it correct to access the ICE registers before
> pm_runtime_force_resume() has run?  Aren't clocks and power still off?
>
Ack. Will fix it in v6.
 
> Also, prefer IS_ENABLED() to '#ifdef'.  However, this suggests to me
> that we actually should just keep MMC_CAP2_CRYPTO defined to 0 when
> !IS_ENABLED(CONFIG_MMC_CRYPTO), as that solves this naturally without
> any need for #ifdef or IS_ENABLED().
>
Ack. I will revert the change made around MMC_CAP2_CRYPTO here:
https://lore.kernel.org/linux-mmc/20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com/.
and clean this as well in v6.
 
> - Eric
> 
Regards
Neeraj
