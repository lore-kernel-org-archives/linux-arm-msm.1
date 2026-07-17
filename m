Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3890A38F249
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321351; cv=none; b=J26d9MwB90Wfd8N9DhUYVUjGjLitsqUnPWg/ymfECccMMn93ktPHPicT79GNS2F+8ZhNoRkj5bsZthS25GtDdTixPwK9YYM1ThLd1uz8Zp808Fx+Cc/PzZoUhIUZCPwABBTMJrrVG98QLh3b1T14GaUqEWZjX+nMmanZXzhePDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321351; c=relaxed/simple;
	bh=E0iUbFB/MIt/Cq7b61yiV60mMfudaa+lOJ/AhKQqmMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ydvk4ngxq036ROYv+9CMC1Y432MmDPL8QA11QmMLECgojUiwY1K2Di+YLz1F6cwxyxVhb50ryy6NcDDbcUb+dl17ey7kik/pN2PT7MqIEF37GDv2zXW7QZ5WKSCvH4CvuUGRI3CueDqOC4xZObk/zRimGjtBglvGL5IDsYUzyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfOugpkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvBuBlXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfOugpkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvBuBlXl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtS2q2652967
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4CMYyKDJ3M5
	3142fIiVcs31bCTT449JO3xTuz6WbmaE=; b=gfOugpkwMNnJ9ADd9groXhgINwx
	Ppx3Hn1x3EqK0HopesfVxLqI+3OzJsS3bdOPTlBGOlB/lYoqTmotV4zk6gcEgBfb
	nmfhqzYiNcIw85qGWWLP4hhcWPGZl/6ocLXAmaL6dCygtxN/BIbpM+3c+M9HJVv+
	58Sj4Uuu3TRRcf3xGoJaotq/ScHY4DGzWG5+XBFRFi/eAAJAQ31y5lVEFiJpZ7FF
	syd7+o2BjlwDbHutDjaJ9c/O7yQFpbQksNiFjWATerqIIvUunX3Bw411AR2wbbzS
	zm6n4WIsE6arkWT49L/zop/OTV+AtvoNuEq2IOdUGCkrORu5p0kbp3fdGNA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9pb9d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso16460945ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321345; x=1784926145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CMYyKDJ3M53142fIiVcs31bCTT449JO3xTuz6WbmaE=;
        b=gvBuBlXlmbgqUnONHhkgg6loxyFkwr1eSiOleXUIxgH547g9Qp2SQ6FxuYOC+VTpct
         owFmhByrPiQxRfWEsJZ/s8OSCjFoYNeq2uxp3XkXfh053f1onYkzIS2qLH8GqRjG+n4/
         P4rhENPO9l0LspdByH3fdy1NycZtJfsP5sw7XKZuK6eEULeKBMW+PfFKSqI1FnMy3z16
         ZsblUNK82cjIckuzYWJglgIHujqR4SMmmN2YfTTqQ7UERWFIa6ZYHc2ngTPr/kGySWI5
         WPdPlGdvLcTxkfkUIFRzLhn0lMkp2jhVPjIcaSHdBYyUDORR6MDKYoW1dP2s2nUdkn+1
         1bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321345; x=1784926145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CMYyKDJ3M53142fIiVcs31bCTT449JO3xTuz6WbmaE=;
        b=LRJzsbe9JHwtiPGuhJUFB28TKFaQEcXHs7PrTgTs8fPc7raY8d5taOzE3vMyahdHQ4
         pcLhw19hOWu7LGCUq/0bGSAKdglTt/Q8qyjd3ao/wQ0pfSKt8TRHwIfnq9NWqFgO3Iuf
         THWxhei1VziGTIMR3L14MqgpwmnuWurkP2Nndb6vLp6KyQz+eFxQVJ1O9vYG5Z6GSpnD
         5vV8Dn2j+VPq9YIYWU6dgpV/TsjMxaJBfiKkIVbehwDfqLPBo2WOUiTCupLhKaLCseUW
         va+LXJs5qhZasYCoWEb2Rc3Z9s5spQkw1EWFpFu/k3gJ9718OuEdj7BZVpUwjyHOZDRI
         j0Ag==
X-Gm-Message-State: AOJu0YysvpTCR0oJ7JAf7GKaXQNq2R+pZylIycStSA0V4ZBh3DvCTWbE
	56ZxBfQI6BnJspBLt3Hb7423JYdlEQc/O4I7Uqnnh+eK+/it41wJ11XwSWtCe46E4dt/xaYdcRE
	sMoZts261mGT2/9KsOaMQ94b+bOYNAS3l724uNFiR/rFqJlLwWnkihGt0yCdLbHHOYVosr3e+fO
	P/
