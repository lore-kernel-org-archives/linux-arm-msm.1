Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813752;
	b=48wfoG3Rg2T/dqbWvTLxCg8UvahJoJiPCyPIvCwsP119N4BVdtBpBZsh5iG6AqSF44Jy
	 o9KVREJAHvCqTwMlvnc1Iu9km5oE4M9iONEXgJhNdxk5annPD8nY8OStQqP9bx8fZynrZ
	 qaCA8CrGGLLXtfvm424m1G/AWnedH+fH1Gi1CcKLGc1Y8xtdMQ/GpJqywADseGK44QUJW
	 e5tt3jx9vwxTH7Z51BTSzd/GuI2NIoVWxEqfTqIi83Og1rmT8g8F0SxqjR+lnb8Rnuk7S
	 O6Pf+EUKUPhCABeoG8p+UKT9Co97FhpS3uRsYcvRGLNfDlQE00/dzwdyKFcCBzrXA1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XIvy0mpNH25dJka9yiHVSc+lFF3CQmZ8/QH30h3M4Z8=;
	b=FHgb/8ik/5NHGJHYtuFfQfCjBRAW7UR/lZy6AsBJsjQoeHYlBKkXcEw4wapi2MlOmRny
	 JYx05HhH2LdYF1MoRBXJOFWrXonlpWSkVDcE/3RQjS+kRuASE5YY2PzwmmyvOeP9TzZ8G
	 Rc/YrzCEDCQlHs97u8DIXB3z4At28oLHI2R6vDwilPxFPPf+UZXksqawt8WGtPF+xj8lP
	 SjiymY42raDIF0K9aos0yhaRYRDQIJLLk0iij9jrlPJDIj+56f6VPHbi2bcIjYyf4K6YC
	 SS00BSaV5J+OdPzFkG0L9xZ/gCEA/p63ELExTP0+rTAxMwInPndoUCVSQ1KUkP3rnGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxCEb+7z;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E0606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 21:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxCEb+7z
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-921318b2eb8so103906526d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795813751; x=1796418551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIvy0mpNH25dJka9yiHVSc+lFF3CQmZ8/QH30h3M4Z8=;
        b=sxCEb+7zA+wFTPzdrar6GAaO3t7CBZTNjXIZfaB2FTtT5vTG997JcNdHGjN2KirZy/
         eqLILNLSuus1tGchZzG8TuV7IlqZeNA7LMxqICsaaiFAYlHISVzhBG0kVtAb7a7yszGI
         V+pcEFopGxbc1bIc83BxedgG2fe49+YS7PHmIyge52rb0W16DDtO7wB0LMeAXgVIt/ra
         ImHbZfvAbvMi3sZs4FVS8/nL/5o7zTBigtOnF59wGdKzD1MwSii9ZvcTU2caWHWxeY5O
         Pd5PAUCbf8JDUEg2tqfjdF84qf4ksqT1yyYSqpErHWwsYUHD8HT1KCGlMpwqZBhiZEul
         /RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795813751; x=1796418551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIvy0mpNH25dJka9yiHVSc+lFF3CQmZ8/QH30h3M4Z8=;
        b=M37NEnFKzCTMTMEPxV3bJZw03jWXLfCIuB75QvhOXss3+KVgT4OoJr0QJAZe6Cau+8
         w8xpWnIJUlM9maDoIckdM/U99OjOuUcQvua1aDq2q2PHCmmQmMOoqFi1WgtcUcLUQcBO
         FYVLlWc5ltFmKLSY8oomM2Sv2k7jJjGyUhCuHQU2wrvy/PTOpCn6kOx/inwwPdJT8LsJ
         tXlaVPHrzL0A+I9gFW5s/9NHc3n6GAWPuhP4FJPZApLzCX0H3IeCfSShZBZuHRPNZ0Q0
         3eOhYLprEg9ygW/i5kkTrpTCVxF3SPWkdtAHST+wHOtm9kg7w1e0vp4U2LY/mJinyMwo
         AEOQ==
X-Forwarded-Encrypted: i=1; AL+hErHgIObImlzBoCLM5y4PygxD/oc7gvCqbWCY6FnHpnP8kAilCSZLoqii2ru+gjBMF6ybnPC5JyKlBYE6DovD@vger.kernel.org
X-Gm-Message-State: APuU4Z9SD05dfYiIm2fCbsCF4WCgAGKPzoEASYyS6vQdY50enOHKC9Jh
	/306ejfW9qHKLNTWp6RmnUXTo0bTSiaXd9sWkTVqPpYkq3Nk27EX8/rb7yXzsOL872iZVAal
