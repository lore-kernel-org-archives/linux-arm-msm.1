Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B021C84A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315373; cv=none; b=ZkWgPRScd6ZjKbIajesEWrjwEacsp92u5j9AtTfEWYD1bSJPouUfGBJvasemGQux/8z0Gl8HH2MbJ5wjC7+3AgS78P4NN3FD8Vv7N/a1HzWqCcOrtxEo//4yLKILNdRYaD0Alm2/8J7tmWB+CNfm0OMRBTwcLpMM/ZeN5AqwxVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315373; c=relaxed/simple;
	bh=FLgawzuiib38/bmMwP47vHuIgdaIxTcjNnI6O8d7RIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS4bbqNFZVVr071PI2Xf0w/iwxBUu6s9vQwWENYlXJYjctKyp46gEA/r0zJIaMkBaN9wH12A76G8j7cUSxagjBPdn9zoy2lPACDk0Fo0bFEeUwhjV+DxU/357BOSIFTMbBL7s31hfCOeyisMVbYuNbixo6Q8gIS2VGoz3ZCB6Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FoOoQbfZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KW3omwDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FoOoQbfZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KW3omwDY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f6oe1390043
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZfcIc/FcVFHb6JANdHjj0w/Cgi98STqjq6SMmiLi8=; b=FoOoQbfZvQA8W+1v
	KbBOY6zXdaiy4hF85WJh754oG3TGReXqFo0V3MKNtM+5AEcziBCvXXJlRCl4JEE6
	Gy7TYTYXNVZzmDNTfjxumhDP7TF6ipuJ5NO8aK6ZR9I/Udhwb6mDWov6zvS5DtC1
	kgl0Pdo77dy4wwJWru9LM6hpoF+uzErdpLZv9EYBfiouzeAeI6LtywwkEIup76M1
	ZJWXYdUGHYW9Rk2SYuizll/EuQWEq9YD0sUPVe4D/aaDiSAG4OZyn5npM4KUSWAA
	KjWDQ0F7N/5TZlCI4lkTfFtMqhPjCuda+g7DpiyiFp9RZg1Vp4NXR5tJpHGYjUbq
	qPj5Ig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmxrqf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so16622595ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785315370; x=1785920170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZfcIc/FcVFHb6JANdHjj0w/Cgi98STqjq6SMmiLi8=;
        b=KW3omwDYxI3D3CGlAqz0+3/1iNs24rusX89FhxqjQQxLiR4YfYxKxnGa1JBRv6TJe5
         j4hv5ou/aMPDi7Quob2BJeS+ihFR5BWjHjf+v7yCcMTT6xnFsvf8tNs30VbmJLr+r8yR
         ZVQ8tDacIuK6/rWqj0KNrbOi2x9pghz/YFzOqJ/VeZygjn5WP2EYpTLIxRf6upFpRQ1B
         R0mUwB5hcoRS/CEB1WXcegCcT6isa5JiyesFTHtjfMr68epDhjAoxLfZQszaAXCsuQho
         NwYgv0VOY0V4cEQ8if1Arb2qkSORXrOtpu9FD9coxlJchD/DCONrNGtUv7RP5myxODBb
         FmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315370; x=1785920170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZfcIc/FcVFHb6JANdHjj0w/Cgi98STqjq6SMmiLi8=;
        b=CTeO58BZtRt5hGevXTUaW0o/BpiH9pFdcrSq9Iv3rH8MBNKveQaZumYMMzF39DMM+Z
         DUDDVkJJS6W41sUECxm4ShfKdMSxHxEqxfzjDrf5rpXjT0YZqP/3rHObPremNXLXtbbF
         iwBFUV1yQtPLa5+pkXXdXoiP9QPpQEQJizrhE40F0kBQmG6YMvg79tA7+Di0FWLDbJTf
         VIcU99W1Gl8ATyDHiKVoLCLMw7lYvTV/ELa3QJ8AqhV4aE8MeaZImB/rJ3gTv7nAMwid
         5oywP4GxdDj0Oal6Jmvu0qAC4g2d6QRNbhH6239oHZKHGoK5aqxcjcF44EW+Cj1vDE60
         Hu7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2b3TZfmvD+cKE85qX0GwLmIWMlge7xOLmgZALdXLu3odn7PAmCUaHvjk6FT+xQFywSCMkbH/JpL2UKVC0@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWaXG2b301TpXKDg/EQG4O0gQ3QiRhDiFvMCyFsXpnhLbLU+1
	OER/LcejPc6BSCLxnHMyZehv2KBsby0phr3bxl8w9e9JrWdKNcKoSoJOPXsiUUyCPYxU66Ldm8t
	1gey8dnb+hDuDx4LxWuThmvFkGvI5ooVe0kGXqnLsARsmcHJeL6OZLKufN3LtL6Qb37JN
