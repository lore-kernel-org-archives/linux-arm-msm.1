Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142317;
	b=HNNLoeczs7y5Vh3B3we/TxASeE+OnN5b8825j0euKsC3L+loeOriGdFSNZJMfYjFO3eg
	 xcn6wu/Mm1BgCNvbm76i4V9sdZoaXmV/N+WliW7qNInRii85tINO8OHBTMt+p1GS/iLHG
	 j4tMxXpMhbrYfOxmqNlcwB9TCCVrTybsRNbEyA6is0z+cIgawxeOqKS9+7RxOhB0yZqqP
	 nMmoWNhHAGIbob/vmJDNf+aL11pSQWZkYRX4upY2cAU8dXJEDY1kdkVftyKdjWeIl29rn
	 t89yi5pKWYXwxKR8QLrw25NUEQLeUKw7l72T7A2P+AQ4gkQcq5ddjhrQ6erj+sP3TmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
	b=q4FGEt6s+45OxhfE5zPENFBy4tLzB2U0Z0XLQXMmd5wo3J+MBCtiNZhH6FIvmlL5tem9
	 bICv8/hA2880NuAAD9XSgqL/W6wQmpFmoUAOX9JVD26GVt6hC7a5Fp8P7q62k4hrdoVPk
	 rbfWCbhhphqhdZsdgRq/0IL3MA+1fyz+aVjH/10gLUv9YtN/nVM4UC/ZNUlXQamVc70PY
	 03tSL7AFegkv2W87dxdNTljS7jOgtp25+tlLE/2fNMdq9COeBLTvE36oHnHJ6C1WGbgjK
	 IDkOg3cbkvkuzsn1x7Bj/fUHqdOsKFt3jdbxrlQgEE//U1uX9FK8H35v9G4MrkPPJMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNrOcGbA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pql0CwyI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBB8606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBB8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNrOcGbA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pql0CwyI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKt1rr3822704
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3A6r6krJwA2
	+ooPkO/GTStseFtBhZbXE17EJlS5WROk=; b=RNrOcGbAtg8CSmQX7FShR0ZUyap
	25h1mNsJzerNfhVGtd/tXv4As9oD4PzSR0D+jLVfhSwZNG+gwptIRJilRzMEsSc5
	rL74S/tsAN3pXgXEOgq7GWvHOJKq14NTRFWvj/NASuamgyvCJh7ISI/t2EdbjFGL
	3W0K/aNz9lSJznGCgWIWAUOlbyrI6TT3MMpxsaH2oYSD4pesYtKQbeVJ3xNC3VIV
	VyMOrpVj6sllCkXp2ocZtZiWpm2xvAm51Pj0Tn7c3A5i3HzqEQSywfiqFu2Rtf6z
	v3aav1C22iERqtde7AySFD2csbPfgca4fXk6hnlYUAH3r0iUlinr7xNDxHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk2qe0hcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so280954a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142315; x=1793747115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
        b=Pql0CwyI5QyGg82tjXdFyr2XVFMqCvXEKsQUrcuepzPVC0fIpLShSN7SFvIjlLfloK
         NS+JO1NBsK3JMPnA8W1+N+VnC1j1cz5YuuPhFvKl4c7TgAu7HKT8eaDPVQVFOnfyiX+B
         Cm/DBYsK7JMofzXROiH6KmtJRq3uPD0G1/qZBMfKmxiL0FElX7z34oZmsQxNfZ7Zc/ST
         IUgJN3N5bwspKxDgoxWliqrmB71KcxpMFqaRVvssMYqNgwZVQwmwNhTpaYfqriEUczOz
         r5rJXk4Fa28m1DnQ585i4Qf3PCmuLzyM+XPaQc4m0/S3pM1nUCTXVQmlEP//ghrFPfYE
         KbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142315; x=1793747115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
        b=ToXZKCRtSc9mFvMKzOsco/8UraV0grjrZ2DM74WiYDvdN4jCEvD3dRo1F1uB0jU46m
         a3L4YA/bbRGwd9psclM2y/icTCu35A1picPVdgGIfWMIDGKuLJ0fVflhFUNFCvLlt2Y4
         ux2FkuWRztJgR/RCJZUI597IGiX2GVhSAjV77DC00gVOPVOmr0V6IR+0hHON8CWeFaz2
         0oyyyseKrx7FKgvpow7eFAAh8PwFDsGue717EkT+gjIKAPggSmLf3PQ2Fj7gFmSv2bJR
         j3QrKjygT+pDKPUk9itGjqGTSWhox194Dwv+e0ijp6YS2xzpCqmE+DKAaewdaJMgqSzd
         4E9Q==
