Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3779047D444
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217314; cv=none; b=bRr4JmIZAKdWKudE4orjYIp4DB97huI/t6Aw4QtDgymqqY/lJM27XvVV1A9ItRLozo/3y1kPRAoCRlnbXEgnGocQl+J0cvGlXX3d1n/JCRriz7iaWceD1u+zBkPd/zqGLBQw7ERgLYHDxc47rzFMWbBzTcmH9LP5keK568dfCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217314; c=relaxed/simple;
	bh=B0Ov3Ba0etJAVBf0pjyCAO0OwkOHjmreEqnlFJFY7wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tec2N/EfyhLM/YDD96EcWuhUyePVPCy4QqQeY0XfIJqyjJDHYFZGPMemIhDEj1/wQxIJV1DSJhh06yKboH1Z7IEojSyai6kkpV94zxl1HxT0cAUIdK5Y0ezyHJxgcrkDu36YsqwhIyKGkBVSiJHNG9Jf4wsv1n9F1TIe/xf30iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odbHMnLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6Ye+FL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odbHMnLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6Ye+FL1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdZue2933565
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fom6VPNFv+zfCScGSH9gH/TJ+nxhdKVXDPLYwY2IORM=; b=odbHMnLBY1lHaDjq
	07RMtATDAqsWnH/VlLe/IUtSd0wJhtuxnTYaIe7ejwdvbvjrrVxZQj0Tli6jIV/g
	KIE721bOIYXo6AVUiE/PQ2Myj0n6YdY1rU4g1L2qwNkQs/go4cN53fvetRyHtHqR
	dHXnwj5J/DhIiycPo8gfhvSi8Cm1l+RK6tkw1h7ydlcNAda36QqNt944srzGGJ5e
	dt/sFP66rb8SiWhhOzgUTXIONo+L0US93ehDJceGVwo+iduC6SEz8JUqtmJp+rZq
	eZtD6Ih91YPTajkuNJ+deiPvejTkbm6N8lZLdYE6/hd/NcmChKaavTWuho2ilVup
	bWjtjg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d0y5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790332b4e0eso1329801137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217311; x=1789822111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fom6VPNFv+zfCScGSH9gH/TJ+nxhdKVXDPLYwY2IORM=;
        b=K6Ye+FL1QuO0Ah68qbVLwoZMpxQI0pzSsn72edUDfLoN5FgGtl/x//UR76itNWbwxz
         rLBhyajut1OZb7KfDoXh35fR3g8IdceDzg3J9e8XDy+g9BLbKScz4+IJIPUDRSlCR29j
         5hXqvKGb4EhWXmhLeoWGHz+fvGvfa6p+J78b7SdVUqcD6a4GC1HyMXmlyooAEcs0QDnv
         yZwlAAgQLq1FyiPN7iO3+cP4r3QRfjpwm4kdrnEHon1Y83HHoVR66IpkMhL3yUeaIKm/
         kmUAbIk8mkyXBivGgzN3HFN+ZHQfHQdN8+uxYAck5NlkiCpVNk0/jZ/IwjpOVEJodREt
         6pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217311; x=1789822111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fom6VPNFv+zfCScGSH9gH/TJ+nxhdKVXDPLYwY2IORM=;
        b=okkxXux/OPN1JdDg8dTTaN6RQm7IX+fKvJs4kMuVtczUYNpk7EOixtt1cCTrUQGpWL
         JHFJF2O4wNS2AwUh+6PmniFOCspc7lWyTyJY+JeAuwnbcVMqQkj86QJKZJSAOXZyNscB
         NVrCCsLCm7b2aO2itztrI4mQeAXemfpsXyYPujzExkuPATJH/h5laBg4K6z76XnJ2+6k
         lOMX9I++W1yNgLZvY3bZYqg2/IDKoPBpNLzbV4YHwpyAZqDXsHadfjHrfdXK4qH0eB3y
         qHef5AjjFaNedoquvSb2bACtsMaemk4wJWLhi6bIc9ufGjBat5eMfDj/YVhMRNsS9FKn
         A3Vw==
