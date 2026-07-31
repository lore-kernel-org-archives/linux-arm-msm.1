Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050D347532
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467558; cv=none; b=OG3GdVgMKrqQTpmNbKRRaXLUTZkNpmT7fkwOb4q+HjldvN2DN6PTzjN9i9lLBtIgiDJLBxWwDf+uXbWmEiWDFE6aAWA/vJDVwqPNGE701WV4ObFCsDXDVnMH7cE7zN/x8+dLYknBEHgrt4iqz+lSsa37HkXXom3o7TBBlLHvJ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467558; c=relaxed/simple;
	bh=iRXXCZxrE/NfaVCW0B9rAvlZiNnFDl2G4nevY9sv9JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U64K9sr1MB1jifirvaFFpNeHj57wv6uxKmsxkQwXwX8wFzylMZj5Xsm5ssqDVM0vor5nsnpIvsDAwqqIuzIg1l+L7/DQWt21AV7lRWe51NcboUcHJxUqr7k0wxjRiMEpgWdFWpx1dIAdCWvBVk/momCqDvZpwMzROsVYl5IcW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruTDHO7w; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruTDHO7w"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d0407aedd6so4898885ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467556; x=1786072356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcxaRvc2VCXz2/SODLczo6EC2fQ4JjRfnm42T/RdtZs=;
        b=ruTDHO7wLPlt86Df6myuYEoLdmeqtscazohUzZPZgBqdn1yq7bKZ9hP5nqTTR+WwKE
         0UhNkLO315lJp3j1raSH2wA0KiRP6UeaHWq6GdNi0kkCoADNE1OhUBwh29Mo+vXIAElV
         365hg/u9/JQ/kHK8Y2qoR2OAT/Y69Nrq+5MIQFREUFirivnHKx8ZyM8fjAgUkopgeFZG
         WpiJBQ2l0qEHiWGlQHaZ+W7ys4JztCYNlG4YpiDZdbJy5Ytqx/zpsrSFylxml+XeVMQh
         hIF6Nw1+2Eh7R5uZKkt0vOOR2qopDaj1WUbHHF71sHtJX4tJopp52SneP2wGLbuLHlsF
         Ehtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467556; x=1786072356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcxaRvc2VCXz2/SODLczo6EC2fQ4JjRfnm42T/RdtZs=;
        b=DeMWGtC9hmtQaP3fKn+l0Gt268NASiUOu+xjycwbJeFpqMywMutx+GtSv/Jy5V04pR
         0loYz2PCqGeK0ufbNgRGTF3Jm1UXXiWDApTx3oSUeDgCz7gNvj2PMZQTuvLoluHiz1Fc
         Ro0fugxFnQfBTbhMvvgHuM2ndGvTptwmAjtuvqQ4jNu3rEOTe8wCqXpkKRZNVHN3Fno7
         /q9AVbtuD6s2V+GhJAqyr8+2m8vypc8Eef/l4QWxzw+lNdj4nJun1Zr3x6nkOUba4Hv1
         B858Sgtb1g9aqdnasS5HlGbxbxRERHymj44MelogiUJ0bjzneGngybaBj1/SWd/yuMLz
         EwCg==
X-Forwarded-Encrypted: i=1; AHgh+Rod+iJ+TBC6fqn+LUfonpiLdJD/VlaKJq+tfgH6in5wL+G9CUPZI1JioAYteLwkKF4fdXypy082yDXZoXPz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxps4Eg8vUGH8xfae6p4KWvkDrLXS0h9C15DGFKlgF1IzLacYjL
	dzeyD7skL+nEQXF0M/+OXBxt5D4E/Y2N18Wezy+CaZ5cZcHI0xLoEz3w
X-Gm-Gg: AR+sD13LSwvKkosP+aRliyIX2zg4zqGlnoljz3NA7A8TIkXDSrOsYfoCaGyv7sjpirC
	qZrfR2wNjkTzzoaCmNrP7oS+AX7vVF0QB8I8sLssLMQE5ut5vqjHn14Tp/ug+80/yeG9UlKe1yo
	3LAIo1d5LPWaCAP9Cmgxu3HwkkFxT83/4TaiVIlJouV5bgpYTWsA7KHPW5dKY+2cX9CgSrgOrEu
	3Ca0KAqYpwoaChWijGndwh1Dp1uy6fX+pdp+gcHft1RD0F1w3ZAyHfZE0AAT1B8IGfj0GD0pmyH
	oNQ61fXAb4LTkTH0QsI5LCanH+Mq7IAI9ZqwAFwMl3Ee9/EWySApT0DlYO1a+kTFWjAM94HSTol
	jycbieOyzWArSOnGEC7+5hv0/RjRfkxfxsG2ccm4bsebQpEAQseM34UYyhfIzflgKlUJxY6h5yi
	Wen2M3av6Q3N3ueZBY7v5WroNzy3zeRO2XZdBzfun2pkOcz/cSGRA9dPNd2ejxLlWCRHbUwHxxm
	p5LuJSwYsUYRBWVaCzZj8ydn9YYFtgtixnO04xIAOv9doSiccZgIBhQE3OT6UcAfMNDtDFuIv01
	Yzry
X-Received: by 2002:a17:903:38d0:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d046e7de3bmr4701915ad.23.1785467556364;
        Thu, 30 Jul 2026 20:12:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 19/26] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:41 +0700
Message-ID: <20260731030648.8706-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8731.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ce87280d590d 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -10,6 +10,7 @@
  * Based on wm8753.c by Liam Girdwood
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -110,22 +111,20 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
 		wm8731_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
-	return ret;
+	return 0;
 }
 
 static const DECLARE_TLV_DB_SCALE(in_tlv, -3450, 150, 0);
-- 
2.43.0

