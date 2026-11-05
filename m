Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865396;
	b=mwEycLjSM8wZ4u5SlIfv+Xuazh5x8ZnEOF3rnAXdgubu46/WqI3e/k7g5HOfnWIXGCB0
	 oPLgFsjy2gN3Rk1N4WNpFo7nkvtIJu+NNtq2f4QVE3QwUH59LJOtDo932xUkGsvSiyBbM
	 YPefghYZFt3lyR1miFWzSwtmCwFl0bVERR/auHg8A2PpHxe1c5dAKvMS+3iVFIWd1zsMf
	 J6Qbz6bEuCzkxOSRqfROP2oohV/uAA/L8icvn+6kWZP2EW/Ma+fRs9B8fPHWszwnDlDeO
	 786XTA/qSgnxr4U72ICWss7gPpJVaydFtaX7mjc3Uk6gVaOKnx9h2irCJMFWIyr4rtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=;
	b=Ao7g28l1WPm2Qpx1O02uZOmpsiU4EW5qjWzbCA+91NMePVifuLfKCOHf5v9rbi0K+05d
	 Lm0wIJhRjmsdjTwcfa/tgj5Kmrwypn/a7Zxf4fZIg69ZD/uEy2tW2DBjpRFB6JsJ2QKFp
	 MbmmrexJJP0uv6LzKFuzJN4MBo+yPbfmXFpL7oGUgttqvH4wnl6uYAa7fTZTRK7u2u9Bq
	 Jso8B5aLi6vMVqj0GcbNtagcSg1aE51Ii7ThL52j0bGE+h3URcKFXRMYKf1NV47Y7TUZ9
	 L+DaEyqW41fK0WRmP7EgtnCrVTYA3gNsB78b3JVUxhlz3HkwfmhRWWHCqwoas9GR/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzXoREhe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuQIVIwl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8223606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 07:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8223606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzXoREhe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuQIVIwl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UZfP595351
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 07:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=; b=XzXoREheXEpQRakN
	/q9jPyWh12BhXBC6alrTAsQrOLIp7y4u08x7CBCCwFIKR6POxc73uQE2VS69Oyxe
	TuLUVDgbWPgL5RlJI8k9jdvRM6FA6yUl4X2vKpXUpFI6pKUF7C2yEtLZ99aC9y8+
	Msp0cdsj/hBmInT30he2WKYPebBsOZ8qSN8NPhjGFQCKr/szkHNLfaAmjlTGTHYr
	M0lU9cts9pr8eAuNnrd5ZPT6d188DwcBjdXpy/ggqPSwMNP17dD9Jx0F0W2EHfd2
	cCskNBk1jPTvTHpMhG+fmuFSlDiMz63eCI/22qdciYkr3/6QxP7RxCR4vsnrRvNP
	LkrS0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3b58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:56:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c4d46037eso2317186d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 23:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865389; x=1794470189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=;
        b=WuQIVIwl7XPYs67KhdygZuhIgct2FJiFTvcbfZVTDEEcy1fMemhrK6NlHlyWypHSCb
         evfJFqaDq/uGGSWwESRXGu5L8OuEKyq0CWHEjReTXvmRdceOoPxRvXrQWmoZqRPLrNeT
         GrOFy4Hb6aa5Ea+DWX3phbKgrkILKZjW9q77GDfEo7fX0xgrHkOIV3r2HKdBJHrSdbrn
         PJj3J1pFbwZ7VO1ubG5QiieYJrv3cFP0hDAdLih1a90NSh5IDwwCPo2h6x8VaXbeq2CK
         8A6M4j+CdPEpMeOUwc9q8finTMh1YzVWHGCNpVWLufXdOjbxKIMFek3rkOH/lkJihX/c
         bB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865389; x=1794470189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z95zJjNEcveUOGv+Ft/bTJHehaUOWuswuWjxqJIJ7rM=;
        b=jRy6WEVpKdf+hDdM3QGsfETb8/KEmp/Tp17aiqcQy7eKCCsWTA/sqPbW18JbWYIS+q
         sMmqYNmG3Osbm2fO4MOWJb3vUwRsWr6WO9mIxuh+01G1Fjp9e7XXpVuHOmXg7aVT68Ep
         GE7plt5IB2LbaFnyBZykabPfKdNVvhYNPXPj+4I0OTLEkVybPfdqB43cYBu1TcWLt6yM
         8BF56We9r1xNgvmel5fI8Ja3ZYzufSjRjOTNRADJ0RCbNJvawZXTJJsSkdWBq9rDAIeD
         WCrC8Y+Mx8u2cI2ZB+e3SegLwqvmfNewXpoT8acytc5k8jOFToVY0D/eMqFQUnyl4+kM
         pdLA==
