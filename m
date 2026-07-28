Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AA429CD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234153; cv=none; b=tRn0BOmx3BbtzEUUeoHi1rA5mhS+amoP9g/9J7Xc4SoMyK62a8hBTEc/pdMKO65EEuuMZnnhBXdhT4WJrkhUuFu48WADikrWVsiAH93xtkVx71IxHlmbbOMhLisAzhyW2tKxcz7sQM6HZFyJr/NF507fSNw/qb/jE3W2zvPSxrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234153; c=relaxed/simple;
	bh=1E5eOs2F3Jbl5XDR1Bt0/bfSuKcpT5bpgVWds+S1hjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7WLSWLPgxXVdms+IsprQhiiF7jT2R+ZGI3+br4sIt1EAto0p1C3jy8xCbdccWd8SlzVMVotkkgEuqa9GvxFmOdClVD5V5GxVQq+Cn11ihzzAqERDw/pZyXTsRSTzONYuDsnTXC0pzn4m4bXZqvJlHP/dcwNMT7DN6eQvh1Is7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giMU1ZM9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApNNBXVY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giMU1ZM9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApNNBXVY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Gh52128832
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2T/I4z3f2sQmz4SpZTw7LRbN06hWTJcmOArvGbwsfJg=; b=giMU1ZM9sISB40V+
	C+qX6szdcPgKnF7/a2RDX8W98aU8OhZ5DE8pTF2sWxW/OVarl7kHipiEnQ33t3Gg
	w6Bdv2I+lU2awDBb8D7hwk+wypGmChBAOtc6KBHtYBO992ghd89FO5cVqdmOp6GT
	sfZaVYWbuEPJ1QHQKn9oLM09EZYAZtVWcJf8Dl21Rc9YQBenUxZsTRcWgYLQixxa
	0tk4/lfV3mWhEWZwoXTlcFb3d0jwUOb/uHRLqp9266bjWVfuVT6i+q6C+GI8rn4Y
	XqpysNWuV1nREjlIjot+zS3vAWnlE5wsP4szwj1ThyKaDIbMoSZ6fsV1JKFUuHi0
	OevDWg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bq9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so50797836d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234149; x=1785838949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2T/I4z3f2sQmz4SpZTw7LRbN06hWTJcmOArvGbwsfJg=;
        b=ApNNBXVYEzHg8ULzDoMuu2KFkgaUaa3FzQOKKgWrR64MNzrfRfXa/mt6wQH2+hrhce
         hy6a/cUO9TnDj00DYRVo49FDIq6CFjvnDBQv5ARRJaYWtadKxqGWKOqLgWOXYGsp8LS4
         sBLMaXIWbhMV2g9O8ncQNYuHqtGJSbWuleJYwO4/om16lZyuJ4/rVSEL5EmtIpsgC9zg
         mjJkFtc+zJG0FFp4RzroU91QU7kXXWJYDeERCfXk2peEKUOCDJwL7VZzynRPbtwklng9
         jL7x8HbL1d38pdRiV7qsmHyZTRJSPJhQc1Cpnyt8BL5E8ihMkwli2xnD0DDXi9I9eDBT
         JLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234149; x=1785838949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T/I4z3f2sQmz4SpZTw7LRbN06hWTJcmOArvGbwsfJg=;
        b=jGcmMBDZMHuwoamGkeOI2hPV13rom098502raMW/dF2enFDLkwoDVqrkHq3NJUqa1i
         u10AI+SxD24b+/ESTYQw+EesDQngLlXvsbY3++zzNvTqfbw6yBMio4n7t2794Chup6xq
         WHQRX1SQZ+AJh/Z0YTEQUrtHQaUFtzaLGjpo4LmCt2Xut8iJmyMHdU7Kn+Tgyyi+GQqC
         qfXQM4i9B42tnJpvm2oARrCizWT/77X/5ER7wxoaG5a0lnBF7sAE7Y64RfqqjjJsZSMb
         eSvw+T8e5elYZBWtYPwrhooRLIU4jup6F98/ttjg98Xv0bcSvT9eHJxQR8PF7kWU1wYN
         g9VA==
X-Gm-Message-State: AOJu0YwysWijOYQY+GBU9xJmGfvH8QmhyT17X5yur/MA33VpM3tlrqqh
	NvHYpuZIYYC4ow2U8vEWgPq4VmwyjE2FR6KaqqjXhlYIdCaH8XNIIO8sUU66zHGmk/a5wowT772
	wDXN1X3AKWxOIEdnEcwwdt8lgFCJPb6MyEzf+YXQSVmMFiMKYBqfEhI6bwNzIsSLVyf4S
