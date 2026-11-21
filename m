Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297294;
	b=UdhysWBRnsFIrKvWiZ0RUVhftndPsryDd7jiUP6VzCiPKyUNPCp5Go1spJcjI4WpjC9A
	 nWCf2eTNR6xu+qG0KjTU6ymnVNQu67QaUWlMF4Qg1G4xgDvddJMHU4++RoJZaQXgHEIRm
	 LBs+hVUvUmArRupgjSApnsk07RWvd7t1rbbDZ/JZBsMmjV5v0PaO28p0Kgvs3CWIyaFzC
	 LuXDIxev1hj/iQ13WkpeZWNT1h0Mz2nN5OxRKPVxN9Ll5Lrq9m8MKxFuAWI3Fr75aqaz3
	 otctHDdJ1LvXzpF95fPmvIz/rYyIDBRKIR9PlBjnj38JwMgpBnhDv7jnHpVt2U3l8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5I2aOpuySiZc3XsYEC1y1yTm/k9Phx8ruM/1Leeniig=;
	b=wcdgaoXTDPtsakgYg4l1K7+uIePsQ/9NAQlPhu+72xTouYYaNqoaJ+1smlLf7B+bLjYm
	 XPlFgfS0rNDwKzIUDPdx7cZNKDk8NHEBcCCQ0/sO66a8pW2GLDq+GUfvIS38xOMxmY4vz
	 ggK3Q6xx/000rZMKlozIp4hzSrOvkfOqkQtubnGGTXB6XHTO1Rai/XqN9poXPlr1/BLd6
	 0ynUX0qT6euOebxUiGRhBKz3F5R8+QW9P0ZQbIXc7UoB0wtjf/0SCDiv5SPC5QG7bWtqv
	 GUSX8Q7V1A1kfkglUxdfiiLcPHmDK6cN8Wwgj79EcydZGeyRqpSYXNCeuaZLNplX+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3hNGtNh;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2F606A338
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A2F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3hNGtNh
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so8069435e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297292; x=1795902092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I2aOpuySiZc3XsYEC1y1yTm/k9Phx8ruM/1Leeniig=;
        b=H3hNGtNhCqo5UV0LMegPiex9yYlJgra1sYUFExskdnuhc88GThB0OPpD+zCGvcvm5L
         S8SgghGEGDvnW5ZWK/fDMmnJCxaoA1LNr70WKCKXlvgVJFy1olWhoCuw6cWLM3naUlbD
         kEH7Kjra8JIA3c6lewfvKI7lOUrKH1tRsgjoysRYzR7bogJHz6JiUz97LD97bn0XnJ/U
         NXRu/wilCskBqS3yyrq9kdCFJtBDDTnEch6WAHENBGhuzTvcZjgPKIj0m0FJlTQGWV6t
         AosLQVUiZlcOo0B0TrPJuDanByX75hl9eTqxK/I1zLIAfka3ObMUcoXNpQ9kA5OG7s5H
         zTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297292; x=1795902092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I2aOpuySiZc3XsYEC1y1yTm/k9Phx8ruM/1Leeniig=;
        b=lq96+s8JCConMpNj4Tga+L/dTfUM536qzbZOF37R9aL5FwSQswmFGTZVYemssEdgIx
         V/SIrNKu2ncdWVjKKsWTbLjoPKPD1ubgqWJuDqiK00PlTA3Lj7MZ41XrYFigHb9/fa9b
         W/jSmdRq8H69uGnP87wljXJcGPbnxolMrEpFjcOzO78yatFdkPT1JdJnPjerPxGVC9a1
         c3NwXTD5OxH9a3xJlXRq8kv/A66pHZ28Zlp7qG3vAhLkdnP9BBE19mmKup1OY68B6Whq
         94QO3+v4riVpqaaquxs3wXFnPCklS5s1c/uTxIDNwJfpJ77iFrns/DpOEMAcbqRjetkr
         DNkw==
X-Forwarded-Encrypted: i=1; AL+hErHkgi+L25re8yPmxX/9qqQViYLN+tl+78cofIqIWzyHsOxWl0NwOoG09KGQjICtZHDHSjrLv/NfnBpP3G2K@vger.kernel.org
X-Gm-Message-State: APuU4Z/dOL9bdTPYxgwM+jgAOWq55xpXDzPbHbys24f4dFHhfM6BmChb
	p9JAFppBMMmZGN4uxyJMa9oDuwd/F7iDRX4EVpcHBv3llCnSMWvPCOY=
