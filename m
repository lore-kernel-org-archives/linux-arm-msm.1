Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541555;
	b=Ex+4TULAFup7mcLnbsgnZ5gzuci71Cis7jm7TKKAJPoN60ZKiwBj+hOsXPHPNkXj5DTg
	 vvJITFCwVx2znB6wfXywplgcj9CDlEPh8KWwpxienTWqr4O57XC37/sbLR012w+NkkafC
	 RRCZbaAGLglAosb2YX3G8L8RrH9lYGKt7nQQTyCQgZqeA9rV0IWu9Z7bHTqH/V79wCPlB
	 JasY/rQ9+jMq2MEDlHU8CDqoY4Y25uF9vbiNoWNkaxIDg7A1muNO4fnjJMy/uDzlaRqJU
	 xxFw9wAaZfGqRwMjcvDzwtsrqhvAhx9U1gHxo4L91E8o5tmEND+rQkyR7nxt0LPb23w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=P6N6ygAF05bd/ckvqZwLOE4OwnPVHmVc1nseSliCSrQ=;
	b=u0oGvTQPnP5Rfomw4LClo5QjPvlFnQhEclFk7LFQsBiZyaOdh/It96g/aMJoFVWKhnqj
	 0NmNmoj3mYxeB/r3ju7N8L2XmEi7VdAwt4eUzv5wyCAdedZxx1GQQQaHnj4sVYYTZq26A
	 BNbcPxHb1OkPRYyyu8+4n3+eDRv2eAWcaSbDm7I65NqfjCFgiBGexB5VoY3A5aSFvvlaR
	 NBN5101DCKfa3OYdPFpDeg5DABNgHan1SOSCIGC1qQARxbyFJ36NyLPUJovj9558eg0Ly
	 v6GngOqzpqbBX3hp907FNVhUfeIM8QcLBGOhGCVtJfy/xMuyTF/Du+YWVIEGgYaK7Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vbdGCBaq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F160A6F45
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D74F160A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vbdGCBaq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so47475415e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541552; x=1796146352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6N6ygAF05bd/ckvqZwLOE4OwnPVHmVc1nseSliCSrQ=;
        b=vbdGCBaq1o96l6JE4VOEbTQzlCDUSoOeE5L2vGDLrxjfsVRcPiFx32NBePZ87/PBZ6
         F7hFDd7nqUBaoi/0SaZ8VoE0RqG7euim01+vN6dRdBSlX67XSWlFyfpq89lYXab4mgZc
         R7yK4sznw2RL19HrE9spO7kojHq1k9i5YsU6thtiV5bCMwkusYD4iH1b1Db+I0EH35gm
         YRlaDLYmvX5sFcTexzsM1QrbHNZhvMbWgR8l6PdvEFQbOkJO0D+LGg9cZEZTLcKV6PBX
         kP0z3QmnmBmiSPdKJA9Leh9X4q5NQxj5BmnEFtUlXeoQZNR2AKk0o5e4GfZaJQMby/dL
         uodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541552; x=1796146352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6N6ygAF05bd/ckvqZwLOE4OwnPVHmVc1nseSliCSrQ=;
        b=I2DVadX6Zo9vihM1hUaQTPY36A3yfS+lH1Lio4rF3XGmkBIoLZTvht1+52qPZatBby
         tXAsveRfQ6O1N3R8+qhED3w9/9X73rwCX3ew675NJFzZ3K9neR1QuGKmFfAT9NO9wjnK
         ZPl5ddJVPiRaKMK4wxf4IZy1uwXwA0ei4XzHb41jjLwPtY/JvMWrAAmg11zssVi9oLc3
         ruxJYJhsWqZgjSN6BG0GfES1ljxx0IDyNrmSutWJpvqLeCS8CRy7feldG45FUrM5n6MK
         Wc2ibtFLocoTs57zhPt/TzrRcDhcfSnpKmDBXw7tu0EmHwWiyquJsalkjQC5g3sPrEdq
         DgUw==
X-Forwarded-Encrypted: i=1; AL+hErEXnxP39CY1OW353SEcNAtlalIfP8eBCMuGQwwcpTo6K3n5+p5awOHNFlg3wDeMlkWuRn5SeIC8r3b1q3aG@vger.kernel.org
X-Gm-Message-State: APuU4Z/f7hcO5yItBZNet9KOx/PrZgl2bu5P6ePUPoKI39CkPtfhKnhD
	+Z8l3BZcszRgGjstFM+viPOzLzHtB0sVfaKO69x6QdEZQoeOXBRHheSKZk1t9L2M8rE=
