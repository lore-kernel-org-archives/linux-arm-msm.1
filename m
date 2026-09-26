Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C85397332
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447526; cv=none; b=Th4QevtI2wvWCWOPrWo2PP3SkLeF3r+Lfgwn+1OajjxyZ8jJMZJy3SvrxwpplU51s0Z3hUY1PoO0NYtJxUYKffRlqc/6y+gyjlsRb06mMs5uQLpQtW79tV/nXwgjzkRXTD9hVUWeDfQOmpV5/hFhhOmCENm9o9mtxsGTC62dKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447526; c=relaxed/simple;
	bh=apgf8vIWTkwBl/+0WMf8Eoc00UQokqsqAOnW9G/KdIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJOwErxodLf6fXKxvypvGy+jGbtPOjrH/aEjauW/rG/xuOBXjpEOptVuvtIp4gF3XvcA+DsittPT/m+qafYWsRbEiCKVfW/38VwzdJRKZ6k165iYMKgzMzQA4rnHcw5TxLpRFUayNuwM1z7ZA7j008tBdat+v1icu0rRsYmeaXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQXusu/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9nKNqt9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQXusu/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9nKNqt9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QH01im245998
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zk3EFZth1oJ
	/gVFkRmzbBP0BnUbUUlEChymi6rBEiHw=; b=lQXusu/GJwD5OG/M8IwZrtRKLXP
	7CpNTJfQtYJ0uNldqoOUBanEgRO3r0EsrY0Il44hvlgCaJgYdn8R6Obqn5pQgL2q
	XT4Zm9OjJs6tRZpieL/qG3Yev2qwFeovQafyvvGktpBsF1Mtrcbe/CVeQIxqY+/M
	0x8dgKhf/v8d15hP75wc7cDA0A3tbSFtDVELAjVC4D7WA9W16notzwJ1ToTPkAUb
	Fw/9jmoaf89m/2BxdJxKm5sXfThflzVEmtJbA6ny2D1yCt95LAwvMqrmAE1SerFj
	kTOpUy7Ib1nTNX1jfKDW2rMbTh9Q5PSlWzTeyk0SPDJmRbuqRo1KXWN78HQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp1tpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so18845255ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447518; x=1791052318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zk3EFZth1oJ/gVFkRmzbBP0BnUbUUlEChymi6rBEiHw=;
        b=F9nKNqt9xpTvvqNlOUz9DSPqMNu0VfxJ+H5lWKlUtH1twmUrt+snBn/S3DCs+ert7B
         2CQlyWB1F2t0zSXR8dVa0eShUawPP4f+pX6DdohG3g/IcWQ/XSatS4QzRfwRlNT64rai
         PmOK3LmdKqxsbpuU0PMBI9zbINBxXgk8AxvBNJz9PzBqvEpPWdBjZ9kgyWbaHXHOYf/9
         5TYfFKQ89os4lOcbXn3AlSMefj9jBzvuC4pi6iGs37iHpRSzHDPOkxaxxJZrQ3up7Kl3
         ANADB1M24cp6c/Y+y17ZdUWCw2fLxDZAytK/VR2pQRKg/2Frnv7zv7tL0O4c7su7Zo3i
         yZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447518; x=1791052318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zk3EFZth1oJ/gVFkRmzbBP0BnUbUUlEChymi6rBEiHw=;
        b=XVwVSE6BuKkuRi2mGRy6jpf+CMh+UnzbwIClv4ZqRB1axuC4KZByYtRVIUdiUA3yQw
         zDsPwVPJpETGhvDu5qCXP0WzOmQbS+nYO7G5yljGrYISqyqBcBXvcxDm5aaDqm1LWQi3
         xGHX4DTKIcFW3AwQchQwDULhUA0seceYYjc8yu7tIlaZ1/SrCUjDIdOAPv58odpzbK29
         oKcWU20vptxUKY1TeuGaF8PkILwP3d9GOlySobS3rb8ohS2WqZ74hQm0GNWj1PiwU4ZS
         aEjG1WKrDAQXT6/+EK3Pdm9/ICxpZPDRO/BXBjgWAZ4bCoFWNGilki64KmDKKwBdOAZI
         zgBQ==
X-Gm-Message-State: AFq9FYJXpFy58ZU40jTjxmDYHacjEtp62xnKjKHsJwzBzBGBW8eGJw5M
	WKY9R0tGlwlbzje5H9+Y96xSHbp1HDHhSi/WdH5cuQWiDkTB095gOD0hakZ0WjV7Olgiqsb2MVV
	bkkVVVIq3lPtTpQXX3CDARmRsGi5hX0Sqn7LNkang8fGp4rNn0YhCexKqFsE9DRt3a/sJ