X-Gm-Message-State: AFq9FYLOhNt38ldGpIfeRcf4Np01A6rHVhLZPzgrWgEK4RGbZEnRwsnf
	TYMeLQujeiFCSBXT33bN9b+ioENOvbJs9Onzr+UYsrS/yhV3hKVzqKTREyGl2+51u7ypRRFUwk3
	GLLWnbn+XxP3D1fJmTZ6U3YU95I1LFKiJ8BC6+7zY6BqtfvElbdLmdUu3uxVUZ2WpY8az
X-Gm-Gg: AYBFou1uTNAvlkRTkZkUe3ftxKj23P4anVIGIkqmbw0cdfp+XoRzjsWDbAP3ueL8jrB
	3JBtZu57cSd1zJ8UHYt7iL2HNhFRfJQ87i83/XCUqaapEcLyR2aJ45P/X6rasvO/3L/6KICUWgy
	nUUJVmYb1Z2+CbkVoQuVO9fMFEkyqTgYPvck2mc4ThILFViUQgZzUofBgXbN4zkB+VGW7fguUyi
	es3K+phe7SRd+Iy7pnznlt+i+R9Y4zcJ6XoE3zKGflBPnxJ14FXzuBpkgtIimsfoWT1x/Y6pE4P
	Yv6MEp0jelXMbkwA63o17770ni0TxvIjz/MOBBa+aa7Wdel6EKVlW9pcwLyT/28LdLhWk8o/XxQ
	SjDZwSgmSbf9HqN8G2bHAh50ZRaXSPG/AtWlX4VxSyaAhEm6nOw==
X-Received: by 2002:a17:90a:d00c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae58182be0mr247638a91.33.1793142314606;
        Tue, 27 Oct 2026 16:05:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d00c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae58182be0mr247620a91.33.1793142314089;
        Tue, 27 Oct 2026 16:05:14 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm215748a91.16.2026.10.27.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:13 -0700 (PDT)
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
Subject: [PATCH v3 3/6] drm/msm: Extract out map/unmap helpers
Date: Tue, 27 Oct 2026 16:04:46 -0700
Message-ID: <20261027230452.130031-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Q61Vazw5llzzGofmKpn_wleBTBmY9lAJ
X-Authority-Analysis: v=2.4 cv=YuGa1IYX c=1 sm=1 tr=0 ts=6ae12e2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BsEuFZ40A6pGwezTnxoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX596oekV4g+jk
 mF2mxKajfO6M5sBGAInMee4f+cfSm6pqwg+1t47B40cr1loRdEpAGuYxVjFXDMHldhHagpdHewt
 Nm7iFUYvHijypeK4ezsShlqdHvmLeAQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX8tkrIHUtZEit
 9kIoYi7vzUMef/1GDgivDPgVxsb2S8ges7BHsFiHmnj4tjtm/N9aA46fHe8G93NmdM5HL00O9oZ
 YIA6Olwq82nkGybhP+F3SAJuuoy+8tDEf/EPo6E5fm5oaiI4x4e53tp2Woj6WflOlX8PnW7UOdj
 E+dyLKt+evwXRVNHFbLo57cH9dKsN5xpRKlApS4me2alBD6D3h0ZAQbz/9Bt/fU65uDPOd/fcpD
 cFAoUk/5iuXCc+r5WyOt/qPyxRGC7bRDLF4BqV5AUZsnEssHhkoieFYnnhTKs4zH89fGi32masH
 TnQUIA+Jm7jN33qwOtrd0SKmfUtRpS16UA7tskHUfNUnlnlNWQyqYGgeymiPVfg3ZhHPRRRO1NU
 u4qPS2Ce3hFTTbArlP64lfzf3PnqVbkSwO9eEoTJ8nK8trt350wzDTx8/g7WioLFOea/aA61YKp
 JZFJgFkiSUlvvViExeg==
X-Proofpoint-ORIG-GUID: Q61Vazw5llzzGofmKpn_wleBTBmY9lAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

We're going to re-use these in the next commit.  No functional changes,
just some ugly callbacks.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 159 +++++++++++++++++++++-----------
 1 file changed, 103 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index da6782fca6bd..5c13ad6d5a36 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -52,9 +52,8 @@ static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 }
 
 /* based on iommu_pgsize() in iommu.c: */
