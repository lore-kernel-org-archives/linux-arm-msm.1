Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395197;
	b=IMGe/TXFw0tXrMKLIAznk1q5e9dfIaCVzDdNt1QYRUnf3ok9mMrATp4RRZKn0jvtqdgJ
	 4VuyXH+SO3j7hT2bFXge5A0ahh2QBjcVzpY5pLRwU7iOBVTm5g/oGoH9g2ZJcSz6KBOWQ
	 2ZQJwun9dVHEM4KTXePrBs49/4gbyrDsRx7cqy85PPA4dqQVBPL9d/8KYRPOlZOZwQF6y
	 ezAd1g/E6YLL1Qp1wq4/mJbGgbIUqg/FQ3gdogbtvBfOdWInk/E8sq0VA1zeF3VaCRb0i
	 W1ppiOcN0mv0PAgykUPWYC+nHpdQuB2G0d6qa9+FFLvGTezc1XcwUiaPoCWDROjIoog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
	b=sqCfD1BhwLNpARvx/1SCWwJHwXhzpy/T+j5FIxJahvVL4lUMydjEtBK4f4AXISTZyZd4
	 Mbht8KBmq2BIlKudJ8PygG4zESwrnzsaBW+HrilPTM2UzBgFg6ADuVq8SCb0O4rkSnzvH
	 /LslNWjy5IYCymLsdJDrLayxsL4ld1AKSzcxf0oUrYdbCONVmqBo7IvUXsk4LnvCIKp5p
	 uGdyjCA+X8gWiRvdLlarUy9FUtk4rZl33V1w+RLdqdRHw8pJ7LygN/GzxETs76ZT96Ay2
	 tvxsRjsB5jwC3CXReJUb0z7N3g/S0s3RSQMpcpl8Lg7uCzQijftFofZ8cU7TKW0GTYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kHePRQzT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C2xkWlOk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916AB60A5BD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916AB60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kHePRQzT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C2xkWlOk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAW1R3473033
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y/GyDAzpwZI
	mWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=; b=kHePRQzTFqk8wzeqqTO5gwSq388
	17kiUznM/dIB9i6P2K/lKZxWNNyvdlc+wY3NfoVgSZVBHAO1XII2KBGGSqbhNzWj
	UVsSpB06hUhzPpO8Se4h7uC9dc+y/wBAV7mt2bd5SCtLTwRBEU93iWtqWX7hsjCV
	b/M5C1dt0/U6YF7kfnoVsx/z0XYDB73ZCH+g+GY0KMGeh8Fb6nj0ZlXyxkMBJvAv
	c5xzEDWBMAn3kbL7y5B7ZKcqjLxAhDGYzoywkeISgmeQl/idblnJV/9pQOc5C7vp
	epWGu9YVOgXa75KOovCLaKgK7QzU6o9DKjhRLpKaJPsGGNKxpzJ5vxUogqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g0s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso18290345ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395195; x=1793999995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=C2xkWlOkgGLP6II5tFhA1t1EliYBeX52wm8r5Bg5MoPN3ZkT+BdMgeBK56Y3R41WVv
         9Ck1M/q9Z13abc0qDfpc6VGJ/0Jx/r3K6N/CNcqFtjzytzH5MDdbpSMWqTcNnA1otKa1
         RnYHn/BIL+n8YY63RQTPnmAy2lAUGDCY9sBTYIiBv3oDoylD0z5vdCtv8DROG2i94sxx
         y30Nwx2k6PthDTRP9bN+d84KiyMtO9w1DFp4+xkbtzCcKNpC6Xw810n1Or2a0za2GS7R
         rIAE85u/NSmv68SpYSNdJGHjfmLomrGXIfrmQp3zMQlM6A6MoY/BfX1LMt0hsCF5iQgW
         Tqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395195; x=1793999995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=IXPm2SEb/ZBuw9U3nLEthPOhf6mnxEfP1t+QWziakM6Un+BGt2PNo71T2+Lp/wWL49
         S2bsDv4btOINCXiBEjpHz386vtL8jIriFQ310j73L330QO5z13YO5C006c8aDDjEYyy2
         b9ywZxpiK/dm+VyuSgkMKaEZE02Faqnju85mHM/e0owggrzHF8flQrE/QyAIgGeSCf6q
         0h5Ecr3j0TjPqmFKvfreGvXoQJer8M5BkBvhjOyL/0Ejw8aoCMwqsUu7DWrygFNGilkg
         us3V5TA1RHY2X3ttVqMrB/eJiNVidPGEzYOCknPRRTAuOvJAMx0zD1BjVimgO/jsN2Vh
         TEKw==
X-Gm-Message-State: AFq9FYKLe6Mj+ThnEjsO94draIoqr9F7poaBYSqHyTMyU9aiVS9NUPah
	hAMASDeZ1S538hcsIL+Ggxsr3T/G56iAvdQXQx2yu1QK/DMK7T2nNcmBGK+yXgeAG0UZWspM9XD
	wzrJaeoFUkZyVQlzO2KkQnawt146JFrhEkQilSW27YxXe1kF53uQfjuX9qbTvdFAnSRDPw5riB0
	fY
