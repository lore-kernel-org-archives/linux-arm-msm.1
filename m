Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55C3F65E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234156; cv=none; b=GjINeDGNWzCvai73RPcY/9oFm+bD0aWHQpFEegzeOl0EwLmgm9CFZRk8rq1jcyMz011//HIGJBatZ4xbUAi/UYJrFuYQd+/I2SQHPrIH/UQ+n29bhzlc5HtYmfdumfevkfub3ic2VRq6I02ay1QScWcuBKXhKb13Sk7ZBojDBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234156; c=relaxed/simple;
	bh=/Dx/vNJX01jy+xT4G2LBmVIFKR88X7vrIKlmk7DBQgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8vi1DaAqoE7vTCS5tlK3UBmQTIgQzMo5/EfcfH+7scT+gZ5TYWw03f+II2lPWhXtY3wvYxIRIBz7EjLnIB1NbFkLrNs1FpgaraKN02TyO0KtTc0wCSaYIyAd7Xm016IUvpWpps8Hm3uPgkB8SqA1Pj+HjLBEbnkYCI/jPQVO+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pg0i3aWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRvEitsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pg0i3aWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRvEitsJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82lrn2275984
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qUZfolgL1Wa6VYURJUQCWKPWvHFKYbdxR2qbwjYNVs=; b=pg0i3aWZsICsPZW/
	Fg0T9jKtkF6I1NzmuyNEaeAfF2yVmMRFmGtyMIoQxL1Rp8HO/SRNwoCf/F5ziaSg
	FFtDwWtX2RTFmJLztFVMg+1YTOJh9IJECK8W8aDdM3pEM0SOZiyH31s18vPR7qcb
	OC7igRuakjEvSxop0KUjGLyrS+UoIN6v4A3Hvd3CUNE+BbzoRJ10OL0+pM+91fwc
	HsqDHK2dCPFPwikEBAc89wE8eIEsU3MS3sExifKk5XVkjoRFLfy73WobXCuVCahp
	ZNKTmepzDi/FRWCdu5PeQCOCEYajEcyaPy10pMN4q1dUPF9JzAZzx1Qihk1fXMJU
	fFyGEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsupy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso8474081cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234153; x=1785838953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qUZfolgL1Wa6VYURJUQCWKPWvHFKYbdxR2qbwjYNVs=;
        b=jRvEitsJ8k0ycENL7kJkq7gIQOukZxGk6Qm0JMvxrlYWMkLeFioHvMGUHmX1CYGQGD
         AYapn5NTYZL0DDFx//iOMII50To5oQWddTHtCHjjEIA22zqwy+p3FiWH0XcbP6UixQ5F
         YSOLp+96b62n0o7zieTcU/0KLAVH5k/uxDkJTeTPj6dHqAOzYnv2b+5jHQjeDkmDivn4
         pCPgRwxnY8rCoMnIwoG57W7HiPNRl5vs9XcQ5qCmfNQbwY0qc5xoIxPaB80JNIcvycZ3
         ImOnQzaTKkMyMWEVYq1aPOkO3WyL4H9Q9PsZFxOQaeUmKCraaHHmcSoaPcP6goaGMi/z
         Tveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234153; x=1785838953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qUZfolgL1Wa6VYURJUQCWKPWvHFKYbdxR2qbwjYNVs=;
        b=saJbpXR7I4bO6GlyRkpySKOAJkagpMRNnaIx5mVbbd86Q++Q/qPQ0W90wmQAygCBtr
         iEhGtbM4MfPzDF25kNWhw1dcV5s6ibcufP0fImNvI83ZTSO+UH6ZIM74qAxK1MwyKSFs
         GIPHYoADSnJVPAMo3MHvCStZtR941mXocg31tQodghZ3AAP8Ha1eIUHSD/gaK6D3Q/hu
         /8X6ShIofbsyA1PE0DGKlFrVhUt3bjqXo159sneTT1ggY6B8IOG2igXIsle5C9B1FWwM
         X2t0o8doKDPRszDyeE5YP3/zd43lzfXtxA4cqGPQA63kaw4mrLG8rU7bwsVTg9Voq4Gl
         BLDg==
