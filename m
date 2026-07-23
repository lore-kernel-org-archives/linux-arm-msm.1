Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F5C38C2B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782570; cv=none; b=WIr4nyJHE/PYmso1ZcPbkdbhtGp8kYfHjTz/PLqnkXRciaerKuSrW5jbQydJg9JB7878zLq2hiyTSkbvZBseM3Kqn153/4v2WYKyvW8n+gRhwBUb8xkvd97jW3AsUzFvHsSexEgDpmcWxdGgygkXiVB7OlkWF22s6pC+iqSZj+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782570; c=relaxed/simple;
	bh=1Dpqc5x+KM5kx8uAtY04gCGPsEBNAbWrcA9xYsfntHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXCDFvH2o7yeEQMyGXbpQuRQWNMTz1aiDXHasoC7ZY0apyWf4W69vCpd2NlHZQr0U2oJoQPS1YWBOJ44Gnhyou0izq2FUKWTkqW8sZHPqBH9u86QIxzRUD2tqWkdbZfzunz5EKMQYOJnLXb/nI55IVsbJth/FNqxPNchy0/+JH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaIN08hG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaIN08hG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso3032855ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782558; x=1785387358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkLOpw0PU4ryhG2UScp9q/DeFzgBu9EIAOz0VuJ3SlM=;
        b=BaIN08hGn/I+lChSgY3QQ5Oy2H4Uuf+u7t4zujLFnsTenPr8RVFSnMxZNfKxz1il4u
         RcGglGEZl7gF0ZSPG+/dXylXj2QDE2i5v9EHeWfPfaCRDEzBQmXX0M28YyQ5kFnT2n4e
         8GHcBOwOUK2nIWdryKL6pQFRlMKBg3fnIlhOX/gUdRRHTlGBiRnhpXmy8epPe68Szkmg
         aAq6Li0gVYu+K4o0qWlFnAgdybpWHkyqI9dGiLsVuFf0sUDLqykYd+3ybWHP1rME827f
         albhtM7nUdx0rarsE8zi9ALeN4DDop+tJE2Q6kb86fLrrahOaRpTOE83QGItqnxzJLsZ
         yqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782558; x=1785387358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UkLOpw0PU4ryhG2UScp9q/DeFzgBu9EIAOz0VuJ3SlM=;
        b=U9HJXqZeWSCHbEZoBP9ZDWNCcf19slBH/lC2kWkgv+OPdDRTPWQNmN4kxWEszndmR3
         wPEMxScQhUgNQjd5NPLgLa6b7avhTHmZq44y3wsm/L86tPRUdjPMfJSq6LxB7rgGTyx2
         Ut5POyc8m6roSkh4TroYAcAvEwjPNffihP1E2lOavXGZJFvPS8g5PN1hWa+uP/8+KSyL
         CqILpkAy6M4m7Q/DcVennOYjLJUjSYr1FySzWLsjOwXN28oTjXyRieCz58a011GnYX6S
         Z89oKCAELYPJm1N+AwKs+McL1IHJqYAgbjn1chMYvVMR9GtgnRosZgZTzVK4ZoNg7rAb
         EZfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBmEheBC3ZlC5dWTb58AosX+POLmUI4rcA3QT58i8pjLr7ziHoFVUm2rzW+zJHeL4hTcED3cunAVGnI0Hs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JywNtKYa4kc+qeFNb+De5ePX/ohOAUBcrs65YJtmPAW50SgQ
	fO4tr0GgHlaJ2e94/36+TLd30B7GSPF2BTmIyolaM/lf0jq8bYyk6B5J
X-Gm-Gg: AR+sD12B6OQ2LzmsAj9bftnOmYIR+/ms3H48qUw4bFY3t/naUrM4LE1r1H3WZ++BM8C
	YbQ3tMnYJ0O/2ktxKGW6pbQtPLTYCTVcVM17Td++obT8Wh0mJHPlU9ZKd2AY0BSAf9LIRz/1fR9
	DHzyGX+g1mKFeiJ0AbfAKABw7xj8B4Ni7LLBvHNbg9Kf201dXjBEVUYPuQuh6QWory3LCJ2V1tX
	Vwky4a+MA/I4KThI4gYxQFk4xhQu81tF7HmQRSIRiok73CZ1SxFSTgopvWOdWwRlLVn3IGpBIru
	4E/+rD/XxYcs457tpBuKWEj/B0B3DgneZKVqokVc3sc5TPV3tt40A0rfdglT5F3nwL3NBRg410m
	4IwttHp2L+P/VeTup4b1Q17TaRv4kv5s6kljSiI/jE7pnFWR2utjsjZyHj1K8IF6LbQGZsPjDev
	x5nhjGho6epsIrCVGeXjfNAf/EVagIPQbiY+O7
X-Received: by 2002:a17:902:d50b:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2cfa6b7e369mr21647945ad.17.1784782558134;
        Wed, 22 Jul 2026 21:55:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:57 -0700 (PDT)
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
Subject: [PATCH 17/26] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:18 +0700
Message-ID: <20260723045327.28260-18-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm2000.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..897b0acac5f3 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/firmware.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -612,20 +613,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +641,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +667,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +676,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0

