Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772465;
	b=xMkhZRuZK8G5tiPiRUefghMKLWXraLKfWCT8hf+FAyFzTVrVLQ7TAk/khWIYu0a6qtrW
	 yYfBufEV3zf9uIqoQntGvif8HiJ/yuiCcsyCyAjVLOa1S7XnTghNIwFyjObsVXLpc8Epr
	 df3j5VJInl9Hf9Iu+T5B6gxDqzBlAzC0ij+hDp4wg2qzzxCfwvg9fdskh7jG7Bdjy0yV+
	 a6X0iizHFwPa36HrESp9fMrwcgGXC7G+BzRuPQVLzRVz1ce1Pkb1bflUjpWpY9+3qZF2f
	 HoMQpLHpdrDPNmu52zGqtX1ySujQhN/v1edXZ5JI98/yQYfh94dZ/y5xqT2ulxQO0/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=;
	b=rSm12bRg1LuTUQY2rwYjRA2fq2h50ys0B1LAnO+brIJygOQkhsUEQCgQlolpbYts1Qxq
	 mmxXDnYUBivmzkXpYBvz4DsKkPoTIePPc37Goq8V5Se1+xlmbelIrw4jH7JMVwE5XRxhc
	 8FvWwIU+OpTy2U+lbBaDrQ4Nya5YSDhnwdZQ+bSNnzmCX9l8U378zh5fJgR4wkmgeoBcU
	 lv8CWxJJZ6OYX8llVIeG1HCGqwsP+uANSvE1cEq5Mfoz/7YP3zLOPV1Qz/b1FSMXTUJJ8
	 KdjKpC4KPmE7ZcS0UPFXetWp4xF5c7j9N5xLtL9VhuuJlITcCw0ZG9X5NHZQZM7ZJQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nLS/r6At";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM1tADde;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB85606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB85606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nLS/r6At;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM1tADde
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GIa91779838
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=; b=nLS/r6AtWhGq+QJc
	J0oiuyH5JRdARl32y5qkdYINZB5cJduI03RlxB238VpnYDaLbmUG9iqZHj/d9Wxc
	wMKDw6zUmZ3+oO+MipcC7cjodcfGZPpgcmI/cJKf3TFEv9rrbj6araSwgGdz1mti
	JehdOnQCrB3zkDAmkV3IL6ZyGjFU97Oy3ndDIgiVHeVOQmoeXENzgjLluXfhOCyj
	2N9sL9a1kG+tJeYdlKl7BUW65s5aKLtOp4AWfV6qAyF4/OWNn2rCmSn6PhUV5mV+
	6QO74eWqv5MsmufPwwdX9AErpCf61T4+iRQCosmQx+TeFSRE5p/GehKrBH14SCKP
	MP0PKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgy37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:41:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211275acf5so3819516d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772463; x=1796377263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=;
        b=VM1tADdeBkw1c0R9KqrypaBQeQ7Cv/fijFi4jqICKhCL6x1MejslvntqtilFoP9Naq
         z7E6w26AnHg7rbZLPv7DBSXxxnCzblUwFemOKy8w/7Vtb5I4Z6ZGWYapQ0SWqEixbe4l
         66UvTlkrMF6QtmszwysmRa4Iq7qDkQFJgGTQfU1vHybXTNZJNt7deBD2/1pLbzffH8KU
         h6s4Nmebm6yboLJ25929ERfZ+kG0Cddp7s0g0Vsjm3XPe24wdeWjeX8nHQMliXBoCvNg
         7nlbfPHLxKHVDjK4UdZ4X276sN2ZHNfRfmX93phcqoyoQQWlh3GGSCMftAbN49DXB3Sh
         EEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772463; x=1796377263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=;
        b=zzdHU+g8Na/aVXicfGq46KYx8uskXqJ6RpHx/ALwbzho59Qqc2WYujd1O9HM+GtzTK
         tJKKGXuBvcQQdx4lwkQeBTmOynxm/hohD3e5S5uAEQroIbG8imQy7l+mP5WK5iWInIml
         PoXIy5JsUzdwHtKveFAlWk0F3dgQDu2tyzinUT+GZ86DALcyqcMYH46dy7aaZKymp7UO
         ZLkiRhAcGfqKGDq6L4NuhNm0/36m3twAsm9i/iBau4Irl9i/+eh7ClzpsWJapWIyPyfG
         8JWbxNOvSIWmzsVAfuhhfeKnDZTaGgDsvR68dN9TjZeJ0d43lZqrSvUbHNfNN8kmn+Ts
         gbvw==
X-Forwarded-Encrypted: i=1; AL+hErEH5GOBmwossRkja1wHS7XdhrDwxCcwoX8gB7GZpZtwGvKK50xPEKAErLf8/tF8u4xBHKzeQH/yfvJH8EQ5@vger.kernel.org
X-Gm-Message-State: APuU4Z+fhk3S36qcaNS2xpTmh4+RxCRSHYCduzPJqaCaKlPVjSJNfeyR
	hf/1AB2T8okkd9f4mLPzyFC1OOZhoOSz0Aooc2yAprCepyq9gLoBnr74epessrpVo1OU0TnQo40
	ZzXKIOtFuPmOZA7otcGSYg7fu6VYVLj1X9Ij+dp2TkaUvJOVdzFBYDjn09UuMUoCGWlJ1
