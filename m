Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294C4426D22
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234141; cv=none; b=MPCYDu029Izo366+YHNsqYE2FtWIMoMKVyaIE91LXPLSgCtS5GJWooCs58As7HuQewlI3iPQWiO1HTLgeZyiZOIhDBNlctCy6p7J3UvG0cnWvoIFZVSyWWbrNI+fLBrsVZ/QOcqM/HDsnXDwGVxsNlZH1H3yQzTw4Zlnq+UKro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234141; c=relaxed/simple;
	bh=8GXRU4HiDq0oCmempg3dcYhFY9Q2wN2ZZ80ljtXbZWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gi0voD6brVQwbPe5lqb6rNWxIdSPbrMcuQNMKGNiGRcrIuH/pOBxZH7CyMjzW5szYCAmZtrIRlDO3dGcx3QYJTu+jB6wuxAcHDRgb4PYDnqPdOoEWvhgQB8gxK48eN6VkIdeKYKhuOSiQmYQK53o6At0CNpYnDBgUqbLnPGyv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wlq3xFit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQLVRSAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wlq3xFit";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQLVRSAb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82AlD2358479
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gaRbo79mTQ7cvnz3TBZEYgq/9oAstHfOC43OQB/Pg7I=; b=Wlq3xFitRJwfsW8J
	O5qp640sgHbVcP72wYr2E0Wn9NBgtc/mtMY2S/++BuZoAr+xyZKvEhFzcdwnhurs
	TMgn3IppHnzryPIpBkGLaL17PBST74PcDama5cW8MMOlTIcxvnEj7RdPffXuJ5YF
	DNr4rbd7Ul7w3J5su0JxJMMh7UGkBhiKz/9+InHq63lqB/g/C9gFdwn8u/hmjvbn
	/TWuVvDcY4gwcnnUkfRlytuxk+h28efHhlTktt3iYl5YK0puJJkVbPmH9c6MdjMO
	K0SgzRbYihr7QtYQUmwklfgKHmvuygkdYBURJIG+0kWq0Tv5jUf5kPc/9KynNWWH
	03VzVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y1ecx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90284139cceso8146836d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234138; x=1785838938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaRbo79mTQ7cvnz3TBZEYgq/9oAstHfOC43OQB/Pg7I=;
        b=XQLVRSAbc6KJOiXADcJQxm08TlO2oJsYnXPmtP3a38F8XATLkZIXqpnTW2l4+/Me3b
         dvBcy+XfVaad5vDG2Dt/rq8F9h9/Gv/4memZDXe/0q8d1xFkXToYMFNsLKQBXzmfzx+7
         TTVEKGnHj36QBJp6Qr5kZuDW52FJJgcOlIciGrApNYSaUzrYTWMW6z416teo1SBBkEmS
         BROLGOc944+IxBg6TNIG2qU/SUNdxFXiB617H6wny1XWB2FPvEVE2KHfvZwvhG2IXxzY
         YC6R1tQ6Wv/LtxslwpQYwxkExvs5BBvwZEcICMjgdQ+7leM8vYLQAiBjRC06Hh63C3MX
         1wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234138; x=1785838938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaRbo79mTQ7cvnz3TBZEYgq/9oAstHfOC43OQB/Pg7I=;
        b=l8AcaOVrbM46sbhQOmXbbYAmta5wBvYEBWzwuY4C/IJI0ATx+YiozyMemmiPUe7sKH
         ZzTVUej9UQAz72l3M3c36TBHsg1q+n525mZmyFktWjtoqfwzuBWOP/EqZLNP0GmveHIY
         m97HFx7QuTjpgwQmYeNS0QU7KxUR+6Xv83ce/inhgaXBqoQSGB2H+w2UIF4kaZja/ywA
         bOzeUr+Utx1dhvofle5A2vuJDDbKiRt7Dd101kkDPzxz81EMSByXnzPcu+KnFIY9d3/i
         hf/Nv8JSutdBNvdJ10QMp99dYyz36OPN7By/QsD8VW6EcnR42FxrxxctJKQm7CvUklWT
         A3wA==
