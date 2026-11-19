Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076729;
	b=PzRfV6Y118C/qFUusoc3akOmDt0x6NWgJt+hkYOA7mICsPrTI3s5NoVshWIrXYIHOEzL
	 Wtg/h/KCGpCUdcYVD4Vw70kTSIalf/bq0ajNKhDqv2vMZEr9d18gpIxEuIiEUpadONZUf
	 d8/ZVorMzdxGfR3OIWC3SS57if47H8I9Kf4mRaFoQK6q7kXentOkzfMNUzpYYgsDGXPUw
	 1sbf+EQBcnFdsCRxpy390bgC66ri6Qk20LoTopJb7i5/CVLmeMUAQ1kqLE5mh7K/XzDju
	 Yrw9taggUcDQuhJmpJU+PxxrLCPNR6W1KpQRYl4w+kFdyxS58FvMUpyrcCrP5/OL1AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=;
	b=HBH/iZ8c8AAWJTOzoEC4r4AOWQlwD2ru+5GuBGhV8zGkPV2woDOccip+6rxSAw2NZgWV
	 lDbQBXohTVi7QuJ3HyWpArPTGcwkCBzfWonLlptyyCfqqs2aw8r+R7U/QEUhZ1YsAEh/m
	 xrkYJXrPTj+8LNg7m2M5FNtSgajR/TI4TQHZ6PPFVKaE8sHF8C/O6FKheS5bHlehrHUoD
	 cvgMBebXi9HXSBQVDL7UFw3bN6r6euUUbi7VYjaM7dU7wwDPZxNQfFZVnxFV1krR1X/4l
	 au8zxY4TPqbHFY23M0J4ibk4MZK22qlgzDIB6QpEaszlUBUB96AT9jbATwnJ+4RCm2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhLz8bQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM3kHo2t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC3606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhLz8bQm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM3kHo2t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vSEb2671967
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=; b=LhLz8bQmSBppmM2B
	A5X1ak2qE7N7akZeCFoKRbbOQj7EuR2/uMqO98rp0clczIUEE+89XZenbHdGkXlJ
	nfLev7K7C9PFGBAUi2AnXZINQ6A2JDGMps/9x3OT/NG1f82Kl3exscmhfd+ZAl6W
	46HfkMqtSeBS4s97UeLPuMbmRQzHa+wCKEEFvPrkdxbxFa4IdsyZ1zrd1Er3FqTi
	QegFPZwDWfk9ufUdLOJqAIs/pTCgeQZu9g7tw1Tn5R+Vn33rlpRJb1WU7RvVYWwr
	dZ/swSlL001N0kQasiYk7yS3JGD1XIrRe7hKzm06gal3tmYa2bpWvXitqsbYccEP
	lbnz0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p3fs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961511b61so386310685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076727; x=1795681527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=;
        b=VM3kHo2t7zIdneyQSSVYE0dN13F+i2jxG20o46IVvvIW41UEhqI186EyO9ZsZq1raA
         fQi1eY93BbNWG5L4Ge6j3VnhiJmlxbjNrX5gI2E9Z1I4pcnuA86VG0q2flBrU0QLcRwh
         LYHXRlHhyYecPTccbuc0iuFTPSc02H2gC51QMoKBreOqpK3r6qTUlal39tuT/R4XBOew
         WFQZRNhfu2duKkXF23f0XsQ7xZdvhsXu6RjTaociKcUnyxs8KVKua6d5SDxBp637rCNR
         rXey1F8Nzd2l4SQT7q/ncCDFBYO0b1XfSOPdKuleEyg5eqkSExnID5mt3J2QF2bjaMWa
         l77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076727; x=1795681527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=;
        b=E6BuRI/T2UlqWNYw9xxX95aIYR3l5FQTvk0VuOWHdliu42gKPHe8m7Sa+r8rdm9R4A
         gaVr9MtojmlBrzDVCeVrkwr/pd23nhHPRkMP2w1yUJ5CSbrfstvkkxjyDHrxReJm/tFO
         A35ULgFEoOAxpeIbJB23On0zkDHSLE1NxW1X2xVJkyMSdqLpLUOo+z/Rl7zO+JWgDbwo
         ViaItLSM1IPrM9ObrdOHLG0TbiYSTbEiuKdnvK9iwLSORYnyKdOYs16cOlEgQM2/3GOx
         GEcLGt4lEbdfRXPP1SJvFRecDzcpcBGXa037nM9Am//7OCcjvV3JHID6hZT9FfArO97x
         ctBw==
