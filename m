Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114910;
	b=rmyjHw0xQVTay5wYlsG22ME2mWOot4+WMcP/pTUev45VT9LA/WQHIJpdgGp9REUwl5Ul
	 4UwJ7F5q+8Kh7Hu83BwuCOZG6v/Gsuh+9VN8HVEW0HS8Kn1wKIPU6ri9crpwgalviylTM
	 n37AETVsX8l84qZr238cgez0aN7EXPtrOPyjAOIB5xYGl2ZtOJPmKjPEfNP31AXB1iC4f
	 VtbVo//WbtPyLgVZFfDWdoRqmRs3r4lHfJdMap+7zBaMUphb94JN1Z6xjPReEIsQdGD+T
	 JUABT2UPQOorBGCy6ImTY16HHUaaFQkqN1+/QOOFbBy/BTop+Zo0lASV9Z4Mptr9H+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
	b=zeob5ESbB/wbL0tmzWtsAPFzN5FfusJHeA2sa34247kmm+MN1AW2AyZaxcFaGh/8XE48
	 HOp1TDR0Mcx/XXpxQfTLyZCyePyoacaww5fKL948yMNQORCFFOpMYeqLpORly52BpY+KA
	 9LfLt3EBcwoDLGMtuxW1Fg17oeW2PMuoTj4nesabHDGY7NfYWRkDM1skNL6zlqj+FxYID
	 SI9xjzyJlE3S9/OXYWzPZS9VpnGYqqT7r28Yke+NHbE9Kcnmlc+r5s/TX3nu0CNq3u1bO
	 kJaRDz4fCqE05PxbXF83HHGJTVVEks9AgW9cGyqMa7ElnER9OGbbArtbuLAE6B3jMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfiPJpxg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQkefLSZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9688606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9688606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfiPJpxg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQkefLSZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL37U3153374
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQvi+0f2Rse
	41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=; b=LfiPJpxgxqDN1jOOc2kc09Dt+ic
	PI4CGH3S/uz3OVQaYks7W8g7UAlAJlqVAJRaDCe5h5lOqv0WIETC+z9W7zpLDgZX
	2KPG8xkoj32Ao6qWJmP9hInwa9YNhq4J2JPXWABumBRStAfjkKJV1n43tJCMrf7H
	0o3DyAHEn/W4VKOB8qdTS2dgbXEx/gHpZKfLbrGjYtwoXIM1zVPbPWc1/jeau5pZ
	C7WRsTJhtKzDjqbZahmE4nDINrpeEfY+BEuZXjoGyM4bULN1aTeUqxjr5klgPA0a
	JGJDfmzbI/PWHZ3OXVG3w/QaqbfzX+lCAbh3Mol1xhllWIrNPEnSabLeCDQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21uds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdac99e77d0so29477a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114908; x=1793719708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=OQkefLSZ0eovSnq2MhzBqRssVlgDRBLSlGl8dXyusSNMp6GXBiE7AqRVoBz+l64LpZ
         ZFTK7yCImP4tTDLWmhhYL7sURQcbKrCoC2xSQqlcYBNFEsDStv/8yBdW/SVR1o6NtvGY
         oIbJ0ISgm72NGDJyvE3sEim4LM7Kk0+K2IXke5LF09GKPj2amVHbxsT9lC9b8KCPqdWA
         nONV0ULYBmQJoHRZZwdqYC56tlthqGj2H73x4FWtStKzhGhVkyhU4mtzYWVCqGGqy7oK
         +yKUb4cof7i2HKs5fNRnmXcV1XUhBkE+zCMBBGc5Tm3drYicg9Ebbu4ooS06ryxsAz1n
         kb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114908; x=1793719708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=zSNudqqfkyd3tnYpi2jILDAKxIOzyC2Uh9JtoP142DT5XITOSff/kgnK6VuW1Wodcj
         XP+RqGCZNTnsYDcNZq8+aYKVBUTveBYjyQCrHxyKQEMef+icP9ZZ/bre5y/SdqOPdZXi
         iAdUYWGfZKiMWNkjvVY7fZtv6RC3uzxcOmxzBumT1bWP+5dNGFqrSV/DTgERZUa29va8
         rPgp3svbdTInvM6esBo/jb5TsdJ7dYoZ4KhuABXTSgi+9tsB4QkqNSytia96EFyVB/cL
         qgCP1U6uNchvgxtg1v9irIiDtDls+1a/ozkOhYM2UmhWaFtq6pPTjaf+XrSmU30Wcu2c
         ex9w==
