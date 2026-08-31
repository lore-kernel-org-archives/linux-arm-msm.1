Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFCD3D47D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164300; cv=none; b=pznG+PjELsEaUuLK9XnjqRffCoYepE28ANk8naFOPCwtpjuzP8mXG5L7RZBAq01YQQJJiMI5bJYksfvaUjdp6o6fek/YT+J+74lp6wvVWBZKx3SBHpo9r+MiugbDyCBwFfK6b17taPSG0OYn6oPQ/B1Jghrq1VqM5LER4vFp8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164300; c=relaxed/simple;
	bh=P9U2eQjgGLDSD5m5xIoCS4u805LtmPec7xTvh3GkRAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHh7bN1HJwOw9kLNGjh9jsD2Uuc7c0fT9jJePYYfOzZhhbQ1arCqXx8D5boSwYyxvWa3l2T2vF+FJBUeF5Vwp23Sr+qJ7Q4xFXfr9LBFOJ/4RULKodSGXpxBHFxPRZAPpHaW/7dLYHr+IzkZgSHIZrek87Q2MEVUnWVKxhj4cDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+wGJJ1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNRr+rde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+wGJJ1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNRr+rde"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNFC3018218
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdjc3+rjJj58blQFSoJZYcb5Y/iCkxx6iMnfNacsF5Y=; b=B+wGJJ1/FnsqFtEL
	0rJtKSQNhLwKjsrLqOckXUjaptctSukdF4qzXcI350+S8fwiEKnVpStbAvGXtMUg
	i1vD4l30uc3MjCTLmK0Qp/XRQeZVgIFlUOVwuxdTfD2Oe+in8xEXSuMtj5YIz5+K
	imm6LygmDc9QgU6bbcZ4DNNhfp3m67KCEODtQuzA5swN0HFq/P1Kt5L8vUVC80tX
	OKq+utghVGgbjTnmH0qmlmw4TP7BCotsdGka7gCg+pNMkOC7UBEiyw7LZiOPOQbE
	/dXtTGBPtrrYx0c6CBeaPp7jSHomrWTMHshun/eEeVvLjgajDQ542ZWxjKBKbzE1
	RyOgAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so643169085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164296; x=1788769096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vdjc3+rjJj58blQFSoJZYcb5Y/iCkxx6iMnfNacsF5Y=;
        b=dNRr+rdeU9n07GUy/DKhx8dB3seF+uWC87wmf5jentPjhsi1PA7Qr4fn/k90OD/ixJ
         /rQW98gZXMTJCm942Gve6e/JHCo9gu+NY2NFO3kCz8PUdIv5XnP0I/eKKrjJEmepnEEY
         abKDeUCfIZHkjpT9bWBdwjvxrsDjbGUv2JK3q7bSAcUIWqNwCqHRAv2coHOd2lig7Mzv
         idS1N/y+ZciAoTYO44mhsGsLJNL5se6vksQUeIULt2GoFk8Zdf2lrbeIPgL/j/PtpRDm
         bpiy06YgIEgRPKPrw6sI6E2mhHxXDHE9bBfO5iHB7jMtMHhYpFKfo5QjzZYkNdyOSLFI
         IvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164296; x=1788769096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vdjc3+rjJj58blQFSoJZYcb5Y/iCkxx6iMnfNacsF5Y=;
        b=ZUUrpKT7BZWqkH/aEtH81HAxA30PrM5efCPluu2Y1tnSfxdbEZyGKB8HlDyqjc68n8
         oB5T2n8cBq76D91mtYoSgUyU2Wcu210l9ksdy8GZeddByKyhoaE6hv1AtB4Yqnb+zEfR
         admeXfZsPSdSHsUDAvKY4ZzANnwU6C4j9eV7iTq6RT/iUxjmfykKyFLuSIfVR1txM051
         Xk2NtSKemDJyHl9OXRApoa/8E3mnaCSkW6xCDlImnywx2XSS8EAdZdw0rY7SG+wvnP9g
         7H47skVzEr7WaV/DWGucseEVNw3UcNlKlj+okw2J8n4v9yvddC3LnFTp+40Kxrwi0out
         RAqA==
X-Gm-Message-State: AFuF++lbpxLLOhH/xjGTLHcT1Jy45Wp05s1GOd/CMIFrLgjCDkugkpk8
	4pNnwYu0s1RNV8fAJQdU6mP/UaTDd63Cm+k4No1LyPw/3phbcUM+7PRmKS+qo9dM10RMRnWzoil
	4O3oBTIUahoPN/wujts4aLC6vrdrS0u5pXu3+he3T0zfTYDmhVIDCm8t/pZGKcJUrgRgN
