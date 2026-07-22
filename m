Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2C3B388E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702220; cv=none; b=OdnIijNJLJMIFoNAP3Xcqc5At/ydK0EiGDPFhQsSabLIxXAewZqx8rHzYmk57RnTKJmohzhZVX4oHDT3H52NoE1n4KiYB0d+WghN8OTw452QZ5c8bh3vQ+AK1Or73xTRQGhHEWBTonUywWaTOy95qegUtjMN2HG1zSQuVmH2lCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702220; c=relaxed/simple;
	bh=2uXfUn5g7kRlwm21Pr9tBhdKWBQ199h8b1vj9ghErGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izNXeQJe2abSrpFOFLlPI0//IT7tzlVjG+XpE9jgtM8bxLV8V84/gPRz8i+Lg5p8eBfrIuHIF1Ksax6XNWZCJS9Z8nguL2yEfyehwpsKByxfPWydHaWeIAUxzo3Mt1uFON4y+Y6tw3BDgVhOcssDRSU12pNfN9Fu2ddM3Ujlkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oePr3/Vt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ulq0dA7a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oePr3/Vt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ulq0dA7a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53h3l3917564
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnFqMPIwhl9ESQYxC7SAYAMToEfuxgRlxIUeZ483144=; b=oePr3/VtTbd/9p3c
	uQdXguzxISS9GGDiyM9ynFZJ/XjmVFomJ/lYsF256yZItM7PHTybpqPuxeg3RcYA
	uJdbMdEPaiBDKaCh+CWqMmYF3cqegN8jbvt0IaUosYcFVpFpd81klhg3pc2OjCQw
	dVXnyNKgR45lco22HhNjLA2tVtTMTZciIhPHWNDhxbM7nysyfv9hCKeKrdQ+So46
	2n2BuMFeUDzWKNA6MfKlg/DGwzbPZa1yP1Bde11UpExgs1UdFlTdC4KM94t80mDn
	wS+bI/+nH+gIspHnsoSbNVlfWqCHR0uPp3nB9rP1lWwMjYHPMCD1RHPeDlCtg0/c
	WcNKwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aahse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso239255501cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702215; x=1785307015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnFqMPIwhl9ESQYxC7SAYAMToEfuxgRlxIUeZ483144=;
        b=Ulq0dA7afT55dtf2IyLrManrCpL0zylPfJeQKu2ScHv1EAb66AlQGgG8EQtSRyGo8P
         f+0soEQmFlBR9PuAtqs35yFDdZKedhBEyMM7o2lR1ErNfJHCt05MY+BpGXwkHYUY9GtP
         gAwYVTBGhTUP6uAp4lHAoE97t94mhaTI+u+UxtQlRifxSoN0Drh9jAZvYko1PZVsHcQt
         itvGj5y67zHU+MtDikXyUYreK/w0oLYB1CTiB1HA9rjJA16p6GQmUJox6aBuMB+omMDZ
         146HuHei55VXIF/a414tet7R8mlSsW/mN/mOvSGuqb1AfDfNVhcrxFG2qtMNNUr/ZFe9
         ImOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702215; x=1785307015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnFqMPIwhl9ESQYxC7SAYAMToEfuxgRlxIUeZ483144=;
        b=PtTrhm6SD1/4I1v45RSoiJ3hcTA/m/yrYnkdzyLLoi8qO61KjQjpnf3/kWqLUAEBP3
         ckdjiHQ+07wPTLExL5kxG68JXu9VgMruPyNLmCL3/uHMBVTRX/TvuNLUdUN64xjpTj/a
         F86H5hE2qr9FVZzRkjh7CpwbjlGbpbyYJSTy8nQgSuZDOBX09/ZQuy1Du+3maGDHTRSn
         Ll82aaRbLcGXv77vHDr+PJSzkKAR1h/Ohxx3h3lsSCGGm2Ht989lMvlJzdoGMVrJ3SjP
         dGMyeievYlmwaLBFfnKJklEyCRXQxW+4lT+zzzCIzhra5oj+WV0AkMxKu05wzFnEEr71
         P3NA==
