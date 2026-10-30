Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380225;
	b=nd0apo4VyBlbk8+cLVUWblAH/9DXZizsz/jPAznrea5uJgXyKr7mHx07qMBegBwdq/pc
	 ICwmb73hhqR4tLbAagdj1Im8Bq5HyP8zDaU8/Ku5aZDNFRh0Nn1gctu8lDmzbU6OV97tc
	 xK1CRMbYMGwOWIn1z5S2r7Ee+sVdIXG20pKOLTpk9UdUh7IB1PDPI1mPgNub1BSSGjFH1
	 RGhMfTTojuDPynvzsOrIzQi3BwQe3Z3Dr92TojrIbLoev/HHIG4ltFDS4jonDmAk8G6cN
	 r2J6YfbnrgKfnGAkZ8MoQ4aDSbfpJjcbFIq5d2A1fanuhre6qv/MIE97Dqw4iG73E/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380225;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=;
	b=mz+9EyreUYK/74A40d6dyd8wZQnP6DPsXovb716uhHr2/HsXqsgK0Yu8mqZe5B3x3ntB
	 fAO22QHUYD4waW3omtFK2gjV35UjKw53K5bnPNYCTYVyaGaLS8CQsymqyHDPeewYMLtE/
	 VDxtOt5ayU54mhmLHHwieUGOmadKwzBPy+nvtAXvLajBS/b0tr6s8QJjeMv0XVpAUQEy3
	 OpePP9QnUcFAuRD7Jmu8dirnttGPhGtzRDLW4x5qiaPKB0fXt7EJwOPBgv22aBstZjrBw
	 5NB19bPPmOb0TDQie+ZWo9x480tQFQSIECpXxIBabm5MzbZ/vzdj3K2M0fvZjJB97JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mxDlVb/4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWJzW4mP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB37606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB37606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxDlVb/4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWJzW4mP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERJ6v4103327
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=; b=mxDlVb/4oNjbGPp+
	D1IDaKBIrATqv/za5Qjgo0vHnkuLx4V+89qIAw4VTbiLvZ2xVJipLOb5BOy33fPd
	nbpDuXxy6kCffhskOIsWee5g81kN4l6B4bkVFgFC6iYb/B7G15jMwTPUHDDum4Wm
	S4hFYcyxjIWxyqDqLp+/njMQAUcAbO8kk7IXjgkYuxVIgF6X6OUz0bB6M5fZdkZG
	xRRsAvsv2tTTGnQb4bBQTGjAyRQUMUZzPj8/0FdV5aWq/l7g4kCYQzRy1iJbQear
	UtfAGEhX3zPZN7ZXkCUaH9ZCQ+KqOyNcpSKiT1DSopDqZfK3TuzS2PxxOV+m12av
	GUll9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm5h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:10:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so1451390eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380223; x=1793985023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=;
        b=aWJzW4mP5Rggi+7etKup4gegLHLU985FG4b4iVamc2CT3I0oarUePIQTUFycBvd/nf
         p/q7IPIaoagnmp2wpYuoTkoCh3pYrU6hpjIfYZmscViaZsI1c/XoiiufujDaTImCq9rd
         Q6JC1JTUAC1zhqgBdCnCdkTyX2s7iVutrv56gBgmHUM8esnqecqK9wA7MD0G5/5lRU+D
         BGnkRN6+niDDD2NIro3A4g5yuBB12++jaOQsiURJvHx974Gzb29Q5n/03R5HWT6PCdQR
         4JJ+U6e2TId+NGLYqJvJHUZoFpNISyQOy/seFuC1xRVjgRLhySNs1P+btGqLbixz2zNZ
         UklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380223; x=1793985023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=;
        b=LkJF6jH0UwteiPEicfd3EUXLDFOaI1Cbt7Oc6ntW2EEpN8Z6bkLOUzef26wGW5Mw/v
         hVC86/NaakX9/ZkvVPSo1jQX9BwjKShgXXgiCLTbMUrT7wItNsyZ48uVSPH36FJ/iIGI
         wKKlb27Kx2uVf1LsOz/h0Qdk0xxgOhT+k9JvjzPNo1wxDXNQ6zuZMSvUBiFCL+cXwnB8
         UE7w3CnHekizxLdK+/5DwHTEpRw0SYj7f7J0iixPVf70AllvB1RwAr2hisEaso8P3SZp
         b/BWQ46nw0ki5zSthIl+pZ9r8Dh+piGlzgsEbjHegtik1XfIECYtfLD+rOTSkEdzyvhF
         XU8A==
