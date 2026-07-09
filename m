Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714283B1022
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578518; cv=none; b=P+s1FjH4W6LqnFyP6v5NG6Op6BB2I9FVRs1vLiRQMq0dmNMKH7ShIWiEdkVLSqyB7j6pfJjd5D+2Bj2D2YsQzSTSLHXu2Z6NtYPRowEsbdvP+mD/0Gf0cwsV6ZrXLoE9tb3Osyeko3w/oSqQDq/5nx2Uq75MIO6QNqjndMSFMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578518; c=relaxed/simple;
	bh=+0CEjRtd8bo9SHhAj4g/+Z0J7Evd2+QTcAvW77dM0AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv/tBgHumAJnW9+FdNeTYjLMAx5jAoHGbQNrvu2jdoweTNvaMgDqtRoqJlSq5YJOLRub2LGryQi8lcv2dd/V4nCzX27pnRmI6tDkGDICWNc5TAUySctmVFLmVCVa+PzzaZwY1eJa11VzI0BXup57MFFVX9XO0jTnV/2Cvh5IPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuGkr4Jb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+IWx6Z/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuGkr4Jb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+IWx6Z/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669604m2712305
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6rkqMfXLK638vUXHiaFMs9sT739rEtUIMeGGDeaRaw=; b=iuGkr4JbT9ADw3uA
	mXUmcOFWX7uDjojELZtVMUO/2WVsuu82pzhw3sTMP59spjvrcKITavLMQ/+vFzUx
	iMKsNPhdUREk3Hi9w8tbS22d9T2NTteWo3xXTRQBLn7pnHVTlffOnWnBmKm7rQ37
	HU5Binf8tdkKyTdEqzUed+9e+h2kyeTK7fWrevbIp0BCKulC1EDXIi63e7UuwzsB
	2UIx7wJ1DButXX6eTtfmaPbO+YvTjS3eHYE9UZbwO+y06mIHjPRE0QZq2ze5CSkq
	sgY8ZOLVKRj6lUUNKJ51RDQM5+k+DLPCY2YJ0V/fNAIOJ0k5wi5ZoloNMyqae+zV
	CTgzaw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vg9vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:28:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so667403b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578514; x=1784183314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6rkqMfXLK638vUXHiaFMs9sT739rEtUIMeGGDeaRaw=;
        b=E+IWx6Z/T4gR+TFNyeMn67qfy06F6JMNDJ3W9Hpl8NKOZF/sZtZ9IuDMj1Ld60HfoG
         L1vY5SEfDQ/dIFXyGFboz8fXODSA0gZYmdm7CjDs0l7oSTdRQxYyPvYqDACQgpypSXIF
         aEOCZxq2d8FZKr/uppynVidj47EdjOcVRvWDgB2SOnLXL4jUPicXNSR46T7Z+N2luf4f
         2xNkYDWc1y4gAeRaxiMKrs/cwy4Hg2R1xUalMI6U64NMZCc5QjoOSt/86lRIlxeFsA8u
         xWrYpMdETSXkVXQp8ORvPVsFZdNCT7dRtfNhE+4gkV7++IMCP9APi+ZZaE0pD3MKkcJP
         bTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578514; x=1784183314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6rkqMfXLK638vUXHiaFMs9sT739rEtUIMeGGDeaRaw=;
        b=RNpjaymGcFjij8Pp1x+6Nj9YaWxY19ylqEy47rvJ2rHuWdlTPoIEzW+EqgUPSWTVGP
         05tErvdA15aNgqchT+KdEa+pY23krVaBZgc5k6qqob6YujOslLdSITxHf8tkrTbRRdrb
         j71aU1Vxuz2eFaOCQEsddUV0Am3XLyN3DzqKsYZ5rE221Zc83eAVLLGtcLsGONX3NLzb
         gsdqjjhSZsXnXsSKe/ZVA+lZ3kVs8R6n80CbfxEkYWtscRwGeVnUWLm2iaaYt/tG/vtf
         l580dhJF2U9fwewxMf2+96grm+bnO/LV2KRSIXRmSOWJ0ZEkxMbpcMoaFgg8MUA4ttAV
         i/hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrem6wZJrrupr8qLhZq0ma02skz2fbt+fSNulHtpTjg7JoJh5QEXSEUKoEg4K6MSr+hXvVVYN4dhxg1T+Wn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj56MMqbQbZc6M7Uj0Y14WdO8swq9laBtbCknmlxQh55kMT7da
	6kqXJQgmFejAysDuAGaovKNn3YyhllbTyfpHTw8Wgx6fjK22FTLjtF9cEN568GS8H6/M3sd3b66
	ovV/AMgVOqKB7Ksj+3tsIi9Dkn1+k7nJGkP1cRlaFCIzMeEZsKSHlejzHG95RRFc38StB
