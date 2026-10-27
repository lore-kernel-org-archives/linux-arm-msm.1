Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142318;
	b=g69oK8vOhIJoPau0Hwna0okQoKNeEnAaSAcFCse7KMKNNWoeKQYu+UphdhAMIoPp8x6u
	 pDcRKtMH5CwXJJCVVNzUPFix/NYjt6Hhi2drotOQpwjaiU19x9Jvnfc5ZInlGxGsX9rnN
	 RQ9zRM7JjkVDWyIx/2AlpCyMx1la+Gc2Bc4vQFf+3i0gJVW4eNXrsmnhHWqLC2burL30I
	 6/yTjb4B8Et9Emj6R/nc43EP7pS9AnET05zHHiSJmUc5KCDiMNTJj+bwM5EPKpn26cQmX
	 kaKWX7dFGtdqWtMEO2r4lUUTToPY+Q0l0HNFoQdMPjBcdyO6i/pLtH8xvgdJlxRysug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
	b=UGVrVDF6opX7T8OdwICgMhdYo+5G+b/ixveXsa/GD6sO+yI8vM7Z9XSOCWbMAEkPezC0
	 jjpo89CEt/xUV5NtgtGPxQktytNJ/rzX2nraHzgoWeI8JlgE6AHVZNu40F0daRrDFEbJf
	 Q7sy00XgWrmmptbvD5wWZJ9Iy/o25fOJk0BcGxp2yGQ6SYT5ZIuVhuS3jewPiPqbm+2z4
	 VmpvCrDZ9Qw4cTj970KNKRuH0HusANDpnxFx3t4l2AnX8PBr1nK+b9ZaW0gyMq5VSfC39
	 feNyX7pfwdJzhdzemRkT4pDKGf/67EJz9vyBpXTsObE+CpIhMpbqDPYmj9xCuyNQwwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkGHl3RS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmVjaj0f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8C606A337
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B8C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkGHl3RS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmVjaj0f
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtS983285563
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CR0OA6ftLKP
	m+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=; b=nkGHl3RSf1ERpITUSE4a0xBUYBZ
	EsSdtU5bHmzKkqRBnB7FvZMlwK7p5HSYGjaHgFKD9DCxdadCuWrlZYlnoNYYW1io
	qWBOwHHtoM1NiPQfUaliJEFRiozw29KxMhdSNx8U+/x8nPebYDtWcabYChPdmfQW
	xBuXsVTAq6dbnxRCVfkF4lbgc++lR1ojCS1PR/9xcEXQd5JuBH8oYSPopohZdlvu
	kUaDUeMPkHlg1B5XaZWxTQNFcAsNL94pY9NClcnaXMi0KBOzKFDKt/npJyziVz3a
	5ySYWHgr/sRHpIqJ3E8SIN632/DC3ip5xtotaDu+yow4qdYU1NBDfDfk5Ng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6bbf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so487253a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142316; x=1793747116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
        b=ZmVjaj0fwCwgWqrSfvs246tKEHQN8HeEEvuJSMJoORYp8Y0f+nffUGdnt4MI6WwnrN
         aG5MUStVsEQMjhIOPi36kX3dU9vUZ75NtMcTpbrAEg9OFxdbHbWYBYt6QccGOX2zIwik
         ZDaCJKQQtEDRJrq2kHzjyqEGVSMRAvchaxFTwBSvZ9RBuMiGKerIDfmCTZ8XeYNkEwet
         pjWkNRjx/hbCUKLUTxqv8JWeloMyWf2WUlT9jUJUNfwJ67lyiVpUpmkdp90q174aPVDa
         m2UlLUSYM2r4FJKQ65jEwpTRCU7EsEoKVdFgND7leq+cGxv0iPapQ+T4WfwN+S8OhHRf
         TOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142316; x=1793747116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
        b=bSeWqjCjD9NuM9mIOLF3VzgLpH/WzwmKOAGKDX9dI31N/Zzp1/ZieRwJz2gaa2fDO0
         dKrSIA4+Rq76cbU9NM+6mte3rN3wE13wXLuLRhhbgofpxFPyHJAbW5hsMAAtvC+yCkV3
         08whaSGlgDWuv1Un7VePI+slIitEutLGj8zjFATv5zT7/F4aUwuqZuLr/Ckwc+G0jD44
         8YYhg/u6TYmNv2yu1XNoMftiKLYS+/i8LbihHqPI9OOvYGGRhOFCqy/JpxewGtCV57qJ
         IrdnDkO8CGIJYKmKDj8bFRYoVdUinp449/We7RtViSLKeIzxz6p0c8CCfLtEH3ZePs40
         8xbg==
X-Gm-Message-State: AFq9FYKHOFUEZ7cbC2LDE0ILRBdQTa+S+SwCvCzFGjk8DPTrE4wpZmpW
	mo7J9TXkVdXdd6SUtUt6Yn+f79zchAGAS+s0BHaT2oL3vVOwjDeHroaAeK/DXCaDznOeHH2O6c7
	APaJJy4hs3C3q0dePgr0zqmbR9OLc1QTbzoeB6AK/OxjbLQAz/qmG6U6O0IMh1tFBcLhE
