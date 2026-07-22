Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EAF3DCDBC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702232; cv=none; b=EV4R7L1Ghm19jfpT3ZBWe9nR5mkza/N2yCeAc6iu03QgWylQqBtF/jjKPQhB/AO4+RaUwtmQd4s98fZnF67MB0TUsTc6rT9Vh3zT+saQNjYPA1V37LaBhz4QlrPenRaASzbNb3Waz77ZE2UfbPfp7dU1+mh+rDKvf5v1h5JkHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702232; c=relaxed/simple;
	bh=2gZIjt+CW7BgzLYsCIE9YAc5XmD7te0tRFqzurdAo68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXeShTfgdTl6rt28P21GnQplCzlhkSZdZTOK5affwvQlTByltAhajTk9zyVEsMYAURESVX8HJ8FTtl010kjGJ3wIcvDhtNs6+f7utRV9vMa3AdxiT/AZ92Nd01TzkkaiWfkDijLT5aU0jX+GkUtPaasTus1PIKM+9a+cGh4ti78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lmG6/wqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQPmiYsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmG6/wqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQPmiYsa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53leU3662837
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGW1zFzCpiJIZJA57ARRLMmK4sTskI8VOnNO41WxLkA=; b=lmG6/wqA+eIjqDC6
	XzkC3OiF0xPoO61nYfiZKACkTC/dc3CtpqmQX5ZIqLy4QtyzcdPDFLDha5z0F67H
	fpignWTIsjpwsi9IMqnlvvcMpY5eQSqn8seNiH464id7Xc/8XvZWKVtpCMfJuyYI
	CvdfTUvF+AyG+VnjVWr6lqeCMQoV2fTXhGm7/AAIQBKkocy6kr2D3DP34JLKTwcG
	QjfuwTTsg689zeTu8rRuUrwYZuK340vntHoZjLg7VpWDBBqZXD8iA57Mr71NBnXo
	gzPyEEgsU3lc9XW5kFVqhN08hefoAAfLpbnqvUZxjGe8vJ2PeinrZ4HBHaZNY+N7
	/PEKpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2jq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so120141151cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702229; x=1785307029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGW1zFzCpiJIZJA57ARRLMmK4sTskI8VOnNO41WxLkA=;
        b=DQPmiYsaSml/M3UgmHJpbDvTGhgo7CNhIVsULiYDlhKRZZ5yMbqcoyKulDbWL6IgAt
         o19CiJDpU6hvsykm1RIJuBiGPgmvxg4/qP7utBRZCdxSzQv241I5ESuZvnPTimoiUAWI
         Ld6Dk7abDAKmXhbRdfn5GacjFiAiZMAF+our6klv/TFcQ+DpRB6scE8ZWuKbKfXeXJ6q
         P/xHkdYNOLduJV/43KRkm1hMDeOsd3POJOGKr/NBTWL625BniH3VIIjz8+04ajvB8vpB
         zRUWOlYls9RPgGf1ZNmTe+kxuUFDdvqNRd4ZrTBp3yIIy7SuhJmoyqy7T4awx1EXui72
         rx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702229; x=1785307029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGW1zFzCpiJIZJA57ARRLMmK4sTskI8VOnNO41WxLkA=;
        b=iytOcsTT0c31SfPkST4f1yENoqfFqvvWJd9F1HXizhCWncZt8dJtIh7zmFwKHXg6ye
         PpsyGfmtyyJYXCm7+qaH7t9QomhiTH7TEirZpKDWykHZr9SKp4lA9lDoH5dsigKl4vUw
         O5jCq2c9qmiTOgjiMeLED5lJDafpA+tZolpsmT81a41tVyChO/ef9h5IEpty1AwkpNh/
         xXh/i7BairnRGZZOlzK/JVeTShoAOtS8I1HxlmBUWNNYr/2U5ZJ3fP6VmCYI4t7+f3zJ
         QD4iG9WKqKrY2gCsqVpXBAUAMx1nETXjd3uJGsgitJj7ydkCM4KHKxfSthbAmmPbMMl2
         Zu7Q==