X-Gm-Gg: AfdE7cmtjahsM9YPo+8BO1tnTVztDpIEG8KXeAoNOYTBEYg/3dKvKjluHc44vc3Ky6+
	jS26SkIiWa8eW7aAW2TOf/mkWiDVg/BOz3njlLMO52WDhKHBpTTQ1riuW6Z8i7S85SKcKXW8Kwd
	kXqUoLCngIMAfwr7EMpBN4FoGvoLvQnhskdqSHbxtN+FoYpTHLZ0cnqtCjGstVpDqg2QwR98Z+g
	Ij37H6kUiMSKXitneqovgp/deVdYZwTw3m36ukYGwA8SyZbqOdRoBdlCXKiQukXB22Iuczwq58h
	zOz/k/RFiWXh1fm+4G03e8jT8vkV/J7uUTSFAlQ/rGyDJBJHoYW5qRXMbgvOUb8oznxIzJCc61Y
	Rt8f/AlbCnD8ur0lyH3uPFL4cc/hrZr9wZlo4/N05UHG14hk=
X-Received: by 2002:a17:903:3810:b0:2c9:fc0d:165b with SMTP id d9443c01a7336-2cf1f544ef8mr91319395ad.23.1784321345047;
        Fri, 17 Jul 2026 13:49:05 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2c9:fc0d:165b with SMTP id d9443c01a7336-2cf1f544ef8mr91319135ad.23.1784321344618;
        Fri, 17 Jul 2026 13:49:04 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm16778325ad.31.2026.07.17.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 10/16] drm/msm/gem: Extract bookkeeping init helper
Date: Fri, 17 Jul 2026 13:48:26 -0700
Message-ID: <20260717204841.26120-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jCo5LfK8EvG7CF3SNAoEsgmBc6UvMEEe
X-Proofpoint-ORIG-GUID: jCo5LfK8EvG7CF3SNAoEsgmBc6UvMEEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX+fZf1zUI46D7
 5flJJt0SLa5lF58gppPs7bLnYLxBA6rlgkmjfH3Deamo8tWgld/InYxAOyND6FVaH113ctiDD+L
 xoN1qclHnjnEF6+bPjMzUI7czYjAdXggInHFv5JqhPQ9WawzTK9AE/ODiPvHVTJwELXxY9gjSvX
 Jnib+noOXgvTM35Jr/7gs5QZLRPJ23qDFQNOpoBZg1FsbjjmmsoPPhaZLZYYFhFNlCAAHW0CgkP
 dyVa3CMVOJxUg1PF8U6EeS4JMq15IU2xaeNUp5YQLZ0kUPM1SdQz0jRa8+GU0dF+gT9/N8R1Jm+
 9mLbLqE4I1idrHKNDnPq4fHg7RoptF/mk1mXzxUpAJ2Viy0EzzcmUB10U5t/zTP5rhAEOP7qT6w
 q2uVoXKa17f3SvLOKKY0zGC1C8ngxj8NhQNyGtJv8KVqYIq+TGDPp2qNGCxwYwRu0WrVee0vYQM
 2dgJsjg8rZWgcdihojA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a9541 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UD37_32G2j58TxomCrsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX+Z7oe2nSS1W8
 IW6LC8YiGF8c43CAg9RTbMPMLTD5BkhDQkKfY54rtKSPk0Wwa9l62Q4whJzYdnnKvlypamp+Fqu
 A6a0DT9ERrUZSqwhCiNYAuGw9NsDw2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

Clean up duplicated logic between import and new paths.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1aa844ce4f2c..59143be07428 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1232,10 +1232,21 @@ static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
 	return 0;
 }
 
+static int msm_gem_init_bookkeeping(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
+
+	mutex_lock(&priv->obj_lock);
+	list_add_tail(&to_msm_bo(obj)->node, &priv->objects);
+	mutex_unlock(&priv->obj_lock);
+
+	return drm_gem_create_mmap_offset(obj);
+}
+
 struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
 {
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj = NULL;
 	int ret;
 
@@ -1251,8 +1262,6 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 	if (ret)
 		return ERR_PTR(ret);
 
-	msm_obj = to_msm_bo(obj);
-
 	ret = drm_gem_object_init(dev, obj, size);
 	if (ret)
 		goto fail;
@@ -1264,13 +1273,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 	 */
 	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
 
-	drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
-
-	mutex_lock(&priv->obj_lock);
-	list_add_tail(&msm_obj->node, &priv->objects);
-	mutex_unlock(&priv->obj_lock);
-
-	ret = drm_gem_create_mmap_offset(obj);
+	ret = msm_gem_init_bookkeeping(obj);
 	if (ret)
 		goto fail;
 
@@ -1284,7 +1287,6 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
 	size_t size, npages;
@@ -1313,13 +1315,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		goto fail;
 	}
 
-	drm_gem_lru_move_tail(&priv->lru.pinned, obj);
-
-	mutex_lock(&priv->obj_lock);
-	list_add_tail(&msm_obj->node, &priv->objects);
-	mutex_unlock(&priv->obj_lock);
-
-	ret = drm_gem_create_mmap_offset(obj);
+	ret = msm_gem_init_bookkeeping(obj);
 	if (ret)
 		goto fail;
 
-- 
2.55.0

