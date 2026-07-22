Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2BA2F3C37
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702207; cv=none; b=T2jMtaaommil8Aq2p3X4qOdqAEGoVttNtD/3mv+4K5mohARw3DfJZ3sFzwzOhz5WWHGvDW6AEJ/Dag8O/h/d8T745n5afBl5PzApuTp8RwqluYKn6QpriDoyWDzNkTLLyAfh5ydcKP6ymV+ogm9/HhVj4OBIZty8vy6N+t6BFRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702207; c=relaxed/simple;
	bh=7l1TNDYd9/evXG4aQDhF4a5Sh4Vi7IaJGNioaNskXy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stbdMM3SlNQbfsJyZhQSfRtMF8l2amjSCZ7FKv5x5U8bPgNbDPXeYeQSGceLXxUQf8GX5nk6H9fA920nph/nq75R58Cx7hI1sQYVK22MRJAEgPu47S76PBQW4UJIZvQmRNAuwqdEuqwhoFVepxgYOX0sy5liyWfvHjHYEH2Fdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/DRue11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8Gb+uWv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/DRue11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8Gb+uWv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53eM73662714
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orMX6Xv/umQ/GQKMS7aEJeoThKF81pS2FroIwcu9Ga0=; b=j/DRue11FJz22DVX
	16+sajVZvyN+RqmOE6BLxXK8PzM350ID9bMLiJjKr611RP3NKnm4nfRK86ET7HtZ
	Lri4s3k0AsryPz1oQUKBmaAUwvu3f1gm+ip6s2Z8K/XE4ZGW4WoLW5ppM6DIV6Cn
	xQh48/0WwJV/HriPhRllzdeEMLbLfu0pJeV8+N+g43SaHWnrNTx2u8YbDC8xSoM0
	9ZcZLJijbRXrt+rgPIr5NESOYpcwkgS2z/xxS5KLpnRE/iSVUg8qu5WribeQ3HTy
	t/E7hLwWSLfuNQflMVRlCnjwoBmo7ObPXzzKQSE1X0ZYm6v5YCAtu6TmMPp8QedL
	fwEjKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2jkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso187490991cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702204; x=1785307004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orMX6Xv/umQ/GQKMS7aEJeoThKF81pS2FroIwcu9Ga0=;
        b=f8Gb+uWv02ESmG1G5YhwkqvrCJPLsd4dEIduPncgQ0ny/drB2k7nk8GSGC7RgEELen
         mRCWqKQS8LybUZaWIbhMS+R0ZRBt9e5qNUE8STSoUejcebPzENecKuTeZp16iTK1jooj
         rJsQgqVIdZWNrATt5YH7fMVt8x/JJuvcvO9IKkwcKFj6/VLyd/67G/YFGw2o6n5BZiAE
         umPnnGKMZZhOyuc2jGuY1NBIf79YTKaHuvZ6/+7asar53u2lXGUT2yeMPnQCik7DHfJ6
         otZrxP0ieWIEkthCIFeUUteA0WmAjs7DEK6g/8VdrMyyRXmeOy+K/kBDFOfgIniXVsw+
         460g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702204; x=1785307004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orMX6Xv/umQ/GQKMS7aEJeoThKF81pS2FroIwcu9Ga0=;
        b=Og/6WkhkRQgO8EoAQb6QtD6XGuzHoUkDbCylHvwuUk9fg6K569PjNK6KSofb6EBKUh
         ctVehGNVOUKEcUdtdULPhhbZkeikLZQsLz0rjOF1GKJ8EKcOxBXZ27fJlOJ1QEf3lvld
         L7i3UACv2JDlYzM3cDrjgMQ9kvgl3AIVgYahrJyLlryD+PP/fGHxVm17Yn+2VHS8Q4w0
         WbSrIto6YnsIBNhfFVEHL6pPxG9oEQ29Vsm6tqQpDiSIDFtzfxSA+A4u9462o8OB87pI
         UxPZ9EyIiqE74r1QJIFNgxIYapZbyCpsEtDf6oI4rsw3KC2J12+syFu1vhmrjzPCM5C7
         a90g==
X-Gm-Message-State: AOJu0YzhR8S7WGzpk8RgEAr5pilaj66TK1dESp8vyGPBYcxQxAlQgDOS
	B2qBn1TKkzNVdgzKQOJISM/yY8jTpu54UL/wx+2sT4hpsT7As/Okeauro1lJvRekAMhpXetzgxb
	EX64JAh1qRjiyj6uhVJyV3jxfBVYnUK6OycEPl7JTVWawRZ1pUB6OzRKew+LebtZSg4nDsxU83+
	wG