X-Gm-Gg: AYBFou37zaJyZIdzg1G/aS1HaVBZ5ShW0pqv18yUFo0DfTdbQcLJxTnhjK2i9osMsYp
	lMG+N8Z4F3XQa8EBR9gVYJLBt1YlQDOnkEzmnJ7My/jhgEZm3zNsAw5qdoE0TJhYwGLnq/Bb1z5
	vRk1a+Q4cHr7B/fvwQgF+o7O4n32dheX2TXohSUGVW58OFNP1F4aJPHfWbGjnfRO66iY5wHRxp8
	ouri4Jud2BQUEKsDy5H6y80kF0tdEaEgv3q2eTT1vSqQNvkcbLI4onRgqmso4BVKaQNMnYHJyc3
	gPOts62oekFjmadCuYWcBRDhoKdbyQVyy0+VbViQOmkHn38Q4fDYZsmP8XNML2woeCJS5SZxC4P
	0VMScJpORSWi+5z43AyM9HrIrvULD3fBLN9nQNWZQ74H95Q==
X-Received: by 2002:a17:90b:2683:b0:3a0:dbe7:971b with SMTP id 98e67ed59e1d1-3a0dbe79bc2mr2071271a91.67.1790447517583;
        Sat, 26 Sep 2026 11:31:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2683:b0:3a0:dbe7:971b with SMTP id 98e67ed59e1d1-3a0dbe79bc2mr2071253a91.67.1790447517113;
        Sat, 26 Sep 2026 11:31:57 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm10921274a91.4.2026.09.26.11.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:56 -0700 (PDT)
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
Subject: [PATCH 5/6] drm/msm/gem: Stop calling get_pages() for imported dma-bufs
Date: Sat, 26 Sep 2026 11:30:45 -0700
Message-ID: <20260926183051.25754-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX6vQ0bL1gBxwQ
 fAaNgMHf74EH8JnQM+c5LqufWrRHAKoeRj2DumRmSSQicJSkRL7sr9ojLxVETrjrSZjIrCqUXdN
 xp3iIo/7M392s4mYHs3MUvzKHyTci5LyZw1f0cRz9AGWl8hu3zlOJWRkAsmScA78dPVF0afQtFI
 SH3laGoR4kqgOhh3IfFPdqr3wvHEOt1AKwfIbNjCNSF6Ix0jSju1JCPAl2DiAXsce7cdoS6Mx8q
 S+YDUYZqh8fMxp3el+Dzdp+F0fdpcjDNCFBz3801FotDcK0bQm8dZFQ2KfMKP9AeTielkofd8Y3
 yR8kevRHtQo7RVkd1VpUFW7zwq3EkxwVOnj/A+uPcFQxqJ8+QJucsMohhx6B6yH7pM9eOXSO2EX
 tfyB3gsw9AShBNUAbgKVWeCQzj07eRVXpdgqkxBqB3akwgFU1Dbx0HVmVuM8nh9mSVyISUrzX0Y
 JGCKHaOp4HXUG3JF5TQ==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab80f9e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JSwO_cxJ740gtz03fsq6S0RjK1End7sA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX1vmFfGeFGrH8
 CvuXtbLZShjJaqkGqGMtAJyUIdz8mtfmxWuupAGSPvvrnwJZSV8OCLuAPcyx0KVyk3W72BvcyDe
 jTEdCMPDrVFGCPRJ+OLRzRd4GVHB9fY=
X-Proofpoint-ORIG-GUID: JSwO_cxJ740gtz03fsq6S0RjK1End7sA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

Use msm_obj->sgt rather than msm_obj->pages to determine that a obj is
resident.  The sgt is populated up-front for imported dma-bufs, so we
will never go down the get_pages() path for imported objects.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 ++++++
 drivers/gpu/drm/msm/msm_gem.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2341f209adf5..3111d7389572 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -193,6 +193,9 @@ static struct page **get_pages(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(obj);
 
+	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
+		return ERR_PTR(-EINVAL);
+
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
@@ -286,6 +289,9 @@ int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv)
 	if (err)
 		return err;
 
+	if (is_resident(to_msm_bo(obj)))
+		return 0;
+
 	struct page **pages = get_pages(obj);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 4f681100ecb0..e92c6723d352 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -422,7 +422,7 @@ static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 /* Are backing pages/sgt allocated? */
 static inline bool is_resident(struct msm_gem_object *msm_obj)
 {
-	return !!msm_obj->pages;
+	return !!msm_obj->sgt;
 }
 
 void msm_gem_purge(struct drm_gem_object *obj);
-- 
2.55.0

