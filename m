Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85C391E4C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527875; cv=none; b=TX+zO7zdkzJq3LTlVJ+6bvOQz47Ces32KQH3lDNHju+q8TM5YjNe/yc8mDlym+a7cSMT5ojGJH5PatIA59W4oNxv5Wd9+i+MOMIx1wN/a7jEqlQJLBHCCOLdY7ffJA7eRV48B2iXo1DNF8QsQ3tQx48EXhYkk88EngAzp0KGZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527875; c=relaxed/simple;
	bh=fjfAwVLsdfXG3E29OVHK9sjfJONiXlZlAdNcpfnkhYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eyv0yDIcaNUfe2b9QV5xOOMkoDc84e7G0EWbJpCNwNl9QIbp+atv8lNjEJoGlLf421WDjqbiqlYKE2ClMehFpV1mG68MY6ULl4UAWLDXQ8Kou81JqKzECZhMHXjs4c9NKtnGXu4pD40cvPFVp6R1MbBkUoJgSngm++UsEUlK8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXQCIhXU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6F89mC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXQCIhXU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6F89mC5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtS6f805640
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IF3qUvx1/jD02Z3xEjWvYCh3QU/bPLh9lfZzorOGlGs=; b=dXQCIhXUG3EFYJ2K
	cQlfDIYdM11C3xeIWATqJ2mrrkhSvm6hGbrK6e5Zg7qNz2cqDYFe3jjesVdmDevB
	tFusiqpbIX9Fj6UTYAb0TuB/lzJ5VoDBbW7JwHrrx4/9WJFrwbulERI6AcCIO2Yg
	DMjzrfIgoqgBIuC8UoK9Ho2nmv9KO85khiJZWQo+hUdS37n+kuuq8bCO9fp26jKq
	DmO6aTnGAWUrnF1I+fvmPbqDlfxZghvJ+gh1GFrJ6Wvkq6X/qxk93BKjztMvOblm
	nt/k2f7cm2DpJytSGgzo/A7Duh3di9lSpq3O8NNk5VNUqNJ2AwkF2oo04WiWwdAU
	giy9yA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04umfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fdace20927so71663226d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527860; x=1785132660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IF3qUvx1/jD02Z3xEjWvYCh3QU/bPLh9lfZzorOGlGs=;
        b=D6F89mC5BvqfY2YciQYlgAwilhwOoEjKkBSXG9LW+G9I64hQz0cRu9KZofH/xrT5pB
         yqgCY6DlDi+VHowMK3CRVILKb6+sVA7F5rG4OZsFHc0QMCoT7r6+wTPUabIN6mmt4Rjd
         2ObreFUClkRXXZ1Ow0JdKSUoMxlNdXvJwn+flKRPKj+Cs3jI/werWyk8pKrIeHnTfi2r
         z3vtiDZ0GcYUcRccaHeih7RqvXpDUGVdvQ0YR/jbxWp0mrstP9/1M58kjbEUJdYk5zTt
         OxbWmub9hYc5N2TJ2NLu+VxEzhFssWwltNd6VJu1JIOIDD3KIbEcJkgv4uk6Mlw5Sy71
         gh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527860; x=1785132660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IF3qUvx1/jD02Z3xEjWvYCh3QU/bPLh9lfZzorOGlGs=;
        b=go+aENNmN1Syr3Cr8i6p5rcrodMzeWqusLbklw5M/LrrTNC7YTHxNiWuG2SqitiLhU
         liYq6ns6Oo7kiafdMai7o4DJx4F8wPpgBaZlPrxvPrcrTwOPUQRn5Ww+lyfHP5r+I1Ur
         sthIPPSdk/ENeAsd1ObO3UAP50O1Aek9sXKbYAEoqrki+n4+urALu5WS5maSqq27b4+Z
         FIMowC5Z09jQubcouP9epZLnNVc+ipdHGd882h7LQn65I19eprJydJsBV6bcNZrGI8vH
         s0JA2KpjHYU5bgDEtVl4yRNSyX75tcaC96S2a+EFkczwawZ0ohlZkXTry9U2tYBp+N/g
         KPNA==
X-Gm-Message-State: AOJu0YyxxGUC72K4Dv4J7m1/0UN1PDGLyH8ubSYov20HobZj+nEo5JGC
	oXa7gLC5MUNmVr+iskYXGxX03Of7odrVKE9/oBbVEDKrnBkF/GGrBuk+3lz1vgwjRHwRmK7T95q
	/nvQBH+2NOzZRy5dD/jxXjFdW8qKnllk3IiRcRZByiM+VPmcVbf4TF1wpUhobkAzqNIyA
