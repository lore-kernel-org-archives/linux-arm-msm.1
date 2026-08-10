Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED05348C7D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349028; cv=none; b=Hog7gGvD4GidPzGvLO1NZLerSaQ7UmgATGwSRUwWT0W993eskbnHEv7uAUbjr5OU1IajpeMd6dPw6Vmxefmtj2PUSbewvCYX7mdH1ouM20+4NalFiVMOYMmZXhy5U/Hge0uefkiEMDodgZ6K+HQWi6v76EvMY/lhNlFXTY5OYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349028; c=relaxed/simple;
	bh=foWs9e24w9qPUIsKEA7/suDgVJil5cRHU69ADdNXgR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ee+yLA8EkIJ59yrExZTZ/R8dodxmGEnYI2fPjYpJLuMaTJm0AYeZJSUnbuRqDuoYdwSWtgS+BNBgAnb1WMUlzO8mFoFkp/WINV/peymwQGcwlcGLBvtGOFdydNErmjOxS0rNZuS5YL9yH4PdmjSDIXQly2WMzYTrstQPyCaXvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdTnpVyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEYjOHLP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdTnpVyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEYjOHLP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pHVJ1014251
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxKtSuEy3P4FHpzR9BO4tWVvzdjxxUd1uxUCq5FcQ4Q=; b=gdTnpVyV1nzijyYt
	CZqYZ3Ul4Fc2P1pm/QB4FlX/pxzxNSKwIuWKzp3S+WvUShL9DhYIRnwtQjNt8XrC
	kUy4sLeNk/dGiZyPBjFLvSgRqiXjfINqpzNC9v7CBUWiXWOER5uJsgsiWirbwcbt
	XMon4SpKAmT0q1+Wi9zmsnGiMi1PfCOSmAcgSNbGYmsXaqqQfkZ53eec6s/aup/V
	qZUbZqPUsCu/Auj6nr3LQ//ZjMPrTk4nI8nI+lMDD4pMxVFdmN3MiNFPiojYEEMu
	AQ503uAreeK+P6AsAWbjp6x60hfnGD0UV5sQ42j5lcftsTp/n5VnZU2oreABEtSW
	+mEQeg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4gd9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:03:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2855276a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786349020; x=1786953820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxKtSuEy3P4FHpzR9BO4tWVvzdjxxUd1uxUCq5FcQ4Q=;
        b=IEYjOHLP7uq+h3agamktqQe08eHVDA8MyBUs31adICL81kzEOb70TeVOVYjHkSlu6p
         Juhcw43gziN6Avfofc3Va7SOh9G3uDLssb4mmHxD3iFRiv8lfJnpQxwEEKgv9XOUulmv
         wDH90EukSE6HdhQ+NaX+aJcK/92YNiYewOh52r9oPEYmXWuclth2Git14pY3RJrKv9qJ
         mxhfYrOfSfrfmLKJV6TqOBUiPKydqElVPWt7GP+32/pcs7rXVbKHCVw30umb2jxN6jvY
         i6eyqQXdU4K6rpkEvaHwVpmihayb7LK8IsfxMoTCek8kd3Od9w6VAZ3VSNouZ70sJrsn
         Kpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786349020; x=1786953820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxKtSuEy3P4FHpzR9BO4tWVvzdjxxUd1uxUCq5FcQ4Q=;
        b=eiHXYNzMob2wcok+50ncCaIyRN7b30iANMF/HOfiEZRcOdpRn0W3xKF/JwWTWFdp7W
         uF7PcEjW+LyBVCAXUsVB62CBWyE3NDePKjco4kwZBfgmE4SmVSP6BZCRAw2B3NVGweku
         e7mceQAsufG+peGijXJgYUZJyMGC3CjPv5xU2n/DMYLd0RiQGaDoNtSzV9QkXe9nO2OS
         X2jGYWdvWDQWw7CRVu+vRiMANQ/sKKtKuzuXYFrFwvmGfQp7mKmbkn2UWv9QSzwrh1YG
         vDf9mXU+dFl1GkoJldUE0kxeMwo/n1p4row6o86JMr/2K0OL2/D96RyK5QYHSKdED2/Z
         6lpw==