X-Gm-Gg: AR+sD10vp8HJ5G0dfQeTNemM4MtaH/R+mu5UoqaR3/a905etApHm6nF2t+qywYKB+/h
	BW9tv1UMMo7iZAi6/CdFh4KV76qNO6lzYRuvoptDOgjxFsGFeNyzv1dWY36zKAql/WAwKi+7vWR
	p2aTJKVCCpHj68QDo0yZolut98CK7aLLIIlxeDNnOiI0+ukhmfH26JkL4kkSeyeOs69cWayY4Cv
	SPR//1GRRKdEl08MWn1sIC3LKQ9ItM7qx5H5knhXqgkXm9PhI48+7Aumfz7s8sZ3lorRJRRZXkW
	m6Pf8rTxupEdODgPrie70I2IjZ7dNZAYTjTLZvfD3z3+ChmFmf8VmNFPV9q5GuvmpepjYyuRVtH
	qLKkne06FgtnBxxm3BNHkTRUtEDZHD+4=
X-Received: by 2002:a17:903:166e:b0:2cf:7d44:e14f with SMTP id d9443c01a7336-2d015d44a72mr67845185ad.26.1785315370379;
        Wed, 29 Jul 2026 01:56:10 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2cf:7d44:e14f with SMTP id d9443c01a7336-2d015d44a72mr67844945ad.26.1785315369947;
        Wed, 29 Jul 2026 01:56:09 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm7969865ad.57.2026.07.29.01.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 01:56:09 -0700 (PDT)
Message-ID: <1455590d-ac61-4f8c-ae0b-7cbb2c38ab76@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:26:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Udit Tiwari <udit.tiwari@oss.qualcomm.com>,
        herbert@gondor.apana.org.au, thara.gopinath@gmail.com,
        davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
References: <20260517105233.807935-1-udit.tiwari@oss.qualcomm.com>
 <d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com>
 <f19fa79b-82c6-4cb7-87fe-43c9b92907de@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <f19fa79b-82c6-4cb7-87fe-43c9b92907de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3MiBTYWx0ZWRfX9dcsCU2BgBsf
 hcmokwxaJGwOrnXcpWX8Yv7acDy37DUO88s9KQWVx/oU6FXgfWGevyN+AB7LF4nEiZHRQJqevNI
 PnJ3cNHu40KHmwZ4f2sFy2TPVsAqOyZbfN64AXqpsMVTunf5V8mTH+Zkz2NXLhjrrnenb8eo/MA
 JKK14iDnznip4t6C4YVXewICttWB6U3kk6IQPsLlYtkBAfCep+Wm9FQKfJ7BBWi7FkxGvFfTaMy
 JikyzyiRWOYwFnuq+WE2Br01sshOJT5+IHhOzvql5ZC9Tp3HIFDM9YwHKWITLNpOrU+0NB6Ij1R
 pLx1iStDZ8F3YOG711Ha+NvXC3Qj81b5O1YM+7AMHjHt8Ek2t0IguH3vEMSDtnx/WagFXEW4kTL
 gAa46M0ceduurnehNpfsekZJlfCbC2sSnumo2Ede7Rz2/KA+7epy8BzDeSiAVCvdYDy0Sf9SyAY
 xxQiK07Mw5eVwutWuSQ==
X-Proofpoint-ORIG-GUID: 7Hvvhpa26t66vpYSQWFGqhXMxI-vA9ab
X-Proofpoint-GUID: 7Hvvhpa26t66vpYSQWFGqhXMxI-vA9ab
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3MiBTYWx0ZWRfX1+c64X9Ub8Oy
 NlByoj6m9YHxD5tUzdMbMpVev7NU5K1j5tcCmbOBJwJsIizrDyqZ2ApDHjqwzIp17yd91/IWYyG
 RoE/zwEd0gVxK7Snj+bq/umhSE7RJlM=
X-Authority-Analysis: v=2.4 cv=fLIJG5ae c=1 sm=1 tr=0 ts=6a69c02b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=hkcS3Ldj-Qh5X0bBtzIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290072

> This needs to be rebased on linux-next/master

This patch is floating for a long time with no reviews/feedbacks.
I can rebase and send v9 hoping this will be picked up soon for merge
window if everything seems good.

-- 
Regards
Kuldeep

