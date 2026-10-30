Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395985;
	b=JJ2ekfngjHAVM661B1ok6HcOYSL1Pu7NIn351g8QPWT33jfIYQTvMjJOQT0YaxBuVyTa
	 Ugl4/Rg5sJejUCCSpusppBcFdvoJE5ZyGidZEGilNzjc1tevgDM3Pu8eTyEEJuuPyw3pJ
	 TVqG5gPsJX4TOq79AlcHwe86M4gFdLFmhQZaA4H0KIb1ws12t/59qN0aCSwKlhlNURHxQ
	 CbVmTUvcXRDV7fyCrr5Uywv5UIIDThu7Aa/IX8sTJNSkV2dbnUFq9lrzf3TWHyP0dz1Al
	 Ums3v0Nis4Voia6iO+DmkxK0DT6gqawY2unFmk0tACdLtKvwpKZQ2oHC/pymSZQvvDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
	b=J0dWsnIFy6QNL+m+DCTm6cZwK+zX2WkwebhxdhzSRov/bSzro0wNBaAPX5xBQDxuJ//O
	 oKPgZwVTfay1RzKlme/dJG1VYnYldEH/iLOsztmaPi0SGVg3lUHIMDDIBt3/lIMTHw1/C
	 a/Hc5svp/Nqh2QI68xdqBIu/t/f0iEr4Gr0g/p5cl/baAj9tdnZXQfjnnBUK19e6O4TKw
	 odmEY/ndxEIqyW9PH8un2YD8zDioN3valNBZUlxjVkSEdLPVnLUXTCpvC5E+TrKOohp5w
	 fbjTIK25IKZb/xYuD67E1XVT15jo7Ngv9QUb6myvzmJ879jFPfLzUhn+k4HuQ3WRbrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3lnNYnC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lf8zMrVb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760C7606A33D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760C7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3lnNYnC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lf8zMrVb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAVUL3367739
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CR0OA6ftLKP
	m+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=; b=L3lnNYnCplL/j/FL25Zbv+jeEQg
	OslyFEguab62vIJ+leaeZ0mgUbPfO6XZZDDpLGruk5yvEX5NWzEPfEtUWe+zsu4W
	V8gDJV10HFMiwM1NZTm7mnOa9yXqdhHE3tA/YJQt7GNpmb8qxoErVS/fgu1hJVn+
	zbZ+kmMffSEoJ0tPkqmFHTVMnjrfDOQD8An5WioBpNrQQytTCbLUFre0Y0LuFk7x
	j0DjdIjVKIRIIAzFTmMhLqEvwD8CY4aUewQaTfejbZJgwAJcvfbGy/AubkcQZXQL
	5XTsg0SMzlYWF+DuqJBOfDzum481CAxsdx+ouIfiIQL/M1Bzvil9nZY6sgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x08244-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e832c03576so17525115ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395982; x=1794000782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
        b=Lf8zMrVb2+JGbhf7sCbstuqeLfvwJfBZ6Bh09vfiUpErva+wSv3S9IWeO+q3vhQvn7
         rTz+s/xnmz02ma5ugtuVzVW6XoELx1Ft8qRycHI6gAAPopyFErThC+qqU6TZUDm3EYVu
         MnPKidpW7GOCkC+LItZ08VhAQY+Wu8VOelGwnaN3dLFp6A0EdXi9ssaWLctyPZhVLy7C
         /j52bS9OJqYC81uDdTKLdiJCouNeRODPA1UGcY/GpJ1MW/rBDATfGxvpnYtrOTmpwNGs
         V1gStjRDaY04rGkACWKVVyBgOh5EggmPrHrnMzGBa1ztSJYVO9bdQhG30IJM8o6FQ3dI
         1qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395982; x=1794000782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
        b=uhgG19fFDJojkguvYv0HNFbZBQMFT7Nge+qoUbNJLSaapCFLg/fCTEJK3gHw3oI2lM
         +vEV0aKdPq+ckqfEfP7Yo+HkmdBEnnYChJM7MeXAO4Y2zgPSp8RpF1hXbOLY11/txEKg
         LVPp0Cw8HnGtkopQGMvAHfl2MPhNW5WdlgMTwsxOarBXyRx5V2fdq+Tx6Mp6GPBspz8p
         f5l3W6LoA7GppwzhtUAn1iWa9MG1XekyWcBNjBDBWfdQBYoACuT+A2fVbIpZiDIrnFkI
         0zA66DTzRX0WtzaSMDO26AcbDIoLLQj446F2HMCqhoVw95A+hRSfz3lnE/Y8Wwwhp7Jw
         pvTw==
