Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2623559DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527872; cv=none; b=USw9zL+q9rafWGnFCsUUSCu1EOQIS706yPqcB2CHnFdAW9XzANHkdmfpX/4g3tGBJE/OZHFfUl1YXq3PmqXHyYvK89ICEUZ5zhScXaOnllHTH5mFcXqasQczL0jBjT5GdGcXxGRfMGQfnHpq0hBQ+o5lG0LRPXzLoNUs0FfXm8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527872; c=relaxed/simple;
	bh=SrK8XPLCsmlyTunIHhCIODHVtqwW8w2A+TJGN2u59pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAUHnA3m6hyEIgUZ0VFtkhtDj+TptbCT+cd41QFZubPvLb7d/9WxwLRg+VcscrjC411JdFZcO3wILfry2idZOQu4+tfkW5uRwXvzF1u2iLnBbiEyL1FBUi+oxuT1oXCbG5Jprvxpfgjq0xEIAIWW1eyBIh2wtybvELIJkKASRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WndxS/QP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5hFPf6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WndxS/QP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5hFPf6b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtOLj941061
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3MczQC0wTWVeQ3mq3nzNIjw2qe0TzQXQZvphNTOvUY=; b=WndxS/QPPX3O3W7h
	apgN/FzlGp5My5diaKTMW+q8HE43PsOII0jCocYj9iD76BByg5qOZrFCHYm1Z+Wp
	QZBF4VTTYGuq28W8Xyqdji1efYiOB6Mb6enbeDJAWlp4cwbpJFoy3OhwJ783p1hC
	EoiMB6ncHVkWzj/GtNGabN+qX9LJPpiNLxiqsAFPzFKQLCxBzGOLQe9IcNfv+F6P
	S9G1F5wkZ+eIR0g8n4X5OJ/p4C6R8lMzvMAWZFvoM3o2MrcJNca9MwrXdPS2H7qJ
	KFAs6H4/9LGJENfFs0ddCKX4SP+JbASSeF+Em32EZiJyik7/RYxy6CzTS6vv5Wn5
	uDznFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6cn7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso199110916d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527865; x=1785132665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3MczQC0wTWVeQ3mq3nzNIjw2qe0TzQXQZvphNTOvUY=;
        b=M5hFPf6bIq2+wl2oJ9o26lpksdrZrwPQdOQcjD/BiTFTHtjoBMrzRnesYH9B+1NHGL
         umHH3geWnwUsjThL7dKsLFhiYnypdArUKmuaibmfShFKAtCGo6yCTqavT3l7462iPdtH
         ubrHf9Q1lHfd9dMqjTAABAnaeqgt5abHXEX0o71WWQKVRkeVgfN1HnlRjayZMfpzx7RV
         2WlxmFvUzdfhyggpf+smT9SltJAVEPVu/T1HXuUcWVQ1GWIJaugPr/tT8A3S6VJWhBSk
         rpzcaEgID2xW/gkqz5VNkJxJogIErBYJU/dtW6iqbdN0Eg34D7HMXc5LbGdENgmce1L/
         hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527865; x=1785132665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3MczQC0wTWVeQ3mq3nzNIjw2qe0TzQXQZvphNTOvUY=;
        b=tRnQd+n1WhGoXg+kgf2Rgg5ZgqA1P05MQ36AOjD8+3KF+B4WoW5oOWKtPbDQpxLVDY
         wVtsSHpGLUG8t9kMZjxmtPDEfMer2nsItykJo1cue6d2Mk+Ec+W8Y4RVvCGz/guFT2lx
         NeLHLRxl5HsoDiJOlCtQifJXd9Gq17p3uPg88XheIXa6Scd8Kdxks0TUcpoFiQZ6dWSG
         ZhUmPe+CV00/T8ZnRJNf26ip3AOangAuKDIRI4UHRFgwmjDACN8fSaQYqtp8FtRfIwjA
         qw0wIfm1j83W5bujMRGl+FyWPQ27TN+l+0ueZKGjRTeg/AVeuZ1fUaAjEddXi6XjjG8K
         7bJg==
X-Gm-Message-State: AOJu0YwrqIo9aLdtQ6+FO6QczjUuImvuaNqdkjDDFGNjlV93+ulypjjA
	hqz3y3y5wvYWjnf2ScP1vIQwvz2dYduAP+P9iFZ3ZY2sb+no873uCsFN/h3zJktKcP5VAJH1tG8
	cxxcYNxPMBy7hoC3EkTVYyzDVlHnUXAhR/gvZ0r0e73/W6CB2BPdxussIuLFSxeYSO0Y/
