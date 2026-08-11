Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20238758D
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436347; cv=none; b=nOwMAnOS8medSSzdexmZn9UOBvfvN3XlUxXdA/UNBN6d+oAfU6/ICpYDNTQDIuWqekxdrTv7n7CGZTmaqEBfbOmAwVAkmju38qss8xuOTXGfOf+iy6nU7XF+B6HNSLq9VoA5QB0lHOdTjWvY+TMxayxDGR1hqS6rIhXMJ/vYcmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436347; c=relaxed/simple;
	bh=9WYPjPnSCqTOYaZfKb+Y6giAEZRt89I5Sq58ekgoyL8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S+PLbfxFE81UH3YAcNVY3h6JkdPEbiqOWE7Z0oAV2MTpyx6IHfL9tPvQC20n9qt2P8PIwjjmGI6+o1unwoLvpZ3sSvfZGNxgMYoDIm6QwRnCelaLgo/XztQR9Qf2hWWdfCu1/zej6gJ8HhHcbs06lkoObhzlutYSYViN1wu1eGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMRSjrn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8dRe8iY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMRSjrn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8dRe8iY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B72aFo3008599
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuTk3uba3lRMIgMoGuctkRArsnjSUfXH8lZvrtACOT8=; b=PMRSjrn7JsGkMM3A
	cZHzTJh5xWAihqPjFetT90F51SYklRkXgsPLNPU3PenvZatA7Xx//rzZetkTeowH
	Q/U3xnTnV5osqz2SanZ6tJ4FKwcwFqq4KXUdEKThPn8H2oEwVhXw4UEZk/KrwSf0
	TVKp+5IyukowhiAYCI/Y7dR4zuBBUjSFLS62D9nE5QP8c6wt/hFtu4fwHn7tXr3Z
	0A9X7lGmnlH3/EYGkg6BcjQjyJF3iURZWw7wKDK0kzkRBJKF8SRfIQd/FUJzzrFc
	8eD+6ySrQ4rmhMFMEyohi43JAXnOuE+TJhWRSPnJm/L7x01e5O83w1ngubIuI/uZ
	6lWI6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjtk3t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:19:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso4217454a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 01:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786436344; x=1787041144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuTk3uba3lRMIgMoGuctkRArsnjSUfXH8lZvrtACOT8=;
        b=U8dRe8iYJHopWh/9YI8SRGHaIw/A+nhhTzXx9Q2oh7eTW0SqaqA0UBUTNLq1wtLmmV
         N0DE2RCes/SojJmqtofv92WODwJdIOwuSfE6UKfDp1JwfqPD6sGgPzBxKqVohYRXFUKr
         9puLY1CvMcPVQgWmRdN/IEXKWGfn8I+8KtWTuSNCkvG6IVvQznAGZoqQtWvKIezr53sw
         DTB/V+lNPetWSC8FvaRv3KiZSeTcadkChdIPGLCIEzeTDpFCG9xyGrHSKqBbalicdpjo
         YhnPYEAxarqi6BRjqHI2xuJAJjZZ1PDlbClhRn2HWIImCyY8ZjZn5xoAhXcrMPoI2So3
         pDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436344; x=1787041144;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuTk3uba3lRMIgMoGuctkRArsnjSUfXH8lZvrtACOT8=;
        b=eh8JA0kQOuGM8QjhyGXMobeOPYDFUFKFjqDqiVFyJZIvDwlAZy2Lqnqs0v41mPh+A7
         1D8H3bH4j9vXHgEp5TaC5pPclnwkX2vMSYI4BUtmBbYE0EFsNZFc1l1uyGL4DF+NwwqP
         CkWKdO4Vv70C9fLywnlVVwZ5dZ9eccYfxATS93q1WYpCAwYbl9ThakEltAMNhssF+9w+
         1x+Ky27a/BG2CmqZNkw8XNJSKKfWl3yNb5a9hCguVT84YRkAzcminiYY8yy78QPH+9Ui
         TziIfwtQdp5l9ogbQFVn/jAerUdPgZYlY2pfafWge+/sDgrZMUKFnONLSKvFS+QcRMiL
         xzSg==
X-Forwarded-Encrypted: i=1; AHgh+RqTG0RZGibmOCgnGIGk/bYib3EU3fJRy6zSZORVQEQsm/RvCI+YikHPYXdZ077lW1LMc800VIn6Dy7VXN2g@vger.kernel.org
X-Gm-Message-State: AOJu0YxaXGQ2zFn3CA8QIQlENIhVAXa1kkF73A+6oIbf4gueYGgYriVe
	im+2aCl7CTTwO0oAXoMZG+ZBqwJC4IFRRKobhQb3GhFKmsfac4XkgzE7YT3eX9VybiJ0xNeaXVh
	0O31x6Hlyp5a2SOdMtZM0wXSvvj4Berq2+l+1m9qg+vC1z6atrt7gkvLkDV9+IrsDDx1SFt30PN
	SP
X-Gm-Gg: AR+sD13up1vYV2h+FG91TbzxKYbVcGY+xi19VHcDOje5RMQPQiM99p7UqABx6yQBu1K
	JjxKYH6kSeO3iQywoHxmzRwCQtmMIdnnP4+a9u+ARzpyMjNk9I7YCdNxkF7885FOLUVzmZAizZt
	QOVpjKXUswTMkykCPg3sHtZnvK3gGs2sTRtKgf7/2G6sT9JCncUKVQEqkZ/PDsCF+vaMAxpPjnP
	JRz2MtFX+y3b2X7SAWKcxHkmCQlbdvzbI3I168Iqy99retVKcWLySNRwgK45bmraOdM438MU7Sk
	ljkYfp9oaVdN/3uMKhfKC0n7wTVT7W8yKT+5kK6kD+dV0hZdZ3zbfJ1k/hkS8RrlJaPPuQJQEGy
	n3NBRJuqLLP+c2y8A1t3QRhSwcwE=