X-Gm-Gg: AR+sD12+MJecwosBNZNmxZZViSpbQrQbKH1RkC7snSjIbZgiFP0uGwfpEbpbR+jIdmb
	hLrtlyY9uPlMZhv5BUhnRWR32hGiL59x8gJcO6R2d0W5j67gY+LtkIzDp8mbfhFKtF9p7o2li+6
	F5sOnbwWc8rZe35G7JFmIHurfqgunmNchlzTPkuCxSMMtnFAx2iwZeF75f+7Lp3XgsMm6OmGmCb
	8XNN1/cx5Ln3LwKTLjrb+zwdhm6MimjnHPUqA/TvjstKPfZJguszBcOOHSnI+0a1CIwlDsmWo3W
	CWmVAkTtS8UfvUtrfxLGgRH5Vubqkvy4DR8PmrdK1WDRk+UE++Fr9MoKOCQay0dxVRmIiejx0Qc
	rErcsfDmZz+sTWTFsUl0rWGvcYI1KAaRm7NGPzyBJ2QoMuToLabxSrHvYo3XkPiY=
X-Received: by 2002:a05:6214:29e6:b0:8f1:4bff:3a55 with SMTP id 6a1803df08f44-908172eff88mr17101176d6.38.1785234148779;
        Tue, 28 Jul 2026 03:22:28 -0700 (PDT)
X-Received: by 2002:a05:6214:29e6:b0:8f1:4bff:3a55 with SMTP id 6a1803df08f44-908172eff88mr17100706d6.38.1785234148144;
        Tue, 28 Jul 2026 03:22:28 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:39 +0800
Subject: [PATCH v9 10/14] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-10-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=32754;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=EEx40eanmhghQ/MwJ9QJRD4IoUUpABJVaieda1fkMAQ=;
 b=DlpAnGjq8Q03G3PVFSlRUayNUXuhfZuMuRm5UssX0Nap/+GQ6DU54eDVvHduASQQ9go3MvnJc
 ccIB4bjfismDinlMLil0k5Rb0jsyKXy+D2L7m26PZeu/jllsiflVLqk
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX7woGDiTSZ2pk
 cAcrq2+JdrVEVQEHklYXO+ZmeIm2K2FYiV+UuKoBi/ypTWL69ZbiLH+m9BKA+wY8BJ3dGbGPy/q
 LlG7+BwIRE2HhOPAVYkDsnz9JTpb6RAL5WUIwxFeWnWL2joyVfYzgykU+o3ZV5ESmzPdYHlEGvw
 j/CQVkF2sB8Xt7S72e/BxJu5OeBGkhZ7xTrrxmJfcwWKiYE0qm2UHMlrYJEyOII9nolNbdiOg0p
 Rwo9Ob5/lo8Z7F/V7uB7oup3pzSx1sQKS9ox+gcBMWatxjabJAESGy9OujjADlKDXav1i1Y7ao7
 JoZb65An6V/YU6T4y3mdL5HPHMt7IuPghwqRhXccvZ0sV39tRHhzXE+F1KLUUKTZaBDHZ1s03Xy
 GbXeF7sbxET7nn0FXNXEhjo0Tg0g1WauZpZEr2+8t5c1+ua7roFEryfeAeAhXWjHU+rTLXkTY7D
 L38E1WlGus420eaFwyQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a6882e5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=531mWe0hPKX_9nM1v_MA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kHkgXcxY4lVRtPVkBaExRiZTzSm36SIP
X-Proofpoint-GUID: kHkgXcxY4lVRtPVkBaExRiZTzSm36SIP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX0snlHQu+5aDG
 G+Y0bC431sST0NF9AZl7JBYAunT1rhLLzYXo4qrO9ig3bmhUaxz/YFn9Zlsl8oxGR3coUtfq3Hk
 PAjUEAU2M1YKu5Sn6iMiidOjCVdzmYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

