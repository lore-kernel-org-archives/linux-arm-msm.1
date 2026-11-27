Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774476;
	b=tEF1lSyBchbuKfLQP3lqdTmtks8O88DJvSFZvoHAVsW85Hb9OGTCjoChTmk4CtOnookF
	 E3+Issy4+7N/a4SoysrwvpfPYzf1S7cV1rJm8zOxg/pEJ2FyvIm+BPmvKyOCQe62St4ja
	 u5eW5+uXgTdn/2m+459bFOQrN4gSWnMXR7FfSCPWJ55mzMkoW+DX5KzkAjJu7gmQp8bYI
	 vu/R0WIew8g7CF80NG9SwU1kV/6QviWPUfxjTCp3yzmaLWF57Fo/NA6NxNScMHe905iSi
	 UwxhJ/Oel3a8noqG1N/WuHdXK7s5WLLwiOSCIfIuo0pzstrUH+vdUMjZMsgLrrp7d+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZfuPsc7xLuv7FveL7LRtKmIlOFCOOjMPi+YwZzyG6OM=;
	b=LQRXrv/5cMSEsPvLwrvlEbI2tzg0i3yIuI+6RHV+wCZyXWvJ2mFfq9OTJS2Mhk09ukGG
	 kjPIGG+bcpYJYObBlRK9vZ4cv9tQf81JXXAAeg+7rHwsVXEpT1EbNCriDFtIqlTi4qX6K
	 H0QVu3oGkphGzBz9NDBDYShivoeaW9OXwPuSJ+8DfMCCK6vqWUnsDHJWvEUwFIy4wyxsO
	 I6RImpUdHAGnuBy+/J7H/WXBSEtcXeKzURe0/zNYn4BddymQT0AfWsOumXNH77SFOut2D
	 ofhDKwCV/bVSZwRNmRb0akJqpLqN0ug4PaT51BdCLplzu+UOgx69RAaguUnbWNnkfgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+iKsD6g;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A46560A5BDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A46560A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+iKsD6g
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49a92144733so3962189f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774474; x=1796379274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfuPsc7xLuv7FveL7LRtKmIlOFCOOjMPi+YwZzyG6OM=;
        b=X+iKsD6gkrlerHvrXktIyubXchqylq33XM16vx9ulS+Sm50x8mKPK1SMioelnl24Ha
         6+2gyJrlu/jYKuDDQ5Hq9WQWocSm8seUt3Lad7/65czR9xLndmULyOThxeMQkuv2OwN/
         svN1r01hTKW06Ult382XUal/Rv2h0Ol6MFGYP9mGjI9wqQyAvNmqHwKD53shRH6mIF1k
         yw2B3faf47+nZjQBo2d60FoO0OyoL1KmTsMHCWzFCPFWwZWGn4oyferIJ/sOkcScYNM6
         +WVGutkgaCejViF7vwcGl2qF4eqngx603yuiuqj8iDbfCQVCBg/ukz1y+4t2Dmj66uyn
         ZW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774474; x=1796379274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfuPsc7xLuv7FveL7LRtKmIlOFCOOjMPi+YwZzyG6OM=;
        b=0MrLBiWuFzXGvqn7KHQdangqOcWkKcRuLX+UJyQ3k25+yjRCERhHzTKmyyMD9NcwkK
         yz2fNATJbj1VNxuLRDjuFr/NW2Mr8jHrAZi7gVk/dZh81idQbKHElWCPLX+TbzMiZZpb
         /0yo3YSa3oRak7qubY7yCbWhTrEyofrZshH1Hu9bODGOLFZF3+lhyJqhAAFHXjNn8bKm
         jV3kZu4zXkMgVB2exfcTrvPI5BLhDbX9wobgGeSUA6fz0BYaCK7ld0X+iWJG++E773s+
         Byxz60SKYD8B8wR9eT5Kdfuuz1y3Ou91N11WhZTzKYk2rtZwLnpOzkih4jpHexR8PmVU
         MEIw==
X-Forwarded-Encrypted: i=1; AL+hErEoKG645pW3wWldk8PYwIBPIP7WyWRFqk1445KqiEXW2gdBnIXCzKqDCGjRWfWgeIdazueeKTm12aomquHb@vger.kernel.org
X-Gm-Message-State: APuU4Z+eGGAdSLoFqRp/s3GoXzZ1Shc4PmiiCI4r/lWXXhT9QE2WeX7T
	iYxEtLxHcRIArJFb/MbNpJKlM+gLhpL0AOgA636CYC9jbZmK7zLXr6s=
