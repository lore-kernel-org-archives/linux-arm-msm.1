Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BA641E6B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704110; cv=none; b=b6+iGh9SZnW+17/MRClMLrv6LONRnpA1yVxE6jcRfWxTOIt6F9XtBaOA5wkPnioXF6qw1zyf8Z0pwABZpf9f0ouimhpVMj/UiR7xG87DxaZxabWstjDhTFqW80uwBJqAF3ZgZW3hJu8sxgjgZigIP9x5gARgecvibzPkpbARFOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704110; c=relaxed/simple;
	bh=uR8ekqWRXUtRaP4QtX1Vd70Nt3QeGHN6adw3HVFXrxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9lw9NJHnjEE4qgzQ7xTx5M0ljB1RYZeAqZ0cAI8DXx1hbFOt/yIh6bKyK3ixB6UQjRbMXaKnKz4uQaysB8MDy7AotgpKAYQCa0+QwxegZkDzQeCF+Gj/vBncCD9eNBcc0QJXFT6JGYB27DYTx/sMd1UAqFQWidds4F99X/GCB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg6O5Gyq; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg6O5Gyq"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3024312a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790704108; x=1791308908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nvWs5p8QQYBvyiXC8JLMISKpo/nNaLJDjqczyA+R4E=;
        b=cg6O5GyqDOVrfbOsxY7yLWiCGA3OjyZHVyxuxrI6H8alMyYnJNQJRRFTvZTvh6+RiF
         dLqLgRSZ4K7eqGvxkh0sp/vhAVMVFvvajyrRI6KCDsHkoklHHFhhieG713G8rlh2p5aE
         xEDtwYc4dh9npIjkFRXeo5jGwstQXrvts0uLeEjm2zV95eHifVr5FxZ+MabPiYJiAeut
         0q2Qsa5ihLhCWGkVqoudoIZ1zcBoFoj2w1C4ztFNLfriWiK3i7M0h1gZRZNk7kmdKOOI
         aMjCTshweX0WgGTc6qzcLaNNYvUlbeyHMWnj307j1pswqtbNNG5rBjlahp7/wLmA//6x
         4/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704108; x=1791308908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nvWs5p8QQYBvyiXC8JLMISKpo/nNaLJDjqczyA+R4E=;
        b=w7tqcLLWbb65J87M6xM4A4roxWWmnRZEoE8qVymQBdEWwrg8kR0uXlUSnPUcqAaW3I
         IIxoRC1qbZMxjlWEtKZ5XMyhzECid2d80Ufnazvz/5ov69xKw6JARdHhAZtWR1zhMluC
         +Q5ofyPChYsD5x64RkELneXIwY0Aq+XvEghEMGMCIHnlKRQ+I2FYyXtVy1m7f1vrb3NE
         KuMMNLSJnilf+jXAckTnum6OcdRFj/xTunh8QSLAKgRtUF7SiQXvQKL11l4AVj+RcfN0
         CpBFSjsEDQXYFgC4QBm5r9s/3vJWQp6omMjtPBaypVp9alGD+pz2ecsfctOL82mGoEHh
         XPUw==
X-Forwarded-Encrypted: i=1; AKwUvByv+FNdnWZGtrCUyYYNHbGRCtK9GrZNfwc29J3lf0+AV1GmHSztKlvUOGESct3Wvnt7SZgIhm+RPM1pjfEL@vger.kernel.org
X-Gm-Message-State: AFq9FYJnICb9VxQgwsDQgfRXGR+/oZaGgddKjXalvXA1tuh6ji9ax/8/
	RTVqGVRgXhu3O90D/L0ssms2mTzfKaks2aJ85v5VprGK0uk+p5yhrZcV
