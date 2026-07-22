Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ACD34B437
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702194; cv=none; b=gcP9nCt3v56tyuAugVnR6AsFwpQcaSexmtOKZ0axB7QEWBXZ72MWqInCOcI3PW/8y12vn9pQ/eWJl2XsndR30f42m6lu3txouxt4yrLHU+RApSWWAJMFCSRaAogOWB/TguY5uP3tJYVfUGjgBj88KwjLW64UxzFCpVrAizpYkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702194; c=relaxed/simple;
	bh=xwiwed+YWzAlxad0yWcCPqbevU3q9KR+updrF6TdV7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRTi/NoKahXxFqcEbi1CbsBiQ2OS6xfLJaaYJhLHfgKW8WOVQOVDhM6YUmJ6CcHJzfIPS3P9+oAu5zyqcwRJ8HdAOjaipMdxuc33GuqTZ+mVZ6dj1q2ItYclfM7Zq0Kkbm6XttnU77Nb9KaPOftMvurdd0aIBDyt0eJ/ph1EJ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0dK7G7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYwPDVBP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0dK7G7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYwPDVBP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M548G64027826
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeNdAJLI50rwT6a6MA64hU5opQaYoTEBW1fpBic2B3U=; b=P0dK7G7rYPmB6TLy
	NDh9Xy0gn0SzcTa+Iqq+oMawFR0/rw7XccM29K39fo2zp0neGNI+DQPV6wlWZCEc
	1LUttBlICu0q5U87xKgjAhtLwRIIAw5BnySh26/3WHC5bdX1TWAy7+sTq6NypfNj
	bx3we3V5szCRyFjLQd92nNYJlZ/2S0u0cXtAwrq/sErJgz7oASyCDX1eQ9PCKKoN
	43KuE+/a//gWhVes/DZP6w76rce4kf1b6vGoQSmyYFaHFnX1LS//yWRyaTHEQX4+
	/uVNM7aVD3mylVoCIwC1eb/PI85ztJ7kWORKgghmyUXduFAuUt07cI+xyXOjA1no
	UshReg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbvgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so144224911cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702191; x=1785306991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeNdAJLI50rwT6a6MA64hU5opQaYoTEBW1fpBic2B3U=;
        b=GYwPDVBP+JiKGvqzj0z1iJ+1qZebBC9NNKAh5L6FrM5ZQYc4RxUhoEPKIZcCa3Hawk
         6DqGdotNMKoCxgA8EkzBdv4ReJtsNIXk6wICh8G2PAu34qUtTzRCvaUJ47fK1XEGrRlG
         yY7QGdr6pt1uh1WkeX9DAoG6QJKT1KgVQYXAwMwLnfSkv5bJW9RpkpprJ5lzdbr7+rNX
         NEZ8qW/0m3WzygfB16/wTWFL6+7nm2X2c4Utu6WB2BwB+dvzf/UJty4vhyguYc5Qgvqm
         HU/QrRsFldt8LqSTeWsbcxq7gBOIcNLjlP0KlM60EJvU6UgKs3HmgzhtQ9helDQJQZ/i
         kMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702191; x=1785306991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeNdAJLI50rwT6a6MA64hU5opQaYoTEBW1fpBic2B3U=;
        b=jQr1xVhY9+sG9V//kfsg7qDo58viBbIraBFhBUJAtAqJhVNo+Q2KYnsYpcbMMJbVJi
         0H4274xW73iGfs6743VYqSxPAcZzkXH8rEvKU6s56TjviDzDLaEh42Q9rjZBBa1Hj5JJ
         bvneDLxWucFyc+vBrosZaf3KaEecNmoo1U5keLr18Bk3gmMv6eME51ahI/zWSKDzQKZD
         7JNdquhRDnXZgiiA7vK0G3x+DLtZk3zwbDmxhSVNzg79p5gIPgjP7ef/1vjXRDtHA6d1
         ii6bWDw5z2hBrGej4CcOA6JLV66Yxjlcdhf/ah6w5224I+Keth8jGVbl3tkRT0pvVL+p
         y8zw==