X-Gm-Message-State: AOJu0Yy14Obc/sDF/ifvVkvClReaMrtBVSgnwXYAvoyvf2IAfnstl3u4
	vSAefKc9r5gfuxW3glBPEa14UgE/L03unAThMNvJvNyAJKCKSzgPAwze9P77iv4SCIAajjKChvV
	3oYvgiWQ+CdtyGK5ccupc83RzXJgQHFlM75ozCcwyYLp5PevY/QQV9FcO3Qck3jKr/f3T04rBv8
	Ky
X-Gm-Gg: AR+sD10/bVd/TRGREIjRKxRSq9Ligc5e/kWs+ED3MXmcHoRuPfVR0XNKmVO69c9kiLq
	0tFn8bgEZLnwKQBlFc+q+o2AJkARBqWYjERX3IDAzgD5UKT57zCJe8vNLwvjfWhhYw5WuVQ5vzl
	Q3RLFZJaaHmkJ8xveJ/V8/0Bi7r2vlrpg8kjKCcxGrnNZZKUUhgnIe3quTipPESStzNRkhMr/kM
	V5abHBHHCbyBYKEwc7aeEsGokoXObjeTRhe4ki6a+dMMwiMD3yxquUg/da/2Tvx9JBIySpl7XIi
	ggGOZVMEKuv2voIEzxFPnNsUPoNOynbPGfF9MFWffVrlkGpBQnq2DglSMeMFy+PvySUSM1NzPJ2
	MBJWv9nEOV6SVAM7ixboQcXCdiS0hWzhcLMQYew+SVl5xEcN5F8yk1B6wuI9r18C242T17lCYRT
	Z0dYwj1qnKxmNF0w==
X-Received: by 2002:a05:622a:2517:b0:516:dff5:68c4 with SMTP id d75a77b69052e-5213c008207mr199181471cf.7.1784702215125;
        Tue, 21 Jul 2026 23:36:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:516:dff5:68c4 with SMTP id d75a77b69052e-5213c008207mr199181121cf.7.1784702214660;
        Tue, 21 Jul 2026 23:36:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:23 +0300
Subject: [PATCH 08/24] drm/msm: add the needs_periph_flush callback to
 msm_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-8-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7968;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2uXfUn5g7kRlwm21Pr9tBhdKWBQ199h8b1vj9ghErGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTnXge1bBgGka1roOOJfkQGuKiQpSpfSTOp6
 wPoENWyq2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk5wAKCRCLPIo+Aiko
 1VwXB/90SZS2MJUkkk5cwpAYTgeoMq1uX2oGAQaTPQb6gpLSr6ud/GRotHgpeQPptSUkHivuVzy
 o/MTk2OpQJRy6jRwOLsNVNAqCafwhji9IM5A2rlEk5Vs6na3ESNVcpriGifUiZdlLlD1ZNfkJi7
 vHptat35d/gIyNsrDYNnL7sOgt6wYyrh1TjNFvZwc0t8+Uq6GSuk0qK72WcM/k8BMDB5mIBifgb
 JZJJ/wZsVUWIjGab3iNiM+gWHxbhwpc1vIk9H/RmVTObw92EPt6cTYto6BhcUUQavbEaxDHcLFX
 JPvgM/atAwFNbZ0QfobExXiPhsEQMlFn99JB6TN0FZ32WDp2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX1aiMcy0J7lHY
 gK6UydYLu8z+2+NvTubcbhQ989UfADWcPcoAdI+L3Lmokcb3+3yonz+8SET7Fq+J4G8C7yZw4A6
 nbgbp1eoJ4iAocIAr3a526eogAVvCRMTeqm0sSgpbCSvs5Pa3ANNCrl1AjQuUYEJ/dS1+AmxbH8
 n+AMSyAWk6/L+I8JmaIYGOJuWtp7mzzkGIxz1zxvX+V3XKJOx1ExALhSUoWYIwekLdRpRsVohXU
 BusSBYnxZllP/BdJgB5uWXwdm6ojGSlbtUqwYK9ZZ334Yt9stDobmYnGvq4vIV2BIa+CVjIVpNM
 MH6Py116WK2nG6+N/HUQfU55zb/oXjB4Q/WzjNXjfkksFUSZ9MVHkS+aGdw/WYN/mbnSZFUm3Rl
 oJKHCL2ZSF8uMmRKVOVf06qZdecKG7OOct9IdqrJp/ZdiDazNZX7nIqYR012P2YRpgvjQfNvbOX
 nXHQhfZTkVF4gzpCbUw==
