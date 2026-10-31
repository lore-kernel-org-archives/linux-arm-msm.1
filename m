Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460459;
	b=BfxcBsGU83YdQ+1GOp+Git/HN9rr0YBIYw+63kb90Fe1UuqceSys20mzhAjwtNB30Puo
	 /dWUmKTaOZyc9xQKFbNhPo6cD/0ArzYiO2tlG1DFYfbc4yDY0MQDxdY35CkYiPnraj747
	 1diVnqlEu0WqVpa22Unr/eifDnFEkhJuUJsREA8igfXkHO7V5leFHdHX47PZs5yNLBMar
	 2lD1hMdxonc5HP6FWTq/yYGC6lulavyZgoJPXJJCwZUV1zgqxBENeBpw/iPnMzYzo/bK8
	 GgqjiUS6n0WrE3cu/ZPnWVWIPlbwqLHh1N3hrw0btTgCTwIleBxVEnAJvxgkVXIDm/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
	b=MbpezS2dZ21nD9xi47wlutnUbjYVOUhUi9QywmGvhjEZ5d9b1RPM6YRQB+4u8aFx901N
	 mygji01juc+Mu6XhqqVTE1tnUataJYa49ZFBkvgUeiVEDvLyadPYV6a/AsUULkNLDN6IK
	 ei4ITr+KhxK2P2lWkJVAHMxdq0H+P5X/iPDdf2yjCHLworsWm4/cySD+hsaBhAKhNqgKL
	 RLo1aM7GttqkEEUZGyX/MstCD3COQwnfB19pLnNmiL6G5iiCxGgPM5kFwr20cXk0lCGu9
	 ExE6HXPJ0AFa/rtJ8G7Q6iwSFZF827LirBy1bSDmXUL8HZl0JBxHZTh+/gLHtoJyS5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJvFxJvg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyPWHxAD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF833606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF833606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJvFxJvg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyPWHxAD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0n7L1129166
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=; b=FJ
	vFxJvgYCstEvbDKYUxxz1B9BCgQ0xfgx/UEGaF1nIXCswS1rwnxg2MGi4LH9mC/z
	m0CNX+MrrlBxER6K9e5WE7YFVR9cU4n06eirW9IXTWyr1WFHRfuQmTguT2TwbH3n
	nhM+M/w8FkQrlv9aWpmXsP5h5wG+5lDPvwpU+Ly9sTZ588JDZKn+bkKKujwO2MY3
	gvDJoWlR6s8NwUwgmZdHpJ1vr++wRrHyUSoJAs7yW5rocMv+ZNdTHDP4T99XFnZk
	+JRc4j8CgPg9nqu36ovtuGDjuaU8DlNHOa7Qu3MQET/V8i6+Tb0v/jhTmy64kdAj
	7MO7z2UqRBPzaEBkf1xg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7sbq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:27:37 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-48296f34f1dso1492747fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460457; cv=none;
        d=google.com; s=arc-20260327;
        b=q4hi0tsJPvyq2R/aZdCUPUQWDKlYVNlxXCbYdP1lwtS7dF7nQ85EK609gKh7TmUhI2
         m6Nf4mzLeXfik6ptgOkCpWaZ1eesu66rPPQJgUtTsMmZQRMicOSSW8NIZXlE0NQI0Ug5
         CmuOkD3z5Rl5Xu1TBXTy3DVxnB5k5nV12aKV2Enjlu1IvlTq5gNmNLDjAhLUxLWQP11/
         HqAW9XOOFsISDy456C7wRd8dyUSLfGmMC7ZWnm/mGJ1J0/jb7xT8O9lQ3SbmHyj1SUNq
         DzcIIz1QMDjvfKmuaE+jNclV+8sLK3A5QrIHhlkd6coVqhGamUAO1fF9CtG4Zual3Q/9
         bcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        fh=/ph9/+USCj9biMAMavpBkXJAzMnI5zK6tuSktHSXvBc=;
        b=asoBbAExtehDw7HkH2hj4G7Tr5VsrYwn1DRNi17mtgImllwhKara63Ah+Pz17k+nHR
         pZgCIzXkVSBbOCRa/QRhDeRPdn7OZUMy51PurbyR+L2SATIIyDw9k3eHg5qpHw4PuRa9
         XggzY4jjcimWpjDzLTkHu+2EfYkTaTfakiV1i4ZZvRYGLRApEeiDvk6eF80HXNA+cBgs
         /oJyYmJFwh8FPDXy/WlBuVyXDBsQdI7L1tppiiq7fJUMj+F8dZYjX5qSr2FHC3UrpiLU
         bi8IRXgG/udfN3D6E0ej8VYEfOcmaQW9sUse2degpi59fLYz0mHceWz2w0iPhR2BuoLP
         9YBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460457; x=1794065257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        b=PyPWHxADp1pWjWDSDTGV9orzS15rjIGMYWdiFuyXYSRB6pKNQI/fZsixMqmqJQyNe2
         GVT8pfLkb9lGBwL6z4kmIDyIaObMIa1IVxFEqWYIj2+xQl+fFfLhneL9x4Fx77RRbJ94
         XvLdUXWzxi3239joHCOOJL5RONN9I7N68xs6o996liqeW4/dk3uHx0CMqnFwAnvpBQ2K
         CJjiXfAqReA576EFBQLMcZuSHzrE5EUHJhbUIfDf/r4AR1sI1ZZcNFnqKq96L7zwCeYb
         6ftu66MWux4zcsERnsRBMDWB3wL17YZ2T8dzWHqFSpqKT1iT+3N/YTgX0Km3E2vhLbAT
         guWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460457; x=1794065257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        b=2QDG+dm5YTfd8Ui/0jLq0JhTAu9/H3A2dUXrIRRC90ECNg1u9EXX7CqioiSKeROdeB
         0M3JLk36PmQwThTYh89bIwaWhcsQYUntYARCVQGHobN2DmCyjmMY0wpDZ4IsxZuxtsmV
         WTzLKcvLPb3Y8MQ9iUPT/gruxWmWROBOf7UMqVWlsQy/G1mYvjQaZZnSi7g2WviXBfgU
         tYUK26eLv7SmwlBGxThc2xMXSBOPJEy+yh00qFUr26VOhWoPdgjm7Azot8/6pqfrG7eR
         yg+fVYFtz3fqsZ7tkpUvUvNbw+BMCpkstnrTBPkPFk/t5VMuJcuWCFGFd5TjnQWPJlo7
         DKgg==
