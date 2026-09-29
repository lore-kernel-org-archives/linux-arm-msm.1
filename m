Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27EC3D3481
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656025; cv=none; b=B23y1R5V0ghqZ4S5MqRZCTP7kvMd6cUeWFx/jBhvS/LYSUG0YGlS9oWEvJX4XH4I962gnITePvlvv6VBvP4ayIfApFboSFRXJ08Vqv5EPdA2dyS/wSQ7cKrd/Lmh1L28O7BmD1maQWZDH1Bnh1FFmJ/Kgq8fIfeYatvrbr9MY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656025; c=relaxed/simple;
	bh=tmRJom/ZnZkEj9eTqJ/sHhBFWy9zEdTwNmilYcIQNoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwr9CEqjuD4xMhKIPFQbC/xLDzNM9kdxfLH/Yv/aMMrAOeD1IWXP7ZdhWz86x43uXtTQ8dgjj8wFqM1dspxaFYxM9hCQ/uFIJyo6/7mMZOlITVveL5q0XleV+GW/UDujoHrwwiYBOIaOJuuwtudJcUQcUWJ+eA9/gzQQ1m3yVQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+0xgEL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP1QymMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+0xgEL2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP1QymMm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47fha4052905
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgMSDTV4LFduv2tnamqe0eTVJ7MAHMAdZMdKQg/9Cbg=; b=c+0xgEL2pMItXVPG
	YID4I7kvP1xdZ2dSqDX2HcpbuA49sxp9otnLMXzZcEo8T7+FGxoxmxm27s1J5bjL
	Z2Mshhmux7TLRIsjsfLfP7adebcEvDA/8xme5KN/pXSRDhqtJ7tjY1xEJVdY4s+3
	fgk2fM9v0b3vMTfVAYx+TJG6hvuJKh+KpnzYjOQX9E4Vp/ylGl4Y2FJCXmvDxKvX
	MLbWa3wREZrKgk4TMIQvwmAUiCYOoFsl4dnuifmZb0Ca+nDzkbWOAK+Sg8m8mvWn
	U19Iv/tifnzD6v+qeNRgMuz9N7GjlYdX2ip7xTBLX28rKylh1VOEwe2WLlNT4PNX
	OhGu9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxg2aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5333e3f5811so10462231cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656022; x=1791260822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgMSDTV4LFduv2tnamqe0eTVJ7MAHMAdZMdKQg/9Cbg=;
        b=EP1QymMmgjM9/REP92GPVn2RrtXjY2Bsjto9rXee5rtPrjtCqvLcZDh+dpcuL1Fhwu
         jYuGpM8b3x1I3NFofBW7cRYeRmfYcHcoxAuKku4M9M/K/cHW7de97frsYzDohz7NN2Mw
         EOg2miRZjUpYAkvSAm1sLvwWS6dB77/0PUWOaWu6AnfU/Ar81W5/Pmms1EK9mEjsiIeY
         S1k1S9QhGMspO+wK30YjepOjl3sgi5XkwCcN+p0lT6CPp65X9jbcmsl+JV2747hH8Yez
         CjFopt4jyJGsK0GLcqrXQFVBHJCVC+VkGcRIAYXL1+WONtJijZU5p5th+V6iaeRzecYm
         fRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656022; x=1791260822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgMSDTV4LFduv2tnamqe0eTVJ7MAHMAdZMdKQg/9Cbg=;
        b=opMYHijYCYPLmv6OoWWOSYQ/yMocFmQ1rpXAlKPBzLrdtOWR0hsEdvXnLUoJKIL0U6
         ZCXJeqgunwUBKS6TSkM96qzAabB6vTp5bbjXAnWwgHC7uvRMmmc5uJvDdIaNGOjITHOX
         1CQ5J64YnaZsmAammndu6zXAKR3fbFB8EBQLPtodWMUK4ACZbrLir225Qu1O6d4oCaps
         eLH2L96FDuBK6u/GZprIVY/J8PGCHsiPG5kTEWtM3VKUXzm8yKhYjhACttMPcPcbGs/3
         9PQqipkHv+9GktfWGLbAa85qWly43y/RkRbzElABS8iyXyTHt6oplnmz0FlOPU+v4jqz
         9qqg==
X-Gm-Message-State: AFuF++mEzrymU1yCDCL4d8kH6H6vhx2YhrNUcMj2CF2Abm/eyL0LIuG+
	oXynMyeBv6tjCf2NzwJH0Fyr9FcYyMmOES7/jDOFXcu/wS2msRJ8tqfFwpta/ZrYp+wyx6sX52b
	+rB+qGGomqX2MpggVzlQ5e992L1mB9bxc4OfoqIIxQ655kz2Xh+MQHi8TANeOgUDdoZPv