X-Gm-Message-State: AFuF++mZ9cZpUg/Sj0pE6sK/YZONE+nBGVizGcDH2sgi9zdwylaGxi15
	Jo4YlGz50kRufUC72NcnXU65Zb3+e11MjPVk2DzVv8eEF85BLgmQ/vFYGpp0gT4yRvq2xCmW3n4
	SDNrZ71iBZrbPpvBhC94oC5X6IBXwf963JbINW/Zmj4sbh0OQWpxTGKgH0SHaY1RpXRdq
X-Gm-Gg: AYBFou20keQQYeqxllb1nEINuM2fsbTXpfZTWqq7zCIP4JYmdMRme63mvkWVhOJgLc0
	Q2gs1j/IeQfizKT/T9PEjNynftmnC1a82bYuY2oRGm/1jVAtn9MNnLTSABuqhPvv3DH18BE11EG
	NVlytDe3hBiS8Do09x5vEaZU5Eq+/RGYvUkPrVZ4Yr83WS+sYrrBh+ZWtN7Ps2jgxuhrY7Z6vlJ
	8m+Gd+RqRygN6SkPkg5preDImjhRSWC3YN+lJmtXANNAsdhQhwtT3nmIkLf1t6uO8VmA40obhJy
	Mgao5bl9/pTuZI5DndAInyf6QxwdD630B3euGgQ24IFMhrmMGlr5HSxZOg7/j5hVIn9ZvSpi+6e
	rnG5yDyU3dla+x75Dn21j9lqK2B1d70Q6iItdZUBXxXWpSl9QB6cS/0mCWuFvsYBWCGFRnqbLGV
	6lksydLnlz3nft
X-Received: by 2002:a05:6102:524a:b0:794:d445:bc2b with SMTP id ada2fe7eead31-795abdea367mr1987703137.13.1789217311457;
        Sat, 12 Sep 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:6102:524a:b0:794:d445:bc2b with SMTP id ada2fe7eead31-795abdea367mr1987692137.13.1789217311052;
        Sat, 12 Sep 2026 05:48:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:23 +0300
Subject: [PATCH v3 3/8] drm/msm: unwind msm_drm_kms_init() on failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-3-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5509;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=B0Ov3Ba0etJAVBf0pjyCAO0OwkOHjmreEqnlFJFY7wg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoX6z++179jcgihzVdhoDvznApSa7Yi2fxEj
 TXhIxGcA1GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1csBCACdTalb8vsJlE0T9l62d0tbWRLt9uyl9jK/+WzEAaJ5Mby6G1adoguqtNS+RkktK/ULuJ8
 r5GuXIRao/XZmq7Uq3TEOe8hk8Cgu6wBfThHCiAenbr6EEtFe1K3l15m+hsFlSNoZhJVvvCLxqM
 xvcLQN8L82MyrJWaDvyXMjJ1gLZijJmMLDKlDtVod8KFObPpo7y01nLUjpbIKtUIHWplTAZLlfU
 67HCz3AaOuvPXNScXmeQ85Nr6fZoSR4RpcxBwRY3aOxWrg/k4LWWtaZwy2bjqYa/BbdcUR5KmfJ
 /sdsBEF3pyYetG1enFQC3vY3As9cBW5es+Jo2PAH0vUIVHlh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXzVmaACGtlXQo
 0q6cLAT61MBVzo9BnRxH9pqam1fZmcxKIAiTKkaIKinIMGzY0PWnqwxpPIzQ1cPgzBJyFOWNyGW
 sGTQ1P9u+B3wTnTMiyldgI/tRwz0Tps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXzk/q+82HwujI
 QgJfhzyEHrm3WHKfsznfGWKn2sRsX4dHQuNTTQ+jb3BpcGjOkAujemIa5Yg4cv0+Bw5eXAGCO0k
 eCKcJg1qtE71g+1FaEncJ2SVwC2DJL7NBefFzNfaBuGBxNqJA+Dn3UEvarYcluFipKd4lvsDDN0
 gb3k2Q2zCj5wrgizzp1y5B4IVbv+Wxd3WMcFOus1T6Y6obpItGhTHXBStKCdDLssPENHFBsyc4r
 jBQEQm5iAerz/tyrTRgEEU/XOPLTkbkirrr4hOh9k+m+V4GANOcsMfRm9Z1cMIBChdgfZYDu39u
 oBzB6gC016LDzSLtn0rdTBEdtZ9j+idMSgSkZIo0QMmMeenckB2cAQ7fsqVDvZZMpVS9fUSxQDN
 DTD1mbJy/NaClz8UWkp96G6y27LDUI3GjSynj1t/SaePtuPTd2Vhpa2EylmvTFEuc+3gWPC5VJ+
 qpcHGASIaCLhLmP2QpA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa54a20 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_ChxW0iHWOZRcJAqfHkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: WqprgGY3VMlktpqFDemo0xNFm6IlxZ4i
