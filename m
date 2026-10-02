Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10399485CEC
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955941; cv=none; b=B/mWoNnhIYF/nYfdf/3JAOPwZHxkWpPxdoAxLEWCDOua8zYf7voVqP/w2+rAMTxNcvPOemkaVHxOgDJdO+XITZIOFkEIQjqR1RaNG6k/fddvVWXeoEZqmO4o1ALI0j8Bo/xI9NfVVlpTgPzGwZaLacl0uEvgXbKwbtqrl78Fzj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955941; c=relaxed/simple;
	bh=OOvwZParqGAsBd0+Bjsmro0tSxp3TRLEWaSyLRmhjHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExRPKC5M5Mh2mlVsilsmBgPcluJU1dCDmTIpRcVYH+eu4nKAKpbsm20zmM4Zmz3pXkRF0+79neYthDQc1yH4fsXYrlMOR0C3xs+KejJMMN+hyC1vunT3NvxO1eSYqRoFdVSRdJZcpIMpg1FVb8sevQISl6b4aNLS4IKLmDXbcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOHZYra7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFCPn6Ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOHZYra7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFCPn6Ew"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHMT62752538
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lvh9wMD5tjLVC95TXkUAYAr
	tmVzd4nSgEQHrshpnPM=; b=FOHZYra7URt1IC2prh26XZ6+dNjopQCM6sBwUgFj
	wmcYLmmmfb7ERZLbHNS6dhaETtGJ45Kufcnph3ng2Oke8D1swMRVpnNsRVYLekce
	iyRqrcPMOBEhNKPcsAlKtxc46bjiRbmcgAnKXX7jTv8XzoglTxzeT08/MyNqnBXf
	w3JsF0QjL7RTdAsoMnnLrp4lGKZb8VyzVnd39KfKcr+rutLEOqywo5JtPYP100ax
	Z2CO9whPnDr3g8ITjmNukS2MeN4w89xW7JmEBEZKfvQAb7K7NY56tjf3v0pDNvpG
	astu92g+/gJA0QZxlmP0P/IUK7Kre8XZ5CvzTvCCTeGlYg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mt7bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:45:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf71bbf197so1745882137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955936; x=1791560736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lvh9wMD5tjLVC95TXkUAYArtmVzd4nSgEQHrshpnPM=;
        b=aFCPn6Ew9rnrymhFO9pYvMlS9Hmk+K1XXm1vcfY55yfpIBdVKlowxLlwftic70J+jL
         +c4FXAUxPwegKM8lGxtDeIDzA9NY/OvOPdHQFcP0q9WRs3clTtpMIRvxnbxER6PoUYUb
         jhB6gdn6C2QENMkBEorSxg3GHfXrIGIW0VKz61lGif/3c18gBJZH1lRAa8cqOFkMWdHE
         yv/IQva6UKYdoRn2GtUIqhGio3zMn8QpM6cDdcPmDfvG8b5VsYQZe4PRq0IgPe+LQU+v
         vKF2747W+2eAPRhj/rMsr22Fq2Ku+ApyTcKCYNwIMEWNwpzs4cLLYFTsJI8OnzYeDQBy
         DgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955936; x=1791560736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lvh9wMD5tjLVC95TXkUAYArtmVzd4nSgEQHrshpnPM=;
        b=H8SZaWtQ6Evw+4ZF6JByFKS2I51USUDH4aROXFT+9pw8sPzHB2fNJxnDNmRlCdaA1p
         o/HSfnSBXZaOTfl5XBVGDtVHg0NTDuc+asvhfOmz/Tv+16nDf4GCNRBPRF68u/T1rY+e
         nQ4MXaGEFZxjVE0rRbGVB+Id5KMQNo3scly/tI/+/LVQSwkibeG9bmzZxuroGoQFy8/Z
         POyD9jli1nS9GPd1j0/2s2LG2SuWQq2zEnI7m8CEhjy8oOoNdV05OBC04x8HV2rIXI0D
         QQo7KEZxOv5bpakFFuwWyhu3qurh4t6PzUd8zViAL8rXAZIQNPiLav5oTb3AOGeY3TQh
         CsiA==
X-Forwarded-Encrypted: i=1; AKwUvByzI4U/7T1f/CxpjpPjc0LssPH4PqhkihXh5K15K2UEakVkV+rOgV2pGs5VKEveR+RSe8feGNvSOjN5xXSK@vger.kernel.org
X-Gm-Message-State: AFq9FYIvwyEkxLOvgLN/WYnAgtCAYDdOV+kUx74wo0asZBEZxsxoyz0x
	HQRt74iozAzid4vyWKLBXQ5RcALhQXUqv4bEM1Z4a6NU5TuBG4M5UbjypM1lzLcHA7KuZJwixDF
	5xbut6FY3aABxSpFMAQ36ibyAzFg4seewDzhf+4Wq1of7dbvG9yzL4gQk5zT92TxlJayE
