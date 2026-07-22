Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6734B437
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702196; cv=none; b=FkZC9I1QuIYLKxVmFvVk91PttGbT+E0G6JTnuY/pMrTGkPmvxBpPLuBOBmxsyq2/1n6b05r33ruSpvk7w64TxwYEb0YBNhZfP0Qv7K4WFsYeGecq4xjT2Ai0i3eJlWmpFiZr8I/dmabGkAJsFlFf9ZGW1OkkXGXK0qdRUn83wJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702196; c=relaxed/simple;
	bh=BzOvnMI5yT23J0skjUtVdX/YbK2+8ydFXE2ObmImkrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gl+kKUauVbZ/MiE5ZD0rQ9aqLq4puFhlKRuvjq2wHWkSMCBvzJzfHieUs+E1nOHEZDoEyAnaY+WfzS8lbBc9mQAIAhZxY08qUZNBuwGHock0ix6zo5COLe97mX3rNPMDDfd517C/iAcffY9tUUrm75urwgF/Zkb5/Li2gvvevjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7HSxYmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPcfYKka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7HSxYmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPcfYKka"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M61uW6984493
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3fc9Te4dKFk2JaGmRMxsej67CBbIGs9m76jWKgHR1g=; b=n7HSxYmRty0vw2QN
	LYI/22+5XXVmJlrhWIJUD8pPw1zDloEnRbZmBMC+GXQNwEwTOSQUmZ8Aw+b/3JCW
	x1eLDiYdstc3oEAKvdiaccfd9kUv1aXHXqypMjbxjceHOGKdftGgVTYHMjjFN70x
	ShkQEpFPCQQxZIXqjkJGpx07D/NUG7rBkc08C02obWT3rmlLu4Gzlv3gWsAgJyB3
	6+bnTobeUMkRREC+htRkK/KveIvYpQjf1mzKPmMvOk18EHCMpR2ckMH5R7mOG3U6
	9GY/gO+ZU59oQFJ/z0aTAG3BZuLkYpOm1488O2GKR7TPWJBUHkE6Fq+wS4Ujird/
	ilh0dQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83845v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso189449241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702193; x=1785306993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3fc9Te4dKFk2JaGmRMxsej67CBbIGs9m76jWKgHR1g=;
        b=LPcfYKkaVLkRdUwjlnlKGUh60Nsb4NAI7bnYyWdIS+OwmO6ArsJGXZwHJiHbyJvtDT
         HujDEIRp0l5TIhYA3pLeUPg7GuTs7vle8ldGXpNO1z+lLpQ8lZlWVtH/Qp3IBAsPSnft
         /lV05FjrkNivalNO6yHbnHgr5sjV118Aqw1K7NZ1Uak6LHvObocJFgp4AVVbw0yIcGqZ
         M6VbPqI6/QQMTBYCEa4Spu4ATUsZTqk3RTKxcmUgFXPfW+uNEZvw7eU9j8JnbqmUqFoI
         elMaLnXnHXZHOmi92Si2UL7kWjj0oVGiJRzHZOaANf3l1l6S8Q5SiXzzrI7OjaFhpJyH
         QTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702193; x=1785306993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3fc9Te4dKFk2JaGmRMxsej67CBbIGs9m76jWKgHR1g=;
        b=egQxC7EAL38Ux2fafUr21cLBkMrg835TyefqAQ7VPPlDrjhv1rZHSNzTstP/H/Zjm+
         P84bklx5XA1+f5fRXFUHo4MfK8+nnChy8bz/eMn3OuSeLQAluSlJljV2BmOGxDPOcQwh
         DFqbpz4zcGOHN+HKdkDEHBX48IkT9yiW7wAGbD/OvGIofyGecGejlYGPkY1PFe0oKNGY
         C3lWK9EQ/5LBwBvVRlhbCM2vD75iEQ9tkLogjg5P5bowJsVD+N7Wesd+V4GPzBkNCWBO
         MzUJgQaod4nsyihfOpy4I/GrPS42hBapsS5bnF8uoingLJXEvPDwWQLvlyQOtZXN9fN2
         /Zxw==