X-Gm-Gg: AZFdTZcKbpyYnZ4EuU7QIGawrXuys0El8oenKbZpsSW2+irg1GQmN8bzu2k03aI1lDt
	uGqeG7ZK9YEmHbZLat9SzsPTsdKpz5E0VWiQeYOP5+YI/M3gbepqgOoRPSMLFOohRXZRMcGn0MB
	yBu7eukAka1Q1n1ae0Bvv7cLz+ARWZVJV5RRnI3vFKCqwY0LU8zNAe9+nC4Pbw68WkA4pnofbIB
	F+g3mG/E/3g42jdlN/DL1uRTwFrNdhhaUQJJzrT9x0fdEamyyds0T6Bh+mRb8skKlYYZD0COYi0
	EV6mzWpNJ/fn7fHM0J21u8QljIgyvr5i839xmF4ouacw33u+QyDrfYe1OOcIkqQJ3OtQT44AUog
	JVeKADkbF1iLIyg/fz5RbzL+h/g+o2aTnAdaT7iuA8tN6id8m3z1TOwah6DBG0ghcYlaL9LLN33
	QdrL1kLp1r1ElyDHlf4i8JzgKXI6dg3WC3LiT5x8pY9RY2btkru84mo6WxYxNAwgJvGWE9qecva
	Q2rAx8D2bD/FKl9LsHqJ6W0wx28UiA8fP1GT6WjUUP8H8BMBIL10fEnhLHYeC22jOPzQP4jWQEB
	mwAtrmKcaL1/jAoQP5c7k5oz6xjsGyOdB5zyFDJVhU8D8Y94zxPnmRB8ObChyQ==
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr165597625e9.7.1795297292204;
        Sat, 21 Nov 2026 13:41:32 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:31 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 7/7] drm/msm/dp: fix HPD plugged and sink_count state tracking across hotplug
Date: Sat, 21 Nov 2026 22:41:05 +0100
Message-Id: <20261121214105.32596-8-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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

Keep dp->plugged, dp->link->sink_count, AUX transfer enablement, and
runtime PM references consistent across DisplayPort hotplug cycles:

- In msm_dp_hpd_plug_handle(), return early if dp->plugged is already
  set so duplicate plug notifications do not leak runtime PM references,
  and unwind AUX/PHY/runtime-PM state instead of setting dp->plugged =
  true when msm_dp_display_process_hpd_high() fails.
- In msm_dp_display_process_hpd_high(), ensure dp->link->sink_count = 1
  when a valid EDID is read from a sink that reports sink_count == 0,
  preventing msm_dp_display_prepare_link() from failing with -ENOTCONN.
- In msm_dp_bridge_detect(), stop mutating priv->plugged (which is
  paired with the HPD plug/unplug runtime PM reference), and always
  disable AUX transfers on exit when !priv->plugged even if the PHY was
  already initialized.
- In msm_dp_hpd_unplug_handle(), reset dp->link->sink_count = 0 on
  disconnect, and in msm_dp_display_unprepare(), only enter dongle D3
  and re-initialize the PHY when dp->link->sink_count == 0 &&
  dp->plugged so a full cable unplug powers down the PHY instead of
  issuing AUX writes and leaving the PHY active.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 31 +++++++++++++++++++----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eddeb972d6d6..80f05effd18a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -307,6 +307,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
+	if (drm_edid && dp->link->sink_count == 0)
+		dp->link->sink_count = 1;
+
 	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
@@ -417,6 +420,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -428,6 +434,12 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	msm_dp_display_host_phy_init(dp);
 
 	ret = msm_dp_display_process_hpd_high(dp);
+	if (ret) {
+		msm_dp_aux_enable_xfers(dp->aux, false);
+		msm_dp_display_host_phy_exit(dp);
+		pm_runtime_put(&pdev->dev);
+		return ret;
+	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -435,8 +447,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	dp->plugged = true;
 
-	return ret;
-};
+	return 0;
+}
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 		bool plugged)
@@ -477,6 +489,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
 
+	dp->link->sink_count = 0;
+
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
@@ -923,26 +937,22 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
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
@@ -959,10 +969,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	 * lose the state.
 	 */
 	if (!priv->plugged) {
-		if (phy_deinit) {
-			msm_dp_aux_enable_xfers(priv->aux, false);
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		if (phy_deinit)
 			msm_dp_display_host_phy_exit(priv);
-		}
 
 		pm_runtime_put_sync(&dp->pdev->dev);
 	}
@@ -1524,12 +1533,12 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
+	if (dp->link->sink_count == 0 && dp->plugged)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
-	if (dp->link->sink_count == 0)
+	if (dp->link->sink_count == 0 && dp->plugged)
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	else
-- 
2.25.1

