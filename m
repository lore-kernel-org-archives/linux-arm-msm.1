Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295144;
	b=Rj94f+cD0RB8uGTZ93+zw9gz2klYp3T/iYd/+djGSxYa5YpfnFhieUsd5Q+JqGIgLoqq
	 9OQnAhxzIvQVa8vxi2TBj53Tg12vnratwjITcpyB17Zl6vqqVMQYbbh3Pn6uFNiinYOvU
	 uQ6mPKiRRuC707081ESmndWO6F7h7lZEf+ohi3q2HjcgSrcqEt38eMVv6YGklMpJbEF+p
	 koY9ZboYZUR3t5nbl244dor66e4noJX9MVlQFKszU3fCdxZAPshKzl/+vNrGq3XD5QiYO
	 HKuMAzHlwI1VMgpQnUyouwyN5I1GCa2CvxYXQpzupRrHMQK2zfQXzocT900XB58SJPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
	b=VKK8p2dwsmzSvKAoomkqpFHRo7qxTyDp2zCxcDoGGAtHCVtU5C/OKUpGAL5Iy6rG2hng
	 +Lok0KbrhQy2it9FP/meDCrstmX+zHg80PhHWmTpRZRlR6S1Kx3Mm1tK4iDK3V03mHO0x
	 RJcUmpskqhhcRF+b9Mi8e/kMAfK1prcH9ZtOAnRDe7YRt+NhhJF39JYsMOHYY5Gg2Kewp
	 3Q4pb6UtekqeEGE/b6B2aLBGlNMC6kLC/IOAvEbSEC8wwJL+AWcDFnSaanciNYf+GuLyj
	 tqqULanIG27hR+CXc6Jgy1O9phgP61HRDHVEsGZYwUX1fUDvfKEATYuaaVsRp+xzspQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QC2V6mey;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJtWcF+G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050B606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9050B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QC2V6mey;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJtWcF+G
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD3tx1143411
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=; b=QC2V6meyZl4mc2Fi
	Xk7S9Eh6zFOo0p+Y6zQUF34RVIwoVCSM/pZo2ea4+Lq4zXk7LNPjERypZJ40f7HJ
	UvMVpv8EOBsn+KLbcOhJkMp0z6j3x/wHs187VCZrJZz/lFaRmEhCe0lhTj/25Pr7
	WhpX4rLkVCOehgUTamolzVNBlFhGTjYbFuGTjV2LtdpfR798pSGjsGoQGHAR9J2e
	zPtr+wvVF2J/SkfBdE7CwhZychQHTIdmoL+Tvhu8oexEpmrJNvAN3/xGKmL97D2k
	LwrDnAmqV+Qqj/GYLha9C0iZ0HKiVcEO7nmRRdQnGy2L13TQ4+TLkdM92IQFn97a
	qIXa5Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76chk3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso1375087eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793295142; x=1793899942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
        b=fJtWcF+GkOFY5Q+GhjJhwqYobyF3suDcOtmEMmqMWiRCMcsQf9iMV7NfDSVqUBGNKK
         TQBBtB6LaIK2CLjVOUZdAwdL2ERgvc2lV97YPxSlFAtmTHyN0taqH/OO3PITZfRx8S5/
         TJby/Is4tdwoSWL+yP0wu8uRMMgnzqFnjB6sz3BJcVI45Qn0eR9tBglw/hmBlgeIQLrl
         TTDf6X6o33hgDrWf2mYK1Qyrod/Ozv7VbK79Fc9CVlJbdYhu+v4eoVMQYb323ElKhGCf
         /GutNqEYp6bkvhI7vr6CEOP4Np8rY/J4Oi7sozh+dqmtkJtN3D1GN1frUP0dnH5ac1DU
         sYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295142; x=1793899942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qT91HFGy7t0ktVvPcHZxfHwE/E5wbUjgVxp9MS7FMZ8=;
        b=ZFQ6EVrttNPNqLUNa10cEwWPg0E85p3NUjjf629azET/Z7QMv14jP0KqMpMSO9i3qS
         1pWCxItTfFAXghHMtB0ki78OhYuY8TJCxKlsRPJ5nTzIkAWoK/gI3Ez4KNyVN+4Ewkc5
         /pyT8suCKwcq74Y5PuX1F6W8BRZK7ZtA1P/pFopebtRG38JbNnL1riARGh6UTODM+gpm
         LOgM3nfgcXjk2XXXSUySLssiPd+Ez/cE7evJY7A5i5M2eW0R/XZYVSdCxCuwP+djJw3P
         nmJHjn+flegn3cYi/e0TH4QqxAg10rLlpPgU7/GsMYHOvRRo34/1fvKJhKQo2u0f3Bt8
         9O3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2RAfQxmjqx6FYBTFJuNcQuDsLUkEcmj31KoMCPKYJ6R0O1LJzzsO4t0heAkewIb3ww3ubLqknhyj0X+3x@vger.kernel.org
