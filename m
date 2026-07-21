Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799B480949
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629638; cv=none; b=u9IP3rA1UebfEDu0tECqVL09GE1NPRNKSg31kYZI5lVzYrwxeFq10KM43iyiEuGbuOfIoPSz2O3HudZ095C68NHXJQ7tzr4bpCmbNgh1KwKbZSghv/cJc5gS2+ZD0vvBSRygx8dUhbM8fInVj5snvk5kpL/SKCsz67Dm0oq41Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629638; c=relaxed/simple;
	bh=rqOl5FtEn1x/OgjbEoHPTL+PY+QF4fqa/Y6KQB6PCdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRQ/zkHO2CFc4mbr/vSiihtbzIBhaUhCZlVutIiNgtJEmLUKK77Jl50CIkx2thx73HLw4rwJ6ZX/BJwXLeWQrEHOW6eiI6IdtEb8ycXbmi/Mp50Su+lc6Mgz4pX6gNDQ2a1sOEntogfpBTSb/F4Wva6SHKchvEnAQcZXgdHrrjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQYWFNdm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQYWFNdm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacf197759so127064035ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629636; x=1785234436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=;
        b=jQYWFNdm50/RoE1E5Y8/hXhKu1xnpCFO0XassqyDk5mFnpaOHRR46XUYw6Dm2iKbH0
         Z3PebpuawgCD1Q9gd42lCbbINSooHtGIgFvDtXY//2KWUPNkNW+ITRnui5mQBGD+YD8C
         o4PzNUvrwzzdxJrEUzYLqzkWoclbOS7QgPdyBmokfeLHR/KvBzhouMYJTnLK4/3/u0+Q
         ejykUi1XdieLfN6ITJTgGADNuYG65j34UkDuwLcKg/OqaXbTAXNMZe+vokGVyJCAGDKm
         /sr8ABbgGeQoIsfYrSZsKCHFdiJQwz0ehE+CpEmAVY/7h5/O/QYQqpVGF8cVS9GFKU+n
         ij+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629636; x=1785234436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=;
        b=UeIWpLC8Nz3MW/PIgWB357D8XeUMS8d64IA5r5TJQyA8f1UHlIOaI3C+zVv/cn+CtS
         nRQqSChkYB17V+M7iNERCun31zOtk7nqpKfREVtyPSYtnYn7EglejHmJNlSmYM7e/oZb
         +2PQtpqBIvyLWDKUMVoMfUXo6QciCHjmcltfGCFjFiofyGQqG+e+cEbyxIFjkkXNsnzI
         Kypu9XbPU0Bo6rEBaI3zs7aVxJLZIrjvwS9k1Aqx5m4QDtFFDoktf+EglOPCko13q7sK
         jpc74gT+gOgrM0UKicu3PPiPEKt1nSj2zc2X3AK5m1PMa7tRwY0mca6FZMIbLeXekYIW
         WvEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqfsFsenTVionkPNfNC8MEdLFK8DilnsP07iZULmJeiuGcAhmQS0e79KtYSrJF5ZwzH5Sny/iOyXL/miyg@vger.kernel.org
X-Gm-Message-State: AOJu0YzBtwgFaI8eOAyCk7/ijyTf2yZ7IHG04HeszoMlWwCySoYELP6B
	30GG1g+6tsIPZIpgsFlQGriOrrKCBpwa8mG/SRhY77E78UnZqmFciL8V
X-Gm-Gg: AR+sD12dhSiuOXYgGCbA++pMnnUXSR5B/t/ruDMEkmZ+gGIPKCCxmR/+cjLX4srp/kD
	9Jc2I7O6REbGEoGinUARCT6UXXyVJWUJzKi3NQTTQ+b08G2DmCxfEJgUU25gk7yToM0sp0dmI7n
	zsUnzS2L2OsTOZHaa8os/D19LQ21hjdRkOZn8QOy+OaT4Le6r9htRVmRC+04x5OBlW2b1+klho0
	GL/vp4xt1JTkuh3p+k1UQra1L3aN+3fVkanOowxFTdEYOJTu4EUi7oUFhNirNQtNstul4xTwlv1
	TclWso02RQ0RHlEbo2ioje8ewhuF728VEE3kP+9FaBe2YyiOjVjOuFKRv1HodIpYM9iq69okDTf
	FM9qxb5Pk8dDWTha+DpvdJRL58ntI3pyg6xkCosmoa9S96NyO7ktDMViRJNB6aS4+UxJKtnOvq6
	1WGjEwGx6AuJeSucdYFZYaJESBH7o9ti5zUq7oXzuZGILJaPQ=
