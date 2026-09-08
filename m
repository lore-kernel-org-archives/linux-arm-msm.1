Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC144CA292
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858132; cv=none; b=NAk63kqKftsmuJ63bYizi05S8/GCDsYwK/P3XnWed83s6lVnqaRxc+iVyapA7lijnlNTe+axlado7MtW0X96yAZ8MLGCkwHux49vf7ZR7owB8irpHuFgJZ3l0GclO+3DartV9yF2wbp/s464ojBpzCqPEKOOR9VjEgO1NSy3dLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858132; c=relaxed/simple;
	bh=9HwuH4m8jFHitsvmYeOUs7UnVKGbl0r8XxDeU3CdbXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYWYm+RBdbwhMr3yLeYkZdPQt3tOuFXLcM4cmvvI4SzeXl58T4qIJ7OaIP6tR67NKh0F0WJt2L+8AbX7nKL4uU2NuoXqQdGnRictZ1kwrwr3u22QPw7u6570LButzUGYSp+xoN6q0LrfY45jLuSoaqpnp01s9cQORXdWDrjtGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hViuhLa3; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hViuhLa3"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b8ef7de4bdso1111329eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858128; x=1789462928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yQQXf0ptX+tS4ybVpXcfW4E0EqwJo75cLYXDPk6+nY=;
        b=hViuhLa3vneB0zbEXlxGV/5p16u8ezTmAws1UOGYgA01q84kUjKJmYJ+9Tw6xP81TV
         K2yIctapJDNw9ZSoC8boUA/u6CQP5hLWZqor2u1Enwbn61QiM05hCDDrxDX4BnUSRtpH
         HnsQ7EkCvgkFS0Bhz2LMgYqUoT/0BeuUcFZ2sdGugUsOrBCW7dlVjZzumwbgJDl3AagI
         BukTAo51iBfbfzpk/XFR3oghbiWt+TUi37v/dd4VIg1L/28/qrGnH6Qiws5oIyNS2E8+
         b0d8CQ8Sn78AFk5CjN+w+fVRjIiR6N2uUCDj/sKPMOtsb0CHb9sk+cG8Rk0lBoyGQKpL
         O4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858128; x=1789462928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yQQXf0ptX+tS4ybVpXcfW4E0EqwJo75cLYXDPk6+nY=;
        b=DsZ8QNMWMDU0fHfaiH/XFRy3+xwrWAFPPywFlRu+2thXMbVFDQdJqXQlXv+2K5JtvO
         SH1psP/nvx6hnSOeMqwyv1/eb+N3rwMigoBnCB978Oxmdj3zYKmo0dCzCeYUK7yJSVWK
         8qy35lemnTC8HquYYHPu2k+YMl/P2RLzKi9IRpj9YGYbyx+vsjM86NKZhHVc/4TSw0J/
         geBm1qaG0zCVSXxnZiDvUUk1M5Jf9xcaQ2gD3UqBdYAc4gJf140ZfQ+TcNizFYvH25wW
         9qhSdu1cb1WIMtSTJhdsGsctZb7kQZbMre+yqAx/9JzzZmy1XQXn7kpUUYBGz/YTKC1l
         aFBA==
X-Forwarded-Encrypted: i=1; AKwUvBxI/XYMWtKETbRV3ZmKq+jQAWKKne9k8PzBM3NdqNTy0J7DXB6Fs3tVoV4uQ5KEPtclh07ho3yQ98KVaE1q@vger.kernel.org
X-Gm-Message-State: AFuF++n3N/xwR8yvUV2ZTS0trCztF0zQfIgNBQo7dHFjn0bhh5ZElmKC
	kLIhzh2q3RTFuq5WW+0XKoWeQv8XEgpmk/rtPLvXimlPoymaPl2Mm/K/
