Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9559F3905F8
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946445; cv=none; b=Nmr3tMUFRPE7KEvTwvLQs1C+2AFm4Em/jq4LOKYXts37S3S3BAdpieBRlfEk/AkdjZ25+2wHW59PEe2lnouF0MYYY4VKnSjqgoVfDKqu9A/CzEd8kPI3CWVFDtbLuKaT5kQi5esnDfcGnPtg/gcv3YxZofTXJw+7KxT9IR3y9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946445; c=relaxed/simple;
	bh=SpKFHk+D0BgRJfODuxvSj94MeZt7ZsF6tl3nf4TKAmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilFe7q969vXwxAbck2cyDiw/Z8TwdAaR2tI0us0/vkZYQV/qJtoYegMgeksMKaAsrIDM5uNCQovzV05xi1X4YZ3NY0bKfJUfZ85kZBR1CG4JfZyUDvLh35FyqFh1KgK5Nd7RES54EZZOgk05h/rbtpni0mEqhSQjtA3PKOiMd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXgMb8hl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXgMb8hl"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so60375725ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946437; x=1791551237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZx5nLRdpWK5z7yKqeHvCYGSh31itlWKNzYPXNN5hIA=;
        b=iXgMb8hlWJ62vMzAo4a5ZlrQ/CYLnp+/LSFqaYapswzmVfe1pKZVaJTTMJEE/THb+w
         w4nFNuOa0fWHtuNbGehGxjW7ci53lgpOD8kbSKWaIRP1Gof0etHPklPTyiSX7Q25av26
         3SuV1ZdS1+QysMxvOhLhM86oYsjrBeOCgJefm5y5LHYQscO0v0MeDWNPqTw6IAO9VrnZ
         /3RUkL38uLgvOX0s/LHdeWbsKG/mv4nCYbUX/loHDODSP3Z47f8jzJJRNYd4dYlNQTvi
         Nhe4/M4XlRjMUaLVnObt3HPPO9JqGFACeUWbnxQYcTz6/oeIqfsPML0s0W/GYAlpw9gr
         /D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946437; x=1791551237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZx5nLRdpWK5z7yKqeHvCYGSh31itlWKNzYPXNN5hIA=;
        b=TF63KcUnWphvUVPgFCuCT338xHBnf8HyMMZxjhTLSRXH8dFVfH/tFpVvFbgoz2Sb7E
         GbJFKFCrMuiTo7EnBl06zeRl5tqtu2xg+t7i21UBY2opt1ySJXJS3WM/mYEJp1PxhiIh
         hOxnieOi92r5wHM5D4W6+MYd9hY92YjepTDP6Rceo1tXXf1TxtfHNR9HP+Yq3PsxfiWB
         h2QFnnXCiEoIRantrzXykQ7DxKYQsKhQNi5Nyc9xkZvXlzFhf2nfPt1Ds0jXl9F+Z675
         AHKql3vGXS3aueYAU9KVe70+5YpNX3mVn3S8YyxX867uWaTuT1WcYbfGzq9JEPBCgY0s
         g40A==
X-Forwarded-Encrypted: i=1; AKwUvBxLraYcYIVMm7peW4H0wpN/T98BTIcGOP8SBdkWtvGM0VQPOKDLcs4SRWdMRlEFW+2yqU/Vo46yeArkb/GW@vger.kernel.org
X-Gm-Message-State: AFq9FYIKJpDq2UvkES1BorWu81S7uQ1LUoErLPJYyuTMDzI04MUUeZMX
	yMiolUtAZM4czlDmoYjrxL9ZUaGZD9XsoZLsIX8J6AdNMLOrXfoGoEeE7qbuXvlR5wc=
X-Gm-Gg: AYBFou0czyx0owsDWrKdhyEPP7ADHK1YVL5jeePycAAAiaB0+IUQbtgZskVmSmAj0IZ
	DIvYUo8RcOGJvgKKuggwvFDiYpfvzyFMbQ6HulpcHA98aNbKay3jXWsbqbvjnamq5Mg489kxR7i
	DO9IRGMiXE4ieoSE1pJvacM+D9ZLLrt0gKahcORI6RBiZMYCBb7VEgkhCAkPbaFdu7C2cRaxGa4
	FHA9HPpNFtu2qU35NPAns5lMOZk6FgaTStCPQnssF2q5RM6FhCtkcnNgAGdlCb4ePEMSkchLYvV
	YL4f0VBwUI6i7AZ3Brijzd00/Lc0XjOiqE4frNx/x2ek1J7L5+BeX0XgdzBbm0GjOuCACpTlLl8
	rfE063IIB5hRZwdLfgruAOigqWYPMpAtlSxa8XFd4e+feUa/TcJ9ooqmjNM+39DossnsKzasLFH
	Q6+g1wSNC1dDIrf+XsEGnheU/4b5WvG+L8YPXSJrROdmgqy51O03Uq98MEj0thBAmqnpBBeuw3C
	yIQvxhu/0Bo9w==
X-Received: by 2002:a17:903:230a:b0:2dd:c100:a5d7 with SMTP id d9443c01a7336-2e49b655fdemr22787685ad.43.1790946436498;
        Fri, 02 Oct 2026 06:07:16 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6f650fsm7481065ad.58.2026.10.02.06.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:07:15 -0700 (PDT)
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
	Joonhoe Kim <26rote@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] drm/msm/dpu: disable the slave encoder before the master
Date: Fri,  2 Oct 2026 22:07:12 +0900
Message-ID: <20261002130712.50612-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_encoder_virt_atomic_disable() disables the physical encoders in
phys_encs[] order, i.e. the master first. With a split display (two
interfaces on one CTL, e.g. bonded DSI) the master's
dpu_encoder_helper_phys_cleanup() then resets the shared CTL while the
slave's timing engine is still running, and the source pipe is left
stalled half-way through the slave's next frame.

A power collapse of the MDSS core GDSC clears the stall, so it normally
goes unnoticed. When MDSS stays powered across the disable (a full
modeset, or an active DP controller), the next enable scans out
nothing: black screen with the backlight on.

Disable the slave before the master, as atomic_enable() enables them in
that order. The slave's cleanup still resets the CTL while the master is
running, but the last reset, from the master's cleanup, now happens with
both timing engines stopped.

Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850, bonded DSI video-mode
panel) with MDSS kept active:

  echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control

DPMS off/on: black 10/10 before, picture 10/10 after. Full modesets were
not retested with this version. Only tested on this device.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v3:
- Disable the slave before the master instead of stopping the slave
  timing engines in a helper; drop the comment. Subject updated. [Dmitry]
- Link to v2: https://lore.kernel.org/all/20260929174819.3855-1-26rote@gmail.com/

Changes in v2:
- Stop only the slave interfaces up front. Subject updated. [sashiko-bot]
- Link to v1: https://lore.kernel.org/all/20260929130621.943-1-26rote@gmail.com/

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..0a6be69a3e83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1386,7 +1386,6 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_state = NULL;
-	int i = 0;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
@@ -1412,12 +1411,11 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+	if (dpu_enc->cur_slave && dpu_enc->cur_slave->ops.disable)
+		dpu_enc->cur_slave->ops.disable(dpu_enc->cur_slave);
 
-		if (phys->ops.disable)
-			phys->ops.disable(phys);
-	}
+	if (dpu_enc->cur_master && dpu_enc->cur_master->ops.disable)
+		dpu_enc->cur_master->ops.disable(dpu_enc->cur_master);
 
 
 	/* after phys waits for frame-done, should be no more frames pending */

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