X-Gm-Gg: AYBFou1sPTtk6ivtQdLsjYN1VrJKrv3J2luJeyBY0synDFy1TMFbAqU5v8AKPxtwIXD
	IjCqcHUPI8dMAeYkBmcPpqj+K753xmk2Ot9VLjaFv9NfNzSdF4GpoIhAQh6TYJGmxsWjVkm+gJa
	fshu/dAvEajpFWBa917t6v7Yl+C9ncyqC1laqZkAkFih+ufb5wjbI62KPKhjXtlKTZjr+Un7fZn
	FIdT3sE1L6p9htfXadI+aPpl0hq5FrDkjSbapgpd6OmoMi8qmeEGSfjr60f6D1Idc8xkX8VelWF
	ubf+od37v5ZPZSEgRfjvx0oKQwJhQEdqdFSLlLD6aTce84r3e7xKpxu3QrA/+6bvfSzqXo28Top
	5Y0YZQUAlPuiVHfzm34HJRC81kIioiCgXrU7HT4FdzZeo+W86vZrAPB6qjOWdAYI=
X-Received: by 2002:ac8:5a0b:0:b0:532:885e:5ce8 with SMTP id d75a77b69052e-53357e16d8cmr26773971cf.0.1790656021554;
        Mon, 28 Sep 2026 21:27:01 -0700 (PDT)
X-Received: by 2002:ac8:5a0b:0:b0:532:885e:5ce8 with SMTP id d75a77b69052e-53357e16d8cmr26773861cf.0.1790656021053;
        Mon, 28 Sep 2026 21:27:01 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:00 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:31 +0800
Subject: [PATCH v7 07/35] drm/msm/dp: add stream-aware link register
 accessors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-7-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=12463;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=tmRJom/ZnZkEj9eTqJ/sHhBFWy9zEdTwNmilYcIQNoc=;
 b=ttJMXFHf16fxn34e6FbBifgi7GdulYIj9MdBTnXf2M2jdQ813trki/y3tVsIUx1QWR04PwA8T
 +GBfXLB30bGCNDN9vehgs61JxVUuQtYeqhy0NUtFPWEZUF1zz2Cb7FH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8epgnUkyyUvv
 AD7GhfJ4zteDloHaWjmfUDba9WJjxRI2QgzXE+V9x6ITB33p5ZS1nQ7YsRqrfqn2RuVedTpaGyQ
 G7vW88ljyclO1qLd4x08zytyduLispA=
X-Proofpoint-GUID: 2Kid9-Y9K4k8nbfBT-zwcuw8yn1Z_cmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzkaMcLqeBivE
 v/+1Pg7LURcN0BgX8Nh/gXK0ITgZ/2WPHBrRhkhbVROa/qlzsOOASuwqtDGKvvzlb7Q4MIZfZeq
 e5nzE5GaUdLL6p9Y/tA8PV1zUYe+PX/7UnrNIGl5CQ3juiYTs6Xyi8/4lSckazRyEtnV5QtALAy
 wm7Yn5G8z0v633YZmg37qPZi6pizHQsS+uczVks5qqffzvRA+rVW91D4iOuSf0PKEtkPjlgFRNA
 w128mVEnaAuGZ2up5gRW7Da4SKg7n8aeawFf0QwRF/FB4zYeYhOZTfOxbRvyIMCWe79UcYnGV02
 Fe4rcWE7w/YKbVJ1xKIoMA0uxAu+ubGh4/pgiECCDQgnlKqDKveQYqoBh7M8SxtyhfwdxylJRx+
 rUmmJDcfhMLFdAFWI11T6m1INmqlXR+Ncig/gXf6GDMebJfLNPime7C0KvT6ZEmgEBk9iaXRhwo
 Hh6whb5mAP1iNA7Jsjg==
X-Proofpoint-ORIG-GUID: 2Kid9-Y9K4k8nbfBT-zwcuw8yn1Z_cmJ
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb3e16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qYFs1fq_Vji6wCC2nv8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

DisplayPort MST uses multiple stream-specific register spaces. Streams
0 and 1 share the primary link register block with different register
offsets, while streams 2 and 3 use dedicated MST link register blocks.

Add stream-aware register access helpers that translate stream-specific
register offsets and route accesses to the appropriate register space
based on the stream id.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 64 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.c   | 37 +++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 5 files changed, 121 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c0f5226dc383..e1614bc49a7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -117,6 +117,8 @@ struct msm_dp_ctrl_private {
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 
 	struct phy *phy;
 
@@ -172,6 +174,49 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
 	writel(data, ctrl->link_base + offset);
 }
 
