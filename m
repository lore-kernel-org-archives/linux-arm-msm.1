Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774474;
	b=mZz8N8vYqWdHTZJPQU8jSMUwa4ZToWDI99kyZaiGc+7q+ZQu7wQk+WSn3dreSKwb6VnB
	 JmtIIwFRqa8Q3NIhBq0aOvKXi7VjSChD9EV0UWonCjgfUQOForr6AmCEx1tYrvPzeUEkq
	 m5ra/ywwZOft51CLhDEmISlCKZAqmew4hbFbR6gDFJS7TvkDVIKLhfe3PFI5jAYBYG8Dz
	 zov6QDDxli138bVxmRUbD6BMKC77irZrTaHjXOJJ5vvCjiIw72d+7KS2bkfYOpA4L/pCP
	 YtiOSln0/pxJvNEthPrD7MCtxheBk3dt3T1ssvGU/8K08FSZAAIaRBYZfqVpSUDOh6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rdDl7Q4foQHYAjSl826AE0/syYoFqrpNAcvwAyqjlxc=;
	b=feByfPtwDuyp6Q+w8IgeI/U2KKzXuu9irPbQVx2W/gxT48JmYw2b8NgjLwU+9BABJhDR
	 qiUHUilZ77XOBYnuxFaKN25K4XlpPT06LTotGI1Ke97Oz6dU4bzkwPQHt9dJ7748nftKU
	 SUUrAPrgoGf00fg4DcdVmRaOl+rl9FizJERMzQtFgMYjevpDQC66oAJcgCxhTkOkauFiH
	 IW4J5Axu6Xz7vTSzxrhFrXytgSuxTffIOkZEUJp+7eEoJZq7v57Qn1yn0Syq7mFwUGLnx
	 nYDb1m6YvRprTeP4fL5yXd059P7pF1edpTJ0rrE5NWRWkg71rfq8wD9uhytxk1O8o+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfuyINck;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0318F60A2610
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0318F60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfuyINck
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so5616879f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774472; x=1796379272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdDl7Q4foQHYAjSl826AE0/syYoFqrpNAcvwAyqjlxc=;
        b=UfuyINckwgc2hPjGbLkcbnYhUtHN/BJ7AsmfkJrwi6qUFYw6/UEG4eU0tXYu5gd6me
         avs+XWJmLKo8wbUvTXZB0JeD5WcC9YlfQtJ/Hetujggt+RsqvJpdLKhsxp+11AFhGaxr
         3A/jf8Cr9eoMggZ6DXJR6jCPiJ0tzrt+zO0Vasec8v63ARyeDWDCc9YAWBc/6VND5Y0e
         wr52ICxqcet5uL666PY+8L7wWbWCZAu4dCAODVp2ROADy/98+FNsNIX39GfB4UXXqED6
         k/5opcriwUD8CNqp1kzRImuf59pJwVifJU6TVMSPSyx3M0rOrqJxztkqGT4L1ePvMJCZ
         FYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774472; x=1796379272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdDl7Q4foQHYAjSl826AE0/syYoFqrpNAcvwAyqjlxc=;
        b=ROI0AtM4HkSGdJaIYGVzpAoElwNwhN/hRA0xW53F0fMBEqWJYvyFFpdtpxwPsottLn
         adZ7Ql09YK34NW3ThvGXWiMM9M1owCc3/H/9cnk57rkAZcpTbRRNxvfY9vxvrKwZRufN
         87dRvmcC9WKndfYsxSlz0EqP/VCzTiODx08i9z4PNMGTVnQBdM8f3JBTM9VFo8yIRTAR
         x+9HpQiJmENoRSKQNi/S5rh4VD8M42zeq4+TyMp4MDupltRSCYC2n6VFS+LBuk524BFb
         8JOGc4Cpq0WM6mIT2AaYKDRMCCzZzgQQLc7wQqAEMmN+yHZzbDZDdsw/yJijYHJj4iki
         rKSQ==
X-Forwarded-Encrypted: i=1; AL+hErHd+84FOgwiSdllaSN7tPxe6vnhyzY9p11ntVC9c9QgaK9lrEfZ390YrWPYsJ28R5ToIWZ0pXNDfp4Bd6Mk@vger.kernel.org
X-Gm-Message-State: APuU4Z8xZc3D/ZUdSCSDk4VftlK4Dddx9eOh/q0WsDyVGD96Gy3xe5go
	u5HIBNnJZ0XIBG+GvKplL84tKztrPMDEd47FW+rqaKCBKkrRuPqdc2U=
X-Gm-Gg: AZFdTZcQd40PPJq4M3ZoswZ+oK9AvH1zGK3ZJgf57uSaOOhPGrsRWdhlTbUJHD2PgZL
	YI7oUsaVb9V9SkIeDpw+jdyCdLHeTzl4W1H67dze0ivKOHs0nBwdoJd8OrBJriqESMGgQ1ZXdIr
	M73gPh+GcK0UkgWErIt2GEPPYlw8ad0s34Pk4SRBB2+9boUSzcgslG3tUCLHAFn5821HxFyxsBD
	gYIs+8XtjJrcoK8oSH5ct8U4PEMYWOBAGXPsOIn8vOg84B6G0YJgydEGoSrJgB26fnWWk9eLHfJ
	BiSMY3sPQoqByVkUP5Fhwx4xFwHjwJeCgzaHFBciJl6IreMG1NWQ43sbwrP/v1rZa9okVd9lH8b
	VwAXYIKjCBPxezydnPxoFsqEz17A49sZX/MNCJbSXdg30nS5ow0PGDnR+onSIrcFIgEsEtVbeba
	oTjKVhYDsw8Kygqxo637Ufpe1hB2Xha+TNcy+3bHjGEsgKQgoMMWkX3ZYb0TPTl4ylVpmto1C1D
	1LrZxCYvArJvTub0GqGrKkhDyqWTu70BvWg1NuDNCjlq5tLT04HMtxzzZiD4X0/4s/lyLA//Zge
	/A/KBCrAH+NR2gXvfXrgt6kBotmIDfibCZxclaWKk4r74jHXAsCMkmRQBXE3jKIIzJY/xnoFyMz
	cyIviGUfHgZX1uBChI65b2FpiiIuFZfrI0P8n/L37AxbcEQqXK/KvclsZsTg=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr47747367f8f.9.1795774472210;
        Fri, 27 Nov 2026 02:14:32 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:31 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 07/10] drm/msm/dp: fix HPD plugged, AUX gate, and runtime PM tracking
