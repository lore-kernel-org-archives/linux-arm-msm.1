Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89A4252BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234166; cv=none; b=hbbzZ8/xsUOdAqWw9yKtOPra9Tb89Ofp+U3V94QpsFG1bLrtTLTuirdyjA9lCFUWGgTjvd3hy2g/SctISY13+6DtcCQEyBUh1G79ZN2NPejRfgAAB0YRYwP5d8Uojx57HPtegssqW3l6898f3E62Y/hxXq+VJNotGP/5JPhQ0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234166; c=relaxed/simple;
	bh=mlSesjGdTDSf3YuF0mVeEo39OaqKAtuVLApHFRqp1ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxzLywV1z8pUuFRgMQdQe6uIcP0ATawxX7umQ0XvSRLfOAvBU8KLtTfvTGhcn6M54JAunC6cLwSqdWLBkG6CM3LGchXt0CmVfw/D3F6AxqZpGmZ2uGg03HBfrltFphaqL95sxxdxlOxnu0Fq9R+iZGQlwnihXOS9lnlxZcRGb0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfUPhk7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7c8fUyv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfUPhk7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7c8fUyv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82BBi3295083
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5a25W9zrxaHk6kHbyNgYxt78JWAn7P4LQb/QsZr/2ME=; b=TfUPhk7syGyelyW+
	qA24FYVWhoqu735AddunD+5X75bXBfYM1kWy7g3DSCfJE37XMq9yKAT1WTCQOO+h
	U7SAbkwXRkR/dM/cJ2u9LCKRSvlZoYGZx4qHXsIDDMo2gVADra1cZ+vvh7W3MZ+L
	idnpLwM9fYyHAz2Azkd9xgHuo/L+Uvu0urhuwfhbLsFwoUmeg1M6dmIx2rLQPSYZ
	OB+/RvmmaDCh5j3hPlsOI8HIAJGEM5o/jLxfky3SEyMhKjryAO6uAlMhcqap3vuv
	VIzZsXsxCRhQB13KUChNqamcBUfaFcj8WdKFkE18s6JiIOXiXExvJhkSWjqer7ZY
	VoXiKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5ks38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso46989066d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234163; x=1785838963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5a25W9zrxaHk6kHbyNgYxt78JWAn7P4LQb/QsZr/2ME=;
        b=P7c8fUyvTERhi8zT6AgZStPOTbOQJ5e4NjH6VL2vZj+Bjia9Eivvi8VLbK1F+fAs52
         XmY0cy3wPxQM/rVFlWYoEnVEwsr+35LktytqyKQHk1c4pKHKmnKfogN/NVnMMyAJkUuB
         KR/A2e4EAw05QOKoEf0Q5fM2kHnztTjLEa15k4yT76kZHJC6BgbWVqqV4jJjZrHHxXGm
         bjPbW0++Z1X771K+/LUDmfmobvEcUWcAYdUKRRfEXK/WxFOLOagqhvaduv8/69aHVT3Q
         GpqF702oO4tZOTDlA+bcJnQ8+AuTGfirz78m6DygVy71+1ZNvEjP+R1kujInmFj12kyd
         m8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234163; x=1785838963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5a25W9zrxaHk6kHbyNgYxt78JWAn7P4LQb/QsZr/2ME=;
        b=XHwB3q8gN4QqHrj7w2JHZPcgmiMMhJGM1uE2ewr07FrygHzcgyNKdq7mhfIEScHb0+
         oKcd2HrES+KpDqu9bx1KU2kLhUsVBDTEREkVOR6PaxkRaaXcAghF0CfrknyPjgQ8etqo
         WXvqVZPwQXdyFG4qfIQ8z4qmQuFUbjHOQuQqGwBSBsIFd3TMoTj4oB/GtnjvzTk6+ckA
         8CE38JzxlLrZAZ0urr76xPsGzjWKV0h+Y5DOLuls3leTWncTdpSDiV3DR7j/qhy3u+7Z
         pCrXEh7QhrzxwvN1vSBaXz98L/MbPtHQWmlLWGgZh8dp5rnHkifyB4F6AIXK9oDBFYAe
         yx1w==
X-Gm-Message-State: AOJu0YxmAwypwEX0ehLsKHxJluy56qfxMIbVEvo54ahGV2qLRWOQInqM
	6bBrlq0RmkEpqS4vEVbju0zB+W3Q3ZyhQJ835V2I9wkTQrwYe3Axsv5yUHjMz7G7Wl6+94BVj9+
	G7tTu/Hw04hQ15l/9bSp0V7UOgwFrPe+7CueLINfcQScxGFkGOXqo5BHf7eN4tw5dtKzn
X-Gm-Gg: AR+sD10AyC7VfiDyJwDVr08sk/WRmE/x8+h+IBwqb6icHi7szz7dA+KDG0vTa2JtlzE
	nGp+/xYFx1FGTl31cXKjOxfBRdNQ9lPkSUUpdA91N5/8RRTW4fy5ou76LEJL/BZXzALk62uCBsJ
	9VJqWT/HT4XvWEfzaJV/LAcMbvIqUOkUYS675/27JLGle2UB+TO0vDqlUv+68f7yHbfn/FYLgNJ
	8iAXjR1Qrz3G87jY8tSXEOh4fX5Bux0br5sA+E1qStXAoiqzIqw73ZrhihuBH0AFPlHqtTZfItU
	Cyul/wsW5RXHQPw6+ls3tW021p/2vorNz5AK/OKHXqhmzc105UBgOaQ4zljqHLrSLb9rXW2fhIr
	5TzVwz43oK3k9SfnL0qHEqPxpuGlSA+N+qkwtjKYcXdL9YqbAzZgwXcGGKLk5Ftg=
