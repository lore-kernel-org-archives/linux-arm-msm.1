Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F4348898
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467607; cv=none; b=SIUCS+6KE0ROCklJKtGn2u00hDk2F97M+4f4ecysjKYKqArDfxr3lGmd94Q5l8omBl6xW5pTBWbDcJDDFCuwUOov6F2l3v9U8iqSISYiDALl9BDg/5t029zB2k/kbkxDyLYZwtLH1IcPiINYHEgZz3A1caDMgcjnZS5UU42eF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467607; c=relaxed/simple;
	bh=zbnnO5QqCp0aKW1u4NgpP6pgs62g6NaFKUTTPYSlujg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwz6IQ3P1oITjYGIRqsQw6nBI7brRmm7DdDT6jF/TY6OetvMmSEJrKJ9qb/41c+tOx7H+4mrVTFYns/YdlY49yELgEbNkYBJG08vS4pnODutCsS5v/0RE/x26fIXGHpNFPN/1/GiQZf48UUw5SGT5sHReV6W6UMnOt832z4L6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNriZ2+l; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNriZ2+l"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so5296535ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467605; x=1786072405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWKh2+oHygCqr6F5Ht9/yhyfhRUrXXYvySUt8Ac5ouA=;
        b=lNriZ2+l9/f3vFRCskbmVqkw0OzNAWE42BCJtJUkUEazseOQjkVHU3a8SJQZgJpCAe
         SYCfLEX8AbRpJQ6kjYzFaI5XEB8LcpB6HOAT5Z33dqruzMmE6nWSAq7o/SJfEPq9SAfd
         aWcvNHVBDVdDg7hM3IcUnK1/41Q19OER8xokEurEBTeI8DN4IK4dzulagFOR9d296zZl
         OEQrNMVkFnJmEkggg0nyieEWr9kVQIOQBEtjGYhGn6qnnh6hsXuVeuPIZJqdgTnSsf99
         5X20VmvJZY8eKVS5GHFFDeuMa5rRtsTFH5G8a1ddjTaQFYYyjXSU/V1Tb66xGw6W7lxa
         4AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467605; x=1786072405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWKh2+oHygCqr6F5Ht9/yhyfhRUrXXYvySUt8Ac5ouA=;
        b=rK3ohu2CN51C76u9+/vxH3mtosVURWjT42NovKdbaqSHkbJ1767sQN624rh3Pm6/pi
         Cz2uyIaRbQy3yduvvVXLrw5Y3UibPS8NcMfoRqgksNj/KAoXPR8okim+vfc5zHSC51Fb
         dNApQmFQdHv55Sbc7nrK4Qmyl6UgBU4V7TCcOQjL/euRcIKTmrpW7RabGZT/Lb2IAKlP
         xzC04EK5Lf6eC59+HKh/UzJjAm48kb5dW2gPeKaV9Na584sj2F70U79/R7rrAsoTsVha
         WWEkT/vxg9/gpHlShHi3G8ljp8yrYmQaU3KCDQ82NpV2IuQWk7tfrkeEWvnIZJpAtagE
         gvwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqj0IvbghVIes8PKe6j6S0al82o/uo/LjBYo+GJlOw7Uy/KWpKS883m+MU2jAa68bFfTFaHhRcxZli7TM0E@vger.kernel.org
X-Gm-Message-State: AOJu0YwEt3CV5aPDeuF038ftVaZvsbORBa5DNNZmJ94sasDQAcfyen8P
	3QiAnLvh2HokoBkvS9vg8gchx9kJEgtsMCigKFE+EBGz7pS1wf/F10yF
X-Gm-Gg: AR+sD11yTohbAfBkZTx5IbtIfxG3dwnZw2XhLKFyz0WvRt/ukpRUa545t5L0jebN5av
	VlWdIjEvj4Rx20CA2ogKXnDRc3oLhvCCaAq+0s5jffIo5Pe23cM7hTFPqQMVSSVDxGTeM/ms7bj
	Ld/3SLt5Kz5N2f9+z4T952hrm4L01QwuC6V6nBBvt+MWjwr5GpAWOGV7hk7elY3ia0tf3wpkWqh
	I8qEvg3y2TljZw6CAhcjkYdhBYhmJoa4EDTmh4bt4bsQl7rtBWGeeoTZCbwiroqqQQctQObIl7i
	c+I02WVqQdFZ2mWhesVWcBoLrb2O1Alc5XKL4V27Qu4mEAMGxvZZkwbinAtBrxfmHEM13und/3j
	/0OU7/1t43+k7reV67ht4nfAk1Zv+IPe9EA5tcDh4lKw6Zdgw1RW2/i9u9ZVrpcOa4p+ostEm50
	EQaOpjcityhFzJL3CPcNJqmwyhaavfmXph7DhrH6zsM1p5uRRq6tAKwO9SMtFSmt91QaTgcspb+
	bQS6ntAmvqLvVMkbxBg+ChzYL8JBBPrAeyhRkJnM4x8vCv0s0wIwLa2V8nhcPIt7HFyK001CGEN
	3az1
X-Received: by 2002:a17:903:2443:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d046d5331cmr5207485ad.9.1785467605379;
        Thu, 30 Jul 2026 20:13:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:24 -0700 (PDT)
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
Subject: [PATCH v3 24/26] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:46 +0700
Message-ID: <20260731030648.8706-25-phucduc.bui@gmail.com>
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

Changes in v3:
 - Add Reviewed-by tag from Richard Fitzgerald.

 sound/soc/codecs/wm9712.c | 5 ++---
 sound/soc/codecs/wm9713.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..3105b2e0556f 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -6,6 +6,7 @@
  * Author: Liam Girdwood <lrg@slimlogic.co.uk>
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mfd/wm97xx.h>
@@ -229,7 +230,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +252,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..3ba7ca3c1770 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -11,6 +11,7 @@
  *   o Support for DAPM
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mfd/wm97xx.h>
@@ -238,7 +239,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +261,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0