X-Gm-Message-State: AFq9FYIsGmU7AcESMlOilIS688RB6Oo1oLNWu3XLtgNLk9E4aiAtSITA
	5Hz8ucrbeoWOecA8l2qF6Ft5PmZ4ijVzvUNwvRFMrA02vp8GKiRbSr4wFWcBCp2nTDRmYm6h44U
	eXcEQ0Q/kfdSffvU97qsRTgHLAQB7Av7zk3k+ToKAVV7mEQUOfg5J0UZuKEPrO2KdFvKT
X-Gm-Gg: AYBFou2VMjR6CXAvjfgUI84zSPd848FQDYhVEVufbpMUuVpojZrEJ5Ej5heyA5SVaww
	ORTe5twXqysZed0G4uLZlaqh+NjXxlpJxRDkSUf5RsQsR5XNzAu/uegBqF4i4WcDzGMaN8ZxSXh
	jsb0N04mtec1hXURjmLjfNVUCazmJnjF0Y55LMZrrd1HX0CHU4PX/27QSu1/xxpXpzQjt9haXz0
	VJJy+LiB3WztFiUnTDLa3w9Us4PUAkk9bPnEIPHSkwzQGoG9C/0l6Hi7EB6jr3HWP9EkWmyWDxp
	uN2wDojskABlbilFbOiRDOD5/JHxTGYT8bYUn5UjtJA/wic+dfEjKYuLmD5+V9iZpfIsztch+lh
	+/jAL7laAsejSM2712GPdUEn8umXVucN7jqoCyO0QYgm0GQ9oRZ80x5GAGM+/dSqJSseLckXgYw
	==
X-Received: by 2002:a05:7022:b048:10b0:19e:f233:4f87 with SMTP id a92af1059eb24-1ac5a2a1483mr4187507c88.15.1793380222792;
        Fri, 30 Oct 2026 10:10:22 -0700 (PDT)
X-Received: by 2002:a05:7022:b048:10b0:19e:f233:4f87 with SMTP id a92af1059eb24-1ac5a2a1483mr4187449c88.15.1793380222148;
        Fri, 30 Oct 2026 10:10:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:28 +0530
Subject: [PATCH v2 7/8] drm/msm: Remove dead gpu_ops parameter from
 msm_drm_init/uninit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-gmu-sync-state-fix-v2-7-89d3082d97af@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Haitao Xu <haitao.xu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380169; l=3626;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XYzrF1O+N18oo1WMb7vD+Ua6dmg/Pfyq8adeQ+1TTRI=;
 b=AeDXa+GtzzyMm0oaBDru2QN6HdwHKwdCslwODLXpk9nsqIHELXhhUDyoLMUMBZThf++prZhT6
 Ks4x71aTbYFByk/GK5D+xvdwZRy7gy40154QOFWf9X/igvU5LHbWB+q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX9EgvVagHmgqX
 b9FejQg1RdBVR50tx3LvtdqJFWW19WXKF4riT+sDU6HpVpH22qQJiUhh6KWJP88tlY83E87PuGm
 2Ix5GoXx5iEhK37L7Xsw+MHzeFkTXepWgQHRfMYZHLc0IvuvxE6YDvigdTrwtEO7ubuPZa+kflI
 PiTrxxqO147fcerJqiG/xw2z8E1sozH4PXWFNZ4jHNnsCQMhDnA+tXVsypkMyBL/eBQZdVYxjbV
 20TTZ2Xv+LGT0RIUF6Lbjs/8kc4AH+5OC9Yoeya+0+DKB66rlMF/dNWNSc57iSTyu1CLlHKdXns
 KLsGGTS6EUp0UyLmP2Rylgz0hvSS4B7ab6c1zi/Mjk8LM5urUnaiUkpC2mQhY+4lnqZFH8dz+3c
 M3OmrbFPYSUYWCK/1Oi+sWyIb1epYsEYDWGwtBlIr8bFo1oDeSHFpgRO/YrG5KbtRbRmIhLe0gG
 7xE3F1LKA0VMgBC2o+Q==