X-Received: by 2002:ad4:5f4c:0:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-908172e48bfmr15758996d6.53.1785234162927;
        Tue, 28 Jul 2026 03:22:42 -0700 (PDT)
X-Received: by 2002:ad4:5f4c:0:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-908172e48bfmr15758856d6.53.1785234162490;
        Tue, 28 Jul 2026 03:22:42 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:42 +0800
Subject: [PATCH v9 13/14] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-13-f7779fce10f4@oss.qualcomm.com>
References: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
In-Reply-To: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=9954;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6pxDThl+zY4rzdirEx3fR0mdZFEmDEK8JFEDZB+0xpM=;
 b=4uDumSWkPjdCHmnDnkTXguB76yqAYn9vLOQIezSExbvH3Ow0OIOU9ed2W3luMRhG1dHlixC1B
 hzAFaHZqckxDBAZCIA8ORJbl49SHT7Zeb5J6AiPPfp3c0iIKowZ1CZC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX6WpVbmWNstDs
 zX97cIFgPX4m9M/QdPwAtx+2CZ9KhCd060TS3myAVqP3TBi4vaOs1lr6rfZ9gsUKZi1yEzI+nE/
 8wGiCrJFzIPlf82uThHuCcA+ht+SZi4=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a6882f4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iEZZ7kfMCVqEHj8YyOgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX/CeVM0zLq3jr
 CroxRZYBR+AeaF8w2u9d5Xf8m7aInKa+1VhIAK45fHuFdHO9Cm3IuraI/dBQbEChPwHCyEAZCva
 PTkiuHErbp0Lz1ZHqY6tgMAhBN1OJX+2cdSIZlhVL7TAiZdkoxrIcQfkkgUgpZVkZN4O1RUvioV
 lYYYE/6WgGrfoT27zmetEXj7iM+IHfqExHFnQCi8MsY8fkCY+WmySW2n25MzEmGl3mUsvtiILE2
 YjEPT0WVV81Bq4+4oWlgJE+yU5Hm6AlkqiM2t2UdE27WUmQcIIJ/yAmTJiSSvZRSGcGPiadlCp0
 L5Q+NJyqN+WFTpeSsRPsX0NvXOTA1umDisfoIIcMp/kPDYJ7WSrp474KbC0fwQgu08OiZzTXa4S
 wXMENZaU74DP2+L5vHSVJFsgOAPKtblNB5oWE8k/ahkSm47tZ683OeXOwxnsz1VszS3H3YFG0+d
 8ijJxlveoFL2OEAVC7g==
X-Proofpoint-ORIG-GUID: cyf8g-ntLDowgSyoYhKJJMVUktI5JFI_
X-Proofpoint-GUID: cyf8g-ntLDowgSyoYhKJJMVUktI5JFI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_bridge helpers take drm_bridge as an input and extract the
dp_display object to be used in the dp_display module. Rather than
doing it in a roundabout way, directly pass the dp_display object
to these helpers so that the MST bridge can also re-use the same
helpers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 41 +++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  9 +++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 48 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     | 11 ---------
 4 files changed, 70 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9b9e96b683c7..88ca263010c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -740,24 +740,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
+ * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
-	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
@@ -1408,18 +1405,16 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
-				     struct drm_atomic_commit *state)
+void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
+				      struct drm_atomic_commit *state)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_display_private *dp;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_bridge->encoder);
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, msm_dp_display->bridge->encoder);
 	if (!crtc)
 		return;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
@@ -1429,14 +1424,12 @@ void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 	 * state and runs before the bridge's .atomic_enable(), so the mode must
 	 * be programmed here, in .atomic_pre_enable().
 	 */
-	msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
+	msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
 }
 
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
@@ -1461,11 +1454,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1482,11 +1472,8 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state)
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0b65e16c790d..83117e7619f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -33,5 +33,14 @@ void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_pre_enable(struct msm_dp *dp_display,
+				      struct drm_atomic_commit *state);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
+				  struct drm_atomic_commit *state);
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 794a0df60414..c1e4147bfef1 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -49,6 +49,52 @@ static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 	msm_dp_display_debugfs_init(dp, root, false);
 }
 
+static void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
+					    struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_pre_enable(dp, state);
+}
+
+static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+					struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_enable(dp, state);
+}
+
+static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					 struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_disable(dp);
+}
+
+static void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+					      struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_post_disable(dp);
+}
+
+static enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *drm_bridge,
+						     const struct drm_display_info *info,
+						     const struct drm_display_mode *mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	return msm_dp_display_mode_valid(dp, info, mode);
+}
+
 static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -116,7 +162,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, state);
+	msm_dp_display_atomic_enable(dp, state);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 4f733d8118b1..da412c788503 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -27,17 +27,6 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
-void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
-				     struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state);
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0

