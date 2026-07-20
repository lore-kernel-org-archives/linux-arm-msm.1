Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF681392C28
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527866; cv=none; b=FIeLUj73q71IfEYP5dqQaufzi5b8k1/HhGalPTcBB/XBPKWRdZht1TYQVtbT6TjCojipCoJYRSdCBCXVkGbybVksIBq9aQqowoW8viPlpPGtm8EuZpHllW4ceJ1YrHELsg6dbWOUlU6ow3jBh8sAGfh5/cXSZFwVN9GXp3fTqdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527866; c=relaxed/simple;
	bh=bXCs0B3wCMmVrp2psb0eRbW/KTh+x7SoM0fSFzWvpgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6cjEoQSFKewHvFSMz1NRtc3ybHYnHN2lNlG6WffbVQAKtetZtxWF76Ke3cjuqyn0p0wdKYLCCtOL23mNPu4bMCbfC4qiee+NlofldCE87OAH41VijTpoBktpcoq/2wzaxgZHisGcZYGaQFv/9iadbhYr6ZJPwVreAPOT5ciznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHhp+Mr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=at7M9ZHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHhp+Mr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="at7M9ZHN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNstlL645579
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8LT3QiOAV+ZCZbLeAFzKbb4Za8uMZYbHFZE752ZTKk=; b=eHhp+Mr2ZnaOBbYx
	2QhvIeGUosew2oa9S2o7jQJLVyOMZJCexHvDblgoUTQE7vDvP8inf+R1VA8ptraI
	c7Gw8vyCkGJohllc/KhgkY0tIwm1wDJKdd473ISGuMtSbpdj40gNYguuZHUrJba+
	2lUr7FJiY3r+t4XYp9cneMQMTa5LcMige9BoXI50b1OQmO+39mYIAJgZ+9v0ERAt
	2mNhuDziU/bEogalMKQUDD5YMrPI/IXCuelULi6bu54W8JzMzyapmgLWK89Yy4QL
	BXpTE6s4iTTXBE/LicK/KgevoRkv2OejWa2I7eWgWHyxvJTwtpfgH+vACAiBJtcS
	powaxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvvmy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so259635651cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527856; x=1785132656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8LT3QiOAV+ZCZbLeAFzKbb4Za8uMZYbHFZE752ZTKk=;
        b=at7M9ZHNdbgvPbvUQVi84Yvay+vVNLGfZzVuLiy4jIVcKCMPIeChuUn0bT12wEVHYz
         VKSz2ck9Nfp+1FGLbgIEYIh7UnM8hXkAnUr0pVMQwiwm8DAWBcL6M0y16hvVusnBUP9t
         F4W91EeKLuuKXTO+A2lyKKGEpKU4jwMj1TPPDPoOpOD2zBKhtNKQy6IaI1VpyJrku3AE
         DKdWG+BCFJ9qUvKbmQVd+G5Zmp4sP8dqIX15a0hx+RTU4jrqyhUrRLJO0vYWCittPV/r
         3NVpvgHgQHw4yRHt1+jnwPHK+I3Kmed3p9+qhRXYvGKfOcrX/nsz+Q0wOjjl/2yMY42K
         HLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527856; x=1785132656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8LT3QiOAV+ZCZbLeAFzKbb4Za8uMZYbHFZE752ZTKk=;
        b=jgG767r1Ntb/Z6aKe6PFJ8cVq0uCjh12fk2GlqSTg1Gl35uhOXKVvPNTK+DPbmB42J
         2iPpAaV1ba8E2g0TQ3sWvWWF+orcpXhnhAUqGXa4Oo8SR4VlsUG8k7chmiF6YvMzIZI9
         N+PlyyxlsAxu3GNhmbU2St/0bmVG7r2fl/akzugHArxXLyw3IiQoYqJpWS4G/bfc9Tvm
         dPynMpV8KljtDn3JO/Y6GO1MFbLEouJ+bhT3oWZNzYYupotQgjvGb4FNtwdpwYiUmxmz
         sR/YZzPRdwS6HSz51C9/WqKr1NzCbD5lnybG4MlH9UXRwIl9cobOG6qrM8hNuKThTviD
         rojg==
X-Gm-Message-State: AOJu0Yx5NojxlVzwbM82PVK7vinf1l/0SqY+6jYIJWu18hPu0Pgoc1R3
	IbSUkj0Z3xRd1JKQ9+FRqEO6gDn7iQM39U/vOtRmHjCxcvT+1XqmTTA1HU34tF/sClEyf/w0TBK
	ZiGLcF5n5i4E4Cft5xPRQKTqCzdKp6ZwcD76g69nUjbOu6v/+krbZ8GNpzjSaMdz+Alsi
