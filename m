Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C44E0B65
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955002; cv=none; b=SSnKGlM3djM5luzD075IkHtV4bbRV/6IrLh6pm/sEq5Nx94cao+N14RMTGVrv11WdkBwJjfZ1Dm/oBZk+1lfwoan5gPo87bdGEgbBW3E1I6xtiUjTYHs3XPhAeUvPGUvgrQPeG9ihIsM0PukCYKhRbWN9Iqmt8wGL49xqCnSS7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955002; c=relaxed/simple;
	bh=xevZIKXLSA/jlrAlWPNFb1iHsDDse9cohFxsI/blgVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7V/0OU+zx+l+DNJPJ3GRt7DBgwQxQ7IFq8bMzr3LMtuQmwSM7jDkYV8r6mSR5cGIloph5BYyiTQY97nXaIUv6eDHOYRTh+C42p+fcCc2ndT1DP0ssnwE4UoVCTQtFpxmjlV4k2+xBky7gdjnEmXfRyEQ0smSi+gth6R79ysonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSeE7o3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WD90YP/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSeE7o3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WD90YP/6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGtNI1865566
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	un/LUUkjqWr6dHZmnZCw8yVwZVLyrN70wo3B1EMvQCA=; b=dSeE7o3j0Ls6N8KD
	/K1QyYiGFAHIGPBFUy2HW7ZOzK9yE+br3UrogTeQIsKt6ov93RxBzz68ppf5nebE
	uHuYdBYSqMH7a1v/6SIZmgSa7HWwhVwx04x7rhdQlNWXzXrEVODipZqjAULYZifJ
	xS+8T3VemGMo4pZaRwRvy5ZCC8BKEe31ALpNJKSrcEQugr0vItzzHXOILZH/78OT
	lvqFMWALuSp7IBuno8PaFR0O24yd/LSVXDJIJm2yWGZ3y/ydPvKQ5FwiweGF1fNK
	DyiUGUUyNA2Z7/jUJscdwK9hJDsEOkuQz7SOU3dyuCgWwPmL2TRA+PG2ZgeqQlDk
	moGFBg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nftwcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:29:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so9171718a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954998; x=1791559798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=un/LUUkjqWr6dHZmnZCw8yVwZVLyrN70wo3B1EMvQCA=;
        b=WD90YP/6797gGPb05vbttW0dd0tQodzIxKtNUcjoJIGEmLupldwXizf/kjO31GN9bz
         HJ0Ntqo8VRjrIlhHjrlUigb8rmHGMmRR0QmkgiDWdwO1Ham64b+B0ey3DGF6vh7njaIa
         KovYVxtR+lgcWyZ6BfMQ0AIPTRIY5pffaYpwAuAgpAvt5gq5bbNE5aT0zi+r5EIjrwpk
         PXLwFSFE2o+VOa+EaMnPCaOw8vTKchMkENcPr+G86gfLzJCknOb68LkmgdKFL2iloStz
         +5y4QSFJnTo4kaLKDGMlXCVzYaoNzw8rW4qfxgAAtf339I3Dl5uECRutBF9v5vwLRjs+
         tm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954998; x=1791559798;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=un/LUUkjqWr6dHZmnZCw8yVwZVLyrN70wo3B1EMvQCA=;
        b=l4xdoCDOHf/XQAqMTWNfOBLQDYV6jEpKyULO6JlIyJ/ZhMMvt4cHp34c9Pcsg0uzYA
         CEfVYMSyl9cknklv+W1NFx0IXuh4I5/jGB8QVq2Bi425o13MbNuFuTD0CVn+VH5pvuXJ
         eGhmNoeI6VqzBasJsCKME/9hVhAUgyndwE8rGJDTQhIbVC5lKL1lidx+Un3k/yja+zCx
         S6p998zEXw04mx5LIV41OLcXGGcbDpinvHTKF5zgtp9/37/sJuLdg4opjVZ1Da4PASo8
         3UeL2ds0lJq/t+S+v3H+usMAJVGshUT0YYPmedsjhmZ+Yo12PwPRiU+hOF7nV6yDqHE8
         J3Hw==
X-Gm-Message-State: AFuF++minHkg1LT+vtO3Tqkk3L3kwFm3HpBT298pQVVMOCLMdsgjuBvE
	5RePlzbten351N7etGtOqFKMhk2yr4ZCYVRnG+wnTMNhxh6CyHvLUtIV/R9E9z/cScVpwP+ISK7
	ClDRkIwtmgTZMS+hhUWac6KFpI3hvQ+MV9YTe94SVIyA9vTulsMyS8e/2UtIGDrkWNPFb
