Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB154E80A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687192; cv=none; b=avHewcOUggZf7rlYy22cEbTeYk1osZ+z82S833eKndehuaplZ7y+HG584KEgn12ZJTxUDULkADFcPHpCPUoSVeRP+cd22onalsMCql9/vq4RqPryLoNea0cWfG/Yye2FDfPrfyb1q3mg8okDrYwa1Qu5MNU9zCMXd6UkEBPV3KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687192; c=relaxed/simple;
	bh=v/r/9WpqeziGia67i7jHFrfYe6j8QVnAAEzTUyaYUzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLMcMZQSplqWtLSNbdo9vYiQ84G4ek8HwzoICl6STgpqeENAtBo9iFWdY6TWfRuajbABhFESX3WmFZGlKA4NHFbyMghFNOYHjkH8NH4aO1XUv95fVRFTmL0vmXWZTferlH9ppK9896DbZNe0TDDU8kXSB6ePJtrCYQ1Tc64dtmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD3y1Rn3; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD3y1Rn3"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1323324a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687185; x=1791291985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jE/aJ2E98iI2S/CWQodcOrB8SsgSTcF+14ugT3aOH8=;
        b=nD3y1Rn3Gbmj5a0MY6ZSHrTnorLshm+tql1EbWEDRPVFQdVy0WUbcI69RJRKsCbtlx
         DImlNRjcu77QiP5bCFDLFn61L81RfRF77GQlxCsOfCISLRSQxH4BWUXPUXLo+CLfdRJS
         oGtR4u8xZYb13HWK2lxGKHVFiC5OfiuJ0sLlSQYBnmBKXpNF2ccRtQrPqpTDQdfenmre
         BZ3LKTvZK+YIBJ1OApDgCII4nGqKDWGzC3cohZIkK8d5SnJZ12Ll+pVQI3r6I6tCY7lL
         ZYvVQK42EvrHYzXufzJ+gGmDxqLhOiAeiPF6H1oqBN2pcv7eoQmGjdRpS8K3Ypjfef9X
         +nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687185; x=1791291985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jE/aJ2E98iI2S/CWQodcOrB8SsgSTcF+14ugT3aOH8=;
        b=FidV5bYJ/iUEvEajykYSpMGYbka4+somfTMaIsHL0vFd4D+0/XipF1Z1ASYjF8Zbd4
         sU0wFy53CZitLYKrifKpSjO79nfeg/RLry9/00vvZEGAR5DHtnmfmXFWjE6ExK7uXBT1
         CDj++VNdG8w6uSDagvHBfoF8oU+ZqvUgUhr1F0QD9BTzK9i/B07RWLN95ITZlfZDbKTc
         Th+kHhJc0OumTzrmpENNNkVH2yL/Gx/2sB93TY/I2K2a1rSeuObn/1E4BPadx9cR8Fn/
         InFfCO64EzuFBLhNoDYifhwcIyeO6ObsSgCAfJlxbX6/HxPaUGDVZkMmxAI21bO4lyax
         r+Ig==
X-Forwarded-Encrypted: i=1; AKwUvBx/DH0uqLwBLGFki+ELRHRq1VOK14CqzxblEjNEE+qWFTw/rc18GKzZo6lSKWCMWmU21s49x55vzczynYn3@vger.kernel.org
X-Gm-Message-State: AFq9FYIzFh/T8HlAC/UeCpuxCenvoywJfwqlTU6BBrQXk6VowM4jVmgU
	UudLfE9aSArsjToN8WIFc7+SZPKwLUtVwpNPW/HyX0+GpTAlGUztQ+ce
X-Gm-Gg: AYBFou1SUDHvqaEKpf6kF+Y4pSSJTiHzDIP8OIb65s6EPgP9S6bL+UWZumKD8dAE4OL
	xi/PsXWMj9E9DM/j7zPV6zU1Qb1hcpxCfQIrAtzzjwwN76mmJO0/gCunGJMbunuWmmkMuYarBGL
	RJLMj3SQZ7wA75Wz7JbpoN88rYznymms3c8M5t4Yt5tqbOMuBAFlLZT6ftmapQ+bpUZE5eiRNSe
	vcJehdAAkrX2QsVNBBC7T0SN4WcQsA45zPP5rrYky2YvOv6IulfGLrXaymoXl/nXUiKo+84Qi1y
	8zUUnnRVFpqRKEOfBUGEnRNhGLTrMW7Vl+IqhqG2oXywfUQLZJcdIhDkZSrq0An2H5G4qtLmvoh
	QUKr/ekiYW+nLrWoPUDVu6ZFYYxYBDwbWkdcdihtURGecju7qDnvikPV+iyTMnTaXUwtUU8iHgb
	MFjseN0DA7Xab9i2q2oKS+jMnHLUGt2x4fY52I922Zam0SCCsmRSRXaUN2OuZ/vXRo8+OKp1gK8
	Xxjewxukkpil3Q=