X-Forwarded-Encrypted: i=1; AKwUvByQI5/rnj2cxvIGisclaEPtw+qyWYLKSpWBG4QyDgmR2duGggCanm3fDseu5flPK7+Cvlydf33yoce8Enko@vger.kernel.org
X-Gm-Message-State: AFq9FYIGizEa2eSNhy4/B3wfdNK3nqSloW2Po3H3JLT46D4TrxNUNnOa
	LWadpEsmHeRn9VnPNL1oZU46hpvPIfe+US2ufGjSSg0KhT4mJNbUCj9xVPn/DkDu6SztemRCRGv
	S34VC4kaJttGgM2VQINcvlAbhxFugS4R6e6U78n9WIQGiVJSPTr0Z5CFqXJ+WbFqGg95josHIkh
	i5mefsLgRwLAYMa3jZ6yos6RqUgv+WO3hTiTu9iEfFPMA=
X-Gm-Gg: AYBFou09Qbd/eGByzMkvhNw4cHMxbPu7t7CF68WVm6hUjlEH0wH0GKmPRJ0XmngQTfn
	HH+a0nlajT0V+nRY9AWKvAv9E5Yw5fTIFGaOxF4ov06VEzUHUpgjW/6LcXkeHudzisnSL7Qa7Ut
	B9bBfq7C+T8Tfso7LNoUb/2vur3SBcFWEMIWFjTAKx5nvP4OJYDp7y6KZ6Kg==