X-Gm-Gg: AYBFou2E281O/83NlcCiE71qAT+88Y1dIYdvCU7T93grR66Vay9fI0IddjGG0GdWbvq
	0FijkaZhiOmZik6dNBSVv0jbwXC2x5BDJbsHKZBL2keKHzjeDYyEftDR0SSxGcLrNnIYeeVkTxQ
	eZovcr6OEZCzilN7iFxNctndShjBbpd8jvrlDMhsURjmQXbDZLiQ0wb07iWHDBUmFQVvWO+7zsc
	5lkWo1/Vs41Gc9QU2uYLG3uYFlsha1d7465+p3sPgzPPL5DrbAEhwoazzRRFcwPvYn9tkulH3tc
	s/gqzWb2A4mWl2riq53sZZM6WPLIPP/WprqdVlZAvy4em2Sogj9PAILKRQVF2jm8DYCLIgZbejx
	MhQZ8lBdYPvOGACGvdW6TYrzKzzjIaV7QYz5d1wSIxFcIS5E=
X-Received: by 2002:a05:6a20:5493:b0:3dd:a006:55a2 with SMTP id adf61e73a8af0-3e0bd01fbe0mr3757149637.48.1790954997674;
        Fri, 02 Oct 2026 08:29:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3dd:a006:55a2 with SMTP id adf61e73a8af0-3e0bd01fbe0mr3757115637.48.1790954997237;
        Fri, 02 Oct 2026 08:29:57 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0bfc3da9sm1093702b3a.25.2026.10.02.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:56 -0700 (PDT)
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
Subject: [PATCH v2 3/6] drm/msm/gem: Use get_pages() directly in vmap path
Date: Fri,  2 Oct 2026 08:29:40 -0700
Message-ID: <20261002152948.85308-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
References: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vOGtJBBkaC_RdQtv06GI2JBhAwTKWziv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXzAnKzw7vOtGr
 kG3sBs7a+cPagZmoZAV6YLEFJ/20E5a0tKWy1awPKjZhzvcR8GvukIV4oc2qq4RgO3RDtHVafr2
 ZEyyqcdsPei/AFtRyIXTJFl5WRJY2vc=
X-Proofpoint-ORIG-GUID: vOGtJBBkaC_RdQtv06GI2JBhAwTKWziv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX2qWTbjHhyeDQ
 GeiSthbzspeFVhUCwr/sEUgl3Me5d2dwEh5DjGPZIPYmRqdBcs3Nfh0NiytkADMmgDF0il9zSyD
 xsli9tosYVOoCG3fWyFcGxCsuXcbak9Qg0Wl8FCUfMQNhx4dQHJilCegrhkMs9KH0yqH0L3/QZQ
 k2pPeWZcih7e2bEhTIFYi4nIFcSAPIWYDkmKwTNrHa2WobcaZOtMMC0LEOGg2r6X3U6aZV4CSsn
 Xjxn3QQdVn53G9yMjXxalpW8OeI67d3lug0xyb1XBAPH2IzpknWWjziRoJ2oS6SN8gwHcTqqxMH
 8hkroNLKiurlKWubxCyE/Fa+QA0s4Sg4Dl/paLVc4Tr221Vg0IRj4ZJZ1yyEeLXf0MOSWu3NxAk
 WqELZpP9m6kLygyqsKbqu82aI/IBLlqR5Cr9O/tON8hw3MPS4A3EurinjfQNqFBTe5PgzSrIsyX
 /h4SZDBZcMXTO7bGCgw==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abfcdf6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=bRy0bLnbznpkn9JxEt0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

Split out a helper to check madv state, and inline what remains of
msm_gem_get_pages_locked() in get_vaddr().  The vmap path is already
disallowed on imported dma-bufs.  And the rest of the callers of
msm_gem_get_pages_locked() don't actually care about the pages, they
just want to know that the obj is resident.

This gets us one step closer to not actually caring about the page
array for imported dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c90336b3b231..bf6a8939af7c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -265,7 +265,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+static int check_madv_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
@@ -274,9 +274,17 @@ struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv
 	if (msm_obj->madv > madv) {
 		DRM_DEV_DEBUG_DRIVER(obj->dev->dev, "Invalid madv state: %u vs %u\n",
 				     msm_obj->madv, madv);
-		return ERR_PTR(-EBUSY);
+		return -EBUSY;
 	}
 
+	return 0;
+}
+
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+{
+	int err = check_madv_locked(obj, madv);
+	if (err)
+		return ERR_PTR(err);
 	return get_pages(obj);
 }
 
@@ -722,7 +730,11 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	if (drm_gem_is_imported(obj))
 		return ERR_PTR(-ENODEV);
 
-	pages = msm_gem_get_pages_locked(obj, madv);
+	int err = check_madv_locked(obj, madv);
+	if (err)
+		return ERR_PTR(err);
+
+	pages = get_pages(obj);
 	if (IS_ERR(pages))
 		return ERR_CAST(pages);
 
-- 
2.55.0

