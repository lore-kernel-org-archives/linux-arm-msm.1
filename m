Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146941F7CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234137; cv=none; b=NH66GRBmGYEx0I2/KB8NDRxwzg+ZIsSITeW2zWVLdWmQXE+4D9fmS2FX/TgyCLwnoQzXEriSjbKjCXZcY0nN+bkjthkW/Xv7wc33Y/GuxSyPjWbzGnsP2FgTvhACAZ3nK+eMoth+mmKQEFqMUOKPPhNeQaRk2SsVzDwuuFlqxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234137; c=relaxed/simple;
	bh=A84OlDexxXirLha+d1Zdha/lr/GtldHWpxuKLBRgkU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYJkSh6SqGc6wi8om9+S07MBDOW2vbIB1id3Xuak8asBlIbA7mlw6uIUvwREMqqnXqI/19lAClgU1vFWSKBGreF9TKuqt0RWasfAcgf6WYrbyll1NU8EHTeGOexClT51SsVK3PBpZgevFuWJYIxm5f6VmQ2bd88lI7Qmrzfflsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WohDzA6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iy0JNoUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WohDzA6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iy0JNoUK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81xgV1663585
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTx1v2sp2O92AoJjL5411r6vaqf4b2hlKoMzg6Uq2g4=; b=WohDzA6BdlDPGEtq
	YcE4gpqTi/m/gR5DNOv5Yn/ZXidSX1frLqHdX86uEisTnIDyu37AxTQOlo7NG3JS
	LMZkN424RuxCimuok8iPqv4oMCjOiK2cPpQFovYfeUmTdcIAm3RQrYI/J8VeAjYX
	xgG7jxemz8qdjywM3lUsf3Q/29hOwhv92M54WrWQ7MC7KvClLD6vDgtIzz8j5SL1
	F3sF3e7L8w37ddtKLwi5kHZ+Tnx0z1Bi6eu4C9CT0bWoeNyhd91i9+mP06F66n//
	gBl+KLOAWiPOFkt3cOMbbCF1ooc57bJF8EpMGWhIxbkGfbD2u+rFkzycv7fycDhm
	poyLXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptts2fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9309af14fd7so395036485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234134; x=1785838934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTx1v2sp2O92AoJjL5411r6vaqf4b2hlKoMzg6Uq2g4=;
        b=Iy0JNoUKHfJd3U8bq9E7Cehr4wIYktSrulEgpRNkv1zcckabPWJZWEteRYFSnb67P6
         HyNrlQ7YbWr6ki6CextIMMrklVoGzhNkPNF2xMy65l5WGuOQoHva7rglSBuct+hkO3Lk
         Q0YM5ZVxjTfJvJaLGhZ3rm0nSpoAyvGO2fSqEkD7juDLyNBCSfbkb5WyaA1HZqEpRECs
         Ip1/zurX1tEgrgVxwvK2QFHEx7iaMVW+xI25DrtnRAYcsCwlaIltj0MWJ2jTJr2cDeR2
         InTgYjldxznnbp6pvgIxqViTy4kOxQmSov1rcJ9EJarQ0Lua0LOOqNhps7ru1xdEpx57
         3Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234134; x=1785838934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTx1v2sp2O92AoJjL5411r6vaqf4b2hlKoMzg6Uq2g4=;
        b=gBDVN+cUPuwDFgo0f4VH0xy57qGCXYzYhg3jgXMh45/Q1zsZjmvQkn1zItV/BqzYEq
         HfsBVRqmIvSNR1ahwVQbVaL/DvJjVO+oUNYY1T0sLlNsxikawzshhPt7jwyzpJTvRQeB
         7EvhGeS4xmvGMhk0A9B9w+A93kZX7XNaeuBP9RMB6M2mAuNDsJphA1r83D8+vmfhb4RK
         tNm10pS+Ib+v6/yPlhkiXT2JjKFFMvEJKcRnk283IqgrhUN8ekc/dAgKyN/XV+s+wxKk
         omMJTwnWFvjjFWJNYpN5stXXOc2QfjIH/uQcEaWByz+wqqOGxVSNiC/eKQNf8gcdiphX
         QyEg==
X-Gm-Message-State: AOJu0YytJHbKI2pWxsoHBcF9ocI+OivYAregHW958RWuaPTiteY5ljl6
	vCiUe6hy8r6VeasZADXwmdF7kCGzvQKciaHyzBWnAzRo8umrI2SmF2afitaSDFfjmoQg2uN2f6b
	vvGYy5ichEAmhTuviC7V50IXl/YWLc37RrddEe1DOsULgxTvRXJhcA/+NkKAcEsLhLTOO
