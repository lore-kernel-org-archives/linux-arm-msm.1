Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222A3BF68E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292213; cv=none; b=h9zf+6Yvoovj0QpFc8N08s2YofgY7JNRl6RAXecS2G0tZYUlYb7Md7fJYyPOomAKDUk4t5LDKoM2r2yUvj+odjyElsw3sZg65g/ZnLQ1Rw85T4bD1/bEggaao8cz1r1ob3BxIIA96ruwRPZxv3znrOMfD3SFUCAmTxsKNSToWTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292213; c=relaxed/simple;
	bh=E4IQJ8ElIGDhRKgbQ0gyKV2IsPxfzamJjIvCSsR6buw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sV2NZBnxolG6UoZCHVkGa179wKMBziSLmVaMFUhZJH2yQ1usRoPFOjBD20m+AqgPEAVEOUG2AVyvNWfzNMUHCBDOgqyCiTSWadtR1cnMa49okY50st5qRyzJVdCSqm1jiO4HDS4NkJ11QY1j7l6/fYB34Pqsoe4bKRdJQlUHc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1/5W5uy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWlfKWTD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1/5W5uy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWlfKWTD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPNCp3890609
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 13:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XHpXieFsXX6
	qHFJWj6txetKx05HnT6IpWTUeLEfybns=; b=p1/5W5uyBDgI05jG1sFDsqFBTr9
	5iA6VJffEobuUpQ70jKlpKhYend3vN2yG0EQxoR7k4ZsEaJ4YBat6bNOrG98q6n+
	j9pzmgg1nPv8L1XjQRVDyEV/y522cqIJS5SxRMVAXnX9++uou0uIgxNDl9L5teXB
	9pWlhxnuUwoLgOaNfG4tHShmjVXZjddXQV5HCU2eOo2XUEfTfP8t3YWRerrG3GSd
	zqNkFyrghPtjjw4fwmTk7zeQSlFXYPQJO/zm6rlDSdD/ed2F5D2nb/uM4jJpdSzN
	R12BgKTLzF7yxlyvL5c6GGJQvyasDolVR76yOVjvbI5wCiBLd9y5cX1a2yQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkum0g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 13:10:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so3367425b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292210; x=1791897010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHpXieFsXX6qHFJWj6txetKx05HnT6IpWTUeLEfybns=;
        b=fWlfKWTDTjBnRLQ/+GCe2wx+fZrcZn4r61gLWKsZjFZi+hjl8ESwuCPaLJYBz9jioX
         IfQW1AXb5HFflXxsa44hiM5YGQZwntqk1k4B7MVxPTALlF8YDYUqnB+KODy+k1/sG9t2
         jKnDI+yL0cEWn1c4maFDN0ysBkmfdrTFfEbsfuigD5Vj/BEZVNCSL9R2LT8Uqt/HJZT9
         UaZ6SgtXC/n5cif4Wo185//MR7931ceW7cHSrf+sV0EqZUjgnuhYAfCkgBNFJioW4Gmj
         wBI5ovw/joCUdW2SAbV7lxQhW7YoEaz9yzl6ZTokfpHg9+HtoJWUmF0OG89abhLpAL+e
         2v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292210; x=1791897010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHpXieFsXX6qHFJWj6txetKx05HnT6IpWTUeLEfybns=;
        b=ph8ZEDsBnz28x2UxmTXZgtDO5AKeQayV/5AHQp1ng8dH8fKpVd1yAmEKFPod1cpFl9
         HpvJQ+eUHFcZB1zbSwk4Uzny1tS55ViIzPQm7yEycgvxechvqbwEY8uP21dnRKkCj7eg
         unibsfNjCx7IEKUvHabnZjMzUjLF0Xrdoahvy6UmUkPPPWVUCRMpm2qVTj1ADxDBvuGI
         7xEw6V5ietNff699WKJO1GsjHJDzwePb0GSVfHhKD4eeXFhMfwCaxlhdg15Z15n4DYVw
         KSKR8/tmnI0tSJ4r3E6XmquGUT/KQ8+p7oVShZyY4uCP7C36uY4WAikvTa/4yvtdHgQI
         2gWA==
X-Gm-Message-State: AFuF++k7rWqp1SnMDqtYC0HzAtCEqVQjUfilrdKMc2MfWyF2kQaTpDzm
	jQPCUW1nmTNC7F2wk8ef29OIUji4tXjMOF3NwgmfH9UAYOsn9h+vna+fG9vEJcpsHod2wKb34ID
	QmGAhpjg4hP9g2Nz2sFvW09qv45xnUSB337jO1h+fPAU901ZBmGFWKCu/Ug4vSBx4sFWb
X-Gm-Gg: AYBFou3OHruhFwOSSPxR0CIvclRfBrNzT2I1US20NwP+BFw5WuiTlh80MK/A/FZVS2s
	2BuoD70//n1VfPa2iidbvAn+lu3UDkrcX5K5Ux61E3A4KprbQU4MC3uMsKqrHhWz5CqbmiKqxmG
	L8OGfzDDMnTSlnP5HnuhjDz2gGd9OiiReTIeixDz9zyQRV7k3oHtKTw7n9lZ5xiX4j3hjHJDiOb
	6u8D7Yrv+I4mVUMODS7yD4qtm5pj9dWuny5s/NOyrvp+UK3IfpDicIaw8atiLikA3J6lIxWwXf0
	qwMsSrtKW9jbB8dU1f9xJ8rRkQw1Ye8huTcSEK5CjuwJRO+LTQ+vV3bfJolD5cWGq4gxKzXuNaf
	Yaecq1ghZBydFPC4xL1nqKoke7KeyGjrMsQHMqlH/THgBmQ==
