Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF3E48CD41
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340631; cv=none; b=rnkDAzuoJTuwlxZJXNASIQnskkJ2LirS07OSXi1bLb0Iqh46erMu2IVZVB+qJ5iJls1JWGeHbBpnP1eTyEFG8lD7+gDGzf8QlKEiAmGw+DX1HOFlMU2TJZLKJLO+eDor/WTwMMT5VlnoPj53uxVeOHrKQPi/0QYbbUXizU7EG4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340631; c=relaxed/simple;
	bh=5BnHoZndEqUDevNnff8ctfX2iLPk10WghnMPMpPcJ8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQfDquvA7+juRtDluOssEPYJ++5Ffw1yhqjtOe3koFeS8pDuiqfUXfSMyFY4HVrZx7Xxi/oAux+FRq21np3EKW/gh6+keu+nBw/Q1yjsmBHK0oGAENUGDDcSWgQer+GlbpzCvXCoTVnQoheoGbgzVlu7CaYNvHZo8jiz0Ihfvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyeZdbWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFeZn9ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyeZdbWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFeZn9ic"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2cfp2357051
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kuFeynn3gfk
	Q8AIVqyOcrg1EBWzVbObvEO2dO/Quafw=; b=oyeZdbWZIruIlKmx8I74nGLhjmH
	b1iZwePHP3IfQpUTdJiz7PT8A+1HV+q/s3ASVKuBzfLbIP60ton30Q5aQisboOPO
	o+ECmZpEMoveH1cUMEfejnspIFB0GrCOPCi2dQ6HaU5CFv7ChLWURfpWg03giMPY
	nZlwEPT1i/hBqR9flMGrHbSAGJzogtZaYnFlNAcpeXybs+Jga9SO2LfJY9dK5VgQ
	pX7nQfUSgfE/oeWP8A8SLCcjBRhbhep2ScigQkEHeSJ6zZmcnXJcD1BX2fE51bzD
	Nl5dWkTkMWxi4P7Ed8Qfk+Bz1EBZdl4W+74Dp4pTw8EYc2VbNbxxzDlJsBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe9955a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2435158a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340628; x=1785945428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuFeynn3gfkQ8AIVqyOcrg1EBWzVbObvEO2dO/Quafw=;
        b=NFeZn9icGfx3vXo3ua67bGtgf9tHhPLlLOJuSNCuNOhEYWgo26tefD7RIzAoZNipGp
         uAwaU8Z2BMJ9xxeAwnpt4rllMHrE9WB93hLurtEz7vU0PYL/sJ/1MDZs1TwBtZLcn/BH
         VOIZ8uZ8IblKVEHN0scCbOEKttu0jPqE7u5iQin5Lq02kl6uEEortzMVg/ZEHKNQ6/YQ
         9FK8J8eNhUp4Vgy2qy4s/k8sgvnrRJ2NcTDBN/sHPTPnOd0++IoZschW/T5sVsPqSb8d
         pfwDo0vlGGA/CPofMVBFcvh6cYdf+AsiOxPww+H8gfngyU8nWywS5AhrUadgzsPZBVl1
         UjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340628; x=1785945428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kuFeynn3gfkQ8AIVqyOcrg1EBWzVbObvEO2dO/Quafw=;
        b=NTwOjP9eyMHQ5SHgPzFKcszqM8oump89NpbLPFS9dNUQi8HZrAADLdgYjYXSarTz8D
         kFTR4Av68blzHC2aGiZmP7r+pg4fT8+WVZkIPJCxoaKTRFI8bC1N4YAIy3tItYqoNk+p
         /RU592PfkrICqaJyY6ge0HZd7u/PcDkNH/KjUpDWhLP5vB3oE3waW93uFIl1t9QVHg+f
         o1RU+pr5s46LQNtlYQa5omIM9a2TOICp40xMzdKbcrrU67IeE9SZfUdyqhJFb9HMUx+4
         TOVIO4Ekob5VVxq6MwgLCQ5G3a8WUp5tiN8nFdz+3Z4tgdqSEpjkrOtW3UhaIYfVJ6Dz
         r/QA==
X-Gm-Message-State: AOJu0YyOQutuP2J7yX2+3vxJClOCxxwLSzO0q6yUfWHRYPVUdzXYqxGe
	/E5s+h0cnozoK9pSTm21emjMmNg8V3cuseZXnys+UNZnj8pzueOy6yjncrX/PNpwcd3MS3cuNhG
	pzSzuQbzUifJeW4rjv7XPOI4lLLMIAYLmmhKi6R65S3yWvuuG47aenL8CvrCrw3sWAYuZ