X-Gm-Message-State: AFq9FYKfoRVwOpnj61kPQhaGbZpRKqG8M6fJbkzObczENqyZQM5OIO/I
	1oZJTULPGLpVPiSMfDblLWuYaukjUnwZkL/lCI86YpeCCjBkhAjMGGL9vQOOFbNx03vKh34Sp1X
	OPQXExrrlQVPzSb3JYssmg7Ld9kOehih3o5uxrM/KIMbnGPgRPMWyh/qkq+WrK1ZHyBT4
X-Gm-Gg: AYBFou2Dy+mPXkydJTyLt5ndBZt16UJRsRBnpqS7iNnC0eW6X4ZryA2zMG9r3Ry/Dis
	R8kymeqLhHKDpgSe/1u7T+ZwoDVBievpvL6zapmz2QDI5PFvcwWgM1/2eRjOUYGsvO8419hsjod
	sWQbpRBdQvY9AOYVfFfeEmaUnl3/UKJ/C3HBiPtWK0iTCB4zmdw0z1lgdA0C5mze5hhPzWPmsUu
	62ontFKYgC/bJAwOrhYLRYQxOr+wnkMMBIXc5Zd4PZalSth/JIaYHYHubXlxQq+b+nROVabepPb
	sHYTjzxYQ+U4UW8+45jLWMxJaE+ep717S8D1K28DxU+cVUwn0IXuSLTlogwAQXHnxXRQXnPKMyq
	sj84hJG6MU0eYYKuI0YA+ep9BnrBN897e3noktrej3nFpHIuIuVwMeywA9V9dNrpRinA6kNwuhf
	Wa4WCQDUuB
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr4479409c88.14.1793295141571;
        Thu, 29 Oct 2026 10:32:21 -0700 (PDT)
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr4479382c88.14.1793295140986;
        Thu, 29 Oct 2026 10:32:20 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm82433c88.9.2026.10.29.10.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:32:20 -0700 (PDT)
Message-ID: <e5a01a54-a619-4524-8829-cc19289c057a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 23:02:13 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: fix PM ref leak in
 swclk_gate_enable
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ntFf227CY3fdueL3tq6XTy_CuK9ppJ1_
X-Proofpoint-ORIG-GUID: ntFf227CY3fdueL3tq6XTy_CuK9ppJ1_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX1PpsT4BSdp/3
 C0mwuF0/p6M34na2zjEDifpix3WAd1VIcwuEatgRJXe1NAF7Kl/enZoYiYyOUUDajXdH3PxK/1S
 qik4205i0Ntb59wE9d4gjyPaZ2zsh+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX/sOukejCH7YH
 lWdMVp/qDUGwNP/Da7EJvCdFI2aBn8l33FJ/t5tdgrPo6vd49rOW8+u8UHqqGFV3mDggH4Lhy34
 ecJB7km1v5NSClEAuT347xs0U2YFkCpnoyqqWJpwAzvcV+dSvU0z9pJniufUzKdaNRlwapnvOpA
 Su8tH6g/5fKyn4WRaZP2EsJLucOiG8/c0SRps8EGzbk1an5+cJMgSJ1+eR4Iu40TJgixaqWjz70
 ScBIXQeZPKFj8bqRQpZRJ3S+HHxvXUjKcHDaH/d6x5UdUxptSLm1+0xoAvHHrvVU4Ccy/yHClzq
 maBTHfEuGQkDUrICHPHEIL6KbLej5KDJVl5VPiAAbWthwsR9lVdEa0ACPcwhxIBeO62DQRx/sYD
 pV9RUTOgnfW6uQIGbphKsOZH1F3wpQ==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae38326 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=87T0Mtg4cv8Si1ZwwcsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290068


On 10/28/2026 5:15 PM, Tang Bin wrote:
> swclk_gate_enable() calls pm_runtime_resume_and_get() (incrementing the PM
> usage counter and, via of_pm_clk_add_clks, enabling mclk) before
> rx_macro_mclk_enable(). On rx_macro_mclk_enable() failure it called
> clk_disable_unprepare(rx->mclk) and returned, leaking the PM usage counter
> and potentially unbalancing the clock that the PM clock domain also
> manages. The sibling tx-macro/va-macro drivers call
> pm_runtime_put_autosuspend() here; do the same.
>
> Fixes: e38cbb75248a ("ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