X-Gm-Message-State: AFq9FYJo95qpCeX+5bSf3RGdw3v5PGhnJkPKfxnVk+83N//WJupXyK+Q
	A3/RmOcL1p2AMmKtrQguuuc+1xqsMJ8EODS8YF6z0nr+GijEGby/RiCpoRyNtLnUK/2aBL/ofP4
	i/E8NByxCQnLnlR+1aGM83eyhAQwGydO0P5g/2h7xnWWs3C7CouqiXZhCEzz1nBR/URlIdIuCOp
	hWkA0=
X-Gm-Gg: AYBFou1IYcdF+zy/FMR+tajvLmxqpvb/3pasZUKcmpHMGVhdgAUgCKhwbuCR1dFo0R2
	Xf27MiI9yyutE+OlhE6IYER3jqRHd/RmCw1J2S7L4zs6i+RA3CiiONDBsEcgkt4l3slQEV0BK4C
	L7qTxq2146VHkK0ST9hi6N2Ix6E+kCAgC64+RzQGZIDIS5dXccKsDfoY5lNYbnPUVeIChsqtbL3
	ysCkDWBDlpDUahu6DGjjFrBUBYVwBAyV0o6xRFGOrgjAPM6puOMaNnsrObuScrLYyuN2rryNEPU
	CS082uL7bwaIRI3MX9Ps3pqbdABAgsyEz5m1rh3Ti89HSW+de2E1YXfjg0G7MHyjM77zHihI3B+
	97ruu6yxkY5Xlk2AjVdpUY+1GZ6nPd/Zxaz5tsPDg/jnNFr2Zq7UQwEa/fxpvfqFoYC39S0k6yI
	Ke0uSQbOQu7v9n3U2rzHJr+A==
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr37788995ad.17.1793395982241;
        Fri, 30 Oct 2026 14:33:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr37788695ad.17.1793395981808;
        Fri, 30 Oct 2026 14:33:01 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39265090sm11490155ad.41.2026.10.30.14.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:33:01 -0700 (PDT)
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
Subject: [PATCH v4 4/6] drm/msm: Convert iommu map/unmap to helpers
Date: Fri, 30 Oct 2026 14:32:46 -0700
Message-ID: <20261030213251.55365-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PVAiZK2idzL-aPlTxqcKCPFffwLkO46T
X-Proofpoint-GUID: PVAiZK2idzL-aPlTxqcKCPFffwLkO46T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX/M/N9J2weN+X
 9GbC2N3YP06dwSm1nwi9jbBQ+TTYPw3ADSRJpPvzr+aS5Nj3SA7sTRicEEhLbfmdHX+v2fJZbNg
 xUEBKKsGK8UTkUg8buSPq75TGOT6Ebo=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae50d0f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=3T_YcleVrN8O_gWOTnoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX6vA6VkEtEyYa
 s/1gEnRJtr7/o8YB5Opu8bFU6r4g5xAm908IWufk0KQ3vajtuM5eL2PU08B+OuWsS+iQIIqQlFV
 ZZD/4jkwCQdpAQ258jNmtaqfl0duduCNL4XSacBq/HMGQ6Tsl5HZH0tmzFmXTostuIMDh2EkJ7O
 anyXpY9DdNm6eyM3F/0b1Itgs28IgsYXzVJmo3pKx5pplcHJ4UZi09KuqHHKsVvjpW6XcriO1BM
 R5T/o05Lrs3zreNo6Bgz4R6korqAnU19QOs7MF2/aGdmSapD104IlZLer7qaRGJnx1WPJiHV3yY
 D3B+qf163Zd4KW0ezqKsS/tiW/HUUWzCGsbCyy+vAU0famV7VqbSLNxkFc5fSeXKTbl9wviWnXc
 nVHzHYt8ADw5iZgVwUmLCPwyeEnpy6W3e5XbizT5iiLTO/TUIDyycgBqN9eqbd967+/rccxX9kx
 oEsfg3DH1GEaGzsPvyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

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