X-Received: by 2002:a17:903:181:b0:2c9:97a9:2098 with SMTP id d9443c01a7336-2cf349fa514mr192693585ad.44.1784629636326;
        Tue, 21 Jul 2026 03:27:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:16 -0700 (PDT)
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
Subject: [PATCH v4 07/29] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:38 +0700
Message-ID: <20260721102600.523199-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdac_hdmi.c | 117 +++++++++++++++++------------------
 1 file changed, 57 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 38073a70fa61..d9e6fa6d3e99 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -10,6 +10,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -537,10 +538,11 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+									    port->pin,
+									    port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +642,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm) {
-		mutex_lock(&pcm->lock);
-		pcm->chmap_set = false;
-		memset(pcm->chmap, 0, sizeof(pcm->chmap));
-		pcm->channels = 0;
-		mutex_unlock(&pcm->lock);
+		scoped_guard(mutex, &pcm->lock) {
+			pcm->chmap_set = false;
+			memset(pcm->chmap, 0, sizeof(pcm->chmap));
+			pcm->channels = 0;
+		}
 	}
 
 	if (dai_map->port)
@@ -922,7 +924,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +947,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
 				hdac_hdmi_jack_report_sync(pcm, port, true);
-				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
 		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	return ret;
 }
@@ -1274,67 +1274,65 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	 * In case of non MST pin, get_eld info API expectes port
 	 * to be -1.
 	 */
-	mutex_lock(&hdmi->pin_mutex);
-	port->eld.monitor_present = false;
+	scoped_guard(mutex, &hdmi->pin_mutex) {
+		port->eld.monitor_present = false;
 
-	if (pin->mst_capable)
-		port_id = port->id;
+		if (pin->mst_capable)
+			port_id = port->id;
 
-	size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
-				&port->eld.monitor_present,
-				port->eld.eld_buffer,
-				ELD_MAX_SIZE);
+		size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
+					      &port->eld.monitor_present,
+					      port->eld.eld_buffer,
+					      ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
-
-	eld_valid = port->eld.eld_valid;
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		eld_valid = port->eld.eld_valid;
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
-		mutex_unlock(&hdmi->pin_mutex);
-		return;
-	}
+			/*
+			 * PCMs are not registered during device probe, so don't
+			 * report jack here. It will be done in usermode mux
+			 * control select.
+			 */
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, false);
+				schedule_work(&port->dapm_work);
+			}
 
-	if (port->eld.monitor_present && port->eld.eld_valid) {
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, true);
-			schedule_work(&port->dapm_work);
+			return;
 		}
 
-		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
-			  port->eld.eld_buffer, port->eld.eld_size, false);
+		if (port->eld.monitor_present && port->eld.eld_valid) {
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, true);
+				schedule_work(&port->dapm_work);
+			}
 
+			print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
+					     port->eld.eld_buffer, port->eld.eld_size, false);
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1793,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
 	if (list_empty(&pcm->port_list))
 		return;
 
-	mutex_lock(&pcm->lock);
+	guard(mutex)(&pcm->lock);
 	pcm->chmap_set = true;
 	memcpy(pcm->chmap, chmap, ARRAY_SIZE(pcm->chmap));
 	list_for_each_entry(port, &pcm->port_list, head)
 		if (prepared)
 			hdac_hdmi_setup_audio_infoframe(hdev, pcm, port);
-	mutex_unlock(&pcm->lock);
 }
 
 static bool is_hdac_hdmi_pcm_attached(struct hdac_device *hdev, int pcm_idx)
-- 
2.43.0