X-Gm-Gg: AYBFou0cf4I5TBxtra7qpxSdsj/OPk9zPicyRhwA8ROusSBWSzUt5borSdK9XQvGH1k
	SmJRgP7vQJ2GpJsTuULIQBBPk2Y1EnQkmwe/ITwK/efKASirQRQ785E+JuSVDao/ImdbWTL5S2H
	wjKQ/yTBJU2Ve5xR3/Ym7zLLzMkHz4UOWPQdK2UN87y+Et+64ZYslxiaC9pJbNucZ4vBjqGKGv3
	J5RpnHBFRxeXlcfA4RHYqOQFe8Q9uyjSOKoXdbuSLwfKoWgMZcNYUSMaoHAIj0HPEL3sGLYnY2O
	JD0NlJKGc63L8ynpaka688YdTf7zAU5nEM6uFSLzk5pVpCYNhyf/0d+YsmCSoRnHFQ5AM1xv4om
	4gYutG8qvo0in/tAtnMNcnQGzCJ3ACun/AGf4FIEEujsFvOGWupLLmggy820Bz4KTof9ZZxAOkP
	ED8HYflyGHpKcGfNMFcsbCYvC7ZQvS79SwQsVtghG6RCZ4ZfAbAaEwAT/dyYZZXCaWXIVHFIDoF
	pfgneC0yPjnBw==
X-Received: by 2002:a17:90b:568b:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3a4c001cfd1mr86892a91.67.1790704108417;
        Tue, 29 Sep 2026 10:48:28 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4bf9e3b8asm230794a91.7.2026.09.29.10.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:48:27 -0700 (PDT)
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
Subject: [PATCH v2] drm/msm/dpu: stop the slave video interfaces before disabling a split encoder
Date: Wed, 30 Sep 2026 02:48:19 +0900
Message-ID: <20260929174819.3855-1-26rote@gmail.com>
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

Stop the timing engines of the slave interfaces before the master is
disabled. The master keeps stopping its own timing engine in
dpu_encoder_phys_vid_disable(), which counts the final vsync before it
waits for it, and its cleanup then finds the slaves idle.

Seen on a Lenovo Legion Tab Y700 gen 5 (TB323FU, SM8850) with a bonded
DSI video-mode panel (CSOT PP8807HB1-1). It reproduces without any
external display by keeping MDSS runtime-active:

  echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control

then DPMS off and on from the compositor: black 3/3 before this change.
Every full modeset (e.g. a refresh rate change) went black the same way.
With this change: DPMS off/on 15/15 show the picture, with no "wait
disable failed" timeouts. Only tested on this device.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v2:
- Stop only the slave interfaces up front and leave the master to
  dpu_encoder_phys_vid_disable(), which counts the final vsync before it
  stops the timing engine and waits for it; v1 stopped the master too,
  so that vsync could arrive before it was counted and the wait could
  time out (Sashiko review). Subject updated to match.
- Link to v1: https://lore.kernel.org/all/20260929130621.943-1-26rote@gmail.com/

Saim Shujah's "drm/msm/dpu: clear pending flush state before physical cleanup"
(https://lore.kernel.org/all/20260826182459.1506522-1-saimzst@gmail.com/)
alone does not help here: still black 3/3 with only that change.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..2f8b6204c93e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1380,6 +1380,36 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
+/*
+ * Stop the timing engines of the slave video interfaces of a split display
+ * (two interfaces on one CTL, e.g. bonded DSI) before the master is disabled.
+ * The master's cleanup resets the shared CTL; with a slave timing engine still
+ * running, the source pipes start fetching the slave's next frame and stall
+ * half-way through it. The stall survives until the MDSS core GDSC is
+ * power-collapsed, so when MDSS stays powered the next enable scans out
+ * nothing. The master itself is stopped by its own disable path, which counts
+ * the final vsync it waits for.
+ */
+static void dpu_encoder_stop_slave_timing(struct dpu_encoder_virt *dpu_enc)
+{
+	unsigned long lock_flags;
+	int i;
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->split_role != ENC_ROLE_SLAVE ||
+		    phys->intf_mode != INTF_MODE_VIDEO || !phys->hw_intf ||
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
@@ -1412,6 +1442,9 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
+	if (dpu_enc->num_phys_encs > 1)
+		dpu_encoder_stop_slave_timing(dpu_enc);
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

