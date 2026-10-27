Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142314;
	b=df5mNJIea3H/A84QiEAxVjCn9eejH2uDuee3fYfA15FZJbRDQZODnxnJ2ZvwwVygSvgz
	 9rDKzKp6/zqrnFfFWDwykG5ICP8Z29q5nqoKeICmr3NgxZonVy4eFxB6D+vCbIMToylof
	 wj7fin0gx4nlUXBCQS3Ve/7Uj/JdqGqL9DxhbmU1Zki82VqH2DVKFr4cg+4mXLqic3pF7
	 wfiFQZjrRzFktuACcDi7++2PaSig+AqoUzd4osrwq0YbFDfs+PSL732d8GoUnW1EhR/oR
	 Uin/mmKrAQ/magipTurjpjMZ+ooDhZVnpDIqmk4bCec49NZF/fK9L7Z5RqMyUyK/LQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
	b=uQDSMMOSTMzw+ac18bZJ43GlLeWGVhnzQX9cAUepN0O4Y5qfFvbkUReSSmYKeCB80WsG
	 +ecJvaWaBtOis7Qv1KsoJRTkWTMYTkpL9t+3KTuS7K2UcBfcm7dgUfBTeAhLpUt9eFuLz
	 X2W9vGsAKdBvZTln8gglN7ZcDAQjhc+Nf8aD8GkTIIqALs+KlMOGGOJaZRs1d8PWrZ5sC
	 SZ3MYjfbB04+pNo11qMUZAcajhj4RkBN/MlU3Bf6DrxN9LQcE7CtssDLY5y8YG4OumU6u
	 Fnc5kutwZkLe+7utHN1nIaZyr29vQXubgk0m/Z19knT/5RSjstna4Lnd3ZUzATuTCOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g84j1q7U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgQ8txDr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC403606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC403606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g84j1q7U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgQ8txDr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKt1J63297328
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQvi+0f2Rse
	41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=; b=g84j1q7UbFXHHUG11BRHlyQpkns
	7og453rDFUjZdav6DgbeW6bCmx35YK424PKxMKoYGuPWWr/YdG7UixYLG7rKCybU
	TdxqzkEYPi0t8ypbtQ2pHocr0wrmuW6HNjLUtZTKWbGA9xi1OJTOzdK1YlZTLP5w
	brJLuKlyVO9MJcNN3IFWfPp9bOfuC6sEbUKdXYjLIz1kIVjGfNYncSWNrU8jYTJe
	PibJA4iFu7xaCkJk7zaz0D4AAo3DA6cJ+INAufqM2YzwSpZvcxrklVp71dVYUm2Z
	eADnFNFWUFt+g4S6ZDaVXGbiwPCM6qsYxHK8qilArhuqQj1i5EqjwwBt3mw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy671hfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso150958b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142312; x=1793747112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=KgQ8txDrS/E6dMn58ouaFRjHFLwNgVdXuAOy5O5bbJ6EgweE60WndRNQPRvoPO5dB3
         RHvn6BpJJFGREq8iLRpOauQkm2TyBnJA9c3SFnljvklz/lwZqGc84DlN0nKnwQ6blYFK
         RiORpMwsfAN0mAxpEIxI7zPJD1RN11o/LQbuUevOJNB6BpKe0jeAKwDt5SSXhYsZrkiJ
         n9VtuJE/tUDteQ6BdgazOciuxvLkIlE6xPhE5Ui7JeekoT6mm6YDI1pQCFsTIOKzvS1o
         5/nLDMlnP1+klDyHPZ2eYJYGGcobImt8r64oTZTQ28VLD4aidEqH3/qAhUWv3XJ92dKw
         MS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142312; x=1793747112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=bVT+6XnxPEjLhykyKdOnGKiy3PUjBGavWBrowEvy+zjM+RJWpGoRxDZwCVkbMEIFSz
         LhBnsKpf/OfA0a6NbbI7hFaDlxprPbkw/K/Yb3xMHi1asp3ooczAkBY+H/FtS/rmuwoS
         J9EJlmVTyma+m7rQC7YKGEH6saT4P4AbyY/jWjvY+Oy0o4d/K0X7SfeRFh6C8VSUEjMm
         I/KET7qak/MxQHkD3IK6+9NI0U2FoEOrwQwWxL0fWveb+ULpdw5JEp4OpN7cB/gCkbuW
         hctZO9OY8IC2fzz44vZJ9ci4geAaw/wzG/QDqaPHIfCAbvZGIIHYxLdOWUnRv9ACMlZk
         hVPw==