X-Gm-Message-State: AOJu0YxS+mN1KbRQDTEmDVcDWddUSDsufT20rRVaTzt/pbc+Mx+0vVTi
	iaZs1MBKOUy5gXCuT1kzuWm9XyYm3Gz0xFx2vKJ1kzkiODWE8osJ3sIwANWPHAzOWVoFWgWWuQg
	UXPHbjfMJEoEKGJWjEXyqTR6smNhyFLLW7VJZ4wMMxf1Gg0yr2RvZmNgMsJr+iXxNhY+XXRDBiL
	tI
X-Gm-Gg: AR+sD13OGNONQXc38IxRO+cKdFW/ItCr7Q6f9Wl39dfMkqNIwmMnUnjpYGSlpPRu+0m
	fPn5V8vt+/eg59bOUGfAHXTsFxTrFgTsGQM5LpzI4hsT7RniMhz0yKQKOOz8tkKGgvQvhS0P6/q
	HKN5J+ImuNicjPhrWn2rrsWP82CiFtnItnPE8xb+wR5lsiSAQrkPf8/NtHhgygmzf9joZUfN8zx
	sBlSeaCPfQL6D8251Nun5yzEZy/QeG0DasKhYeWrxOGkJHP1SB+y7ROACPEv6C/d0Sagq8+ceyy
	/Wjvwt/H0IMg/r9ovJTd1idoJPy3oH6HOLjXqn9Rqzb8GZAnUcDO8YEMiDQzSYlj5UPlp+iclNM
	mbyASkhFr++0qt80eaFeK4r+uyu9cIqv1FCY/upEMHaAGRsV4sXoBvIE31HsOVtDiNyDt4RU30w
	nu2AglfEW7rVfSZg==
X-Received: by 2002:a05:622a:13c9:b0:51c:7b12:1213 with SMTP id d75a77b69052e-521403455d1mr205562431cf.81.1784702192923;
        Tue, 21 Jul 2026 23:36:32 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51c:7b12:1213 with SMTP id d75a77b69052e-521403455d1mr205562131cf.81.1784702192459;
        Tue, 21 Jul 2026 23:36:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:17 +0300
Subject: [PATCH 02/24] drm/msm/dp: drop the always-true yuv_supported
 argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-2-368c10fe62fd@oss.qualcomm.com>
References: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
In-Reply-To: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5212;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BzOvnMI5yT23J0skjUtVdX/YbK2+8ydFXE2ObmImkrQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1ZCyjNde7nU/Swzl0bM98xeFeMw7/ePXNP4tkuBr99ee
 FB72Tmsk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATiedi/8Vsk6vvmbc6vDop
 7GXQSUm1GhEL0QCWtVqZurIfKzRf9jtliDMKum0Qnvju29oURoMXcpVyP7zftfZcWjt7Zkuham/
 k29AtSx1swy+encJx0k1y+lfb6b0lXjl3Undp6dX/nHVj57m4ucc9a5SnnZxUPv/pUpF2Mbn3by
 rzSzbee6Dj0sW0+vynrZMyLE+YTGX2W6HyMNG1rLOfT/fznvPFJjO81FnzQzncw+V+PvgYkKBfI
 fu3r2JrX+0/py8vVXprBf7ocf6uqjB0UvE5yxXUs+v+/tjISrFTKQwylQKXxKaxtna/YppgKqy4
 f87i8mclGpoPfKW9Fcu9Z53ST1fyeBOWP/NiO7dq8B4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: f9h0Chd3P6c7NeEv8lVTd7oGAbjpzW9B
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a6064f2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nfG2dtz5EEHLLqw77CsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: f9h0Chd3P6c7NeEv8lVTd7oGAbjpzW9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX8APFhAdRzfjn
 P/lgEXnirfmAQBnMs7xYq/TeavLK/Nwso95RWO0HsTkAihzL/jXWKiAvriDufFq1hWq6JMFBdqW
 Tbtwuc6aKXkHXgOOivbb5eXtt10IGP57ENvP+PGFvVN6QGmpGHMwAE0IAiJX45gX01cboW2LTmQ
 sL0INRfcWIAUnyuxeJTU0jwu9m02lRSvROWadgsHf6bCYgnPdI72RlrCJSHBSRpGBVK3O/gvzul
 sXXL63uy39gbcDdarePDhqZuPLpiv5zukeDjb+nRJ5fTBeZTLtY399Fr27g3rPvWz+4FKlWVyqG
 3SG23I5XbN1ovIHNpFegqL1UKizYgiqM0TzKn7kDHd2tCHs62Gd8imh50QBCBC/XxXFa6gpI8ab
 Y0T7vPKcziXFBTpjX6jGOHQiM1RhUrkptPfMtaIOC/2r2bMZHrXk9xevqKdXP/W6HbXWp/rocVJ
 5XUEGxFKWgBwah9IFUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX+IRDFBh5bdCg
 TTeKsEHpnjdqLE5TjsyO2AM33FDoyKLdQpkgg4DR9hGgES+upf56BLua0IrxcNPkn4KGFAxJ5uz
 /BAhQl66QmwGdzcQTa516JJEAchcn+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

