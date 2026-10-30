Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395980;
	b=hXsHZKBs5FE1TaoWJgmto+sU3zjLoyGflUYodBE4dpHTtGXTnQB9TB1+YEsmER3nRLjW
	 BAYwTfOs31WdY5O8XSsO+MF1RyLj8w8DbWbDufyCPebxO2QRpK6I3appMNosLnEPsFF9P
	 PiHj+QR+uFwUVHMaN8BfVKTH87xICxVDr725x6jDEQ9PBF3H7767Q5kelLQj5ueGZFn8C
	 z6DMZOeOiF5l/s7evTGmYgPLsDoJKnRmb/MBnhkASjWl1MZznDZ8W9CJaaBTxU2t7InMt
	 d1xSLAI9YEZ3MUMZ5wEEg1tFBZktBJlDctC4LjmImgYKnuYki6tDt+GJzvpqOq9N+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
	b=YgqVKKKJKZQLw5YKUrko7QTwqTaySyqVd7YLmv/P/srMVqqh3FBwmqJE7wTGMql2Zzjc
	 AfDtMZe9xJrT9XkoNt0E6W/UlA0h74H87yjRrsJbHlNMLxdXKCG2fRhM/CuIMlH/UjG/f
	 YzDGzhSLt0AKprvXjnYEZgaCQJAJaAS5q8WpWFugCqH8yK0xOR+MnCSPd1ecthP+HtWIR
	 k0riR4tpHlDNqa1+O16ABfIgojYrJ7f2fZ6pXgx12CJ6qa9L3m0x62RIQzkNITia2TSd2
	 E7/JBhgqn2OiiLmKMLr87JiScewhf6jOQXT2P41nPg2fVwSVfL9616iRL86xifssu5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IxC4vahc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuQ4aVre;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFE606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FAFE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IxC4vahc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuQ4aVre
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAh6E823571
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQvi+0f2Rse
	41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=; b=IxC4vahcMc1L4AZO7S3CcxoXxW6
	w03rEhRkHQDVMCIWd8IjeDnGhXzbKxisVIAYHxt24jJrcKfjIrXcDiIYdopBWaWW
	GEGjEQP2dE2hxmv58aqRtTLvzBeQ/vi5IADI/qlYDiMo4MwEMGXlgamqwplC3NHs
	AsDbsm9E+SOxvoE1mM3z55PPL831DSLxvJHrhhg22Xe63muxVXn7pnwLvJYDs6x/
	oz3fHcNyEoY3dEu203E/J6Bjr4db11DhNB3nEeddTZ2YS8YgHA5I/jRbCYFtmJ32
	2t0+O2uzjUjpBskfJxX4B8+kd/bWOIW4hphcSi9Zfc0DGkgr3Iz0TVL8hRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0849j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:32:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so957904a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395978; x=1794000778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=TuQ4aVrePKgexyXf6rRKfng8OEXK0TYscIiyx5YMVDnU9Ix1RSB+p94Y003IBgoGSt
         efvxAJgqXvOil/i4DvE7omwvARdJ8DkHcNXeNjsZIdYRpHCi+G/h89ZqSnWJexY4XVi5
         Wk9bxjxv4fMycWbU0ToTXB4FP95wL7vPscc9ikr8SS0CG56JgOiBm34Kc2E9MrFt4TZv
         sL9n/7/2WbU550Yp8m+5OKAWYt5Bok3nmKv9HWYw9dqfSioTDf8X/tEoMJdNyZynyrS9
         ZyYLfjYw0SGkECSf1SD1jbSWzQWtc4GvmFqxh4miU6Q/yPa8XPY4gZnFNUkeZN5WxaT7
         sztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395978; x=1794000778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=oc9TSA3ohX9b5ogST1U00EMzFz9ouoKG8/lTS/z4ImNU/mnf051Qyfb8edWObhCbdE
         VIzrpHR4FS8hDOVGSpm0Wp44BCD0cMQSJ9iT9HVFnyhrVAhS6ehoK7UM6+choG3HwdQJ
         MIxARhK1HzIeISevWN8KNbwYVrLEWzN/+5lJkIq5e6my4ecqZpN0JFeR+QjFYRhFcx8r
         AfGoIgSdU2yTOVOKCItpCHmmOlMm/oYJHjxO0mPtNkAHL8wAGeDCmO+wE7XwK9N6jlg6
         KHXnErSyNlaVx2xTv/U3/jBliAR8weq/s2uuYvdbWz+eXR7v+0eCixZ+93QCrIdqul0D
         aTqg==
