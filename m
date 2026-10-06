Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5A41D626
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292225; cv=none; b=pMzo64oxjCMYUhfY4W7VZ2EzSD2ATwvVxG8JekWiKsHjdDhECkYN8Me5T07v7T/fz/DyyPIaq9DJihd8O1S16JpJ3WeZI5j/+76Qo/LAQXrKra1w1Ku63sQVZfBDuHAhL1eMNJ7xle6AlEMhwGhj+EcFYqVQ1pSBIAcy7VdWX6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292225; c=relaxed/simple;
	bh=qzOit12t7ik3I+pxoDOiNDA9kDl/tdt9184MoE6d/4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2KZkZjgkaS7Sn9PyKyQaDBdZqmnR36MMQGCPRfaDrXbV4MwZMkZ2JukcLncED546UmFPd+RrchJK2SQ3DG42P8TkMj8gl4ulYMWR9vk7HIPs9QAG66PRlVeUIwGUNUkB2ogSg6dAeITg/sna5SLJGPzndygz68gmse2AuCVzRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJ6a455X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnLA9+5f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJ6a455X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnLA9+5f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPQS61046068
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 13:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NAuRL1B4w1q
	m6KEmQegsBYRQT9k+E9aeDav0hS/9suQ=; b=RJ6a455XcELItSvCqerXR1ehVHQ
	Ne52IfkwYPnPQAj6tn/MA9pDWxEbGcvYgjDnXhBTcj3x8A7MkMjnsEx9N9moqDsr
	J0y1axYkQyUQPYDvjdqg/QK4b/X2boIMGXeLgNPRYf+xqDwmjGxOotl3is+HR0vO
	YtrwSSEtGgryOmNHUGBokaGwscM5WfcbAE9ngbm7WwW562c3pmqACpYn9jW9gwr4
	E8aD4bXbV7oGqEA9aD3/BWMhcVhZxaE1YNrghVOcDIs7D+pZkCGTPkyhfATYB7u2
	XOWU3ShLkvB6g/ZfQdpiDtKYnACuKRzB7ihgsG/fzD+wLY7HD2qQ4YQbyhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbgpeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 13:10:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso4425046a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292216; x=1791897016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAuRL1B4w1qm6KEmQegsBYRQT9k+E9aeDav0hS/9suQ=;
        b=TnLA9+5fd4JrP/nleFQDlIwYg9NL5ENYdH5PMCl3XGrH3oro5vQ4LIEahjIfg9ezeH
         pbWK7D/ya0iiNUzxYAIvymvTTmLflfoCbSsR9R7vsYPdV3OdT+6J25gmKr55cex5DqF/
         6CpIGPwNs1YAC5D4BPBk1DixN0U0A4xO+CfatzsokdnErnhyoKjuQF4aFY2TfSokTSvC
         qYK9bWKM1yUUlFr9raKydPzS9M6V7okFzUxDz41MoPeiklWRDB66Hgj52zlBnXuFCGNQ
         D7FUjO+W3HHADblcIbQPrBsnsx11MVTCVD5rKlE+QYvkQlAvMy/1k+RhRJFCcVuh1zDY
         adTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292216; x=1791897016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAuRL1B4w1qm6KEmQegsBYRQT9k+E9aeDav0hS/9suQ=;
        b=Bfj0DVQixZ1BVrfseUp3rIUtRgc5m2R0EYRNxUOfiC8UYSdAEN4IFrmuZ2OdFMPROS
         hABFhwqAWxX/WkY1pLfS9fU+vc02QdHLB2IiLJaOGQ7n9P/Pdl8Y5+GRWxujN++y042Y
         glMrubq1ISMvI36zspxePdry7CoREXRbwPsWXWU0dUSR5AfbC4HDVn2Trctp/kzbF/1b
         3u5KprQklzAnOUNKiYViFe3IySpRBM2QQ0JWZZ/GMCLHbB0vWU43BNkwZeB5LWntiDZI
         CjZoQB9ahwNggkLL1GQTO9pPN37kHRDHUWHnbkhh1j2fEtOjPkQJrdK84CjdskUTSbSF
         DRZQ==
X-Gm-Message-State: AFq9FYLU45sbhtzzAlS3ONz8iZdSrvRbHOlnP/UijE/kipAWNe6oekJj
	Q/kUJNiRNyBX96QxhuA6UcvPXYUmoxeqIYC/Tvhlwx4yIXUJGAoGjzik1e+MZ6GXvErenfSPw+F
	mwCURIw48ZifjXp9PpwyWUMfq7tQ1AWIWzGIjQQbH/zcpyJ7seVUnv5pbGgJCuZIXHNrE
