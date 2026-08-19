Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D4429CE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130369; cv=none; b=SpOJ6gsTEuHpGZgPnrr0uYlOhVa0CdZsAkyMrLvCM4PXGFvyJxMOhej5JSTVyCb3p60AVdHM1RGq/oK/LTZgZbbYLRndMMXYDbpO1g6I+GOdpA6lOuvmuG1WD7E1qddRRwXUVONKRhd6D5mWY9NGnCU7lGlk42gIjK6RFkH90xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130369; c=relaxed/simple;
	bh=eSQrFRRMx5JNsp5FA3A2pJQvR+CEz2VhjHfc1J2lBws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbE5KWbpwXVUtMdjYmOxB2UEDcb+oc6pJpVR8KHNEDUKyCe4QggUyxqbA0UdMRVit+BA95tRmYUjQ1aTU+IkdmkVwByYI4K2K2C8nrqS2JfDbc1nJK6COmsCY5F7v0eP5iJL9DRxSiU88P2fhTl+8uVU8BXdVVGaTcUIhfd9Jso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs2slEjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ge860YCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs2slEjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ge860YCa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZDXb3171910
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+GtT+fPZGOG8ZITwvCYqym1Q
	aFRBvjYyrBnZbVNoGw0=; b=Xs2slEjpkrgKSdZ1RYVQDab7O1xQKLbcWCf8Jlee
	tSHNuguDrxAQuu7BU5wFK6Wq13lHxibWu0GU/Da94T1BX+e+68Ks5QzyFMy/AWbm
	ohsxdMS8CbxvY8+AKh+4y0U2pXfXpJgTI3rgBIVEFB1U7hGrets/7d3XHYuPCxoQ
	r4SmUIC5PSexyqMcTl7EdAkCNB5HEyeXxpPpbU7XIVK9qEejDk2McUO8io78vHlN
	hXN0zkwV1MUYyP+rWMaHBwkFkEjBYNUKf2rndtRvlANSycvL3NPKEXndI+Dw8gba
	lS5WQIkUEYGb8uTxxEUQ3QjpZztT/yyAL/ZOVGmxbFpEtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkjc5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:06:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1406577a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130366; x=1787735166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GtT+fPZGOG8ZITwvCYqym1QaFRBvjYyrBnZbVNoGw0=;
        b=Ge860YCaPayzwD1U+RITWaTdVKqENRNyFN6lRf6lpwnVBCrK2VsYVx7IMQrMNPlUEY
         rhvQFjxO1bvnklkTJMnhmT2YD3hVSKuCuibhAzUUVMXcMMtfE6dMJtmOTSNIX71CWP3+
         mzXb1w3hYANcWaSBDWYSLcR3xHKsR8F5wmcXC810O+1TK9ITeTZGdWt97/Pu3dazwsU1
         YLRvwJRUU3VmKBcWLru7ofWnvsgf1PzcgwKDcmNYxVo3EQNxaTfNdvwFSuK99AnHS1zH
         4KXPcXYO6cKzqwEpbkzMrbjjAPEsUaNcwdsBsgTex5dyl0Qw03oHPpUBa61IMVOTF0mT
         3+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130366; x=1787735166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GtT+fPZGOG8ZITwvCYqym1QaFRBvjYyrBnZbVNoGw0=;
        b=ZtPSAa4XVvBPNkC/abCn4fliEoa0E8Mw3BfnHndph2uUN0LfNBqC6ZUi95BXPbCWSW
         JBosZi5DnBLCLvpzia9WOtbEPnfaEylDfOlPe5UctjM1gSBnGWG3WGWrpylA3ZNwRgFf
         i5ZTmPde5EWa+1LeinkTsBjYU6xnqbc54l4ys4Xvd5AzYrAVaXZpXqEEba/42Sdsd6Hh
         q20XDActip/9TXZqp5N2l/i7esk4nZR4Bjk/d57NbDnFwbiWQj+WzDBVUwHkCMkRL3LA
         NG0u+hv2HamSUZZIXBfRTn8KYQ1haibIH21Kpoe4e9hz8lOc8ZizGFqtXuBvkQ0uqD52
         b79w==