X-Gm-Gg: AfdE7ckpDZP6qh6Nv4gxpKgzmFW3qORbjJwVG04ltjeHq7BRSPSjyu3zizPQrRgyGvh
	EMfQ6ci01sn3QCrSV+nHaDSu33078+AK56iTRWan1INjCNiC3RprspJ899PHwgLhkSwaT0vYR6j
	VuwHg9+toP7tDs8pAvtg0dG0ot33XLP7gIJdJN0J/SpMr7s86oedlCxqLMyO3tAvCVXILp/Mesr
	V4bm6xMzHU1NVXYi2uDaHL0JSFwJ3JauJMkcr0aaSW0588gZS5RID0YUYXm9gRVIELOIsmlfjfO
	UZbbj1Gh9NdOs+ylNOY4EYNgjRoziQKqVoA49ixTDmvOCmIx6Qf6okGpr/yoJfM1utSX2AHjciM
	bHwAFvcE6J8vsyxH+pHfITE4Yc5sSmB9udhNhH+o8b82Pn1rTg2ZoK2hc2TOQMpM=
X-Received: by 2002:a05:6214:2f8f:b0:904:2a2a:d3 with SMTP id 6a1803df08f44-907783d1c8bmr154829066d6.47.1784527865237;
        Sun, 19 Jul 2026 23:11:05 -0700 (PDT)
X-Received: by 2002:a05:6214:2f8f:b0:904:2a2a:d3 with SMTP id 6a1803df08f44-907783d1c8bmr154828896d6.47.1784527864761;
        Sun, 19 Jul 2026 23:11:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:11 +0800
Subject: [PATCH v8 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-4-bea261bf4e7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=3888;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=SrK8XPLCsmlyTunIHhCIODHVtqwW8w2A+TJGN2u59pA=;
 b=+rSu5mCBvXZ9+4i/Vd/ZLhxxgCDl3t+6LMh2BqGQgJLSYpIalrMWK4zRJDcxpdiiRs+QGLRm7
 JEJxoB1+oB2DOxsDP9OB3TeSTfAAsuzi+84+GOPm1ubNGjgEt4XGX1a
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: O_AtEVx-l_OHfSHN_ov9ewFwTLJwJ1B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfXwZSq5vrN8pG/
 0nWo7DJU+P3G17l3Eemf/uyoE5vXD/eOsJ7EiaaxsFUXiSEZmv38UyxALcy5qDyDqr3Vc7JWQf2
 Kkec8ncDJoF65lCVscxQURuihoTFjoI5onYzl9FL9shWYGnfW4NNhvAsK4j7oA0Mxfsu090Y5G+
 KMJ9RnfTQqQbEihYze3TvlhZEc3VdV/zNAW+24Ho1mL2v15H56SlD+I4eb15FvUswIHzf/D91fM
 LtDzPzhycEwYaDpgx1DtU12kg9lXKOfatDgzBGjIvUIPoul6124jga8GYku3sNs7STEZwmX1OkT
 T5xtr5K8qKAIYo2rl3xMcfg7G/QAJ47zOtqpB7TM/704b18zqL8121wSU/vDKTujvOWggF2Ytwu
 RtnYRLdiR4ocL9QgmG65Xi4NmZs+AMivzungancqAekQ5C+D6pjVwrMWjmDNg+Qagqa36LpL+hB
 hT9sqRhLJHQfcxfAzvg==
X-Proofpoint-ORIG-GUID: O_AtEVx-l_OHfSHN_ov9ewFwTLJwJ1B5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfXyn8+HI4W5LHZ
 BCurZiwkXlyQxJvpvcmzxTlYHH6vKl4QldlkhnFYtOLOtTjTJx30leVpAhRLI/YwHIRFdiJy4ZW
 Hm0PQHdY+57wLpteOIUcdjrQ2CLqUVk=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5dbbf9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=N4WGanfLxQUAwF0MUGsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200066

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together. Separate the configuration into link parts and
stream parts to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 47 +++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..4c62b0e137c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -388,26 +388,44 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	/*
+	 * RMW: Called from atomic_enable(). Serialized by the DRM atomic framework.
+	 */
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+					      msm_dp_panel->msm_dp_mode.bpp);
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	if (msm_dp_panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 config = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
-
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->msm_dp_mode.bpp);
-
-	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
-
 	/* Num of Lanes */
 	config |= ((ctrl->link->link_params.num_lanes - 1)
 			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
@@ -421,10 +439,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -450,7 +465,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1628,7 +1644,8 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;

-- 
2.43.0