X-Gm-Gg: AYBFou0/S6I8QQCOwp9xkCPPQHO/znZwaY3vNt9fERmn3YhGcOYyBNmwA6+6qL8Dd/0
	Glb2e8LW+Mb5U7ruOaAefUeoMfB6DAex0BvLC+qpUXZL7yy6w/p9nYN6bS0rZvi2pboN2PWRRcG
	QmmiC61ZVMG3f9K8J/Z4TFvAecClZNfzBvO7cvIopYb6CoVg30L9n/KiGS72wrEsj2U/izCk09q
	LFpydvFYhmSy9RTeqpfnJZs7TWAkp54bhfzMKxYKF01GdTxTLnFM1RgYAw5QlljcWnJwoeQ5sZw
	vtEqBOItLRj/iD7TKE3GhO1pGWb1+6HSNuxWZg2G6yqadmI2JdaelKmiqhscrJWPh6i0fFglFnH
	83ghX8BPE2rA7PQfIRIR/2SnqOKqL4Et0J5nr1hB33pFT0x1COW9Muge+vOUb/QICRoJUa78EQq
	Gtzqueq1LdDpGEhdU53MNgfXdxBZ0RHjIpcNJkSB8OpHOgh/khp9KFGLVwuoBvsM0GyZGFZgCBu
	qKfqeXGTdoHaWbTDxpGEH5Cd6qWohwDpcv08MFMcdri
X-Received: by 2002:a05:6820:1890:b0:6b1:464d:4d1d with SMTP id 006d021491bc7-6b6fb8d25aemr15032941eaf.11.1788858127679;
        Tue, 08 Sep 2026 02:02:07 -0700 (PDT)
Received: from flyingfox.tail3d542a.ts.net ([2402:a00:163:2ce9:6c87:7904:21fa:8675])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm33641223eec.22.2026.09.08.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:02:07 -0700 (PDT)
From: 092vk <vk092kumar@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	092vk <vk092kumar@gmail.com>
Subject: [PATCH] drm/msm/dp: don't gate eDP on DP_SINK_COUNT
Date: Tue,  8 Sep 2026 14:31:46 +0530
Message-ID: <20260908090146.3100787-1-vk092kumar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_dp_display_prepare_link(), msm_dp_display_disable(), and
msm_dp_hpd_unplug_handle() all treat dp->link->sink_count == 0 as
"nothing is connected", and in msm_dp_display_prepare_link() this
causes probe/enable to fail outright with -ENOTCONN.

This is correct for external DisplayPort, where a compliant sink is
required to report a valid DP_SINK_COUNT over the AUX channel. It is
not correct for eDP: some eDP sinks -- particularly fixed-format
eDP-to-HDMI bridge chips with no downstream AUX-capable panel
behind them -- never populate DP_SINK_COUNT with a nonzero value,
even while otherwise participating normally in DPCD capability
exchange and link training.

drm_dp_read_sink_count_cap() already accounts for this by excluding
eDP connectors from the sink-count requirement for other DPCD-derived
checks (msm_dp_bridge_detect() takes care). Apply the same exemption
to the raw sink_count reads in this file via a small shared
helper, so eDP outputs with a non-AUX-capable downstream sink are
not treated as permanently disconnected.

Tested on a Qualcomm QCS6490-based board driving a fixed-format
eDP-to-HDMI bridge IC (chrontel,ch7218a) with no negotiable
DPCD-capable panel behind it; without this fix,
msm_dp_display_prepare_link() unconditionally returns -ENOTCONN
and the display never comes up.

Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")

Signed-off-by: 092vk <vk092kumar@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..9254f080f0ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -400,6 +400,12 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	return 0;
 }
 
+static inline bool msm_dp_link_no_sink(struct msm_dp_display_private *dp)
+{
+	/* eDP sinks are not required to report a valid sink count */
+	return !dp->msm_dp_display.is_edp && dp->link->sink_count == 0;
+}
+
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	int ret;
@@ -467,7 +473,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
 	/* triggered by irq_hdp with sink_count = 0 */
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		msm_dp_display_host_phy_exit(dp);
 
 	/*
@@ -634,7 +640,7 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		return -ENOTCONN;
 
 	if (!msm_dp_display->power_on) {
@@ -723,12 +729,12 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
 	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, msm_dp_panel);
 
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	else
-- 
2.55.0

