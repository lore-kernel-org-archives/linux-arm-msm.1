Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D8F477E33
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340629; cv=none; b=dXYuqzEYOBNCesCXySZ9gTw92ENDLRfwq1uxgjS0jjr0ezN2UHfBLfOBwKHXkyWj4pMVH1VU3g4UVnuKNJLtLB26ILnVDaHjEYtaR8QS6VTeyNEGfDdnf+kjErl+5bv4ryF9xWv2XyDcon2BmnzV412aUzLiy+OqaGnGppOvJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340629; c=relaxed/simple;
	bh=XuWvQmNP712Kb9HIW++bTX5xsDuLuiqi8rGpIAdzbO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WN+kLYeN6vQBnZurR4m13LkLQdBF9hGLh5hvcJ3jUwy+u4uNz8tmK/L3L0ig0GeruQ2g27mgeaiRNtA/B4dp0nTc3bySgYFkVTIaGqee1fU+7jBvKBms13Hc+uNnagTgqZS08zhAicVRbwYfDr8CkAkvwCjksa2NRSynm8fASI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4NB1F1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Om5VqDwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4NB1F1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Om5VqDwj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF34jd2357655
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ci5a3i1KHTi
	GYmRN5tAXD+AHcmxzUAUAXBR1lwdlYe4=; b=i4NB1F1UfAVUYHKl03lQVOqD1Rk
	oLB+opu7ZPiRCAPzai8aAZxHWeQajb8cTccGO935ykfNar6X+vamagMjGmPJ4AsF
	e7N1BzvQYSsp89d61+jszhkU86MW2aNhGHIo18YPT7lPvs1Aup2GVAQ7UEaamVPs
	sQ4HWya5DD7KE4fSNZo+GoUyQ6gXDvHR5sGbmOKhqZsfHhBlgUF3Wi0ooNeRBlxt
	1+Rg8wmuq5H7evgNhcwiOUJxbGSM1QuV9kC+t5KW/1PDx61o2kcLJANqBzJgRawg
	j6wrrzZVpIKOMdsEYkS3hCt9p7VzXk6Xe7gXA0A3XvhwGX1cHbovNohQsBg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe9954y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so23907495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340626; x=1785945426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ci5a3i1KHTiGYmRN5tAXD+AHcmxzUAUAXBR1lwdlYe4=;
        b=Om5VqDwjJPXX4/4abuinzosUkC6nYrUhqDNIO3M24Vr0zrOGwiNjEZOZTNgb2JU13L
         6T7nxoyWZAaMmtuoO+bkxEiWEP38fKwrd1thbTKL61RD8I0HY7euM2tAbcAZ4cb/JY51
         idIHYIuJfaszoSIzzIbRLSvMGo8lz+V7zrlgbDqR+uPtstptwFJlVUIfcGaw3zwA9txl
         zcm+4kK27LD9X1oSb56jsYJw8gOkc7rF+eZMN+4P3O4wYOmWIEdUL45pSszTDWDhI//3
         xzIKFeNvzpsqzpY/zyhmHK7rsddrDGc076uphP6pGjJrHzMKw/5cMqaMP+/PG88lzvPO
         gYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340626; x=1785945426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ci5a3i1KHTiGYmRN5tAXD+AHcmxzUAUAXBR1lwdlYe4=;
        b=BD4Azoej/bmf2AxTlmgFTRfGD1JcE/r37+XUMhBE8lVDHhe6hpdzxRsXcUT6i4lcf7
         89Gfz02vlNJjycU+IpLDY2mkAvLtmyh0EZkChuOeOFg4TIr2JY9kZqW13hyBij5cY/FF
         5jh8GSLhLXYCUW2TQiraX9P73LTx56zH4htZur2FHhtkHaRhENXVqeXX0pfjcrW4pFzg
         SM32ulJnXdtZE+CSc161208io7CZlPNNOeNMGEFjx2L3ZzlNxEmvRrrDFlZk4ZVXjKeH
         uDQdjh6FlBquBcXebXmOVgtzOtGzxnb8xCTQARlKhBVpgCct2w2gxOPsyYA7I2+E+5r+
         BTNQ==
X-Gm-Message-State: AOJu0YwPnDOv2xrfurd6cEwFpDHFD3XaF3TBTnHsLELIz/W2vZEZw/Kn
	TV8tgOcwn5t9YlejCzODGid+7SpP9h8D/Jod5ZGodbc/exhkwNfYCB3Qbt5o0Ce5NQsJL6DeSIP
	sclZUafdPcA1bIwgqwmb2sadWllzHG4DSjafTIMb6lCaQ8jzozSUzq02M78G+7MVCTj/M
X-Gm-Gg: AR+sD13ckaH/gy85Ek7ufMpG65gIuVcPeiz6eL8rIr3j/KIH4wH8wLAf1Kkd04qY161
	0ynOtkTdWBf75sYubwgOM5nYLmJASdOXgbQg5cvuWK1OMcsD51a6EIx0pjzwrAOAm7BfPBc9121
	GBmJ1YoBfXcSzgczpuSEYusmr/iisFcsY64iC3E2zyKPo+7O2Inq2MVGIE8nOolGEQDo29f/ipz
	uinkIDpkU4RmVr6/SzI9XqFTIaJ6j1YXFYBwLl58oUOmlOJWuxs784YElszqSlQOr2H1IID59av
	adbZ1OTi4gpBxL039zae0N6mppJznZBHeNfSFUwi99qt43iplOqGdh7ntCTo/U7AfDWKFLRcM06
	lLS0BmonWFsV1wVJafgau3y8EtCY/gH9tIzSnoEfn+g+gHQ0=