msm_dp_modeset_init() and msm_dp_bridge_init() take a yuv_supported
argument, which the DPU driver fills in from the presence of a CDM block
in the hardware catalog. All platforms that support DisplayPort have a
CDM block, so this argument is always true and only obscures the code.

Drop the argument and set the bridge's ycbcr_420_allowed flag
unconditionally.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c         | 5 +++--
 drivers/gpu/drm/msm/dp/dp_drm.h         | 3 +--
 drivers/gpu/drm/msm/msm_drv.h           | 5 ++---
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..ede935a426d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -653,7 +653,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
-	bool yuv_supported;
 	int rc;
 	int i;
 
@@ -672,8 +671,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		yuv_supported = !!dpu_kms->catalog->cdm;
-		rc = msm_dp_modeset_init(priv->kms->dp[i], dev, encoder, yuv_supported);
+		rc = msm_dp_modeset_init(priv->kms->dp[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e0c44eef3aba..5ae5eed7e010 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1318,7 +1318,7 @@ void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *r
 }
 
 int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder, bool yuv_supported)
+			struct drm_encoder *encoder)
 {
 	struct msm_dp_display_private *msm_dp_priv;
 	int ret;
@@ -1327,7 +1327,7 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 	msm_dp_priv = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	ret = msm_dp_bridge_init(msm_dp_display, dev, encoder, yuv_supported);
+	ret = msm_dp_bridge_init(msm_dp_display, dev, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 06881bfd6181..4f615b45fff7 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -243,7 +243,7 @@ static const struct drm_bridge_funcs msm_edp_bridge_ops = {
 };
 
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
-		   struct drm_encoder *encoder, bool yuv_supported)
+		   struct drm_encoder *encoder)
 {
 	int rc;
 	struct msm_dp_bridge *msm_dp_bridge;
@@ -259,7 +259,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 	bridge = &msm_dp_bridge->bridge;
 	bridge->type = msm_dp_display->connector_type;
-	bridge->ycbcr_420_allowed = yuv_supported;
+	/* all platforms which support DP have a CDM block for YUV output */
+	bridge->ycbcr_420_allowed = true;
 
 	/*
 	 * Many ops only make sense for DP. Why?
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 041aa026ae2e..3b046822f05e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -22,8 +22,7 @@ struct msm_dp_bridge {
 struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 					    struct drm_encoder *encoder);
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
-		   struct drm_encoder *encoder,
-		   bool yuv_supported);
+		   struct drm_encoder *encoder);
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3d5679be488e..0ec0622d9217 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -354,7 +354,7 @@ struct msm_dp;
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
-			 struct drm_encoder *encoder, bool yuv_supported);
+			 struct drm_encoder *encoder);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
@@ -370,8 +370,7 @@ static inline void __exit msm_dp_unregister(void)
 }
 static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 				       struct drm_device *dev,
-				       struct drm_encoder *encoder,
-				       bool yuv_supported)
+				       struct drm_encoder *encoder)
 {
 	return -EINVAL;
 }

-- 
2.47.3