X-Gm-Message-State: APuU4Z/tZjf4NcS6ikKYCMDq88zu7WGS4Eig332h7TDnJI4WfnQKaaK6
	JZSb2RoDe1MQd071yZEy5bwYThtnZ86+Ouunf17ToRd5BiHBhnqaSCZ3T/9823MyeXiSJi3kdtx
	pme7bX4tA8qWOrqCEPjuPRCNJ6mmVP4SBn2d6/DODeXaqodXOvCn3qW6EPirlLfAgpR6C
X-Gm-Gg: AYBFou3KEF5sU0/e/i+QDktwQ4CNKZicI1UCmsfD6GQmpQWLeEPwL+xp1msgZUE4SVh
	mCkPtqBSuY9je/rv7UqpDc8vS2fSBenRCv4lvrZfQ3yh8S11I3DWT9w4HoI16V35Ddk/1R+ojPy
	Et1mkDl+vwVYz44FE+oiT6SJUhrpB0gJeaZaYEg9GwrXGUXBURdfNvBQxn2C6e7Lsm49Rbp3cvd
	WGYjC3gkm8sXU75eWib+DxRClp69vyjRfa41RdBMIzQyLsZ4j/rZsqwzZafLATAzvymiU1GqE13
	ZD85o9SRXK0B/sfxGp0ZvGUV2bLHHqMPv01IICuUUvRajR0KSR0uMa/S0LBi/IWQ8ri929PCZPb
	y0JxaFnrTaH6IvqMgJWwLR7dpBAwQbBoQOvG+Qj0umfoBeQjI4+VrOIY4R/LPEHAipxNQaZYo0g
	wTZkcEQjKLlVqfDEHIeV3EA6tX9x4W4MfArC+i
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001047685a.34.1795076727422;
        Thu, 19 Nov 2026 00:25:27 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001043185a.34.1795076726825;
        Thu, 19 Nov 2026 00:25:26 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:26 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:13 +0800
Subject: [PATCH v9 11/29] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-msm-dp-mst-v9-11-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=3825;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8dXh7kevZYuIf/EU/BTs/0N8fVWktZ9YOwTAYB0jJQM=;
 b=Qnzn/Crmjsg37VxiYwfrU/Elr3oFWpLhpq3Pbi5cz8hI/ttX4qzrstwHcMSUZhj2bcKkei9fn
 f2trFg2VFfTChoEu2WETS1ZTB/cjJC8j8WlIAtDEC4GurgXO8n1rX/T
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: wecZST9vsufr5NNYjZe2qdNbLb3V-kW6
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afeb278 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kCKOgzAXqFYlHSlaV6AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXw00mol79MZXy
 FTxcf+Iqq94d6hd4EvVFttNjrD17CcNjm3iWrwKm4Dzf6iMtNPocTHeUT95NIyU/kfRc2W/nz2p
 NdxGu9WB9ksMpfLgLDTXCLtkaovRNWx1JeM1fdlaOm+EW6Gg+vCsaKn/3sKm5MlEPnKOtZTGAei
 LAqEJMMN3XYC8mqW3RJy3jQvj1Xyzjv53Dlbp+kUkr86u9GDkDT3AXv+kUInLAAyOEzdUOGZtFz
 HACK7+SGU3NX3VmynHuUrSbHqxT7blp/vTJea3EI4W/7H7k6qO3ZjVCGDaKaV38vqnQftLNaOw7
 C9Hj0wpaIxfR0FsgvQxZ1rseu9FWu2vocKZ0pnQfPfG3zYpTqbPqFUJ7+Eft2nOQ2PSyT3Lk3o/
 OSx8A/b84JY56qgAkbCn0/5hhYSYl37fXC55Y/nquJx+cyu6tEGFsMpsahe7OSqXIo+i4EY6HOD
 KESJH69p3Df+TN+Cl/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4BdTCiJ/r2OQ
 8gLjwO/xkkRKlLIYMSC4uEvwjhv8mgyzaa5+Vi5k5k64+Ie08UO6iFeO8do5CT4G4IYmXFVyD2l
 TMQAYvKtCvIdIEQ3Q1gpir/W0Z9ybZM=
X-Proofpoint-GUID: wecZST9vsufr5NNYjZe2qdNbLb3V-kW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a9d0956a9751..e3ca0dfcfe9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3129,6 +3129,15 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ctrl->stream_clks_on[stream_id];
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9478f127c6d3..8db5f714519d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,6 +61,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
 void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 544b76e2c6f6..d3d798a1da1a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -536,6 +536,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= msm_dp_ctrl_get_stream_cnt(dp->ctrl)) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b0b7570cb16c..96be45c3dc92 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0