X-Gm-Gg: AZFdTZfakv7TikIh7J432yHBYv57tEJ7FY9zPUiS8eKWuURqoFdPWOINrBOJ4FeIlQ9
	kVQGkFGXktzsZ1/uUQCb8LGVQBIaGBcv6i+RKmOhRbFE1NxjlxFAwua20cpkdGcCvCcOpUmGDMG
	Xl5tufhkzNeG/3TWPbNO7rRcSPmWCpmQilZT01kubp0s6NbpJLq0YX5b3PIAxnswLIblynVRAON
	Vpy+zDyjEfpbPkyCwKIKW3q7AJtoHTQ5Y8v9HhzkhlWyZnuuoUPBFE+d5//+mn52gn9GBHv29O6
	TuRiXqOuEvsEmO+PgMSTaU3IWDw9mmxCQpIKOjHanYYXTjVzbcOXefvwTKtTAJUWX7qQGKT0pd/
	ILIgluo4hJXJcxK4XlqUqNZU66uZks0k8LXoVEVK25pV5YLT5xz8W+lmc83FAjU83JtIRosrPy5
	jlJEYaKYPNZItbdaCRg6LJ3Iz6WhE0WI3AcCg+aPnh24hlmkYPCrOgZG7oRKoDm0p6rkzQ3yOtv
	Z9GeiJP/tACqybiWGBFTJ3ilSRfL99f0AKHyPYzXZzARlGHNonKyETQGHywVPKLwC9zqcxFN+e0
	XieYrIaBbGtK3MqXgExvJKmYNKodSbiLNGjnsm+u/GdQd3lNiA==
X-Received: by 2002:a05:600c:1d2a:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb88814031mr382042025e9.28.1795541551984;
        Tue, 24 Nov 2026 09:32:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:20 +0100
Subject: [PATCH v2 13/19] ASoC: qcom: lpass: support mapping I2S ports to
 multiple LPAIFs
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-13-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8503;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hUCDddeV1CTw9c7KsqIaVt0dW/noaYzbb49yy8pbzDA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcogqM7wSCwumWxNx+x/cqGjZdwLhoPAYi5MAZFn
 OCjq/HaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIAAKCRB33NvayMhJ0cF7D/
 sGYg+JAKhbyxDnMAfQNFL/mmYYW1T8ZOG34uHA2wdpiLS3jRBHEjV0Coa+ojugJnnI7i1dFuFWDN8U
 dDRGuRjkc4ZqRwKmSHU1gtWmakwr0L9Zn82WIPFdK+t0NmsVQaYwdd9dSytYBvGUbLfzoNUovjgeqw
 Vsx647+3z1eGGg9MI0ZOI87hs1RkMWKzjXfML0gOK4ATq2fZi372AaHnfe/Xt0m8MkR8FK0HDXhyHX
 F5EafviHim7MCXt11HKuIpoTad+7h58W9qRHn6TwCEL1/vnO5TvZIlJoLN/lrvk/7bWIqvYuFwK9KA
 39fkcENNYIzpjsHSwoeO/tNKQ9YwXzBhtteZ3f72LXrrpjNRZea3aR4L8NcB3g2e7UTeSLPP8PniPS
 MelAN/pA83eiwPZSFgReCTxIwAba81lMvwkoFpm1ibfYdIF3Ry/EEwh9IihO+ckkjOkanO0T2HmzMm
 BerczS4mqlVgvQCdIpUYC0RYytZ2vxR4R7hC90PfZzr4NzXDCjo/HbcEwImF6QP0ca5UvoWOdQxb+5
 OgEF+ufrTL942/xX6z5pQDtCtkA7/4OlSDBuRnouTrvE/pXtYqHnfgupM/Dj2y16cTDHbcOqvdddkm
 b/EFTzor38G+aZNThMqDk8KuhGEloZ9u/pgddcHV8Y8kEhzB+epexZhIReYA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now we have all the plumbing to support multiple MI2S ports
on multiple LPAIFs, add the optional descriptor and parse it
to probe the associated LPAIF when defined in the DT node.

