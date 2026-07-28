Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01894218A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234123; cv=none; b=pEu9x8Na2+YZrf5NWLyKs6tbo4p3U0DvLtRUOl9RP4ppnjKH2doFFBrpyjEzaYc0vvSpO7bSZaBIR2LwDT8HpTMnoMM7LrtivBGORoVHWNbZNLRzWB69eWyr3bO+SNNS5Fgg+EpXvm2E7dzyfhEmHOI+WdcW/iT9F6CmUcTfSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234123; c=relaxed/simple;
	bh=sTyzpXuvVepmyugQFjUs9JdBYN2AL6nR/pGbvI9gphE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuhfLqczxRsu8tCP3ng2Dflts7wa8D/M3sYODxTs9E4rIkS8gR1QC3+CvPwG1Jvxn7Uz6sF6l7b2AgDdh82Zp5tg79dLKDlbIafl7wP/Ua7NWvME8IuGao6VR7sMXNqg9Rhp63QnwmgjYXlcqv1epsIz/g9V9AjSocUyREdzEdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZM4a7x2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gaws7sLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZM4a7x2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gaws7sLZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S823NL1663736
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmyNpWe0aDHYLGgCoE0NRQ96OEsYKOj7YwVmjluAaEo=; b=OZM4a7x28ZeKv3BG
	EywMHUM0lKu1+uUBmr8+i6uG1Hk00aLoks0h/bDq7GGIZT+NUGI+tSAE7m43uOjO
	nikQmtSNkhAIssma77ZBiWZdWJT0+ejF7Fz2MswcZLLHYj/enJdLjMIJvDuFgQqV
	QPGwxB5ytJGba0KXwl5p8qWk2zykkdxjSlqudVcq+DKykL4XViG7sd4WiVziRLya
	+z4urjU7mai+AxkGbC9cHzesE2j8qPjs5BNgKhDN7KV3+K7kIfDAZwOBt6bK3v0L
	WvHfrU6YUZP4y6A6Yca85NA00tRrebOCYwNGNYq0WklhePB2TsWBOX16ea8izrpo
	nl8HZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptts2em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e97889ac8aso46425796d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234120; x=1785838920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmyNpWe0aDHYLGgCoE0NRQ96OEsYKOj7YwVmjluAaEo=;
        b=Gaws7sLZXLV91Ajj5PdSvvHcO9HEzrBU/HuNnlw2my9mq6CJkCI1tG5xWn96ebMxe4
         RLmaa1n2QWCWLiXFOZVW5wGTBoJjRl0+gbzjSSwjdAQGRYbRKMHG3ssS1Mz7AT3w3rSt
         B9HPC5mCjnWXcPCeBdQtZO6gka5cipBrjeAyOlq3K5yPkzTEtaADG3F6QrO3of8eYxdn
         m2lMQ0XffnOlajNkzyeZzJI+QqpcIfnvby1s5BHAENhSpEsxJUxQjbbqpntaUVnhH9E2
         gQ4WW23jMLFNErl0/s/KPgxbhSD/J2mp1m3ipGR8WfajiIbYRin13avUs1dT/lxbErZw
         01gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234120; x=1785838920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmyNpWe0aDHYLGgCoE0NRQ96OEsYKOj7YwVmjluAaEo=;
        b=m/QbzBSNzAckXS/F2r5fjCp46vR5WTlT7b3p9VWac1FheYzxhNfiTfCV5Pc8kHUWZK
         iEfw/hZ3c/JIgpWWBvbE7lRBwv1R5RF0C7Y2Tv7yALtFOJzEaA7jLy0t/I/7QFCe9U8h
         eo6BFzaBEUN6FfpzyYNbEZpNbKYFp7uY7HyKr7FR/2ALrdMDgedQCZm3X+UYyUGU7v1A
         nbcMErNVUJY0eaKvko2GHmaDSYaUrR/TLpdAgQN1mmDaWoz5yM6lZDwKLk/KH40pYFI3
         hvXqmwv0LHpx69w+WftMVgf6ZSEvBnaEG1XKCbYr1b8uiz8IqEtoLvNtuacSF4KoOuoJ
         OhDA==
X-Gm-Message-State: AOJu0YxKKM1/aots2dY1e9CoIdZYxin2uwaeAzSQNabFYxlx5tBdJhgx
	brDaHPt6faRLp2+Uen83onOJ55pxkS5/5lIewey//ygptbPE1aAwfZJUiD2NQ/5ukSvSpeGWExG
	71GeWAoiJiW9lN/X+cHbnoGlB0ZSMwMtcHzG3n0FkS6Bo0ZJpZ7FyB6UReQRRRhOgm+KK
