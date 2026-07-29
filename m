Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA73CB555
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 20:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358722; cv=none; b=LDj9n6+oN+JnJlTklKTX1yN5ZOt9a9QUjXnavOfkxkcP9p9Pyy9D8BycSEmfaseWh39HJN5qTxdFLRcWDi593pO3SdePTfnozLrO+zMHlQPNXN5jBVWrG8yAxzpVvU2AfLY6ujMa6u0OMyPDUHwCo05OHeGiN5SJ2CY61TO2uKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358722; c=relaxed/simple;
	bh=QvumVUf0NKLlj/MvzqdvQvP1razEAsjMmXjAj7XnD6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrkM1+M4byPHgQ7eyDlP3f27VosNRKcvETDAPMcL6eF+9TZqZ7XWxiAJyC+GLJME/lIUqMcPbXXdEFq/0Fs3SlkRLNeF/JYQoDV1Q2mfXs41O1hA4c5uHYM80XY+hrjUcPCq5sXOUdHy+GRgkMaObOyT0dDE3TTCkLszlGhzJ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAUsPHGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfk2ne3W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAUsPHGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfk2ne3W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TKAwJv3101580
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 20:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXSfyuVk7nhwcBFF7oOD5gqIy16PcYgsT0nnHNUvLMM=; b=XAUsPHGErG+uIyOh
	Qppnx6ZlEq26SqFbuOa7mJ4MyQ35FbpgJojUedz/7pgsxAlb9UWoVDeiOQAYcgAa
	XRtJTN91d/p6vfbZNkkT2YKdWIVPoiW34SG5c9s2bY1YhoFejUXxnCEpxnYnDo4L
	zVoUt3T+whGnWYMrD7y6nHQEYxeMAI2/7zSRpk4BxN9O0o2xFdUAtOtJi634menl
	gK1ixuKd8u8sUg76GqsDtgRnQ5gPtLA7TtTyPG/CL7hLWHUzNDUQt/jspktM3ZiV
	yjiuEA9f4fwHGRKvr4aJoLKFOIWlbpsPAVH7PKFC9KUPXzYCT4PlWVDrrQccVWOw
	zNVobg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqrb105j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 20:58:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so29210535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785358719; x=1785963519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXSfyuVk7nhwcBFF7oOD5gqIy16PcYgsT0nnHNUvLMM=;
        b=kfk2ne3Wgvirds6bqUw/iowfmuV8XhPSJCdwhkKD9GYurF90/NG92pmaYX3O6ZNUEX
         mijGTnQQwG3rqbqu1kg0ycY1kY1F8+KD8vGTzkPoUu+Plfwx//nYvCjfe/je+xJUEYl7
         aYJ7gyXltrOlzhPpXBwPKutWdTK8FoE/IBhk3QnnnEN9qbgmAka4xLZjGCALdyZvwLrx
         tFx+I+L8RAUsDZR/9lQUAREGX2zMiG/rBRbB8P0/v7fALXv4h3TzhDwVBa8tfyPbHXJj
         p/VFL3yL9zEONmB3OukGpbSgRdp5p5hGxjz+9hfEV3zNEcjlYwl+XavY2pRQiNXFoC0G
         RxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358719; x=1785963519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXSfyuVk7nhwcBFF7oOD5gqIy16PcYgsT0nnHNUvLMM=;
        b=p1h9+bftHvwcZTQXFjdUx9uFKWthquvNV8JE0c1L0558vZmilXDn8gYDZ33AOYCBQZ
         bZOkesgkt3ynxh5ebAiAPYWiv1WZEIrY6OPhfLL3jzeMaeX6YaFDUoZE9ux6sPpdih0s
         BPxYZt0P5CAdjuG4c7dO6voGfbZBuPJWjrQJ4jCY6Ftv5uB9G8pdwcT4lqQJKXBc+fqX
         WDhOxabYVbD13yPYP3YiH8D9qRpJQwrAiuEujV/utiFC9jMsUamJCjg69FXZ3mj6AWBy
         d4xZz2s+8IJk4FlVU/gBF9/rWBVB2yBVOmA+C4zNnwKGwH1R7DyDApJS7/6ZFAIGqda7
         f4Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpVE72h1Xh0oZ5QYL6eZodrireNVdVWg32iQP+x0m5ado1B2iEXrfXcvSXwYgoBXS76qYxrPO2DWZ3xQtrG@vger.kernel.org
X-Gm-Message-State: AOJu0YxELQEpF3HnwxZ1ye3tCkPFK/G2Q7T6sJxYGR1UL4gnRYtTHMSv
	NmVZcfFa1wzhWKSyR/GpdiR7pkicnsmV9ASnSIBNUG3EPurO6EqPkpETGuEHWvUVpFXit11bEZV
	qi3Z3xOBiq+QOmN51kdXxnL08SfTWN398y9cUYaJklwJoNzhcJVgCNTaAy/7ySi2vW6AK
