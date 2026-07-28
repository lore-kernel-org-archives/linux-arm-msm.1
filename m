Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8C42379E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234118; cv=none; b=n/gINerJpn7lFkJpvWd7bdFdHgwITnOuedbRkUhXYJtaREDk+9Ky1FnVQz32Y91DFxT21/s8wGbRGZGIC4ZfYE1jLa9Tgbt/qhwJA0jTC2a2jAZyGWcMSRZv84F+V7N8ykDh//rGYC6CHHJOd02YeBC3qOatX73FOEK7u99iT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234118; c=relaxed/simple;
	bh=zdWNJSWFz5V5YojG6YqSV9BinwceHFpFH/+uvdsQRcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIc+cwuv0LTVwfAC/zYFMACbDHihRDxkXE2h17VsJWBv+K0bPrmc8m9/pHd8f8TZus1gzC/SdVYyLCttOFOrVN/tA6fDhDvkymOvVvR6VUNuXaTVMhG/qqXLshnePrvOAAc2YjENzEhLy9e0lkHhoYMHE2y2e/Er9OBhlqAPaDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSMYU6EH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjFuilWb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSMYU6EH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjFuilWb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81w2I2071267
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/CNkkoxPzmTqcV3geQdgp3jH0nws9bXiOI6xBcPdSs=; b=mSMYU6EHADD80vc/
	CBCns7NCD7yzQzT2BE4Dt+stmBRjkxUoQpN2M+N1WZkgpvGZZJ2ADU5ndoqVkLGI
	jI9njUKOCealGlfurQrblqCBZ60bZ+AvN6mFA2NXVCSLiTsCJX6rLtfhlcYPHUkg
	EyHebAyfiplT52QkxMkDahJc0Ryvne7K4l5erSL6IVHKw6+Ph7CqxmJ+vTNF4awP
	9xfcHWpXZBUbUQcctycwJu3PWS11sHRwkP8i3l/hmCNyDqYySmCHzLQyEuSD319Y
	71IyEhOq0RFBwTPc0jcBZBp0Qr7tSVZ4BSCCNhihv7lJ181njeR1j+QAq+e8Vfsp
	ya6LXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgqhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so480028385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234115; x=1785838915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/CNkkoxPzmTqcV3geQdgp3jH0nws9bXiOI6xBcPdSs=;
        b=IjFuilWbztG6/eVoqr7IGH580bEG4yCjs9ezbjUWNMN+Fw0Ek9sI4x9Ido3p2NT9O0
         ofMOEDbhE2Z16Wkh/Zo+CrmfBZ3RlsGksS2H32wdX2gVTvrspqbhyVEHlk05luNDb5Dy
         xwx5ffJh3GGVhSwC5J3hTL4N9JZ/KYa4RfRYGk4/zSPukwuOFHamabE/VWk2GLV9hX+Z
         VmcFPYhb8qRRyU6pYtUQWPTGs4t+sneU3jC58Xi5fddN85MdEOKqiHgfEl6SzFANfFED
         5nZub3E7c8m225g2V7mSgw/2yO0/4uSCLqNBT7KivE19e72tjkIuxPSFUAsWenpncl8E
         58Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234115; x=1785838915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/CNkkoxPzmTqcV3geQdgp3jH0nws9bXiOI6xBcPdSs=;
        b=BS+0vl7bXPzOHEQK2maQ4pPUZqEfAqP26tCNgf2QPgzLNXXfXS+k8xKqVvJzmyOgC/
         pIkaU+KtnuM1ypkd/hdi/HrYlEREyJTq3fTJ0G3geRjeo7skVcpZnI8wdo8AVOr+96cC
         Ad7z88vGm4a0UoEa92yxdvdi+BV5G96QcmMcnOcCLKczisOQuKlMLrkvWtn3m2K2BfhK
         7OB7eW9G94vt4x7locXPNJ7i5wOmvnn749DkHU0YIHjUzaFoJ7Lr3smpF515jLis6XJT
         x/fap7fczecoFID6Xkd29ur1KxcZUQD3BcMRYGKWB4gLx0Wfx5CqNYc5meollD7Lcqua
         t7QQ==
X-Gm-Message-State: AOJu0Yz1O9IXWArgpsI5b80ZYCBkIOyh0M95lEnT/mK+8CEV7sNClBrt
	Rx4Eb4vu7XL368dBvxIxol1EaXiMIPl6WaXYDdFzpz9/S7C+4X+0oHsVsnMUERovnd1vtAsD2yC
	fDlrWZzyNbkU8JMRhp/7dSPPSQ2gd7WXg5Tw5yfaUmJ0XeFv62vHmu8qKEgQOfDVYVE9K
