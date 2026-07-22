Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE233D9549
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702249; cv=none; b=cEjQJelYpYJ3isi2Nuq2DWq0vi62Sj6G8W/aYTeZiXkuh1BNsOeljjGulHzsBxpfpCtTCy+Okt5XJ9voYMej41YVMX2PgZ4fnKZZh3PIobLQpYqnTL+OwocgfIELz8uMjRx/cUB6Ywykh93TxyKcivXXKf7cXaU9/bgzj3zD0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702249; c=relaxed/simple;
	bh=vrk0zAkx3XteBl/zMHSAsYalFx0A87dpjiTf4rSceZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DMv7uhxkyU6NzWzIrb8Lp+iCYfSoytXAQuTsYh3Y8WJqYdgpbwm3ZQTPIwQD6q8pJbs7+OpataWXJXZjpBZw8Mjg2rn6B0Hi4KSaLfccbYBHWHQrqcCfSchPz4srpYVoFbqKgy69PZ6CD22q7RZqdLF2Q+0r7ElTVx9ej2yeSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMVVYsR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57sR5I/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMVVYsR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57sR5I/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53hZb4168826
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQWkOjb7s1/Nv6UGotHwKuaoEbTsQknHkswMzc3hyws=; b=BMVVYsR3DuBHH0Q1
	hiqS08YCfOqcHDBjxhsSJrxH5PYamaxjoBGu5de0zleuTdvJMmwljvcNRD632yBM
	1jkRCVwq00B4CG97JgOq4vc6AKYOpGY7EH9Ayvd2yfcVipy/2YEkR91ZEpKZwX7/
	1+JhiMKxn8l0kGE6UTeOF6U5LMKud/pQwRfjpAo6EvHimDkvFfjUMpD1p4k7Hjgj
	E3wWqgj4W7qKbwhsj8vNZAM+8OWovqC+oorm2E0e9VTRFIjVFEHc+LmPk44U28wZ
	C8LTPoKjvB8/cqzJl32CepnViUofalE1V9rvJIOcLgigH8WA6SLKpPkzxEyk52TP
	ijZkAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mpm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso187497121cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702246; x=1785307046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQWkOjb7s1/Nv6UGotHwKuaoEbTsQknHkswMzc3hyws=;
        b=h57sR5I/zM3rPOhMHeY5SJNTSKoxVoxV2fsi/R1u8fqFbn8alfw53iCuNh9+MFYvFE
         xQSKPO8P4YRrIKguyLe1y4Fz44WKzebFxjRjLAjX5OIVcNpE7khrbTeTL1d+g3rxrWy4
         T4yaLIXwS60par05HGJfnTyAIGpWLOrYK5ycnYVkx3BvW9VasApEXJu+FWH07FmCWeMN
         lyseWKOefg2vGjq640UFZoUvNV8a9dJjmR0ZH5sVwsdsRu17PSEDlzasvFSl8lFJSHOK
         Zi3nLbEXMqiCrmMd6ZUydQFxKn1bY9heqzmUVKM3j7CoG3AjPMa6t0sSbFlwyXwiMwqN
         brKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702246; x=1785307046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQWkOjb7s1/Nv6UGotHwKuaoEbTsQknHkswMzc3hyws=;
        b=IhMvzuybPdYRNqQxr3e0nd2CTHggKDtlUJu+e0ZF6PdJ7FFNZoFtk+0p5XtaUC//el
         KxdiGEZwDllpmHiSo1kS+Slx4M03IuK37BD+OIy3/zTcPKkAOlqtb2Q4nTTx2j/n06CB
         7s0GIeuIwtyUBmYcjqvIplQMQQMpeWW8AWSGfxihukCSqHDKQilEAy2Ds8T6abZv3kCA
         3HaNbZnd/jxWyc+s+v6PfpR8jAVzMqbMuSSUhyVrFPQ7SghEDJSBa70zXtY/jPxLoPuq
         H/NfWYAI8NOumovBdQmNEnAFnSW/SeOfBPYEUUBltAkBFxBKl4HUEPabrurUUXNC+wf+
         KAGw==
X-Gm-Message-State: AOJu0YxfQ/vqqmF4GQ7xDUwTYZ8S8Kw07TL1T6abakjWJcZsASnfFw4c
	iQIlnohqS/86GvmS0Yqku+zN1OhsaoK+WYkYxsWtrZAxXmnx/5/q5qhmKMu553wfx3EhuA9kXOb
	+bpCGw4AWbh33xHG68HTMR19GqOKk0PTlIyDraDGiF3YcCQcSHBwT62OnG1OblnqYU/35lf21Ko
	z2