X-Received: by 2002:a17:903:1b08:b0:2c6:d710:3e58 with SMTP id d9443c01a7336-2d015d5b940mr84316115ad.36.1785340625654;
        Wed, 29 Jul 2026 08:57:05 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2c6:d710:3e58 with SMTP id d9443c01a7336-2d015d5b940mr84315725ad.36.1785340625211;
        Wed, 29 Jul 2026 08:57:05 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm13502115ad.57.2026.07.29.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 09/17] drm/msm/gem: Fix dma_buf import error paths
Date: Wed, 29 Jul 2026 08:55:46 -0700
Message-ID: <20260729155609.20190-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX79rnW2FcBVrE
 qVTyM38rMgb99pHs9aCqtd05uBFx42xR1i0Gf17xRU9LhcZSq9l2VlXbZRckebAmL+w+OkKKB5g
 peJucxx0lmlsoTkAIKJTSDcuGCAEt7pBmApEBkvqfQ1qVSiQYOEQbej6WlM6DXcv4yC3uxCxqB9
 SdZhD19FPPTx04L1sLUWdb8j1DCfHpKDrO3j1Xa30Q81jEs+hBt735FrJidW9RTqD1Cq6/wB/sF
 Kldhe0PEmIXxSMItjL7cgGdewgF6P/eS6yub3hBWPhVducH1m0nu8SlKwFBiRN5+L+E9dQJ+9gd
 WBGJglGV19keUUcc8w3HmD3Fm+Ljd9cUFTfP3iMbz9MJrEde/SlFrJ5nqHAISYcw+jhGrWkejwB
 pcdDA1lErg/aDSw3XFtL93MF0tVDlV+L5xokV21iWSI1slbIFbA6LOvk6he24R5gS/8FsgnIpyp
 Rfl4Edf9Xyf+CPgiJOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXwPRDpMMr+xb1
 AZe7CsQr1LzqNq2RuWNfM3XeifPAMiXf8Of49xPYHVFIe84shHMX5ATR/990881S44cJlCFcqdg
 1Xi7gvX1YnzGmRfBg3XMAEzzeleTCXw=
X-Proofpoint-ORIG-GUID: WSqjvjxK1tg-3F0k-SE8fRRI9mHjpouP
X-Proofpoint-GUID: WSqjvjxK1tg-3F0k-SE8fRRI9mHjpouP
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a22d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CL2m_loAqK5Y4tUKEbYA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

Set import_attach early, so that if we hit an error path
msm_gem_free_object() goes down the drm_gem_is_imported()
path.

Set sgt late so _free_object() skips drm_prime_gem_destroy()
as this is done by drm_gem_prime_import_dev().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 17 ++++++++++++++---
 drivers/gpu/drm/msm/msm_gem.h       |  3 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..74c3728f45bd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1093,7 +1093,9 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		 */
 		kvfree(msm_obj->pages);
 
-		drm_prime_gem_destroy(obj, msm_obj->sgt);
+		/* In msm_gem_import() error path, sgt won't be set yet: */
+		if (msm_obj->sgt)
+			drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
@@ -1282,11 +1284,13 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 }
 
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
-		struct dma_buf *dmabuf, struct sg_table *sgt)
+				      struct dma_buf_attachment *attach,
+				      struct sg_table *sgt)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
+	struct dma_buf *dmabuf = attach->dmabuf;
 	size_t size, npages;
 	int ret;
 
@@ -1296,13 +1300,17 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/*
+	 * Set import_attach here in case we hit an error path that ends
+	 * up in drm_gem_object_put() -> msm_gem_free_object()
+	 */
+	obj->import_attach = attach;
 	drm_gem_private_object_init(dev, obj, size);
 
 	npages = size / PAGE_SIZE;
 
 	msm_obj = to_msm_bo(obj);
 	msm_gem_lock(obj);
-	msm_obj->sgt = sgt;
 	msm_obj->pages = kvmalloc_objs(struct page *, npages);
 	if (!msm_obj->pages) {
 		msm_gem_unlock(obj);
@@ -1328,6 +1336,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
+	/* Now that we are past potential failure points, set sgt: */
+	msm_obj->sgt = sgt;
+
 	return obj;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 762e546d25ef..86dc93cc1804 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -302,7 +302,8 @@ void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
-		struct dma_buf *dmabuf, struct sg_table *sgt);
+				      struct dma_buf_attachment *attach,
+				      struct sg_table *sgt);
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 036d34c674d9..beb7f22fd694 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -83,7 +83,7 @@ struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev,
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg)
 {
-	return msm_gem_import(dev, attach->dmabuf, sg);
+	return msm_gem_import(dev, attach, sg);
 }
 
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
-- 
2.55.0

