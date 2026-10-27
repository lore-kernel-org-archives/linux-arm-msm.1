Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114913;
	b=Qz2fhX5j5Gjbuimn4t9MXTGnrLHawJLsK+0J3dkW5RWNMPIvyhGLVSzsRtK35KFx8RV1
	 PJ4nbFXYV87Fqd+1B/QEzF0MGA0kviusQINcqx2XLOqEOuRKVkZX6fXcWo6a7jXPpSnSf
	 sc5+z4hX9LBvYe8SO9vmKgONuLy52OltiKmuJbZOMEJejIUx8hihwjhDZYRzhZJEw0qKS
	 RDYZ1/FvHO2YPUKhJgKkOj7G24tTMse0gvX4mGorjXGudd4kjNKnt2AEVMYCjmlG224OW
	 hZ4v8G6OtVnRYuU+dm1wMzn+h25dUdhwZjecp9fgWYN6HhRRsnNfwnUU9mOybsBbUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y11jEpRTQq1C4+GXBtkJEfxP2mZ+Qxz7cGDzmFaJGPI=;
	b=tLiGpT5kmpwYJgE3/ILVsKAzexN4YykpsNr+3Mc6J6fgIsfxbfdpyHsltT8Q9yCcPDZJ
	 xJpeQeOgDxQZd5Xx7FwEgUDvBBXu29iSBMI9LcxunAwE2m2/GdZwCHGuUqygPSzjrOuDH
	 1eoXBs3Ji7NwQ7b/yzP5xNbJv9M/xQW9PIr3By7GMFwMG/kE/trNWqsgzXwZa1JEeporQ
	 l0niiKUJBU18RqxTSbm+ZAwmMJhbRHW0lgY9j0pOQ0f/4AygSerEDezZLGNFLmui/mAis
	 yOf8FTBuar4Y8zyJ12oufM1zEW6Y0mUZTAj5upaL3cPbcZXjeuS3xtTpJSEd//efRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=COSfLb3J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb9c375e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810C60A260D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A810C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=COSfLb3J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb9c375e
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL3Pb2549137
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y11jEpRTQq1
	C4+GXBtkJEfxP2mZ+Qxz7cGDzmFaJGPI=; b=COSfLb3JVphph+skhdIQP71lFsL
	RyXpX52qfgDkm6eHHlfi+tlNM1p1yn7+jtl7Hc/9rEaerYEgRjuvI5rX+gnnGmAi
	MSVBlB3uKeLkYwiOORmraX2lzQOooSkfSH05V+uwmlrpgzKWTsXPGhQ2LPGXN8Aj
	akDWSeTHL6KVBJrNJlD2gTxzn4VLetSyRyPWzmQL4x6mQOvbLcIrAwpUGq8+r2wk
	fJ79k4vjYfVtIpTXR+AAtULvRQb7UbLSropy/4g4R2Fz5STRFydxK5i2V5PsMpZX
	D5xr3L7ptzgwW2PgYMI3t6avJxRfQ9aCch5+Ny54UM5zV+lgEBycs+HU51A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69mm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso43215215ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114911; x=1793719711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y11jEpRTQq1C4+GXBtkJEfxP2mZ+Qxz7cGDzmFaJGPI=;
        b=Tb9c375ekJgp/ywtJfDX0f1oi+pyvuCmtHtHFSJPA/tGj7Rkj4gG4iC+hVsx+1P9on
         EEt6MSu2/4fZw8x08isKtTMfXm90ugFzAn8a3yriDM/IJ8upsA940tO6iK7czw5I9aKW
         Wyp0RosrNFm6IdWFuMwk+BcG03W6t+uHXHqwjh08GOb10neBBW+Jf2kzf1AYXfkamY2y
         B8tUGIgfY6d8Agx4kFkgJbtgq0W7vFNGhGaY/J32CpKUSmxBNIiw/xRludXH/v4M4CmB
         BGZpNPmkRyKEZwzUcGRMf6oChk4ha4GO8Gstz5SSGWG6mH70ebCmz0lGCoG5N64QlUwv
         1Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114911; x=1793719711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y11jEpRTQq1C4+GXBtkJEfxP2mZ+Qxz7cGDzmFaJGPI=;
        b=i1cl4DegBOu3N5NOgOE+/Sp/Q/AQaoGIlqg9GwUiZqmgLLde+FZftvQ8GInhbaxeYs
         8Bi4Z+0ygvVoMggRGLEj2qn9RDLvt+2y2yaD8qkNPK5X/ykd7TpiBUMoMWQrVUkPj+HV
         JzVIIMAm1MbW+dvuj6SBAvO6Bi4bJEa+rWdtjYEim2pLsEQF2YkEIJVg5qWdPsAQjUj5
         +TxEhOC8K7hKodDh9RKoj9QJwSRwz5gjqVs6hqFSHSr4i2MwQ2gOgxNm6XqBjQ1F16Yq
         CpSpHKlUa0bF/k9twX+6gne7CRIwRq/OlpilK3LsoKtzjPXxTweWd4sXipLqdudCvckf
         OCYg==