X-Received: by 2002:a05:6a00:27a0:b0:848:469b:3d19 with SMTP id d2e1a72fcca58-84fa8862242mr1174660b3a.29.1786436343999;
        Tue, 11 Aug 2026 01:19:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a0:b0:848:469b:3d19 with SMTP id d2e1a72fcca58-84fa8862242mr1174623b3a.29.1786436343523;
        Tue, 11 Aug 2026 01:19:03 -0700 (PDT)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa919482esm319894b3a.12.2026.08.11.01.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:19:02 -0700 (PDT)
Subject: Re: [PATCH v6 2/2] mmc: sdhci-msm: Use pm ops instead of macro to
 restore crypto keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        ram.gupta@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
 <20260803163123.1802005-3-neeraj.soni@oss.qualcomm.com>
 <20260803201803.GB63318@quark>
 <abe31a1b-e34c-d5b6-4bc4-3733acc56e98@oss.qualcomm.com>
 <20260807170007.GA1172969@google.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <e8e3a6fe-debc-d412-08fa-04ff000455b6@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 13:48:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260807170007.GA1172969@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA2OCBTYWx0ZWRfX9ZPhR4+lpo5O
 IdUzn37fHrcd/4MR66FlgP/btDWPRiXvzduhir1M+mVOVPxHZelqxEe9npjqvfRGU9hR5nMZRYq
 YBZUlLBNA6IsBFYuupSv5kAAeGL7/QOxg9Ykm8gplyeRm4n+sTWlXQ2K3JIrmel+653whxFtPwn
 elE594pWDOxTNtamLjzO+oMj940VcGxRzmNAsX6TGZnYfRzu6fd2S/ifQ8mbl5wWafY5cEulRqW
 v+DI4oBRUmrHXYDW7kNB9HNG1lZbchVgCXlQz2qPzJMKikTjcIVtZRR/IeEkKYBBbZwloKro3Vt
 HybN7FbzAbxm8KN0KUTEJRVajsyHp0O5FCgHHe0/qz4LGWcAql7s5qkviff8gGbONI/KKJMFH7r
 TlPcI+hX89PZJD99DNpzctdqe/E5w8lKJ8PCXMdNpnZJNXucP6CeEHsvKTRQjhQJCYxUBg9Ap+7
 VKnZzlJ9Et12aFD6h1w==
X-Proofpoint-ORIG-GUID: 7MVAyEgvBpI5Og_smFsYmgyLO6KdlGlW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA2OCBTYWx0ZWRfX52hk2fGmse/p
 4ncvCg18Mq5aqaItpaoBGhXjzM/MDzPNnN01yy1I/msMR94xqBzw0pn/RXoobHkHDFsbUuCxjoL
 l0sCM42b2YRdH6yvcrdfLmDcgdhcfOM=
X-Proofpoint-GUID: 7MVAyEgvBpI5Og_smFsYmgyLO6KdlGlW
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7adaf9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=brWs0jRP4jXds20Wf4MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110068



On 8/7/2026 10:30 PM, Eric Biggers wrote:
> On Fri, Aug 07, 2026 at 07:49:24PM +0530, Neeraj Soni wrote:
>>
>>
>> On 8/4/2026 1:48 AM, Eric Biggers wrote:
>>> On Mon, Aug 03, 2026 at 10:01:23PM +0530, Neeraj Soni wrote:
>>>> From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>>
>>>> Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
>>>> needs to be restored when hibernation exits. ICE keys are re-programmed
>>>> during sdhci_msm_ice_init() but it may not cover cases where the
>>>> hibernation image is already restored.
>>>>
>>>> Unwrap the pm ops and use directly in driver to add the call to restore
>>>> Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
>>>> same state as before hibernation.
>>>>
>>>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of ICE
>>>> keys is not needed during MMC runtime suspend/resume.
>>>>
>>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>>>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>> ---
>>>>  drivers/mmc/host/sdhci-msm.c | 23 ++++++++++++++++++++++-
>>>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>> index 4aff965f0e2e..f64788a70309 100644
>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>> @@ -1959,6 +1959,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>>>  	}
>>>>  
>>>>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
>>>> +	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -2983,9 +2984,29 @@ static int sdhci_msm_runtime_resume(struct device *dev)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +static int sdhci_msm_restore(struct device *dev)
>>>> +{
>>>> +	struct sdhci_host *host = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	ret = pm_runtime_force_resume(dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
>>>> +		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
>>>> +
>>>> +	return ret;
>>>> +}
>>>
>>> Sorry, it looks like this actually does need an #ifdef because the
>>> crypto_profile field is conditional.  It doesn't need to be a new #ifdef
>>> though, as you could add a function sdhci_msm_ice_restore() within the
>>> existing CONFIG_MMC_CRYPTO section of this file (along with a no-op stub
>>> in the !CONFIG_MMC_CRYPTO section), then call it from here.  Similar to
>>> how the existing sdhci_msm_ice_resume() works, for example.
>>>
>> But MMC_CPA2_CRYPTO=0 if !CONFIG_MMC_CRYPTO so crypto_profile field is
>> not accessed if !CONFIG_MMC_CRYPTO. Does it need encapsulation?
> 
> Yes, because 'if (a & 0)' just makes the code under it be optimized out
> and able to "use" undefined symbols.  It still otherwise has to be valid
> code and refer to declared symbols and fields.  See my suggestion above.
> 
Ack. Will fix in v7.

> - Eric
> 
Regards
Neeraj