X-Gm-Message-State: AFq9FYIUH1oIHzzBynf/ciJLGJL8G+YMtQ56iN5ru6EtxVN0X7FGWE6y
	62axSgQw+WXXnVrvoL3v3Za2N7PHoohYavAbRv+4EtQxzdV+30GvNiVo+GG4hUto0rkHKYN3IqN
	udyTshmyfZLNNUib5t5B8bePus9e9Y/ca1q1AxLmae8EicYXM8ciT0QXoP6ECEXrRkziFqiXN9i
	X9
X-Gm-Gg: AYBFou1uXc5F/eEO9YZnc8l04yjRT4bA0c/Dc0lKtbi7BZ3cmueLxDaWKu0gQcQqb3q
	dHzcQfK3WZiPQ0oIiwmA81p3CkGw0flE2TaKsboqTLdM1rcm8r6A14c5SkGsha83E2vGQ9gdwJ1
	7lwvo4dJjKSVCWdg8/lzczsyBwPaKkRWjPlI2QcwKy9De4ZlOtgwQ0dW50w9nXiUA5vjW5RjBu7
	NLPNeHOjWs5cne2En7Z/6fD1GLJsL/V9KbMLG7kveF6YF81rEnK2EEcVgeZSjGf/yR8SOj/qcVm
	FOgAoZTKr4XNPNZoN1vuOglcgEoWZUl1+vfYmTfUredLQWwjMS0vMLXyZydu5ZWruTBtCaLsha5
	fZiwcLkqbgmALy+1ZIDTnqfGphd74ysVr1zJO8jt/BvNtgP2I
X-Received: by 2002:a05:6a00:2302:b0:89c:967a:a74a with SMTP id d2e1a72fcca58-8a6e6ff32admr458750b3a.22.1793142311722;
        Tue, 27 Oct 2026 16:05:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2302:b0:89c:967a:a74a with SMTP id d2e1a72fcca58-8a6e6ff32admr458726b3a.22.1793142311228;
        Tue, 27 Oct 2026 16:05:11 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm187198b3a.20.2026.10.27.16.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:10 -0700 (PDT)
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
Subject: [PATCH v3 1/6] drm/msm: Cleanup if pages_to_sg() fails
Date: Tue, 27 Oct 2026 16:04:44 -0700
Message-ID: <20261027230452.130031-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: GddDU7abECdkLy6NGkUCmMXeFEnInZ0N
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae12e28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aq7xQ8hs3DLR8BDoFBQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfXxYHkUHaAn6Zq
 NANRdzWIVyzvo1UV2Nb2AZla3bDFRM4OxpeXBTC4RSpBgUWiceZQ8RVwAN3/0ys++D2Q05SmcD5
 wWdKAJ8rWdSVr5k90kskq5pTXqaSVBk=
X-Proofpoint-GUID: GddDU7abECdkLy6NGkUCmMXeFEnInZ0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9n3OuFhRDxpD
 34FA3ZjtX62GWomKxywdCzfJIYOIQ16K/8KO65jJ/FZ4HgVooH4+nItOSspsJiYRg5UpQONRnye
 YKFsiXfOFPhkhxzUAt9wpT66L6zgSTvjzqcSNfx5a79jlxZ9mhkIFNMv/gR7GkYUZPzdjGw413K
 TnWyAt/kwXZmCXP5PIdk43pd3jOs5KZw/kEcZyMVU17p26lQgBe6tUDZ5e4Vp+dCyZJQy90xe5Z
 PoF67rYmo8hg2HUYhX8I2aqbm8ITbrbJLETdD8D2aQJo7C+2pyJ6VlWKVFzfANsv4c8ZV7FtEUb
 rLBw4vJn1lt4DkQbPRZx6dz8UTNeKsTaAy+JVPAXYojUqWIaCWavl1f7s/iSd/cNPr+qUBfYjni
 kDbFg48HO3nH903ONwVgN7fAMHESJm8jSvif9lOlHZZpbDY9oE6y2KUnhHbzCv9fr+6BTw2lmLq
 fgBASWV832wPAHCPCbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

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

