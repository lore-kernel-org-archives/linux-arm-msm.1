Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469956;
	b=aFLqP27gfG8qU8nRlJKRj/ZWI2VGeZOAY+C6z6rCWuYqfCAi2EBXbXW5Pqz2ZJ3ZYSUr
	 GnbRy8CNCD6buM3rq+4c6NZzl6yhqEVluFsQ+BY+1FXJQQwgplBm6tUCshECDdXfecxc1
	 6nPvSMIlUMhttvP8iqlzL5ePFH06L4JYjE61DFZHX8P8S9xce2iWzx91WQqpc3pBMbK4E
	 me//6XVVlidRgoZ4svGVKtkuVH9ZrVQWN6EH3AmU+VuZW4Ve/4WL8x5qU6G6ypjYZ7ooU
	 mbgghTsTJUOUZFBKCICD8y19tPwpv6E2mM71P6YnbtC7AnwBaxonvP9z/E1VpGhCKbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zR8Eij2FPJgIUhxryQ5YRxF7TN8W0EpDXclL86k6m10=;
	b=BoE07i5Lyq6vdyOWAoVOBDaxSLxs+IgM60a2BVPeFCnXQH8NBgAEI9esEdwYndVhw2oR
	 cl3NKQ48V8hm4GQsAIsW7ZNl9Sgj09at/B/OOA6vs+EklERNYV0xwTIR6KGJT0klMarGl
	 plNfHQ/YOLXdHAB6fq3xn+QLHTV7bVStWcgvrSLX39N1ZYJq80NVbi7LeT13m9zaXlvz2
	 qf2Z+2YNjBkDlWk0HB/n0g4eo/3GpStFLfdYfCH99IapXHUxU06hAr66VhKMunDQqQCSy
	 decdOKB8ELH5S0BuMtNQbHi1vVrlOGBxh+5i/p/DN84KvIsDFxPyZiJt35vWXTufj7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wllTw1FJ;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3320606A8A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3320606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wllTw1FJ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b904d10882so1787089b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469955; x=1795074755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zR8Eij2FPJgIUhxryQ5YRxF7TN8W0EpDXclL86k6m10=;
        b=wllTw1FJSefjRxI8dVg3xqjiIbINMTysvEHAsLVpjmtTDs0Vk4sHhe/4viz5kZQIm9
         o7kZ0MHndEa9Y/HNeMXly4ImlsThnxmhqHOZjlcMp/OZ7MeJYzekTB8wpi6ZOOFLBR9a
         4ozlncFErpROdBjQHwRKXmUNAQ9tHUA2mublHQ8uhlAVwsEADvH8rAR3z1u23rhKcTOJ
         Ca1rOyvzjiHcBe/nC1BJj3DhOHZPUUEU3a51iRoUquNY9cdBbqvA7LJnqrHAPv800FaW
         D7drMUD6KYb1Mmaj4H0iiux6CzmIErw9WhZl3yM/8wjcDDXyeTKdWGoRKRLR0yrx7LK4
         KwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469955; x=1795074755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zR8Eij2FPJgIUhxryQ5YRxF7TN8W0EpDXclL86k6m10=;
        b=rBC5okM7ULhyV1G5fnuYHwajO3w2SFRpvNTveS8zf7aMjwiWz5aWueUPyI9+KHUqxj
         uqC/RI4bchUdo687wxlE9YWirAKK83tdyfFgT5cMchdz9c9VCUd3TEHQB7QQegybUYQd
         YovJBI79sC/P4lXDeV4f8vqQ0SmsjEPu5kMKk+eXe2m3744KgAvRX4Jj1VieWgE/0D8X
         huXuzFz4vXfxi1O9QdBz/sajGkypzZBDW0KnpOOH6cX9dryOINh47TsRbCe5ydTjIDBN
         C6xQ/SVqHDS7TmIM1BwBzfyQC12qPbCof2Q8Tymup9FcGMQiJlsXkYggKGy34j+VE16I
         VrTQ==
X-Gm-Message-State: APuU4Z+Fl/KY8tXr5Ev+x2xJZd/4vSTwm181dVCNOo4GbCAJQAHkphr0
	EqRFbVV90PuYgGJuAv9evR/tV19ucJQ88vRyxHlJQImDxprN+ty42X+kZGRs7tBAP9I=