X-Gm-Gg: AR+sD10ZhXQPBoPE+I7PXbIYGqvwnAWjjfCULlJKRPishwPKqOu2wvuHTPYykCzgDo1
	ix0UvXgOGylpwAkftRoE9ocyO78epoL5o+j0+UI8YHv2sAItafNA60t1sfU0/BqQzHQZJOVeIbt
	5TP4vwGtO234C+NforK6EWvFSjS694V6el9EXEw50z8/KGNN9XZO/XFW3jkf6puU/gNN3uyE50l
	5o3+yMghV7TbBkxkL3g3ptkF1JcpKtTsqabmsuKSkMaSM9+YO68af7SmpgIdb0pohHJ9dkPe2rC
	ax6CoAWoSxHLmPRV1C1qefND4maKWEzT4y7RZnobWbNKEH5LOSeZlAtXew5AE8IE7lnO2LNLG0O
	5fb7ooe4oyogk4OJ1tLz+mRYoLYuCaKxvohANDIpZeXl3iGlm7sDjMXDe1WnR5HBsDRzPvbc4L7
	KfrcPKnIgubygfKg==
X-Received: by 2002:a05:622a:1816:b0:51c:13d6:b4f0 with SMTP id d75a77b69052e-5213e28e1famr204276701cf.47.1784702203995;
        Tue, 21 Jul 2026 23:36:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1816:b0:51c:13d6:b4f0 with SMTP id d75a77b69052e-5213e28e1famr204276511cf.47.1784702203550;
        Tue, 21 Jul 2026 23:36:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:20 +0300
Subject: [PATCH 05/24] drm/msm: route the display snapshot through the
 msm_display interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-5-368c10fe62fd@oss.qualcomm.com>
References: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
In-Reply-To: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7l1TNDYd9/evXG4aQDhF4a5Sh4Vi7IaJGNioaNskXy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTmgZ33GTCdA8gTzYYJcTRQq+WMF0WCFDbqO
 EeiMjh4VBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk5gAKCRCLPIo+Aiko
 1dYeCACCzg+5VE5TqEYdtmNPPUVEm+ouK1WhpQdv/3AGxwrZb4hQ0UlOYhV6mWJBf57z5eK0dGV
 FE5eufC76lW4kyjIxRpgl9nlmmVhug+Co3hbz8g2GiPGl7KXEvtrNCBTel+XwcT6BxlxsihNKjI
 RZIorpMsSw5Dg/rM/ROaYJBWDqhqvp9iYRQ2QB5wPOTV3uDMZhV4CIYok/2HArnREiGoxcKgFUy
 hpMwYTGyEJFRDak8PmkreLmLY8T1+VoXCrS/8Amh9XhtU5dyaaWqFvX2tL8Wrpik1XMUddtBc54
 zJ3JfXmmAhqx8AVtvMjN79QyzH21htHKYeS7cjefyXjColZf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: jZehFdnZVwqQYWrHHWQGf3krzrWJ6p5F
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a6064fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hdl_M5XMN9aFjBodsmYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jZehFdnZVwqQYWrHHWQGf3krzrWJ6p5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfXy+dDoOArwRDy
 yJ6CzbRWxPpUOuVV6Mt5RC0ku+mFpUxJcyy7QN8YTlXKHbsvU3mNIfNO6jtnd/t+ZFIxne6pVpo
 X93Cl1e7Sx9qm54isZL6UZgFhRIsnsjsBoGyxlDO272LjmXBwPf5KAjjyNu2UI59fKyE4Qn1ZDz
 FPwkS4s2xKeLpl4dPlkJlkiU6VWCtUi4h0aC7TOWsn71S4VYyilUx3r87PUfDZfR59guHlpBzL+
 pYvTWgIRylwHAD7A/yglt6/+6btpB8kkr+i7iYAo4AJ550VhTHL2Y/Qv69ZQTIWFY2Y3yCMCkdB
 T/nTJuW+Pp0KJTEMM4ZdpiBeQt91kTmLSwEAsjgm+iN0LGSDU7icMv9W5YJtLpTcsKkPYyboIC5
 eT5gmoJPLYavqHoPYegs0IZ6wlwfgg4JDDumvAP30KCkEM6rHJrZvqKrm3Z4NskQa2MnVeGnsSG
 oETzR0/qOD0SL4GNYpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX81gbfMCjG6PM
 4mxUF9NLtFgztEufQH+EKTtaBKKa6yoh4lrk+l/dFNooxEdxjzJy1DdTlT+Dk52NqC+HFWxoFaD
 oK5zcpQDYubN+S7lLQwzS/gRgFynm0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220060

The display snapshot code calls msm_dsi_snapshot() and msm_dp_snapshot()
directly, so it has to know the concrete sub-block type of each entry.

