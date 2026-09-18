Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F853C81B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696313; cv=none; b=bKBoHeXgvk4Iey3YADmVGIbKCgGASHZXD4yisMn6m4elavozixi93iKqg5PMcsDTUYH8ASVyVErdJNSdrEhGd6jZUJ6AJ2JsBXitdrNN7bbu497jJa7zTX+EcVNgrOW8an4Dru052jTXlqSFZnaXZ9+BL5z/OTk5v4sAMbyQHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696313; c=relaxed/simple;
	bh=3c+nv848NmVJd7OUKmVMGg3kEWCy3PSpBAgBNRWZ14Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+UZ8VJOax1ftv5NVJjuEn+vZS13x0UEqHSLA7gxILaVGrR08bZLmRAps3BxRQsNJRoOTeksgUwrnVJWgOk2choT1Ql6kZI4BI0DwJLGjds9ZAzzSepGBBUNYf3WcZhcH0EswYFfSpphAEo2SA4BqebCwjwz96InO/IFFuS9e80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3oZ37LW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0Q41X42; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3oZ37LW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0Q41X42"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I02d72142423
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rHvTaHGzNKtmeUXQ4P4l1GCA
	zOO5LpjiZrRVPNQZEoQ=; b=h3oZ37LWsyB/K/wcoHV4OYOSe8pGt2rcKJHTmvro
	GSzmxrqNfkNjWLgnEr1y3/2fHkj8TVs5skSys1Wrzray/NnOjKONUHglnMoaUYfU
	vpMVKbHDKbckWm71wUbfqNB+DvUK7lsxTKzem5eMtOGC80G3j5P7lbMvK8V1z0kL
	P5s1XLaXSzJUyGg+AKe5vcj+AaWFfvoKZ/PJF91UwblF6ps45k9O+Gsip/sSyg4q
	kudcMYbyxynNrsy1uL+DtxF9gMchCP14eeewcG592v5FYixF0qLier/XC9amiY+S
	wDUPJqElHEBYrXHYlb0bXF67BVuNd2PpkrFR7b0cMqoMNA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpray7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:51:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso512321a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789696305; x=1790301105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHvTaHGzNKtmeUXQ4P4l1GCAzOO5LpjiZrRVPNQZEoQ=;
        b=O0Q41X42jhN/5T41zqBUvRhO1y2Cyp453KAIxAxhb5/4CK7KtPprSyNMC6d3PooK2k
         yceWiyk2DOxF1WupnY7EcFywFXXTPHFUZraLiuu5EXZnr2FniByfVKN06TACT1bIMywN
         so0x3G5ZGlQFUyHorrWYZubyi+g6633wGxifKRIQEDVza73EEBkijIQECb+cw3aJdQRT
         oe1oTppVaLUmgrHyUzBYURD4wyF4c0jLH4w+InLRFsA0TMhAM1TOi0cCri7FXJ6j6VpL
         y9kWrMgTIIP0nHh3Xb8lnShKHU9qzDY3Aj9aNbf6lcsl//QcMNEMVeISe8Xh3ZHYCJDE
         dHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696305; x=1790301105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHvTaHGzNKtmeUXQ4P4l1GCAzOO5LpjiZrRVPNQZEoQ=;
        b=vTUCG2ADWVBP8qgoR79UhLcqzdGh8RBqZXX+DTvMP/9/EQcwPj6+FQdMljQvTM1aGc
         ONIpxEEVXGci8g8udv9djZkxUmf4Whku59QkweJxLiDjzLWAz5wnPMG1OA6ITkA0ci50
         yvh6YREuiy+R2YdfS1qCZe8wQ9TT0dlONN/V9cYrP/lXW3H0ZiMmkhXmjlMdyKji9age
         nyoV3WQMlOqjSpTh8/SoKXtxH5qVj3yjdgNH/M78hvbVOQ0DAjuW2lujyeQbC82zJS8q
         tNQ9RfJApZOqtfJqGnCG+qNZzlXJvYofkJ4c3BsISkG45vhPqShy1okpCwo0o3zfii6t
         IyMg==
X-Forwarded-Encrypted: i=1; AKwUvBzubqsxeUrigTnWMDVFK5P3vgrUWH/qihceMi4DW24/Bfmwhx1DyM8z3xi3lYmiZ3zxpi4G9YHtA9VGvDri@vger.kernel.org
X-Gm-Message-State: AFuF++nqdA2HJGJMXFUwL/UQVFOwiYysksCuDZwH616mhNtdD2hyumQf
	DMa25I/BWEME8ppyigYYqU3rS1YupR1bUUBF+a/qiBMtdEVXNLCZs3Q+a2QYzObhN6/FNQchLM7
	exNXCoO6krCL6+apb5/yvAAjLNqnITCs0q7hxiVh73V9znS0v3fXarDm8FIb8rZWDhFe8