X-Gm-Message-State: AOJu0YxjNTugjE/DFwMr3MUjSHC0vGuM4gJXnGzQrtfJrIournGL/52p
	BlAm6QPdt3yydT/eK95zvPOS4HZncyrtZbBRZT5cNMpKsKyyImVhRX2gtTmots5XVT+Dy2a+370
	+aGeuMTsH2bjHYbvZJvHR8tBjTkV6o6r3853lA8pcFFlJ3RnREZPK6sdM8hx+KR+pGE1x
X-Gm-Gg: AR+sD12XOJVzZTZO4+1LrdhCyV7/xDLrmHxW5o+rW5cbwC2V8eVp/9gixpDjQU46gHK
	mIPOCxqMqIha3/vQfB+sBe7zTshFDxltwsm99lT2YJiREX9gMzU4XQKpltszQjsi5eHU+i0Mn1w
	JjIGSIzucbYWf5tz/kiKS6m23RwyDwpC+5wrvru/xy//ku+zoprp/bj0YhkyqqX0tinr0vvG85f
	5Z0zkhrOAuezG8x+Vhtqj58WkORiYmCBQlyuNu8VW8GQs2x34oXQmBxp1/L68zmMUJfXszrrLbF
	e8LxLAVq/TeSYX665Ty51Ji6pEOwdBrxZLSYna7hisHwjfExT/FFeKfXiRE4eYEC8y/Uc/J7rYq
	aFMghHEcuXHQAfgQAx6mkdJt7JEvWW1Tq+vKDJ2KxTc1cnbepQ05FFIQcBuLirlo=
X-Received: by 2002:a05:6214:1cc2:b0:907:5319:53b7 with SMTP id 6a1803df08f44-90817306839mr15594646d6.18.1785234138564;
        Tue, 28 Jul 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:6214:1cc2:b0:907:5319:53b7 with SMTP id 6a1803df08f44-90817306839mr15594336d6.18.1785234138127;
        Tue, 28 Jul 2026 03:22:18 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:17 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:37 +0800
Subject: [PATCH v9 08/14] drm/msm/dp: break up dp_display_enable into two
 parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-8-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=9747;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=C2/dV8lrwq4yehu/VdhEZugiR45PskEy2v+7N2rUw7A=;
 b=H0vFmfrh3iZXK/2sOKvBWEcILn8UnZFnAktiASfw4z7/hI0+80PyZI+NuUMKspV/DSzb5BNbj
 zqITb12F6mzAD8ynt2q/B+UIjMk/tNCJEVQ/3UMn3azQ5HGj4vTYwXi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a6882db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TxpgYK2B9OK5DiKRXcEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX3H3FdJ6ftKUY
 fCTwRXLrAvz5gM41qPDhq/sUuYt4O+n0hAgkZXt3zX4Vmm/4GF7Q+Rm+N9oCUYGO1ycCyx7UAxO
 d4f3Jrn5bIKgYBrLXSgrRD+qp9GPeOQ=
X-Proofpoint-ORIG-GUID: hJfUgzH8pVT0reprFck4ArLGWQ9hc2MF
X-Proofpoint-GUID: hJfUgzH8pVT0reprFck4ArLGWQ9hc2MF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXzEEfqaYCR7xC
 wUfhgb650GkxHzrSa4Ctey5nKuLrnGEkJlRQ+HT9rUM6+s0GLmUowgAcS8+FTVi1lsKFLgGmq9e
 q/77C8qCg41vfYxHqbnhB37Md+v+mIOqepMugleYSIWyphtyfRS/xOqPCXjyMA4pbuL3mJbF3XN
 FK1XgeVwkn4ZmmNjcNu3MTkxBm8J8Tm3ls9YNXUjM5Te9RI5TG5si7YFfb2/xlZjeEsoqt9lltB
 SGJLJcCXtVRirIA5wfLNYv1FPnJlYwigHr26IKP3baxhTaT2RpTr2GodVtDnzsrxoQQ0hYRNBby
 vziH+bgBN0wTLNw79LI6giIHNtaq0GWbsHqNy13HelS2HfjqvV9uDC5dLYJJ2fM4Tizv16zhaYM
 SIGT0J8MnMWzdbqvzOUk5D9Kqx5cFKioxmGe/4bCZGXJcQbGlTT0dyflwDS2/Og7YcXLJwcq7Lx
 9AL9viMPkqpUa1gY6kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_enable() currently re-trains the link if needed and then