X-Gm-Gg: AfdE7cl64yXETVxBtcdRz18de72QkegFquL75bg7SkbKfeUP8jcHHX4g2h/38Xv6TYd
	KMZSXhSr1rtgscTqqgajOc8Oa0cWq3SPpq1L8afQQbfAnY6O3QBDL+/ALjKyX7YUwhPuCftaCah
	MmJS9pNi7Ghrw6bd9SWKucyZpHWi9bHBSY/bbfRlgNuCT3q55jlEE4y8ON2WnHo+YiX2ja0ebYe
	gF+CX3wT4xJPYH59mRydk5zCEEM8jKsnq8jPrlQ7/thWn+j0OVgrYvfVva4pPOJC8yHVv6dqO91
	mn6Yozd7se1qbO5Fg9ML2qMDkHHEyNxQcsdGV387MfAqdnFvCyX5yD5vJLczaZ/6p1NjogYWpGu
	axlMqR0FTqzGNF7+18eDq8u1PKdgSjKUHCXk5/WlLd/SEJlJX8g==
X-Received: by 2002:a05:6a00:cd6:b0:848:30c3:45d6 with SMTP id d2e1a72fcca58-84842ef886amr5946293b3a.14.1783578514269;
        Wed, 08 Jul 2026 23:28:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:cd6:b0:848:30c3:45d6 with SMTP id d2e1a72fcca58-84842ef886amr5946271b3a.14.1783578513823;
        Wed, 08 Jul 2026 23:28:33 -0700 (PDT)
Received: from [192.168.31.103] ([152.58.31.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm8089294b3a.18.2026.07.08.23.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 23:28:33 -0700 (PDT)
Message-ID: <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 11:58:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OSBTYWx0ZWRfX9xNPH7sTLES0
 6YqMCpILMTh0gyYLw7PaKAdknX1a9XMOp3qNb8TIz4UckQcgvimKClkSmeVgZvFP+awhiQswht+
 3HH2boeSIV4Qa1a872DVQS5Cgn7k3yDou0XwnE/tA5p4Jw5/5q4Y5oR2MWzi/UyylRXuXYLWdz+
 DuwqlaqoR1wNtBa31cxXNGvoIDx8jzjxeX40NzoQfnpuk+jcyDLv5oOFe3/OmUKLn9799GGtF++
 HpWMOJq/xkSnfzuS3/s5PMRDfMNN23ZaQBX57DxZsa3W7XGYMa8RkXefi0X7L+vJ6EZnAmH73Nv
 DVNz/Xhd4AXfEb6nGbotRCefoxil87gOfnU5WOaISD6KALfkeljHnm1OTRPOAPrsReNzCz6RS1h
 JIufZJqlOMiCryHIdqlRDNmSjkf+jJwpNT4lebeedynDYYluwpsAqcyof/Jk7n5uWma8Y730wJR
 kN7kgHFsMvU0Kaf9lgQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f3f93 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=9AXozQ6IwN0d4JI31gUtBA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=5GfgTEDUgWdp11RPFvgA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OSBTYWx0ZWRfX2nI/m5jQLhD6
 GN2ZmRiJ6sEnqPn9JBc7QA2LnyxlMyBfdeVnpFbP3mMIQdRyQMo++KHQLTTb50q8ZZdrlu+aZJC
 /GyWvWPZMPs+bG99UZYQ38ZuHy1IYWg=
X-Proofpoint-ORIG-GUID: VycItrAZnWpOYPO2BOfy11obL5MumD4V
X-Proofpoint-GUID: VycItrAZnWpOYPO2BOfy11obL5MumD4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090059

Thanks Konrad for the review.

Sorry, I missed your comments on the v2 patch and ended up posting v3. 
I'm happy to post a v4 incorporating your feedback once the discussion 
concludes.

On 7/6/2026 5:11 PM, Konrad Dybcio wrote:
> On 7/5/26 3:57 PM, Aniket Randive wrote:
>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>> regardless of message length or bus frequency, causing unnecessary
>> delays on error paths.
>>
>> Compute the timeout dynamically from message length and bus frequency
>> with a 10x safety margin over the theoretical wire time and a 300ms
>> floor. For GPI multi-descriptor transfers, use the maximum message
>> length across all queued messages as the per-completion timeout.
> 
> What's the reason for a 0.3 s floor?

The floor accounts for I2C clock stretching. The spec allows slaves to 
hold SCL low indefinitely during internal processing. A dynamically 
computed xfer time alone gives no time for that.
300ms value covers worst-case stretching while still detecting real 
hangs 3x faster than the old 1s static timeout.

Thanks,
Aniket

> 
> Why a 10x safety margin specifically?
> 
> [...]

The multiplier covers the gap between theoretical xfer time and actual 
completion time (DMA descriptor setup, interrupt latency, and scheduling 
jitter on a loaded system)
Without it, short transfers would have almost no extra time before a 
spurious timeout.

Thanks,
Aniket

> 
>> +static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
>> +{
>> +	size_t bit_cnt = len * 9;
>> +	size_t bit_usec = (bit_cnt * USEC_PER_SEC) / gi2c->clk_freq_out;
> 
> mult_frac()
> 
> Konrad

Good catch. I'll switch the calculation to mult_frac() as suggested in 
the next v4 patch.

Thanks,
Aniket