X-Received: by 2002:a05:6a00:4b52:b0:874:706d:856f with SMTP id d2e1a72fcca58-890debc9693mr1171583b3a.32.1791292209881;
        Tue, 06 Oct 2026 06:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b52:b0:874:706d:856f with SMTP id d2e1a72fcca58-890debc9693mr1171559b3a.32.1791292209441;
        Tue, 06 Oct 2026 06:10:09 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a4498sm4744401b3a.31.2026.10.06.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:09 -0700 (PDT)
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
Subject: [RFT 1/5] drm/msm: Cleanup if pages_to_sg() fails
Date: Tue,  6 Oct 2026 06:09:52 -0700
Message-ID: <20261006131000.81501-2-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4f332 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aq7xQ8hs3DLR8BDoFBQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: D1qdkZZwrWTAjxLBirb3qd9V_WSO5-lx
X-Proofpoint-ORIG-GUID: D1qdkZZwrWTAjxLBirb3qd9V_WSO5-lx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX+cuhWVIPNciQ
 /NOj9E/nAJWeFZNxJV7AfSnZRwJKqBiyf6yHp74msjbq2ghcvDUVGN0VimLKpSAYDUZNJOzXSl1
 AizFpG6nm+6KBSvA4RDvlB0u4SCEPQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX07IYu7+3fR0e
 NbUJFqWTDnM4ZRCCewNSPirdHrjpmmOUSPd4CyjYKO4RkjhsBaNZbsmh0suXH15dZRk+qVhdmrw
 Goujp2U6mmZeZjOto/jGDml5IF1wwjqasExFHBn2DweCmUtASsUaP4H6UcHvp6FN2AC77RXDLNm
 6C77bPh7Rrh6ZZoZEfBjqqLo1VCAxNdV1+VRL9h6sTqKC/RvY7k4shHhKM7A2KVfLwCmiuaViig
 zhiCr5BhgDjdV6cReK+cIuM6YuDj1ssZe95xnD89fI4uAXoQAjS9QOym2anMMK9tn9hZ2cKzPgk
 XJLYum4b3MOSG8uGPyGrc3ews3pjV3VCeKoqsWAbUE6VyJ7ewUiMebbGzS/wJEgw1EEPnEDXbXK
 W9KYhwE723NFLfXlSPCPeOYzqKAHHGV5WB8IzWIkN9JK3Ns9I8dUkJHMXZXkW9vwcG4xPUZ0WML
 6+gTigRhc7+/O5V4AwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

We never really handled this.  But in practice mapping to smmu would
have failed without an sgt, which would have been pretty obvious.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 41 ++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 130ae27ee00b..181b9ad32672 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -190,6 +190,7 @@ static void update_lru(struct drm_gem_object *obj)
 static struct page **get_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	int ret = 0;
 
 	msm_gem_assert_locked(obj);
 
@@ -209,19 +210,17 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			return p;
 		}
 
-		update_device_mem(dev->dev_private, obj->size);
-
 		msm_obj->pages = p;
 
 		msm_obj->sgt = drm_prime_pages_to_sg(obj->dev, p, npages);
 		if (IS_ERR(msm_obj->sgt)) {
-			void *ptr = ERR_CAST(msm_obj->sgt);
-
 			DRM_DEV_ERROR(dev->dev, "failed to allocate sgt\n");
-			msm_obj->sgt = NULL;
-			return ptr;
+			ret = PTR_ERR(msm_obj->sgt);
+			goto error;
 		}
 
+		update_device_mem(dev->dev_private, obj->size);
+
 		/* For non-cached buffers, ensure the new pages are clean
 		 * because display controller, GPU, etc. are not coherent:
 		 */
@@ -232,6 +231,14 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	}
 
 	return msm_obj->pages;
+
+error:
+	msm_obj->sgt = NULL;
+
+	drm_gem_put_pages(obj, msm_obj->pages, false, false);
+	msm_obj->pages = NULL;
+
+	return ERR_PTR(ret);
 }
 
 static void put_pages(struct drm_gem_object *obj)
@@ -246,18 +253,16 @@ static void put_pages(struct drm_gem_object *obj)
 		drm_gpuvm_bo_gem_evict(obj, true);
 
 	if (msm_obj->pages) {
-		if (msm_obj->sgt) {
-			/* For non-cached buffers, ensure the new
-			 * pages are clean because display controller,
-			 * GPU, etc. are not coherent:
-			 */
-			if (msm_obj->flags & MSM_BO_WC)
-				sync_for_cpu(msm_obj);
-
-			sg_free_table(msm_obj->sgt);
-			kfree(msm_obj->sgt);
-			msm_obj->sgt = NULL;
-		}
+		/* For non-cached buffers, ensure the new
+		 * pages are clean because display controller,
+		 * GPU, etc. are not coherent:
+		 */
+		if (msm_obj->flags & MSM_BO_WC)
+			sync_for_cpu(msm_obj);
+
+		sg_free_table(msm_obj->sgt);
+		kfree(msm_obj->sgt);
+		msm_obj->sgt = NULL;
 
 		update_device_mem(obj->dev->dev_private, -obj->size);
 
-- 
2.55.0