X-Received: by 2002:a05:6870:82ab:b0:4a6:d85c:a3f2 with SMTP id 586e51a60fabf-4a907684d6cmr3466582fac.33.1793460456903;
        Sat, 31 Oct 2026 08:27:36 -0700 (PDT)
X-Received: by 2002:a05:6870:82ab:b0:4a6:d85c:a3f2 with SMTP id
 586e51a60fabf-4a907684d6cmr3466570fac.33.1793460456464; Sat, 31 Oct 2026
 08:27:36 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:27:25 -0700
X-Gm-Features: AclHuK-pzJRTbh4UTFiq0fs-4bAqq6ic9ym9r9ejSwbktmESwt9yc0oaaUOjgyA
Message-ID: <CACSVV01pWNJsLLek+az=uHbt1-Cavv5M=QhX=xD6_AG9J+magw@mail.gmail.com>
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Ai7Y5AMqkbdJJqsz20AGCunGi4BypUGt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX5rzC+qRjrFjl
 mLeap3ynf03KiC5PJgJwT2JHTruNHU6BdrTtbSqAsC2Deo4TgUOoCA27smEs9XSpIBnjAqaf5rw
 He1NtZzsbv+K5f2wHaKcY59e6Xrr3q8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX0MaYdPn2V2W9
 +IommYg0PN+jduPQtXti54RpquYP6JCFEOo1HMT4vLMp4leZlp0V5yC6NjAxUa5pEJQG/Zk1Y5N
 9afHhC1bG3151EOqRHm3BJWeQNMYjsyp0CfcaJlO/Ol1CQBdKF9lhisngIlQqS77DhkM/wmsFGL
 nFTZWLkD75miMmXFX7cVEawdehp93cs7nBZ/ybd0htJY8BY9I5KaFp8Vv0KR4mQx70nI89UCRmG
 tGaIw4PPdX5X4iXI9YiSlZPINb6Ck5cGxA2WCJK5RLlns+QumzPctGqfAVOqm1pf3sr+oA6M0xb
 6CaIm80VuEGABtREzsvweu8oZYK+oUnCm226cli0i073sTyAc260Ox79cFZFB/HqOyJ9SxGmmCo
 VhqKdpU4J9kU1eR2qZ7BJ6vYcVSSwvcFSSTD2OWplZh/2oH7wqxvmFhw8KCOv2n5iTdN6OJiXDx
 4pN4jvPrpmXBwzFzirw==
X-Proofpoint-GUID: Ai7Y5AMqkbdJJqsz20AGCunGi4BypUGt
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae608e9 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=BFTSSJhH0xhXNpwrsgYA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
>
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 21d18ce67b98..54130c32056a 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu=
_domain *domain)
>                 return;
>
>         pm_runtime_get_sync(qcom_domain->iommu->dev);
> -       qcom_iommu_tlb_sync(pgtable->cookie);
> +       qcom_iommu_tlb_inv_context(pgtable->cookie);
>         pm_runtime_put_sync(qcom_domain->iommu->dev);
>  }
>
>  static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
>                                   struct iommu_iotlb_gather *gather)
>  {
> -       qcom_iommu_flush_iotlb_all(domain);
> +       struct qcom_iommu_domain *qcom_domain =3D to_qcom_iommu_domain(do=
main);
> +       struct io_pgtable *pgtable =3D container_of(qcom_domain->pgtbl_op=
s,
> +                                                 struct io_pgtable, ops)=
;
> +       if (!qcom_domain->pgtbl_ops)
> +               return;
> +
> +       pm_runtime_get_sync(qcom_domain->iommu->dev);
> +       qcom_iommu_tlb_sync(pgtable->cookie);
> +       pm_runtime_put_sync(qcom_domain->iommu->dev);
>  }
>
>  static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
>
> --
> 2.47.3
>