X-Gm-Gg: AR+sD11ideoiZVChfepU5k27Oth7wkm21X3jpPiYvGAoJU9u5U2Fob6acvKKND1N/kt
	XTInaCWknHR27osaTECWMrxUbRFf7XWuSdB0NLCygVnyZjiy1egNKpNjHcR70mIj17b5NAJUzdz
	9Q/y6YzL17Q/c3FwxMOWOE/SxmdK38Yazb6rGzU91hfQPIMBU6vqN78v3fCkTROMpBp8C8t0nDQ
	IjTpMFp+4RZOr/RZ/oP1FAncCI92CBhLJls5yiw5CORxGzmliFPVX7wkSU/HlGNU7s+Ps4cvqar
	m7IoZqZrIQe5sdVYif0WDy2G2m7vA0tzBvF2dhgNBpV5sEHe78G8JnagAGCvNutjQSR0pEeI8DE
	2nHbzdcg6MCKz57CNDpmYwYCQDOzU4oD4mCnynC05W3rux7w=
X-Received: by 2002:a17:90b:3ccf:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38f6a53f749mr7381889a91.40.1785340628457;
        Wed, 29 Jul 2026 08:57:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3ccf:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38f6a53f749mr7381852a91.40.1785340628018;
        Wed, 29 Jul 2026 08:57:08 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm2974517a91.10.2026.07.29.08.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:07 -0700 (PDT)
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
Subject: [PATCH v7 11/17] drm/msm/gem: Extract bookkeeping init helper
Date: Wed, 29 Jul 2026 08:55:48 -0700
Message-ID: <20260729155609.20190-12-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX89c0jHrpnW6a
 5nJzkgNc9yx1OP9m4JEM2864gsG0EXTiuI/4SztCiFWVY4BTfy3EDnnl8NDRtERHzfeX5oeBSwf
 iuyYSBhtXzSo2EAMZ6Ub37ARY5cHE9b1YtuqR6ucsvQjkGwbDeITXF5llyKben4Wkj6fozrVlYU
 UUx69NXi7p/EgXfoRPacwrgk5TDgiW7QicnDO2pfMocPT3w8ytQrv1AdLq7IoptlGrjbrZiMbh+
 daa69Xoe47ne1FcdW2iVvtT/OpY4puOqM5Sfkm6/1qbr89etkln8phtlDPP4kvJSLHREGjkVqkv
 ZB0oOShGHSTu8erJ006iOw1FcxgM/s6jyGTJb786WeqotltqtHbjv9xIYLYXz9IJvSI+bPzhJ9V
 bYOIzlZ6p3azQWc6WJyoe6kbHVK8xkCtgZVAyckJQvb0EEdNwLmsjVe9vWbP40KvTV9A7aKeuKk
 iTUPMSLbmKHRLAGVIDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX3FEqXG0LNRnR
 O4ks/8DUTWIUTlmKWseciWhRnfni3Pf3Nh5rISHy7HkhH6ot7iAwf7qn9rrPH5/JLi9L90AB5jC
 34EQ9vtUxP7HMZkwAqDvBE6KweoZfTA=
X-Proofpoint-ORIG-GUID: VIujx_opyFOzGI8wc5A4EeiHkIJPJyg5
X-Proofpoint-GUID: VIujx_opyFOzGI8wc5A4EeiHkIJPJyg5
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a22d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FQYndL8g-KLy3NOJUqEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

Clean up duplicated logic between import and new paths.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cc45392691e5..3c36b1c4a4d5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1234,10 +1234,25 @@ static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
 	return 0;
 }
 
+static int msm_gem_init_bookkeeping(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	if (drm_gem_is_imported(obj)) {
+		drm_gem_lru_move_tail(&priv->lru.pinned, obj);
+	} else {
+		drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
+	}
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
 
@@ -1253,8 +1268,6 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 	if (ret)
 		return ERR_PTR(ret);
 
-	msm_obj = to_msm_bo(obj);
-
 	ret = drm_gem_object_init(dev, obj, size);
 	if (ret)
 		goto fail;
@@ -1266,13 +1279,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
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
 
@@ -1287,7 +1294,6 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 				      struct dma_buf_attachment *attach,
 				      struct sg_table *sgt)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
 	struct dma_buf *dmabuf = attach->dmabuf;
@@ -1321,13 +1327,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
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