X-Gm-Message-State: AFq9FYIXXZvL3pK/LOab+jcH8zRYCklQX2vi+iTrixIYhjnsKYLH5y/X
	tKhsFE8YVU0MsvYYoPKv0kaS6D3nJo/dcsytKCt2khtj3x/YvFkMT7s8ZKcd8DYJ0x3JfHtQejn
	1d/0IjaesacFVVnJ7TPr0PrecUNhfRetWD5HUPkdVkSYbxE3/qIbWWN2ZmnhrRIcjfCzE
X-Gm-Gg: AYBFou0XpUmL1MIGhsEBznePGWKF3w+NDh3r1mWzYmY4dEos3v6J6YYereGY063FIee
	pjKTZprUnT1F86yWNbaQErAx7Z8DKy0Wa0diHswWd6bKvA7C/9oCBfFawQYITrpJxHy7UW+Yf0+
	Lpo/PplXNiajsS9mZNEVXWcqa75HrhQBLwK1K/Vw++zcsPofxrfuviQhOT43I57ebfSY7hc2vn5
	w8yvdgDIx3zMx19TRi0RCkpdBwd29jsT8i2bjvtJabqmM25ThBcu1Ap6Ibah+x/IwyFi9BJzL8F
	Ku4GqTf55kniA008P7j/69HeHC4yz/ut7lP23tYdAwUCn207EPAeiVRf7PcbVdW58dBB17ex54Z
	ZNA8romsqDzEp2NDD+TLU7vWHvEHJp07d6qCjJrWCIASsMZdfcg==
X-Received: by 2002:a17:903:26c3:b0:2e9:8510:6acf with SMTP id d9443c01a7336-2ea9c8194a1mr83267935ad.25.1793114910424;
        Tue, 27 Oct 2026 08:28:30 -0700 (PDT)
X-Received: by 2002:a17:903:26c3:b0:2e9:8510:6acf with SMTP id d9443c01a7336-2ea9c8194a1mr83267805ad.25.1793114909957;
        Tue, 27 Oct 2026 08:28:29 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm11619545ad.24.2026.10.27.08.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:29 -0700 (PDT)
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
Subject: [PATCH v2 3/5] drm/msm: Extract out map/unmap helpers
Date: Tue, 27 Oct 2026 08:28:17 -0700
Message-ID: <20261027152821.51144-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c31f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=R8jjkeD1lhB8w9RMBGIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: OUpfOLKipO_LxNACFVOFRJg3Xa9Btd-l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXynBKGobY6a3+
 HmswGHsnRgK+UglpWMKxh5L7PwoYAxKTgkeTM6VXj9tOdqOjqM5U2l8CQdaKweSciVxBadqqwL6
 cdTHF0M/HyYKnNq5et4hmPe+XlWtXbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX9vIrhHTS5H38
 ac+uD3ElDm4nhqayOlHHkKQX9snLPr2OFJTaWTzfNZFDfckS7ZbAlZitcyBvYyuR+6D8zyoEius
 S/mdTAi8cNRpmAzCNgxy2sZNwfqgQ/BYXMhxcLb5qcRWIwfJ2+uoPSXofJbREBcufQ+CAM2yHOk
 UHBlqZDye0jl9hhaOwa6halclsAY355lNMMst6huVwV/1yH0LJ5XjpNvd3boYtm+N8c/FPXvfvD
 EbILT5IXF3G/iwccP/HjCsklawouy4PYqa0QEgcP1J7Bgv2S7bmq6kcekLfpultF8zusR6yfvK8
 6Byp5HbfGfDmiHXuwuIM6g/8IxNDjb36xLVaFg5IysbsO1tECcqRn3c1hjJISiorjP+iCKPsdhT
 vl7tu7Xv1qzgg+mQPd/Uc1pA6IJCpreBwYLADgSJ8LY7iJhMUejsujgU0fb5pAQx3/kEuVAzB/I
 hzRqKiGjucc1EC3/rDg==