X-Gm-Message-State: AFq9FYIJn741fMM/5w2KbYVW6+is+L5mFF3gGI0NQK+BqZXml+7oeOpc
	6107I/kGVStnFzK0bk8EJy6u5Oi4WzVfb2/9k/cqFxko3ELCX8Eh86yBcWUUZe4KVdWcu+F9Zw/
	SZnzKor9nchN46igfNcG2tPgc+6WBynHNOH4K/QitHneqIlcJB8Y7d2VCbxXCTd5bAz7m
X-Gm-Gg: AYBFou2bobHVhzHepAzmXD6q63WlJlwXGmsG9CT5lOFF3cIo+5MuO2jlNmAvPQx7a3e
	utG1/51YIM2kUV7F+5LAGpe6PSmGtFo+5sHReU0xKroYx5Zn9V4gN/TCGrmyQ/SWUJXvarl8Slu
	g7/VbezxsiERVLLRTVHVZ1MN1SrB9/69i5FmkZ0t6b6jh8ckSNi0kNpwuAG8nxSBI9OONqtd4pG
	27c5O+RxM/XdAqMIJlu/1QvaweHoPZxMV/NQLNdsaINckN12apo61n7CC9eCMHzU8kOWTDg9idZ
	uuk9YSzN61feAKVAD9lg3tQrE2mJJw+0kqPx/qOQLK6OzhH7ztphkbVVMWPL+LlV9LALfPBZVWB
	pg/v+wXkXpTuVmZ9rMGKvJVtDGKHuJN7nOgakoTyt7X19uoIedQ==
X-Received: by 2002:a05:6a20:3c8d:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3e7af8001f7mr11738549637.9.1793114907765;
        Tue, 27 Oct 2026 08:28:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c8d:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3e7af8001f7mr11738530637.9.1793114907312;
        Tue, 27 Oct 2026 08:28:27 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cf9489sm182649b3a.39.2026.10.27.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:26 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/msm: Cleanup if pages_to_sg() fails
Date: Tue, 27 Oct 2026 08:28:15 -0700
Message-ID: <20261027152821.51144-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX4aN0eAEYa5hH
 qE1FSbAtcSug4X6V2dvpVSwdsACuxlfHWJyLN25FOrCySywq3h0ObSHV108+CpREP5QX//38XWB
 qxOq5oWM/wCUCph+ymlDFGZ6+Ly9a/je+oMRyiegPx+2koaO2JyIaguRBuF5un0jGr3l/Ep11Nc
 SDjMCEFbWmCX0qw5UYhbikStGojIXBa5GWkqRX9M/jd1gIxYGbYavZ/ULocYPFMeJmGc39GTIi6
 K7Ye0JoRpjvc7cg7XhLvigZ+jIeT0Rh/GkaqceemafPz0lC7f3sQdUAfizKAMnEvJvykFIWsDpx
 CS7BU3GcCv9Cxmus4onDqCUhPIaUC0eQ5r/dAPjghwMqwjARUVpgbp5VN9Nn0wTFn7pl0aq3Zst
 ud+bX9FdROGjeNnX2kiGMEvsQpsWSPtHYJLNT6yETgG4Ui8hNXqVUtVxqZODxj264DTrv7E75hT
 E1zxTq+GveQpP99zDXQ==
X-Proofpoint-GUID: 4b3BAQYV_N82REi4z9GYfS10B9n3V3QD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX+EXI0yFsniOL
 YATa1uzboJRvzPx1SYDNXMQE5QGKDO3+Tbp8EMSZ2J3OZnNhoWJnPD8I6LvQ8f3Qsxgey59XrQa
 tUXe/SGyA3FaCsuzDLqXTvUMeA3jUx0=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0c31c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aq7xQ8hs3DLR8BDoFBQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4b3BAQYV_N82REi4z9GYfS10B9n3V3QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

We never really handled this.  But in practice mapping to smmu would
have failed without an sgt, which would have been pretty obvious.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
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
2.56.0

