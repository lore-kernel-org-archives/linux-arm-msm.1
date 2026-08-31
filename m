Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E43D9020
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164304; cv=none; b=Gs6ziIKmOyuC7XZYFexsRpTwAUI5A84sV6JRPZOzfGA0PG1m7S+z16+2xlc8tjA57ZxSLe6kz+wriu8DQzwIUWxp3AQGhLaVzNaeOjncUuRHPgmbgdCbHJP+/l2WbAbTLI2dCWjsrmbm6tYLYcPnzhvYChGAoZ85EVaJBEWGzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164304; c=relaxed/simple;
	bh=Rmad8rIknz1sOMSvhuH7OEp7pReINDO+wK4qwai4xjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hf1drn4xkY8uk7O0yaf2Hnf39q5PLvyvuuF4C/wOiUF20K4kpRN+kWFgFVFRIXT96Rw6RaVKDd092Xk0meEPhue07CayUVr9f9g0e9qgWsLpYvozU+8bTE9I9/2N4cbdxsglFspX5ZoFqslqwV6EeAnDmkmazvhSUFBDDZEfTi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RClJgwUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdErDLvC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RClJgwUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdErDLvC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xtul1844204
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=; b=RClJgwUo77pHmJAY
	6hldljYsej+SBGeFDATTQ7DAPg4GbKFxE3jBYHnBOD40YEzwCdtJj94kiKRc/LhE
	DR55lro1hbFv9358OPYwvtcKZldpeEiijNqiqErlF0B/x6EpNHrl8N3Noq5rxLYl
	M1DYQcz4cs9NRhvd46uunakQG2a7Q+efAvz6ew831g3uEEXj/jZ+pF257NP44ayi
	ADle7OwGgkuTMM5QiNSzmOOBptCGy5BGliRs0B9kE65eLdRAVlRZxwZiDNGRYCd/
	VmH7LYHbERuV4JAWdEbHftdA4oEmKpDI9FdKbqkAp+mQttFSPmloX0zoWyzNj+F3
	qMcV6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgw6ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:18:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so643183085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164301; x=1788769101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=;
        b=fdErDLvCfhbh+02oR2e3Yv41vfo2t2ym+NGwp7cBAqbAgF7cbTi1ZTFsbwkIyfBZ8c
         L7WBTd9mge4Eq8BFpmdQmTVUVA4BHbGe+HErag4KCfUJObUBa10gUSsZmQ1qxYagQhEE
         pUFZblMbmGotEIMdXAdd9iUV/2KRCGRW1gs1lZ9f0lfysrbZmIkUne0zCf0dKwEpVT7S
         gtcNJ5XVcnMhI9ShKAlb72AyOj5o7+htYV5gGx6cEfUwtriCzR+0YxZcxYHj8KE+leR6
         UIuXraprwbv3nq4wXWJW6Xu4KVlbjqazYNv+dbBJ5/oEFU2JomIWJLPVanpucBNwdFpW
         3p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164301; x=1788769101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOMG3yp218IRb7X4mHLShdrli/+A+w+d0UixRrJLDGE=;
        b=XJjd4eX6mS4sjnxNR2+1nglp8Dfq2uUMlxwgtCspWlptJ1E5l/YZjV5Kljlog6nm2Q
         Djuyoh31bSKY7jpWSccq9uJDDHFku8E1JEY8YkW6caEXpDO11a3II/D6fepSl9Dynasb
         8jH8ecBZPM2FI22nGVmPCf7GD+HIC0gf0y/AAUQMvtySEy0mJ1AUooKmfhnUO4dObbJ1
         9BKDssy2MiGjcGqcrF/dUMi0qhamFExjXAOxl7N7nL01ZnwqRraEE71xbInZ4UaG49oj
         DccibKmMEtnqUIp6YMK6pkmtiv2beP1fmh4w4rtKFvAckC0U6yXZlk931/qB5p3a9YF2
         PLIA==
