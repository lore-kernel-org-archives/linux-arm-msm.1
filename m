Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B43EAC8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145350; cv=none; b=smV4RZF7LWMOcxvtQH/IYN3d2/26YmdspV1v+MKzZcOsyAGG1gBmvuJf3xzUqOeujugLObzGeaZtWlhY6M6AKmbhHY/ipxLKPqMFX0BjNjlMgXOaq3vKUlIerQgrStdIp2y0R1ZEMnkmnEC7QClf1mR55IfS9sRbj7kbeuXuHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145350; c=relaxed/simple;
	bh=y5XdJ6OkHgxu+beAwr5WwIRuGIeclzsWyl1XJ6BLy9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6Eu28ceU567z0N6FULqko5AYu739ybHiBdnmCXUhdO4GNxQJBQCS9qoZ1VVApRHz6ADWILKk6T+G8iRidZIqPdLHyb9Jt4PMUbWEQ0XkCAZmXLgX5No8ZiFav+2NOdpwAJ7kuBohM2EGzXiJySTuiduszsWSs2L1hkmD0/W2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+Q6riGq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+Q6riGq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2441627b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145348; x=1785750148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nJcxVapbgHVBOEWq/X49W5vkvWx4XNnEmWY18iJdtM=;
        b=q+Q6riGq6L11pDV/ditqAlmogzYUiPFv6Eg6w/njvs1S/R+aDfIms/EHQq0VFJvy0a
         9KqRzrJcKTlOzmDu+hddIoh0I65xdklzyDh8YtevohDzzrpFxatLDcx6YpfmW/nbifGl
         9UYk1YoWae1mubb9nuUW/ex4fqueZ5SZjfUgkio0YZvEuncYfFWxZ6WHanjDGqSdJ7DL
         QaZH10yzik4s+SNJ2+JHIDHwg8lowdaWB1UuJTkWAdVjPZWNOv3IHAorSld7n59JOSWl
         97oCaTDawim6l2o0TrQWrdT9V7EPP7XTG973DLOeBt0dV6Sc5IctM7Qw85xwwGqDCBTn
         6SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145348; x=1785750148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2nJcxVapbgHVBOEWq/X49W5vkvWx4XNnEmWY18iJdtM=;
        b=XHgMfzzJdyjhC0mAPghncoim5iGXPUhgMgH4f1a0nSEgtF27/63AbQ8XNYRhrCapA+
         cRsg7Yg18+fyL7AYKBkKu8CpyBM+Ml/mp+9rA0AO9Z/HHTGfR8adDfhKnUiEByKnWb3n
         zpbkSwmD00RTlX1silSISHvX2g8cNFsEDw9nt5HxcGSLqab0OB8WOwIPvDEJaL/DiL2v
         1iw6a8t2zX+YvgYxmAg8M5RZpyAAZTYqAMsjjp6M4TbVn38Gq58Bh4zcYgHlHBX3jsj1
         htPGPst93A1uOFC/MdOBLJ+tnb8iZSuqTz6k8srCUFJ/XQo2YSQTMswotQKF4bWBnee9
         yzKw==
X-Forwarded-Encrypted: i=1; AHgh+RrXTiAHGyEbe3dq/cWbknZY1Ix6gkngkbqg+jbV5fjKIuyq+XLNdL5/YVsfnxJONBrDx+8kSrfRdBg8kjQx@vger.kernel.org
X-Gm-Message-State: AOJu0YyLy8I7My+o4j5mgnCJ0unqhZqwLPG9Gih4Yjprw8dlVKGmuGCZ
	yxKsUeacq7WKhYtkE4q/b7wCuAtsu/wtFvazsCQMBUeDNsztTezHhMn2
X-Gm-Gg: AR+sD1295qciyAQO/gW3ZhDRu4ylr01VNYWw8Q8KZcu2DHNuIidzCj1ppqVeFF9JKq+
	8dddwRZbsRN+eNSvNaCzt0ByUaa3jD42dCa7d5yKRCGMb2Issy5HD3o6xsWvFi24fMrMxc2eS2E
	ZJQKHPqchEYoVPbRjHR1UuoduAYY2Hc3Wku4Jthe83Ksg1PJejY1+oQ+bfKuSzodz5KgST+/TDp
	CIpqUFwkOxErOVSVOlB8qiqxhfLUaI5/QXIQQHGECvySxJm3IpQ6jQ0AQDd5/TtnjGQU5s4/SPk
	I/h9p3BvowbYrxXAo+wzhf0MWsI7Rlycgxl48GuOMJgPZgGw3z2XYKLXLzXoBrDnA1HyRXEIS01
	6VFRx8UAizOhX8pV41b614n6mEsB9VCC7xymAMLwXmB5potoNjFg5fDwsQS1khg4zW+3Ko5N416
	1m71/yt8XpAcmD4n0YupYN1sgcH0UCmV24TcL7FceOoYvFgBmMZxjWKw2Y6jJLzQJVFOPO0094a
	+eJLzYQSpyelzd07Fndew==
X-Received: by 2002:a05:6a21:920d:b0:3bf:a1e5:ff62 with SMTP id adf61e73a8af0-3c67df201b3mr8642981637.47.1785145348201;
        Mon, 27 Jul 2026 02:42:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:42:27 -0700 (PDT)
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
Subject: [PATCH v2 04/26] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:24 +0700
Message-ID: <20260727094046.23001-5-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tas2781-comlib-i2c.c |  5 ++---
 sound/soc/codecs/tas2781-i2c.c        | 32 +++++++++++----------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index e24d56a14cfd..79b5f5b04c74 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -6,6 +6,7 @@
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -342,7 +343,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	/* Codec Lock Hold to ensure that codec_probe and firmware parsing and
 	 * loading do not simultaneously execute.
 	 */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->rca_binaryname, 64, "%s-%sRCA%d.bin",
@@ -360,8 +361,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
 			ret);
 
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..16dd0989e5e2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -13,6 +13,7 @@
 // Author: Kevin Lu <kevin-lu@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -843,12 +844,12 @@ static int tasdevice_digital_gain_get(
 	unsigned char data[4];
 	int ret;
 
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		goto out;
+		return ret;
 	}
 
 	target = get_unaligned_be32(&data[0]);
@@ -868,8 +869,7 @@ static int tasdevice_digital_gain_get(
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
 		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return 0;
 }
 
@@ -882,29 +882,26 @@ static int tasdevice_digital_gain_put(
 	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
 	int vol = ucontrol->value.integer.value[0];
-	int status = 0, max = mc->max, rc = 1;
+	int status = 0, max = mc->max;
 	int i, ret;
 	unsigned int reg = mc->reg;
 	unsigned int volrd, volwr;
 	unsigned char data[4];
 
 	vol = clamp(vol, 0, max);
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		rc = -1;
-		goto out;
+		return -1;
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
 	volwr = get_unaligned_be32(tas_dev->dvc_tlv_table[vol]);
 
-	if (volrd == volwr) {
-		rc = 0;
-		goto out;
-	}
+	if (volrd == volwr)
+		return 0;
 
 	for (i = 0; i < tas_dev->ndev; i++) {
 		ret = tasdevice_dev_bulk_write(tas_dev, i, reg,
@@ -918,10 +915,9 @@ static int tasdevice_digital_gain_put(
 	}
 
 	if (status)
-		rc = -1;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
-	return rc;
+		return -1;
+
+	return 1;
 }
 
 static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
@@ -1766,12 +1762,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	int state = 0;
 
 	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
 	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0

