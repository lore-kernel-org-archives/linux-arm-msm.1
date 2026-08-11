Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729117E792
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456446; cv=none; b=OzG3+Jf3ATs7lIkFnwiAikvLZRo2heuWrARUAVxJno1H3H/Z/OfZKgSLfJ2Vvssj4GpoSbGR91Iu1b8wYs2aEj7ic/KRjQenwmQ9/pULDbeu0IjmnHvYhStxWjbVjRcIxAjD83ycDkhFDqF5hY/rsg2fKRUBUBtkTxSu+tSXdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456446; c=relaxed/simple;
	bh=676IVXliOvaEX37YxVVXapQ+jjR6Wzh1/t+OCRfaVyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3Zxr6ic1W8cR/iJex50jFFFsUFc51g3lqule4mTibikAYB83UvNN6HVP6EpzjjYy6eBBwt18zTabn38m9lc/57gPOIquCbp9xwEQWkehBTXp2aqWAPQdFUODbLse++Ed/Q/v8CDrmIS98vDUuPivVekmuJQp3oa4oW2R8c6u3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypjtv5zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5PL6asq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypjtv5zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5PL6asq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWaZi453545
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4vRQOl6NGy39XYmQ/g1XtMf4
	DH9304CfsV/0Kmhh5vA=; b=Ypjtv5zEWwHVdMGbjiURUKV2/WquaBOzP/lTOO47
	XuGhCH4N1SC/W2JUud58rQzUx6d2wv2n7tlL+dcoFsTZodnA4q8wxF4DFlbgWdPj
	1V85nn+r2voNr2k3j5W+Q6aqT9rWBLOWl/xzS0D8IMMZcS2L15Kmge7EydwCuXHm
	o/qPcDtim8Nricoai97E8Q4il9GBr9Emh/WQVezjJYRErAvAaB108c554WrmtO2f
	VbAH+YrqIiUfjeQd5ASUd2m0vx+EAFRT1x0jrKB22+DLgDT4f9La8tA72LzS8ZTJ
	PcAKSVH02tui3bv47n4X2dqonGasxdnne3GISu7a0KZ4AA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg7pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:53:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso37328031cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456439; x=1787061239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vRQOl6NGy39XYmQ/g1XtMf4DH9304CfsV/0Kmhh5vA=;
        b=F5PL6asqh4qCiNtd9RXV98Xgtj0Lele1zMzb2vYrQmqZK05xRVUA/p/VqxLp95K4js
         yHxjtXp79e5dbhIBE529jt180FiF4SKVPT1B5E/qdtuDKaQ/jwiC2zcX5w88gKYaWMh8
         GsdhwlBFlQse8MifmQVDgfdSUcZKaUymdG+9fBxVRtaQTb9YckQEDv2ibgFqBdx+D/2K
         Aq+MH3R/n1H82vJszUEYGLPpZ/x9OSJ4Bfr0+WckmpBerFGAceWWVoQooWx4+ooav45E
         CYLd3abB4zEj1hM5kB7lS25Ail+DwMB+RHAR2eqc2Ijz5lGvMoyNFs78CG/xUklGMQGJ
         0/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456439; x=1787061239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vRQOl6NGy39XYmQ/g1XtMf4DH9304CfsV/0Kmhh5vA=;
        b=k6d0I7j/fEZiHshXo/pEakOi8W35YmTJP+Es6uTvF0jxNUZqeQ5e9feN/45R05uGnz
         zL+VQmtD/2iQmCQUK2Fqr+sKO3nVcB2Wo+EWP7cfXQpijygzcMHzIDj8XhGYx2LKjMNN
         cWS2qe+w1lkayMJ1eqoKWDxi53CGrBTOS5yTeRagmQ49Ub63eo1WtNBNCgRU9q2cos8p
         voT/UY0bfr5QwsExss+up1ZKIKOTldjbdf0ysbS422mEiBkk+cA0YE6wrQRM/xk23X8p
         E7qcgYaE3N8wU5AOJK5uHWUfZMGNk/uSepp/triqU4epPfJw+oIJiFOqj35SsQYbK1iy
         tSNA==
X-Forwarded-Encrypted: i=1; AHgh+RrpBvIOckQ4UlJkfJPjjIAzJKccP5juq3G3zYMXvwUVAiF4ZJbrcxyGig4KYgdahtOBdMgTEYGZ9QKiuGS6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HrXN4EdW2qHY1lfN+wzHcRmKrd9yUSCNcIsXlW2wurJKvkHD
	PdNMhMzknSR3NkvJicoNJoXMgXitqqczHx0Czb5JSY5gWQpOG6z0ze0n8NSUDujOeWEOZXcR2h/
	6H7jVzwUHH3f8yafFTnGgKOfIj9Eg2jBSH2eyc+RrnMv07weWuvtXjF0CFA5pYbY6muYt