X-Gm-Gg: AZFdTZf4Xbh1HeIVCmT4FQq+S4T3QIJQQ/mIa3v7PzkrQ1p8/AOd9JuZItIQki/Ac2E
	Rk0TW0MUBQ8GgSc+CLt4cLA5KriSGPW8rQWGNW/JFdJImRJmRXrDECiJGLoL0AzhJUFJ5XWo8wh
	YcdkgA29LY2vNE4oOpB2WLT/xIyHvMN4K4nwOkNILl+JW6FJqMVHiffUsVNNreQVG3QFuIYZlqt
	bpUyuMYagoaJsdoB+ov7IRYX1SOGUqoYJktIgpu+e7wSr9WhTCrLZ9UzF7acYBShA17GgXl1zm3
	wKJh/4i78vj1dgApGdkgi6NfgQL9x9p6/XfisEUFaB/44dIZg8Tb1E9nED9ykbWIpyv8ja+LTJ6
	+/aBVvM1NMZFX1VDREUffxr8/djBBH6cu76A3amI1M4hxL5HUBzCqTlwnsVVTNRfqXyu49v5CJH
	LtebXCmju/I4p4VjiSbbULn4/1SZCTdg1Tns8xSxROE3R7OjmqmAmBboz1MwARj1JnMEF7SSitI
	aOgaqlUb6E7ZkEZdn7Nk/rBZClkpQ4xj+OZtLU0eMjblCbNBZpgEGzI4jLfURzOZO+YBBVl3QKs
	+xjqXaDX6J3CiCGdBtH0AcCRxPYhGM+tqGleefKMv1sbTmLMLLCzB/qRH1Oqokutgk/3mJkhNsG
	BFX4TmzmIRTJVOVu1CyxjYPD15IJPOih2j+cZxHTbYxs4zbmTYMm5j7l7BnA=
X-Received: by 2002:a05:6000:1789:b0:491:971a:c568 with SMTP id ffacd0b85a97d-4abb3861356mr43995162f8f.10.1795774473594;
        Fri, 27 Nov 2026 02:14:33 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:33 -0800 (PST)
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
Subject: [PATCH v2 08/10] drm/msm/dp: keep PHY initialized while plugged across link unprepare
Date: Fri, 27 Nov 2026 11:14:15 +0100
Message-Id: <20261127101417.24303-9-gianfranco.mariotti94@gmail.com>
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

When a DisplayPort output is disabled while a sink remains physically
plugged in (e.g. DPMS off or connector force-off),
msm_dp_display_unprepare() calls msm_dp_display_host_phy_exit() whenever
sink_count != 0, leaving the PHY uninitialized while dp->plugged and AUX
transfers remain enabled. Subsequent AUX transactions (from IRQ_HPD or
connector re-detection) then stall and time out with -ETIMEDOUT. For the
sink_count == 0 case, msm_dp_ctrl_reinit_phy() bypassed
msm_dp_ctrl_phy_reset(), triggering spurious DP_INTR_PLL_UNLOCKED AUX
interrupts.

Serialize msm_dp_display_unprepare() under dp->plugged_lock, replace the
sink_count split and now-unused msm_dp_ctrl_reinit_phy() with
msm_dp_display_host_phy_exit() followed by
msm_dp_display_host_phy_init() whenever dp->plugged is true, exit the
PHY in msm_dp_hpd_unplug_handle() whenever !power_on, and balance PHY
exit/init across system sleep in msm_dp_pm_runtime_suspend()/resume().

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 13 ------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 33 ++++++++++++++++-------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7201b7b513a3..1b2ab7db28cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2679,19 +2679,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	return ret;
 }
 
-void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
-{
-	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
-	/* aux channel down, reinit phy */
-	phy_exit(phy);
-	phy_init(phy);
-}
-
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b4..ea3a42e9b624 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -56,7 +56,6 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
-void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a48f42a17365..d3f4b5a9e723 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -483,8 +483,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (!dp->msm_dp_display.is_edp)
 		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
-	/* triggered by irq_hdp with sink_count = 0 */
-	if (dp->link->sink_count == 0)
+	if (!dp->msm_dp_display.power_on)
 		msm_dp_display_host_phy_exit(dp);
 
 	dp->link->has_sink_count = false;
@@ -1330,10 +1329,9 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 
 	disable_irq(dp->irq);
 
-	if (dp->msm_dp_display.is_edp) {
-		msm_dp_display_host_phy_exit(dp);
+	msm_dp_display_host_phy_exit(dp);
+	if (dp->msm_dp_display.is_edp)
 		msm_dp_aux_hpd_disable(dp->aux);
-	}
 	msm_dp_display_host_deinit(dp);
 
 	return 0;
@@ -1349,12 +1347,15 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 *
 	 * for DP, only host controller is enabled here.
 	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
-	 * PHY will be enabled at plugin handler later
+	 * PHY will be enabled at plugin handler later, or restored here
+	 * across system suspend if a sink is already plugged in
 	 */
 	msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
+	} else if (dp->plugged) {
+		msm_dp_display_host_phy_init(dp);
 	}
 
 	enable_irq(dp->irq);
@@ -1533,19 +1534,21 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+	scoped_guard(mutex, &dp->plugged_lock) {
+		/* dongle is still connected but sinks are disconnected */
+		if (dp->link->sink_count == 0 && dp->plugged)
+			msm_dp_link_psm_config(dp->link, &dp->panel->link_info,
+					       true);
 
-	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
-	if (dp->link->sink_count == 0)
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	else
+		/* Keep PHY initialized for AUX and IRQ_HPD while a sink remains plugged */
 		msm_dp_display_host_phy_exit(dp);
+		if (dp->plugged)
+			msm_dp_display_host_phy_init(dp);
 
-	msm_dp_display->power_on = false;
+		msm_dp_display->power_on = false;
+	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
-- 
2.25.1

