Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6053F38AC7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825395; cv=none; b=sMA5K3EhB+Z3224GeX40jzxRXU5NJOyIaTNQlpypUYUFStXg0SIbG0LjidI5mnPejlJHL5+qtRhM/KI8ahqx4oJKYu2/F+uzPcpswtz5ItuTJUzV/iXaEgZyKZV87SRqYJ02KOQWhvTwziIkqnPYfxsbnUGKXwYlyQkVLBPOZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825395; c=relaxed/simple;
	bh=dm3dowMCjPuMdklAeyOb8nCLf360PgurVePeLF/upSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgyl5MDCb/fbXLsLvhwYvxvhZEZmvqfqiYIrX/6g4nhf0bfsoxCPT+2IEIfuxDLjKnGvR1OmR5O1xCx4bQdf2CuVL8eGYhM/QmnDUM6uxVt1pT8YPa2zzNg1rMSQcMe6AXlfSSohvijT/vslGzOPQ88ZuIS2BD9Dt+x2k+7LmyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCY6Gehn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMy0FFuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCY6Gehn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMy0FFuJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvHf03951253
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dPfm6ZP6GvJfr7jNxJpE88Hh
	K0+SBhZcSJwa9rTdVGA=; b=JCY6Gehn1s6VDwQyUPrbRQjtVt+HPz6AMqOs1jVf
	2imCrGJu0j6aqVwdNoJdNU0ZM9PPTtSpTCWHTp4hFj6HXXZ7h4wwwSJBejp2T94r
	zC4YWCFfEgOevCrbbtk0wKQGMi2evvv+gySqiZUr85/la+lU8SwzSbyJbCmfnZZg
	29rmCQgaFyFXSaP2k3ZT1+AUzdfqHNiFcumDZ9qTiqdB71rbSljhjqjSgNIFq12h
	w/PNg4NxO3yNAZoEtHEWW8FDW6svpWeM7XvXYi2y47qhBOjLzNSc9ostIUJvtEn0
	uKVBsH88XrKFZbh39okAy+NdnBB12Qz9uNXu5gU9uzg6Ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu9cda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:49:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1266244a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784825393; x=1785430193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPfm6ZP6GvJfr7jNxJpE88HhK0+SBhZcSJwa9rTdVGA=;
        b=GMy0FFuJAAwTVwYreRHUFRCTt3akvGQK5TAQL9XqARRQnP+Nd+jcxgxEhSdGW7zdBq
         Cqb8EcMOVBAn4ORdBJfdyVbj5xBDpuO3R9X47FJDHrMmhtIsuPiGB96U4OmG+/4jlJgD
         sU97CmVKSEAmNomMH/oywAsBKT7xQ1SHsD953r4lqMykcm019nxF2RvTsxgBcYuTP3au
         yrKxLGQRgKsaOBTIpxu7OGBKNMzV23FhdIa6ImqfeJ+9ZzAeJ4GzLcN/LMWwMoMob38M
         Rd3Fgu/VKxA1f9yprZWjkO6zkuXLpsHKunZeDO/PQ4LGF+vdaMWH21JPRvGI7/+pu39u
         1ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825393; x=1785430193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPfm6ZP6GvJfr7jNxJpE88HhK0+SBhZcSJwa9rTdVGA=;
        b=pm6xseVhYtshqYpjhHCS/k5LopqbUHwDoNCEAr1NOhSTY9R02L/H+FZf/17jJ8bnms
         XP8y6MuzuuOlh+dDePkgmfVwRYHrqGFYblUU/q8QUjLmO5L6e4Nd8j+oZt01dVHzxqr7
         nIM8ce9pDswSmt0ZuCOyb0viXWW5ykAsPQsqiNv9L4SfFhXb5Ec+/fnic+IOVrVwkXbA
         BBdGOK0II746WcgPT5RqDO8HkN3lQO+3IJI9VPbCeYCO49DrjTpZ/IscpPvpI3oJZpvI
         FqCX1CCp76cRb9hjwCiEOSqYJodq4yn5jcG2qLAs0rX/gfcDJpHjgXQ8MH5ffpVngH8h
         zKIg==
X-Forwarded-Encrypted: i=1; AHgh+RpaiJEA6fTLb7vzRvS+d07C/OBbYvrOySXM8Md0d+w19Dk88Wr5geaFv2GM16KJRYwNmvIOdbD2tehsuNlE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5oKX+tpL5YENoN2T7jz3j6qR4AgqjzEuFeC3tn+EFkrhWC+uI
	a/yllMxwZauzf1n/ovriRuWz/rwJsOX7HxNKeqDINvZbVWl+rXMC6YURXQntQuQeHNnzojC+8fT
	yrLe2mqwyBdWVQXHY/00GnJFxDt1FUArlt9Uuhpt6/wczwn/NUiwViwwmSKy6my65uAHh