X-Gm-Gg: AR+sD13yIIxHzqi/HDCjhTOW+wIbxol36fPrwoFMWA0FTkec5XHJSjoL64hYQJL5mm4
	Vcb5jXiE/ZshHfXlg0gSBy7Bl8mkNJB0q7qVUe7TSkkeVhk9undaPmYgiMw9u2/l330Uqfw6g4z
	XiMn6gGNVQwFQX06uzffh8OVwKLc7ziVM6euJDknDZyiZ/2xUo6xhhu8y3NN2k1w4B7MLFzEJ5b
	IxQYe5sgtt1m43wkq+vJ5pHB97qx+6ol3WDC0EqKSXufV4wilhImAUr9FnT3aAoQePiosCAPqyi
	je3PjJVXYnaWJngH7jqctP0BTOIOUUxVjCKwXUUyA5dirbxPI6YeZcUJkGoKs19PvvRUmBo9iTb
	IfZHAdIl7djnU3hnaEOWihXk0EJvKZyj3wKJZphu0tryGGid00IZYGMLCouhO+qn3Gs3osQoe0l
	g0olMDoJZfihIUkA==
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr203448101cf.25.1784702245883;
        Tue, 21 Jul 2026 23:37:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr203447931cf.25.1784702245372;
        Tue, 21 Jul 2026 23:37:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:34 +0300
Subject: [PATCH 19/24] drm/msm/dp: drop redundant panel->connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-19-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8683;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vrk0zAkx3XteBl/zMHSAsYalFx0A87dpjiTf4rSceZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTpwZg19pnYNYwwmnZyD1Iob53kPueOk/9S7
 uTOir7FvBCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6QAKCRCLPIo+Aiko
 1RCxB/0TJAx9rW7Zo9Jif7MP7sO3ErixKjMLFJOIMSqd4qeLuC8qaWCWIYEB++ScRJK/GMGWyvL
 WpJDEmQN87EgZEYdLlCY9WdkWskvFO16fdNDhLZi0Mu+LsKdHaVfLVV9LHDYFEAYMpGQQLwaVi/
 uYwbEbe7G3WZeyxBS8eEDIu/eb6inaDxpmbVqzSR/Hh9CUXnZ0ogFEO9/eb4xS85IRnDbrqeOgO
 8XbKPkEeX9xlQVRC7lW1Cr9JZLdUetjYfmBtyoy8dO2DsUlPVckwaRvedkb94aUBsahuFLkiRad
 jLRlABsrcKywTcvp4wCEhv7ro5fkwf0DEqnNK7ixylMgiFit
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX5MuYzFeVRMnb
 PkWM++fgBWApFLPB4iMaz4N+rj5y4XL9kYefq2LPLaRyDTo2GMau5vIFuxADDCiPLGrEnyCm7b+
 i6FeMFvtF+EZAHi8APoMcEzm1ekRmhh+izU3pDrDlJ6PIexdV5dmrvqBqmmiW7YqaYWv7v3EELt
 i5H0qGQAKu4cwOsGQioiGB/T/wTcTIXUD89/mH+edescNexUX+csSHd/WTjcK3/pNMR5pgbMdHq
 tZvWE6wFp+DMQpp/3wMm4UQY0xMlmHFwE+yNL0M7FqOaR8xciJjpSSGVTU04oJaxIrKBaUdIK1q
 9t79hfadCkzN0lToWUlV6IESudWg0qNh2vy/xoOFjUf421I9YNoqscs54gvDw2OuVLA6qIMoiIU
 rLxBHvGy6vMuN9wJc9ivOeGMBbGkueXgc0sFRU8C6XDzUvCYCKm04v74RxMP7nmXuOOOuvZMvDL
 5Yp5h9XPhqm6ozRoIWw==
X-Proofpoint-ORIG-GUID: _b2lQ1K9p19Apw1zZvMxcQm-Uwzpiw5z
X-Proofpoint-GUID: _b2lQ1K9p19Apw1zZvMxcQm-Uwzpiw5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX2PeLyfL4M9p0
 u7GZlKIv8Z7Y9DRRiflSnz79eBzHdxZwsQOCDtGEnoVQTKBuWPYn3OYuq0w0WAqyQEs8NVT55WG
 yVcy73mZErRiqlrhFNc0uFjvH5k+7pY=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a606526 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zDF9bxl-6Y4pHeVFKNQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

