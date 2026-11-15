Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700824;
	b=lZur61lHq+4s59ewSUy2NJfnZ/TIIbtJ5bXpzaPvMxdPAI63Xtc5+M9oYbnVwkeBtf0R
	 dkBMT9cy6Oc9gkBJpRK/CsAfdCjQ2WGuJAB32s6XajvY3sTU6dYXxAvMdoyJVwW+NPUNJ
	 c/r/NgBCqXvBkITi9ecDGPGAnf4HhZsQIxwh+Ocr2q6GI1jRQN3Dlpp26gZlsaZYZqKRt
	 b/9DDQaORxaXBEJEKmfVDfX6TXIoW/soGUekIb3sqHrNF6T17Ejd2GPKopCy16lacONGX
	 5eeLktbFXKS/cI6qJFDa1Tmx5tKwnDNzgb51Rzy+g/CpEf9GW9oDT1csNkpifezgk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=47yra+ALozbc0fVpexoyxbUMKoA6BWbtB+u45dbkO3Y=;
	b=3v5FXoejDmg3KjY5j7w8jdOM9iob6ITRJfpMeLh9hJK+lYuAujBwuf0uKXR2YkWvkS+M
	 ghYLvG//v0/ysnDCjFCHGpSXRHrTkyo/oP7N8mwrmSm1xPEeto0t2QeEKN0kdD8ZbcJyq
	 XjRCSewzt/TOoYZSsc7dUCO8eqfZUTCbcF6lJS/8PI2gWttYrw3jroHDEkJhzuetkVkGd
	 h9BRJFoecBolTKvcqIMJchr5uEoNigICe6IkKb8P/CHFqdzJR8r5aulu/GKQYkhIlyt+T
	 hGCIIVrmovWiY5ExnCKxjVuDqFFjEF5TomwkjS64j0s0Uab772DaxqHldx4zaMhVpBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQyl8f22;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA91606A329
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 00:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA91606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQyl8f22
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ecd81cd67so32760636d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700823; x=1795305623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47yra+ALozbc0fVpexoyxbUMKoA6BWbtB+u45dbkO3Y=;
        b=PQyl8f22/c3gghnWE2LGTIohsdt76WYwo/5YSjvXwwSESCjFlxldyVhVcbxVmDMMoj
         ylqCa9z0BylOho52I2dMQ5Hy/AdSQFBSlDYih1vSq0W5/Z5OG2sqt4hDMPMtpuhUpf+N
         c51qT2hq1h7hI7JcDm9P9T0Cc40x+hprFp1G7QWwZSqLIJ0RcRNaQHlzq7W720oh3yVx
         j0fDAaCMNb85JTTy+BKirlQF5Y2ydIY0WK99PJ41qhDUmtPuEi1ReVcB1xWVUc4dxTgT
         bPULwS+YwypQo3idazwbRSDuhJeVZ2X3AAnKct5ZWODhdaAzkEd4wr+6DC/ziDWNgFeU
         jPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700823; x=1795305623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47yra+ALozbc0fVpexoyxbUMKoA6BWbtB+u45dbkO3Y=;
        b=fXeLCWipaqnWnXmlUz2hQ3Z/4OvTys2JRqpMBQDqnZ8MrlzOJNheGqHpcwFrRoxlvn
         Iz2RCqgOcwVrqaVAB6lJiGe7uJoKteFEX9zvJntYt+s4ujUJuLKoiPqI6XTSY309/FpZ
         n7JoZKEyoXGYSL5qs65ycFrlAAkXtVMOjL9Y0byUlkxm+6rgOzjocRnMP18aqDMStZBN
         QzuGsS+W23xvf0WtjUhJU0GbWoMk35lrLCWQnUWNSbblavgJofMVGDfKXEOpnYqAyQ7w
         UFDJHHTQ6XGtuYiieYmqNkBrFsV4Q+SOz3On7JPNVn9c9RX6i/dOa8iGVzPd7APKDA16
         kWmg==
X-Forwarded-Encrypted: i=1; AL+hErF1PTjncHsdtzzLZxOlm0JUezPDyYE0lmin0ctIXqpfuSdpo8DJ9ua0sKyOWZPvcXft+E39EZ7eccX8wTxD@vger.kernel.org
X-Gm-Message-State: APuU4Z+QEJXJXYKW0N34SVfEz0m2rVVJL0CYXVkUd2razacdOpDysxkB
	ANNDovPTsen3hmvI/JrBG22beqrgl35hKQ2ciQQ23eMIqG7VmXh6cKpB