X-Forwarded-Encrypted: i=1; AKwUvByalPXMUkYIF0AfemuZVnnSBdQQ0TlFb9v1UbTGQdfioNgW1uzLOXoUX9VudpKs0PsyTaV5KI5Tfxqj81fO@vger.kernel.org
X-Gm-Message-State: APuU4Z8aNfbsxDXtU5VpyUXQ5UCmSCb4VPXN8v2+fZVilaMx5nWcaXbY
	8xcQSCVGG4+k1ISlHwHpUo4n01ZACMW6H508kgO1aAwd1/uVdMssnhYmFG8JXNKa1lQUyAzEkRS
	Tbz27SI5HITbEZ07kPANtTBaNyZ6TYBCHrYbyP0Cj9OA+lekSWa/Z83RABItcyYSRn3fo
X-Gm-Gg: AYBFou2gblqCn1R++e6Sr4FiBJBGZWraudnB3lzVi2ticYC+JcjfZHUpluAGMNqzFgl
	YXaDmvBUFhNIUvI8K93mlYmU7H5Y4qGUu6BboYedocj+iYUioWgQ+2ni3PmOdKYEluN4A6S7C4/
	UikyXrUkCYn3lLTjZqN9kD7WxkY7NmTpFmGmINoT8ACr8RdWYZnSyhrrwoeWdKQbQnO9pcs6w1+
	CbWts9dQUfv0blSM4zWB52C8/tm4n3dui3JPHkeP5gw2IbiCYNasJ8FhmSuo6+URtM+tpKu/m4d
	ZWr8iJuk9dGk6ti8Y+3G7TZYQjIkyciG4eMnJPfZipcjOmh1K8yWrKAJWD29otDmyGSyq7ZdgvR
	SkUYGGdkm7dwRdM+cplUF1PdE+jKr81tte28J+9KN7Bu3cBtTpemTVc1drTEaEDr3KZf6
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr389914836d6.4.1793865388970;
        Wed, 04 Nov 2026 23:56:28 -0800 (PST)
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr389914496d6.4.1793865388480;
        Wed, 04 Nov 2026 23:56:28 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e0fasm150506566b.19.2026.11.04.23.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:56:27 -0800 (PST)
Message-ID: <d4814d85-cb8a-4079-8bfa-3a2c6267d158@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:56:25 +0100
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
Subject: Re: [PATCH] i2c: qup: Release DMA channels if interconnect lookup
 fails
To: Yige Jiang <yigejiang86@gmail.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <rc-review-20261105-vc-48-dbf6a486c74f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rc-review-20261105-vc-48-dbf6a486c74f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec36ad cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=0RPhLGylvT0nOadtWzkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX1pXCNwEKBOKB
 jpo9fTOChwj9HUCtxKbmXH/60zpak3nDbfj2pWBpaRdPTcjdcYha3zZwg4UO6/PXgJL+gvBFfuI
 irusahp0YKcHt68oOVn+qRS5nVWqo8c=
X-Proofpoint-ORIG-GUID: Weraw-seql7nHm4jZA7aDaBbSEhJLOqT
X-Proofpoint-GUID: Weraw-seql7nHm4jZA7aDaBbSEhJLOqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX3cj0dxDj5VHS
 MYtfX5vqprNkGv4ZfFMfRDudC5oQG+zEygSbFjO4zr9BeJZnuhdFLBY4zLehynYEUR8kwLeLrxN
 fcSBOUG+RtByNedI/AiQ9Bfi0MoXl9v3lWjw7V/2uQ3mKhkfI2Umiq0dE2sBV8HHNluS/r9uR9z
 rfmrwKh7wAgauhpKP7EhAU+u6RjFORC8BRuQeHbqwc6gqfWeoBgBqFbsFNiUaaOmEnDbWZaQRLD
 g3HQ1Zw8LUMcUg46cQsa370jNt0JRrR9VaQoL+iep9JDr1YWX/PCC5dXfZQ/f4YLfhf5SfuqU1F
 RI5DTZQZOc9PaO0doezzq3WfV2fAyITz8TLfhtRm9rTBSWP/9P76/93LS+312CfesloN8gXUgFM
 EHuIaneJSSLpK9CT+WgqvlyYJsY4oCUr/fKa1C+Rt2n3NQCTrXBdes4UwIIUX7zWc/zji1UulAl
 BgUl8EeKhjG1QcUsAEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050031

On 11/5/26 8:42 AM, Yige Jiang wrote:
> qup_i2c_probe() acquires both BAM DMA channels before getting its
> interconnect path. If devm_of_icc_get() fails, the direct return
> skips fail_dma and leaks both channels, including when probe is
> deferred. A later probe can no longer acquire those channels.
> 
> Keep the reported error code and jump to fail_dma to release the
> channels. This avoids the clock and MMIO cleanup, which have not
> been initialized at this point.
> 
> Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---

Can se use  devm_dma_request_chan() instead?

Konrad
