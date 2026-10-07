Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E23BF66B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376810; cv=none; b=cddmEmWLe8zW0f1EJj6t9C74wM089046XBA74eT11b5efq8xJQI5cWlgXab68RVduvec7Oy8HKg9uF+gQUJMpTV9jjb0o8HtcTlYju1ztZ2raBEPkOUKBcNQFQw+cba6Hit5n+d6tcy9cRrkxupK1Bzs64D8loPpX6s7B7TMEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376810; c=relaxed/simple;
	bh=q5kb3Slwlwc0fl/bNQMM1k/M/9pq7+Hr3X7DDfLNjqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iSB2fWkxZvWGwZz+6Zb3TdWW6KeJptB0SHg8cjsHOjOv8xB85csRqZppnk9znXYM5oDShORYRNMLNYLqjFogz/1hdxcadvvcZDtOFS25w7GigNcaCtF8JZ1SGgiu1AfnxD7tyt/zLcAdrSJJP4bIqFlxIAweM4uxPoQ4BGgcLoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syvFYw9Z; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syvFYw9Z"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4d455ace3so1924930a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376800; x=1791981600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEY2dZJ0SUaUF0e5EfY3TFLbxPMert/9sV2HdEJuzdI=;
        b=syvFYw9ZvuALriDoaQZSQAxJnPQiHakNLvlmvI1PrTFI+RDd7QghXnIHDROdX37hv8
         nFrnaA8iCKtcjHKzYL8cEiSMoeGJgJ7WHenh5myLPXMch9HyKQDSmWdo71FgNnti2Ocu
         q8WGAuQWOL1zy9YqCxtFw4OB5+UZ2ckPe+0UhhdRuTyHGhQD9Obn1QuaRL5FXfpZlNub
         yE7zL9gWhPgKZ0SAAzg9a/akevgDuNSHOrHA8SeATw943YjChnNuNqFsNDfMAAtYkjqG
         hfHJdnVZR+f4VIY5wQL37UZIi4jt/PUbDkVoCZFlIFiwkNTsjPwMVBOLoqy+KWv37QAo
         5cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376800; x=1791981600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEY2dZJ0SUaUF0e5EfY3TFLbxPMert/9sV2HdEJuzdI=;
        b=KGPnE962PcxgL0pBxaOZ8I2eFSGOOCSoXzpVelEmeEK5KRpcemfv8cAQ8cexbjyVM+
         GBN+dfioHBOQG9t6BAiy2krrvqJXXAr/0AYrKGatZ3iA3y7iji5o22gf4q8U8s9guWPZ
         rfo38W1oDgARwdvDX04qABsB6Gna4O9CG6CT4bGlDBOodT57euXfNvdjS3CMoP/RAYXe
         iRCwxXizh0N6gjuwLLzJMQHMzIZZLlv73+392+ORVZ69AaP9kImKEBNdY8JeyJg7ZIsQ
         rd71zl9UYIxrJf8jpCj/MuRkSGEkUw4tLq0tZDU5zGn2rXlgpvf68MAVu4GZvtxy9xnf
         6pDQ==
X-Forwarded-Encrypted: i=1; AKwUvByp7N113kUrKNLgMPHYkizG/DJ7sfAqhoDWi8nS0DBzyHgFYIbp71otzZ+GfuHl+QyP8FMJwHnq53GmkmP9@vger.kernel.org
X-Gm-Message-State: AFq9FYLsGv3laO6CBx6tbhtmyzjhYFe+GdXJL6PNDP4lEw+Jtpr2NknI
	xOFAsdN7wmgbOq0OslLrbFvzc6+bEzOm0w1cV138TCiynQ5Uq1t0ZOgB
