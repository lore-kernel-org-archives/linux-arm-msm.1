Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656633F5BE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702241; cv=none; b=FN6zU9rXS6HudVZr3LjKAG2fSgMFSkyZ2pWsNW8ER9eITMbY6tb20voSbCtzlrqmzxDejNJBIXddOachDt21/SUpw73YgixPttdo3hdM4c1Y6E4jYZl1zYuxqTTFmN6SpQXB264m7Kopl/xcHnKrte4Nhl966KWkIJ5dhf+h2y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702241; c=relaxed/simple;
	bh=diWNTbMiX3Q6h2vK0nQNDlVkK/Hi2tSo6wV5owE3Hyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWR0BNZ52f+VvjKkmd6hi83eZlc7LYKuKtlxpPAQuc3riOU4E8Zl3OHuFnBS0Nj6tIbqzi1uexkIVv26Pe/8O0wy/m1Sf/Yf6REAwQnaGletG0AkKzk7FpdQ12akhOBrVjlLfXoN80pN7LWkpHFeqYcga4Z+8I1T69+qBwDGzco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z600wpQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMFpIxAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z600wpQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMFpIxAv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53j794169092
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/N2h2fNm8ptXyOm9YpJtPlGRvCQAMisqL9rrCQy59TI=; b=Z600wpQr42PqCRaK
	R5PYakpOn2H7heJPepSj2P1XrX767kHw2/APlfzlpvOT18ox6/s69pxbdDpgzEAM
	43u/ZWkSXGE4fWhD7u72sTMl+U3fB4l6ouwpX16SeA7NHA600QXSkK4Hbvvu96BS
	56MJr8Ot9izmBR4JA/O/Ms9MBhFyR1bdMhDcuRIoc5c/USs0e5cOw6VAzaLuAta7
	UIDVF5LQslOEkLwTnUwC+tjXXfnLO0EEsEebhG4gH2NNhLUimT/Z7LjZN5ffHa8W
	4KcwpD0EmgJEmBUfQqaAP4wNdXa7yGj1M7JnOR7KiuQ1zkXUMTpDCRRF0sGHD4Z1
	YHOA2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mpk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso247028291cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702237; x=1785307037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/N2h2fNm8ptXyOm9YpJtPlGRvCQAMisqL9rrCQy59TI=;
        b=UMFpIxAvPwyQuj9I8wdXT8QGdFHcyaZXnx30fkugqqOCiay0JG28HTXN20jaddlzQl
         7MQ6++p2pjUsriGFZv+Hg65J2xZqT3BHHBS+DKwtrSWEzj4oVhgT2uVLAflo1xXMaS2v
         rZhW960LmxqBrVKG98xuvJ4KDFmzLNoVD1q6uOXX3Fz25s1s/rqsbDluevTBya7nrhXL
         Jitoyg52IfTzetMSaC0rLtaxR7eSuwBNu6kJT3xT6e+8rwGvzIZuJH0FLggHjiQ+DFCM
         XlzHmer5yJPo2aDuXw8u/NsH8WxJ50VhkHIRE445pWO4qBcoULldkNFf9/dfr87Lp6Gs
         0cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702237; x=1785307037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N2h2fNm8ptXyOm9YpJtPlGRvCQAMisqL9rrCQy59TI=;
        b=ZG/0ucwOiWbUubthWI1DMf358JfcE0iTzz9bgzLJx/d5bPpB7C1SJ/WyVZJZIft7zP
         XJb+E1EGBdZ5HjYf7vghO5PIVeM5scCtBNZLtm8YNfuJSlEmFX6Gv45zKuZXYSVLLjse
         R8dWytesNYXc2dLpKT9EpOHdeDx2YJ3KxrPcogNxXzaaHA7v5g5IDkmu1pZHVVa3aeht
         uu5Ns+mMFvqYxfHSbAalQMu5IaeRnGxEBzpj9yUKOF2AK7KZnOg1wYd3vFOaQvTpkwTv
         Tj4AGh8UTtrXJ+aN9mrxdBX+MA0NbqnSRzm7Ja3RY8CedwhopmDsCyGpfjq4x35u7pQr
         kV4w==
