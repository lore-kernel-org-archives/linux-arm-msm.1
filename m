Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB33BE144
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702243; cv=none; b=TMeX4VP5OcvJeN/MnlqD4PgzR3g+IT9bVWQzkVUzSWYRY/hYp3Fz6sbGUHmcoO5HukeGqQd9bKlzkbAu2RXpO3qcPQioi/I5Z/F2UsElpB0y/9hABgei82SDSx9uJBhsD4d1oAA7dHp1zewadmbA1z1MACbrvrsBYLCDq9PSj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702243; c=relaxed/simple;
	bh=Tu4mGwXUl1elJyKbUhUAUxBsnJp9meQaUahl6UOBN7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHOWifvxPa8JUdJfOwiN/TTZxH78Tq/uqBdrI3FGuQikzsK8+kXC8aMeOlxwijGrZceq0oB/vl+EYv8Hl4ZRXDQEIMmpW5v+I9Pl0uPZO/vri2CvQFBNjmhwmfx1wehfC0cqpzhZLgfs1mbg1KBmjAXxGByT9BnTJQZbvWMY98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWOmbVAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgKOF+TD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWOmbVAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgKOF+TD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lgX3767875
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DofyXbQYtrjVU+qJqRCV8rPF5+c7acyIUz9ezHCKjkA=; b=ZWOmbVAD6mpQc/l+
	NJgXePlnHEBOL34rBICW8e6sxhvYajc+3gNJjVw3CERSzuPEK7ZAf0kwWBs/YQjD
	IkthNIilExQoPBVKsv6gkhhT/H9iHnYb5Z/UJFe3k7MVHwoiCCuZke2rhO639TYi
	7u4U/DsFCu1418XuXYVKwrVcs+650Vmw7oWj1VgQ37ntLb0BFNqq7B7zIpSHjwTQ
	tflK9EDkLvefnLlsa/HbhXQIk9ZDTrgtbuZhZr4PuiStMNqmaN6M9d162qpW7Sqt
	6KKkk+OvJGK9vWw0MN8bXQZinJBa8AgOaG1vvHo0lpAo1/v/XENXnaXNjZTgY2Dh
	dfL0lA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rn9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso99011331cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702240; x=1785307040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DofyXbQYtrjVU+qJqRCV8rPF5+c7acyIUz9ezHCKjkA=;
        b=fgKOF+TDWl7yW90FXDhGeBun2S0Kn+b9AS6V2OgFoXl+hojEsm/iLp5q6cxZk2g3eq
         t5UnrnyuiH4FmG7rqkFlO9mprvup9pB852wl0/gZRERkl+ulg6gQP2EB17YFBEAUtOFe
         JQmN126aLjCYSB0C21p1AN4mXpGPkZQaUDcJcNU+qEUzHQc2IhMHy98JP1IoD3wZ/tyQ
         Zj3Uj8Ddwoy8UE42F7cZ3s45QZK2jskAFQxS2xND9VFwzBxko0MX+BmlKg4AuZ9/JrHV
         /cDkhjx5mlGAKOFLAzrQtrZ0hsX2f71eL3ZJcccH3/c2tl4rbURnUMcLi8MVsI31Uxxx
         3F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702240; x=1785307040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DofyXbQYtrjVU+qJqRCV8rPF5+c7acyIUz9ezHCKjkA=;
        b=pJLtswT83OXG1eMoSSdyp/mxqNq8ubCJ00azhXVLHPsoZX571r5YSO1j7IL4UvYvsY
         1tamUSyz4dOGa9lLZf6A1EbrXlcklCYGH/GNTwbyg9JUALXt2j5+LGVgytMk9uo+To+W
         QTBfpfEt/b/hAjWG01LiKiuOhaoZE3c1PumlrDyeBgb0d2e52NW9fnRH+SMGpXi/7Gcw
         eY7UGQrh5yRHifYCuV5lWqEjOXzF5YJD9tM0AO+rsWiRKOesPCcX0mDYEk6Sldw+auMb
         ifkyDQNgi+ljRsUwJOKLo+LZPZ8SAqwerNHGgt7egPAgRCwLmmX6KVh/xGGdA2fnGrga
         8dYQ==
X-Gm-Message-State: AOJu0YyGQ+gSMLM/O3AAf+DqOzcqv1gtF8t6dR7loUFUEC2w/Tmlnogg
	4ahrmJ8Dmv+Gbw4iKJd43gi368srLLzMkwP22ef/vs7agiUUVS/eABb2VFjTXOsezZR9wqdKwaD
	tnVBJWbwQ3LNN1HB3OEbFC6zgo8FV4FuPaXEvCVb44UPXibwQs9+kcmtsYH8P7MedZfaF