X-Forwarded-Encrypted: i=1; AHgh+RoHgjl4iG+hz5gZgg3R4APpRkc5u9JZlivu0BvW08SeE3U+V2iPkYU6O2ZNXHXoHbKJ7r7HgCd7lnnyvLUI@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSi/RSWXysHhaGlfa0vFik22QLp3V+k8ZNLJbeuhlf4IjCuBT
	A/i7T2dLE6n6qDLt/Yaa7NEQJcYo2ua9YPu4zdrmrwEKqbiDkhd3So99Ih4r2b8o09OVphXw9Lg
	QssOwswuTadRUW/+UBfQ3i6vvN/e84qtwr945XbmNkbANVqA+etv78LCSnNprfYgHqYk=
X-Gm-Gg: AR+sD10NRKunILlrr3ux/wmNg7npFwkeJ/xrgVNkNQIndvf8XjgcMgk29x0+BC9KKhu
	vabeinYFY3HdtwkPRWV3VL9TCGfWmvI3GhNi0tfwGosFskJgkgjROdIacOLj79RIS7sn3dsViGB
	RKTlz3pQFgTJ7JQIl5YWJvpKX9Sls3Ioz1tqZWqLvrk74kDD4ni1Du7MpXow9AuKk2Bg+RvlyE5
	GPGYD7YqToi3Ag+Z9hJJuDfZw6TWS4A2ORxpGfuVhRadezAhp4N1zGz1hHzbp67pmcSMKMRnmgh
	XZmx/auMAzFzOl/xMlMUi6fg/C9IP7CNYPgndbqneAAON7M/H1JKsQc4xsOdLgoLj14KIci4vay
	D7y7dxus0IqPMxgArNwnONMDddw==
X-Received: by 2002:a17:90b:4f81:b0:38c:e9e9:e7ce with SMTP id 98e67ed59e1d1-392822bf6abmr15056748a91.3.1786349020388;
        Mon, 10 Aug 2026 01:03:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4f81:b0:38c:e9e9:e7ce with SMTP id 98e67ed59e1d1-392822bf6abmr15056694a91.3.1786349019895;
        Mon, 10 Aug 2026 01:03:39 -0700 (PDT)