X-Gm-Gg: AYBFou1g6Y+rh5Z6gIZtnDypAZRbsvkgAlSys0CpriwRifcBa3++wpQlsSwwCVpMILr
	DOg5HAinCckUO/K3L/zW9gjKjgAkUyVmwGLlTdkePoajIUNalU2JOvGN1phsJ90YkHiDDhSp2tK
	L8xAw+YVC9Tbgja5co2hFGpq8oG6CsIh/2b/O8Izuuw5lGrTEtVToXRRk9ly267SKeMDLsKBtsQ
	YcOq2cdROUyZCykuTzn/F2QjNWbdln0ued7/R/nCeewUXl4uKqmwBc08Px4NOxhxCaz+KUYQ10h
	xW42x2FZBSu9ONei1vXGJObtk61LddS58rIWNkisJEbevNn75b3ZEfVL0tsrmDCtcJZ7fufPetf
	+hkiXEpnx8LBVinOXhN791OQqExDF6h6TY/TcvQUOBQIUM8OCpf7E6X2d3Clu23CFof5/uTTBQp
	+bs8usjvcRaB5c
X-Received: by 2002:a05:6102:688f:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7c0f3d4e99bmr935134137.8.1790955936546;
        Fri, 02 Oct 2026 08:45:36 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7c0f3d4e99bmr935117137.8.1790955935994;
        Fri, 02 Oct 2026 08:45:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303896sm10673821fa.19.2026.10.02.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:45:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] media: iris: move shared APV PM helpers to
 iris_vpu_common
Message-ID: <ozfbnjyxg3aeeyrgegw5ljzl5w5fzxo6al5yiovmsbv67t3exh@varn7bs3kqdr>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-2-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-2-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfX8j5qCBcOdb9+
 8tZfZlAy/7LTFB5LqSGThJlagL1MtX51VZivSdw9t4defDpUDvUq//B+wx2GCIPvZk7InPTLMgo
 cD2nFj7KS3N37Bo7WO7tnr6luSwW9Qs=
X-Proofpoint-ORIG-GUID: cHzsU-0MbhValsDrcT_IeSo-hZGHNlzC
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abfd1a1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cacEoe5upwBGUwrNK8IA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: cHzsU-0MbhValsDrcT_IeSo-hZGHNlzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfXzeSv0hbdrNE4
 g9cFrPJB9yLSXd2sl2OkwDk1B55x7lPUQfm2JDbiy/CbASCATDF6xJxVpsbB4piHt3i+7ZdxXx+
 8qx4FE+D2bhxMHWfr5XInhgvkvw/YIIoQ9g2mtQ373nYMfyTc15GOWrec5M4egXc0jHGn9Op6Eq
 ZnEUPRiWzQeghtluW8ckmhjklm70WCPCFhsJDpjS7NYqoSutNye+AUxMUryS73yt0ty7eI9TMoS
 CKI1tW0uobr0bpYMHW8rOvVIH1Kk0fKgfaljYH1fJHkzu1lYSo/Zbk+1xYjW7Uinh0Te3T9u8ob
 EOqs2jX4SjOvCU+kT/2SgnDpF9BE1k8MFAwFSSinRC6mTjiOg7VkFJnKZoh62wnl6XtA5cs/wSi
 PFdri2Z7B0NMZlRXc2w562mTiKVsRu4paOeL76bAOBSLhACYCw1DFVsSB6/o0+oeejzNiUBTtGn
 DirJxH+dGbq67+B53kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020062

On Wed, Sep 23, 2026 at 11:27:52AM +0800, Wangao Wang wrote:
> The APV power on/off sequences and AHB bridge sync reset helpers are
> currently local to iris_vpu4x.c. VPU5x uses the same sequences, so keeping
> them in the VPU4x implementation would either prevent reuse or require
> duplicating the code.
> 
> Move the helpers to iris_vpu_common.c and rename them with a vpu4x_vpu5x
> prefix to reflect their shared usage.
> 
> Move the associated register constants, including APV_CLK_HALT, the efuse
> control bits, CPU_CS_APV_BRIDGE_SYNC_RESET, WRAPPER_EFUSE_MONITOR, and
> AON_WRAPPER_MVP_NOC_RESET_SYNCRST, to iris_vpu_register_defines.h so both
> implementations can use them.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 105 +--------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>  4 files changed, 109 insertions(+), 101 deletions(-)
> 
> @@ -249,7 +152,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  		goto disable_vpp1_power_domain;
>  
>  	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
> -		ret = iris_vpu4x_power_on_apv(core);
> +		ret = iris_vpu4x_vpu5x_power_on_apv(core);

I think it's fine to keep the vpu4x in the names, even if they apply to
the later generations. If (just an imagination) they also apply to vpu6x
(or worse, only to some of vpu6x), we definitely don't need another
rename to (again, imagination), iris_vpu4x_vpu5x_vpu62_vpu64_power_on_apv()

>  		if (ret)
>  			goto disable_hw_clocks;
>  	}

-- 
With best wishes
Dmitry
