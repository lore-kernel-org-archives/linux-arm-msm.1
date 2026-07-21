Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27684C77A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629764; cv=none; b=Or1TuSC2s2ncwqYi8PrueAEUBstu6JP1oypOtajQl07n8TwTpvYcUCkoxIAiIKw56+ApxTiyLp36EvCTmpbYsvnAtC6xXauFCuIoKVlBaM4ouA916LM5X/of9+Y3P2m+uRemc+Vq95yy6rfwEj0rIq4l92+cyhpf4o51rUkow+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629764; c=relaxed/simple;
	bh=aakMWPqtzSC8d4xUEjViRQdNYsjBJ/WN5Zv10mvjTN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/jCk7cqDZfhGbrVDG6kNjTql8rBVtOEHOUux+RbGyj9YK4zrzfIOUxMo3x52A1Vtt2dyRwFNU45ATyGULLtJq0c2PjvzaPPavy1GSzuZmmrzsoDNZEkKMgkAFbLpxmBOELGzee9lN8Pr0UYXZCIoc80GOG5tjcwC/yMQA9sNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW6Ip7tB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW6Ip7tB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccf2360620so70683515ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629762; x=1785234562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=fW6Ip7tBCcZrq+8wko4zjafSa3T/eOaI62j1RBlPmqhOAvXRxLYAR7UaGQO8i2iMKQ
         oWHOFH1kshkZ5eQtDSDRG3AIFLPqZNguuvEIty290Cip0xUw89vNG28Z6F+WE/RliQ7y
         srbOhw7L/n2JJV1BQw1NOKb4TZOhOA+NjKKTiFyyRVgjJjdalguMzWr6bUdVsiWJttNH
         92pMMEy3dbaZpZOFIpJSwpgifww47bXO1GimNb2d5sBZXLIlPpAL65h/vOb+7S4etc8o
         JPNr8Dk/H6LvYQ7/YdRoaIZY0rSm6YGlsv44g+1bObwRFtZijn4G8N1yU18aYBu4M9Dd
         O8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629762; x=1785234562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=iuBhRBIlOitzVJsn6+gQxTEr0U3g4MqYZgwVDAJr1Gq72UeevvPvftgqpQ9o+aYpcr
         70Fbw/UIjMUceGsTey6tIKOoLM9Np/1HxLguCSjsBLbq4sjovpoObUtgUUI3czZel1yx
         dgHWkXEUbXlfH49D0giF9afpPOFjylWwo7AfDRxmUIIKbVbw5+hKvGu7ANJmiEPTD7AD
         x7qdG+BoGjnmOeRUDmhhsAv1TkrTMvupRH4ouZECtpFDa3+dpGHZjs2hJFwWEjOOsCRJ
         VJAdhSjXf7ShQPPrQD9/Mh9J7AR/h25E7aIqHYKHmRUs9p4RMEngRhW5Ma9lCONRs9g9
         eyKA==
X-Forwarded-Encrypted: i=1; AHgh+Rqwoenz6770pQkQVXI1WyJ79hDKnyEk9nxIreH/1sXL9xUcUcFO7kfKYijOOWJkhOXkvAZaCJjU8Dj2oOQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxqiKYIDROcjDwkvHQ83tkbO+fpUasISh35s0zeRSTZRrbxq7dE
	8QlYLJ404OU7qPBd5/Hwm3oaNWj6/8BT2PFzXxhRPDAo8hbwUUToOs05
X-Gm-Gg: AR+sD10usokVuTrD7okHXbUGDl46jOap6icYZYT7q1tl3sqJ9sH4IpC0Y32H+fwV+jd
	C640D+om+JeiyOzEpQqixrfANavArnZOaS4Yj7EyDrLcByARrAYDCwHCMI9jESmClSDHMN3P0KO
	qWKTH063Rzxu0h4Qw1RbQ1GHGtsrS65ENFehhM1U/wEua7sd4QkfLO6pbcYs//8MC6QhjQhYQIH
	fAx17ZJW1rLH3zA9h7yp4K2xGnCU4FTakI9rAbfSJiTv+dgPXFKKZFTKqgxaqKKNEo3ynzeI4lG
	1Py/Kbti6QFyK1HxkxMQcQMy9xH2aWjTyC8MhpJwOpdfwu95HxtcplNzxjGVVPE/kfILekfVYzd
	ppPgIEWAATjGC05AwhmFOB9a4YWXSuLDRkup5Z2eNBwPTJuoAwvITsuU0mLymFwJ0PaAZ+6aKLy
	dS7KECtl/CpwrrzJkgQECCRfY4mWdzEr5Pl8iA
X-Received: by 2002:a17:903:a90:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2cf348917fcmr180302245ad.16.1784629762301;
        Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 23/29] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:54 +0700
Message-ID: <20260721102600.523199-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bb449f08e30c..3ba0cc37acd9 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -415,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -499,11 +499,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0