Add a mandatory snapshot() callback to struct msm_display_funcs and turn
the DSI and DP snapshot helpers into implementations of it. HDMI did not
have a snapshot helper before; give it an empty implementation for now (a
following patch fills it in). The snapshot code now dispatches through the
interface for all three sub-blocks.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 19 +++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.c               |  5 ++++-
 drivers/gpu/drm/msm/dsi/dsi.c                     | 16 ++++++++++------
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  6 ++++++
 drivers/gpu/drm/msm/msm_drv.h                     | 14 +++++---------
 5 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 850246fc89e1..b42a92c2ffad 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -131,6 +131,7 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 {
 	struct msm_drm_private *priv;
 	struct drm_device *drm_dev;
+	struct msm_display *display;
 	struct msm_kms *kms;
 	int i;
 
@@ -139,19 +140,21 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	kms = priv->kms;
 
 	for (i = 0; i < ARRAY_SIZE(kms->dp); i++) {
-		if (!kms->dp[i])
-			continue;
-
-		msm_dp_snapshot(disp_state, kms->dp[i]);
+		display = msm_dp_get_display(kms->dp[i]);
+		if (display)
+			display->funcs->snapshot(display, disp_state);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(kms->dsi); i++) {
-		if (!kms->dsi[i])
-			continue;
-
-		msm_dsi_snapshot(disp_state, kms->dsi[i]);
+		display = msm_dsi_get_display(kms->dsi[i]);
+		if (display)
+			display->funcs->snapshot(display, disp_state);
 	}
 
+	display = msm_hdmi_get_display(kms->hdmi);
+	if (display)
+		display->funcs->snapshot(display, disp_state);
+
 	if (kms->funcs->snapshot)
 		kms->funcs->snapshot(disp_state, kms);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 79dd556e96c2..f4fa86d1b9c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -783,8 +783,10 @@ int msm_dp_display_get_test_bpp(struct msm_dp *dp)
 		msm_dp_display->link->test_video.test_bit_depth);
 }
 
-void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
+static void msm_dp_snapshot(struct msm_display *display,
+			    struct msm_disp_state *disp_state)
 {
+	struct msm_dp *dp = container_of(display, struct msm_dp, display);
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1354,6 +1356,7 @@ static int msm_dp_modeset_init(struct msm_display *display,
 
 static const struct msm_display_funcs msm_dp_display_funcs = {
 	.modeset_init = msm_dp_modeset_init,
+	.snapshot = msm_dp_snapshot,
 };
 
 struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 6cd844d08733..c86142f66237 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -267,8 +267,18 @@ static int msm_dsi_modeset_init(struct msm_display *display,
 	return 0;
 }
 
+static void msm_dsi_snapshot(struct msm_display *display,
+			     struct msm_disp_state *disp_state)
+{
+	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
+
+	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
+	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
+}
+
 static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.modeset_init = msm_dsi_modeset_init,
+	.snapshot = msm_dsi_snapshot,
 };
 
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
@@ -276,9 +286,3 @@ struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
 	return msm_dsi ? &msm_dsi->display : NULL;
 }
 
-void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
-{
-	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
-	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
-}
-
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 03367c6ba428..350867ada0cf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -211,8 +211,14 @@ static int msm_hdmi_modeset_init(struct msm_display *display,
 	return ret;
 }
 
+static void msm_hdmi_snapshot(struct msm_display *display,
+			      struct msm_disp_state *disp_state)
+{
+}
+
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.modeset_init = msm_hdmi_modeset_init,
+	.snapshot = msm_hdmi_snapshot,
 };
 
 struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index dbd955091ce7..d25d783b4f11 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -275,15 +275,20 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 #endif
 
 struct msm_display;
+struct msm_disp_state;
 
 /**
  * struct msm_display_funcs - ops provided by a display sub-block (DSI/DP/HDMI)
  * @modeset_init: create the bridge and connector for the sub-block, attaching
  *                to @encoder.
+ * @snapshot:     capture the sub-block's state for a display snapshot;
+ *                mandatory.
  */
 struct msm_display_funcs {
 	int (*modeset_init)(struct msm_display *display, struct drm_device *dev,
 			    struct drm_encoder *encoder);
+	void (*snapshot)(struct msm_display *display,
+			 struct msm_disp_state *disp_state);
 };
 
 /**
@@ -319,7 +324,6 @@ void dsi_dev_detach(struct platform_device *pdev);
 void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi);
-void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
@@ -337,9 +341,6 @@ static inline struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
 {
 	return NULL;
 }
-static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
-{
-}
 static inline bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
 {
 	return false;
@@ -373,7 +374,6 @@ struct msm_dp;
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 struct msm_display *msm_dp_get_display(struct msm_dp *dp_display);
-void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
@@ -391,10 +391,6 @@ static inline struct msm_display *msm_dp_get_display(struct msm_dp *dp_display)
 	return NULL;
 }
 
-static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
-{
-}
-
 static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 					     const struct drm_display_mode *mode)
 {

-- 
2.47.3