struct msm_dp_panel kept its own copy of the drm_connector, a plain alias
of msm_dp.connector assigned once in msm_dp_modeset_init(). It was only
dereferenced in three places, each of which either already has a
connector at hand or is reached from a caller that does:

 - msm_dp_display_set_mode() runs from the .atomic_enable bridge
   callback, which can fetch the connector from the atomic state;
 - msm_dp_display_get_modes() is called from the .get_modes bridge
   callback, which is passed the connector;
 - msm_dp_panel_handle_sink_request() is called from
   msm_dp_display_process_hpd_high(), which holds the connector.

Pass the connector down to those functions and drop the duplicate field.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 ++--
 5 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7f55cace596f..461420a72820 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -304,7 +304,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
+	msm_dp_panel_handle_sink_request(dp->panel, drm_edid, connector);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -600,7 +600,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 				   const struct drm_display_mode *adjusted_mode,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   struct drm_connector *connector)
 {
 	struct msm_dp_display_private *dp;
 	u32 bpp;
@@ -611,7 +612,7 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	if (msm_dp_display_check_video_test(msm_dp_display))
 		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
 	else
-		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+		bpp = connector->display_info.bpc * 3;
 
 	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
 	msm_dp_panel->msm_dp_mode.v_active_low =
@@ -619,7 +620,7 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	msm_dp_panel->msm_dp_mode.h_active_low =
 		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
 	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		drm_mode_is_420_only(&connector->display_info, adjusted_mode) &&
 		msm_dp_panel->vsc_sdp_supported;
 	msm_dp_panel_init_panel_info(msm_dp_panel);
 
@@ -769,18 +770,14 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-int msm_dp_display_get_modes(struct msm_dp *dp)
+int msm_dp_display_get_modes(struct msm_dp *dp, struct drm_connector *connector)
 {
-	struct msm_dp_display_private *msm_dp_display;
-
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
 		return 0;
 	}
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-
-	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
+	return drm_edid_connector_add_modes(connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
@@ -1350,13 +1347,10 @@ static int msm_dp_modeset_init(struct msm_display *display,
 			       struct drm_device *dev, struct drm_encoder *encoder)
 {
 	struct msm_dp *msm_dp_display = container_of(display, struct msm_dp, display);
-	struct msm_dp_display_private *msm_dp_priv;
 	int ret;
 
 	msm_dp_display->drm_dev = dev;
 
-	msm_dp_priv = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
 	ret = msm_dp_bridge_init(msm_dp_display, dev, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
@@ -1373,8 +1367,6 @@ static int msm_dp_modeset_init(struct msm_display *display,
 		return ret;
 	}
 
-	msm_dp_priv->panel->connector = msm_dp_display->connector;
-
 	return 0;
 }
 
@@ -1438,9 +1430,12 @@ void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_display_private *msm_dp_display;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_bridge->encoder);
+
 	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_bridge->encoder);
 	if (!crtc)
 		return;
@@ -1451,7 +1446,7 @@ void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 	 * state and runs before the bridge's .atomic_enable(), so the mode must
 	 * be programmed here, in .atomic_pre_enable().
 	 */
-	msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
+	msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel, connector);
 }
 
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 8c34a473c7db..f1523dbe33d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -28,7 +28,8 @@ struct msm_dp {
 	bool psr_supported;
 };
 
-int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
+int msm_dp_display_get_modes(struct msm_dp *msm_dp_display,
+			     struct drm_connector *connector);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index da005babe411..8dbe7d682ddf 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -32,7 +32,7 @@ static int msm_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connect
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	/* pluggable case assumes EDID is read when HPD */
-	rc = msm_dp_display_get_modes(dp);
+	rc = msm_dp_display_get_modes(dp, connector);
 	if (rc <= 0) {
 		DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bde4a772d22c..30a44e7e8e62 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -305,7 +305,8 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 }
 
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
-				      const struct drm_edid *drm_edid)
+				      const struct drm_edid *drm_edid,
+				      struct drm_connector *connector)
 {
 	struct msm_dp_panel_private *panel;
 
@@ -324,7 +325,7 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
 		if (edid)
 			checksum = msm_dp_panel_get_edid_checksum(edid);
 		else
-			checksum = msm_dp_panel->connector->real_edid_checksum;
+			checksum = connector->real_edid_checksum;
 
 		msm_dp_link_send_edid_checksum(panel->link, checksum);
 		msm_dp_link_send_test_response(panel->link);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 53b7b4463551..f73e11e57ced 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -33,7 +33,6 @@ struct msm_dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct msm_dp_link_info link_info;
-	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
@@ -51,7 +50,8 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
-				      const struct drm_edid *drm_edid);
+				      const struct drm_edid *drm_edid,
+				      struct drm_connector *connector);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);

-- 
2.47.3