X-Gm-Gg: AZFdTZfmdvDSe/XUizjvU2NSZ8nzlIoL7+P8AHnIakAHKaiKTuwJGQTB2YfuT5MziYx
	oxTnz6wLrFkP0noFARvasMR08gC420matwZ2E70He9e3+hb3YZY12iahdAohbSCsbC2Sk/yYbgq
	Vy/M6uRUrxcZ12ySV3KVreLVuLvQ/LujwlmIjrPWPGsKqOBk65rBJc762XnIyluIzCu8SbRD8Qi
	dFuexsPbQJLY5bhzHiDwejNvkF3RD24wR0/HZGP2RI5vFCCdaMsohtv9DQQh7sJSqFPMZZRgQhb
	lql+9hiMFTJChfDGC/a8JqaUCOi8shBouT6kHcT4gpCs6dufDbmN55t/iTZ51f0p/PT/P8bd4gn
	zWcJhPNAtmMbHYhtw6dMXs2JgNOuFWKkW8s6rLdQrLfnG+hrtFTrzdCtbh9F1pfacOTDNNvTZ42
	qtrd3mEwdJwe0xc7yauNjHA6Lw9ecuBlf1lc2Hr2tJ2hiRYy+s0601UcSBigvcsLcUN6v7qYVia
	R35b/SwCDRCi0RTMw7UtIkhW+kmEhNNSRQcAvnuICmr3vZyfOUXin2IyiMk9beFhE3FynoOFLUr
	TRSDKpv7KL9m/0niH8QaZYahcCsJoWvuGVNaGiKX/eC1ENlih/CJI7l98V8+msWGjIyeglUMzNx
	p9tM/YPDmFCBmPqPPaQbWmE8TTrnfN8Hy4dn2Np9t65IKgBX7cVYs1lW5borWH8v7icCIX/ukLH
	s9FpO0dMBmrXU7IQ7DCmeIvU1BKIUiEYKjdY/T0Pgk3DNCsWvNTAElnsuATVO84XCmfdxcIg4wy
	ShK+PhpqV1/ChHjSxQllIGFKov5bXgnQCvJb+fxCubJNQ==
X-Received: by 2002:a05:622a:a10:b0:55d:17e:f87 with SMTP id d75a77b69052e-55d769374d6mr471770991cf.1.1795813739524;
        Fri, 27 Nov 2026 13:08:59 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5046:1a00:2403:c7fc:983f:c934])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm219584681cf.13.2026.11.27.13.08.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 13:08:58 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jesse Casco <jesse.casco@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: link Glymur layer mixers 4-7 to DSPPs 4-7
Date: Fri, 27 Nov 2026 16:08:57 -0500
Message-ID: <20261127210857.65336-1-jesse.casco@gmail.com>
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

The Glymur DPU catalog defines eight DSPP blocks (DSPP_0..DSPP_7), but
only LM_0..LM_3 set .dspp. When a CRTC requests a DSPP per mixer (e.g.
for a CTM or gamma LUT), any third display assigned to LM_4..LM_7 fails
resource reservation:

  LM_4, invalid DSPP_-1
  failed to reserve hw resources: -119

Set .dspp = DSPP_4..DSPP_7 on LM_4..LM_7 to match the declared DSPP
blocks. Tested on an ASUS Zenbook A16 (UX3607OA) with eDP, HDMI, and
USB-C DP active simultaneously.

Fixes: e2aeb8deddae ("drm/msm/dpu: Add support for Glymur")
Cc: stable@vger.kernel.org
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 4eb4a0e..280df25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -175,6 +175,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
+		.dspp = DSPP_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
@@ -182,6 +183,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
+		.dspp = DSPP_5,
 	}, {
 		.name = "lm_6", .id = LM_6,
 		.base = 0x4a000, .len = 0x400,
@@ -189,6 +191,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_7,
 		.pingpong = PINGPONG_6,
+		.dspp = DSPP_6,
 	}, {
 		.name = "lm_7", .id = LM_7,
 		.base = 0x4b000, .len = 0x400,
@@ -196,6 +199,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_6,
 		.pingpong = PINGPONG_7,
+		.dspp = DSPP_7,
 	},
 };
 
-- 
2.56.0

