Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A113955F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782479; cv=none; b=HU1wrMjsNUS+tYA9bS0xuXWDkhDCMxmRWxd2MMtJjvWPX95vRoOZTmP0wFckE3pq6Goq/g7o7+jrtHnOD+aPMpzr47G1URtXXIPPe1UnOfkltRJ2nBEGSR07jm3FKP38odeeWpFUCA9WWtUp4r+GZ8eBsXDpXGeG+tFA+cQjkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782479; c=relaxed/simple;
	bh=jJta1wP6Gxka/gvOOEwLo5cIEFpwWGZWGRX7SMxpNTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXF4l885rmv1b43KCMi8PJcRhwG/J9ERqdefCUsM/hKahTgwgKQpj6PUcoury9b/fUFKYNrsWdU1Ut+Hy5CYR1jcJLlgtVvMQGOfZc9+hcfLFGcLwYPdtGsR56t9wh7vrUf7nr5TV0gIZFYUSMxfkhQWOdpVWhXNVreUTRbUK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXL7602S; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXL7602S"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cab973140bso3019275ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782470; x=1785387270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=lXL7602StTcqlCMOIO+t8C+pB8OKPkJ4SyYxBZZ6vgyHfcwpD1k+GPj6T/Qj8YAQzu
         H3t+DKTdP5Vd7aHHPJ3msyyui7FLlq+2DbKEkMKqSSDTFBzfxCkRCzKa9Y7Q1IkGl0PU
         J5BboR/YjV6Lc37T0RWaJmi2V3oUIQwbOgNt2xbx7Ody0rw1qxsapKQsN//rgz46PCnu
         EYbSl+V+vhDS9CFowy9MRdIoADtnrCj1eEGv9/58BUVhh7PaSo3U1C1BOeUeiC6I2+9x
         tzZIpg1n8N/NQsixyVFmDbapaYefH2cMLqNGHC/cwHIMTH9fdf0HLI7aDbe4uqkZ3x7R
         rB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782470; x=1785387270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=TRWy5ZdHLqrQC0/1qacGTbDboOwuv9+kFyD6sNZLmiAXFOLegXPOb81OB2SrRtYgdZ
         mPgeow3gYam72sjvZPDZ65d2zRnGl03aJo01SEE3fYnPhmdmJiwg1kgkYHSDbcPsCDSl
         1995foyJGjN14ySc8lVpvxjhoHbsArztpNwW8eV29mTwU+PV/USzu1LxxTUrqmC3DABV
         /K20lblcySIV5v3nOUGwjpj6gqY470SeGED4hWOmYqwym6IcPEpgenBz3BQBYVV+C5Mc
         3U7EagQnwfoONG+Gs/3L19dosQjLmm3CU8X81ZWdc2D/4YRJb0xocycbg8QbuwgmrVmU
         r19A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0id8jo1JvV7PrNOxEoZjieaw1C99ktPLrJa1xCQq2Kp6myBwz8md2yXwAeY8CzMNpzbk6nmd/AxK2SlKP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoiq2sLNahJGxUWWqNGXYL8NZcMwySpDclVjW9Ku0roPSPo+br
	+7RMuTwg1T4E6/QI5FwyFE5AybMzRMR3XkN8qXkl5KMQUcIjpckNd2wc
X-Gm-Gg: AR+sD12L0F/EuzlLlwMptfFYsydE+U2o0OCwm1SsbSgVFXBhZZ3HK0hVS5SeISlX3yQ
	xmn6TXHTRZ8+GeZ0qg2QaWxWZUqzA2FwXyg/mGEApQECIWOEd7Hf4ip/LgVmlg5M0zV/xaw0Es6
	xxRSpiXDPm3YWQxN/hZwNEb6R0rMDTIKDXq1mEz0U6DAP/+Fn6PEXC2dYQXfnmaxFhd2YtzDFK7
	Bg/yy1d/kp9UDT4wCl35QbDdE4B0TC2oQQfnqQT37K745lOAX+8oHdZ2oizLKCH50wCqk4ltdVg
	varT5njbvrxnxra09JHnHnPofRI7ke8OdUhXbtBq0nXZvtfPcqeNnWlOBJMyicgZDofpwiySNbZ
	I1FhNg9Unnu30XRIN6PYml2lyzS0QEdhsHiZn7XWcw2XEod8mCEoirOA+3mxyessJ3viDYYR/j9
	FDhtznF2emuwg44f85JHHwn68zR8oo9M6Hesiy
X-Received: by 2002:a17:902:ecc4:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cfa6b7dbbemr19302125ad.15.1784782469929;
        Wed, 22 Jul 2026 21:54:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:29 -0700 (PDT)
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
Subject: [PATCH 06/26] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:07 +0700
Message-ID: <20260723045327.28260-7-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas5805m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f76e04b403b5 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -12,6 +12,7 @@
 //
 // It has been simplified a little and reworked for the 5.x ALSA SoC API.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -230,10 +231,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -249,13 +249,12 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
-	int ret = 0;
 
 	if (!(volume_is_valid(ucontrol->value.integer.value[0]) &&
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -265,11 +264,10 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m->is_powered);
 		if (tas5805m->is_powered)
 			tas5805m_refresh(tas5805m);
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_kcontrol_new tas5805m_snd_controls[] = {
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0