With MST, multiple sinks share a single DP controller, so a cached
panel in msm_dp_ctrl_private can no longer represent the per-stream
sink. Drop the cache and pass panel explicitly to all stream-related
dp_ctrl APIs.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 201 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  26 ++---
 3 files changed, 143 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 272ac3b25b13..9bed5a2fd2e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -114,7 +114,6 @@ struct msm_dp_ctrl_private {
 	struct drm_device *drm_dev;
 	struct device *dev;
 	struct drm_dp_aux *aux;
-	struct msm_dp_panel *panel;
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
@@ -202,7 +201,8 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
-void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
+		       struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
@@ -217,10 +217,9 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(ctrl, REG_DP_SW_RESET, sw_reset);
 
-	if (!ctrl->hw_revision) {
+	if (!ctrl->hw_revision)
 		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
-		ctrl->panel->hw_revision = ctrl->hw_revision;
-	}
+	panel->hw_revision = ctrl->hw_revision;
 }
 
 static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -418,10 +417,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
 
-static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel)
 {
 	u32 config = 0;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
@@ -484,13 +484,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *panel)
 {
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, panel);
 
-	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
-	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
+	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -1260,20 +1261,21 @@ static void _dp_ctrl_calc_tu(struct msm_dp_ctrl_private *ctrl,
 }
 
 static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
+		struct msm_dp_panel *panel,
 		struct msm_dp_vc_tu_mapping_table *tu_table)
 {
 	struct msm_dp_tu_calc_input in;
-	struct drm_display_mode *drm_mode;
+	const struct drm_display_mode *drm_mode;
 
-	drm_mode = &ctrl->panel->msm_dp_mode.drm_mode;
+	drm_mode = &panel->msm_dp_mode.drm_mode;
 
 	in.lclk = ctrl->link->link_params.rate / 1000;
 	in.pclk_khz = drm_mode->clock;
 	in.hactive = drm_mode->hdisplay;
 	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
 	in.nlanes = ctrl->link->link_params.num_lanes;
-	in.bpp = ctrl->panel->msm_dp_mode.bpp;
-	in.pixel_enc = ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
+	in.bpp = panel->msm_dp_mode.bpp;
+	in.pixel_enc = panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
 	in.dsc_en = 0;
 	in.async_en = 0;
 	in.fec_en = 0;
@@ -1283,14 +1285,15 @@ static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
 	_dp_ctrl_calc_tu(ctrl, &in, tu_table);
 }
 
-static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl,
+				      struct msm_dp_panel *panel)
 {
 	u32 msm_dp_tu = 0x0;
 	u32 valid_boundary = 0x0;
 	u32 valid_boundary2 = 0x0;
 	struct msm_dp_vc_tu_mapping_table tu_calc_table;
 
-	msm_dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
+	msm_dp_ctrl_calc_tu_parameters(ctrl, panel, &tu_calc_table);
 
 	msm_dp_tu |= tu_calc_table.tu_size_minus1;
 	valid_boundary |= tu_calc_table.valid_boundary_link;
@@ -1442,6 +1445,7 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1450,7 +1454,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	int const maximum_retries = 4;
 
 	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
-						    ctrl->panel->dpcd, dp_phy, false);
+						    panel->dpcd, dp_phy, false);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
@@ -1536,14 +1540,15 @@ static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *panel)
 {
 
 	if (ctrl->link->link_params.num_lanes == 1)
 		return -1;
 
 	ctrl->link->link_params.num_lanes /= 2;
-	ctrl->link->link_params.rate = ctrl->panel->link_info.rate;
+	ctrl->link->link_params.rate = panel->link_info.rate;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -1552,6 +1557,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
 }
 
 static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
+					       struct msm_dp_panel *panel,
 					       enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1559,11 +1565,12 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
 
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
-						ctrl->panel->dpcd, dp_phy, false);
+						panel->dpcd, dp_phy, false);
 	fsleep(delay_us);
 }
 
 static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1574,16 +1581,16 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
-						ctrl->panel->dpcd, dp_phy, false);
+						panel->dpcd, dp_phy, false);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
-	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
+	if (drm_dp_tps4_supported(panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_4;
 		state_ctrl_bit = 4;
-	} else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
+	} else if (drm_dp_tps3_supported(panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_3;
 		state_ctrl_bit = 3;
 	} else {
@@ -1620,18 +1627,19 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
+				      struct msm_dp_panel *panel,
 				      int *training_step, enum drm_dp_phy dp_phy)
 {
 	int ret;
 
-	ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
+	ret = msm_dp_ctrl_link_train_1(ctrl, panel, training_step, dp_phy);
 	if (ret) {
 		DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
 		return ret;
 	}
 	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
 
-	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
+	ret = msm_dp_ctrl_link_train_2(ctrl, panel, training_step, dp_phy);
 	if (ret) {
 		DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
 		return ret;
@@ -1642,17 +1650,18 @@ static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step)
 {
 	int i;
 	int ret = 0;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl_link(ctrl);
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, panel);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
@@ -1675,8 +1684,8 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
 		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
 
-		ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
-		msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
+		ret = msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, dp_phy);
+		msm_dp_ctrl_clear_training_pattern(ctrl, panel, dp_phy);
 
 		if (ret)
 			break;
@@ -1687,7 +1696,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 		goto end;
 	}
 