X-Gm-Gg: AR+sD11nFovfB0hOprZoc4kf/Q/4g8SB8dxM7sxcN8AjrQh2n6YEO/Ya1RjV4jUoaS4
	f5y0YISxMFoPB+U2Mb4u1Kp4Z4VAUm2BtNTXAovyMxdbJSntc/BzDI38j3e/L68Uy0KsX9OLPFX
	7R3n+0oV0FJXeqS+twxguSSONqa38veJNDaYBw4WQiocFmA5ZK7qjfCsZEPIN5uhHlA8PKDX/1/
	9H+m4xoYOj57Q81+aKqvVZELS/cUtS6bDT6aHTeiILwL+8LFoGQbVFL3NE4A9I5O3EBll1YPwbG
	ncbMUfwDlL3X86gvunmDHxWqXI7DRNhbZe2id2X6OnVyZYLojAKo5iurJhk7+zDX+I2n018n9ER
	iCIQVpnvSupi/OBLR0IOW0eBO+5gxRO3F1PnrYIbIu3QL2Swp4P3Yiw==
X-Received: by 2002:a05:6a21:1fc3:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3c8ba5b7f3fmr8831061637.46.1785358718818;
        Wed, 29 Jul 2026 13:58:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc3:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3c8ba5b7f3fmr8831033637.46.1785358718423;
        Wed, 29 Jul 2026 13:58:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm19719815c88.5.2026.07.29.13.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 13:58:38 -0700 (PDT)
Message-ID: <20a19c5e-6f1b-4549-8a72-a8a99126f73e@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:58:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: use sizeof(*trans_hdr) for transaction length
 check
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: carl.vanderlip@oss.qualcomm.com, ogabbay@kernel.org,
        dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260617212520.59801-1-meatuni001@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260617212520.59801-1-meatuni001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1OCBTYWx0ZWRfX5TeGSuAAO7YM
 DOPb/4//XcPFm/ioDe6zvPXMHMSb4i1R4t/n9OyqCOa6tMMRsrEk8Hn2HgkIRlGsWs3TVb2iGR9
 xIKZY2QBoCHfu80CXxziShxfvXsFkyw=
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=6a6a697f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=GD8_rapH8p4utXL01xcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1SUC4eInWO11xgiM5rYJzcGtBoHQyGCv
X-Proofpoint-ORIG-GUID: 1SUC4eInWO11xgiM5rYJzcGtBoHQyGCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1OCBTYWx0ZWRfX1mceTiWKflFp
 21uzgUNTQNQzhhPC/nXCbbYlG5lMFy5zi7+7SmDKa3YAyTMAbAoVeWBQAwOGl+0zSASlUsxJq7y
 FJAF2O/0Z3t4VHKHng+GT6mumWViXOb/kc5KqsCUXRWVAd0aWLWLwOGwUyvQEj0pwqHORS3pzWc
 hh9GuCFAHqmt13rT771O+/dTK1t8VwwZ1sDAJB/RP/+hJO28TUoFF/nozX3s1esM2KGb/Ah81rp
 xQtCLRiKUzsSa0pfqKCMSN+fzIZR2vTUGqbmI+jXAdzymXTdRgf5CBWeY0dZwwvzaevAFNbFlhk
 om3U4ycmMf/IXwWOxKg2kBOwLVAajw40DM6tcL4wPQtKZrf/+Dr5dgRmNOKakeD6tHz69EXlKys
 RVTFeuvrBNVc0vFfV0/3V4GPf+Y263fITEnrN8yUGaoMh35sRaV5+9x8scuYAlAYtC06uubccpy
 pfL6wUbuBp57Ng6lA4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290158

On 6/17/2026 3:25 PM, Muhammad Bilal wrote:
> In encode_message() the per-transaction lower-bound check compares
> trans_hdr->len against sizeof(trans_hdr), i.e. the size of the pointer,
> instead of sizeof(*trans_hdr), the size of struct qaic_manage_trans_hdr.
> 
> Every other length check in this file (encode_message() at the loop
> guard, decode_message(), etc.) correctly uses sizeof(*trans_hdr), so
> this is an inconsistency. On 64-bit builds the pointer and the struct
> are both 8 bytes, so the check is correct by coincidence and there is
> no behavioural change. On 32-bit builds the pointer is 4 bytes, which
> weakens the minimum-length check below the 8-byte header size.
> 
> Use sizeof(*trans_hdr) so the check validates against the actual
> transaction header size on all builds.
> 
> Fixes: ea33cb6fc278 ("accel/qaic: tighten bounds checking in encode_message()")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>

Applied to drm-misc-fixes

-Jeff