X-Gm-Gg: AYBFou2odJZKuf7W+TBo77r7yaehUY6qnDTLJNOjyXQFZ5EbwDpL8th9/I+sj8egw/n
	M2PbJ/4FA+DsH2EEGq2e9MZ1WRQfXkcFkkC5qxx6pJ11IhKNUqkfgFzs4eQsIstNUWfoVjB+gr5
	f5jkK28dYkxQSkwam3b/OTdWjEU6wTJIgpzmGbgx1Hy6LoNSE38IAu0ozzY/DnToQHOMkOzowIR
	hLg8ttmz8QXMa1KCVXgSwrxWn6qky26NMbuddIliqVQEZ3XnkRf0XM9JFzy767OfFBaIo+gBJ1Z
	+KEGhg19N9kMq2Utv16U/qbhpLL34k2g/zaCJM5RwyEkeHUFkpuugAmwncBEcu+Mbu98PG9XWCh
	2QbCGkJIZPR79yHfxkS6J8QjeKYE56fTvgBNR4c/9//RToy4ULzg7PqmF3hLeXU+La8jBTkWi5W
	IClIX+bm3qIlYqOs23F6ogrKg=
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2465110a91.37.1793395195202;
        Fri, 30 Oct 2026 14:19:55 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2465097a91.37.1793395194778;
        Fri, 30 Oct 2026 14:19:54 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845d5e62sm5619069a91.13.2026.10.30.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/19] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Fri, 30 Oct 2026 14:18:13 -0700
Message-ID: <20261030211928.45761-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX6Kd3ib2lCLqx
 5T0FYvObkauB9+cFxzqVb/KyWpherONM/XaGeKRhJPilYS7x9RU3fvoFVLjgIBNn4+UlFzZ62nR
 sCQW55IerIvEbX2m0svYh2bDyNlIK2UTL1UbJ0YWTMaBG5t1SonEAlj7maWUW1VlT39dWwumtWy
 719A1HMSDqOVwp++guV7kKkjtJslmKKZ4tV2nVAINxoF7DA/L89GZahy9JwbRmgRhtLASIiARl3
 0HeOVJRRWyrU8+yRhj4HRUdkz5a/pGpWb78xD61XDXVchFAPgxp4Y3f2BebHhTFs4jUqTDoWYxB
 /3e+4DOtDorbo7BoLJzoHPWJYH/W9FtFh2BqucqGpXojHimt1ELe6ogeEPtPHgzgsRMt8t0+Kxc
 NX5+LZ4LypagQBdrbyERBwRw7PkyUDHN/7eHTkRow8WkAHtpCBCW4JiTPBi6TjAb7eyzn/Aat8H
 GYT2D6RJdyA5D9AQ0FA==
X-Proofpoint-ORIG-GUID: iXTaTnZVwoAMWE6vNln6Wd0Q7zZ3Kyi5
X-Proofpoint-GUID: iXTaTnZVwoAMWE6vNln6Wd0Q7zZ3Kyi5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX9bv5PZLDPBOP
 Vto7wpnvtfREZrLa2/e3Pqd96P/MVYirqSzluCXyVqhsCbBVKeF8zB5LtltwwcI9q+puM4arSFL
 ZxY3lGXoInF6FHFK+z6+M4Q/LMV2VUo=
X-Authority-Analysis: v=2.4 cv=Arx7T+9P c=1 sm=1 tr=0 ts=6ae509fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..b0ddc02f67b5 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	struct drm_device *dev = inode->i_private;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_show_priv *show_priv;
 	int ret;
 
 	if (!gpu || !gpu->funcs->gpu_state_get)
 		return -ENODEV;
 
-	show_priv = kmalloc_obj(*show_priv);
+	struct msm_gpu_show_priv *show_priv __free(kfree)
+		= kmalloc_obj(*show_priv);
 	if (!show_priv)
 		return -ENOMEM;
 
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		goto free_priv;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_hw_init(gpu);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
-	pm_runtime_put_sync(&gpu->pdev->dev);
-
-	mutex_unlock(&gpu->lock);
+	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
+			msm_gpu_hw_init(gpu);
+			show_priv->state = gpu->funcs->gpu_state_get(gpu);
+		}
+	}
 
 	if (IS_ERR(show_priv->state)) {
-		ret = PTR_ERR(show_priv->state);
-		goto free_priv;
+		return PTR_ERR(show_priv->state);
 	}
 
 	show_priv->dev = dev;
 
 	ret = single_open(file, msm_gpu_show, show_priv);
 	if (ret)
-		goto free_priv;
+		return ret;
 
-	return 0;
+	retain_and_null_ptr(show_priv);
 
-free_priv:
-	kfree(show_priv);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations msm_gpu_fops = {
-- 
2.56.0