X-Gm-Gg: AYBFou1MBM5ruSU4gRCMpg1QQSZ8bxF1agzc2J4ygKn+61h0paQPMwMlTPWEsaiBVd8
	Q4lN6PJlDEvHDM5gfBcmqorgU1bpZFD235kFm2QnRMiY38nBSUMV09TKQdwZ4pjwPPZuesH/OOY
	ocaeiWkiy7lzxMw2lo8Tdpk9BL26TLph6fvbN70R9dczaOxHqScqQpOv1bDUY46ToJwFflz5Ptv
	hb1Zsn6K5Sx3Rd/6cn0KNH5z+ykQnNJfudolP+5Yt0ugalHTWbtP9SaEULdMJPcZ6MbkXSz30s9
	G0lyAHmeT8Wuw26Bo6M1/tW6ZWCTppu4VbJOweKQncQWOYeubGOOtiij7OoL7+ItoFNywvhT09q
	hTevgzcevLhbMg6NGBf18Ic+rue2w4oo5g/bFcUCmbfN4dsMHdJ+sWgRv95JAeY14230WBbmv8t
	wE1pueY5qmrzVJbHOITs9W5sHq9oe4tIO0byCjeaW3L8uKFtVYgdQIG+prFkvuBOcod4OZ8cytO
	aMJ0QYHg95mvaYzZfQ3lWPPLrIlk1LZSi8OfsC/Fjw6yDHrH3CFK+n2WnwxDriCUIZxNvpk+FfQ
	xQ91LGySh8j6Svoukp/4ArvcpllROA==
X-Received: by 2002:a05:6a00:2343:b0:8a0:3336:4b45 with SMTP id d2e1a72fcca58-8bc1c594810mr5000583b3a.12.1794469955132;
        Wed, 11 Nov 2026 23:52:35 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:34 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:05 +0800
Subject: [PATCH 4/8] drm/msm/dpu: expand CWB to 4 pipes
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-cwb-upstream-v1-4-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=3075;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=4/WCCF14ztFcYuwH5sdlLJ/Y7c6CkeQnN0+bpY4resY=;
 b=nyBY/lFPmt026D4jaKbY3LdrTEesIm0s11kGJMZMD+33M+x3eBjnEEOkuqbVPgMHoBAu76oXa
 DrBwZvYJAoCA6o82V6wAXorre2C0gYxNXBja5PIX5ldV+gQZX1gnuoZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Only 2 CWB is supported in topology currently. Expand to 4 CWB
with dedicated CWB counter to support quad-pipe use case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 7 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      | 1 +
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 09563a766390..7ac2cdbce8de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1423,7 +1423,6 @@ static struct msm_display_topology dpu_crtc_get_topology(
 
 	if (topology.num_intf == 2) {
 		if (dpu_use_virtual_planes && caps->has_3d_merge &&
-		    !topology.cwb_enabled &&
 		    (mode->hdisplay > 2 * caps->max_mixer_width ||
 		     mode_rate > 2 * dpu_kms->perf.max_core_clk_rate))
 			topology.num_lm = 4;
@@ -1443,6 +1442,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	if (dsc)
 		topology.num_dsc = topology.num_lm;
 
+	if (topology.cwb_enabled)
+		topology.num_cwb = topology.num_lm;
+
 	if (crtc_state->ctm || crtc_state->gamma_lut)
 		topology.num_dspp = topology.num_lm;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d455845ba14b..11eae4b19684 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,7 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 4
-#define MAX_CWB_PER_ENC 2
+#define MAX_CWB_PER_ENC MAX_CHANNELS_PER_ENC
 
 #define IDLE_SHORT_TIMEOUT	1
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4ada16cf8610..9519cc59e9f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -240,12 +240,17 @@ static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
 						 uint32_t crtc_id,
 						 struct msm_display_topology *topology)
 {
-	int num_cwb_mux = topology->num_lm, cwb_mux_count = 0;
+	int num_cwb_mux = topology->num_cwb, cwb_mux_count = 0;
 	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
 	int cwb_pp_idx[MAX_BLOCKS];
 	int cwb_mux_idx[MAX_BLOCKS];
 	int cwb_mux_idx_start = 0;
 
+	if (!topology->num_cwb) {
+		DPU_ERROR("invalid number of cwb: %d\n", topology->num_cwb);
+		return -EINVAL;
+	}
+
 	/*
 	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
 	 * mixer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ccd64404f12d..9b2ea51608de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -62,6 +62,7 @@ struct msm_display_topology {
 	u32 num_intf;
 	u32 num_dspp;
 	u32 num_dsc;
+	u32 num_cwb;
 	int num_cdm;
 	bool cwb_enabled;
 };

-- 
2.53.0