X-Gm-Message-State: AFuF++lrx+j4jgCyKN5mNbiRjN5PqoKzFOVJBZ6ZrBm9Id0bxI+fzGNC
	UiuL4Q5OVRFNmXjxWMjt8cI398HLXFDm84DbrdpbIdoT+Iod4x7gPCIFRoR7xhzh3ZTu8lEe+4K
	266InGEafp7u/hCvsjZpFv78skMXaw3bTjdi+1MqyHzfePdhStdXTtQIRch+/Z80vAsVS
X-Gm-Gg: AR+sD13yXLbUiRNvEXx0z3FBqGiJJNCaGYqiaK5d7lPVThmbvbER3mySWTi5VqS79yj
	Q+zEyHisB4PVPi5zfiL+HPS89WzdTTaS1hMB0zuoRIyphyiWmemlTl8IBAgGpwm7YGtgqbVs9BF
	ns2blj37AejCsPzlkfBeOxQMmQ2AL5x1mSUnPYkeiRsq2XZ2IEi78fhJdNMY0zICOGCVDmwwt+E
	Toe8S8WAYf2bwwt/LIZtHKZrjBkwueQVXFPtw3ENemZSEwy8I3nZMXmZew5cX2QDr1avI+KHFcj
	yegpAOfaDGlweQ2kdm1SrGdzMAby7Ey9Wk/AN16o3Lh24GWzageO0YulIOFg9BvoFxadIeKlHKY
	+idhz9mE197wy8jHmNzXA/N410ULLpIdJ1FOcU0Y8T9kesPaLBRyz+YHB6Wby7sE=
X-Received: by 2002:a05:620a:800b:b0:939:7c8:78a9 with SMTP id af79cd13be357-939427fc764mr120628785a.3.1788164301487;
        Mon, 31 Aug 2026 01:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:7c8:78a9 with SMTP id af79cd13be357-939427fc764mr120625085a.3.1788164301042;
        Mon, 31 Aug 2026 01:18:21 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:20 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:26 +0800
Subject: [PATCH v6 09/29] drm/msm/dp: add support to enable MST in mainlink
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-9-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2557;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8IxMe+vOOiLPxKEsXO6U2qctxURhGCfNOY0j4XpqOyE=;
 b=5Lliw3sD7lBYuB4Fhpkt0TWooGx6Wfwa+3oaQRLxQPkkMtj8jfKPFkgbLrvA78umzegQp9FlX
 XbaNtx+8RPSB56FR9NXiIqgKFVI2H+O836qf1iXoazP7hMeyWMuXnTS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXxw1LaT0jGcr8
 d4DPLIeAftVc6a0xyBso4961WGWFDajDCT3lWfSsBH8D2K1djHsbIaZ2EZC+hptOTAIbDIBku3J
 9gw96qMBzRS8a9ShKZaSevGndjIQw9mO1YYnwvOet3r7oDdz+6PnpmCuEgLdBsIG7zobWcLg4b6
 x0jirmLpUxNC6vbKEqDqIzmZC4tHAqNxcUpAPaVSEzn5wNDG6HUyu/u2zX8IxdVsB4ynQQYOLBo
 9RKzrr2YnRwbPuCxX4lANCJL6C2nOa0ClHWctGKeVV2+bFYzGAfmePmEhawalsMzITghGy6FOQm
 jrJpXtdxG920LAP/EYaA6XWuvkcA9lYcdwztCV7NpxzNlSnn+ihvUtr1Q/VuMM3a6Ftma8M14q3
 1imtGzdYF6VFeU4m3J8xenc84T2ck40u2qrJIJk3J5110YdQ5cKUFs9tCS7Dl9psKUalujAOPED
 IiiwGrK8MZFENAWfpyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX3DHw26rhBcc1
 lTFHxCG0yadZo1T0XldFd/UsjPNYVBCthxj1shVnyxzWvlcSG6c8JjS9cMIgi+ah9rsZXkoK3jI
 i4UGyvQpnDHOhFVVShMBjatDucRhjYg=
X-Proofpoint-ORIG-GUID: NPi5edJHU78ywDxkUlvf4GhjvecUENhD
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a9538ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NPi5edJHU78ywDxkUlvf4GhjvecUENhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 65d22505c2b6..cd6ae0d5372c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2680,6 +2693,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2730,6 +2745,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c..cc74b1ed628e 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0