X-Gm-Gg: AR+sD108fQ7WhFSKhXdESdMHVuFRVeHhBemEKVJbHYlFJNUGhP6msjyMYNeryCHYyji
	4OxHvJqdAEU0LiWJaejGvai5vwgdkGw4VLesw79Mx+Bx+ZgJ5MWMb1WuQaobXJmXiFyjoW0aHGx
	ySM4EcBY1gK2QifUxAx4TX/b4/GPDYQ3Bc1MeFtLVB1r/Q7+3ksptIFg+Ta49DkwhVDVmv8Pmx/
	D81s8s3UiifQ5uVfDF0/tqe1AV+P5SZbXfRSjrZyynfKPRqAKfpVbPp20945wrHc/9qv2Pd6LXQ
	w3Xn8fOpfL+kkMKufYZkiulLxEGV1FpRyH038NG294kl6gS9kOOJTiCBRQIi8hMsWvWeNcg7wKw
	RQldpl+LGbwljbg7pAJVWCWhAbbrCCZIfzhHvGIy7MvlvQ9wrwLTHPh84KcCse+b6CO52/ZfNej
	HP7UwuoWJHsmB0YQ==
X-Received: by 2002:a05:622a:3cb:b0:51b:f217:539f with SMTP id d75a77b69052e-5213c10a2d6mr207438841cf.17.1784702240118;
        Tue, 21 Jul 2026 23:37:20 -0700 (PDT)
X-Received: by 2002:a05:622a:3cb:b0:51b:f217:539f with SMTP id d75a77b69052e-5213c10a2d6mr207438631cf.17.1784702239653;
        Tue, 21 Jul 2026 23:37:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:32 +0300
Subject: [PATCH 17/24] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_pre_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-17-368c10fe62fd@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10356;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fIeYRc8ZE0MBCpxiJUV+tJkR7IAyEtybOanxyXalYmU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTo4IiPQWb132G5kSJWclcsaV+HaF+BJtTlD
 uN3m5UgxBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6AAKCRCLPIo+Aiko
 1fweB/9Prxxx/sdsHxCoetb3J9MkBstmDkil9HuQJqbXkqRMAnWvyBErEsCH2TuKKMlrLlHVAFU
 7WOcrUv0WgIVlgxZkngEHpeTFSL1CSbJPI9aLbWssQdi6RIBKIQ8e56FUFHAIYbrwmCQpMgpwlV
 J8jRXIcukR/IHmUezTyYsD1qu3pgH/O6dtYrBnNSNhLbbcD9pzkFH/LL8QEdyiruBGryiBytAM4
 Qo705fgOhXav2w7JGt6h0W4l8roDyexjL1UmKzNn5vVCRogNcXnop/af4brWWcruv8QICozIpSx
 RKrgBMOIvuJYCy+JpzUvkJqldZHOUIk1X/OUZPt9aeIAOSzI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _LDDUl267jgw1W3U8tTyQj2BRX-gDOeB
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a606521 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=HUDQmCXQRbm1X60NTYYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfXxV/S3a20oQWf
 40Vn6vaFoe7tqLlhBKohO2eRQ1n3IYFHeGF89xzrYKjk0oD0jJKNQfbcWTPa9OnXNdo2ZDIbrCn
 GQA3huNH+7VsIKVDGdA6s3jWTRp1mOLeEkZH3R9Y8xXlgz5eOVMG2gb71+kS8ErdtjKHkkbaEVG
 cEDesD1GoAjWgJULrKxP2VkP6gd3+ZMThFmvoSiLaep9YKa7WHXFKj2tp8wxecxBReTLtcZwp7W
 r1ApL442vdHhpm35c0IM5tisyX0G9kCHq/ALDiinoQhqZg9FGozlTS3VoEwbGIYb9QCxnUmo95q
 YLzMPtMMONZYvOXGIlUpAXeFRJB4QiOEbdKcXRraHuarYSxeWuaJ7tF2yWO9nNGBrnqlA+pCtnW
 AgI7Fhsppqbr14Xut6Q0+jR18BNmm83Ut/wGkqwcLnMy+S4O70CDO+76ZJPRveTgwOhYUv+GmYz
 QSp1qNtLCluFFtNrxMQ==
X-Proofpoint-ORIG-GUID: _LDDUl267jgw1W3U8tTyQj2BRX-gDOeB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX3ul96gM1Lkga
 EMv9NsNnQmtzaXm3wMJ1N0kp7NC+HfFgr0Fl7uvTWGLOyQ95w+9uRgzz4vJ6VBTAA2uXrhOkmdl
 dkj+Nt9n65mmIU8ytsPlBxzkL6j5ZAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

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
index cd4923d1a17e..7f55cace596f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -63,7 +63,6 @@ struct msm_dp_display_private {
 	struct msm_dp_panel   *panel;
 	struct msm_dp_ctrl    *ctrl;
 
-	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
@@ -600,16 +599,33 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
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
 
@@ -1310,7 +1326,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
+	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
@@ -1414,6 +1430,30 @@ static const struct msm_display_funcs msm_dp_display_funcs = {
 	.needs_encoder = msm_dp_display_needs_encoder,
 };
 
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
@@ -1424,10 +1464,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
-		return;
-	}
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
@@ -1440,12 +1476,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
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
@@ -1500,45 +1530,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
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
index 4f615b45fff7..da005babe411 100644
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
index 3b046822f05e..4c6b14dd52ac 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -26,6 +26,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
+void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
+				     struct drm_atomic_commit *state);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -35,9 +37,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
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
2.47.3