X-Gm-Message-State: AOJu0Yw8lfWtZX8k0VrbXXsVWXQpgKJqVVoGe1zPODTiYbfCbJuE87kn
	EHzoesxR2PpePt+PuiavPEZ/EObqyZHycV0AsDaPMzW8HikNjqgOWOWhb8aJ4hxRumL7lNt9RJX
	Y1kqXA/eeycwF9OwsUEZOdUjRwwqgVIhodLw6Jaa18jBDmX8Vbn2wid8Ok/7WejTe4nx+zkUJsG
	TG
X-Gm-Gg: AR+sD12uuCmmViFIUdjbL28V3Z2yQCmMQbw9/7YsjK+8fvC5X+hBq1iLqz0i5UDwQr3
	NsgC7pJ+D3ADTHtLPoe5UwtbLMaA4L2aIPoeiv1h91kXkE0tq1xr6n2Ef4G/dDQOlRahn8NYl2u
	PXlKyWW+Q/sUfw74Jsa3Oe2FjuEXdOQXEl8xgo4JRuZOGlPRduWp7vwMTOBwhMv80mLtveA/+fs
	DlbLRZnOcGQA7rXhnEJi6RsJPzuL9Ch5uFNmcexNCI3C9Gz+Rjg9cuxW+ZHb+q9++sXia2QZtgw
	9mIEzY49jCaycGjvL1EPg602wdEKLiZ4E8+Igbo5SXTnnzFOGOgPMXl+aFyGBlZjk5rbJ7UPu99
	9i427SWb4mOTZnMHCajquVvtwxeO4pRpkrgTC5TKw9jFc4XUF5E22qPyhaJEEVcsvIJzWzIdZ98
	UuyMtUPuSZsv71pg==
X-Received: by 2002:ac8:7f53:0:b0:51c:7b12:5ff9 with SMTP id d75a77b69052e-5213d7abfc0mr208199941cf.85.1784702229315;
        Tue, 21 Jul 2026 23:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:51c:7b12:5ff9 with SMTP id d75a77b69052e-5213d7abfc0mr208199691cf.85.1784702228839;
        Tue, 21 Jul 2026 23:37:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:29 +0300
Subject: [PATCH 14/24] drm/msm: store the display sub-blocks as struct
 msm_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-14-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10011;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2gZIjt+CW7BgzLYsCIE9YAc5XmD7te0tRFqzurdAo68=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTojVumxCAb/menMez1MJQjApmx7tpHl7KyR
 yhEZLS/4seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6AAKCRCLPIo+Aiko
 1a72CACjUO43qEeNKr/ZzJA9xLX8XkrW8tjs8HyPWuSk0oNsgXoWzNle5FwhTyVoJTbBQLcDxjA
 nTrq39DN/OP1cFUcibOF23bbPFlvwHRLJR1vIc5uMF7/YjxLx+XsPC+kke4ox4GrpggCkIDb3ye
 ldrKzKpVHzImBxybw6yw5IvHJ0medyrDn5c5r7KCHKcgrfXXNcsssn0g/m64NmZ+HE1BZaSd7Z7
 0oAcpDn9B46B6SYtWj/Md9LnCDWSGJHWOJWzwgE7CYVBaE0QjSbAml9Yy2K4U/BEEwaPvi1EFpu
 a/303zhwdyJMvN/anIhVWjO87VWJHg3j79Fa0YP//P1+Q3j3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AoPhURA2LyawMyFNwD--iidI_ayLl8Mu
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a606516 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=v7Gipn9cxXP9LZtw54EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: AoPhURA2LyawMyFNwD--iidI_ayLl8Mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX2iM7aO87Ljqb
 +/Wb/RO149QDe4hiPx4HHIN5P0FwGWEg53pIAenTzCGQ4WipHvMLEurep+yidKJ50tggr1pL2Zi
 UA3nsIiQBpJphCDd4qxERP0HQe84ErWuADi5WONn2O+947tocIZmK2spiK3Y5TIlmXwtmTAx5Mx
 CCFTsX4uQkdbsjgtTXloSxa3fN+B7EeL3hT8OxwxfPDHnYZYVFhKNHE98XeQTBl2ekAvENk0qu6
 z+N6FpYs7oInf8HHhmX1ggFNvqSTOJT93Xme35lRhNQCLzR6N/9MnbrwNyhYpBeX7Dtft0zetjS
 MPmP9mSCtKZU91JrDvKkn99GxryupbmkQORpA0Hpb53aXG5JZkuHWRCF/948ZmrO9nNJ0h5rJug
 VjV9+wBc3Wg1aXBwBvbwuFXmY6Yt7v1A/MbiBYbf7cnIYKRm5CA5FMLGCyzNSRjW1pbUVWGxM6G
 BW2SJ5qhK5rk8WaYANA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfXxIJiGdVuLAG5
 kBA7AvRqTGYogQVKYGuKIVAxkmMk3PqAzmYI5iMOoi/Cdoccmwif9t+MhkD7vEhlGpL+V0w+1xp
 jY+/x/QEyuGRS3fNNhgYV93Z3XVdEfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220060