X-Gm-Gg: AYBFou2dLX2YZdeY1rbjnrGZ628Q4uMFUAjGJmbM3CrXBewyJZ+um5xi06T0N3IEp5F
	4FouhhaFuLzPfeKTQigy69/QbMG5crtEUGuVAbuHIGFptljr1thFxMaLQDG9UiWfFbgaaQd8LHn
	Xn8RpsYn0NJdrL5B/BpzKePZ8oWFmvq4ACh2CsDkoi1+bJYwR/nmuGcnE9XS14Nz94hW9BGjz/4
	/Kt71V/ufxfFmf4C5aMgokh9alpUgwR+ycnbcr2viDIIsK986MSYmmL16FVkMemlokyhUKZoXOH
	21RNTd8dH9LDXBUIyjmgUa3aG0sA7dUM4pvTzTvWKfJA2gDO2nhotSU1Kn8627wQUEWMN6QqQ2l
	TMlpYsIIlhcHlw370a6b9Oc0gZp0FTgdLdkJP0Kfca2Yi3MAI
X-Received: by 2002:a17:90b:3811:b0:3ad:ce34:f63c with SMTP id 98e67ed59e1d1-3ae582279a3mr421104a91.30.1793142315917;
        Tue, 27 Oct 2026 16:05:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:3ad:ce34:f63c with SMTP id 98e67ed59e1d1-3ae582279a3mr421071a91.30.1793142315409;
        Tue, 27 Oct 2026 16:05:15 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a2fae4sm334864a91.4.2026.10.27.16.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/6] drm/msm: Convert iommu map/unmap to helpers
Date: Tue, 27 Oct 2026 16:04:47 -0700
Message-ID: <20261027230452.130031-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae12e2d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=3T_YcleVrN8O_gWOTnoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MPRjz5bhHexp4jDvhc3IWo9AxEidkx9J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfXxfS3CcAEGOf1
 NhQwuAfWeHeK6spjR0eTaOTCfHyahe/6J/8ajVVmjM0O1ve4lDmom65tAIr/on4SLB2WOxpsMoY
 D7G3T0Zz3oiWyUKJjJh0YbFqyGgBl6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9u8W9jtSshOt
 Kip4ZJvDiHaY0FPjXZgvW8LB1LodT6uBD3xBUsSgvsU29t25wfT/C3p3n4nNyiXxn+N37WV8U8W
 I6Tm4+0pwrxhRpusZ9QkLRf45jv4jHgjnJTTZtHoG1zqx0Vp6hPG8O6qvvfYGI+Ohr/78w2xd88
 u/vEpNNh8kH5hHODXMEPR2hY2nSf/9VLHLRNB9aOjCgKjwHIKcTb1ekqYpAsIpH5y+f08umZpBB
 GMSbqcaYemKQ5l4t9GdewSVyP11u/IEWCDmeSC+wH55OMBdOSSYWq2oa44Be4t5KBoSQ0BK7+qM
 OUFCRrdjBsAF6j8Ka+6vAw6hSZxoSGKSiD6OXhyLx8MeEcJXvLheKnx7IUQ78XMwiftqS/4TLSb
 W0PnSRpSYDVyuoWVMpLiDyS03Svd2xOJvEUpJsjv00w5sbM1r3c3k26gmo9PBKxn64tFaQZ66ph
 zUsSqn0VxuI5xxYsE4g==
X-Proofpoint-ORIG-GUID: MPRjz5bhHexp4jDvhc3IWo9AxEidkx9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270093

Re-use the previously introduced map/unmap helpers in the iommu path
(TTBR1 for GPU, ie. kernel managed buffers, and display/etc).

The callbacks work in terms of iommu_domain/ops instead of io_pgtable.
It would be kinda nice to just deal with io_pgtable, but the tlb ops
that arm-smmu uses for it's own io_pgtable require doing runpm, which
we wouldn't otherwise be able to do.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 43 ++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5c13ad6d5a36..479e5450a4dc 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -731,12 +731,38 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	iommu_detach_device(iommu->domain, mmu->dev);
 }
 
+static size_t
+__unmap_iommu(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->unmap_pages(domain, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_iommu(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	    size_t pgcount, int prot, size_t *mapped)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->map_pages(domain, iova, paddr, pgsize, pgcount,
+				      prot, GFP_KERNEL, mapped);
+}
+
+static void
+__flush_iommu(void *arg)
+{
+	struct iommu_domain *domain = arg;
+	iommu_flush_iotlb_all(domain);
+}
+
+static const struct map_ops iommu_ops = {
+	__unmap_iommu, __map_iommu, __flush_iommu
+};
+
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 struct sg_table *sgt, size_t off, size_t len,
 			 int prot)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	ssize_t ret;
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	WARN_ON(off != 0);
 
@@ -744,23 +770,18 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	if (ret < 0)
-		return ret;
-
-	return (ret == len) ? 0 : -EINVAL;
+	return __do_map(domain->pgsize_bitmap, iova, sgt, off, len, prot,
+			domain, &iommu_ops);
 }
 
 static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	iommu_unmap(iommu->domain, iova, len);
-
-	return 0;
+	return __do_unmap(domain->pgsize_bitmap, iova, len, domain, &iommu_ops);
 }
 
 static void msm_iommu_destroy(struct msm_mmu *mmu)
-- 
2.56.0