X-Gm-Gg: AR+sD11SrSTHWUbPIz3sThfXUcmXHIiGpSE+/bfieKaN7jyOUen1ry6vtvgiZarxGHl
	G90UpXYn19sIfiGveu+a9nt3v7rMv/wzGM2GAMUbOT+l4P0+4NFTB/Oj2B5z4RAWaKv6kPxtMiK
	HfObf+Q/6FXzhMznR8GO06FGiXcZqrd+9WgtzNuEqT1DWpvwHh2nNeCQpALTuMzeavPAWBqCU6l
	80T+Fd/xN9WsmJ209DIUKYUpZ/kN+bEF95nWs+FdbEepF41oNh89/QaxRfxOQpX4m1AqXIeri7t
	7KSf9Ws5RSs/gnot4oLokTBxYbbERourkk6VXcht6YP4z3kdNYv19fatlRGMWwJ+6vI0vCXc3sx
	/H4JpYB0xEKhD21+PNs7Au2e1JaO8wPAdLS1qteqzEvjx8D8gNnzJun9OsvmPsqw=
X-Received: by 2002:a05:620a:25d2:b0:92e:fd2c:6a1b with SMTP id af79cd13be357-93302772db3mr148310585a.50.1785234115058;
        Tue, 28 Jul 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:92e:fd2c:6a1b with SMTP id af79cd13be357-93302772db3mr148306285a.50.1785234114423;
        Tue, 28 Jul 2026 03:21:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:21:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:32 +0800
Subject: [PATCH v9 03/14] drm/msm/dp: move mode setup into
 msm_dp_panel_init_panel_info()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-3-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=4086;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zdWNJSWFz5V5YojG6YqSV9BinwceHFpFH/+uvdsQRcg=;
 b=jhWSadQyY6yBoyE8BcWDTckcwtI6tdSNYC7VvgCbt3BRGWE8SE7ykEk/oIr9xsYhykasls20E
 3EH+HDpYBF3CkDo33NSNkKvPg9S+CkE0q0GGFMKB7QJjZesWA1ft472
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: FJ1Zmx5ZeaVxsVc2sZ_7EwtcZM_wEHO_
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a6882c4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RRF978PcF5p4qF5CYGQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX8i1nrYGu8X0j
 RRSO2tjg6VXaUOzT4DuSOILnFXcS+rNFWuvDcpdaXP2paoSq7EPmvAk/Z0uAK1lsfnByF8xNv6s
 qVUefvS/aYrU+Zx8D1cHMDBvtIndNck=
X-Proofpoint-ORIG-GUID: FJ1Zmx5ZeaVxsVc2sZ_7EwtcZM_wEHO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX0viXprdHChjm
 Js6QDFTdZbkcQx95kTYU0Gv+h3Thh/C2s5bSlZPla8n8STMX2mrcbykLzk6o1D2TFCadXIwpHfI
 26rS1STEglvYkDUIzGdc1d32J1vefZpCbx48LmNmR1bkdeKjYPBsaw/3LYw69wJrischRY1/982
 mAK3Y4ekCWmvqomJp5KUoUbIuVJIXYYwcAOWxPOcL3V4VLseRtudgZYPku7jDc28FNkywAbPk3C
 5kcUIF6mAUP4F+1LSwcx+oLnYVmKbTn9CvbC6yMhj+jBT4BQ5v+asDIX86sU22xGbf8XO3T2+IT
 96dBAHN+uJo6CvN4NFofFCjTZpXP8/Jgofd2zu/xaO2Zs20/HtG9I4X+jc0Cs0KWC2/qldOIpD0
 wYzN1OB4qdbmCj/XI8d5ewDgXUbgFmMJbrfqPRcn+Vy7W/p5YmDM25j0qpB+cqLeIyMuk0aQGcA
 jmG0wbPhUS6hCvMDtsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

The display layer directly assigns msm_dp_panel mode fields (bpp,
sync polarity, yuv420 flag) instead of letting the panel manage its
own state. Pass adjusted_mode and bpp as parameters to
msm_dp_panel_init_panel_info() and move the assignments inside it.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 18 +++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c106aabda588..2a84a6ffedbb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -604,21 +604,12 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
 	if (msm_dp_display_check_video_test(msm_dp_display))
 		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
 	else
 		bpp = msm_dp_panel->connector->display_info.bpc * 3;
 
-	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
-	msm_dp_panel->msm_dp_mode.v_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
-	msm_dp_panel->msm_dp_mode.h_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
-	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-	msm_dp_panel_init_panel_info(msm_dp_panel);
+	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
 	/* populate wide_bus_support to different layers */
 	dp->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bde4a772d22c..e76dad0f6663 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -647,15 +647,27 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp)
 {
 	struct drm_display_mode *drm_mode;
 	struct msm_dp_panel_private *panel;
 
-	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
-
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	msm_dp_panel->msm_dp_mode.bpp = bpp;
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
+
 	/*
 	 * print resolution info as this is a result
 	 * of user initiated action of cable connection
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 53b7b4463551..4519ac374220 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -43,7 +43,9 @@ struct msm_dp_panel {
 	u32 max_bw_code;
 };
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,

-- 
2.43.0