X-Gm-Gg: AR+sD12ayC/kFnbBmwKj7KAkSRSkoXtNtxnN+opgozHLVhm9OVTYc/4E+jh0pk0eIt/
	tVGFPBVsWAFgUV97qix9a/euPY5JufS2NqgCNj3xPymxrfzxptifZmhz3zf8cJdq/wJS+Kao8d+
	Sv2sHPMpyi5FSIF1gRAtm0kMtWeGgEMUFJIAJstTINKT79RAsykqEq1GESOHLDF0LabJLII0ILf
	VTg1/Nnx+pJyYT5aBIOk1SXZh2PvcDcE5thN4+DVMN8CL+yrENliEkaa4dJX9gP2D+vV3ZAFKho
	vjetPuvjLJ/K+QblwvbGWwMP3vsE8CKB8v0YODcGrbaiSDpcj8tSgWDeZuN3jgxVcEC1g40yqHy
	6sczyvt4EdkdtzRU7AVRiAH7k3YY=
X-Received: by 2002:a05:6a21:1fc5:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c44b2740b9mr4729558637.67.1784825392837;
        Thu, 23 Jul 2026 09:49:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc5:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c44b2740b9mr4729510637.67.1784825392260;
        Thu, 23 Jul 2026 09:49:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm16413540c88.11.2026.07.23.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:49:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:19:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Weimin Xiong <xiongwm2026@163.com>, catalin.marinas@arm.com,
        kernel-team@android.com, robin.clark@oss.qualcomm.com, joro@8bytes.org,
        robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] iommu/msm: Fix dangling list entry on probe failure
Message-ID: <20260723164944.hglmw7kgbikfgtcx@hu-mojha-hyd.qualcomm.com>
References: <20260716013229.91014-1-xiongwm2026@163.com>
 <20260716085313.207069-1-xiongwm2026@163.com>
 <178472575580.2876636.12194314237571577379.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178472575580.2876636.12194314237571577379.b4-ty@kernel.org>
X-Proofpoint-ORIG-GUID: dFdJQILzMtXSMvnYBLmg4o6BzGH3eINf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NSBTYWx0ZWRfX1t8jb6g/pYDI
 qGkwl0+yuT2xNjBoJmQY40h0HqQ30rLesnncPH/gtH/2uvcinMHj79Ko/xc1fQST2sJ53/5rA4L
 ArJ+NTSkMkGOT256q1X69aHvW8gl4+sKvQNfcYwp3dMVOoMVKzke97ahZiHaHiooW5OGpdZE3Y3
 5N45eKxwXYe4fA1+H0hjR6nUXtqwl1PvozmsJk/geFZPpYDViUeBz3MBopSz83NQ2YZShbbvPcl
 XUGmk9+SlFbUrD9yCmA0LCQqZFBWYBK6vZhzVv0bEBaoJXWrnaoanFKR8KSV/PY1HlLINt5A3pd
 IWbRSBdJpgpUzrAHdi/DUxwVGlCqcti8vLbEyjlkTzgG9P03r7V1CZzWacM96ji45tXOqpabjSM
 ug+7LKeu0cSIPX5cFmfzrfzvQZ4+Y2NkGxLfZi9R4so0OUyAnC1xdF20Z9+Odd6tSREH5FN9Uci
 FzdntgerF57FoHsATfA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a624631 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=mXi61DHN7hnhVxcJtqAA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NSBTYWx0ZWRfXwgsBN812SmW/
 3O3x7ASWVOovgd6nqV9qxTdDSISFSOle9iSB6ERLAHzDM+qyr0MinADEjuU8ZN58ZlPc3MjQl3G
 TNIXXw94tf8najkW8VvWLUKsXzmgRyw=
X-Proofpoint-GUID: dFdJQILzMtXSMvnYBLmg4o6BzGH3eINf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230165

On Wed, Jul 22, 2026 at 10:39:34PM +0100, Will Deacon wrote:
> On Thu, 16 Jul 2026 16:53:12 +0800, Weimin Xiong wrote:
> > Move the list_add() call to the end of msm_iommu_probe() instead of
> > adding cleanup paths, which avoids the dangling list entry problem
> > entirely (suggested by Mukesh Ojha).
> > 
> > This approach simplifies the code by ensuring the iommu device is
> > never added to the global list until after all potential failure
> > points have passed.
> > 
> > [...]
> 
> Applied to iommu (qualcomm/msm), thanks!
> 
> [1/1] iommu/msm: Fix dangling list entry on probe failure
>       https://git.kernel.org/iommu/c/6bea37b176b8

Will,

By mistake you have taken the wrong one; it should be v2, not v3 that
should be picked. Sorry for the confusion.

-- 
-Mukesh Ojha