X-Gm-Message-State: AOJu0YwwUGXuhpgJlHqRYCNSPPLwIWMjaXAiZ59+/iVv9BRWX2wMa166
	0nSKNtkqmzlycRu6bQzmNe1mfolEEf3IUhtoYx73bndOGncvzYaFtM8Ne2Ob2EwO1qkDDiS1w3S
	ww9kZi90qoa+uWg572lEoLC5kliUzYle+q7kNrlDzHp5HlgxKy9YaqnAOVD4emf6mxlM2
X-Gm-Gg: AR+sD110X7VYyU0L1wZdg0Y+zFeL4fo75Bpz8UdHe2EvpXS4IwO9UOkf9QPXZjG3Okv
	c5q3Ge/cw2661ZlO0vgcSmwSLaW2jczZevT4j6jxjzb26GN+7x4ymZeF1orjL4XRM2lMhjACgL1
	PPQmPs2QUy6AD6eksIeDG8J9JBcs+JkpJ5+Dz0YuJWH3OJjCmx05U4hYWG4RXeZKUEc/Nv+QTPj
	Nf9XJvuV6uyNRbD9zJQToVzLsSmqc2d3zU9zUz5ubPETZroS3sCH4bCgMmiiovl8meK90C5bZUP
	ceGxEImI+B2Mr+ccUZyIVaNjv01UAye6PSjd4olh8+8aT7xTeOlj1q0mCdU0CQRLa0IvyhwLxjj
	JgKS5oyThLWw7AFnsHQFxpx2P7pgjZJkTpJr0Gu9M6jtmNuRY4L2aCBrsNSMz3zg=
X-Received: by 2002:ac8:5acd:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-529d7122607mr12401001cf.29.1785234153477;
        Tue, 28 Jul 2026 03:22:33 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-529d7122607mr12400791cf.29.1785234153067;
        Tue, 28 Jul 2026 03:22:33 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:40 +0800
Subject: [PATCH v9 11/14] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-11-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=3896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zIJjql9mV2Sg5qOti+JyKR2/YpfT+bcSzOdOAEdO0ZU=;
 b=QVs/RFzFVYJr3+s6xUa42ixi/vFLa/GZO21ezw7njlcmE+MkppGvTWLVNX5tEiXQdpSEe8r+W
 Hkw/TwrozaODAAhzAUPh96fcEgEOLHnoLF4KSXRoCcCPTCRP48W8tA0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX9IxFb5xBGz+S
 lJp5Ggm1trtI5ZJD1d19ULqnOwiIKj2Bn+an67RLeNOZH8BGnHNRASPVzZAQQjmvhDJr8wfq5w0
 Ser/CusdvfahDvwefxBDGcPCIBqrq+S9Wx86vsshyGcCMkHwjGPrRMtuI5w+o81+qk5L3Q+rnPo
 EFH5nj/2mmYD8FoOlVBtD+vc1iD70M3wrOZe0k5Mkvipp3d37+t7GuBVcsOXHLTVTmNJHPxpYhR
 10MNVzkfd02LmYjy8Kf+K5a2bmUaSSjQ8hI9gqAiw//7r+p7WNVZKuLQrEy3QxPTQaZW2d/0vNR
 CnxS1k997rReiW91Qb6P6QClmPVbBg1PVsmrnW7zpeAx/HY9p7aA62to2Dnx2qJ/67cs3K1flWU
 jVtzP7ErR2gZdSR3TooPC8Zgy2eWmh4I9k5cLHlEyDUHXvIkJgDirIzNnH0rKTN1jzcnD90JHDm
 2zKRrro7digsyM8NP4w==
X-Proofpoint-ORIG-GUID: lRAJfrgzEpXaOse9eeoAq73_QtfU0krc
X-Proofpoint-GUID: lRAJfrgzEpXaOse9eeoAq73_QtfU0krc
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a6882ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=btynFov_yHAME20h-3wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXydndHsnGspro
 HxEv31+UK1XTgxpYNSPxR1VXMdSc2iTXgycRZQRaW2uw+f+CZJ7QXO5exhAbuPVhHXaxxo7xGIn
 cwYiETE/XoIgYpaAnSLHyZ5eMCP0zyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280091

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9bed5a2fd2e7..5d896593771e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2215,7 +2215,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2244,7 +2244,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
@@ -2640,8 +2641,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2655,7 +2656,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 00b430392a52..5902cf7e746a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,8 +22,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1b9b7a4e5db0..6e392a99438f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -727,15 +727,16 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.43.0

