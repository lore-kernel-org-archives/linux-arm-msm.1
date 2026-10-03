Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79344283CAF
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987243; cv=none; b=Fe4t7ZDYiToWf5s1A5Y09dCQHpqX/KgHS4yUmu4tdFPIm5c5/TL0l3Gxswz+L3E2nw01IVGO8KZ9JApBnihv+oKnlUPxv60phueTVzWk+Sds0A+PmWHJ3nRJkv0EdmTNyK9/nSkoLQAbF/utAOrrx67J+rs5LLFtXejEIZa+UIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987243; c=relaxed/simple;
	bh=Wz2Pa5WiBpAEifgqPDIloWQgfriIhUeAQAmCSvwFVfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uowkl1+n2YR6hzmxI41uE8YwmkXl1HWDOzNfLIjgMPUcCcfoy/EF2zNikftnfVzdeLX9crVrxGdhn/66cmA/fQR/MeMl5FvtcovHYEoO5dMbHSKfU18YHLakG10NFmLMA3F60Rd1LxJaTUSDjzXFV2pJazAUliuk6En5PherbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+qL7m+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egv4Z/Fc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+qL7m+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egv4Z/Fc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NdxnM2941775
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEHQugw7s/UZ+WRRqETj1Oyk2iVXlC3waP6gUzs/l0A=; b=H+qL7m+GOTsAxSHU
	XZeKYMyIaulSPxspVzS6OJVvcHpXnAXoHOcAdQJA4LFeBO2YqRSrqNcAd2Xs2ZrN
	Rx7mLdk2kJfTAtS+iCd4vWrybNHaKYKWCwujj4SZkQPiZ2oCbDe5g6ehV73QEwbT
	xSEQpJpdIZp1V7CXGSxlK8UCgPelt5lTtcG7VoiH7bS5X/J2gopSfzJ5JF0N74cE
	EFoDCye1/a63dHVO3yRiL7M+vGeTWMSi2LLs21ptB8//XpUSJvz/qhIkxDPOrbig
	L71Jt+6SS+3+63co7Oum6+N74O/R3EqXg4xJFK+vIwmF160qYbvgP7oiG/CfNF5h
	3E2BrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2h4ksdcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:27:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so24342385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987239; x=1791592039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEHQugw7s/UZ+WRRqETj1Oyk2iVXlC3waP6gUzs/l0A=;
        b=egv4Z/Fcp5BRUNBvP3t2k2bC3wqeDGc1Rh3Ib5u6wf4nbSNcmQuVptq6YiZegHpvQn
         Ev5RzmEB80q9Jit79LSDuUVXGmorMC720NRQoKVdDVHeGiFgNYvef9aeS+vgdmlm3IzH
         rxw04Ubo4vYmfc7EAQfHNXYdkwVLkfFecJd1Sz0HlotKwfjadREhsRRMYPYqlCqrBWp7
         Z7pMeoMvP/A0lviH74x8/crWwLKeU1QKud9E0JpknXu921F54+PgOWYi8Y8PepeMDwjw
         j4iNUyIzIK0uRfO44Ewlty4HE8T6CSzY6vSwWxBoh1vgHEj1R4dKkKxtj1RlNtEnhJlL
         jRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987239; x=1791592039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEHQugw7s/UZ+WRRqETj1Oyk2iVXlC3waP6gUzs/l0A=;
        b=WNtKUkLx2NpGOgrKIWsFI2r2FouVa9N1vSB0slJNiMU1an+i/Nj6s785XnLti1zQ2P
         dQKb9dOiP9VKAOLL9tFN2wBb+RpeiktqyHxn0QoBfFZIq/USrht4mKPhnzhSVfxypUFr
         LNKEUh8AZ5B6tuMZ5wahyW3YWAyMrvu47QKuAjEQT4iwRnrqye4Z/rGAGu+mpxMVBHs1
         4rMZnwFH3vN89oSufOS1Q1uy0ow8BNWVS+exis6aGNvxL+PZ60UsQKmgic24mUl8v7EK
         /NdxfwKr08TTs4ds4yn3NcoVgL0NDodHD3RCbMgFypNuuqlKIWp1cuQJaSPc0peAWV5/
         eN1Q==
X-Gm-Message-State: AFuF++m/mlzXkVcRQTFOvufnVdgflybr6g1G/Lj43+5qP8PY+LUaNcFA
	C0BPrIadYTOoeyBk7cPsLV1TTBXX+w/UAHjJov99w9P4FwTE+loOzxrNjQ/wa/RYA85r9I03O2w
	NrUBs0cFPpfI+rbuf69U742Cc94M97c0eNtyRtZmyEIwaJYjU5JJj+P3oJdTzZxn2txQC