X-Gm-Gg: AR+sD1048cg7A8R0+3Ag/Q43lgQIf2kVkVHXP/wXH2ZcEGi42H/twc07nNYWqTw+pA4
	1CtrD8wTfZO7YKcbUXZdsOtmILzeqL4Pl8jPuakwW8Mm/0hKv1BGN0XsrPzgXuHQEgBfJhB1TSh
	zLqP9dArsJB+NxM4HFaRjHf8B8Ef95a9IaiKuSfyc7l64J547NhhIFcE1/gz7bzuRTyfJOL5eY/
	ry+33ejMM6PrpCXIU8WHUisd7f3vWbv0wo0PisVuLWulKrYi4oy9xs4rx5ILTE4verOIrO7uhdp
	xuXNM86O+4uS9vSDQVlyAMO+lLpM6V2MrRr2EGMLX4xZ9iYOgtLNQhBIX8C00VhnOGHusL8h0ng
	6aluK2Ws+WXrlBO9O+BED0AOM2ToQRhv1OOE5u9SUrL5mfP0DtLE3GvXVNoEk4Ko=
X-Received: by 2002:a05:620a:6cc8:b0:936:e71a:db90 with SMTP id af79cd13be357-93942b97360mr146704185a.29.1788164296394;
        Mon, 31 Aug 2026 01:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc8:b0:936:e71a:db90 with SMTP id af79cd13be357-93942b97360mr146701885a.29.1788164295982;
        Mon, 31 Aug 2026 01:18:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:25 +0800
Subject: [PATCH v6 08/29] drm/msm/dp: add support to send ACT packets for
 MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-8-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=6775;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=U2HJX94D2BMOjeBdupbd3D8LR09HYGpVTExDGNEh2ho=;
 b=pbf2MwbOo3Vwp5OzIsEgs/kPMFt+AgoN8+PQ7up6iAA7/eZdBLAI/773tfEXX4Ymp7AKORHyA
 2sjX0sOrwsuCZ7num2gN2SmaqmJhkLU/+HAGFrDZ0u0k7jo9YCyej7u
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 89Ww1zdLv6MzF_ek_rA6mYN_VqSsUlck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX9hxmCz8BrPot
 nhy2jqYp2pF3k308rj65kUX27yaR9XruRJRxBTkVeD3fyZX/jbD/r+b8C64FQ/asokHS4NPh6m9
 d3y/p0MUY9zFqEyRO6NLZcRl1nlhZ70jKMEtRD1uxyrZFbsAUpi4fanJgE7qLvMhRDq6rjtJVST
 Wm6J7/w8n8kIP8VFcd5w2ZI895k4C/vz592nc10Vuf1PCqj/nlPEuRnXuzgWwr1VOTDrUnEqxEF
 HbNEnJqrxTolufonIwkALBVf6dRXioDI1R1PULAdPM5QHJx0iu0e5jjarmAGai8IQAqX8+AotEy
 kbX0DNH6wZT1UrqGZBfQ16Dm3P8tPixh8QxF6lsmwHCerJ7uPjJU1eO/YAu0Tvfzimy2MRW2glw
 c2bUaIAjQ/zvsWOXiFh0wwu8IavyrHYiGu+5rNlAbqzUsfW2fgz2oLSTa0F8bXMfUKKM1L444iG
 J+57fS3Dz7hkugm4kSw==
X-Proofpoint-GUID: 89Ww1zdLv6MzF_ek_rA6mYN_VqSsUlck
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX7I2+MraMAPmh
 bttj4N/lYCT3VBtomrzFHTKnyhsuYKveBvLsMDuwm491ZMl2hgzWaQcigNtA8IG9f6bWh+ELxpb
 1wlg+V8BhPNAHXDpbLnqCF3QS6nH4hc=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9538c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=F2S7ry5v5sxRTjZyeP4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
 5 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e1614bc49a7c..65d22505c2b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -244,6 +245,37 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	const struct drm_display_mode *mode;
+	u32 frame_time_ms;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return 0;
+
+	mode = &panel->msm_dp_mode.drm_mode;
+	frame_time_ms = DIV_ROUND_UP((u64)mode->htotal * mode->vtotal,
+				     mode->clock) + 1;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(frame_time_ms);
+
+	/* Hardware clears this bit after sending 4 ACT headers */
+	if (msm_dp_read_link(ctrl, REG_DP_MST_ACT)) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2614,7 +2646,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2626,6 +2659,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	ctrl->mst_active = mst_active;
+
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
@@ -2657,6 +2692,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
+	if (ret)
+		return ret;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2694,6 +2733,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
+	ctrl->mst_active = false;
+
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2873,6 +2914,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b4..41a69447001c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -59,4 +60,6 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d0fc4ff508dc..52c13823e8d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1497,6 +1497,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 83117e7619f3..472429d09200 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 265da58e064c..9263e61c794c 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -330,6 +330,7 @@
 #define MMSS_DP1_SDP_CFG3			(0x000004e8)
 #define REG_DP_DP0_RG				(0x000004f8)
 #define REG_DP_DP1_RG				(0x000004fc)
+#define REG_DP_MST_ACT				(0x00000500)
 
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)

-- 
2.43.0