-static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
-			   unsigned long iova, phys_addr_t paddr,
-			   size_t size, size_t *count)
+static size_t calc_pgsize(unsigned long pgsize_bitmap, unsigned long iova,
+			  phys_addr_t paddr, size_t size, size_t *count)
 {
 	unsigned int pgsize_idx, pgsize_idx_next;
 	unsigned long pgsizes;
@@ -62,7 +61,7 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 	unsigned long addr_merge = paddr | iova;
 
 	/* Page sizes supported by the hardware and small enough for @size */
-	pgsizes = pagetable->pgsize_bitmap & GENMASK(__fls(size), 0);
+	pgsizes = pgsize_bitmap & GENMASK(__fls(size), 0);
 
 	/* Constrain the page sizes further based on the maximum alignment */
 	if (likely(addr_merge))
@@ -78,7 +77,7 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 		return pgsize;
 
 	/* Find the next biggest support page size, if it exists */
-	pgsizes = pagetable->pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
+	pgsizes = pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
 	if (!pgsizes)
 		goto out_set_count;
 
@@ -107,24 +106,30 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 	return pgsize;
 }
 
-static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
-		size_t size)
+struct map_ops {
+	size_t (*unmap)(void *arg, u64 iova, size_t pgsize, size_t count);
+	int (*map)(void *arg, phys_addr_t padder, u64 iova, size_t pgsize,
+		   size_t pkcount, int prot, size_t *mapped);
+	void (*flush)(void *arg);
+};
+
+static inline int
+__do_unmap(unsigned long pgsize_bitmap, u64 iova, size_t size, void *arg,
+	   const struct map_ops *ops)
 {
-	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
 	int ret = 0;
 
 	while (size) {
 		size_t pgsize, count;
 		ssize_t unmapped;
 
-		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
+		pgsize = calc_pgsize(pgsize_bitmap, iova, iova, size, &count);
 
-		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
+		unmapped = ops->unmap(arg, iova, pgsize, count);
 		if (unmapped <= 0) {
 			ret = -EINVAL;
 			/*
-			 * Continue attempting to unamp the remained of the
+			 * Continue attempting to unmap the remained of the
 			 * range, so we don't end up with some dangling
 			 * mapped pages
 			 */
@@ -135,55 +140,20 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 		size -= unmapped;
 	}
 
-	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+	ops->flush(arg);
 
 	return ret;
 }
 
-static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+static inline int
+__do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off,
+	 size_t len, int prot, void *arg, const struct map_ops *ops)
 {
-	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
-	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
-	phys_addr_t phys = page_to_phys(iommu->prr_page);
-	u64 addr = iova;
-
-	while (len) {
-		size_t mapped = 0;
-		size_t size = PAGE_SIZE;
-		int ret;
-
-		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
-
-		/* map_pages could fail after mapping some of the pages,
-		 * so update the counters before error handling.
-		 */
-		addr += mapped;
-		len  -= mapped;
-
-		if (ret) {
-			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
-static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
-				   struct sg_table *sgt, size_t off, size_t len,
-				   int prot)
-{
-	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
 	struct scatterlist *sg;
 	u64 addr = iova;
 	unsigned int i;
 
-	if (!sgt)
-		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
-
-	for_each_sgtable_sg(sgt, sg, i) {
+	for_each_sgtable_sg (sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
@@ -204,10 +174,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			size_t pgsize, count, mapped = 0;
 			int ret;
 
-			pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
+			pgsize = calc_pgsize(pgsize_bitmap, addr, phys, size, &count);
 
-			ret = ops->map_pages(ops, addr, phys, pgsize, count,
-					     prot, GFP_KERNEL, &mapped);
+			ret = ops->map(arg, phys, addr, pgsize, count, prot, &mapped);
 
 			/* map_pages could fail after mapping some of the pages,
 			 * so update the counters before error handling.
@@ -218,7 +187,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			len  -= mapped;
 
 			if (ret) {
-				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, ops);
 				return -EINVAL;
 			}
 		}
@@ -227,6 +196,84 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	return 0;
 }
 
+static size_t
+__unmap_pgtable(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct msm_iommu_pagetable *pagetable = arg;
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	return ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_pgtable(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	      size_t pgcount, int prot, size_t *mapped)
+{
+	struct msm_iommu_pagetable *pagetable = arg;
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	return ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot, GFP_KERNEL, mapped);
+}
+
+static void
+__flush_pgtable(void *arg)
+{
+	struct msm_iommu_pagetable *pagetable = arg;
+	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+}
+
+static const struct map_ops pgtable_ops = {
+	__unmap_pgtable, __map_pgtable, __flush_pgtable
+};
+
+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+
+	return __do_unmap(pagetable->pgsize_bitmap, iova, size, pagetable, &pgtable_ops);
+}
+
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
+				   struct sg_table *sgt, size_t off, size_t len,
+				   int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
+	return __do_map(pagetable->pgsize_bitmap, iova, sgt, off, len, prot,
+			pagetable, &pgtable_ops);
+}
+
 static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-- 
2.56.0