X-Gm-Message-State: AOJu0YzyEy47qgZ3avKUVg/w/WyPWt8iz6m9glf3dpl9QWVnnxpDjYqm
	R8hKnVhmf4dq1ysm6Wwlsjs+9aUL8PaFab5Vfr7Rfw3ioLvkBlUQ5j01yGtg54gOh2Zy2SDmZf6
	UTx1Lp76qy7CdG9uUUe8QT0hHEM6US4QVz5S98q6Ny6cWGmb5RjCBrkd/Vj+tVAEjNAmBvFnMcY
	Kp
X-Gm-Gg: AR+sD10NmU9uOyZ7B9T3kL8qTvKBYedckjKrEZF92j/5R2WztgIMGHHgkbUwOxzKBih
	ZQGMxtlSTgCglWXAT110ynGp7LKofVTe4uFqKrzPNehFXwvjKXk94wzXT1dsQiqCgEZXeowgQs5
	wuVeKThuEs2eDszdErOmzzivoUX2L8PGYEHl36LvGd/+CBGNcBnuOkYnMknXaZd4nmZke4qGDBJ
	yUe9PW9zWOydJluVZXsgK/gxy2kDhhhNngRpQl+hz4/UjJPugOwiAR39bL6zUU+uVqvCL/0fxru
	7zzd2qt4W40RVT+IaR2T5WjRMhwzO382rgZOEXR5hJXGmUfWfAmATbw3oEmTGb0HCyPkJECTtDh
	e0a0rOrRQDv9qRydwRQgMx6e0Z3mzRaKsMpuS8zxy6pOCE2zo8qbnRolsAuFxro2O7KHTZNzZHu
	2CvbJwZc4HpbTsQg==
X-Received: by 2002:a05:622a:1c09:b0:51c:7b12:5fe3 with SMTP id d75a77b69052e-5213f174546mr197315691cf.79.1784702191332;
        Tue, 21 Jul 2026 23:36:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1c09:b0:51c:7b12:5fe3 with SMTP id d75a77b69052e-5213f174546mr197315491cf.79.1784702190862;
        Tue, 21 Jul 2026 23:36:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:16 +0300
Subject: [PATCH 01/24] drm/msm/dp: reject YUV420-only modes without VSC SDP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-1-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xwiwed+YWzAlxad0yWcCPqbevU3q9KR+updrF6TdV7A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1ZCyjPlhP1iD85plJTrXns08/XsY2v6mg54ifpFBKhMj
 OUXKg7vZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEShnY/8oekhVL0L25MOy8
 vGP+i/Q0/205sRxlVre/zRfoiA7btz9P/MO6mEc3f7LHGVa0513aacgnnlzH+sBvWvnv/WvFox1
 9QxoctwodkNlZ6/uy5tCjvjD/SYe4xO9ITq9lPPRHZI9dRlbtqhiB1wW9xeeLS6bkzTHSX2CYbG
 fzPKTilYzvuUsa0f/39U/2TVU9dTJ1ideNFlWNy6V3dN8eDbUrfKTlpxTXyejtvlTfQ8Woeff/Q
 IZ5lZMP+LW6ytyVfi67OnWnTM65nQrcB9Km/ONcKS6+Zd57ZcVA5ulV+7fECnNu3pP8p48n4sYP
 O/3krpNuStdNJ/1fKxjfzFywe0UAd8DqJws7xTL+2FUAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XBG3mzP9UY0R0pO1ZR8oKQVhnpf73VRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX9Z2uDKPkVKBM
 foi3C4tzuGzrs0QjXw/Juh/QKhGOSFW9ptYeQ/aWQq2qyY5twFuMnawRGlQoU+34BwE90RD4hCu
 JUeCk2kSPHzFdsOPnu/5DcSyeE1YWPYcTrfTFZnG9SNLf4pKfeQyj9UaXlgWEvt2wyiLF4b7HGX
 FxZEwCfu2o6dMpgoNUwM77rDh3vsi6PJUU2pbJ+7v/ni32OYeeETth51MjSeFiwnmQzr3gm9Jnz
 K780Fa9PC4rgs4AZF8kCV4hsDYRCHDTncWPILBHFiZeOTPfqAuYzcoTTH8Wz24c9XfQjMXdT/ts
 YeT/AyCOLnHlRZvW5mSaQFJYUGtu8mXfMI1zySvbLEqmUpmlKilMEbsDfrKlXHzpY7x/DMb0hsv
 1+GMFSnrAgfwdOTiIws4H5ThSDyCUY754QtSHgqZG56cOJ57cUMEszj/Lqmdx8C8J7oQmV2X03T
 GtJWqAp0/Te6CxlEQuA==