X-Proofpoint-ORIG-GUID: OUpfOLKipO_LxNACFVOFRJg3Xa9Btd-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

We're going to re-use these in the next commit.  No functional changes,
just some ugly callbacks.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 155 +++++++++++++++++++++-----------
 1 file changed, 101 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index da6782fca6bd..78c82f4a01b9 100644
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
 
@@ -107,24 +106,27 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 	return pgsize;
 }
 
-static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
-		size_t size)
+typedef size_t (*unmap_fn)(void *arg, u64 iova, size_t pgsize, size_t count);
+typedef int (*map_fn)(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+		      size_t pgcount, int prot, size_t *mapped);
+
+static inline int
+__do_unmap(unsigned long pgsize_bitmap, u64 iova, size_t size,
+	   void *arg, unmap_fn unmap)
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
+		unmapped = unmap(arg, iova, pgsize, count);
 		if (unmapped <= 0) {
 			ret = -EINVAL;
 			/*
-			 * Continue attempting to unamp the remained of the
+			 * Continue attempting to unmap the remained of the
 			 * range, so we don't end up with some dangling
 			 * mapped pages
 			 */
@@ -135,6 +137,83 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 		size -= unmapped;
 	}
 
+	return ret;
+}
+
+static inline int
+__do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off,
+	 size_t len, int prot, void *arg, map_fn map, unmap_fn unmap)
+{
+	struct scatterlist *sg;
+	u64 addr = iova;
+	unsigned int i;
+
+	for_each_sgtable_sg (sgt, sg, i) {
+		size_t size = sg->length;
+		phys_addr_t phys = sg_phys(sg);
+
+		if (!len)
+			break;
+
+		if (size <= off) {
+			off -= size;
+			continue;
+		}
+
+		phys += off;
+		size -= off;
+		size = min_t(size_t, size, len);
+		off = 0;
+
+		while (size) {
+			size_t pgsize, count, mapped = 0;
+			int ret;
+
+			pgsize = calc_pgsize(pgsize_bitmap, addr, phys, size, &count);
+
+			ret = map(arg, phys, addr, pgsize, count, prot, &mapped);
+
+			/* map_pages could fail after mapping some of the pages,
+			 * so update the counters before error handling.
+			 */
+			phys += mapped;
+			addr += mapped;
+			size -= mapped;
+			len  -= mapped;
+
+			if (ret) {
+				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, unmap);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static size_t
+__unmap_pgtable(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct io_pgtable_ops *ops = arg;
+	return ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_pgtable(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	      size_t pgcount, int prot, size_t *mapped)
+{
+	struct io_pgtable_ops *ops = arg;
+	return ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot, GFP_KERNEL, mapped);
+}
+
+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
+
+	ret = __do_unmap(pagetable->pgsize_bitmap, iova, size, ops, __unmap_pgtable);
+
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
 	return ret;
@@ -176,55 +255,23 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
-	struct scatterlist *sg;
-	u64 addr = iova;
-	unsigned int i;
+	int ret;
 
 	if (!sgt)
 		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
 
-	for_each_sgtable_sg(sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
-
-		if (!len)
-			break;
-
-		if (size <= off) {
-			off -= size;
-			continue;
-		}
-
-		phys += off;
-		size -= off;
-		size = min_t(size_t, size, len);
-		off = 0;
-
-		while (size) {
-			size_t pgsize, count, mapped = 0;
-			int ret;
-
-			pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
-
-			ret = ops->map_pages(ops, addr, phys, pgsize, count,
-					     prot, GFP_KERNEL, &mapped);
-
-			/* map_pages could fail after mapping some of the pages,
-			 * so update the counters before error handling.
-			 */
-			phys += mapped;
-			addr += mapped;
-			size -= mapped;
-			len  -= mapped;
+	ret = __do_map(pagetable->pgsize_bitmap, iova, sgt, off, len, prot,
+		       ops, __map_pgtable, __unmap_pgtable);
 
-			if (ret) {
-				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
-				return -EINVAL;
-			}
-		}
+	if (ret) {
+		/*
+		 * If the map failed mid-way, it will have triggered an
+		 * unmap, so we need to flush the TLB:
+		 */
+		iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 	}
 
-	return 0;
+	return ret;
 }
 
 static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
-- 
2.56.0