X-Gm-Gg: AR+sD10XD/V0eE0W2lu07J2pA64SnXWxpbA8yq5oIj6XhZHrDN3Jjqumv8mZ7G0PxW2
	oripfOuREwOL0AfJZWDZSo2nJ2E4a+3kFCFh+MdXSIhzkm9Yjxk8bfKDkWyNfk1kR+Hk1AEaR3k
	jrj77eZdVnGevRkAnVj1UlbrVChSAfn8vHbAMV4+UWO05LA8rpvtTdXTmb8y/QxFyYiHyzDqmjC
	ZlxgFOQfoDtuwcUi8iNHvQMG0wMg8ZsF7mQfRmQd3HSCAKcXsTBDQvoAhquZXkBgcBnMEBdecyX
	tby4pTKEFSFIKz0xuTfcnou3yq4vZyhyoo2+JO/GmkjUajfJ8onDOQg10D+z7yyZWQOKT25kz8H
	69xtEB/r9dpHW/7rXUywyh92/dCvxAi5Ib+j3r5MuD7Jhk4rWvXyVnjfswA1dyBA=
X-Received: by 2002:a05:6214:1c85:b0:8eb:eb8f:a37b with SMTP id 6a1803df08f44-90817088987mr17958246d6.24.1785234119675;
        Tue, 28 Jul 2026 03:21:59 -0700 (PDT)
X-Received: by 2002:a05:6214:1c85:b0:8eb:eb8f:a37b with SMTP id 6a1803df08f44-90817088987mr17957666d6.24.1785234119082;
        Tue, 28 Jul 2026 03:21:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:21:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:33 +0800
Subject: [PATCH v9 04/14] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-4-f7779fce10f4@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=5044;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=sTyzpXuvVepmyugQFjUs9JdBYN2AL6nR/pGbvI9gphE=;
 b=3aTqVCtRrMrxkJH93eBe2YkbxGhEKVKlZlzNZqJ2S9SPcqqMvz++o81c+3Gl76S1aT7rt42u8
 1RjiEMTxkrWDBbCLAwqjneYsZHVRTd06UwjGUHzYM+JYcIziDtYNC/F
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXzPtCS1tjtpaJ
 v8PQ+qOXTPnx6u19wE4xVNirALBMlOgdd8VJ5aQSzGTBl0pEXaam3ddPuL9sJLnWMf/0aOddYHd
 eqsxIjeVLTm5Gzf85O5NEwcH6bRU5xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX43shoUUvp5GV
 f2Pkj1PBWXvFqF31w7Lw+/tjtqTiN0jt2EznNSx9kwWsceXBwck2O/qVHYXgPy+VVMnwzSmCer2
 MSeKi8oxQiyrIevmYlGFAe7uhMqudkACVYuil13oc+1Nzxzok6s0e70FD36DlTIM9u0OOHCPkcE
 +dbl2tJMdq/+DAiz8QirZbw1KcrSGZIFxNj6QNWhxqaE/l/NiqIyxPRuz4NwkfkeVetwaWXS8k8
 TQ09hhA+cvHUoGOwl3NF4VzXLuAJOD7xOWa5G18r7D/ny02n4aKDgz8LaTILoJ1Hx/RtqydhAvf
 MryZcEf67wcN7ffm6eYblrRoxDCecDt9lf8hb1v8mCddzjT6c5u3lYPz/i3zCBU39N0CVitdvJW
 ppWx+92PShKxDOPn+tKnsYbPU099uKdSmiZYVMbpgu5x5XWs03lAuivbvEcbwGxsyMPNgn/qCCu
 Hss2RyJ/HOtaDm/W1Cg==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a6882c9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DFBjIeB4u1z8T3315IQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: WOiW_g6lDGF2UZMx85v0mUvP3BL8p_Es
X-Proofpoint-ORIG-GUID: WOiW_g6lDGF2UZMx85v0mUvP3BL8p_Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together. Separate the configuration into link parts and
stream parts to support MST. Clear the stream-specific fields before
OR-ing new values in the stream path to avoid bit accumulation across
repeated calls.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 51 ++++++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_reg.h  |  2 ++
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..7c0649d5318f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -388,26 +388,48 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	/*
+	 * RMW: called from atomic_enable(), serialized by the DRM atomic framework.
+	 * Clear stream-specific fields before OR-ing to avoid bit accumulation.
+	 */
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+	config &= ~(DP_CONFIGURATION_CTRL_RGB_YUV_MASK |
+		    DP_CONFIGURATION_CTRL_BPC_MASK |
+		    DP_CONFIGURATION_CTRL_SEND_VSC);
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
@@ -421,10 +443,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -450,7 +469,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1628,7 +1648,8 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3689642b7fc0..dda4b642c81b 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -149,8 +149,10 @@
 #define DP_CONFIGURATION_CTRL_ENHANCED_FRAMING	(0x00000040)
 #define DP_CONFIGURATION_CTRL_SEND_VSC		(0x00000080)
 #define DP_CONFIGURATION_CTRL_BPC		(0x00000100)
+#define DP_CONFIGURATION_CTRL_BPC_MASK		GENMASK(9, 8)
 #define DP_CONFIGURATION_CTRL_ASSR		(0x00000400)
 #define DP_CONFIGURATION_CTRL_RGB_YUV		(0x00000800)
+#define DP_CONFIGURATION_CTRL_RGB_YUV_MASK	GENMASK(12, 11)
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV		(0x00002000)
 #define DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT	(0x04)
 #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)

-- 
2.43.0