X-Proofpoint-GUID: WqprgGY3VMlktpqFDemo0xNFm6IlxZ4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120184

msm_drm_kms_init() leaves behind whatever it has already set up when it
fails and lets the caller sort it out: msm_drm_init() jumps to
msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
has a kms.  That is the teardown of a fully initialised KMS -- it flushes
kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
yet when the failure happened early.

The kms driver's own init is the first step which can fail, and since
commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
failure there leaves a NULL kms->wq for flush_workqueue().

Undo the steps which have completed instead, and let msm_drm_init() unwind
its own error paths rather than calling the full teardown.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 27 +++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_kms.c | 36 ++++++++++++++++++++++++------------
 2 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index db1b655dd055..c842321c9069 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -159,29 +159,44 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unbind;
 
 	if (priv->kms_init) {
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
-			goto err_msm_uninit;
+			goto err_shrinker_cleanup;
 	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_kms_uninit;
 
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unregister;
 
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
 	return 0;
 
-err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
+err_unregister:
+	drm_dev_unregister(ddev);
+	if (priv->kms_init)
+		msm_drm_kms_unregister(dev);
+	msm_rd_debugfs_cleanup(priv);
+err_kms_uninit:
+	if (priv->kms_init)
+		msm_drm_kms_uninit(dev);
+err_shrinker_cleanup:
+	msm_gem_shrinker_cleanup(ddev);
+err_unbind:
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
+	ddev->dev_private = NULL;
+	drm_dev_put(ddev);
 
 	return ret;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..f3e39c3907a9 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -225,13 +225,23 @@ void msm_drm_kms_unregister(struct device *dev)
 	drm_atomic_helper_shutdown(ddev);
 }
 
+static void msm_drm_kms_destroy_event_threads(struct msm_kms *kms)
+{
+	int i;
+
+	for (i = 0; i < MAX_CRTCS; i++) {
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
+		kms->event_thread[i].worker = NULL;
+	}
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
-	int i;
 
 	BUG_ON(!kms);
 
@@ -242,11 +252,7 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	flush_workqueue(kms->wq);
 
-	/* clean up event worker threads */
-	for (i = 0; i < MAX_CRTCS; i++) {
-		if (kms->event_thread[i].worker)
-			kthread_destroy_worker(kms->event_thread[i].worker);
-	}
+	msm_drm_kms_destroy_event_threads(kms);
 
 	drm_kms_helper_poll_fini(ddev);
 
@@ -282,7 +288,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -295,7 +301,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = kms->funcs->hw_init(kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -311,7 +317,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
 			ev_thread->worker = NULL;
-			goto err_msm_uninit;
+			goto err_destroy_event_threads;
 		}
 
 		sched_set_fifo(ev_thread->worker->task);
@@ -320,7 +326,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	pm_runtime_get_sync(dev);
@@ -328,14 +334,20 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	pm_runtime_put_sync(dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	drm_mode_config_reset(ddev);
 
 	return 0;
 
-err_msm_uninit:
+err_destroy_event_threads:
+	msm_drm_kms_destroy_event_threads(kms);
+err_destroy_kms:
+	msm_disp_snapshot_destroy(ddev);
+	if (kms->funcs)
+		kms->funcs->destroy(kms);
+
 	return ret;
 }
 

-- 
2.47.3