-	ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
+	ret = msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, DP_PHY_DPRX);
 	if (ret) {
 		DRM_ERROR("link training on sink failed. ret=%d\n", ret);
 		goto end;
@@ -1700,6 +1709,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step)
 {
 	int ret = 0;
@@ -1715,7 +1725,7 @@ static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
 	 * a link training pattern, we have to first do soft reset.
 	 */
 
-	ret = msm_dp_ctrl_link_train(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train(ctrl, panel, training_step);
 
 	return ret;
 }
@@ -1814,11 +1824,12 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 		   str_on_off(ctrl->core_clks_on));
 }
 
-static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
+					      struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	struct phy *phy = ctrl->phy;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
@@ -1870,13 +1881,14 @@ static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
-void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
 	u32 cfg;
 
-	if (!ctrl->panel->psr_cap.version)
+	if (!panel->psr_cap.version)
 		return;
 
 	/* enable PSR1 function */
@@ -1891,12 +1903,13 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
 }
 
-void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			 struct msm_dp_panel *panel, bool enter)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (!ctrl->panel->psr_cap.version)
+	if (!panel->psr_cap.version)
 		return;
 
 	/*
@@ -1966,7 +1979,8 @@ void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_exit(phy);
 }
 
-static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
+					     struct msm_dp_panel *panel)
 {
 	struct phy *phy = ctrl->phy;
 	int ret = 0;
@@ -1987,7 +2001,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
-	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 	if (ret) {
 		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
 		return ret;
@@ -1996,7 +2010,8 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
+					     struct msm_dp_panel *panel)
 {
 	struct phy *phy;
 
@@ -2004,7 +2019,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2018,7 +2033,8 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
+					struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
@@ -2028,11 +2044,11 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
-	ret = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 	if (ret)
 		goto end;
 
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -2211,7 +2227,8 @@ static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 	}
 }
 
-static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *panel)
 {
 	int ret;
 	unsigned long pixel_rate;
@@ -2227,15 +2244,15 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
 	}
 
-	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
 	if (ret)
 		return ret;
@@ -2245,7 +2262,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	return 0;
 }
 
-void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
+				     struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	u32 sink_request = 0x0;
@@ -2260,14 +2278,14 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
-		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
+		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel)) {
 			DRM_ERROR("process phy_test_req failed\n");
 			return;
 		}
 	}
 
 	if (sink_request & DP_LINK_STATUS_UPDATED) {
-		if (msm_dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl, panel)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
@@ -2275,7 +2293,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		msm_dp_link_send_test_response(ctrl->link);
-		if (msm_dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl, panel)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
@@ -2311,7 +2329,8 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			struct msm_dp_panel *panel)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2327,8 +2346,8 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	rate = ctrl->panel->link_info.rate;
-	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	rate = panel->link_info.rate;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
@@ -2340,8 +2359,8 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
-			ctrl->panel->link_info.num_lanes;
-		if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+			panel->link_info.num_lanes;
+		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
 
@@ -2349,13 +2368,13 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
 		pixel_rate);
 
-	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 	if (rc)
 		return rc;
 
 	while (--link_train_max_retries) {
 		training_step = DP_TRAINING_NONE;
-		rc = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+		rc = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
 			break;
@@ -2374,7 +2393,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 					 * some lanes are ready,
 					 * reduce lane number
 					 */
-					rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
+					rc = msm_dp_ctrl_link_lane_down_shift(ctrl, panel);
 					if (rc < 0) { /* lane == 1 already */
 						/* end with failure */
 						break;
@@ -2395,7 +2414,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 					ctrl->link->link_params.num_lanes))
 				rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			else
-				rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
+				rc = msm_dp_ctrl_link_lane_down_shift(ctrl, panel);
 
 			if (rc < 0) {
 				/* end with failure */
@@ -2403,10 +2422,10 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+			msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 		}
 