X-Gm-Gg: AYBFou2XxEhoTbE9Htgaz7QI/bY0/sWd2+acK+dXx8RKOtac9/ASse2L9aOp1ZsVkL5
	WxSGIDDjIkRRYVySyeoohreNuYtSlU/3zw7MqA//eXCgovCSRarq5bo6t1bPWn259PfZ85p+RXY
	iyBC8usCSIGRXDhd0XsX8sesHnnNSX091Cd2BcBaVRVVVBz8MHiK/w9XDIHBjlkM5GxXd36/0iA
	H+gZJ0YGuJvYeiuhnPDRUNj41IHtQHCgOrDN5barp7IkV/AN7B9Z17BUMAOEWzIM/Xi6/FXqCAy
	PcABtIo/PX0w4OeKvpv40oZyQ9XTu39ZYME5scW5r1B6RQTndur37Yv3kcvh5XaKguBuXw6CfdU
	Q8wC3hbfQ5UwQ0dldFPzjIR4S0Ug8vJY41CxIXHokyFBFh0w7VRZCBriuphAxkQSk2Xc4R6ybmr
	dLHosY69WZDpSo
X-Received: by 2002:a05:620a:6b12:b0:93c:6450:9cec with SMTP id af79cd13be357-93cb59f3e1bmr1195710085a.5.1790987238582;
        Fri, 02 Oct 2026 17:27:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6b12:b0:93c:6450:9cec with SMTP id af79cd13be357-93cb59f3e1bmr1195707485a.5.1790987238010;
        Fri, 02 Oct 2026 17:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:10 +0300
Subject: [PATCH 02/11] drm/msm: unwind msm_drm_kms_init() on failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-2-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5509;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wz2Pa5WiBpAEifgqPDIloWQgfriIhUeAQAmCSvwFVfk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvfzy1SAPtrAn/8Np/NGKM78sv5YBBGA7I6K
 gQ0HCP/5W6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL3wAKCRCLPIo+Aiko
 1VwwB/49FVo/6GX5wFspq7eRo31XtFANbuoJrIM2AGWgj0OttVEoGE8wguT9KIrzXKsU5CparMd
 Pbj8pB5zkwGcyXaf3t8pGwx2yXfkp/HECGindGzf63bRd9FVWwQuwUtQmF55brOraoFNQZFKdho
 bcwDM0Ik6jcYQDfFog0K88t33Pkl/Ky3dF2EawOsCu8zE364HlEiWurffzbsMNWbOVK1i8iQ2I8
 KZjyqZ3qqDa8TIDKVzdhOFmWpSehE3L8lfo5jAl9cddVNnYGRd8oQeZmew66RVEFBvIhsKyIqfz
 WQTN6hjvifRQD4oZ5d8oWAT009F0wHeLRbWvmvK+syIdinUo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G46JgNk5 c=1 sm=1 tr=0 ts=6ac04be7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_ChxW0iHWOZRcJAqfHkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VaCpNyzFKb5RuKIrux_cXxayUWY4ngNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX5K5m6LkNWITp
 Tg5xU5kE3+tTnFf5eyubA3LKD2xOJtW/yqyiohqRvQy2+4fYVKqJG5DQwviPXwPMzqneVZy9jOs
 EMM5E26xi6OUZpvy+5qrQwY+f8Oq0ejqRJiP/HVkhK6Lyvng4+bavPoJ2baBLyhh4v1f2bTWPkB
 QsSltP+58nwWB8OqCKvTvLLdUB5RL85pZmbLfQgY43MQFnnZE4umOUa4J3xtVuP52naPIMavKm0
 /z2nUNLgg/7KRIs1Bs81Qz/67mO4lKoeND5A2hJPcRTqhC1MUM9e/SfIIgaGZ5sFO+I5MJL/V8c
 bBGBK8FFNIEQGIC3LEG9RmVywTc9FIhi3GMzeewrSDne1m9IbsZvz+0O8G0TvFGmsNfqf2xPCIC
 1AMYsZGXMJyO+QJEZ5MMaspDNuLLj3QCG6zuxdW6HLzDTYaB7sWht7XBLl8Rr0HcUjisf620VfQ
 uFL12ummhbV5/lAgCiA==
X-Proofpoint-GUID: VaCpNyzFKb5RuKIrux_cXxayUWY4ngNh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX54gVAGLO0rod
 CPtOtgr0Fjm1z/NrZPBrqgHU3/MfE4G307bYaw1c1obTUp4BDN488jdJnxO/uYkShWCrJpxWvCJ
 bHIBXsASx6YscgLMoZbV+Z22l80eui0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

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
index f3d2eaa04f14..d0848a831e8b 100644
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