When the descriptor is not provided, the behaviour is kept
as before and the 8 MI2S ports are mapped to the core
LPAIF.

Since an LPAIF address space can only be mapped by the MI2S
handling or the VA/RXTX/WSA handlers, if somehow the DT
declared some invalid setup (I2S port on WSA and WSA codec),
the probe would fail.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c      | 79 +++++++++++++++++++++++++++++++++++++----
 sound/soc/qcom/lpass-platform.c | 27 +++++++++++---
 sound/soc/qcom/lpass.h          | 23 +++++++++++-
 3 files changed, 116 insertions(+), 13 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index b4620fc99e26..902ad6554510 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -436,6 +436,12 @@ static int lpass_cpu_daiops_probe(struct snd_soc_dai *dai)
 	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
 	int ret;
 
+	/* The LPAIF is only initialized if one of its ports is described in DT */
+	if (!lpaif || !lpaif->drvdata) {
+		dev_err(dai->dev, "LPAIF of this port is not enabled\n");
+		return -ENODEV;
+	}
+
 	/* ensure audio hardware is disabled */
 	ret = regmap_write(lpaif->map,
 			LPAIF_I2SCTL_REG(drvdata->variant, drvdata->mi2s_intf[port_id]), 0);
@@ -1172,6 +1178,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			data->mi2s_capture_sd_mode[port_id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
 						    "qcom,capture-sd-lines");