X-Gm-Message-State: AOJu0Yw45/qvwQ1TsXP+lgndyy1JtuxmXy2ggMm9gKzlRSO3AkBRmRkc
	ovt1aGVBBd4cRtUOev3JShWwS7EC9W+MCFs5q/eaECcwF6mxoMQMRXvFR418gUaOFvAM6TfoNPO
	5BgQ60LUFRxcZOYOUdVyK/FIAWLnOaZSRUF/Cos5DjqdGEUvnYFVw1snhh7uGkqLl2GA5
X-Gm-Gg: AR+sD12fnrEtIbVkOqs4kI0atWAvukdE5GCw3RRNe7tICoZbiKlOm5CfdgzFv1ryPhF
	RCAMoPCELBesEWAjbwMxW7qh3wVyue1W8BVX8ZaJPgG4FDOPhWwHJseZM0SHg+ooZnZiLWhZQZt
	gqnGNTjc6i71SXRPrS3bE4oYcOcidFKcFRiXMxpnOBGXP+M4SZth7cj3kbSdF1hqJeXfuxNHRu+
	uPAzP7Ww2CxtmTckn3fp/V9sDENBHs9MflU3twpGGYgaZfl9HUVRkmoSDyFFx6dVD8yOFPRyckA
	RoFm4+/Bzww/zDYHKVWGuFRkQh7LOe7PHaxlc0rc49lMON1Y3YbvmXYWUHV/Zflb6k5CzNHuRP+
	PlwoU0RBw1K7ISuZwliVXYlWPkgLgIqwyD2qbWWUxvm94x2nzzf2aEeiLlPOfrS1MfHX8AlJ3Di
	vPSLrLI2Z7XlRhvA==
X-Received: by 2002:ac8:7fd5:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-5213e67ff0bmr204841481cf.73.1784702237330;
        Tue, 21 Jul 2026 23:37:17 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-5213e67ff0bmr204841141cf.73.1784702236771;
        Tue, 21 Jul 2026 23:37:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:31 +0300
Subject: [PATCH 16/24] drm/msm/dp: remove cached drm_edid from panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-16-368c10fe62fd@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tau2awtWuAhs2tDJVOVXS8J6tZ80ehQO2Hh63gIguw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGToa8nXbs1RicH6gBraYnP9JzFOBMrRiwAON
 Mqvh71MJ/6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6AAKCRCLPIo+Aiko
 1bb4B/9qpoCq1AiOg5pzEiaXhfFa6eogR32uUrVitujIIG3Ogd4BhYdJC6jzRnhJuOurjUbIDHd
 GqNOWwWsvDqUgluPij04jh3/uSGqZf1z8iHXwMFkDeurfScOH0fKGCNnwbG9k6x3YGn0MpbVvOI
 XcDuuG2FSJK4XGuhJwk+xyYWT2+TTHngLI+xq0OukFkdiw2QS8mFng0QQSI/gMVO7lChJD6ZucI
 XYaR+Og3idnNgE4i4Y4KGm3T9pOSI3B/1wj8N1tE8lklTvv4Vh8jV7VVrAoqIjO9e5pN4UZKvu/
 DRMnnajjYtmmFdUBxfPIXnZgNoomrht60t1FsNnemRjhEJ7p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX6jqy4b1aj1Pq
 ikogDWaIAvcdiV/L+AD/HHirNv/ikQMc+NhYGblbEDlBo67raD7NRZc8xpPl3nce1ZRabS8PN9p
 MMCv5oENGt5tTAWGaJitxDy7ncjxYND+hbkNfdE5+e/j61dTuYk9P7BJmkpHfXHzmhmSZf8itQA
 hI+KcpOpFZqNF2kFoW8EtaZK0DaH77FjplazTdyBiKdOh1QCwELLJHT/U6uvVzSfk3ByD8Ks90e
 ao6DvXBU+KzDAqp5WTnb+ZWYxFGg4k8wzG5fMOXCG0rL0/sq2djMAHq6qgI5rG10bnwu5kSvI9m
 a1ddYgxAt67qSG4YP2CmZ3Z0BomST2FIB9BeFSaNk8OHxuTfvyWvMVUcBNIe17XdFCa/TpqQAcz
 dcA0n+IJLbcJWMEtITgoSkvr+JXRnSfzl5Rv3hq366uKhgLWaKazgOLhcoqgM28UsRNRfvLFuIq
 +jkrJKGW2zNrSH3GeIg==
