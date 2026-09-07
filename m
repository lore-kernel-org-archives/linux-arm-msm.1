Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5540A956
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765142; cv=none; b=swoFWUAiGrxFvBYP5/yBP/eXtrG0mVRgEkoyiyAN1LVRR80/5cOpBYbLUr1KhP7uk+NdHRPxpKnTfbCg8326eRYg5lhm9ZCmCh9uSp4+YawXWFfOzC9oN/giya6tj/RxiE0cv5HNrtnpRhYsYqAM4D8qAzbp9y9+XxAV/LtM8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765142; c=relaxed/simple;
	bh=yglyORkEaECpaRPtBKgDRr/qQczgVUyAlkhYS5WasBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnnY+nIg/A1S0zyetUr3vFj6iznBX4UKuu6LTjwLLiGAJt3OvuHL7SWmxyNxi8k36hnUBocyNtIIyTP8IuFpmWQ9Lzw3YAAX82V3kHqirAbBaJEEB5KhF5Bk8bcMA6wUAZrwKj98vlpT7cuZdOnt2gLvTQOUqmwwxr3rfqKbotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TV9/TOZ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMUpHSXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV9/TOZ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMUpHSXj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777DVH2838540
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZM3soZ3hznMEQjXbEQyzzQP5KyN6hV8ZHITcwWZ0G/o=; b=TV9/TOZ3sHi2ht0P
	24Y5RRt6lom2GVcTRLLWn+o1XtVqpt1aRIcyxJQWnnJJozSnpjfAkVQ5VE4FhVpS
	1uxroGkAhqWFxtejijfV+ItKtwinDTuEfkxVlvrtibi5l6f+VCAbsljhpIvPSIBR
	ipnpcrSTRaxOo+n9IPYCA8cddQZeB7fLSCFM4uXF7X+WqbPPlMENVNpv3mUJBWHr
	HQHjRtN6tIaj4I6XjnuOvvM3VpXXBW2b0sytgw72dL7ZNV9vQU6FlJGTATDq/JWN
	LLZU+TGJQ7uRPkDez9MK0bCle9EsyzvlNSs+Y9ysROL3dO6ch36ungDZnXF3+jyR
	we29lA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuenjcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:12:18 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f36427abfdso4521285a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765137; x=1789369937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZM3soZ3hznMEQjXbEQyzzQP5KyN6hV8ZHITcwWZ0G/o=;
        b=VMUpHSXjxxgr4ATsutLHFVi+hc2+VnT94G6gCcuOUEkfgN4DSEMzbOODlVH+kcdlCs
         QqbTRQSS3fVa0WZlSqAXxFHUlExV0pBSQqq65Psy6KihKQ+KDGx2pQnf4oNLZIPfLmG/
         nRliWuRqqbko9Br3N37Vt0kxyrKYaF6vSNXKqo+RVU9cgaoRcubjuPDBhle0k+wgzG32
         1FE8nyJFm/I9q01a1/xKNAolp/0PdywWcGw+J5Sk+p2OL39b0uI7MlEbJfpZdYp0Vr9h
         e0b1YeTton5wYl75xdKZ9Fg9KfQ+th2IU//MvpYkuMwsqNLwQmR7jxXlTf+yJnAPCaAR
         hLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765137; x=1789369937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM3soZ3hznMEQjXbEQyzzQP5KyN6hV8ZHITcwWZ0G/o=;
        b=V7olhnvXskWAZ0GZrRWADNCXKYDOXUohCiZtPDIdQrq3vRss84bhz8qW8upV5DMmoM
         DY3cd5VK0d4nWGJ/3N4VB71oBH4+9F6jrNxVVuaMhipKybyqOZqUFEFbAEFYLIts4q3G
         JX3b12d6y6fIozGzeOHydnUdjaybBbv08i6wM/O5QyfWRhDc5VfF/y+tcfHkpN/jJiqo
         pyOYYdZbHuFGRYFeIp+EwT2/7KtpQFpIQAC8W4vhyVyngDhSyJTIjzX2NWukGS/2PgKE
         z1W6VL/32Ry0uj91D9a0Vjv5OYY2uHKfEPEoYVdL9fTK/s/wIBqFJ19YaqWlTKeU2y7v
         ADTw==
X-Forwarded-Encrypted: i=1; AKwUvBypptj6/3mqcQ2OmGqv15GSRMFvNxRcwKFA1y2RFzafHtDLcc8QbiVHetxLaJguituWd8K82r5lWkdaISpO@vger.kernel.org
X-Gm-Message-State: AFuF++kjQ2r3Sc1KNovXJ/3X0rkqBphT2lbvCbR/+RVktcWZjKWV5Ufi
	BoJqpEz4tcTuoGytdsoGZKV0RnD4HgQw8C/JerSQH8LSgkNsH83uS3cZdyINZMREVvt48Z9mbOi
	98iK/HF8l+APUI8MSRN6w9PSlvwh73F0CZcm911ej8zk4YETHRstzTNJhUZiQpmTXB/u1