-		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
+		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl, panel);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n", rc);
 			break;
@@ -2427,20 +2446,21 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+		msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
-		msm_dp_ctrl_deinitialize_mainlink(ctrl);
+		msm_dp_ctrl_deinitialize_mainlink(ctrl, panel);
 		rc = -ECONNRESET;
 	}
 
 	return rc;
 }
 
-static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl,
+				    struct msm_dp_panel *panel)
 {
 	int training_step = DP_TRAINING_NONE;
 
-	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+	return msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
@@ -2511,7 +2531,9 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				  struct msm_dp_panel *panel,
+				  bool force_link_train)
 {
 	int ret = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2530,7 +2552,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
-		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
 			return ret;
@@ -2538,15 +2560,15 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	}
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
-		msm_dp_ctrl_link_retrain(ctrl);
+		msm_dp_ctrl_link_retrain(ctrl, panel);
 
 	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2559,10 +2581,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
 	pixel_rate = pixel_rate_orig;
 
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
@@ -2579,18 +2601,18 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
-	msm_dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+		panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_panel_clear_dsc_dto(ctrl->panel);
+	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -2618,7 +2640,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
+		     struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2626,11 +2649,11 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
+	msm_dp_panel_disable_vsc_sdp(panel);
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
 	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
@@ -2639,7 +2662,8 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_power_off(phy);
 }
 
-irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	u32 isr;
@@ -2650,7 +2674,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->panel->psr_cap.version) {
+	if (panel->psr_cap.version) {
 		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
@@ -2739,7 +2763,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 }
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
-			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
+			struct drm_dp_aux *aux,
 			struct phy *phy,
 			void __iomem *ahb_base,
 			void __iomem *link_base)
@@ -2747,7 +2771,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
 
-	if (!dev || !panel || !aux || !link) {
+	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -2775,7 +2799,6 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->dev      = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5d615f50d13b..00b430392a52 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,28 +16,36 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				  struct msm_dp_panel *panel,
+				  bool force_link_train);
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
+		     struct msm_dp_panel *panel);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
-irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel);
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
+				     struct msm_dp_panel *panel);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct msm_dp_link *link,
-				    struct msm_dp_panel *panel,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
 				    void __iomem *ahb_base,
 				    void __iomem *link_base);
 
-void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
+		       struct msm_dp_panel *panel);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 
-void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
-void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			 struct msm_dp_panel *panel, bool enable);
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel);
 
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cd8a3b171d9d..1b9b7a4e5db0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -359,7 +359,7 @@ static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 		dp->phy_initialized);
 
 	msm_dp_ctrl_core_clk_enable(dp->ctrl);
-	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_reset(dp->ctrl, dp->panel);
 	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -371,7 +371,7 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_reset(dp->ctrl, dp->panel);
 	msm_dp_ctrl_disable_irq(dp->ctrl);
 	msm_dp_aux_deinit(dp->aux);
 	msm_dp_ctrl_core_clk_disable(dp->ctrl);
@@ -392,7 +392,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
 
-	msm_dp_ctrl_handle_sink_request(dp->ctrl);
+	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);
 
 	if (sink_request & DP_TEST_LINK_VIDEO_PATTERN)
 		msm_dp_display_handle_video_request(dp);
@@ -570,8 +570,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       phy, dp->ahb_base, dp->link_base);
+	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->aux,
+				   phy, dp->ahb_base, dp->link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -642,14 +642,14 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
 	if (rc) {
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
 		// TODO: schedule drm_connector_set_link_status_property()
 		return rc;
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp)
@@ -663,7 +663,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -688,7 +688,7 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	msm_dp_display_handle_plugged_change(msm_dp_display, true);
 
 	if (msm_dp_display->psr_supported)
-		msm_dp_ctrl_config_psr(dp->ctrl);
+		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel);
 
 	return 0;
 }
@@ -727,7 +727,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl, dp->panel);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
@@ -735,7 +735,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 
@@ -871,7 +871,7 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	}
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_ctrl_set_psr(dp->ctrl, enter);
+	msm_dp_ctrl_set_psr(dp->ctrl, dp->panel, enter);
 }
 
 /**
@@ -981,7 +981,7 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	}
 
 	/* DP controller isr */
-	ret |= msm_dp_ctrl_isr(dp->ctrl);
+	ret |= msm_dp_ctrl_isr(dp->ctrl, dp->panel);
 
 	return ret;
 }

-- 
2.43.0

