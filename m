Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4FC313E0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702200; cv=none; b=N9rLs6Bn67zFxglCA749XAeWUK9mkdj9cztKnMs6XPaliTCVOLemHFAd8NxvbUubht+GOZPQVobfk+mAgaPqROFt8W5eKeedplfigh3rOQVNJsKPW1SpOb4d7W2Pgi9fflaqElNksvaZrbL04ChX8HesYwPu1PwoySHNlXViy90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702200; c=relaxed/simple;
	bh=qvvzQGIvCJFBeyjflw7v8rndU0UY2akeaNn006NwjUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SbL8p3u078GsEDqI5CHDl+0pIf36Ug6aG2wzTvwBZLg9DYP7J9S8i9qCspuBlhcXFllq1JG4qgJjRm585FRgPJn0u3LkYN1XI2LLYolfQC/YED028+HD3G9IG/V7cQ7mv9jZ7Ydk36ZnOI9NgW0POTRcwesg7flHdbB2GQdA8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvtWZFqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSY7GkPn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvtWZFqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSY7GkPn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M54CRJ3474518
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yG3RAW2UmHvNScmd7UPrq6tcvvwfJPeN7NawmzDlzY=; b=pvtWZFqPMgNtioFh
	WhFwJh29HDck7RTrym/Y+jJ+G2ARZinYo21MMc8ks+fpWLtTfVEDEBpcdzq2LyYP
	u4MyLZfWVu7MpJS7Hdz3rQxFXslRf05XtYo0Nalx/Q+Y9pnsBp+2hqtmOMiiGQWS
	bUvRgZNwl7ZMQvtUFwB0QYSFbDbHYKGwZAzO9uVymbT5DVMcPKNqPTpatTcM50Hu
	YgmIMEvbeOyh93bv4ZHzae1RllXBGy55HQslZg9xx1hqZ6J8D67+1niM1yFcIHJZ
	ZdJcccjVHJ6VcaVw8kbjkqxs2ynPTFI5CZqJN7jCdhFLjpbKa8ADWsjYxjGFZDei
	Tfh1ag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftm75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so181833601cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702196; x=1785306996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yG3RAW2UmHvNScmd7UPrq6tcvvwfJPeN7NawmzDlzY=;
        b=LSY7GkPnE8Y+rrFFTBxh8oM08iakYPG/TxhQ5UewssNFvVo22yqGjCexR1hBcWswdM
         w+KzjQIfM+Azp2JC/90LetCmJO12YZIhwCD6AFIdsCphTVXJoLPc02OvDrw51WEWKf/E
         g3HTO+TNX0/X4s9OkDdKe6B+LmVHwPObVf2cOWoAVN67EBDhzZ7KDsxruBTmtdmWKe7X
         OZMeGpBqaxihJqhvYOxHTTQAv6FRTlGTPRf518ZBAhil2qpxIIzlfSHTSZ6BraCOdEct
         y1n2wwrf9kDutg+YCK4fvK/FMVxVPg3lNd6B2IMy8UUKVOaXuiv5PLqK3cF3d4UsB14s
         5D3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702196; x=1785306996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yG3RAW2UmHvNScmd7UPrq6tcvvwfJPeN7NawmzDlzY=;
        b=FHPLPVvQZpiBWkJp9BbP/iykwbxx6iRe7XrxPglRV6pDYUXYsEJCxXD11RxStb09QV
         SnPcCPn4+Dc9k66Yz2d5qeLgSthoGgBExjLdAnFKZR/7XXJoDZtehzcsI+16VdSdjVmy
         HZA2nrY/GZ3KsP1Hd9WA7lk5gJaMXZsXuLUJAb8ZGBSpoS0x7RGRkNZ92U29p6t5yYwE
         6k4/ZNTBXJWN16QwreaIeqvG5E4iri+JcTIN0wAydCZKpYs+eXXsO9/FisHWo+Xvy9Qa
         NPOTFMELVkndO6R/qq4kG4m6XMOsp/FvDQkCLL4WaKAwQJ0Lb6MbfQ7iKsvXvFlccb+5
         idDw==