X-Gm-Gg: AYBFou1vJUcyCy4ijtJ2et3n15izgSxEaAhCeHzV4XHBBSB88k2KmzKQyr9bLF6Pt79
	NSleTEkdKb8lHeO384oUGAteV4BhjH7wAvtEkzbidgraaMIKz/D994QcJxFCWuy2ruDzMp6mxY3
	gVKYRB+Xa1AbUjAmRT8vwWhTbTHjPkdE8WBranTwxSqcbOR4SpZACF+chS5YYjJ040koCiS4+HJ
	w2bzYSGBeP3sHwlrqxmbKM+NjPG/3N/i0Y7XOkz9A1esKaqdxS7x3Lz8LLqI4mziTfaemh95XYz
	tqIgZWo9tw97BoBHI4K81o/Hm2SduZXxIbc1EkvJIhKq3/85zNRcuIO9g+5+ESlQiSCEDqM6qAu
	fGrUzldNvShZeRm/N3HV3HiD7f6loVxW4Tw==
X-Received: by 2002:a05:6820:2017:b0:6b7:46fc:1d7 with SMTP id 006d021491bc7-6b746fc0274mr12032600eaf.54.1788765137524;
        Mon, 07 Sep 2026 00:12:17 -0700 (PDT)
X-Received: by 2002:a05:6820:2017:b0:6b7:46fc:1d7 with SMTP id 006d021491bc7-6b746fc0274mr12032573eaf.54.1788765137088;
        Mon, 07 Sep 2026 00:12:17 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm20894869c88.12.2026.09.07.00.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:12:16 -0700 (PDT)
Message-ID: <22988ce3-280b-4ab3-acfd-921e64e137ea@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:42:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] i2c: Add dynamic transfer timeout based on message
 length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3NSBTYWx0ZWRfX8bI11LkG1gOc
 H5qLQh7EJ9uM0b2R7Q75wefo7ejFNeysFPgUu8g5Q9HHY7kLqj/ANhWKNWu6YBvjvcg+CPlVzDJ
 uDlncUwcIHyADRjvBx0RDvxkdQ4aVDHFt4NswvqIafQ465bXu3clvnqGP4idZqM2zeK84DfXRFp
 rHI7OV7o6h9ANMIRUnrY1tT/V4xPqT8bPbzJ/ny+5st5y+Xmq0kw2Z68zR7mznczRwSPpqZ/0qo
 WGplujWyIKnO8l1lGf3TwNG5u4dTJLLlMq98VgSBN6vJT1FtQ3tcnxk+2ibAO0fJ0kIliWKjZGF
 DynR1JQPGPMp8dgTH64O3QSlgxD83yCXI3Ng/nB9X3gYV6HFgPRcBp87c3FvK7NH5SnkJpklxh8
 ftBeRV3X3RTLA4sNb/D2vyPYQT/ILi1CDDiw2cenbEH2ANEYE0fOxCpnzGWobbIDHwrLmual1vi
 MnesFOREdL4uD9sMiug==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e63d2 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=JvO64EORAAAA:8 a=T5o-j7h658XeM3NHuZQA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Qz6KxWHdQ2_aS5WpiCfK:22
X-Proofpoint-GUID: 1trMxagK94hjLm1RmQsKDi5cRGGqdU4A
X-Proofpoint-ORIG-GUID: 1trMxagK94hjLm1RmQsKDi5cRGGqdU4A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3NSBTYWx0ZWRfXxaxfXUsi6M/Y
 rMrJAuHxdNQ5rkdTYdfQ8jtLIjDTHF67ULcya/G9Xh+s4upc4WLveolgWXTUys9Nm649qtPhoa9
 9TY10xS2+wu4elKbduf7HhPYLTa7x1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070075



On 8/27/2026 5:57 PM, Aniket Randive wrote:
> The I2C core and many controller drivers currently rely on a fixed
> timeout value that does not account for transfer characteristics such as
> message length or bus frequency. This can make the timeout unnecessarily
> large for short transfers, while longer transfers at lower bus
> frequencies may require a timeout that better matches the expected
> transfer duration.
> 
> Introduce a generic helper API in the I2C core to calculate a
> transfer-specific timeout from the expected wire time of a transaction.
> Store the computed value in adap->timeout so that both the I2C core retry
> logic and controller drivers use a timeout value that reflects the
> current transfer.
> 
> Keep timeout policy decisions within individual controller drivers. Let
> drivers provide their own safety margins and minimum timeout floors, and
> avoid exposing those driver-specific policy values as part of the
> generic API.
> 
> Convert the Qualcomm GENI I2C driver to use the helper while preserving
> its existing timeout policy. Preserve the static timeout behaviour when
> CONFIG_I2C_DYNAMIC_TIMEOUT is disabled, and let a userspace-configured
> I2C_TIMEOUT value take precedence over the computed timeout.
> 
> Suggested-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
> 

Keep demarcation here ---

> Changes in v8:
> - Compute GPI multi-descriptor timeout using the total length of all
>    messages in the batch, since completion is reported only after the
>    entire batch finishes.
> - Guard against zero bus frequency in i2c_update_timeout() with
>    WARN_ON_ONCE() and retain the existing timeout as a safe fallback.
> - Link to v7: https://patch.msgid.link/20260813-master-v7-0-3f9010cf9229@oss.qualcomm.com
> 
[...]