X-Proofpoint-ORIG-GUID: ZDPI58ykoZmjjK4-9jYBEFVDsbGjc1Ge
X-Proofpoint-GUID: ZDPI58ykoZmjjK4-9jYBEFVDsbGjc1Ge
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX27JNoXUs7OKO
 Bc9gxhwRwvFEN6vzLmCz53UIHcVMVyINvWskeea8ZTPYZ6Vy9BzGguzaQwSZo1k4zM5U74k9oj1
 dAFORs6MuJySA9SdB1MX5Pp/bPyqUsE=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a60651e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=afWckrBw7P4RIPHO5CIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 59 ++++---------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++-----
 3 files changed, 27 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bd1354f2c15d..cd4923d1a17e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -272,6 +272,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	const struct drm_edid *drm_edid = NULL;
 
 	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
@@ -279,10 +280,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
 	if (rc)
 		goto end;
 
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!msm_dp_aux_is_link_connected(dp->aux))
+			return -ETIMEDOUT;
+	}
+
 	msm_dp_link_process_request(dp->link);
 
 	if (!dp->msm_dp_display.is_edp)
@@ -294,7 +305,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	msm_dp_panel_handle_sink_request(dp->panel);
+	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -305,6 +316,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
+	drm_edid_free(drm_edid);
 	return rc;
 }
 
@@ -456,7 +468,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
-		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
+		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
@@ -518,7 +530,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
-	msm_dp_panel_put(dp->panel);
 	msm_dp_aux_put(dp->aux);
 }
 
@@ -569,7 +580,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
 		dp->ctrl = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
@@ -577,13 +588,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
 		dp->audio = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	return rc;
 
-error_ctrl:
-	msm_dp_panel_put(dp->panel);
 error_link:
 	msm_dp_aux_put(dp->aux);
 error:
@@ -755,8 +764,7 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_panel_get_modes(msm_dp_display->panel,
-		dp->connector);
+	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5b4954e7cb74..bde4a772d22c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -232,8 +232,8 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 	return min_supported_bpp;
 }
 
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector)
 {
 	int rc, bw_code;
 	int count;
@@ -271,36 +271,9 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
-	if (rc)
-		return rc;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-
-	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
-
-	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-
-	if (!msm_dp_panel->drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(panel->aux)) {
-			rc = -ETIMEDOUT;
-			goto end;
-		}
-	}
-
-end:
 	return rc;
 }
 
-void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
-			    struct drm_connector *connector)
-{
-	drm_edid_connector_update(connector, NULL);
-	drm_edid_free(msm_dp_panel->drm_edid);
-	msm_dp_panel->drm_edid = NULL;
-}
-
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
@@ -324,22 +297,6 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 	return bpp;
 }
 
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
-{
-	if (!msm_dp_panel) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	if (msm_dp_panel->drm_edid) {
-		drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-		return drm_edid_connector_add_modes(connector);
-	}
-
-	return 0;
-}
-
 static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
@@ -347,7 +304,8 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 	return edid->checksum;
 }
 
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid)
 {
 	struct msm_dp_panel_private *panel;
 
@@ -360,7 +318,7 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
 		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		u8 checksum;
 
 		if (edid)
@@ -757,10 +715,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	return msm_dp_panel;
 }
 
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
-{
-	if (!msm_dp_panel)
-		return;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9173e90a5053..53b7b4463551 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -33,7 +33,6 @@ struct msm_dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct msm_dp_link_info link_info;
-	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
@@ -47,15 +46,12 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
-			    struct drm_connector *connector);
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
@@ -94,5 +90,4 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
 			      void __iomem *p0_base);
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.47.3