X-Gm-Gg: AYBFou0L7NhS9IFc/feviQFIsZIWHuEiD51cwJi1j094HnS/4irH7DwRRLAOKmqa7AG
	QIUmDDklQNKmBb0PoNJ4twxVmPp0qSjrDqphSD7Azuv8VZsFkPR+dLMR4lqRDmgZUS99GFP/zCd
	P/LTEK5N9fxidB0mzlyatLROijms2lPyrjw3ovSGpm8cObd/DdHSvNLaOwdHWxfU85z+kB/Jl/W
	5iXDQBdefR36gjUwNg9VFKdRMcVrJo88Zq5Ztd2pmd9/LHwl+w+kniqA4aJV1kBFMAh17gt3rLS
	2Non+tekoIU9Aq3V8RV6SfB00yQ2HjfQj3rCa+wSyHFtp+1aKXs5djGNOzvM3QlPVKgW+btJm8I
	FQ3/rs7dxFLrf5zSOqtCN++grvd6sILMug7N/ySC9Q23+jyTGspOaVVaRK7pY9CXNy8hLCsUCeM
	/KM3zYCshZ/oC21B4V6wAFUZ9n+TunEloXaZjIt2N+aWKVWA1AmeEOtbb6NT4cVm44jiJ19pzbw
	BRDqMRZmsJrxg==
X-Received: by 2002:a17:90b:3147:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a89f649784mr1968180a91.1.1791376800333;
        Wed, 07 Oct 2026 05:40:00 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436a39dsm10087459a91.9.2026.10.07.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:39:59 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: srini@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	neil.armstrong@linaro.org,
	jonathan@marek.ca,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd939x: read the SoundWire port switches per channel
Date: Wed,  7 Oct 2026 21:39:54 +0900
Message-ID: <20261007123954.1709-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "HPHL/HPHR", "ADCn" and "DMICn" switches are channels of shared
SoundWire ports (ADC1-4 are channels 0-3 of the ADC_1_4 port), but
wcd939x_get_swr_port() reports a per-port flag. Once one channel of a
port is switched on, every switch on that port reads back as on:

  amixer cset name='ADC1 Switch' on   -> ADC1..ADC4 Switch all read "on"

Setting one of the others then looks like a no-op to userspace, and
"alsactl store" saves all of them as on, so a later "alsactl restore"
really enables the unused channels of the port.

Read the channel's own bit in the port's channel mask instead, drop the
now unused port_enable[] and return 0 from the put handler when the
switch does not change, as ALSA expects.

Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
Link: https://lore.kernel.org/all/20251124064850.15419-6-jonathan@marek.ca/
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Jonathan Marek posted the same read-back change in November 2025 as
part of a wcd938x/wcd939x series [1]; the discussion stayed on the wsa
patches of that series and this one was not picked up. This version also
makes the put handler report "no change", which the original did not.
wcd938x and wcd937x keep the same per-port flag.

Tested on a Lenovo TB323FU (WCD9395, two-mic capture on ADC1/ADC3).
Before: with only ADC1 switched on, ADC1-4 all read back as on, and
after "alsactl store" and "alsactl restore" the TX port's ChannelEn was
0xf during capture. With this patch: ADC1-4 read on/off/on/off and
ChannelEn is 0x5. Writing the same value again no longer sends a change
event.

[1] https://lore.kernel.org/all/20251124064850.15419-1-jonathan@marek.ca/

 sound/soc/codecs/wcd939x.c | 10 +++++++---
 sound/soc/codecs/wcd939x.h |  1 -
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 26fe0b6313cd..2d463f062e6d 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1794,8 +1794,9 @@ static int wcd939x_get_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
+	u8 ch_mask = wcd->ch_info[mixer->reg].ch_mask;
 
-	ucontrol->value.integer.value[0] = wcd->port_enable[portidx] ? 1 : 0;
+	ucontrol->value.integer.value[0] = !!(wcd->port_config[portidx - 1].ch_mask & ch_mask);
 
 	return 0;
 }
@@ -1821,10 +1822,13 @@ static int wcd939x_set_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
+	u8 ch_mask = wcd->ch_info[mixer->reg].ch_mask;
+	bool enable = !!ucontrol->value.integer.value[0];
 
-	wcd->port_enable[portidx] = !!ucontrol->value.integer.value[0];
+	if (enable == !!(wcd->port_config[portidx - 1].ch_mask & ch_mask))
+		return 0;
 
-	wcd939x_connect_port(wcd, portidx, mixer->reg, wcd->port_enable[portidx]);
+	wcd939x_connect_port(wcd, portidx, mixer->reg, enable);
 
 	return 1;
 }
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 6bd2366587a8..dab7ef108b48 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -899,7 +899,6 @@ struct wcd939x_sdw_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
 	const struct wcd_sdw_ch_info *ch_info;
-	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
 	struct wcd939x_priv *wcd939x;
-- 
2.43.0

