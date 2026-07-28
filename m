Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E211420470
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234113; cv=none; b=r0lIb5tk2XgG4lUbU+ncVRMxI6wkjbNz0gxmxC3SK3o5T+BIibNRh1V94JXG2YjgUtblsItP65zGZSUcp722SmX0uqzlKfQpGFaL265DcxoAr6YOtPyLyzHRIPvEAOEQGgbhsUKa7+BbU0JdwP42CEosZNNTkKc/KdfdIc2iPoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234113; c=relaxed/simple;
	bh=xr1rCmcBWocafupJC2lKU+KVrnd+7tEDFoUK4kuaZqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7YPQNT9f/4ymy4sbBqxqlwwty3/mADykYNKdnRh2mBa3rBw8IGB3gWY1x8noRGa995sYfHfgREJtFTvk0UUIdGz/rf0pAFMGRth1MwMUbVWcXxJfyTeWQeKNbBU26wJhAggBxVVZdOTRFzLcrkunXK++2UWMIq2jncqBW4+JjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWjOB9WX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXEvDTXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWjOB9WX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXEvDTXC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Gh12128832
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOaIi4Wbun5io9/6YS9sCipdlAupK2ZzA7O6NUNc09U=; b=oWjOB9WXlC/dOcqC
	zmFscSo8F/6oPDGBfV0ejBoGcCnCffoYJPULc7CnmVoXsw2qCwCLgYpzu7LXEwQE
	6unPhl6Hf9cnhsnzteR3osHVgkds9CtrSPRwpU6zm0URCX7g7H0WUxqKhmgCzzGL
	HcnXf+B+kUlCTPpzetIwyOwuLLR4UZZy36XJgyNu8fhc8tMKb0sidJScRDmQWHuU
	S+MRxbey1AAQKd5fESlMXj6yX0Yk8Q+rLh5I7w0NYqZZ+TdHjb1CmUjIvlW0bhuk
	zqsNqT+BnKlWEtmItTqiPq7pfg/4kvzQxVfUC2CYQddPzp5sSHS/CK4LwNA8wAJw
	BM1UtQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bq7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso48507906d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234110; x=1785838910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOaIi4Wbun5io9/6YS9sCipdlAupK2ZzA7O6NUNc09U=;
        b=eXEvDTXC+MF7BsyhKlVYj+r2L1CiTVFoUCiWQ/EuWVepvwWCJxySg9CJDOGNiVQFjh
         gIV8QR/wsDJtiHQm0GSmSmLIFOdVbhVTB/BCMpBnfFlUcRjb3YTjiV/HuK7QKd5ITDDB
         q119MVP6WuheBNwxYOLuF8pmiVQfzPlW4zBCJ48EdKaSecPF4byNCVY6qYdiLFZ1v0AP
         km0M0mX8spJGiMEamEF0jVsZ+KrKo1T1MzvcGB82ywUGXnf2w0Fu1UTjKfJvVJ4aTkm+
         yvDYFTXJWbKNuThb044hc/4hqc3nW8O5VM0KXHFPphsL0lyKaNUsVTiFKHz14lBuEORj
         PSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234110; x=1785838910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOaIi4Wbun5io9/6YS9sCipdlAupK2ZzA7O6NUNc09U=;
        b=Ar7SYm6fyVNOP6XQ0moasDdDvef+G74DUJHSV4RsALALBgy/DWoJHbhNrHZ0+ndCv+
         DieO0OAIitAh1067AbBiIGXfySC2CfHAJNiUHqbJLGwW6TgZmQS2gqNr7ckK4agc4x/o
         q5meHyQftAyGGKOzvC4nZw26tYDGY9i/EkK1UbylOVJ2q0NgSn6ZRrSJyrfQa3IrPHyd
         IThioa8os+LBcp0d5xzvDjQJkuWc3ScgbJRmNg9B9WhKhVrbXmiNyj3A9/va7qFM+0D6
         xHk9c185N5zjkH2kO/vd0acUxHcjX90T4u87DaYRbTlvUz+yyc2X7AKqXuEu7x/g/72D
         YOtw==