X-Proofpoint-GUID: DzK7ffQXgZCYZDxcyV03yOnKo2yPi4Ge
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX2pTuFroRHcoM
 t5Ta9lxBDIo4BeMXj6AqdYZ2pMsc7x3C81tQ8wnQNwF/0TyuKv448DmEacUL3HBjrQOxQOmZurB
 jAF40VITsghodEQ/vt0rPOLGhlco1pQ=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606507 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3NYe07cDTqo7tWFtHwUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: DzK7ffQXgZCYZDxcyV03yOnKo2yPi4Ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

dpu_encoder_needs_periph_flush() switches on the interface type to call
msm_dp_needs_periph_flush() on the DP sub-block directly, hardcoding that
only DP interfaces ever need a peripheral flush.

Add a mandatory needs_periph_flush() callback to struct msm_display_funcs.
DP implements it (keeping its internal msm_dp_needs_periph_flush() helper,
now declared privately); DSI and HDMI, which never need a peripheral
flush, return false. The DPU encoder now looks up the sub-block and calls
the one callback.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 49 +++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_display.c         | 13 ++++++--
 drivers/gpu/drm/msm/dsi/dsi.c               |  7 +++++
 drivers/gpu/drm/msm/hdmi/hdmi.c             |  7 +++++
 drivers/gpu/drm/msm/msm_drv.h               | 11 ++-----
 5 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ce358c1c9757..09bf959b2ca7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -245,29 +245,6 @@ u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
 	return DRM_FORMAT_RGB888;
 }
 