X-Gm-Gg: AZFdTZeeAViUQHrcRUkNNY1S9Wp6haluT63NZICrLXqCjcisuc/gIuy6bbmDLYSbf8P
	yKgC1L2kRiAgxiHagExXT3RpISpwJ7Hcb4vbVceYidqZ5cskcvWq1lvLY4ZbUct8kuFnYVAXV54
	fffQ3oa5msG2GLToQaY0hjyCeDxONhwKc64+/yueEzhBBYtLwI9AecDzp7Si3gJuLS2K8BsmrEU
	rjRVopy1DFCq2Sn922J1ZF9VmKSYmYkownplgPnqYkLJ3COPRDTNWY4PkZtyajiMTJWbZiZWqby
	Vn5uvG/INmIJS7en7Bwe2FnFxpOv46ngiCF4c3jTILRxFBfYjQCRCGJFcvlsH3fS7r4AR3vhhjD
	9Gtky+ysEyD/SCbwYbu3NT9TUvisQnMiQNpLo9UDnuyWEI+z92tlditiNUQL6mTPVfWyvLe4=
X-Received: by 2002:a05:6214:d85:b0:921:9965:89fd with SMTP id 6a1803df08f44-92199658a4fmr1860056d6.0.1795772462929;
        Fri, 27 Nov 2026 01:41:02 -0800 (PST)
X-Received: by 2002:a05:6214:d85:b0:921:9965:89fd with SMTP id 6a1803df08f44-92199658a4fmr1859526d6.0.1795772462429;
        Fri, 27 Nov 2026 01:41:02 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00232sm870424266b.12.2026.11.27.01.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:41:01 -0800 (PST)
Message-ID: <945486a0-ee72-4518-9537-72c4893a4bad@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:41:00 +0100
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
Subject: Re: [PATCH] interconnect: qcom: Propagate BCM vote commit errors
To: getfeus@gmail.com, Georgi Djakov <djakov@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CA+m4KrCGfS46jvTdXiYorW=rFg4wOKJ=UHKDXq1a4qfN0r5x_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+m4KrCGfS46jvTdXiYorW=rFg4wOKJ=UHKDXq1a4qfN0r5x_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX5ZIW6Q8Q3Z9z
 7HQuiRjRrSIkaKpbAmoT7ngizG+3/zbmN1BT3QTbf/2+8hDue+1mbSAqUyLdeD7zcgWoUENPynf
 PlHPcSbQH8GBIY2t11M8BVJ4HC6Bxyk=
X-Proofpoint-ORIG-GUID: 6__6VkluPBIr7AN-B97jpQaNdigjexfk
X-Proofpoint-GUID: 6__6VkluPBIr7AN-B97jpQaNdigjexfk
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09502f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oBFxeG9DB_Cd-dzy6WoA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX1qDgiRZ3V8uz
 PGji++bAGHI/uRFfV7qiGaU8XEy8B1ScF9s6pydHMIBQZCV1k/Z1USds9nI8aG1PKhK3sJd2nCX
 ubryLlqZq+glzknHQTv8tA5VpGdoTS2h5je3kRuU5yTJmJyy3D6ChTr154Yfw3DDHVGdOj4EkJa
 EcOJDwBjlzbqeQZMar4z/+5e1IOyrieSS4b9KtUH01sYV0Ty2r8uaGHUUHtu1FRTRPW3ICkxri2
 BuJXtts3ekmcAcIkssRaDGw9LrPvhgYH/jnEmmh7jmy9HnMh/kBOSFFS5mDKvkD3eAXn0sn5IwN
 AW4uTjeMnHXLSfW7IUiHbd1fYIhaDe9760MDolmf8cPx8h2PPclmGxclhwcyOw24T1tkLI6fWeg
 0NgS7N8kfHuX1VDp4eCDdDuSWU6gfKyuJCgRXhi9UxHiWrtjrjFIIveVvDtcy87D7elQE0SPzQB
 10yPALcYCIVtXfl/5aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On 11/27/26 10:34 AM, getfeus@gmail.com wrote:
> qcom_icc_set() discards the return value from
> qcom_icc_bcm_voter_commit(). If the commit fails, icc_set_bw() sees
> success and skips its rollback of the previous bandwidth request.
> 
> Return the commit result so the interconnect core can restore the
> previous request, attempt to reapply it and report the original error.
> 
> Verified with a mocked commit failure through icc_set_bw() and on a
> Huawei MateBook E Go using a one-shot -ENOMEM injection in the BCM
> voter. The caller received -ENOMEM, and the previous bandwidth request
> was reapplied successfully. The ARM64 kernel and modules also build
> successfully.
> 
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