X-Gm-Message-State: AOJu0Yy1nLc/y4kEkNjW1qpz+kN6XwxsEgQ/7LNrkmn1nodv2LBooHS/
	kQi56wyWCs2Tm1ZnSZOGaWC5JnVDtHcXZdvPcZTTdsvnvdgGAdtNtA33GGspWdvabqWJnv1c9kW
	cAqQns5bGTVDeQCOYYSevPv8zCzD6WvJI2GePw0RTfWE7ORebR/6ecIAFoacnJYsm1Skn
X-Gm-Gg: AR+sD10yV7c03sWXbnGiNqVqxLjBRj11lEGmTn/Y843CGgxZYffW02Ggedbuwhiju7M
	Qzsr6vmXkiqr7m8sNwGT1f94cx1nGlfnAcpof4myf2RNikTEEG58XzP3wgiIANObV/P20FTO9xH
	eOYmvWdk3UzZ77g8otH3Ij6ADrwmUaYepstkcUNzq0q4qcWBb8oM37NQwgJHQVKoskPdWOBlEcI
	vCKW/8zuVvJE7NqAK188RzYDEgTObtjG4ZLEhmbfheBA1llaFzrM7wqswZK09zvj6JG1Q7xMlXr
	Hk7IIQjxw1lZ1IxBnD5Tw3IUsZJ1rZ2/0kk+evfPqfBgomXqfY7PiGi1YY32eE/rh/y9XLxjNXM
	1+FmvyN6Ln5gOOJheALNw4bWO3IkuEAFxqo43Z6ZsDtF3c7mETsz4iOt3VjVfr78=
X-Received: by 2002:a05:6214:aca:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-908170c2dfdmr12971886d6.29.1785234110368;
        Tue, 28 Jul 2026 03:21:50 -0700 (PDT)
X-Received: by 2002:a05:6214:aca:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-908170c2dfdmr12971566d6.29.1785234109783;
        Tue, 28 Jul 2026 03:21:49 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:21:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:31 +0800
Subject: [PATCH v9 02/14] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_pre_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-2-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=10334;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=xr1rCmcBWocafupJC2lKU+KVrnd+7tEDFoUK4kuaZqo=;
 b=YYxC7dGPc9InVBRQvV0OA7ssvhdTFGh1ERBCJr7PE9cycrZbZmGbBxujBZocf8ZrS5Hpeme91
 nBiHmw0FSJYCqBvHPuIfC/ymmkiqu2zEIf5hik4AHMng8cz/jQTK1Ry
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX8IcW0UKI8+FB
 44B3Slws7rCusMBXHeWPQH2kHrReeGYwyew+wh/o3ltth62OHYto5JNiwLykL5YLLUqt48qhhGu
 QwraChK1fBZFB9Naf5mzbgvrvnOxcIf9OY1TUq3Ssip65i99prW7EkeF0Zv4dDOkexjt4xq6liZ
 sAaCtdozyRZEx0Kb2LHvjMi7bH2rbED7yFVvTv+q3j1rL22ZSBk5m8OeSuED9GlFInG7EtSUglC
 LBT7q8yQ9tT6zknvbzGmdm+TFHJrDzFm3om4NlJckh9ffuyWeIAn0FwrqT+nz8iTW4npC9OqxSb
 LjeEdx6o5GBTTgPqeUEBtfZdsZDM4bTvdSOHAPMO0JxYwxpqdhkZEAzWHbJbEVbKqCvBMiq4J8q
 48uFPSgdptjIfD5zIETsvxP/F1S3N1nEa4uTFBX60tXLvLJP4IptlavDlQUkZWV4acrc64afvS5
 omA1NBZxQOQfJ9fOv/Q==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a6882bf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HUDQmCXQRbm1X60NTYYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SZnImDvyT8No7CWoz2H4k5fS-Hm5kOA1
X-Proofpoint-GUID: SZnImDvyT8No7CWoz2H4k5fS-Hm5kOA1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXy45jpWfFmECf
 aSgR5EZnOAzMe4CSQy6M5afrgHEreXAHq6Lw1kgpIqgADz6WoiBT/I87kYtPayhL0YvFNoQI8sU
 GKZlmcjjAE8GT6aS6+y6/CCKzAJjP40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

The bridge .mode_set() callback is deprecated. Remove it and move the
mode setup logic to .atomic_pre_enable(), where the adjusted_mode is
available from the atomic CRTC state.

