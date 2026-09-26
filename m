Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF22A399CF0
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447519; cv=none; b=C5mhNGtAzu3YTyZ7Kus/dsv0OJtRtLpcuBQNpHAF4fCgm4JZZbCKVuJg41uu1p3Zdd905MRRQFEnLY044sjpnqh6Cr+/T0l/C1T0WfDdsEmFKQr8zJdxi9zywOo5oxI3kXG+iWtLOjFPpH/rRK/AwMrWxkTy/9CUH9UKsknii0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447519; c=relaxed/simple;
	bh=hCvbc6v8ndE35eGvRpp3rX/gmydpJn7Vx7URJjt+G+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3kfo6VjIPi1XM7wG2WKmrHzZEQoeDCkAmMUO2ZYMuZzm6nDNW5sOlgvwobdKThPGAm5HhcKePxcqxrQ02M0myF1Rxxl+mroQtN0kIjYM4pVBVrB3WFYYIggGO7WoMHo9msQv6N/G+zw2lp8bpQrDQjRWIddN1r/JkyIw3CK6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHDE1InM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OA81Sc7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHDE1InM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OA81Sc7s"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxLnA3792974
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m3YHNJZHv+9
	lQJD2w9H1e8e2ppiLvEr6xRng+1PaLnI=; b=dHDE1InMEA33pCQxgqAVyeZQBQt
	qiEYM0tHeY/kljnteYXcmcjeQjVgphjj5lwci1mVfrBz7bjjDBzDE2z8sNYYBXj9
	/scqbncZoSxcMdy8ZiSsNrY8Sg/qYuhqp7Si2jqJUuI7q6SLClUgf0nLgyTOLl2T
	ZhREj5/6iY+VyBOSPGxtgo454ReDsT0gaV1yX8rUvSPhKbdUzc4uhudG0Tm6ZTML
	/7fWwNC7CPvsc9BumunZmU2xWuLd66542iKNLJGt4VeToPx4wElQQde1qfjW0Wt3
	c5nb+b4fCHOH50BAxG44WYFfOGyaeNobt9IhE/pfHccVsj0lcE8Vg7CmqYw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9sb43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1231041a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447516; x=1791052316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3YHNJZHv+9lQJD2w9H1e8e2ppiLvEr6xRng+1PaLnI=;
        b=OA81Sc7s0R4DZlUSwdGWojn9V/5qOVdKshcqfywBMTmRRWmjbY775R9Cff3k+QzmEX
         yTJEz6jvKGylh8+XA79znOMQiL3/qFuGQtJm8+fXX5JtgzAfIC9/g80/VshmK+UG0cQ3
         qWSJyNBV1at/CBLWOqNAKgWZCABisu+z7AiRaEN+gVAVPW/xKIQ4h+Jucl1ce4J/yDGo
         xiDwMyKinkrN8R8opAYuveN09Jcq7hVlxSA2/BbMdPoGS1SOBtnhuOs3XU3ZRkM2DrBg
         NY1vpGgnRf/TaV5Eg/nlfFGYgCCOFFWCVdjvQSdJgfRqYnDgNKwfNveS78IlQsZnroEM
         N0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447516; x=1791052316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3YHNJZHv+9lQJD2w9H1e8e2ppiLvEr6xRng+1PaLnI=;
        b=P7aCIsRN6DgrQ4nWt3h6JJfSE6AIaluoFD0ZsQBhKDEEhCXwPzIt8QkehIwj3eW3B+
         HkXSQKeojeQY311TnFC8GT6CJAEHoor2RASAn3EIfuitFRdBlpB2grjLr6vvp/a44hL7
         /tAgceLxyV7xyXSiSxFY5H/gZEuxviAX8y9rFYNyZQub/pvKZSOO2vnfIae01j8SPDRE
         7UWtO46hqtFNlrUM94+pEovO1qrJhiEwpjwGnaKsPA/FAwbQII3tGw/9d/4H7PVYVZm6
         UTIEb5tF2mBjjj8cyJIVfDlpBjuL/n1UvPIai9oyoPVYgN9uECy4h2FFWHsQ8fbgi0jm
         XZOQ==
X-Gm-Message-State: AFuF++lLLG8bRP+hKR7YXhLlNoC/nJwFVUbAlL2lNGlIOpCribnv73Er
	+5GyjyEc+xlMDlVbwfqN64kJm2nBtKUI+HJuu3xLtkwaBVrmeBg144hgaQCNYmskkr9yPT1YYSf
	uJcIj6aahga9WAda5n/DbWE+rTDCjyy5/nmj/BoZbljaEUq58Hogu8ewhD5LTZRTlFJc1
X-Gm-Gg: AYBFou0ibAcsZL8tp/mOEFPKcWIub3YX3xNMJ2PDa4P0Zfe2MVDDg/MXy/sAt7Mi8kG
	yXdtEqdOUxQFVgj1M8QTacY/dI8PASgNU1k7PqXtGhoKuFv7Y41NcOYLFdXywo8qsA59o3STrDE
	eUJJN2Cq7LyIERXeIIY3jSk3X5X4NerhP9BBwF/C5r9Qt+AxRhd6iruwhpQk8FkOIVBQbOVjdr0
	5y1dMvA1BJ/T5rhNi/SMSn5LF0Qn7gpSPctz6J67XDqdWvlaUCJ6MPEjp5YMoP0aIjlaFn4S4rD
	P6Rgaw6T3GVd+dEQAcTcNNTqHJ4UmNA8pNHflTOIRs4DD3S4dKYlDL7XJLZ6QrSXxwA2zaTtnIA
	g+LNlNHhX4mN2a08Ue9N2zBs+8T/+BsK7mA4rCyeOqaEXSZU=
