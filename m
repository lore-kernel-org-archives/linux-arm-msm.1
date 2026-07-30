Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3325B08E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433491; cv=none; b=T0ZK5mB46xEarCa24VVN3Ze5HsRG3Dc0wrBZXtRxoKolBwEQRRcNfiojZ3Msqh0B4SlKmbwt+Xt+7XIvmZZHA1V1zkQGm4o1aJeI5KLiYVKpHsT7RsPYunELLOVjnWDclW5El55UbiVXfRRcsIUSb7Ghk2csApUMIYMf7fu1v4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433491; c=relaxed/simple;
	bh=U9ruiKG8BUet4y5SMXJ85IUZ4ZcxH7ZHnAkIbV6ctLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esv+yFApfLy7Ia0i6mdTeJEs/0UeMeqhfoFfjr08Of1j9PpW7vBnUlKvKSBeGuiRd/mmrpMaSm9YE1Lb/7wnwSXEnHcEzJdtIggn9dfYwzYXzSyD85MIGSPw0tpqffGso1AiwqfijmAwwB165SZxdwWmyTAY2QSH6lmUO1yMeDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFcFM6f9; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFcFM6f9"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8efec2c28f8so1121006d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433489; x=1786038289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIKrZbmn0dmbQK0M7SnZZ7cpkCa+iExGrnzVunMqg/Q=;
        b=kFcFM6f9eD44sq7P9aINP68yHMVKgALnGFATheYUHIHI3aMgcnVlHdnR/L+2FQy/fc
         DuNwWWKDQnpXhdWYbBDKfZeuUMhiO46nr5AsAKQXr6yQtgdkpvKmBkPrHzhJNpITenMz
         KcAzmyOf6AwQI+V/x+gnzuz3jQUHfwgmFxhgO+qzjzmLBlGEvV4wucxWrxVZLesfScQS
         6Wo+QUTFPFll1fzxT2u0coxBkPsM2Iz5RbQ+43oP9nLWQfPmuPgZQMBMqhhbJzCkAU2D
         YamrhrMysYgUq9B/J7Z09P29uS3kJnw7EHS9IBUTxghNyRDDERNvVy6LxIrlHtMJwM3s
         N8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433489; x=1786038289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIKrZbmn0dmbQK0M7SnZZ7cpkCa+iExGrnzVunMqg/Q=;
        b=fmzmxBHpjZu1kfaoR2l3SyOTXkrQR3TpgkDjo1y0F0b0X1g3YdptwwomU85PWtir68
         nBCE8dYSrv5mRhZ1DS+4bm59SymAC1iM5+COpvTn8bLLKvmMfK+7bPIhvyIaOa9Sxau1
         UY65ilcmYb8K7TeXIeHIa6gNSPhYFtTMPni4uD40EjKiRzg2z+17MEnPVGAMR4ioINq7
         nOSLCBiA8QI1f2yAbTp5K7RXP77m6Cv/+TTa9hWsW2AtfNAykl6IP4UM37NhiR+VVXB2
         OSKxZ/Mra9G98rjXMclDvbqE76h4e3p5kD8v+srAmUj8AZsVkFgYLhNQNhib6TPEKAD4
         aBmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiNmQoT/dAclyZ1E31rqRu7mITSV2d34IXIY9NKors6g40pxMDzY5ZB6fyw8S6xE4EbsRpnje1yav8vFTw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5c8QBwPip6kvJ50SRZteZVH+sYgYhNuZKQyQlN3NLr+ACZYeO
	oVbd1NTiUAJRUtqFpby5t0f4zT72YX2qHbXwgRZZgOCz2ZnRpIw8SHTI
X-Gm-Gg: AR+sD12WzFKebDyuiC/CVu5+IeeV7B5ynVv2UhtTxBQdFgT8jWvQDNpRDFtsVkSN4jA
	7H3wzMOa8S3pZRDubJwXUgtvPZFa+N9M6YV4qgze8nzDrkykruGmQ9P8I6oow/Govf295nHC9Of
	9x9ROQvuEbMg71bPJP8hp3P9hPtS6hflury5NMOWOnNv/SfcszxBfHlT0YxLRSkKoRq1IcyzsTv
	eqkXj0J7MFwZ1CHmIvAEQJg/ZsUgEgIzChPCIs/rCiohBLXT6EZTUM+b3fSZgNWT1myZfw6zPS/
	1fqoAECtJMrCRhSNG3jtCVxw1ZoVfsTOFxghemX35gvZg/5TWDtYOeAX6SpqlXvtxNpJ4q8/SO2
	ON8bnGoEN7iG5h4NuKzAw03gAJUmNnhhjOI9RE/y41jxbSbVCGWepSwBPDOBfQf2zNkNMFbA4ne
	e7iitjfjhSXYwVKVD8Pnqs+Zd7dcVcs86yi4f7beROMznFTZ1aUlT8eTDAs4s=
X-Received: by 2002:a05:6214:dc2:b0:8ef:d38:4303 with SMTP id 6a1803df08f44-908347a9984mr37217086d6.44.1785433488735;
        Thu, 30 Jul 2026 10:44:48 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908323e8b2csm22400356d6.23.2026.07.30.10.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:48 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 13/15] ASoC: msm8916-wcd-analog: add pm8950 codec
Date: Thu, 30 Jul 2026 13:43:51 -0400
Message-ID: <20260730174353.108023-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Add regs overrides for PM8950 codec and implement matching reg overrides
via compatible.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 52 ++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..13df60409857 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -232,6 +232,8 @@
 #define RX_EAR_CTL_PA_SEL_MASK			BIT(7)
 #define RX_EAR_CTL_PA_SEL			BIT(7)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
 #define SPKR_DAC_CTL_DAC_RESET_NORMAL	0
@@ -250,6 +252,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,6 +267,7 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
@@ -286,6 +290,11 @@ static const char * const supply_names[] = {
 
 #define MBHC_MAX_BUTTONS	(5)
 
+struct wcd_reg_seq {
+	const struct reg_default *seq;
+	int seq_size;
+};
+
 struct pm8916_wcd_analog_priv {
 	u16 pmic_rev;
 	u16 codec_version;
@@ -715,9 +724,41 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct wcd_reg_seq pm8916_data = {
+	.seq = wcd_reg_defaults_2_0,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_2_0),
+};
+
+static const struct reg_default wcd_reg_defaults_pm8950[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8950_data = {
+	.seq = wcd_reg_defaults_pm8950,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+	const struct wcd_reg_seq *wcd_reg_init_data;
 	int err, reg;
 
 	err = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
@@ -738,9 +779,11 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	wcd_reg_init_data = of_device_get_match_data(component->dev);
+
+	for (reg = 0; reg < wcd_reg_init_data->seq_size; reg++)
+		snd_soc_component_write(component, wcd_reg_init_data->seq[reg].reg,
+					wcd_reg_init_data->seq[reg].def);
 
 	priv->component = component;
 
@@ -1259,7 +1302,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
-	{ .compatible = "qcom,pm8916-wcd-analog-codec", },
+	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
+	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
 	{ }
 };
 
-- 
2.55.0