.atomic_pre_enable() is used rather than .atomic_enable() because the DPU
encoder's .atomic_enable() reads the output mode's YUV420 / wide bus
state through the msm_display callbacks, and it runs after all bridges'
.atomic_pre_enable() but before their .atomic_enable(). Programming the
mode from the DP bridge's .atomic_enable() would leave the encoder
reading the previously committed mode's state.

Drop msm_dp_mode from msm_dp_display_private and store the mode directly
in the panel, as it was only used as a temporary cache.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
[DB: moved to atomic_pre_enable]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 103 ++++++++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   5 +-
 3 files changed, 51 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce165bac106..c106aabda588 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -63,7 +63,6 @@ struct msm_dp_display_private {
 	struct msm_dp_panel   *panel;
 	struct msm_dp_ctrl    *ctrl;
 
-	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
@@ -597,16 +596,33 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 }
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
-			       struct msm_dp_display_mode *mode)
+				   const struct drm_display_mode *adjusted_mode,
+				   struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
+	u32 bpp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
-	dp->panel->msm_dp_mode.bpp = mode->bpp;
-	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
-	msm_dp_panel_init_panel_info(dp->panel);
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	if (msm_dp_display_check_video_test(msm_dp_display))
+		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	else
+		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+
+	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+	msm_dp_panel_init_panel_info(msm_dp_panel);
+
+	/* populate wide_bus_support to different layers */
+	dp->ctrl->wide_bus_en =
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : dp->wide_bus_supported;
 	return 0;
 }
 
@@ -1309,7 +1325,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
+	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
@@ -1360,6 +1376,30 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
+				     struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_bridge->encoder);
+	if (!crtc)
+		return;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	/*
+	 * The DPU encoder's .atomic_enable() reads the mode's YUV420 / wide bus
+	 * state and runs before the bridge's .atomic_enable(), so the mode must
+	 * be programmed here, in .atomic_pre_enable().
+	 */
+	msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
+}
+
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state)
 {
@@ -1370,10 +1410,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
-		return;
-	}
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
@@ -1386,12 +1422,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (msm_dp_display->link->sink_count == 0)
 		return;
 
-	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
-	if (rc) {
-		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		return;
-	}
-
 	if (!dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
@@ -1446,45 +1476,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	pm_runtime_put_sync(&dp->pdev->dev);
 }
 
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode)
-{
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	struct msm_dp_display_private *msm_dp_display;
-	struct msm_dp_panel *msm_dp_panel;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_panel = msm_dp_display->panel;
-
-	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
-
-	if (msm_dp_display_check_video_test(dp))
-		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
-	else /* Default num_components per pixel = 3 */
-		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
-
-	if (!msm_dp_display->msm_dp_mode.bpp)
-		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
-
-	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
-
-	msm_dp_display->msm_dp_mode.v_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
-
-	msm_dp_display->msm_dp_mode.h_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
-
-	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-
-	/* populate wide_bus_support to different layers */
-	msm_dp_display->ctrl->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
-}
-
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 06881bfd6181..794a0df60414 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -53,10 +53,10 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state           = drm_atomic_helper_bridge_create_state,
+	.atomic_pre_enable      = msm_dp_bridge_atomic_pre_enable,
 	.atomic_enable          = msm_dp_bridge_atomic_enable,
 	.atomic_disable         = msm_dp_bridge_atomic_disable,
 	.atomic_post_disable    = msm_dp_bridge_atomic_post_disable,
-	.mode_set     = msm_dp_bridge_mode_set,
 	.mode_valid   = msm_dp_bridge_mode_valid,
 	.get_modes    = msm_dp_bridge_get_modes,
 	.detect       = msm_dp_bridge_detect,
@@ -230,10 +230,10 @@ static void msm_edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 }
 
 static const struct drm_bridge_funcs msm_edp_bridge_ops = {
+	.atomic_pre_enable = msm_dp_bridge_atomic_pre_enable,
 	.atomic_enable = msm_edp_bridge_atomic_enable,
 	.atomic_disable = msm_edp_bridge_atomic_disable,
 	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
-	.mode_set = msm_dp_bridge_mode_set,
 	.mode_valid = msm_edp_bridge_mode_valid,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 041aa026ae2e..4f733d8118b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -27,6 +27,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
+void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
+				     struct drm_atomic_commit *state);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -36,9 +38,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0