X-Gm-Gg: AR+sD13k2BflR9lF8obTKJM2YVQdEhev220zkMSpXCZmw2FOLCt/H51PCKBfKwm7zDR
	8kqvR+dY2yH8NxdFkK3j235XHs4Hv4gj+4s7sHjaff34n7/4vTEIDoa+fyQlDLOYqjG7eSc7x1s
	vmzTLwe3Ytb9/rXWOOHp6iBdJvs8VC25k5qtEdY/waaEQCKi2gvcPVqNxj2di2ILgK58j6T5p5k
	G1l4blMrNHQYArpa7Sj9D4sWhyl8Slw9aptRTNNzMy0iseyVOOVbxKOB1Gr9Cb3x2dOLCSSHn+E
	cIQmTQG1rkXt/fXYfY2qtANbqjjThEGaVmz+BPRLRUfgfu1JB5/c/hlb9T2P1h+1wEKqYgWCDp2
	tEBsUWOZ2r7oE6XWoIWlq9ryDliVzqsFykwhjClmRjUh46tRUI2eRnZjll63UqcSBBr3ay/mNyE
	AitW31UAms3TVQ4A==
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d586be418mr25920751cf.39.1786456438646;
        Tue, 11 Aug 2026 06:53:58 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d586be418mr25920301cf.39.1786456438168;
        Tue, 11 Aug 2026 06:53:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44872d972sm320824e87.61.2026.08.11.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:53:57 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:53:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev
Subject: Re: [PATCH] soc: qcom: smem: Add stubs for CONFIG_QCOM_SMEM=n
Message-ID: <sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj>
References: <20260811123103.210571-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811123103.210571-1-daniel.baluta@nxp.com>
X-Proofpoint-ORIG-GUID: SZSK17gEPqfU952FWz9Cg2wSNbl628Cr
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b2977 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8
 a=_EDmfq6qDiitiB09QuEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfXxJgfWuaSfYmV
 0PTOY037qqItmuSXizKy/ErRANdUUr60DGuiHkO9l7eQLKLdFDFj838mHTEFghTt63PsxZDLcxv
 cOYRr4zgh9xU5gjYZxzzePYREuPiDl9wu0+uqrOW/NYLHFZX2yed7AJBRgMlbWKQVawIpQZvLr7
 6PEaWKmH1qhb51CxSmt+2gQKZY2OFSDR/9zZVYr2vRTB6yVPar3S7m5sP9XpCXo3C+BJ2IKTDSP
 5bCRCNeocklFD3IQk3qlphz/ljVwEFqnmlR8kCimCP4fyL+qadqY8rsNF3E3ICXwvwza11rk3sv
 ErYl2C8KOATyxW1n5UXqzbDGC1h7O+uR+HWsprp/Cm+ieeIA9Ymj5n0uYBmYuPtM21+FD/pg0vA
 OW97HNGEBm3lvyaiVeL8X+NozGonS90X895mDx++ZDgFLlbM+bMceNQzLPgbDae6C+J+irWHkQQ
 nfiyO+/6tsb+6/7Sg0w==
X-Proofpoint-GUID: SZSK17gEPqfU952FWz9Cg2wSNbl628Cr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX5iK70EeWvrlN
 3S4PnzXhmAAIoK3/5e0hrii1zN+45dxrpIzh4NHbcLqKIoSv0IO/1Ifms1IOJKWBI40zjpVB2Cz
 5BZnTOGvagGmKvS4yTeeLo/QYMjD0N0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110116

On Tue, Aug 11, 2026 at 03:31:03PM +0300, Daniel Baluta wrote:
> drivers/soc/qcom/ubwc_config.c calls qcom_smem_is_available() and
> qcom_smem_dram_get_hbb() unconditionally. These symbols are provided
> by the QCOM_SMEM module, but QCOM_UBWC_CONFIG can be selected by
> DRM_MSM even on non-Qcom platforms (e.g. with SOC_IMX5) thus resulting
> in the following link error:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
>       reference to 'qcom_smem_dram_get_hbb'
> 
> Add static inline stub definitions for the !CONFIG_QCOM_SMEM case for
> all `qcom_smem_` functions in order to fix the issue above.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  include/linux/soc/qcom/smem.h | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

I think a proper fix would be to relax drm/msm dependency on UBWC_CONFIG
(limiting it to ARM64 && ARCH_QCOM) and letting UBWC_CONFIG have strict
dependency on QCOM_SMEM. WDYT?

-- 
With best wishes
Dmitry