X-Gm-Gg: AR+sD13J4srtQqAqMBsfzG7TB39W2WuQsicPnDekDnFMNzwfn/95ZQS/2fKyQlIeb+I
	gUYqOJDEKBJsD2rYgzHEcbZJw8EP1X8TK/1W5cp3GVJU1yyoZitNXpk4BH28OVxd+3Xo8FPDHbu
	pILIGth1LELZzfjoHrUEodDVdkBzsxo6T6r8ueOTVG4pKzauf3ydchsyu8PPJMUCdwEeug3/NRf
	6B3QlZ/PI29aZbxk6UDHSE0oAvXXl8vD3zRR3lBqw3fWjpV+hobw4XfihmjUZDXeE2eAp4eg6U8
	8DiRfPrFS+gjGpdKRYNO4TBWqSp4SfKtDyEyc17KXCv1eREeHHTLyjTanqZecsHTiZB0TtkhXhr
	fc1PH50DmVnOtZJmVaje/eKI8a1RfcFB6zNJfgxHoerzZH+16CXZ8sFhVtp1CgwQ=
X-Received: by 2002:a05:6214:1cc9:b0:8f1:293f:abf3 with SMTP id 6a1803df08f44-908172b1470mr16549796d6.6.1785234133864;
        Tue, 28 Jul 2026 03:22:13 -0700 (PDT)
X-Received: by 2002:a05:6214:1cc9:b0:8f1:293f:abf3 with SMTP id 6a1803df08f44-908172b1470mr16549456d6.6.1785234133291;
        Tue, 28 Jul 2026 03:22:13 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:36 +0800
Subject: [PATCH v9 07/14] drm/msm/dp: move the pixel clock control to its
 own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-7-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=4071;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=A84OlDexxXirLha+d1Zdha/lr/GtldHWpxuKLBRgkU0=;
 b=APYvZ8OZtdbO5TNyeAjo4yF872ggq/+ZDbDszUDFth8OsVE9/8EpYSrWBDpemX/YSjz+ippqw
 DIMsssYqmyGDpcHOb3t2EyKwY0JTJ7pNP1mO2KCsO+4ufGKzTouLDPk
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXyk6xbO7NCjJZ
 Zi0A6TTbgbufkFm1jC/qZduLfsAigA1l0Fsthbore7SxdY/gNg67P1Rqu43ionlHI0nJn/GOjek
 1MWOo9HcB7vTc1dbdbeg+Vl2QoGQhiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXx8QXJU2MPg4h
 dXRdLlUxfhlUQ1CURshsvkQBgsw7cKseAi0QRYksP9GrbHn2OQAk7fZ3EYkaHmeBmmgGMLC3bM5
 CpH5R3yLIH9tNH8C/Saq+QNyiKX2Wo9b0huCGVG6ZGb5w3Wr17sdjRXDj3LI/6Pi0aNTXRjWcCy
 foRGYN/Tcs+E/k17SrnO3VFpJ31hVUIG5cx2c4ocMFj/HHvNFAS7R58qW1ENz4bhrmw+KdwP8Wj
 FZodOsRF3tAm8H77WxZ7w2sLmAueeF6cTd9z83HIOAFajagJLZScSLNKf6ER+ohBVOdQp61R0zy
 MKZZf2U+HHvgRm4Cm6QFLZwu+mWjjtxCwM+pYMcU++9o80ZJ85w97YIcUdTOXby4ynkbtIm4m98
 RZnqDrxejjKrSuosNuBYi2WXiAytJ8XqY7XxHD3jPdwLOLJaE86PsAW/RrDbW+Y6sxP2mlAe64a
 oFYl19YNgZEvSGMTVRg==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a6882d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LTLKrY7oRqEJyuTpQ09p4Uht6nMQW02R
X-Proofpoint-ORIG-GUID: LTLKrY7oRqEJyuTpQ09p4Uht6nMQW02R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

Enable/Disable of DP pixel clock happens in multiple code paths
leading to code duplication. Move it into individual helpers so that
the helpers can be called wherever necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 80 +++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index f343bd6c2b81..068d4f8b673f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2176,6 +2176,41 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+{
+	int ret;
+
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	if (ret) {
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
+		return ret;
+	}
+
+	if (WARN_ON_ONCE(ctrl->stream_clks_on))
+		return 0;
+
+	ret = clk_prepare_enable(ctrl->pixel_clk);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+	ctrl->stream_clks_on = true;
+
+	return ret;
+}
+
+static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (ctrl->stream_clks_on) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
+}
+
 static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret;
@@ -2201,22 +2236,9 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
 		return ret;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			return ret;
-		}
-		ctrl->stream_clks_on = true;
-	}
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
@@ -2519,26 +2541,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
-			goto end;
+			return ret;
 		}
 	}
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
-		goto end;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			goto end;
-		}
-		ctrl->stream_clks_on = true;
-	}
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
+		return ret;
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl);
@@ -2577,7 +2586,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2625,11 +2633,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
+	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 

-- 
2.43.0