X-Forwarded-Encrypted: i=1; AHgh+Rq4sQV0Q+GGE8+D6zFEKhXQtUcNQILwIHXbVkPh6EFkZu7tnpyY1oU6Xgx8vePYOQ2Gg3Uj7JDF9AUTjXox@vger.kernel.org
X-Gm-Message-State: AFuF++kA41wS7z16wa8eWAzfI1vJomL+H/07CyyXzHiBM1uLQdgFJiBH
	GoiH6+qOn4Og5VcBC9zroygtu4tJqB4b5n4nVVUj21Qb52kTuuJTuODGPsan7WjTYio3QytwMcr
	NgxZuw2UdNoUTL100x9v3HkgOcElin/vsjR1uC4U39AWUJzh0YTViBPHpqpdSNu8AFSsb
X-Gm-Gg: AR+sD1075oPw/RyqxE/Sad83eedjxYmN/tnBe+tJw28Edc1+9qNTz6vZPXC+uxpiG7I
	BmdQBu2LYjhCG41zTuOxZGZbmizzVm2EZvNNjyURxZafqJNyMvC45eHzpEKg8MA04TcHWrirJxJ
	2Kv8fHv7vCywAtvf2XQ96TPK3OFvbmnPgFu8JDaNivAZ5TYNc4WgtmnydgT3FBHQQ1aHvwJN8AZ
	x7I2ZOkEV/CAsReBPRMjcBCKYLIEXQxIXqxGbzMmH32j/aWWvMt1ExdjnBCyGRl3J2vug0Aiw8i
	Kbs7yGtbvJY4j/z8O1nmZ4+sgUfZ36FIdhsHKZrBkPbMUb7RyUxzv+EiGdD3oY8BxOf348I2g/i
	hpgqa0u0krexzxNDjSAzsHMQvSv4=
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr5780088a91.9.1787130366150;
        Wed, 19 Aug 2026 02:06:06 -0700 (PDT)
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr5779961a91.9.1787130365511;
        Wed, 19 Aug 2026 02:06:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm4873245c88.15.2026.08.19.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:06:05 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:35:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Fix error masking in
 qcom_pas_stop()
Message-ID: <20260819090559.t2uqn4dk5nmqc3f6@hu-mojha-hyd.qualcomm.com>
References: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a8571ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dFXGKhbd_zlHOsaMqXIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: AbK9kdcx5XX_0k1JWxON-jbzytGOMdkY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX02GLbVQt+Cqb
 NYHlaVphpQnzYw1KyrGoNNeF+t2DsHobXm1JKOKBTHNdHLZVA7xnbDcgB4IWHXxFpDTb9ldoX8y
 876Kg1aI8UKd14BO/TnNJ8eEskGpBaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX9u/JPK9Xfjce
 LQ+IAeHJrrxwNhbt4L+WqQpwxxk/ZIrxDcZ5iy2w9SNgTWr7xuqidPkUMazOy5g7K5uJgQhxqdN
 rvxDEsft0wakKdSJrDhy5TTiJgeL6oaAaMeptXE0zl+yiZ0GC1EpkEWHpS8WmnhMXcn2dczDMe2
 ylVgqFHJt3cTi6UwBrBtjZBayI3A227jZAG84w7RCt1N8rUTnv/Kp0OyAghqCVSdrVIer/QjN9L
 XYkYqnlE/gJG2oSm/8tzoXSlFGXRupqI8L9t6opdIcFW8ayktI4NQeesxjQsaiwLCgr2RE8Sx7Y
 4WTlNNIGzzOgiJGC2F9a7fff6sD2cK/B/DA7gSH8/ZfhmigTebyJ4lNkPLYEckDOJyrWEauvval
 MGW1OVf2u4QCpj/sOojSppA68qRdkQ7jfDCP9hp0Udtlv1XYyPxv5CoQacO1mhCW1hTkTfLrHn2
 KFDxc4oB8QYAp15lF+Q==
X-Proofpoint-GUID: AbK9kdcx5XX_0k1JWxON-jbzytGOMdkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190068

On Wed, Aug 19, 2026 at 11:00:30AM +0530, Vignesh Viswanathan wrote:
> In qcom_pas_stop function, return value of qcom_pas_shutdown for pas_id
> is overwritten by the return value of qcom_pas_shutdown for dtb_pas_id.
> This causes errors seen on qcom_pas_shutdown failures for pas_id to be
> masked to the caller. This might lead to issues where the memory regions
> locked by PAS, as part of qcom_pas_auth_and_reset, are not released for
> access by linux and rproc_coredump flow will end up accessing the locked
> memory, leading to an access violation.
> 
> Fix this by using a separate variable for the dtb_pas_id shutdown call
> and only overriding the main return value if the pas_id shutdown succeeded
> but dtb_pas_id shutdown failed.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