enables the pixel clock, programs the controller to start sending the
pixel stream. Split these two parts into prepare/enable APIs, to support
MST bridges_enable insert the MST payloads funcs between enable
stream_clks and program register.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  48 +++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 105 +++++++++++++++++++++++-------------
 3 files changed, 103 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 068d4f8b673f..43094dda3434 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2511,27 +2511,19 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
-	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
-	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
-
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		pixel_rate >>= 1;
-
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
-		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
+		   ctrl->link->link_params.rate,
+		   ctrl->link->link_params.num_lanes);
 
 	drm_dbg_dp(ctrl->drm_dev,
 		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
@@ -2545,16 +2537,40 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		}
 	}
 
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
-	if (ret)
-		return ret;
-
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
 	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
+	return ret;
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	int ret = 0;
+	bool mainlink_ready = false;
+	struct msm_dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
+	unsigned long pixel_rate_orig;
+
+	if (!msm_dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig;
+
+	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+		pixel_rate >>= 1;
+
+	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
+
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set up transfer unit values and set controller state to send
 	 * video.
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f68bee62713f..1497f1a8fc2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2a84a6ffedbb..d094d484474c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -617,7 +617,42 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
+static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	int rc = 0;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+
+	if (msm_dp_display->is_edp)
+		msm_dp_hpd_plug_handle(dp);
+
+	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
+	if (rc) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		return rc;
+	}
+
+	if (dp->link->sink_count == 0)
+		return -ENOTCONN;
+
+	if (!msm_dp_display->power_on) {
+		msm_dp_display_host_phy_init(dp);
+		force_link_train = true;
+	}
+
+	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		// TODO: schedule drm_connector_set_link_status_property()
+		return rc;
+	}
+
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+}
+
+static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -628,7 +663,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -658,13 +693,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	return 0;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	/* wait only if audio was enabled */
 	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
@@ -675,6 +707,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp_display->audio_enabled = false;
+}
+
+static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	if (!msm_dp_display->power_on)
+		return 0;
 
 	if (dp->link->sink_count == 0) {
 		/*
@@ -1395,45 +1435,29 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
-	struct msm_dp_display_private *msm_dp_display;
-	bool force_link_train = false;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-
-	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display);
-
-	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
-		return;
-	}
-
-	if (msm_dp_display->link->sink_count == 0)
-		return;
+	struct msm_dp_display_private *dp;
 
-	if (!dp->power_on) {
-		msm_dp_display_host_phy_init(msm_dp_display);
-		force_link_train = true;
-	}
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	rc = msm_dp_display_prepare_link(dp);
 	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		return;
 	}
 
-	msm_dp_display_enable(msm_dp_display, force_link_train);
+	rc = msm_dp_display_enable(dp);
+	if (rc)
+		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(dp);
+	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(msm_dp_display);
+		msm_dp_display_disable(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1448,6 +1472,15 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
+static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
+}
+
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				       struct drm_atomic_commit *state)
 {
@@ -1460,11 +1493,11 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	msm_dp_display_disable(msm_dp_display);
 
-	pm_runtime_put_sync(&dp->pdev->dev);
+	msm_dp_display_unprepare(msm_dp_display);
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)

-- 
2.43.0