+static inline u32 msm_dp_read_stream_link(struct msm_dp_ctrl_private *ctrl,
+					   enum msm_dp_stream_id stream_id, u32 offset)
+{
+	offset = msm_dp_stream_reg(stream_id, offset);
+	switch (stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		return readl_relaxed(ctrl->link_base + offset);
+	case DP_STREAM_2:
+		return readl_relaxed(ctrl->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(ctrl->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
+}
+
+static inline void msm_dp_write_stream_link(struct msm_dp_ctrl_private *ctrl,
+					     enum msm_dp_stream_id stream_id, u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	offset = msm_dp_stream_reg(stream_id, offset);
+	switch (stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		writel(data, ctrl->link_base + offset);
+		break;
+	case DP_STREAM_2:
+		writel(data, ctrl->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, ctrl->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
+}
+
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
@@ -397,7 +442,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	 * RMW: called from atomic_enable(), serialized by the DRM atomic framework.
 	 * Clear stream-specific fields before OR-ing to avoid bit accumulation.
 	 */
-	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+	config = msm_dp_read_stream_link(ctrl, msm_dp_panel->stream_id,
+					 REG_DP_CONFIGURATION_CTRL);
 	config &= ~(DP_CONFIGURATION_CTRL_RGB_YUV_MASK |
 		    DP_CONFIGURATION_CTRL_BPC_MASK |
 		    DP_CONFIGURATION_CTRL_SEND_VSC);
@@ -415,7 +461,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_CONFIGURATION_CTRL, config);
 }
 
 static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
@@ -472,7 +518,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -482,7 +528,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_MISC1_MISC0, misc_val);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -2528,8 +2574,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
 }
 
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
@@ -2784,7 +2830,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct drm_dp_aux *aux,
 			struct phy *phy,
 			void __iomem *ahb_base,
-			void __iomem *link_base)
+			void __iomem *link_base,
+			void __iomem *mst2link_base,
+			void __iomem *mst3link_base)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
@@ -2823,6 +2871,8 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->phy      = phy;
 	ctrl->ahb_base = ahb_base;
 	ctrl->link_base = link_base;
+	ctrl->mst2link_base = mst2link_base;
+	ctrl->mst3link_base = mst3link_base;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index bf593f4a4480..80d9258501b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -35,7 +35,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
 				    void __iomem *ahb_base,
-				    void __iomem *link_base);
+				    void __iomem *link_base,
+				    void __iomem *mst2link_base,
+				    void __iomem *mst3link_base);
 
 void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
 		       struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d8b28a562653..bb5e35e11b4d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,6 +85,12 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
+	void __iomem *mst2link_base;
+	size_t mst2link_len;
+
+	void __iomem *mst3link_base;
+	size_t mst3link_len;
+
 	void __iomem *pixel_base[DP_STREAM_MAX];
 	size_t pixel_len[DP_STREAM_MAX];
 };
@@ -562,7 +568,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base,
+				     dp->mst2link_base, dp->mst3link_base, dp->pixel_base[0]);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -571,7 +578,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->aux,
-				   phy, dp->ahb_base, dp->link_base);
+			       phy, dp->ahb_base, dp->link_base,
+			       dp->mst2link_base, dp->mst3link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -846,6 +854,12 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
+	if (msm_dp_display->mst2link_base)
+		msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst2link_len,
+					    msm_dp_display->mst2link_base, "dp_mst2link");
+	if (msm_dp_display->mst3link_base)
+		msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst3link_len,
+					    msm_dp_display->mst3link_base, "dp_mst3link");
 
 	for (int i = 0; i < DP_STREAM_MAX; i++) {
 		if (!msm_dp_ctrl_stream_clks_on(msm_dp_display->ctrl, i))
@@ -1208,6 +1222,14 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 			break;
 	}
 
+	display->mst2link_base = msm_dp_ioremap_optional(pdev, 7, &display->mst2link_len);
+	if (IS_ERR(display->mst2link_base))
+		return PTR_ERR(display->mst2link_base);
+
+	display->mst3link_base = msm_dp_ioremap_optional(pdev, 8, &display->mst3link_len);
+	if (IS_ERR(display->mst3link_base))
+		return PTR_ERR(display->mst3link_base);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 504d7542d30a..d3468b73fdc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -25,6 +25,8 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 	void __iomem *pixel_base;
 	bool panel_on;
 };
@@ -96,7 +98,19 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
 
 static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
 {
-	return readl_relaxed(panel->link_base + offset);
+	offset = msm_dp_stream_reg(panel->msm_dp_panel.stream_id, offset);
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		return readl_relaxed(panel->link_base + offset);
+	case DP_STREAM_2:
+		return readl_relaxed(panel->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(panel->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
 }
 
 static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
@@ -106,7 +120,22 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, panel->link_base + offset);
+	offset = msm_dp_stream_reg(panel->msm_dp_panel.stream_id, offset);
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		writel(data, panel->link_base + offset);
+		break;
+	case DP_STREAM_2:
+		writel(data, panel->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, panel->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
 }
 
 static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
@@ -766,6 +795,8 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base)
 {
 	struct msm_dp_panel_private *panel;
@@ -785,6 +816,8 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->link = link;
 	panel->link_base = link_base;
 	panel->pixel_base = pixel_base;
+	panel->mst2link_base = mst2link_base;
+	panel->mst3link_base = mst3link_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 75b23c106a99..dc046fec24fc 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -104,5 +104,7 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg);
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base);
 #endif /* _DP_PANEL_H_ */

-- 
2.43.0

