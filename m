Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581D44682A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433473; cv=none; b=S2zMBnPrb5FhKGc3CpDI0hw4qhIKNzOupjAGD1+ojgcow/rctmqlVctYOK3B7P6Cm0zyWfYdUGzg6w90QMoilBPo92htb8B0Wa6s2BKvlKFXxCofByTQP82DJpFauVbvJVxYU1B8Ee8oeUosAnzXVR+YB30jydpHwyVId6ULA0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433473; c=relaxed/simple;
	bh=73IAudJNTbnO5JjtmoDOA29U8lNo7HL9BzEOqJgGiK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p/frYkFd9ZyiM3pTjVyTEio7ZA2UCmzggc+48GHNohIYOwsYIse10YrjTqPLMBvODSRfb3kB4rb14yL/RhoiOYs4sbD/Bqh1o9FMvTBR6Ji4LijWJqh0Ekyz0wgJWAmZFdJ0X4J89wBg33ywJ++ZAL1rO9znD4n41ERr3BU0q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YL8FUADW; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YL8FUADW"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed3993c1eso7250685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433469; x=1786038269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=316jUt2/Y6I2iJ6QUffHRnxSTcOP4J2RgEpichI2UbE=;
        b=YL8FUADWxN71l0yfBJAWvjMkFZSCConXGSpwBSGy8M+fgZCe5kCLOITfTjix77qYM3
         C8Zj0sc31MN7k5NVhIaFgJ3xmtar6MpkITQ9+lAFS6Thk0aHm3w2qbNNI7D5s6nsMz+w
         rv8PcCgd9iE0VA6JpvuyQDMFk82kwxooYbBbFrzkAYBauTuZ9F4P4ZIQK+zTIjf4MsO7
         KdXR2p6fgtjZgvU2PSV6APG4MxwNXOxHeWVBtNHwDdaYceT/fvb1xQAcbtJzqzhDUK9W
         kvYsKGRMXHhQDlm3M/I7ZRqCogGZNmnCKvTPZ2jNpoVt8rNER4ahJDCy61JcxLGUbtPL
         Q7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433469; x=1786038269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=316jUt2/Y6I2iJ6QUffHRnxSTcOP4J2RgEpichI2UbE=;
        b=OD9yHTvyBtLo3rQURssCdpQn25ItDMRerOX0/ajjM2PJ7thkYNDASlJmlg5SgAgbqp
         Pidqa+X8uXQrndc9kjCbekv+fKHZD5MbaquwstPP86De7PuFeFjC3apwPQrNUG9x/RWJ
         hO4zSqG1+s5Lx7UkBn1pq5v9FG/j2UgKgOnlQsoYUaHwUoTVzS3tt3S8QQo9tOfq875g
         7BaZhnad8Gf+mqmDylfsnw/aYqVRR7vxrqUVogS8U6X6RZA4iRA9IM/LfbrWaKJ4O0Tw
         K9DUY3mwGXK0lhsBGTkJz0CjkMBxNaUrD0SJPsPE5qC3X90vnPQP1n0+0Wl9xRovuZ/o
         beCg==
X-Forwarded-Encrypted: i=1; AHgh+RqnSbGg+rdN6YCv7H0j5mxkkJaQ9fbLLMtv1IdRVZs8uYMRouJp95Y7VSPsPYQbiBXFRh31TkHQv/Vv8CAz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Gjafga8J4619cOAUQnTO0O3G4PthCKQNN1NcMiiaG7M7XVT1
	q25qAhQO+RASYPjPhO0E25lczyWxEr89eoZX/O4+SRxZ9b4Y4vlw8AwM
X-Gm-Gg: AR+sD10W6XVQG3kdObGccLSs66PJpQQxMqQAwUle3k9L7APSbRR4D9a4zDjBMwul6K1
	/zLTAkHyc2LVdMjR2BI/8twp0ykZWMo8MLdhuSraVgAOQk/v2xMeDy5zNedJHpOuQslF1RbmtFU
	55qiO3ToS2pI+QX1KiKPaZcsdmJ5+g7wd00e+tPhWF5XSxygU650aMd1NU3+19l2V9Ljq0yuj0P
	/HxfDfzH4Pb96Wy6pLlAqU01eeEkz3FwleK6goslOUU+UH7dAYpcH8BDF+1bFlfbNZMpeXh7bFx
	mP3NYYN4KEf+G57TKTHAoBzuF/CihRIg3/ZQWOr3U7m1hXzTguR6wbElr31J2g+y/Qr3Obvn3hH
	j985WwFG5e3qhNfz2wYsOk9RIXo3tGBzyBzsNJkFKTq5Ngpq/8GlW7vRPR+vmmHLFcRAj9Kda+R
	kDx/OcXVsvhWdCKzx9xKBFseq4ulmF5vAezQ2ZTjFtWEBx6s6/XMgG8RuF0VE=
X-Received: by 2002:a05:620a:7081:b0:92e:c116:bef5 with SMTP id af79cd13be357-93487207fb6mr406589485a.82.1785433468848;
        Thu, 30 Jul 2026 10:44:28 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733e17csm466107785a.36.2026.07.30.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:28 -0700 (PDT)
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
Subject: [PATCH v6 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Thu, 30 Jul 2026 13:43:46 -0400
Message-ID: <20260730174353.108023-9-mailingradian@gmail.com>
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

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the internal MI2S ports found
on the SDM660 internal sound card using the LPI MI2S bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..920345609d2c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,8 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+	case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +667,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"LPI RX0 MI2S Playback", NULL, "LPI_MI2S_RX_0"},
+	{"LPI_MI2S_TX_0", NULL, "LPI TX0 MI2S Capture"},
+	{"LPI RX1 MI2S Playback", NULL, "LPI_MI2S_RX_1"},
+	{"LPI_MI2S_TX_1", NULL, "LPI TX1 MI2S Capture"},
+	{"LPI RX2 MI2S Playback", NULL, "LPI_MI2S_RX_2"},
+	{"LPI_MI2S_TX_2", NULL, "LPI TX2 MI2S Capture"},
+	{"LPI RX3 MI2S Playback", NULL, "LPI_MI2S_RX_3"},
+	{"LPI_MI2S_TX_3", NULL, "LPI TX3 MI2S Capture"},
+	{"LPI RX4 MI2S Playback", NULL, "LPI_MI2S_RX_4"},
+	{"LPI_MI2S_TX_4", NULL, "LPI TX4 MI2S Capture"},
+	{"LPI RX5 MI2S Playback", NULL, "LPI_MI2S_RX_5"},
+	{"LPI_MI2S_TX_5", NULL, "LPI TX5 MI2S Capture"},
+	{"LPI RX6 MI2S Playback", NULL, "LPI_MI2S_RX_6"},
+	{"LPI_MI2S_TX_6", NULL, "LPI TX6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1028,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1091,8 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.55.0

