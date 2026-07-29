Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E64469833
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785344128; cv=none; b=uztO9cFjn0JNJBGRQp0UBdVW4xi4iIwowvQmb9ICUr4JjifCWc+wfCErYx8sdmyH+WSRtqxR63uYIZz0SAGFQV5dkwHPEfJcA/F/cUw+zMBeG+Nco8d06Y2jjA9A1kXJy5xSCz5raf8g7lwEtMnihcwWtHxEQwV3KR9QvolW+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785344128; c=relaxed/simple;
	bh=Bma6knmJIEApzLS1X9HbbsZd6xiUwhMwygm2jjYBAsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVYuYjHPIHpgthAKJZ/V2Gh3A6UosibZCW0HfhXbuHa4aBElHkHKMPvYnZOFrdxo+eYbaND9u5HEMVcw00k10gcrq1jTJvfemZpNG9q6t2kFS1ouiqM8/X/4jkGP1kPM178EzTsWN7hoJtVuhOHfsl5+gSmGUon6ZHVpmpiVZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfY3ddSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H58dLuDN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfY3ddSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H58dLuDN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2SsD2591746
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 16:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=; b=KfY3ddSORnegGDMY
	6AtquYqE0rRowUtwL9SaVDvw/yJbaSf2kyeqNPB/PFzrfl1f9iPAqgzRz9yOsukl
	6GmNLzV3/4cvWv/066RiQGUdpLpJm73BQ2pxg+QxF3iCxUHuoR2xCCR5zz1ccmy+
	fjQU8PWVMIuPVpACvASrBssjypfvr/O//0q113W3LBksWIN5WszoWSn6ObBG9UNB
	/T8wclutkbynluN4LHfw/ohGLhePwQJFzXt045QvV9DNUZQJMky1Br8KFUgc4pHM
	GtAYK/4LtEJFLxQ7nCBoSA648aR3FIOHuIf8AKiL1cpx4Bb2UfmbaTJcZf303+LG
	Mr9aIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08ucc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 16:55:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90795449fdbso2126316d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785344125; x=1785948925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=;
        b=H58dLuDNIgFjc8c+Pu3pj2IjazPoXh1RwuwQ5LxdgQQHhhBOrichreqaMWcYxhm0QO
         QGUHlcY7LX6Thms4RaxIzYHe38ECQGnFpcBlcUdl8Un4q9LiltGF0w+PUPV0zDlOnMde
         jqhWGygExydWphfxcGq+2S3W0lv2+w5pbQukYsrMYAfAREOCBhIiuXCsnAxzrHvlKP0a
         XgaOSmwMWjppfc+rQ6LK+Neeyi5yvCFTaPWJnGQlSGyn/OGWyYGvsFvJGaGaFy0ZfEIR
         vh0NRrhXx8qMrUQJR6E6CG1olMU7C4hngG3MluVkL7EoOWBridnp2eLBGyNoXQ38diyS
         OYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344125; x=1785948925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=;
        b=QcXFql4YkzLux3LJPPMGy0iXaCVJKQWFd5sKqhc25oc/7rcahUZZe3KApio0cA3z6x
         mCXvf9kuEaTuHSUYG+zUd1IHofzbkIIzfftJhs6g/QZhpWW15iMO9oPeIryv0n0i3Lnm
         txjVeqiCNf6XkgEqlTNs9VErrVT8RfO5EqpAQODShl7JNin0NZGf/WpQ6mKN069HCItq
         zBplWsycGFRZiJ3SJKC0QK1d9UHQicMsErpeP5Gn/HAZNV1GliD4lT45VQ7IjsdD/Q3N
         FSxANagqOqkHdoMy3OmyKCp3vABM0Pde+UvFbh9jBIop9za4FzLJfaMs6iXcB6+Qpr/E
         cnZg==
X-Forwarded-Encrypted: i=1; AHgh+RpxeKdKxtaP2axIM78ib77bnsaKSOBuy4wYC+9tzPMNkJgK+cXA2y6tgAC54brO/8DGe/7Lx+oNNv+mIY3i@vger.kernel.org
X-Gm-Message-State: AOJu0YymWpkocPX+x1rD4Sugyzqz0hzFLO0zMyC8TCvk3vD5fTmdzrSV
	LDD9tsbD27qC6wPCXsZpAWforEp+mhmLVd4f8grMyPPEZErkUQANythaC28aUuiWwLJ+jr+I54c
	eL/NWYrq/hKhcsgu1dXdhdMOPMeTvVZbvOU7vtJXBhQrbM1vTOnGd7ClLkpnwEQrV1uM8
