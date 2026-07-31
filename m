Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2FA340A46
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467475; cv=none; b=eSnoq7LPsX8y7nCd66HjeGdfC7a/DkEGWqLS2sK8KHHYElyUQi0iYPL1l0JLKUms95K89cJaOOY9wSsKq3Yny5OSYJxs0hV8eW+5SYpcWBCXSHzv5k5tJUNEurw9ZkOt6eHx8h4rZ999K4bn0AvuihgNDG6Ij2GaAKlRpwu8dGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467475; c=relaxed/simple;
	bh=NTv0dA4h7p0NtOycmpwSiKJMd8uSAN1UAwPHu17+jvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ev6VrcoyFftYpcUFnjPT4dMUR51ywSx1bmak66w3uBgqIz41Cnns43fNgef5a8IjqjZxfBMjk99LoR2+EBPq6YS0EX9hSN+C9K6P3RY/+aVYX2C9Hv2PPreCf3JBKOTRGsgKCLaHQ5nfjAMAlG/0Y8yl55lrDJ4q+Tf7Z3+ZAg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TV3mGzYX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TV3mGzYX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce98cb8165so3758025ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467474; x=1786072274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=TV3mGzYXaQ/Mr3HskUSm0d6QTTni3cAp8yP9OmLoeyywp8qsgiRIQ1C7UbLsQuoMEW
         dEfauHPJTGnqeEO19kh0W+/daeWgorgWpv6gZkQVCkhK+pSBDNRJHVQ8pt0KpKxd+wSl
         ECftUMwjmqSWVcErgAjdTd3p6HGJgfELLgEJisCAdxtd1eg7HEtEQM+cZLyk3LDPNl1j
         uPmA754LkFixd/yFUWsrGOThKlcBusqs3bFYe3bcWGPUAVIa8hND0tHoHYwQHPGgmoH6
         Y9zaTUe6dkpLjIYzkIRXOVUJQvjPbqR1ZpjOHrUq1S9qOZqd7v//ZjbBBDAnYUX2qTn0
         wogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467474; x=1786072274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=of+U+H32WAvs8QFn/AW0Brlxc90EvfD+5QI79kbBU8ysI+oUcpJuSKDCNRNQqIssAG
         L6dWC5gUIwh1yUwmKyKdlEuvgYwiB3xo/SvNcVQIMxSNm6EloR6ctrePqZH06Rqw46hr
         69o1ymuV2xStDEGA5wQG9eOk4uDxOEwMa69OUk63kPy6GpZo+8pbdR+IY2rLVTrYiU1a
         y3XxVaX1CW2MY+vuC9K/05n6ZkDHb6htD6W0Jnw8IQ2NbDeH7SmeeuUGNhSlBe3Kb5Dy
         A3SFuaqisp1W1TlrDKb2ktgXWQbCYA+IkYac4wDmObuTz3PCagTvq/qrkiTsOS+3t/d9
         sJnA==
X-Forwarded-Encrypted: i=1; AHgh+RrwCN9qexG8Es4BKYHVf/dKQ9TrgWEm64De5shPfSKhjCxxy6U4veZ/ITBW1/i2YsCNYIzW8HSuhlWBms4f@vger.kernel.org
X-Gm-Message-State: AOJu0YztC9hFwG37Wgy3iRZRurLan6xrT07Ej5Qnp53OxT/0Se9qKGoU
	drineQrE9vsPyNbkOA+8Vz4EK9yisaCUHVCw8LVaQQwXJvS47rFKbfjB
X-Gm-Gg: AR+sD11NM+yzt2AgdTmvIK1RAm2lpsCOuXV/s5RDygnAFHPinqc0bFhVCZvfQTBIaT0
	FofGm4WpkxsefVJK9AWSe5ssHjLP6L5GThveEFN2YF8eySp02qgNXKp2BnkqAi3d6UH0npiF0Q5
	o1YKW4+u+7+1jJuwm0GRVOYMdp+VnynsFfWsEmPh2KD0skgi8JdUIVZ9rbeLHBsr84KQwfRFnRo
	Xjcg1Nr9GWlx6rtcRwFYm4MXRKFwhJA6NXVNiBZqnD5bkFoeSCEYB0Kte7hx9uCK8UFtyyuVV8U
	8CdCu62FzAsztiDoYd899hWhIAZXyy4tnmeSSEuCxjPIbb0q5dVShKLdYmmZyK3GYkRPFHwl6tp
	g4rGuXj6nRMk/rmmWZU6P9SiytFRrrYOKqUVFNx3ToHVqFRuIH24moKmliBgzTJIOIBBiu23nlC
	s1MqtTxx24l11MWckLR1YcpDKqnJNQWbNTNDUj5PW+86z/1rTjCJJOQLxvd+FHsRpDepvoMAf2u
	VEr95ltafOV7o111zFsE/56Z6Qrrk0A+mK3n3QfSWTS5NbAWD1/qfB1hkBLNiSKycF6xrGrtPZw
	hji/
X-Received: by 2002:a17:902:f550:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d048331471mr1124385ad.12.1785467473676;
        Thu, 30 Jul 2026 20:11:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:12 -0700 (PDT)
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
Subject: [PATCH v3 10/26] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:32 +0700
Message-ID: <20260731030648.8706-11-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/twl6040.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..650836f9615f 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
@@ -273,7 +274,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +282,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

