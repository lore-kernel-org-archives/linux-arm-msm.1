Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08116126C02
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447528; cv=none; b=HA3tPzoBoK2gUVb/C47we4URyon7x0/TkU1hd+6xoVSjx9IDyo9tWv9XcLl1r0aKDl9rq+zhZGtXMZzLVBqQFpYbztHhBPvE6hwMlhsKsodx/e+Dx8pILNvhuzWUkzLSDTkgh/plT03aLVVLCj3H3otI5KLqd4zgstALxdnhr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447528; c=relaxed/simple;
	bh=9xokjdYF+P3Ji/omAWmaL77GOLG2q85QI277l5/br8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APUup0HUOSNKFFFfdQzyiVf6m1P9jQEBZEKa58U9u71m0UIemvMqLo1uUdofOe6ILB0p3S6t2yImxdp1v0qEunckS2tM0lvHroT0qDQp5gh/OFMR7z/+2J/6y/cjd32nW7FYFS01qdhq+qcDFG3u66t6wzMJmvMu86asoaUPeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVb86tYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJauMvFs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVb86tYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJauMvFs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQnm4013820
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N6Sk/qPpTb8
	0sqKVTmQiXDBsrY1jdpSDdOhKqhp6i50=; b=PVb86tYhihJaM2VR2lRViZcLDqw
	aNChzCaDeuAsn+oGyBLRjv6D928o8OgHdIbv9zebBAiKNi8zYw6uhZDvYsjUOeOM
	rV0XSCDJRC/LWC6CY5mTtKGepqGLxL/JKglnmcgjNvKBrm6QISzDcJAxVOWEg4am
	vTk4CJvQS4FUo5tFXoZpLSvsrL/bhXjNtccHe5nMaQLlWabiZ7TjxDgFBD9SBz9v
	oM/pI5JDlpxQH6i4Cq7rhY5Soeo14A8iEWcuvPSk4IsWRlXHN3hwCcp3XthwY40F
	3qgIf37dEpfVEOulX3sbkMH5m9WP5Gjrhvqy85nfq6XbsyLpOSu0ObRQcZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tehdhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:32:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso16737095ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447521; x=1791052321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6Sk/qPpTb80sqKVTmQiXDBsrY1jdpSDdOhKqhp6i50=;
        b=IJauMvFsFvo//dR7a/GYNJAWMr2QoKu41ff/NZJBFwclpxZLdrcjmn+aZxuFXOVf1K
         v4IC7tag9bBhtKWhoWe9r7mKhBYCQKAwQToSdiQdYwM5CMABibqjEq6NCfGMGrtViaVe
         U4NIh7v+LZSvp/ACvSEIXTzbPyDU48xw+InHOJa+jdBEyWNGakMf7t5x2FGJkC5JznK9
         wf/rDSg9Zlkqns2SS90nnIwG6SzI22tOqtoBk+2BAUPNpQBacimqswg7uPobH9RMJCLl
         pZq/52yQYTS5mmJCH7sLfPGi4O+u4DjEi4hwprZr3OBfmd0YCbwkJOQlKmAF/09JwTt3
         miWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447521; x=1791052321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6Sk/qPpTb80sqKVTmQiXDBsrY1jdpSDdOhKqhp6i50=;
        b=f6fQf21EX5wg5IE2jG5csyJcUKVoaYhHL7p/D5r8sWdB2oBaBDT6WY/Qwr0K1TzLOE
         hnOxtOky4VIDpK+hAro6IC4x/GsOT+ZPYCzmPxL669PS678lK7UyM3g7iRjIo0SzmP0p
         LgCEe+BcOD3hgSt1bFhJ7C0peBuWAqj+P5R9PUP1nWBex7agWAFOwb+8OwADivU6Xmyi
         uPbdE0QV7ItxfWpbbFGghZEsIPyULsTJ5blz+/INdI0qa9MEfhBaxJZn+oq2C6RYyzBE
         rP5mBn7h1wuZTq+zAG86X2KLmtxvphY5DK9UWp4DvkuRdRoKr7JINjx730ckS9Cdturr
         v0Jw==
X-Gm-Message-State: AFuF++l14wwHcb1bPhogKQ4XNyHEdkD+bWNlsg2iPd1JfD1TxlviCQfG
	N63Wml47HUjZz+Un3fL8aRggf9jpn6o0QkWUiLNCHoE6RTXncUhcms9TFVG4ZbeZXcN1QuDbfDl
	ReCL7NUNZXLWKaHbxFqzGKpIk2VpNmWfgKkYtY38UavTnrPE/3en2RPfloAhR09lCYt0l