X-Gm-Gg: AR+sD106oyNja37Oz6wxhgtbM8yruxgE4QLokeIOKyEtKHpEMt2ZurPtjF7sZkjak0Q
	LWBZ68zALKjmdv0i/56DHxNGIQ1gXuylh2EBTqi2KztaeSO+r0iaSxhG4tPpyzNud98fvivkhux
	UsPFiCJsgRqt3vaAkAavx486DeuUhYhEzk2mTkCxe5ewTTtQHGVIBNSKMmQ3sDQV+7hvJLxRjM9
	U3bLuuOqF+gXpiMt4DyecTm9m2d2YApjyb6jFqcPtvrtIrDWJLL6poLX2XtOpWOp8LyLdkaUYpn
	x+3mdpdRKY+1bbE4JAWaB0mO1YAR9gIiu9aGPeU5gQnf1wBb6GV5ERZnheUk1OKI54yL06t0MZF
	E1IeyOwRV5QGhMH5+w0nY4pSk
X-Received: by 2002:ad4:4ea3:0:b0:907:bdb6:9e82 with SMTP id 6a1803df08f44-9081cb1b92bmr93043676d6.3.1785344124871;
        Wed, 29 Jul 2026 09:55:24 -0700 (PDT)
X-Received: by 2002:ad4:4ea3:0:b0:907:bdb6:9e82 with SMTP id 6a1803df08f44-9081cb1b92bmr93042606d6.3.1785344124049;
        Wed, 29 Jul 2026 09:55:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83d271fdsm143607466b.28.2026.07.29.09.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 09:55:23 -0700 (PDT)
Message-ID: <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org> <20260729145520.GA1702@sol>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729145520.GA1702@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEzMiBTYWx0ZWRfX9FQ7BfQeNx1c
 l6W5oSx6Lvfo80DkM6OasJynjDxhv3gcLAB7VtHH9HppjtGMuUJ4xI0ziiNvXzoSaRrKgotJzBF
 toPCfOpuPQP4bbykvSAicqKFq2o7d7P+vtxdXv7t3Oq1MDY/KurHuuBSP17zDnLKff61lXJrWZV
 9Lcnr0YMMOZismguzmcrPjZ/n7V5v8aJKLbBmyTqll5rAdhNGMKT0/A9XWY4lKhh7PUtpqioKR1
 aPJZ3cimsZtctGm80By06nvbq5YkFtFKKh39FlqDoZJYTptVW45U22BiaMxncEvhm32T+aeHy9Z
 BzYLkJ8QLWPd2xtWqZO87zwkW36vAZ7fH5BH2cdQXotbvmHRgB7v3pieXkPc3FBEunTOdOBeP/+
 exB7mvcqQO2pktsqmE3rc+zCgPuhmTNKOQ8ZLbf2WVwCzx6TWW0JVSPbIfn1awRms9thZIAtMJ2
 0R/aFwomezlfx6a2u6A==
X-Proofpoint-GUID: Iekb_qFOZ6JiQUJ1O6WOdaNCzsBQt_uJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEzMiBTYWx0ZWRfXzGzGkympJj6V
 LTRslvU+Ue4Qq00jiYvATCvzWqjTsiFkUCxEVeSKlHoEIy14PrM/5D3+GHcgBMdw5UAfrKT+AT1
 Ir8Ub9iVPbqBnmhPsKQkJVJB5uCxHjg=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a307e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YPMGcnm5QQmhjRosbIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Iekb_qFOZ6JiQUJ1O6WOdaNCzsBQt_uJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290132

On 7/29/26 4:55 PM, Eric Biggers wrote:
> On Wed, Jul 29, 2026 at 10:02:27AM +0200, Konrad Dybcio wrote:
>> On 7/28/26 5:22 PM, Eric Biggers wrote:
>>> On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
>>>> It is consuming a lot of the community's time to help maintain,
>>>> including dealing with LLM-found bugs, with no clear benefit to anyone.
>>>> Even considering *just today* we can see someone sent a bug fix:
>>>> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
>>>
>>> Another example:
>>> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
>>>
>>>> It definitely *was* causing problems before it was disabled via the
>>>> crypto priority system (which made it unused in the kernel) and dropped
>>>> it from AF_ALG (which removed most of the unprivileged attack surface).
>>>> When anyone accidentally used it, it caused at least a huge performance
>>>> problem, and sometimes other problems too like filesystem hangs.  It was
>>>> an issue for years.
>>>
>>> This actually seems to have been an overly-optimistic characterization!
>>> As per
>>> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
>>> this driver drains the battery on every system with the module loaded,
>>> even when no crypto requests are actually sent to it.
>>
>> Unfortunately removing it drains way more battery, because the buses
>> never hit sync_state and are kept at their maximum frequencies:
>>
>> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
>> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto
>>
>> (it transiently also pins DRAM and friends to max-freq which absolutely
>> kills battery life)
> 
> Isn't that easily fixable by marking the node as "disabled" in the
> device tree, or even just deleting it entirely?

Avoided? Yes. Fixed? No. The DT is valid but Linux can't deal with it
[since the driver is gone]

Konrad