X-Gm-Message-State: AOJu0YyEnAvb4deOFQ36OVTrAsW8hMmOHyAM8k64UaCKpYNFqFOk9bT4
	zTTBD4gwA1cn4Tdf9VJu8LaGLOXdflKlAUGjj7MhC3FkdE5bSDwB/lNSPMjhUoG6LlcY7owsJMD
	9hnIvTaU6Cp9JH17uNtzldrZs3zpviD6+yyNQGscc2mleZb14lhyCzY5GYcsprOLeh43GdRhCz4
	zj
X-Gm-Gg: AR+sD121wU5J5GTu3iNLQqOitDm75r9ZIl+VhWk0glWolSJ0opAForR0eOIsWRdJAzN
	bHZka0+AD7nEGNRoL1yAlGY/rB5aUMHPGhEGW83EjisfpDd+ikvJjfw4UaMN+A29rqK/8VwVBUv
	5oHRvaCZr7V4UiEIGAolLam63POgAEWTu9s0sxJ0DL59xKjVtZRUhduXFK1jl+8eKbzLlSKJJ6j
	Pu1y+6jNHVI23fmEgiFGGhRaImGZb+kJagkh7wE1OsSCtWVW95/5aYupNzrchxDZq2j5gnr18rH
	DQSfLleOWM+Ksxv6K18BTdtWsdhJn4IAUsF4FQh0123oxgeeAsxNRpJ1IKTFkMcIaJm4HaWlGmy
	kvbWRlwGyIn9KOuNvs+ZJGvTfBn+/EuUa6SPaKxSPODaQBoe9ZjVXPXbQ9+je7VkQqLUcUV6mwf
	MbCKObiuvnqQL6Yg==
X-Received: by 2002:a05:622a:2b09:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-5213c006b33mr212219861cf.5.1784702195962;
        Tue, 21 Jul 2026 23:36:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2b09:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-5213c006b33mr212219531cf.5.1784702195241;
        Tue, 21 Jul 2026 23:36:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:18 +0300
Subject: [PATCH 03/24] drm/msm: create the display connectors from common
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-3-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8599;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qvvzQGIvCJFBeyjflw7v8rndU0UY2akeaNn006NwjUA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1ZCyrOkDRmncvJrb3pdjN9zu85iavCiJTG8Wj+yqycHa
 0tdVi3qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE3GM4GNa2Fc0QXVCp4JDy
 9HXzh1q76X5ZNxbEfbLbuPlVi4xelJT31cyoVzF9Ew9tV5LfrB8o+y8pKeyi5+74j/4HGYq0Yi7
 x93ku4HIMmDdv3qzYH/m9ygUMr9dLXgrOC5rx6EXJesk+w9yCeRMZSiZbVe+QeK86b3njsQldZ9
 l2qRWHTr1sq/rNxpGR3W/OyuAfd5hSGA6sDbhispR5J2dh7xtNrY0nwl8aLppfuEfpYZRh0ByuX
 zfUvNoV/wq/m8RbaLDUpkXGg+fI7Q/usS9iZhom+d9T/hdnLLnKOjnT8uTmR9VRjSlX83ef+Nsd
 e2mXqZTC5FnCbXK6+d2TObsXtN/WnHiHPfXfh8xFNkxKAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tZgpBKpiaWvPkfd1SlCC2YjPlsZDuooS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX5EnkNsd9eGqA
 MWhypUv9qY0NK0JNJ4urSJN1d3pjepXjHr9Oktai+1lGKJhG4E78HmP0Sas3ucVHhydfmQReM9+
 xGyv+g7xdOS9fwguu2lybpCt7Xv/81j3yR715WBwRxiks4mHouIzFKQLjgRXNHTrQw+yHckI9QK
 KYhPyuTiFL2zP6qrxaWfmOKD8ZzECcEnc1i7pjEUAnzyU2rZaCnWwRUjIgVUwN6Q+vgKe66l0pN
 5L0p4hZUG/6hrleNQRO5Y1Knx+MtF91POqqTmBOHW7RyGd+zQS8ztlUjmfsxBQxozlA4e2L/vYV
 vORAslgu0gnWApjAMcdBWdUJrgFyfzVxDCfOgZaNdBuT63fQDhTRFP51oH+/IRQyMoJydla4MPM
 Ro4zUIYye009WiOLEAiWJN+ko2bIkCsOwV+Rb/Cp4adtA/x33qWGasY2v+8oyUl7vvk3sehfpZl
 yoXD8mMs58rfkDFG/1g==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6064f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=WN0DelYTnYdyuVf2XKsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tZgpBKpiaWvPkfd1SlCC2YjPlsZDuooS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX48UbeyiQVrjk
 LJv0XErhOD2hYHSS2OrSBsK3Q/p0HynqJgWZu8IM0d0OGSygrGroyKZrLD4Od2VMgbsNuoAdOE0
 ietvYKkV9QruuKQq+2as/5rm2piAyWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