X-Received: by 2002:a05:6a20:43a9:b0:3dd:a196:906a with SMTP id adf61e73a8af0-3de0e904a06mr8183369637.52.1790447516281;
        Sat, 26 Sep 2026 11:31:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3dd:a196:906a with SMTP id adf61e73a8af0-3de0e904a06mr8183355637.52.1790447515796;
        Sat, 26 Sep 2026 11:31:55 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8804b52066dsm2106079b3a.49.2026.09.26.11.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:54 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/msm/gem: Stop exposing a page array
Date: Sat, 26 Sep 2026 11:30:44 -0700
Message-ID: <20260926183051.25754-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX3MDPVxw2Jfcz
 nHSuAlMCrKsReoWcb9+M6+XILwxBdLWSZ61VxNBjynltLaoOD+fDnIwCs6hGcZQ2vmXX1dyb/BW
 J6PxB3e8U+AoOMNJ6lBaRYHUXVeFdA4=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab80f9d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qy49VNyTqSxgYBYDrycA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: tiKcMSERwM94yjncH4qqyr5SB6bjxSZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfXyyd+lJjGWrXN
 gy0cdtzX2nB5nJHB3ba9LYfLnouxZp/Vfn3K/ykbT7yhSnLPhgTUEiTmGZOipMGr/xI2Q+hQgTd
 UE0Xolrh3SeSuhDjfdw/ObUOlzCkWBGjQIL3KPG8kHR9VDxHsxgUVRq3Wa6vTQN663iKniIO69y
 nY0BCnUvpcPhjrBSR2sDxFidSS5Ds8G/j0z0P7hBz7ulLj5SPf2kIU47g47mub9vUc5jG5VDNTR
 +tnvrIXg42/xd49XGTxjbPHNBDYBeCM0tKubELiA9vTAqWB4etLQNyjcDh+0V7K1XIltN0P7Bit
 P20jSPRTWWMOVScsCRb6YgfBLafJcoh+egjiMPqNAAodjb57i2IBTafBb7rGsY+1TNwcHAQjJ7O
 R47seuYf7nvzKGEkWkw57Y1pJpC3aPjhUbtsE1D7LoIho6g5M2Z9HtPlV+e6WIrAq9Po/z8faQ1
 +Dk1XbarqAoUnhBh3VA==
X-Proofpoint-ORIG-GUID: tiKcMSERwM94yjncH4qqyr5SB6bjxSZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

The remaining callers of msm_gem_pin_pages_locked() and
msm_gem_get_pages_locked() don't actually care about pages, other
than as a conduit for returning an error.  So convert them to
just directly return an int instead.

And rename _get_pages_locked() to _make_resident_locked() to
better reflect it's purpose.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 28 ++++++++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c |  5 +----
 drivers/gpu/drm/msm/msm_gem_vma.c   |  8 ++++----
 4 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bf6a8939af7c..2341f209adf5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -280,12 +280,16 @@ static int check_madv_locked(struct drm_gem_object *obj, unsigned madv)
 	return 0;
 }
 
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	int err = check_madv_locked(obj, madv);
 	if (err)
-		return ERR_PTR(err);
-	return get_pages(obj);
+		return err;
+
+	struct page **pages = get_pages(obj);
+	if (IS_ERR(pages))
+		return PTR_ERR(pages);
+	return 0;
 }
 
 /*
@@ -310,17 +314,17 @@ static void pin_obj_locked(struct drm_gem_object *obj)
 	mutex_unlock(&dev->gem_lru_mutex);
 }
 
-struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
+int msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
-	struct page **p;
+	int ret;
 
 	msm_gem_assert_locked(obj);
 
-	p = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-	if (!IS_ERR(p))
+	ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+	if (!ret)
 		pin_obj_locked(obj);
 
-	return p;
+	return ret;
 }
 
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj)
@@ -487,14 +491,14 @@ int msm_gem_prot(struct drm_gem_object *obj)
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = msm_gem_prot(obj);
+	int ret;
 
 	msm_gem_assert_locked(obj);
 
-	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
+	ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+	if (ret)
+		return ret;
 
 	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 73dafe080bfd..4f681100ecb0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -279,8 +279,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			     uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv);
-struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
+int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv);
+int msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index beb7f22fd694..b14cda87df4f 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -109,7 +109,6 @@ struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
-	struct page **pages;
 	int ret = 0;
 
 	if (drm_gem_is_imported(obj))
@@ -118,9 +117,7 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return -EINVAL;
 
-	pages = msm_gem_pin_pages_locked(obj);
-	if (IS_ERR(pages))
-		ret = PTR_ERR(pages);
+	return msm_gem_pin_pages_locked(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index c11d021581e0..311205c7f1ba 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1300,11 +1300,11 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
 	 * trigger get_pages())
 	 */
 	job_foreach_bo (obj, job) {
-		struct page **pages;
+		int ret;
 
-		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-		if (IS_ERR(pages))
-			return PTR_ERR(pages);
+		ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+		if (ret)
+			return ret;
 	}
 
 	struct drm_device *dev = job->vm->drm;
-- 
2.55.0