X-Proofpoint-GUID: XBG3mzP9UY0R0pO1ZR8oKQVhnpf73VRn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX6dp07ReY+s+O
 KKzn/cQ3LDevYIhshLnelO/5lPUUFfvSbHw9wp9/ktcS2acDUNKdkn0Vw1afvjc99Sr45LeKMD4
 8145qlel6q1tWDWOkqfevlasywZfiEg=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a6064f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zXqIQI19J2VV67nQZaQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

DP conveys YUV 420 colorimetry through a VSC SDP. A sink that advertises
a mode as YUV-420-only therefore cannot be driven at all unless the panel
supports VSC SDP, yet msm_dp_bridge_mode_valid() only used the VSC SDP
capability to decide whether to halve the pixel clock, otherwise letting
such modes through to be validated (and possibly accepted) at the full
RGB clock the sink cannot display.

Reject 420-only modes with MODE_NO_420 when the panel does not support
VSC SDP. With those modes filtered out, being a 420-only mode implies VSC
SDP support, so the YUV-420 test reduces to drm_mode_is_420_only(): drop
msm_dp_is_yuv_420_enabled() and call the DRM helper directly at its two
callers (the DPU encoder already has the connector from the atomic state).

Fixes: df9cf852ca30 ("drm/msm/dp: account for widebus and yuv420 during mode validation")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +--
 drivers/gpu/drm/msm/dp/dp_display.c         | 28 ++++++++++++----------------
 drivers/gpu/drm/msm/msm_drv.h               |  8 --------
 3 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 778e231d4967..1f20695f81e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -710,8 +710,7 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
 			topology->num_cdm++;
 	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->kms->dp[disp_info->h_tile_instance[0]],
-					      adj_mode))
+		if (drm_mode_is_420_only(&connector->display_info, adj_mode))
 			topology->num_cdm++;
 	}
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dc6f33809ca5..e0c44eef3aba 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -698,6 +698,7 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
 	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
+	bool is_yuv_420;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
@@ -709,9 +710,16 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	link_info = &msm_dp_display->panel->link_info;
 
-	if ((drm_mode_is_420_only(&dp->connector->display_info, mode) &&
-	     msm_dp_display->panel->vsc_sdp_supported) ||
-	     msm_dp_wide_bus_available(dp))
+	is_yuv_420 = drm_mode_is_420_only(&dp->connector->display_info, mode);
+
+	/*
+	 * YUV 420 is carried over DP by signalling the colorimetry through a
+	 * VSC SDP, so a 420-only mode cannot be driven without VSC SDP support.
+	 */
+	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
+		return MODE_NO_420;
+
+	if (is_yuv_420 || msm_dp_wide_bus_available(dp))
 		mode_pclk_khz /= 2;
 
 	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
@@ -1277,22 +1285,10 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&msm_dp_display_driver);
 }
 
-bool msm_dp_is_yuv_420_enabled(const struct msm_dp *msm_dp_display,
-			       const struct drm_display_mode *mode)
-{
-	struct msm_dp_display_private *dp;
-	const struct drm_display_info *info;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	info = &msm_dp_display->connector->display_info;
-
-	return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
-}
-
 bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
 			       const struct drm_display_mode *mode)
 {
-	return msm_dp_is_yuv_420_enabled(msm_dp_display, mode);
+	return drm_mode_is_420_only(&msm_dp_display->connector->display_info, mode);
 }
 
 bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3787db8770ad..3d5679be488e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -356,8 +356,6 @@ void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder, bool yuv_supported);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
-bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
-			       const struct drm_display_mode *mode);
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
@@ -382,12 +380,6 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
 {
 }
 
-static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
-					     const struct drm_display_mode *mode)
-{
-	return false;
-}
-
 static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 					     const struct drm_display_mode *mode)
 {

-- 
2.47.3