X-Gm-Gg: AfdE7clH16muLLHhg6oXbunvPA2RcmVHxU/YIwmcxn/hxGyqcaUN7lMErkmGdm8lFdh
	IyFYaXlif0aHlenmCcdbODQkTRJjrjRkxhEUK/jHCOBmovsKCkwkCMpwTADCoD0vzZfpygzgwLJ
	h4jan2jG9ZO09aN29TxEZhr+ADDKhq/Ju8R+9pGhpLJIbHUAs8RFUgKRXeAOtOnntcSUvek3XEt
	q3zAFvOVw2LHsVAOrjMdFCtjAMv6lBuzpXa7ws8GoLPe6s2u/tg0ig3OGGa9tyzvsUHW9wc7kr/
	G0YoxwEFDF/5Erm6l97IWmXRqnGIIH31F4syR1Me16RxDHVpebAiQtDj6Ai+DnhBz0eaBNtTKTR
	73q5GRbDrf7KK5Y7ZMdqvmOmQeHGFn9PBeTCmMtt+1hMvQFt9A2y5tfYYX/y+z2I=
X-Received: by 2002:a05:6214:5001:b0:8f3:6c2:222 with SMTP id 6a1803df08f44-907783317b0mr130905266d6.14.1784527860428;
        Sun, 19 Jul 2026 23:11:00 -0700 (PDT)
X-Received: by 2002:a05:6214:5001:b0:8f3:6c2:222 with SMTP id 6a1803df08f44-907783317b0mr130905056d6.14.1784527860032;
        Sun, 19 Jul 2026 23:11:00 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:10:59 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:10 +0800
Subject: [PATCH v8 03/15] drm/msm/dp: move mode setup into
 msm_dp_panel_init_panel_info()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-3-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=4086;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fjfAwVLsdfXG3E29OVHK9sjfJONiXlZlAdNcpfnkhYY=;
 b=+IpbxiGAPbEa5G7QwCsrybPKxF3rVBed2emWYd4YGTPKSRh7Sh9ZaJmiW/wl6FVXGiTHxgGje
 9QRG/40n1KvC48AdQ2FbTnyAPmQTmRrs2uFhZlp0Yhu9TjmTFgfylea
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dbbf5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RRF978PcF5p4qF5CYGQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX8tQXXivxlbLf
 Ue/tjLXB6v8oeph2w50voy/FifXmp/CzNT1696kfMVAfUEYh1hmw0AwVt9Pu91betVRSvKL4+eF
 ycuxN/+E65Ga+CLtX/aTiGM23XS0DPNlCAsiBvkK2c1D9ng8G7hivpcG6v4xI1lvfUXvikcKT7y
 ytu38kdr2/AjTVdaAHkBlBLIIlpyk5n1CH5I/IBo44e9F+USHy2j3S231XbxfgN3Z9f9d5oVWJQ
 C5QqIKtiezgRfwcMsjOEUsUBbk8X40bC/UEhhCPsFcP9f6jsBvSfwxNrEV72vf8eYzOgYamj/i3
 i2nNWFiixuFbRyD7d/xmLoji6WT1Db79o4whHUiJSzFD7cBDhXfgmdDhY5YJx4EGiUnQuXEQehb
 +RhwulvnY6Jm3+Q8L2SsfodAHwubeJtD7tZqzesOWcuITJq+WbWhKmFPyqluSkzGPrc0+RNIgIb
 Ic8QFYB+sxIDaos5JSg==
X-Proofpoint-ORIG-GUID: -tDwwujkW262k9-yGpCS-DzJhcu0DMRy
X-Proofpoint-GUID: -tDwwujkW262k9-yGpCS-DzJhcu0DMRy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX85UTW4kmeJh6
 lUj+3j1rn2cqPrfByZu7rUcTgN2ujBtaMlz4jEssJZUMtw4xofNzY3b9o3EflB75wKgFjqQJcrA
 wtvC3Sou+mNHpaeY0vA1akMo35GOJDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200066

The display layer directly assigns msm_dp_panel mode fields (bpp,
sync polarity, yuv420 flag) instead of letting the panel manage its
own state. Pass adjusted_mode and bpp as parameters to
msm_dp_panel_init_panel_info() and move the assignments inside it.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 18 +++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 57eafd472462..155beefdfdef 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -604,21 +604,12 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
 	if (msm_dp_display_check_video_test(msm_dp_display))
 		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
 	else
 		bpp = msm_dp_panel->connector->display_info.bpc * 3;
 
-	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
-	msm_dp_panel->msm_dp_mode.v_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
-	msm_dp_panel->msm_dp_mode.h_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
-	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-	msm_dp_panel_init_panel_info(msm_dp_panel);
+	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
 	/* populate wide_bus_support to different layers */
 	dp->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bde4a772d22c..e76dad0f6663 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -647,15 +647,27 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp)
 {
 	struct drm_display_mode *drm_mode;
 	struct msm_dp_panel_private *panel;
 
-	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
-
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	msm_dp_panel->msm_dp_mode.bpp = bpp;
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
+
 	/*
 	 * print resolution info as this is a result
 	 * of user initiated action of cable connection
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 53b7b4463551..4519ac374220 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -43,7 +43,9 @@ struct msm_dp_panel {
 	u32 max_bw_code;
 };
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,

-- 
2.43.0