X-Proofpoint-ORIG-GUID: u39Jx122jGt_ikbx99DRtpKDSaJi1hmX
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4cf80 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n7tE8WeWehBHorqAUqwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX0zCZ49wnx4LZ
 gu6e3XuTP/3AaFPAB79blpMZ/aKVIniqJwlbm9EK19jvgYJe7njhAodqRY5SJM4Kzt6ZyBpniPU
 TUHIprJ7uA+Ro7xV4drHwWn/4KgJ1Ww=
X-Proofpoint-GUID: u39Jx122jGt_ikbx99DRtpKDSaJi1hmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

From: Haitao Xu <haitao.xu@oss.qualcomm.com>

The gpu_ops parameter on msm_drm_init() and msm_drm_uninit() was
introduced as an escape hatch for the standalone GPU path, where
adreno_probe() bypassed the component framework and called the bind/unbind
ops directly instead of going through component_bind_all() /
component_unbind_all().

Now that the standalone GPU path always uses the component model (the GPU
pdev is both master and sole member of its own component aggregate), all
callers pass NULL for gpu_ops, making the conditional dead code.

Drop the parameter and collapse the conditional branches into the
component_bind_all() / component_unbind_all() calls that are now always
taken.

Signed-off-by: Haitao Xu <haitao.xu@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9ad2260f4971..c3b6a5f8f54e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -148,7 +148,7 @@ struct msm_drm_private *msm_drm_get_priv(struct device *dev)
 	return devres_find(dev, msm_drm_priv_release, NULL, NULL);
 }
 
-static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
+static int msm_drm_uninit(struct device *dev)
 {
 	struct msm_drm_private *priv = msm_drm_get_priv(dev);
 	struct drm_device *ddev = priv->dev;
@@ -181,10 +181,7 @@ static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_op
 		msm_devfreq_cleanup(dev_to_gpu(gpu_dev));
 	}
 
-	if (gpu_ops)
-		gpu_ops->unbind(dev, dev, NULL);
-	else
-		component_unbind_all(dev, ddev);
+	component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -192,8 +189,7 @@ static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_op
 	return 0;
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
-			const struct component_ops *gpu_ops)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct msm_drm_private *priv = msm_drm_get_priv(dev);
 	struct drm_device *ddev;
@@ -239,10 +235,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	if (gpu_ops)
-		ret = gpu_ops->bind(dev, dev, NULL);
-	else
-		ret = component_bind_all(dev, ddev);
+	ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_put_dev;
 
@@ -276,7 +269,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
+	msm_drm_uninit(dev);
 
 	return ret;
 
@@ -1139,13 +1132,12 @@ static int msm_drm_bind(struct device *dev)
 	return msm_drm_init(dev,
 			    msm_separate_gpu_kms_components() ?
 				    &msm_kms_driver :
-				    &msm_driver,
-			    NULL);
+				    &msm_driver);
 }
 
 static void msm_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev, NULL);
+	msm_drm_uninit(dev);
 }
 
 const struct component_master_ops msm_drm_ops = {
@@ -1199,12 +1191,12 @@ int msm_drv_probe(struct device *master_dev,
 
 static int msm_gpu_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_gpu_driver, NULL);
+	return msm_drm_init(dev, &msm_gpu_driver);
 }
 
 static void msm_gpu_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev, NULL);
+	msm_drm_uninit(dev);
 }
 
 static const struct component_master_ops msm_gpu_drm_ops = {

-- 
2.55.0