Received: from [192.168.0.102] ([49.204.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm11501889a91.2.2026.08.10.01.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 01:03:39 -0700 (PDT)
Message-ID: <c0716e8e-728a-4364-98b3-a122a5475bc3@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 13:33:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] mmc: sdhci-msm: Use pm ops instead of macro to
 restore crypto keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
 <20260803163123.1802005-3-neeraj.soni@oss.qualcomm.com>
 <20260803201803.GB63318@quark>
 <abe31a1b-e34c-d5b6-4bc4-3733acc56e98@oss.qualcomm.com>
Content-Language: en-US
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
In-Reply-To: <abe31a1b-e34c-d5b6-4bc4-3733acc56e98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uoW2R7-JSLsrQmuailxTxFB0xNymc6F4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA2OCBTYWx0ZWRfXxaKQq5aAeOyX
 bEr7T29zMLwZB2g6W4RjlJg3GnKtTycGt5DopV/dntEaPwCxkgOzYWKNkM89i3N4USknBz92YgW
 4emuHHOfDpicKbYv7uC86Wf543RTpVBtS0E/MbNj6zS3o9kjjB2KUcnCe30H3wb33w+KgFFTV/H
 rq0O2QAcPrYxX6DRqcuLT+RuwrN07Cexb5l+l8H39t9SA63+U8oluBHuOFD0ktZNQVjCYmQrp3a
 OK2Hr0Ca34zdRbu8427P4TzaNw01PtWRfWh8OrsgeE9GpHSGSXHc7YVQkHLFSctNxudWnLZDZO9
 7LlHS4OhoSoxP0/eMj7KnS21yCkQLcGI8/U0llyI7nOl6IT9yPOpopYuE7xwPP7O/UiSBGgUHf7
 r+uEUk2fEtaLUHGdZzTBD4OG1nCYAyVzhkgTsJ1w+vBYuaDc+ynRFtVbfVZhvEL+h6jAYnLomgY
 EALIgAtXiQB/luKBpIw==
X-Proofpoint-ORIG-GUID: uoW2R7-JSLsrQmuailxTxFB0xNymc6F4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA2OCBTYWx0ZWRfX221unjBN5qBC
 yXtuDJwedeBueQAiaUSXXL+rLVSgHUESXkYDzBwvsYSTr0YiqEjmxB8ONFnMEj/DRpWff86muZS
 hXcw5XEG5vxljGuplrwufweO6gJJzv0=
X-Authority-Analysis: v=2.4 cv=W8AIkxWk c=1 sm=1 tr=0 ts=6a7985e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=wB/OwOWguG3OqMiIzyR4iQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RJ2Gkk4ao1b7OKlePUwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100068



On 8/7/2026 7:49 PM, Neeraj Soni wrote:
> 
> 
> On 8/4/2026 1:48 AM, Eric Biggers wrote:
>> On Mon, Aug 03, 2026 at 10:01:23PM +0530, Neeraj Soni wrote:
>>> From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>
>>> Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
>>> needs to be restored when hibernation exits. ICE keys are re-programmed
>>> during sdhci_msm_ice_init() but it may not cover cases where the
>>> hibernation image is already restored.
>>>
>>> Unwrap the pm ops and use directly in driver to add the call to restore
>>> Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
>>> same state as before hibernation.
>>>
>>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of ICE
>>> keys is not needed during MMC runtime suspend/resume.
>>>
>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>> ---
>>>  drivers/mmc/host/sdhci-msm.c | 23 ++++++++++++++++++++++-
>>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index 4aff965f0e2e..f64788a70309 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -1959,6 +1959,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>>  	}
>>>  
>>>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
>>> +	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
>>>  	return 0;
>>>  }
>>>  
>>> @@ -2983,9 +2984,29 @@ static int sdhci_msm_runtime_resume(struct device *dev)
>>>  	return ret;
>>>  }
>>>  
>>> +static int sdhci_msm_restore(struct device *dev)
>>> +{
>>> +	struct sdhci_host *host = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = pm_runtime_force_resume(dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
>>> +		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
>>> +
>>> +	return ret;
>>> +}
>>
>> Sorry, it looks like this actually does need an #ifdef because the
>> crypto_profile field is conditional.  It doesn't need to be a new #ifdef
>> though, as you could add a function sdhci_msm_ice_restore() within the
>> existing CONFIG_MMC_CRYPTO section of this file (along with a no-op stub
>> in the !CONFIG_MMC_CRYPTO section), then call it from here.  Similar to
>> how the existing sdhci_msm_ice_resume() works, for example.
>>
> But MMC_CPA2_CRYPTO=0 if !CONFIG_MMC_CRYPTO so crypto_profile field is
> not accessed if !CONFIG_MMC_CRYPTO. Does it need encapsulation?
>  
>>>  static const struct dev_pm_ops sdhci_msm_pm_ops = {
>>> -	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>>>  	RUNTIME_PM_OPS(sdhci_msm_runtime_suspend, sdhci_msm_runtime_resume, NULL)
>>> +	.suspend	= pm_runtime_force_suspend,
>>> +	.resume		= pm_runtime_force_resume,
>>> +	.freeze		= pm_runtime_force_suspend,
>>> +	.restore	= sdhci_msm_restore,
>>> +	.thaw		= pm_runtime_force_resume,
>>> +	.poweroff	= pm_runtime_force_suspend,
>>
>> Should these use pm_sleep_ptr() to allow dead code elimination when
>> !CONFIG_PM_SLEEP?
>>
> Ram can you please check this. Looks valid to me. 
>  
>> - Eric

Agree with this, we will update this in next patchset using pm_sleep_ptr().

>>
> Regards
> Neeraj