X-Received: by 2002:a17:90a:d883:b0:3a0:4146:295b with SMTP id 98e67ed59e1d1-3a0987255a0mr10559170a91.17.1790687185233;
        Tue, 29 Sep 2026 06:06:25 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858555csm6107928a91.5.2026.09.29.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:06:24 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
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
	linux-kernel@vger.kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Subject: [PATCH] drm/msm/dpu: stop all video interfaces before cleaning up a split encoder
Date: Tue, 29 Sep 2026 22:06:21 +0900
Message-ID: <20260929130621.943-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_encoder_virt_atomic_disable() disables the physical encoders one by
one. For a video-mode master, dpu_encoder_phys_vid_disable() stops its
timing engine, waits for the frame to finish and then runs
dpu_encoder_helper_phys_cleanup(), which resets the CTL. With a split
display (two interfaces driven from one CTL, e.g. bonded DSI) that CTL
is shared with the slave, whose timing engine is still running at that
point: the source pipe starts fetching the slave's next frame and is
left stalled half-way through it (on SM8850, SSPP_CMN_STATUS 0x10030
with the fetch and unpack counters frozen, where an idle pipe shows
0x10003).

The stall is cleared by a power collapse of the MDSS core GDSC, which
normally happens between a disable and the next enable, so it goes
unnoticed. When MDSS stays powered across the disable -- a full modeset
within one commit, or another runtime-active user of MDSS such as the
DP controller -- the next enable of the bonded DSI panel scans out
nothing: the DPU keeps committing frames, the layer mixers produce no
output (CRC 0), and the panel shows black with the backlight on. A CTL
reset at enable does not clear it.

Stop the timing engine of every video interface of the encoder before
any of them is cleaned up. The master's existing wait for the frame to
complete then covers both halves.

Seen on a Lenovo Legion Tab Y700 gen 5 (TB323FU, SM8850) with a bonded
DSI video-mode panel (CSOT PP8807HB1-1). It reproduces without any
external display by keeping MDSS runtime-active:

  echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control

then DPMS off and on from the compositor: black 3/3 before this change.
Every full modeset (e.g. a refresh rate change) went black the same way.
With this change: DPMS off/on 13/13 and full modesets 4/4 show the
picture, and an attached DP display is unaffected. Only tested on this
device.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Saim Shujah's "drm/msm/dpu: clear pending flush state before physical cleanup"
(https://lore.kernel.org/all/20260826182459.1506522-1-saimzst@gmail.com/)
alone does not help here: still black 3/3 with only that change.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..a14156408126 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1380,6 +1380,35 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
+/*
+ * Stop the timing engine of every video-mode interface of the encoder before
+ * any of them is cleaned up. With a split display (two interfaces on one CTL,
+ * e.g. bonded DSI) the master's cleanup resets the shared CTL while the
+ * slave's timing engine would still be running; the source pipes then start
+ * fetching the slave's next frame and stall half-way through it. The stall
+ * survives until the MDSS core GDSC is power-collapsed, so when something else
+ * keeps MDSS powered (an active DP controller) the next enable scans out
+ * nothing.
+ */
+static void dpu_encoder_stop_video_timing(struct dpu_encoder_virt *dpu_enc)
+{
+	unsigned long lock_flags;
+	int i;
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->intf_mode != INTF_MODE_VIDEO || !phys->hw_intf ||
+		    !phys->hw_intf->ops.enable_timing ||
+		    phys->enable_state == DPU_ENC_DISABLED)
+			continue;
+
+		spin_lock_irqsave(phys->enc_spinlock, lock_flags);
+		phys->hw_intf->ops.enable_timing(phys->hw_intf, 0);
+		spin_unlock_irqrestore(phys->enc_spinlock, lock_flags);
+	}
+}
+
 static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 					struct drm_atomic_commit *state)
 {
@@ -1412,6 +1441,9 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
+	if (dpu_enc->num_phys_encs > 1)
+		dpu_encoder_stop_video_timing(dpu_enc);
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