X-Gm-Gg: AYBFou1ocA32INj5Qlx8+xqVBxb1F6cNlpTU/DtcqiFXgN3L3KTLmLu6Iu4QwygbY7A
	IQFtb71BYiQSHmUlTeU4tO1d/pBA7Y+OlBXe9dD1WlkZ5bPg1y7FOoNqYC6fFbEJil53dOZsC6E
	4ggoqlrMhZShzFeWSwgIeKanASqxbJiIEEookw7H4znbuugjmqXWA2R2DSJWpPdjXIai5mbEGb4
	xwBsGXhYhpL0qiO6xsqeoJXWpupxzilILn/0KNUDXZt8Yk1ePPVgOKpAsCXyfxbkMfXRJMs/2NM
	eI3AEcAU//Fdhc8C/KcxcqZOBRMSTKq77qRmsd8Xv9cNJzVwsRmD0oi7QL2tppJ0IZgpDH3bJlT
	oz1/A4wz6KFs5EtS93K8fsHmFuc/HpAA7QV2Ml+iIVJ/iXw==
X-Received: by 2002:a17:903:40cf:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e4ea0e96f0mr97170655ad.2.1791292215892;
        Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e4ea0e96f0mr97170455ad.2.1791292215429;
        Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ed0223sm22035515ad.54.2026.10.06.06.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
Date: Tue,  6 Oct 2026 06:09:55 -0700
Message-ID: <20261006131000.81501-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4f338 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3T_YcleVrN8O_gWOTnoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: rTzr7PUnFJHOhkkD1-B3OImx7NGo0EpY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfXxi3brpKARDEO
 UYr5rg+iX8yQZWKiyxvw6FxGkV1GMCpAffhgmh4KO/D46yj4lm4P9SbAcPKf17oPSa4j/ohiwPk
 fBkOUa86TwRHSaT9tYzI3P5mEv2Lg3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX2oe71a///Qjn
 UES6FFW++hnSG5hyRGTT703kLURErpc877yQwmCosfIt4TnyR2kDq3UPnR1/RV8LFcPXdD47zJL
 Bzvt+etc9+xKtaHdl0QkvEzJ/xHPhdoC0oIVahco4PGzx4+fhHr0I65h8t/r/hYZTKb5MULWqoQ
 y7VyHQWDXHz3jO3Mf9KW2dBy6N+lkbuhWLRriCXj2TqVgRUHy5VdZkS46q3A1tmEJxpC7az69Sl
 Wr4h0KKMrCRoepkZ08PzmXVFwC9aGlI3fEv+MmTvfUJAoFzqjWa9PCtuuQynGFJTLan7huugQsH
 XcBTJ+610lT/j4HRjdJUi7CI9ADYWXEbQ9dr3FlcNT7Mdffoyf6uNYpA9C9eENYKdOc8kHgjkPE
 EruFAnN3iXSGHEC1b78pWixedztAPHAMG/jqNB8LAc36TGZ8xuxlKqaYx22gEMpcqvq0wtavRDp
 8pDIrkG1ebD4esfynvg==
X-Proofpoint-ORIG-GUID: rTzr7PUnFJHOhkkD1-B3OImx7NGo0EpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

Re-use the previously introduced map/unmap helpers in the iommu path
(TTBR1 for GPU, ie. kernel managed buffers, and display/etc).

The callbacks work in terms of iommu_domain/ops instead of io_pgtable.
It would be kinda nice to just deal with io_pgtable, but the tlb ops
that arm-smmu uses for it's own io_pgtable require doing runpm, which
we wouldn't otherwise be able to do.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a658493f8007..50038d00c3a8 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -720,12 +720,27 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
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
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 struct sg_table *sgt, size_t off, size_t len,
 			 int prot)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	ssize_t ret;
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	WARN_ON(off != 0);
 
@@ -733,23 +748,18 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	if (ret < 0)
-		return ret;
-
-	return (ret == len) ? 0 : -EINVAL;
+	return __do_map(domain->pgsize_bitmap, iova, sgt, off, len, prot,
+			domain, __map_iommu, __unmap_iommu);
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
+	return __do_unmap(domain->pgsize_bitmap, iova, len, domain, __unmap_iommu);
 }
 
 static void msm_iommu_destroy(struct msm_mmu *mmu)
-- 
2.55.0

