Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9C3A1A58
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782600; cv=none; b=HZQbEHMIZsDXnNNaP24Lgs5olVFix3PL/JYIDhWwZZk1zY2vTEAbuMLHI6tW25UwqqTLNLwrTwisjQIoRY+6wZiEpl7JTAMWG5m5er6GITygvwQTwYwoQG2VnK2P/niPN0KpoKHHJn0t0U5gh8wKRxuH/45xHoEeoKBY2vABc4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782600; c=relaxed/simple;
	bh=K0qNNfC3kV/sDligl/YtVeKeS0f+6Ya3lXb6LENAZSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/0clTqRIkIpWNwRKPawfkwK174GJpAKW9BCRYh+Sj1PMQSn4daCM98rihGVW8v8AcJzU4Ewjz0EP7YzEu6K/yGq8FZd+yHuHItl5RVdpG7Z82mbfV3U8cUV8V2RKLwu3weH/K32lun6TujOVk+k1BCZt/1UhtzR8N5sYZs+47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+THBt3O; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+THBt3O"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso589905ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782584; x=1785387384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nAKMdocPGkvuO4NtwVmzSRSgTeiuWi8Ahf/iUqF1PE=;
        b=L+THBt3Ogue/f6u48xoVpyL67PRwJjV6FiIRb6FMd0fmJMJmihBRUUIvB6oXgCCnk6
         ga2njBwBxb4xQpzBFVwu8p82wJxMY/cTjAOp+OGERaqYX1OagtCNUqGKnJQ0j5tOORVl
         WDQAOW8eSE1u97FCKUHEqepvbxJ553IKXXDpIdpBjJXnxQ/UKMrC+qKMC8bAP1f4ygkF
         rqe+vTnQ9WXlZzyC6/yQmIKQI1nw17MSpe8l7toXoP2kyTfOGUpxk7+ejrjVJxsTrXOW
         EAiZouE8OaG7cuzGEfx+hP/vu3s/uOR7EzvsbiYQ551F4aVJHNVIuq0kQ6cs7GK3BA3h
         NVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782584; x=1785387384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nAKMdocPGkvuO4NtwVmzSRSgTeiuWi8Ahf/iUqF1PE=;
        b=idac7jrw2Atfa9gtLu+x6hWm/+7mFj/pk9lGpBhHSMin8wYxhTj6AO4B8gKneX0mdt
         4BzjegHeLFxYGrdiESaP8ITZALr5dEeJpveOwiPTNwBZSwR0dL84ZDclloZYVheNw6lC
         yqOoDpWPZRB6iLjI9C3r7KEx1d9R1XPES0eLsXbP8G31KiNgsfMiXsNqLpqDeQ3LY1Ri
         Kbn1p64Y7hBjzmJueqmwNa9TnJEKX+SqrrRrQEhkIEt4t2+4XAS2lU02jR+OvNmBGrNm
         Ra2BZDMHwobFIgPoF5wjjrQdoFGcfPtjH02OuWprmiIklvq2+crXQs8pIzmj3mOa5rwF
         6Tbg==
X-Forwarded-Encrypted: i=1; AHgh+RqifZzwpAADu/BYrZ7MW3TMHHw4xiqlzsav9s0iVqhjNKrItC6oR1yQFXM1WuzNmC/CxPn5fU2HBKID0/2f@vger.kernel.org
X-Gm-Message-State: AOJu0YyATciv5LE7Lu6ISgyUV+r/LNjeBi5DgrCAUeQDoJryjTDLO5dE
	YhwB02ag745x0b1qg97JxzLDjKj9WksM4B0QvVqx+3OapFuexki7CJKd
X-Gm-Gg: AR+sD10ki5r6pqmi2auBX83lo/T90opHSyS+D7nP+pNvm1gI/4Y28NT+oa9NqtPYilf
	ByCKHjkiyrcrABqOv3o6E0QRSppgFMBnQyqVh2ghK0BtVsXIYeFkJcb7/G/qBTMxh+FcKMd8vjE
	DuxTXKYzrhj0xnyyqU52ow/mXmoInG9DnPYCezMD6u2AblGbDKKpTQzAenv3hRnkF14OFJOgxV+
	JYUF/dfQBY+neEzmuKDIAA62dHKaiCn8jlsmUw/41EWNxnq7dnNb6gEZV40XrECjHn6jRB3+U2T
	eoCslNlh3/i/NkGdPYSmbHE5VJ7Q+YQeGCOWF9q8UoA8WgmgZLntPolFiUkoIPfqMjx1Sl5xAdM
	yIDNwa9oE8Xu+/cUvc7TcUc1PkWJSoDt8YTlm39jNLSpjlKvQEbyivLnfEJkJ5FLsZft5iVCkVg
	l5zkxWRYc/b8cFlqk2qNdVi7OE1k2NT14HWB13
X-Received: by 2002:a17:903:2406:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2cfa94ce6demr13480345ad.12.1784782584053;
        Wed, 22 Jul 2026 21:56:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:23 -0700 (PDT)
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
Subject: [PATCH 21/26] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:22 +0700
Message-ID: <20260723045327.28260-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8958-dsp2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..f75a6dc9d2bb 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -864,9 +865,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +876,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +887,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0

