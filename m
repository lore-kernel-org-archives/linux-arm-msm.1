Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3E35BDDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782533; cv=none; b=oZDpz02iepnjftgrhANGa0qrh+nB9AZyReUwwjEu58tLSINBRP5marHBBhCPO51huadGQwiqlCLNtp5t6k7VhpdOsMg3z5wrnZYP2K/RgTS9Z/pa7rMVidMkts/cTA0HSKPCKclC+wOFiQIFE6opXaEfyFDbHCu7UDNH4xK/gwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782533; c=relaxed/simple;
	bh=j5EzUp9GOmwEDgm+25/nvJ3ZrhLORshzsn3d8vYHp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=slBzuoEnrMnJ9BWZk/QShU3upyHP8DqGJyvancpFgeJ2I7LcFyhR/bw/47TOVwtva/D8kYYISBLa5bTyi21CzxzF6JA9VRMOd3jH9zJooQ143du7Y66IMCqHO73n9ekkgcAtYvwc1YrU/mVGE3C/O8i+O7Qa2WMN27MU+uaqAPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NV2yn7rb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NV2yn7rb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc73e322dbso2560365ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782516; x=1785387316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=NV2yn7rbiUIN0epKd6Lk9DuqQRi1oTAVqnk/+FWVOqvLqP9aXCiRR56E0eu5oPhOQs
         EKhu1NtP+Qtkmzl/xcZxjzxcjAdEFRE9WGtB6o4e5nvkCJyAx/Q+o0oZMKsZyDOsF6P2
         h3DRtbFh3R+Z/1CHkTIJjoEk9IKRBzQ8BZuXGxSLpDke1ayj8pfXzlwa0s5GfG9XVFuB
         fRTWdAzCyQ2y0fQJaU+QK2ntLNcLSs1ARXzJtSfyWIAMOPqxBgKJR8DCRvyUxntf3PhR
         gtG1msqO0G6dQo4AL5JjV/YYhk1VUSa1uns7qnZP0dY+MDd5TOS8kIkfO7aUJo5u9G4W
         u7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782516; x=1785387316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=OFUoN8GCRb/Px99pyo71PpXOaY2h3ftOflDhHYIbnUucvdq5FDEsHq+KKGy11Q2TWl
         +kYkg4ZeHW5Z450rkalYpGsTN2VO74AFL7NEpERvVs5nJK8hMDYawByi1pnHumx75tNq
         ogu9w300H2uljkFpVoR6QFdMCP7c5SphjExglr2LaFKXqib05TFqayoamyjYHtDHQa6E
         Mukgdq1uJw+KJcKSbqHdKZO9D+8BHUpWXgbn1HC2XFtHgQoU4kL3mg5owYErYtnO/v+Y
         oYrHPdoSbYoPo/rl6buK64g9qQP9lv7RZQ3ARGzIWzcwTyHw1geqFe0b+0Bb4H0pl4rO
         XtRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp09gdToU889hXybN3cQyRxaDmrzGxYkvwt0bo7VCXDwSINbQFt9JuOG+ngJS63XsIM5JItGEZ3kHZKqkEw@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNoRMtiImRMz6xMzOAGRZXJJZ7vgd7kRxRDHPtLRJeWONO5iD
	GmOMjdHYzQYHsKBC8T1hB1I45z/AYaMY0+ROWcxlZBq7a1yq5iH/RDsY
X-Gm-Gg: AR+sD10pRyYj3LUFJbO/XkiOKTDxaHzzOUVdJaKMmrDHx6cb+gkfdNzoAKNhfetSFXJ
	PFYer/5fKeWX6oWmHIZLkmZVa60+cebGYq3m0kvLOTyr2XvJZQ3BgZ2LVDoHlSN4K03epsnMmyL
	byErz6PJnYEQXW1mE3rmmfxtSNYjI2tuN4FNUzWc47FQn4KGC1hbOigRIUyJMBcBk7a1jc4BR+n
	CjnwcZl+p9RCf6pF/sO5Ddi5AC8fUKWOAKc9WmVe2ectv5IF8Pf8iwrW7y9H/NCsXQ9PoMjMh+D
	Gc1PIHwvFpvdyYNMXy2MCAktlBflRwl8Nhn8wJ2s0jV2YAIjjHVR2UpFwNgPFNYTXCpAFP72dtE
	5TnZuyKoYpQFxcldq1HPa07j5kXLHuuvKPyGENLhKn5THJA3BuBSu48urta27EMCibsXQVxLZct
	XF4Dq/X7Azpm5EEcNsWCdlJmbn6kfpGnEZKJTK
X-Received: by 2002:a17:903:ac6:b0:2cf:9f62:1dcd with SMTP id d9443c01a7336-2cfa6d83500mr22439685ad.32.1784782516322;
        Wed, 22 Jul 2026 21:55:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/26] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:13 +0700
Message-ID: <20260723045327.28260-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wcd934x.c | 42 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..11108c37648f 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,10 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1)
+			return 0;
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1325,10 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0)
+			return 0;
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2379,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2441,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2481,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2499,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2514,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD934X_MICB_VAL_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD934X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2550,9 +2539,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd934x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