With every cross-module query of the DSI, DP and HDMI sub-blocks now going
through the msm_display interface, struct msm_kms no longer needs to know
their concrete types.

Store the sub-blocks as struct msm_display pointers in struct msm_kms;
each sub-driver registers &obj->display. The msm_*_get_display() accessors
are no longer needed and are removed, and callers use kms->dsi[]/dp[]/hdmi
directly.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c               |  7 +------
 drivers/gpu/drm/msm/dsi/dsi.c                     |  7 +------
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  7 +------
 drivers/gpu/drm/msm/msm_drv.h                     | 15 ---------------
 drivers/gpu/drm/msm/msm_kms.c                     | 11 +++++------
 drivers/gpu/drm/msm/msm_kms.h                     |  6 +++---
 10 files changed, 19 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 569f3759d02c..aa8a9b7c1beb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -261,11 +261,11 @@ static struct msm_display *dpu_encoder_get_display(struct drm_device *dev,
 
 	switch (disp_info->intf_type) {
 	case INTF_DP:
-		return msm_dp_get_display(priv->kms->dp[index]);
+		return priv->kms->dp[index];
 	case INTF_DSI:
-		return msm_dsi_get_display(priv->kms->dsi[index]);
+		return priv->kms->dsi[index];
 	case INTF_HDMI:
-		return msm_hdmi_get_display(priv->kms->hdmi);
+		return priv->kms->hdmi;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2eeaef963e1a..ec5e02c395f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -603,7 +603,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		if (!priv->kms->dsi[i])
 			continue;
 
-		display = msm_dsi_get_display(priv->kms->dsi[i]);
+		display = priv->kms->dsi[i];
 
 		if (!display->funcs->needs_encoder(display))
 			continue;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index e372d295b80f..c91915030111 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -361,7 +361,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		display = msm_dsi_get_display(priv->kms->dsi[dsi_id]);
+		display = priv->kms->dsi[dsi_id];
 		priv->kms->dsi_encoder[dsi_id] = encoder;
 		mdp5_encoder_set_intf_mode(encoder,
 					   display->funcs->is_cmd_mode(display));
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index b42a92c2ffad..d376c3cdd8b5 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -140,18 +140,18 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	kms = priv->kms;
 
 	for (i = 0; i < ARRAY_SIZE(kms->dp); i++) {
-		display = msm_dp_get_display(kms->dp[i]);
+		display = kms->dp[i];
 		if (display)
 			display->funcs->snapshot(display, disp_state);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(kms->dsi); i++) {
-		display = msm_dsi_get_display(kms->dsi[i]);
+		display = kms->dsi[i];
 		if (display)
 			display->funcs->snapshot(display, disp_state);
 	}
 
-	display = msm_hdmi_get_display(kms->hdmi);
+	display = kms->hdmi;
 	if (display)
 		display->funcs->snapshot(display, disp_state);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 914cf9dd0f21..1baeb9401cfa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -215,7 +215,7 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 
 	dp->msm_dp_display.drm_dev = drm;
 	dp->msm_dp_display.display.funcs = &msm_dp_display_funcs;
-	priv->kms->dp[dp->id] = &dp->msm_dp_display;
+	priv->kms->dp[dp->id] = &dp->msm_dp_display.display;
 
 	dp->drm_dev = drm;
 	dp->aux->drm_dev = drm;
@@ -1406,11 +1406,6 @@ static const struct msm_display_funcs msm_dp_display_funcs = {
 	.needs_encoder = msm_dp_display_needs_encoder,
 };
 
-struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
-{
-	return msm_dp_display ? &msm_dp_display->display : NULL;
-}
-
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 69e57ab47258..3bcea5f5b5a3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -170,7 +170,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	msm_dsi->display.funcs = &msm_dsi_display_funcs;
-	priv->kms->dsi[msm_dsi->id] = msm_dsi;
+	priv->kms->dsi[msm_dsi->id] = &msm_dsi->display;
 
 	return 0;
 }
@@ -319,8 +319,3 @@ static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.needs_encoder = msm_dsi_needs_encoder,
 };
 
-struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
-{
-	return msm_dsi ? &msm_dsi->display : NULL;
-}
-
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 0327098287d1..1d5a4b63f3c8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -276,11 +276,6 @@ static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.needs_encoder = msm_hdmi_needs_encoder,
 };
 
-struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
-{
-	return hdmi ? &hdmi->display : NULL;
-}
-
 /*
  * The hdmi device:
  */
@@ -315,7 +310,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (err)
 		return err;
 	hdmi->display.funcs = &msm_hdmi_display_funcs;
-	priv->kms->hdmi = hdmi;
+	priv->kms->hdmi = &hdmi->display;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 378d2cc80b66..3d9ae49cba49 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -324,14 +324,9 @@ struct msm_display {
 
 struct hdmi;
 #ifdef CONFIG_DRM_MSM_HDMI
-struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi);
 void __init msm_hdmi_register(void);
 void __exit msm_hdmi_unregister(void);
 #else
-static inline struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
-{
-	return NULL;
-}
 static inline void __init msm_hdmi_register(void) {}
 static inline void __exit msm_hdmi_unregister(void) {}
 #endif
@@ -342,7 +337,6 @@ int dsi_dev_attach(struct platform_device *pdev);
 void dsi_dev_detach(struct platform_device *pdev);
 void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
-struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -350,17 +344,12 @@ static inline void __init msm_dsi_register(void)
 static inline void __exit msm_dsi_unregister(void)
 {
 }
-static inline struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
-{
-	return NULL;
-}
 #endif
 
 struct msm_dp;
 #ifdef CONFIG_DRM_MSM_DP
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
-struct msm_display *msm_dp_get_display(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -370,10 +359,6 @@ static inline int __init msm_dp_register(void)
 static inline void __exit msm_dp_unregister(void)
 {
 }
-static inline struct msm_display *msm_dp_get_display(struct msm_dp *dp_display)
-{
-	return NULL;
-}
 
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 3f855f9b3d06..1a081e15a0a8 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -286,21 +286,20 @@ static int msm_kms_init_connectors(struct drm_device *ddev)
 	int i, ret;
 
 	for (i = 0; i < ARRAY_SIZE(kms->dsi); i++) {
-		ret = msm_display_modeset_init(msm_dsi_get_display(kms->dsi[i]),
-					       ddev, kms->dsi_encoder[i]);
+		ret = msm_display_modeset_init(kms->dsi[i], ddev,
+					       kms->dsi_encoder[i]);
 		if (ret)
 			goto fail;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(kms->dp); i++) {
-		ret = msm_display_modeset_init(msm_dp_get_display(kms->dp[i]),
-					       ddev, kms->dp_encoder[i]);
+		ret = msm_display_modeset_init(kms->dp[i], ddev,
+					       kms->dp_encoder[i]);
 		if (ret)
 			goto fail;
 	}
 
-	ret = msm_display_modeset_init(msm_hdmi_get_display(kms->hdmi),
-				       ddev, kms->hdmi_encoder);
+	ret = msm_display_modeset_init(kms->hdmi, ddev, kms->hdmi_encoder);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 06646091604a..cbb9c9dcc193 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -139,13 +139,13 @@ struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
 
-	struct hdmi *hdmi;
+	struct msm_display *hdmi;
 	struct drm_encoder *hdmi_encoder;
 
-	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
+	struct msm_display *dsi[MSM_DSI_CONTROLLER_COUNT];
 	struct drm_encoder *dsi_encoder[MSM_DSI_CONTROLLER_COUNT];
 
-	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
+	struct msm_display *dp[MSM_DP_CONTROLLER_COUNT];
 	struct drm_encoder *dp_encoder[MSM_DP_CONTROLLER_COUNT];
 
 	/* irq number to be passed on to msm_irq_install */

-- 
2.47.3