Each KMS backend (mdp4, mdp5, dpu1) open-codes the loop over the DSI, DP
and HDMI sub-blocks and the calls to msm_dsi_modeset_init(),
msm_dp_modeset_init() and msm_hdmi_modeset_init() that build the bridges
and connectors. The dispatch, including the bonded-DSI handling, is
duplicated three times with subtle variations.

The encoder each sub-block is attached to is genuinely backend-specific
(the DPU builds a display-info descriptor, MDP5 requests a CTL, MDP4 uses
fixed CRTC masks), but the connector setup that follows is not. Have each
backend only create the encoder and record it in struct msm_kms, and move
the msm_*_modeset_init() dispatch into a common msm_kms_init_connectors()
called from msm_drm_kms_init() after the backend's ->hw_init(), where the
encoders and, on DPU, the GEM address space (kms->vm) that
msm_dsi_host_modeset_init() allocates the DSI TX buffer from are set up.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 34 ++++--------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 +++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  9 +++--
 drivers/gpu/drm/msm/msm_kms.c            | 60 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h            |  3 ++
 5 files changed, 78 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ede935a426d1..42dff1a98292 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -627,21 +627,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		rc = msm_dsi_modeset_init(priv->kms->dsi[i], dev, encoder);
-		if (rc) {
-			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
-				i, rc);
-			break;
-		}
-
-		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]) && priv->kms->dsi[other]) {
-			rc = msm_dsi_modeset_init(priv->kms->dsi[other], dev, encoder);
-			if (rc) {
-				DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
-					other, rc);
-				break;
-			}
-		}
+		/*
+		 * A bonded pair is driven by a single encoder; the connector
+		 * setup for both hosts is handled from common code later.
+		 */
+		priv->kms->dsi_encoder[i] = encoder;
 	}
 
 	return rc;
@@ -653,7 +643,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
-	int rc;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
@@ -671,11 +660,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		rc = msm_dp_modeset_init(priv->kms->dp[i], dev, encoder);
-		if (rc) {
-			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-			return rc;
-		}
+		priv->kms->dp_encoder[i] = encoder;
 	}
 
 	return 0;
@@ -687,7 +672,6 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
-	int rc;
 
 	if (!priv->kms->hdmi)
 		return 0;
@@ -703,11 +687,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
-	rc = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
-	if (rc) {
-		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-		return rc;
-	}
+	priv->kms->hdmi_encoder = encoder;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7726edb0d4ed..cd566a287f6f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -243,14 +243,9 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* DTV can be hooked to DMA_E: */
 		encoder->possible_crtcs = 1 << 1;
 
-		if (priv->kms->hdmi) {
-			/* Construct bridge/connector for HDMI: */
-			ret = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
-			if (ret) {
-				DRM_DEV_ERROR(dev->dev, "failed to initialize HDMI: %d\n", ret);
-				return ret;
-			}
-		}
+		/* the bridge/connector for HDMI is set up from common code */
+		if (priv->kms->hdmi)
+			priv->kms->hdmi_encoder = encoder;
 
 		break;
 	case DRM_MODE_ENCODER_DSI:
@@ -271,12 +266,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* TODO: Add DMA_S later? */
 		encoder->possible_crtcs = 1 << DMA_P;
 
-		ret = msm_dsi_modeset_init(priv->kms->dsi[dsi_id], dev, encoder);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to initialize DSI: %d\n",
-				ret);
-			return ret;
-		}
+		priv->kms->dsi_encoder[dsi_id] = encoder;
 
 		break;
 	default:
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0a004ab9fc85..68b71a7c6666 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -330,7 +330,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		ret = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
+		priv->kms->hdmi_encoder = encoder;
 		break;
 	case INTF_DSI:
 	{
@@ -360,10 +360,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		ret = msm_dsi_modeset_init(priv->kms->dsi[dsi_id], dev, encoder);
-		if (!ret)
-			mdp5_encoder_set_intf_mode(encoder,
-						   msm_dsi_is_cmd_mode(priv->kms->dsi[dsi_id]));
+		priv->kms->dsi_encoder[dsi_id] = encoder;
+		mdp5_encoder_set_intf_mode(encoder,
+					   msm_dsi_is_cmd_mode(priv->kms->dsi[dsi_id]));
 
 		break;
 	}
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..87530145e82b 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -260,6 +260,57 @@ void msm_drm_kms_uninit(struct device *dev)
 		kms->funcs->destroy(kms);
 }
 
+/*
+ * Set up the bridges and connectors for the display sub-blocks, using the
+ * encoders the backend created in ->kms_init().
+ */
+static int msm_kms_init_connectors(struct drm_device *ddev)
+{
+	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	int i, ret;
+
+	/*
+	 * The slave link of a bonded DSI pair shares its master's encoder and
+	 * creates no connector of its own; msm_dsi_modeset_init() handles that
+	 * internally, so it needs no special-casing here.
+	 */
+	for (i = 0; i < ARRAY_SIZE(kms->dsi); i++) {
+		if (!kms->dsi[i])
+			continue;
+
+		ret = msm_dsi_modeset_init(kms->dsi[i], ddev, kms->dsi_encoder[i]);
+		if (ret) {
+			DRM_DEV_ERROR(ddev->dev,
+				      "modeset_init failed for dsi[%d]: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(kms->dp); i++) {
+		if (!kms->dp[i])
+			continue;
+
+		ret = msm_dp_modeset_init(kms->dp[i], ddev, kms->dp_encoder[i]);
+		if (ret) {
+			DRM_DEV_ERROR(ddev->dev,
+				      "modeset_init failed for dp[%d]: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	if (kms->hdmi) {
+		ret = msm_hdmi_modeset_init(kms->hdmi, ddev, kms->hdmi_encoder);
+		if (ret) {
+			DRM_DEV_ERROR(ddev->dev,
+				      "modeset_init failed for HDMI: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
@@ -298,6 +349,15 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		goto err_msm_uninit;
 	}
 
+	/*
+	 * The backend created the encoders for each display sub-block in
+	 * ->hw_init(); now set up the bridges and connectors for them from
+	 * common code.
+	 */
+	ret = msm_kms_init_connectors(ddev);
+	if (ret)
+		goto err_msm_uninit;
+
 	drm_helper_move_panel_connectors_to_head(ddev);
 
 	drm_for_each_crtc(crtc, ddev) {
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f25b31e502d2..06646091604a 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -140,10 +140,13 @@ struct msm_kms {
 	struct drm_device *dev;
 
 	struct hdmi *hdmi;
+	struct drm_encoder *hdmi_encoder;
 
 	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
+	struct drm_encoder *dsi_encoder[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
+	struct drm_encoder *dp_encoder[MSM_DP_CONTROLLER_COUNT];
 
 	/* irq number to be passed on to msm_irq_install */
 	int irq;

-- 
2.47.3