X-Gm-Gg: AfdE7clD3h0U9OB+uh9aaB0QNqCNPT1GMJrxBiB7Eop2/CyFPJvENwzG4W6XaKseWMw
	9X4Ba4zgawlEhGqGU/Kb3SEDqN6IiKq+2o4Y9luXmsrpeCYcFiee042fkvPEGmDFJfVuLUBXASG
	hbLNwb90hxR+cF0CYsSgTclPBTUgQc//DW8hIxJwdNUk3c/LRau36utIsWr0X5K1N8vi01lv+gw
	u0/Ks1vOfrpYRh+hV0y56Wsc4mF21QSuydWDusgwBLwpWnbwPiDWkP7qXpYq1VlLZNXL5XYUwl3
	s61T1NaXID9moTgSYZAYNgHyeLq79ShlVeWn1520XfxabD3cyXkcdx4kfgknE7ph3Vbdtcmo6qf
	8FE8DpNIl1f7pT1lc40+KB76AjEZewJNYoaP8Mw3NSJmQWV4SeiT1R8gTFo5Gcew=
X-Received: by 2002:a05:622a:7:b0:51c:d52:6049 with SMTP id d75a77b69052e-5213ced0406mr128449771cf.28.1784527855747;
        Sun, 19 Jul 2026 23:10:55 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:d52:6049 with SMTP id d75a77b69052e-5213ced0406mr128449561cf.28.1784527855290;
        Sun, 19 Jul 2026 23:10:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:10:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:09 +0800
Subject: [PATCH v8 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-2-bea261bf4e7d@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=8169;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bXCs0B3wCMmVrp2psb0eRbW/KTh+x7SoM0fSFzWvpgU=;
 b=8Iw0Rrfc0hmPYxDAMst3zkdWUXmfhUCwI97+b5/m1z62D52v7/V1mmrEfxiz5ZNk1+pdRcKhS
 h/591dvAvnaBrGtq8O+iZFCb8HL18+tXEQIi63QjJQ5TgDOdUHkcd/T
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: RVp4ngv10FOFMl-Edix9ANAgajDgi09i
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5dbbf0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ohAeICWEHyx3i1rom8gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX4b/tWgp6yWCz
 vJtTMYtowYbME8WNVwZr2wjrEXLhCPm9ZEIhfNEYBwSHXXiZcBbabaOmjkSOrRUnJ1ng5Fue0Bt
 YAPXzBnnB2eRJTZ0pvbuCnrXa6xyRd/zQZwwAC/yAbR7chltZNoNJoD28L9Pj3w8lYoS2K+qDbN
 umtYq/UVJ7zksk8bztaQkjgZmdWQZYm8yW4H80P/d+UHLyYO55En5fzvZwxgQYHN375jxS5uEnl
 YmAkUb8xH4wjovo/L04ckvL/OTOLAeVdGWML0bhRal3ismvCsnlR1uwTqyhBoEeMkQ2bK+rpy8G
 V7IZzxNT8wwoRpC4x+6rShGiKqgFqgCkOBQT0Vj6kOo1vCqxC2SU7uPnBBMbomgHhvuzkHTl/mM
 HT3VPfysIXBifzc89Q6WKixoB3bVPGODfEMyUgZp62OzIE4/Zucv8vy4cMaQroWxiHmLvw/78X6
 cAqJ4ttmumSkFdOGTng==
X-Proofpoint-ORIG-GUID: RVp4ngv10FOFMl-Edix9ANAgajDgi09i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX3x/BO0s2E74a
 ObHAbKak3KZT2fZ6Vu3fC15XP3FdStRozWywNflG8pdoC5W4lkmhv05strGPXvahs4z0UaqYyXs
 L1IWs6bZ/4a1DujdduS0ODIZPG8aLU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200066

The bridge .mode_set() callback is deprecated. Remove it and move all
mode setup logic to .atomic_enable(), where the adjusted_mode is
available from the atomic CRTC state.

Drop msm_dp_mode from msm_dp_display_private and store the mode directly
in the panel, as it was only used as a temporary cache. Both changes are
limited to msm_dp_display_set_mode and are kept in a single patch.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 81 ++++++++++++++-----------------------
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 -
 drivers/gpu/drm/msm/dp/dp_drm.h     |  3 --
 3 files changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce165bac106..57eafd472462 100644
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
@@ -1365,15 +1381,19 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state,
+						   drm_bridge->encoder);
+	if (!crtc)
 		return;
-	}
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
@@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (msm_dp_display->link->sink_count == 0)
 		return;
 
-	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
+	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
@@ -1446,45 +1466,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
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
index 06881bfd6181..763ae4239bd3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -56,7 +56,6 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_enable          = msm_dp_bridge_atomic_enable,
 	.atomic_disable         = msm_dp_bridge_atomic_disable,
 	.atomic_post_disable    = msm_dp_bridge_atomic_post_disable,
-	.mode_set     = msm_dp_bridge_mode_set,
 	.mode_valid   = msm_dp_bridge_mode_valid,
 	.get_modes    = msm_dp_bridge_get_modes,
 	.detect       = msm_dp_bridge_detect,
@@ -233,7 +232,6 @@ static const struct drm_bridge_funcs msm_edp_bridge_ops = {
 	.atomic_enable = msm_edp_bridge_atomic_enable,
 	.atomic_disable = msm_edp_bridge_atomic_disable,
 	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
-	.mode_set = msm_dp_bridge_mode_set,
 	.mode_valid = msm_edp_bridge_mode_valid,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 041aa026ae2e..4bd788ea05d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -36,9 +36,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
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

