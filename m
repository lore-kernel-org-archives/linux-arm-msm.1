Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABFA3D47BD
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338867; cv=none; b=BliLGqh1Xg5UFFrCVmAI7UNq//70H4qoUw4pHN9ul3e+Wiw/8eLTsB/gpXF4rhds57e+M5x9TkbZ1yGU6NpZsEDWBqB0PakoRl65QudK4u1z6VljDv9HkDxE30aZTGfmr5Nq/ne9a/60JVFbUlghHoyxdcZtMuRDVVy2/uTfYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338867; c=relaxed/simple;
	bh=VkNqCMQf2laMxPbMrsn38WXX0pnz5C0GAvqOQ8BKu9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=orqAVdkURxt302kfu96s+rm6lF12t6oVuIDkHyiCarWwpdJYqubTKmmbp5Qvy/IQ2wWBM/OQVEb4h8jVsE9v1Y1mbS/j/c0azBAX5cQ038tVS6AFr294qlHKdSjm0tjJweAhpRBJkBHzOGT4ysV0T6Xb3R3YjgDyTY7R6wkvGIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC7pw3R7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC7pw3R7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e73611928so14085465e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338864; x=1792943664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6lmJQMv+mPBi4ABudf7h40tJlxRiHiqMX1K/I29AXw=;
        b=PC7pw3R7+BGnqXT4HAc1uMVxkj25l3POwPfTbFy7a2bU8/0PDjGiuIYC3Q5fl7Zm1Y
         45kEKITiFb/KpMDbnqe3rPZPwcjtUHkhujAGXnSCHNmj412M1lcKGLWvORYLGWV6rGFc
         g7E6LkkvLJjSE3Auq7JWgzAO8E6iQ4mYBeixlFHpxDAQLvtXa3DYwOsqPc6QQVKc5J2e
         WBz19/jC4LaAZDJ/mHUFwpAi4ptAxhb5bGNTEKcdyF+TMnrCSiRCXK7hqIpitV0M79a7
         +0xNTutPnfvoJCF52Z17PPUtKBI3Mig4Xc4c7g+xP41XfpqpZJYmPDQgm1wEsstxIzfy
         +VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338864; x=1792943664;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6lmJQMv+mPBi4ABudf7h40tJlxRiHiqMX1K/I29AXw=;
        b=0WC14hxA0i2+zs8RZA2ZFQW7RsoVEUimWk9Yz3i4gKRoXOFwlQARZKhIbfMUt2idpW
         L6pHa550+ma3t+44ertBBo4FJXq130yhb3FtlcF3Q3p8TW03Uzc3W5QzqiAtUiJRQKuG
         eLvDwJ3I/a+FAIyRnGGnncdwNTQCYQi+4QskuOBhRZUyIuy7qzoCPsABhyuB8xWC26/1
         rQlY85P2bBPZhgo8NOfnWL04GGl21t6i9WAwRGp9jEGWFHiEDuYg7F/+z3YFFIVVy/M1
         lDrJSf06i3314tmTXpwspCC1Akjt5NvwL9pXEHeE1etB7r7FqBhlI0NB19IlzJ6pxXog
         a+hw==
X-Gm-Message-State: AFq9FYJ4YTV3WQTOod4NSNn7jNpAtj9jbBH6lRgZj3z1J2abESLUFTxI
	+SMTWwvCvplzQFyh40p4ApccKoU5Aec0wYPctSWDrd4ARXQgHgtgzUwRZjG3baNKgt8=
X-Gm-Gg: AYBFou3k+A8FSmKQhUKTrYu8AtbrM8GiNkn3F7H5StCz9F8uIf1d+qO++kHETNv4J7t
	SHDNYitHIKG75PWEzA8p012NzMY0edO1Alb3Se9hb8QCTP4YOrHkJzXdc0/ucrPnC+mimUzEOXL
	KZyUhW0w9qIrwCwTF/qYUFQWRqYQ5YWGtNSAWyImWgT9AYZjpUSTWUu7PwQXlBpjrVw+SMb2Pfb
	lrkzK+cFA6UwGneaSCIntFTEcOUeZcTzExp6SfMysRNao2GxUlHY9Fwrm9AqZhzmOm1q2Q7Kvy1
	iJScBAxAk9FFnhJuGxzhK+jIcVFghtZMaImVNlvfcXDoEGsUAMBEhgHYq2nGwf2NFzzHYS7uq1i
	1gZz2HL+RkgdjgS/4IlLt/4F5yFQ5otudeYOSWbQ1Ya75l4V4GFE7X5NJ5vLZI7H8swE2xVxzZ0
	kZX/OnwPtZSgScfNu4CrB28i89/vYTf/HM98966jw2FfIprlWgBXYw/LZkAzu6b+TLNYcFboTG4
	CHZlTVO6OG9BKZ5rsBAX9r9SlnNRJsbTIGPJlH/yBYBVCGZva3BVtPzyPZ04lvl2CXtom+QFExL
	T7HR5XGtnI7QfxDYANdWpw==
X-Received: by 2002:a05:600d:6413:20b0:4a1:d899:b62f with SMTP id 5b1f17b1804b1-4a1d899b7f0mr67874735e9.0.1792338864358;
        Sun, 18 Oct 2026 08:54:24 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc8ee409sm183420235e9.13.2026.10.18.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:54:24 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: keep vblank enabled when entering self refresh
Date: Sun, 18 Oct 2026 15:54:23 +0000
Message-ID: <20261018155423.1299629-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the CRTC is disabled to enter self refresh, dpu_crtc_disable() only
checks old_crtc_state->self_refresh_active, which covers leaving self
refresh, and calls drm_crtc_vblank_off() otherwise. The atomic helper
then expects vblank to remain enabled for a self refresh "disable" and
warns:

  driver disabled vblank in self-refresh
  WARNING: drivers/gpu/drm/drm_atomic_helper.c:1296 at
  drm_atomic_helper_commit_crtc_disable+0x1c0/0x1f8 [drm_kms_helper]

Skip drm_crtc_vblank_off() when the new state enters self refresh, as
other drivers supporting self refresh do. drm_crtc_vblank_on() in the
enable path is safe either way, it only drops the reference taken by
drm_crtc_vblank_off().

Seen at every boot on a Microsoft Surface Pro 11 (X1E80100, Samsung OLED
eDP panel) with eDP PSR enabled; with this change the warning is gone and
self refresh keeps working.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
---
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1212,8 +1212,13 @@
 		return;
 	}
 
-	/* Disable/save vblank irq handling */
-	drm_crtc_vblank_off(crtc);
+	/*
+	 * Disable/save vblank irq handling, unless we are entering self
+	 * refresh: the DRM core expects vblank to stay enabled then and
+	 * warns ("driver disabled vblank in self-refresh") otherwise.
+	 */
+	if (!crtc->state->self_refresh_active)
+		drm_crtc_vblank_off(crtc);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev,
 				  old_crtc_state->encoder_mask) {
