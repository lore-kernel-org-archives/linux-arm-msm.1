Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5313F4103
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145476; cv=none; b=biDT9MiJRor99pjhhuatLSQv1RO9PY6g+zmT7C4R67r8REjbySn58wSj9Kls+iexqrv62GIu8BTyAjMqJow1vvZXOrN2ZFBURzwLt4+oqPdjI7wUHHd3Y5/+7pYSeVtcpDL4BTTr9t6OPhncta8M3gwQksn7R2oMoOnpYpv5kC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145476; c=relaxed/simple;
	bh=2Uu6btblyzVE68osf0l6GSac+UXS2aaqwSOrufHLGkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RD43p9mqGrxDBevA4h+vWuPhdL0Rw1H1Yaqcv6msNtup2aSgw5hLzKnp/rUHlJeZZd+FdtMzCcIruxQ/YqZ5ktZHuxrkxAO0gHdtcdqFp6pq1gbI8DvS6G5f4JuYad8GDUp6dtSO8MDcXU/1ozInaLkf4vw7ja8r8smtc/BlTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqH19009; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqH19009"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1791285a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145473; x=1785750273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMgCZgk4Fdz3pUmY/mpab9MmOPoIRFM17hlBry5iTO0=;
        b=pqH19009qUF2e5Q76NSsh/mGszX9myawaMFWlwnYK0LoNjYmx1TFY2swZRdGkaDkHM
         +vIY8oPgSbwnccciKAnXmPRuphw93zHZI5bJsmFsz3c2gzDSTtSeCztuPNVIadR37rg+
         cfOKhS43ZSydnpd56b+FORqawu1kE7fHv45/CHXyOyoQQ6p0j30O+COcN7gzzxBbMIr9
         Js700wIcNbxt4HPI9DcM6jGpDi6o5JCb9nuhMh9d8lP+WRc7V1ISIzTS7TROWakdKpgR
         /V/Yw9Byu3QBmY/TY34A19OQ0qypdQLWYD09UIaZdAVKpOzWyyDtsKxPiShZFPHxPvpr
         zi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145473; x=1785750273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMgCZgk4Fdz3pUmY/mpab9MmOPoIRFM17hlBry5iTO0=;
        b=rvt8hd2+ogdSZGy5WiZgo+7gfY05V4Wk1WBL+ixSrbuAAMdKpoyQ3c/4LbaB1hEt7K
         CknOpE7ZWbbQrHP/kW3Hp2TPFVKYfGpPeym+qudYcty1DTU/u9F6DuSwh7LY5i3ylmDC
         qWwqMjw6ry05ViMH5Bt6J/SAGzVcLkaVVAsw/v35cequldgnf04YaN+OHIBAas22A4jn
         aTXWRUltf3XiRIHxxyMDwYXeGnp/a3j6yvX6VCSvRRcFvKh7mMAJqqe+0AnrbGSMpERX
         ajvFbagwoHHsx7SDS+OTYFgxODyKO4YAR61sP6FN+zgWo2I4jUNz1Pb+ygeK+L6+Gk0e
         M6cA==
X-Forwarded-Encrypted: i=1; AHgh+RqOuS7kaLD4obLYto2z++UHw54ChFGn6YBOI6nOa1IRV3h3VPWxbQ6yV/eCQ5jbS3u3xtgZRouJEQsfMLAh@vger.kernel.org
X-Gm-Message-State: AOJu0YynmvxNoAYOQei4A646fIwJnitu0C9B6Em+oZ4c6i3s3G4peWdW
	Y/R13glvg5IRjt+8DR0AGBnOO41+qsyms1+WHOdIf8KADPfsU9pXKXNf
X-Gm-Gg: AR+sD13dWdCtu/CYrA4qaePmSzQ/yIhTxia21yuCFWkxS382k51wD1WABQuK5hIG4XW
	2WCr+KxgDBud2GWdU0Rud6ISDg5d7zHw2VQ3Zke1K/7FYLwxgrm77xsI4iNN6TtXJvrtnWTjUzf
	SrBW8gkVweDb5HNumMfgMX4ZxntN4bFqt9rL/RRDYxsEtfkrrzcs6MkaAhHF1JjvkVJX6he1NOC
	YafN+qASqvyXgpmQqY/n4VTMXq7VDRnzXRenu8h9pgyTyAyYhS8UnsK6PADvgw6yQbotU7GvAlK
	CwVtoEUo1CDwD5Ld0eoXVfoCYLN6jN1xVn8tUm6lRlSTNok5F5qlBbHi1p/A+yxzFrskYqnNmV0
	FB+Tupml0+YzKRvjpo/P78MvvmX0u9i7Hpt00IvWaMWUPqefxtymh9EuhkBqmHW168CqqATSRls
	9uvysBsOqm23IrdDEinBbvqpk//QxKwGcXLIFfE0mr2Ueq8w5uVAk67GyvP3bGtt9QOshnJvlbN
	ELH0riayi6BG5wbmh+NSg==
X-Received: by 2002:a05:6a21:700a:b0:3c3:98d3:c20a with SMTP id adf61e73a8af0-3c67e06200fmr7275734637.47.1785145473520;
        Mon, 27 Jul 2026 02:44:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:33 -0700 (PDT)
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
Subject: [PATCH v2 19/26] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:39 +0700
Message-ID: <20260727094046.23001-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.

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