X-Gm-Gg: AYBFou2JV4kNVimnc2s2+p1LPYMxQ59G/dpJv6X6lQJEvm+gGff/bNuNgHp8p3ESXIL
	zh9hxW3teC5W7NLZZqig968/PpezTgZxDvwDd+mizdzj4Ov6RBDCuD/FQ7OyDYfemSTYnp8BW2u
	3BU/5Yb780FeIdaMeJnvLIbOBhEI397JJdOF2tdkaDTVd/PnHwD9UaATsMWBmZEaDkCjFluD8AL
	NZv7gou5qdoMP+WQjUP/1LZI7M+P6UCHblY5YxIYvLIpZCcQqoGbCH6ccuAu926HiVkbNuHYKp9
	UbjM9izrjLls3SMHR741vvK4XAbfpkXnroWJtJ9Et52eOgY2aBEV03oSK3ujXkDRhvgNV7Ai9+q
	wxTyP6jEdU2w4upoAl+BDGyeklmZzvbMHpKOmFwh3fISdALguD7GQNCZEoLQR31fcO0d0ZXjsuy
	LAXSz5Vl7a0N9pjZJkcEKHebVdgpYtOHUbkdsSR1uR6lhS8HSpkfHtgL68n5iTiuRjl555Fr0gs
	8OIgHQ3et8RoUtn2Cpk2eNoWc6KP1KnJDGlQHrzk0Dhb+OdZNMbKKKEItjgxvo4kuyDdmGYkhQD
	1NAPVk1pR9vWgWWWQ+B0wv6uI6gmE2M03Q6a5ma4+JghVx2/N6whCk0Zgyjk+UXqqXJlMDhCIoq
	Tx315a2zUEtx27yqArLtTeD7F+LNt6Xt4r07+x0Uej07YqnZdytf/MSl5+3EIx6P94MDGnjRkEC
	Kyf7NUlljqJ9BQ+4W9zNhLIU8y8sbnl5mu3d3XSC1jRiaHJSavo38kcwldQBOLA/xgcO1PbHyCE
	QP9KMXgtc1FX/PCDbG10y+Fp97+v8znxWWPEuambxM5WA==
X-Received: by 2002:a05:6214:5284:b0:91e:a38a:74e with SMTP id 6a1803df08f44-91f241cd1f4mr112380336d6.28.1794700822815;
        Sat, 14 Nov 2026 16:00:22 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:2cba:4fbd:5596:d1cd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm52516536d6.21.2026.11.14.16.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 16:00:22 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: don't fall back to a link that can't carry the eDP mode
Date: Sat, 14 Nov 2026 19:00:21 -0500
Message-ID: <20261115000021.78869-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When channel equalisation fails after clock recovery succeeded,
msm_dp_ctrl_on_link() halves the lane count and trains again. Nothing
checks that the reduced link can still carry the current mode.

On the ASUS Zenbook A16, channel equalisation at 4 lanes x HBR2 fails
on some DPMS wakes. The 2-lane retry trains but can't carry the mode
(17.03 Gbps needed, 8.64 Gbps available), so the panel stays dark
while userspace sees the output as on.

For eDP, check the reduced link against the mode with the same
bandwidth check as msm_dp_display_mode_valid(), and retry at the
previous parameters when it falls short. External DisplayPort keeps
the existing fallback.

Tested with 100 DPMS off/on cycles before and after: channel
equalisation failed on 6-7% of wakes either way. Without this patch
each failure left the panel dark; with it, each one recovered on the
first retry at 4 lanes.

Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index abd3dcd..261645c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1587,6 +1587,16 @@ static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static bool msm_dp_ctrl_link_fits_mode(struct msm_dp_ctrl_private *ctrl,
+				       struct msm_dp_panel *panel,
+				       unsigned long pixel_rate)
+{
+	const struct msm_dp_link_info *params = &ctrl->link->link_params;
+
+	return (u64)pixel_rate * panel->msm_dp_mode.bpp <=
+	       (u64)params->num_lanes * params->rate * 8;
+}
+
 static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *panel)
 {
@@ -2383,6 +2393,9 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	struct msm_dp_ctrl_private *ctrl;
 	u32 rate;
 	int link_train_max_retries = 5;
+	bool is_edp = panel->connector &&
+		      panel->connector->connector_type == DRM_MODE_CONNECTOR_eDP;
+	struct msm_dp_link_info prev_params;
 	u32 const phy_cts_pixel_clk_khz = 148500;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	unsigned int training_step;
@@ -2420,6 +2433,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 		return rc;
 
 	while (--link_train_max_retries) {
+		prev_params = ctrl->link->link_params;
 		training_step = DP_TRAINING_NONE;
 		rc = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 		if (rc == 0) {
@@ -2472,6 +2486,18 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 		}
 
+		/*
+		 * An eDP panel has one fixed mode. A lower rate or lane count that
+		 * cannot carry it trains, but leaves the panel dark: retry at the
+		 * previous parameters instead.
+		 */
+		if (is_edp && !msm_dp_ctrl_link_fits_mode(ctrl, panel, pixel_rate)) {
+			ctrl->link->link_params = prev_params;
+			drm_dbg_dp(ctrl->drm_dev,
+				   "eDP mode needs rate=%d lanes=%d, retrying\n",
+				   prev_params.rate, prev_params.num_lanes);
+		}
+
 		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl, panel);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n", rc);
-- 
2.56.0