X-Gm-Message-State: AFq9FYK/lvHEN2e5ixzifR4rQDVQ9DNjxiFtlkwKVVBxfQdqtxu5ZiIm
	RPY9PboFNlujiBfNlLYybHyk2cuJYdBQQd0qfaXCtlm8SQdkB1X1/w/m/NSX+FrK7I1buuSc6a0
	Hi20V87NfKYwR5Ts+NKG93Omo8tsDRB/x0oZN25F2/UwzvohKMbJnFuLVmxSgckOQvdea
X-Gm-Gg: AYBFou3MICLQqpecYFwl7N+kV1L1Glu7sl5aDRq9IqSaOWY+WSGnfswVl/xLDMfOL9x
	NHljJPVtkD0m4XzAiVAxvbBG/pLZqD9K3I3Y1ETghSNfde2hHiJYScbW+QHj7RI1e2JyUQVQ9LV
	WudAAoIFss4XUsyd2ZBG+W2UIGSkIdIz9BlJG2lgyAT1nCfArjvGGn9luyO5hNOwxvc4gBdOfcF
	NkOoHBk0EV08iyfkQ/Vbe/LEDDh0jJ+BKuMtik1KUbQCmsXoJpkAhWPon3NC5mOO4diwj/TldG7
	RjIXxgtrOTmWF5mbNmbYHiPGI9ClPBxMHvjDBnE3p5LykklL3jfOYxudK/3mmY4pHQZUbDflEpw
	8sY6YIKteMibvp03+k3EED7vewYvPcRCehSKG13slwRdlOUEodGDqUVG36KyVuUtL00HQdsJi82
	jmTx4orL16uQok/GJDuyFA7HM=
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr1556479a91.9.1793395978096;
        Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr1556460a91.9.1793395977628;
        Fri, 30 Oct 2026 14:32:57 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm5339033a91.14.2026.10.30.14.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:57 -0700 (PDT)
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
Subject: [PATCH v4 1/6] drm/msm: Cleanup if pages_to_sg() fails
Date: Fri, 30 Oct 2026 14:32:43 -0700
Message-ID: <20261030213251.55365-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: oqX8-wBP8qvsjbSmGDmK344vahROqOoP
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae50d0b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aq7xQ8hs3DLR8BDoFBQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX7eWtCOdb0QTh
 5YkQSaq3U1OCli/8hToVLkj2ucLm0doFluolhaIw95Yb1gVNNiAJ4hcpZqui6LxPCq7nMpFsbeT
 4DHBE+8g3sh8bnniDcsh9YnGo/hIi6CaWM/hfu2FJAJM0b30Jn/2hosRcSE3Q+7Q9JqTEfi4TQG
 TJEd54d6/BpTyFV3Dt8Ni0ViIxZ2+y/0s42nBrHcZd4NexY0iohvJCSxMvTXf6I2AWDudFMlgyt
 3NykX76xcehvUdCMtBaWsdX+/DP3Cz0J5yPY8wzLkICNUn7eF555zTwStWQsLV/cFuiYCk9ZKsD
 ilVhHLDMrRmSUcT6/2dkYffEGYDOZCs/o+v9T8abgEG1BwRHArcq76oVG3ytVkSpLicngDtvazC
 3r+4KAiiG0LevZFQA2a4TUqbfoC6/OcdB2Og7lHFscbt8lc5I0X+mX+gtrqmsIiOmsWcbYfNDAW
 uDv+S5q0D+vx1BSssFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX4dfPQPYklZzx
 gzsoZh/T2HK1M4rZnM9NYt+TtCYm5fygKvvgvdH2qHQ90ooixtT1jJ2kW82hJF2xmb6Xwwq6zK4
 Sk2E8oMV25hjr91jBjvD21+Wt9GJ5ec=
X-Proofpoint-ORIG-GUID: oqX8-wBP8qvsjbSmGDmK344vahROqOoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

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