X-Gm-Gg: AYBFou1GbWGSNwFv+r0++ozUUXq2MOj/jRxQYAl1X7O8ZLNBoFQOOgEecGlptZSM2H6
	k03Qpo7ngW1jokj2Q+LGHBiJzuC0xBu2RhPQhYAWUYTs1T3r1IGUcbBNX4OBwuTbnDLK2uxUUxh
	GdYhKs9ICTzAxSVk7/QLgo1xjWd0OBWWQN953R8UDCCC8i0kK/rFGLnkzRfcddgjS/m1gClr2YQ
	P2i9nX88TU27jADFtDMSbp9PijrKV6NzAkfwbISf3UTCABQkLLyPNa8UjXrhCn3Ma8HIzFAmwhA
	PpO6V0fTZS81vqDOfIq31PEScuSgH+P85u4WnzIjN2e6sMjUF1+D2EFgy0sfa8tCSr31w/sq6ZR
	Vg/rgMxiEEQS3dX6GpaKoc7V4ixpePNFu63UcldVxfW0=
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr2019492a91.23.1789696305192;
        Thu, 17 Sep 2026 18:51:45 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr2019448a91.23.1789696304701;
        Thu, 17 Sep 2026 18:51:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfc3df2sm1145837c88.5.2026.09.17.18.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:51:44 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:51:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ufs: host: qcom: Enable MCQ support for sa8255p
Message-ID: <aqyZKy1gMnHud4Vy@QCOM-aGQu4IUr3Y>
References: <20260728051104.675088-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728051104.675088-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAyMSBTYWx0ZWRfX2M2OZZP3KoRB
 RZrp1epFnqUfuM6SvWotIAe2MKYeK5a1wAvni6xWwCQLS09KhOcaI0v957S8A0v9QXoyqQ77KA7
 l96b5d3TwSC0VTbLbThXrO3tBJZWKHWXMVRi0TrQahfQ1mShkC5Wvz5M/FY3q0lkJLkBLe1JDNU
 92B4E92XnG0wS7tAK6WsjHZfhfcVPiR/QFFuy5qrM8/jxxkrEXVgNgCPuMTglvoaKTqHxMgMDJP
 mfKsPjl061MIPNrS8Qa3seg3OZ1Qt5Wi3mpvXGe9xQgiq/es1dB25qoJmuJRlk0VfW4ee22M/UG
 DG0DP95AukThX5lwPjdYN+Ab8jZ0+uNrrLQygIGtjcLPedJXPP3Q1WdIkfPJglt/mkHTV5jaYbl
 x1wi4cb14UPji+FyiF27HhkwLyfMnmw8UC/DVzyR35WH6bjizR7fSTKYlQas8suwuZ7KIk/bwQB
 hoeZnm37zTyMJHqOj6Q==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aac9931 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3YqMR8Xo1YLpbCGl9ZwA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAyMSBTYWx0ZWRfXxbLMeCX9+iLi
 jC97dE7LqqrnaIj3CgfZd5uufUg7Fr8zdxxyIsUwqfAyKoZKNZTupX7NejxlLl/1BN5RhWbfy2f
 7ExbhWWUxjX9WsLDruq8O3ojhiC5gto=
X-Proofpoint-ORIG-GUID: _SO02hFLdebEPC_xE2bopce9DauReiX9
X-Proofpoint-GUID: _SO02hFLdebEPC_xE2bopce9DauReiX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180021

On Tue, Jul 28, 2026 at 01:11:04PM +0800, Shawn Guo wrote:
> The sa8255p vops (fw-managed variant) was missing the MCQ hooks, causing
> the driver to silently fall back to SDB mode even when MCQ resource is
> available. Wire up the same MCQ ops used by the standard qcom vops,
> so that MCQ mode works on sa8255p.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Martin,

Did you get a chance to look at this change? It still applies to both
mainline and linux-next.

Shawn

> ---
>  drivers/ufs/host/ufs-qcom.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 0500320545c4..d2acbbe647cb 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2950,6 +2950,11 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
>  	.resume                 = ufs_qcom_fw_managed_resume,
>  	.dbg_register_dump      = ufs_qcom_dump_dbg_regs,
>  	.device_reset           = ufs_qcom_fw_managed_device_reset,
> +	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
> +	.get_hba_mac		= ufs_qcom_get_hba_mac,
> +	.op_runtime_config	= ufs_qcom_op_runtime_config,
> +	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
> +	.config_esi		= ufs_qcom_config_esi,
>  };
>  
>  /**
> -- 
> 2.43.0
> 
> 