X-Gm-Gg: AYBFou3UyvHGpn6KUv8/fT540LG2wbprS08r0Yfn4CxK+qrl/i1XGhlRT9i3A7xHyG4
	cNqFSizVsGDLELJ48FWIFy1EJZSWZtEUQBeBnkQTW3yjo+SAaEpMbTLuf3dBViNcBFqoy33gNUY
	yc7ktY5CDn3nEMRrgRs1M/zuL2StRA6GHUgfUEQZXO00NIOrxh8aO7QjdJ9jbdaItnD/FogMYMs
	5zKP72JGFTsJVz1c+MzesodsYxuFRMso0VgSl8iZBhDUpEcAwobu7LaTC84qb6mG4fidWfF1ykP
	Jk00varD1IRWa321mpBTPiwFCdAo4vglTKRLQKSqb34iVqWzia7Epl810lA2iXRc2AJBo2FbQ2y
	X29x6kTk8egFcHdZhr2AYhj2ZcN+Hr14Jfp9wIndqsAP9mA==
X-Received: by 2002:a05:6a20:d49b:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3de0e790e6emr8061661637.26.1790447521452;
        Sat, 26 Sep 2026 11:32:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:d49b:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3de0e790e6emr8061643637.26.1790447520870;
        Sat, 26 Sep 2026 11:32:00 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc794ef8befsm1768841a12.12.2026.09.26.11.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:59 -0700 (PDT)
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
Subject: [PATCH 6/6] drm/msm/gem: Drop use of drm_prime_sg_to_page_array()
Date: Sat, 26 Sep 2026 11:30:46 -0700
Message-ID: <20260926183051.25754-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
References: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX4X5QqLpFUefS
 gFopfYDUiaXPVlFlTivRG9zcrbEr4KVxerhux+Yeq5Z6lTgGavXq5xg8QluSd1LmkhZ1TMVpzlM
 JjIZcul/xiMozBtKRtY80ZpzXNZ9Sn6JR8AtJafu3H9qhG21McqF+QcbIyVbAzuhExQcQmaKHDA
 R7aSScLzK+ErPZczleN6SIcwe45VAy+VwA4iU4rJ/6IgOXh+Z47aM9+2azaccKFGNfMudKjWv3l
 kwaxB0+SA1gUQcJloA/E41DRADSZKvd2H5AGyMeoKxv1QV4rWB/ZxVeo25vafis6/zRoehY0nVS
 OukePkC4ZzEP3/3dE21gJa77kWEKPcluAcYaQ0py5wMZkGVWp4jue5P1cO/eqqPqoWPEN91IJg0
 xO8//vIOdMwOilkl9JgAIN/wT7DXTvPpcNvg+Vw0zfpANLfhJQBoo+uqfPxBij/sWlXbXKQUcAx
 7/IVOtpbtlC0zsQa4+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX1zqBAZTnMPE7
 pBAcAIQ6taVqmc0+oWZynfsu+U1xdyPxhJtp2AHiHf64DhZyGh0e1/WSHyDzj+WcAuU3X1cuv6x
 8CcsoUnzajEaozS4rte5yDCgTy7vOyM=
X-Proofpoint-ORIG-GUID: NBKX39gkQYMmFFH17ei2OrCbnF9_xOOi
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab80fa2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VGg0XEsK77xSs33O3y8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NBKX39gkQYMmFFH17ei2OrCbnF9_xOOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

Now that we've removed any use of the page array outside of paths that
are restricted to native (non-imported) objs, we can remove use of the
deprecated function and allow msm_obj->pages to be NULL for imported
dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3111d7389572..130ae27ee00b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1116,11 +1116,6 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	if (drm_gem_is_imported(obj)) {
 		GEM_WARN_ON(msm_obj->vaddr);
 
-		/* Don't drop the pages for imported dmabuf, as they are not
-		 * ours, just free the array we allocated:
-		 */
-		kvfree(msm_obj->pages);
-
 		/* In msm_gem_import() error path, sgt won't be set yet: */
 		if (msm_obj->sgt)
 			drm_prime_gem_destroy(obj, msm_obj->sgt);
@@ -1350,14 +1345,10 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 				      struct dma_buf_attachment *attach,
 				      struct sg_table *sgt)
 {
-	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
 	struct dma_buf *dmabuf = attach->dmabuf;
-	size_t size, npages;
 	int ret;
 
-	size = PAGE_ALIGN(dmabuf->size);
-
 	ret = msm_gem_new_impl(dev, MSM_BO_WC, &obj);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1368,28 +1359,14 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	 */
 	obj->import_attach = attach;
 	obj->resv = dmabuf->resv;
-	drm_gem_private_object_init(dev, obj, size);
-
-	npages = size / PAGE_SIZE;
-
-	msm_obj = to_msm_bo(obj);
-	msm_obj->pages = kvmalloc_objs(struct page *, npages);
-	if (!msm_obj->pages) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	ret = drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
-	if (ret) {
-		goto fail;
-	}
+	drm_gem_private_object_init(dev, obj, PAGE_ALIGN(dmabuf->size));
 
 	ret = msm_gem_init_bookkeeping(obj);
 	if (ret)
 		goto fail;
 
 	/* Now that we are past potential failure points, set sgt: */
-	msm_obj->sgt = sgt;
+	to_msm_bo(obj)->sgt = sgt;
 
 	return obj;
 
-- 
2.55.0