Date: Fri, 27 Nov 2026 11:14:14 +0100
Message-Id: <20261127101417.24303-8-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep dp->plugged, AUX transfer enablement, and runtime PM reference
counts balanced across hotplug, detection, and link preparation:

- In msm_dp_hpd_plug_handle(), return early when dp->plugged is already
  set, unwind AUX transfers, PHY init (if initialized by this call), and
  runtime PM on DPCD/AUX failures, and keep dp->plugged = true when an
  empty branch device returns -ENOTCONN so downstream hotplug events
  remain observable.
- In msm_dp_hpd_unplug_handle(), avoid clearing video_test or disabling
  AUX transfers when !dp->plugged.
- In msm_dp_bridge_detect(), stop mutating priv->plugged (leaving
  ownership with the HPD plug/unplug handlers), disable AUX transfers on
  exit whenever !priv->plugged, and unconditionally drop detect's own
  runtime PM reference.
- Serialize msm_dp_display_prepare_link() under dp->plugged_lock and
  require dp->plugged before bringing up the link.
- Preserve dp->plugged in msm_dp_bridge_hpd_notify() when detect reports
  connector_status_disconnected for an attached empty branch dongle.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 71 +++++++++++++++++++----------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7831dd13b067..a48f42a17365 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -408,8 +408,9 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
-	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
+	bool phy_deinit;
+	int ret;
 
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -417,6 +418,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -425,9 +429,16 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
-	msm_dp_display_host_phy_init(dp);
+	phy_deinit = msm_dp_display_host_phy_init(dp);
 
 	ret = msm_dp_display_process_hpd_high(dp);
+	if (ret && ret != -ENOTCONN) {
+		msm_dp_aux_enable_xfers(dp->aux, false);
+		if (phy_deinit)
+			msm_dp_display_host_phy_exit(dp);
+		pm_runtime_put(&pdev->dev);
+		return ret;
+	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -435,8 +446,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	dp->plugged = true;
 
-	return ret;
-};
+	return 0;
+}
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 		bool plugged)
@@ -458,10 +469,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
-	dp->panel->video_test = false;
-
-	msm_dp_aux_enable_xfers(dp->aux, false);
-
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
@@ -469,6 +476,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (!dp->plugged)
 		return 0;
 
+	dp->panel->video_test = false;
+	msm_dp_aux_enable_xfers(dp->aux, false);
+
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
 		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
@@ -497,10 +507,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (dp->plugged) {
-		pm_runtime_put(&pdev->dev);
-		dp->plugged = false;
-	}
+	dp->plugged = false;
+	pm_runtime_put(&pdev->dev);
 
 	return 0;
 }
@@ -641,13 +649,15 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	guard(mutex)(&dp->plugged_lock);
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
+	if (!dp->plugged || dp->link->sink_count == 0)
 		return -ENOTCONN;
 
 	if (!msm_dp_display->power_on) {
@@ -926,26 +936,22 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	DRM_DEBUG_DP("aux link status: %x\n", ret);
 	if (!priv->plugged && !ret) {
 		DRM_DEBUG_DP("aux not connected\n");
-		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
 	if (ret) {
 		DRM_DEBUG_DP("failed to read caps\n");
-		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
 	if (ret) {
 		DRM_DEBUG_DP("failed to read desc\n");
-		priv->plugged = false;
 		goto end;
 	}
 
 	status = connector_status_connected;
-	priv->plugged = true;
 
 	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
 		int sink_count = drm_dp_read_sink_count(priv->aux);
@@ -958,18 +964,17 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 end:
 	/*
-	 * If we detected the DPRX, leave the controller on so that it doesn't
-	 * lose the state.
+	 * Leave AUX and PHY enabled when the HPD plug handler already owns a
+	 * plugged sink; always release detect's own runtime PM reference.
 	 */
 	if (!priv->plugged) {
-		if (phy_deinit) {
-			msm_dp_aux_enable_xfers(priv->aux, false);
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		if (phy_deinit)
 			msm_dp_display_host_phy_exit(priv);
-		}
-
-		pm_runtime_put_sync(&dp->pdev->dev);
 	}
 
+	pm_runtime_put(&dp->pdev->dev);
+
 	return status;
 }
 
@@ -1598,6 +1603,22 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 }
 
+static bool msm_dp_display_is_dongle_plugged(struct msm_dp_display_private *dp,
+					     u32 hpd_link_status)
+{
+	u8 rev;
+
+	guard(mutex)(&dp->plugged_lock);
+
+	if (!dp->plugged || !dp->link->has_sink_count || dp->link->sink_count)
+		return false;
+
+	if (hpd_link_status != ISR_DISCONNECTED)
+		return true;
+
+	return !drm_dp_dpcd_read_byte(dp->aux, DP_DPCD_REV, &rev);
+}
+
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
 			      enum drm_connector_status status)
@@ -1626,7 +1647,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
-	} else {
+	} else if (!msm_dp_display_is_dongle_plugged(dp, hpd_link_status)) {
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
-- 
2.25.1