-/**
- * dpu_encoder_needs_periph_flush - return true if physical encoder requires
- *	peripheral flush
- * @phys_enc: Pointer to physical encoder structure
- */
-bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
-{
-	struct drm_encoder *drm_enc;
-	struct dpu_encoder_virt *dpu_enc;
-	struct msm_display_info *disp_info;
-	struct msm_drm_private *priv;
-	struct drm_display_mode *mode;
-
-	drm_enc = phys_enc->parent;
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	disp_info = &dpu_enc->disp_info;
-	priv = drm_enc->dev->dev_private;
-	mode = &phys_enc->cached_mode;
-
-	return phys_enc->hw_intf->cap->type == INTF_DP &&
-	       msm_dp_needs_periph_flush(priv->kms->dp[disp_info->h_tile_instance[0]], mode);
-}
-
 /**
  * dpu_encoder_get_display - find the display sub-block driving an interface
  * @dev:        the DRM device
@@ -294,6 +271,32 @@ static struct msm_display *dpu_encoder_get_display(struct drm_device *dev,
 	}
 }
 
+/**
+ * dpu_encoder_needs_periph_flush - return true if physical encoder requires
+ *	peripheral flush
+ * @phys_enc: Pointer to physical encoder structure
+ */
+bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc;
+	struct dpu_encoder_virt *dpu_enc;
+	struct msm_display_info *disp_info;
+	struct drm_display_mode *mode;
+	struct msm_display *display;
+
+	drm_enc = phys_enc->parent;
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
+	mode = &phys_enc->cached_mode;
+
+	display = dpu_encoder_get_display(drm_enc->dev, disp_info);
+
+	if (display)
+		return display->funcs->needs_periph_flush(display, mode);
+
+	return false;
+}
+
 /**
  * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
  * @drm_enc:    Pointer to previously created drm encoder structure
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 04d291a93d20..773dee9d0be4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1290,8 +1290,8 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&msm_dp_display_driver);
 }
 
-bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
-			       const struct drm_display_mode *mode)
+static bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
+				      const struct drm_display_mode *mode)
 {
 	return drm_mode_is_420_only(&msm_dp_display->connector->display_info, mode);
 }
@@ -1361,10 +1361,19 @@ static bool msm_dp_display_wide_bus_enabled(struct msm_display *display)
 	return msm_dp_wide_bus_available(dp);
 }
 
+static bool msm_dp_display_needs_periph_flush(struct msm_display *display,
+					      const struct drm_display_mode *mode)
+{
+	struct msm_dp *dp = container_of(display, struct msm_dp, display);
+
+	return msm_dp_needs_periph_flush(dp, mode);
+}
+
 static const struct msm_display_funcs msm_dp_display_funcs = {
 	.modeset_init = msm_dp_modeset_init,
 	.snapshot = msm_dp_snapshot,
 	.wide_bus_enabled = msm_dp_display_wide_bus_enabled,
+	.needs_periph_flush = msm_dp_display_needs_periph_flush,
 };
 
 struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index ce3b261123ea..085e202bf7e6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -24,6 +24,12 @@ static bool msm_dsi_wide_bus_enabled(struct msm_display *display)
 	return msm_dsi_host_is_wide_bus_enabled(msm_dsi->host);
 }
 
+static bool msm_dsi_needs_periph_flush(struct msm_display *display,
+				       const struct drm_display_mode *mode)
+{
+	return false;
+}
+
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
 {
 	struct platform_device *pdev = msm_dsi->pdev;
@@ -282,6 +288,7 @@ static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.modeset_init = msm_dsi_modeset_init,
 	.snapshot = msm_dsi_snapshot,
 	.wide_bus_enabled = msm_dsi_wide_bus_enabled,
+	.needs_periph_flush = msm_dsi_needs_periph_flush,
 };
 
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5f24f778c7ef..72f7403265f9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,10 +233,17 @@ static bool msm_hdmi_wide_bus_enabled(struct msm_display *display)
 	return false;
 }
 
+static bool msm_hdmi_needs_periph_flush(struct msm_display *display,
+					const struct drm_display_mode *mode)
+{
+	return false;
+}
+
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.modeset_init = msm_hdmi_modeset_init,
 	.snapshot = msm_hdmi_snapshot,
 	.wide_bus_enabled = msm_hdmi_wide_bus_enabled,
+	.needs_periph_flush = msm_hdmi_needs_periph_flush,
 };
 
 struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 519571170207..806d72ed393b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -285,6 +285,7 @@ struct msm_disp_state;
  *                mandatory.
  * @wide_bus_enabled: whether the sub-block drives a wide (2 pixel/clock) bus;
  *                    mandatory.
+ * @needs_periph_flush: whether @mode requires a peripheral flush; mandatory.
  */
 struct msm_display_funcs {
 	int (*modeset_init)(struct msm_display *display, struct drm_device *dev,
@@ -292,6 +293,8 @@ struct msm_display_funcs {
 	void (*snapshot)(struct msm_display *display,
 			 struct msm_disp_state *disp_state);
 	bool (*wide_bus_enabled)(struct msm_display *display);
+	bool (*needs_periph_flush)(struct msm_display *display,
+				   const struct drm_display_mode *mode);
 };
 
 /**
@@ -372,8 +375,6 @@ struct msm_dp;
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 struct msm_display *msm_dp_get_display(struct msm_dp *dp_display);
-bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
-			       const struct drm_display_mode *mode);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -388,12 +389,6 @@ static inline struct msm_display *msm_dp_get_display(struct msm_dp *dp_display)
 	return NULL;
 }
 
-static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
-					     const struct drm_display_mode *mode)
-{
-	return false;
-}
-
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.47.3