+
+			set_bit(port_id, &data->lpaif_port_enable);
 		} else {
 			dev_err(dev, "invalid dai id: %d\n", id);
 			continue;
@@ -1214,12 +1222,33 @@ static int lpass_cpu_init_lpaif(struct platform_device *pdev, int idx,
 	struct regmap_config cfg = lpass_cpu_regmap_config;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
-	int ret;
+	int ret, i;
+
+	/* Only probe an LPAIF if one of the port is described in DT */
+	if (v->mi2s_desc) {
+		const struct lpaif_mi2s_desc *desc = &v->mi2s_desc[idx];
+		bool enabled = false;
+
+		for (i = 0; i < desc->port_desc_count; ++i) {
+			unsigned int port_id = mi2s_port_id(desc->port_desc[i].id);
+
+			if (test_bit(port_id, &drvdata->lpaif_port_enable)) {
+				enabled = true;
+				break;
+			}
+		}
+
+		if (!enabled)
+			return 0;
+	}
 
 	base = devm_platform_ioremap_resource_byname(pdev, reg_name);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/* Keep the legacy regmap name for the core LPAIF */
+	if (idx)
+		cfg.name = reg_name;
 	cfg.max_register = LPAIF_WRDMAPER_REG(v, v->wrdma_channels +
 					      v->wrdma_channel_start);
 
@@ -1340,11 +1369,25 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		drvdata->va_cdc_dma_lpm_buf = res->start;
 	}
 
-	drvdata->num_lpaif = 1;
+	if (variant->mi2s_desc) {
+		if (variant->num_mi2s_desc > LPASS_MAX_LPAIF)
+			return -EINVAL;
+
+		drvdata->num_lpaif = variant->num_mi2s_desc;
 
-	ret = lpass_cpu_init_lpaif(pdev, 0, "lpass-lpaif");
-	if (ret)
-		return ret;
+		for (i = 0; i < variant->num_mi2s_desc; i++) {
+			ret = lpass_cpu_init_lpaif(pdev, i,
+						   variant->mi2s_desc[i].reg_name);
+			if (ret)
+				return ret;
+		}
+	} else {
+		drvdata->num_lpaif = 1;
+
+		ret = lpass_cpu_init_lpaif(pdev, 0, "lpass-lpaif");
+		if (ret)
+			return ret;
+	}
 
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif = devm_platform_ioremap_resource_byname(pdev, "lpass-hdmiif");
@@ -1376,8 +1419,30 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 		port_id = mi2s_port_id(variant->dai_driver[i].id);
 
-		drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
-		drvdata->mi2s_intf[port_id] = port_id;
+		if (variant->mi2s_desc) {
+			unsigned int lpaif_idx, lpaif_port;
+			const struct lpaif_mi2s_desc *desc;
+
+			for (lpaif_idx = 0; lpaif_idx < variant->num_mi2s_desc; ++lpaif_idx) {
+				desc = &variant->mi2s_desc[lpaif_idx];
+
+				for (lpaif_port = 0;
+				     lpaif_port < desc->port_desc_count;
+				     ++lpaif_port) {
+					if (desc->port_desc[lpaif_port].id !=
+							variant->dai_driver[i].id)
+						continue;
+
+					drvdata->mi2s_lpaif[port_id] =
+						&drvdata->lpaif[lpaif_idx];
+					drvdata->mi2s_intf[port_id] =
+						desc->port_desc[lpaif_port].intf;
+				}
+			}
+		} else {
+			drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
+			drvdata->mi2s_intf[port_id] = port_id;
+		}
 
 		drvdata->mi2s_osr_clk[port_id] = devm_clk_get_optional(dev,
 					     variant->dai_osr_clk_names[i]);
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 48d819356aea..16a964e1aec1 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1370,6 +1370,8 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
 	}
 
 	for (i = 0; i < drvdata->num_lpaif; i++) {
+		if (!drvdata->lpaif[i].drvdata)
+			continue;
 		map = drvdata->lpaif[i].map;
 		regcache_cache_only(map, true);
 		regcache_mark_dirty(map);
@@ -1393,6 +1395,8 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 	}
 
 	for (i = 0; i < drvdata->num_lpaif; i++) {
+		if (!drvdata->lpaif[i].drvdata)
+			continue;
 		map = drvdata->lpaif[i].map;
 		regcache_cache_only(map, false);
 		ret = regcache_sync(map);
@@ -1463,6 +1467,10 @@ static int lpass_platform_init_lpaif(struct platform_device *pdev, int idx,
 	const struct lpass_variant *v = drvdata->variant;
 	int ret;
 
+	/* Only continue if already initialized by lpass-cpu */
+	if (!lpaif->drvdata)
+		return 0;
+
 	lpaif->irq = platform_get_irq_byname(pdev, irq_name);
 	if (lpaif->irq < 0)
 		return -ENODEV;
@@ -1494,12 +1502,21 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 	const struct lpass_variant *v = drvdata->variant;
-	int ret;
+	int i, ret;
 
-	ret = lpass_platform_init_lpaif(pdev, 0, "lpass-irq-lpaif",
-			IRQF_TRIGGER_RISING);
-	if (ret)
-		return ret;
+	if (v->mi2s_desc) {
+		for (i = 0; i < v->num_mi2s_desc; i++) {
+			ret = lpass_platform_init_lpaif(pdev, i,
+							v->mi2s_desc[i].irq_name, 0);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = lpass_platform_init_lpaif(pdev, 0, "lpass-irq-lpaif",
+						IRQF_TRIGGER_RISING);
+		if (ret)
+			return ret;
+	}
 
 	if (drvdata->codec_dma_enable) {
 		ret = regmap_write(drvdata->rxtx_lpaif_map,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 4407996fb145..70d64bf3f073 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -20,7 +20,7 @@
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
 #define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
-#define LPASS_MAX_LPAIF				(1)
+#define LPASS_MAX_LPAIF				(7)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
 #define LPASS_MAX_CDC_DMA_CHANNELS		(8)
@@ -148,6 +148,19 @@ struct lpass_lpaif {
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 };
 
+struct mi2s_port_desc {
+	unsigned int intf;	/* LPAIF Interface */
+	unsigned int id;	/* DAI ID */
+};
+
+/* Extended LPAIF MI2S layout */
+struct lpaif_mi2s_desc {
+	const char *reg_name;
+	const char *irq_name;
+	struct mi2s_port_desc *port_desc;
+	unsigned int port_desc_count;
+};
+
 /* Both the CPU DAI and platform drivers will access this data */
 struct lpass_data {
 
@@ -184,6 +197,7 @@ struct lpass_data {
 	/* LPAIF instance and interface index of each MI2S port */
 	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+	unsigned long lpaif_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *hdmiif;
@@ -498,6 +512,13 @@ struct lpass_variant {
 	const char * const *dai_osr_clk_names;
 	const char * const *dai_bit_clk_names;
 
+	/*
+	 * Optional LPAIF MI2S instances layout when all the MI2S
+	 * ports are not available on the core LPAIF.
+	 */
+	const struct lpaif_mi2s_desc *mi2s_desc;
+	int num_mi2s_desc;
+
 	/* SOC specific clocks configuration */
 	const char **clk_name;
 	int num_clks;

-- 
2.34.1

