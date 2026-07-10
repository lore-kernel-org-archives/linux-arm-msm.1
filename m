Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660F26A1C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660101; cv=none; b=VCi7Y7/YjkAznz6gH0XRUkXwkDqzyRcrQTTNBc5BvPXJ4zI2g6A1bD9/MCKPAaPjGwHN/bTwS1BYJWXNXwWKcWE6M/t/8Hx22kw7+da3sK6bqEk4hmUNHCMiyP296PDNeVPLu2irRNSbNs/Y5xVcyMZ7+sjirEh9gW83xwa75I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660101; c=relaxed/simple;
	bh=aakMWPqtzSC8d4xUEjViRQdNYsjBJ/WN5Zv10mvjTN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+Nggeyg1av0MvHnkEpL5gdEft0L+p15xNrMQRNdhKT/EMntWHW1y6bF2IQ30OoadGc32CbPOX54dx90J2M5SzI0Ni6iMO8anUPbPhRsK3i4DWIA6CHvEn+w1oNVGvLzV/txNUY+kqS33KhCbUDWOERyiGbtZqoGzjkBYBDXLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1R05TBe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1R05TBe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8484a0b998fso707615b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660099; x=1784264899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=d1R05TBe7xq/kXEu+sIjTJeKZgB6NnUZKlIHiYfK6ip13OTbGSJAEJs2dfYOpEmH4c
         BP7gwr1IE39WVNPrP6Imd35BZDftt4mQmF0JWrjqBFJtdm0VeZ883fxKZ6y8K9BAEsy1
         3u6OLOlse+y3OtUPlUr2zrdUnh6pGA0l/tGr+jZrgjWEX4Ro4FjpltifYyVoRTESqUWh
         SZA22OAvgsTJue5Fmbcu8oawB6tN+RQmbQil4cHlEfixmPS0KzhMgDYzHzHdF+MreloN
         ucs8S6FhjePqT2CY++4HLPQmfZRWOGETlGRP9Xvovatd/RiAw4gW00uOhyK6ixmVoYYJ
         IwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660099; x=1784264899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=bQt1RyRq23F/LeGRI7Q3iGunXUDEqIFmTfRzUflJH7f5Box7GSSBVd2rKvGwmyIqDv
         06MfDCN8j13okl3MhwscEg61f4Dx/AG47i9mTCHV10/D9UCYJZTXboTYQqKVtJnVOxHl
         ytSBcg4c7IUu8NFXNj1lncwyZBkQ8M4oC7Yxi2S1eb5kwmRRK3+nxSun9SOUBohpXEj0
         zhQRrP0Yqn7hqFYU4qGhO7LLJQcO2XkM15j86Ge5uPBGDODzebuSvHcLFl7Lmjx9qaH5
         SpqbjTV9FwGp77dNqjPZSwPazT/xa00t2My9sAsiBK+Ks3/7dZMA+pdj1MjRT0orlxXq
         8IkA==
X-Forwarded-Encrypted: i=1; AHgh+RrXB3Jgu4F5a28I9cRsGoWpA0oVEl8JofMJOyoYP3TafnNbaYYIwN2bPsJ8r6sLkiP2SggaMyygIUyM1o/f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qyunMySALAMSCQqmCa0HG7p96TVxEhmK98Ga4adx71tAsd7v
	19svFvQ2Y3uZwJwzdk23jiF/LvcjfaT8wqbkF73JyVqhfnfk64NG3afa
X-Gm-Gg: AfdE7cnBIPAbkQDtGQxkJc52V+XiuRCS07aF+mF433knDhilfoud7szHOw29iUZxTRh
	pukzqb6mDBWRfAjQ0LdkMMA83pgqAvfAUuNxO1vK2UK31IF19u06Lg/zgY/0jVUAcOnETE3ubsP
	+qBzIh4kT7dSmZqN2HMMJ1FbPbaUG0RHvXrFSo8b7b7gl/+LyNlcyWTzwhgLJJLtTXircL19OxQ
	0MaaemhRzSw7kcJUsUMsa28MCV+le4SgvaAfM8y/oWxFTPT49aXdQn+2e6/wXde1kHm12ssNghy
	p4bhQPO6cFHlUu5GvsTB/qp2hbXJw6I/JMwCQADdmkLpqtPjQ5BZul+VWKDNxDshltTHcXmDRlm
	dsn58wU9cQrhLScq4p4Ie1BEk0FhbMxrGf5vmYG3fCXntGLlGyIeGTKNT1tpCUoN26VYyX881JX
	wSt/hruQNs3BeqaZxvVrtcpfHGbzi32UFNU49vaoVprGhdgl4=
X-Received: by 2002:a05:6a00:1826:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-8484323444cmr9691356b3a.16.1783660099554;
        Thu, 09 Jul 2026 22:08:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:19 -0700 (PDT)
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
Subject: [PATCH v3 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:07 +0700
Message-ID: <20260710050511.14439-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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

