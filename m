Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541549;
	b=ArlSV+JyRrKAOFI7lP3qK+jHLEtsc2W+yepHt0OGI/aUZk3PAobP+fXZlTt6ry+cBmGC
	 8BKvtud2ljlyaFSAeUVbYCah6ZzjRff4eT9UfNgK9WKrDD5CzXZtxU3S3GLbMqWd8542T
	 kgsMqOgpNW8NH6F1lwxG1txeC1cJiS/zUkQIjojgZLEQboaVPAcdqSkcv5mDHyKCzONci
	 MA3iVZOojtNc1c+69UiKjobQBf5X8TLLPScCPDr1DXfKayse6+Wtx7IUDaKSL98bcUIk5
	 qpZtP5RfcQloIVPzHHhb00BIHRjPDpuKcKSfNOZ+cgjd4ytdM2rfahMRUgOqEaU7NtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
	b=phsD+G/qKRCVq5dPGBEJwxat1pKsEtOSTfZLsqISuddUvQP1vTudxbaNDSTlEtuIkefa
	 POjvDnOQCcwHS6JCU/pER3CluMfDQMJgZrOrZlbALXh44B7kU6ntwlhSaNL4hXlKXsm3C
	 HQpoUnn0EQKoxadLh9DKcF5mNq7eYnAqotMGUINf7AJADKtQcST8EOm9tK5HtQqzfIi0u
	 AOl3CIQZIeyLUlQaYrk8vhk5a01sh8ENy4HWjjDsZ7SMw6R7OT6o1UaDDE86bSE7bnmui
	 UgXCK5G7tu31rXveAiEuY50f/49cc77A/XYk/sSUG5IV4aX96mTX27eooUa67C9uySQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA6606A337
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDA6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a32576da88so2798961f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541547; x=1796146347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=CAzlwEmN9dC0GaiVbvr6PRQMqbM1riHbYgXNkb53ws4oCaBivG/BoCh6bN1Sw/ZEHC
         w07Y5Et6b/7Vwgw93y8Zf9iNg8vLY94qHeb9zERCMCMU/gbsQk7eRXSLhop7B/BBXFbo
         r3kXgiOfdeRzVurOJekr/lfLMZ7bJwhUHvdi9zx4ADlaWpCBE6sElkHpP0oMyTGVk78T
         JDa9oMJobNxa685jtKfLjKFNv7bgE4QDUJ2lh6gVwAGC/sIqtAtVKPd/R6WShfIj97bK
         k6JI+94y8BtWCVvlCbOJcO/Nwmuty1yIT+ES+lJlj1cfMDmBNSk6+eqeEPHGwxq4uT2h
         5U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541547; x=1796146347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=E93K2JqSrQA6bO9G7F5CBFHSasMXDx3Mn9iVPNqZmepv1JC2LPgxgEYzEfbVQ883t9
         ZBmyyJpRXF0AdYINCz+acVb5+NMa8L24ajp19mWBGX9dBqByMB3lOPPihy5t1Kir3E6K
         HJdyiO3E2KwR1O4xeK5+4qdcNINjvvbnl3MEiecyY4CDFsy6aUhNE5QioIeQt7sUXlaq
         2hIhBTftJNnwGWa2OMkuqsIQ0utyLEMpB0wKR882ByjtsfLjytuIdoQacNWh35YwTt1d
         5uC3nUs/pS2nWmzHwWiVmJCu/rlkMoNG/rUg6I+Ws2mB1gg9kQfhw/nbPcdHYRmEaGi2
         tTQQ==
X-Forwarded-Encrypted: i=1; AL+hErEfYUztm0ch9CY4CTSdd+aGcURZTV9hnBER6n6F3vnWczuJJzRSkvTwjE2YY83srRHlCjlsyGbbBU0ICJsU@vger.kernel.org
X-Gm-Message-State: APuU4Z+ttQeq1sNfHGvEmQr3pJUBy6ySGmynRS2vRWbMARYG7uU1kNGR
	YERVbt9+pyBYhPAyiSvMx+Mc9AKs02LmB+Fkql0rotLKx8XxpgUZFGncVhybP0Z5UCU=
X-Gm-Gg: AZFdTZedHB2f6oad0rzmVTNVK2J8Q+hemA2UW6vMRmK+3oQittlM/qruqHX4W481ciK
	cKCriYg04rFgrlgyHXY3cgCLkBIlkirTOszWG76UCSJkxGToy4wF2evtTVv0pBlzrcJbx1TvXnE
	N2yQhg3jrEMaI7CagEUQM++t9AbOUOvU4DDyhgtX1gV7RD+RrtkSa7v3qrdzCZ5+qD+cc5ECB5f
	m+b92PWoZJxn9bUX2EPT5TtaeTlKLM3ikssjVJ4G4IjHPX46s7ptlA02qBwOdgnycRMlzauc7uh
	VKNMbzYfERjKLDWozkt5vOuW7fEdoP45hor3Fg6djcgHxaSnQxc4Njv30CBRNbEzzrxETHYqEE0
	7rJVJolfmgKOJ2i6IT/WozAPAjPU2xx3tXtWNGgX0Sy2lP5oIWyYfKo5COZvi0T0BJUo4tetVaj
	XTWT6k2yCWQF3uHQpTwGWPobPYC1O65i69lTo6khdxPaLz0veyIu4ds8C/6CMmwflqrf21obq0s
	TCXWDeKDcYvOZjoMbHEeHGTyvwc62kA7zwJiUrtRoIAPSIJtciX4Z42YSXuq+f8JNEj+N9aYstb
	r8ZMip68pXA2In2ct9lSIrvbMPP3Q+BbFfwYAjlvza2evIpnZQ==
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr34327691f8f.44.1795541547074;
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:14 +0100
Subject: [PATCH v2 07/19] ASoC: codecs: lpass-wsa-macro: handle the macro &
 dcodec power domains
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
Message-Id: <20261124-topic-sm8650-el2-v2-7-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hVFg3Y31Ispb6dIhV4lKOW6ZJCfvIzuJH+rNG0A18RE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcod3y0YQ0h2BUQpIM4apyqk8yOgOGlztGUy36oe
 7e2JPcqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHQAKCRB33NvayMhJ0Se7EA
 DFos36gYy4RYDRa7R1O6n7gn3ZjBST+lXq0rc+BtlYRhQBkv+plvM/fdkv1vhFxFcAL3LMJm26pgg6
 EAc4ea/zyMm9nLe9JZyBXI6R6tXmPSAmnPfA/pkc1g+26Bi6HDrv0w4qYPDemOZ4TR9ErrHRlxZiZu
 mpt2Ay4r42L0T5QF0jszfiuoqbbFFNGNiGzfHH4Tg0br95tQSgrAQBQx0RkLJR1s8YJfxUpEe63yof
 SC4bjrgMa0Ahd1TUkY6pTmdg+OKqeokhbO+Q/Fx/ay0lrjEHJVMytyAXvxH+PFZY2iyjXS/y9jhaF8
 VhOvgz9bAIx6y+fvgPBlsT7Dr//jgYQ7DswTbC/UxeDRt9LTUo4Mj+9atQYvyI5jyPcfTpcamZD7kK
 w6cWGJvKV3dh1t+oG9+UReA+HOfaoaTxhqTRKBcawcNNKXZPJBAfKylGj3lepPQKcOr355h5x5kT54
 1i9QipL2N1hlE/atQCVwnJqBXhn8CLUitlCjTufD97ldbJisg0H39XzrNTkk+7vYdzMqM9EbVnM8X8
 DLDZFllX1fV2ip2iOIdk0cOgB8X+pJgjDWJqUG116Z2A/oTam9YlFZUMurEh2KcRo5TI3JTrI8Efsy
 URFlBGIaJG7OAI/gE5gHeOFA3XAzLGZtxhSz552Lx6KQ/360SRc1kHU0qUFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the WSA macro lies
in the LPASS core and audio power domains like the RX, TX and VA
macros, so attach and power them with lpass_macro_pds_init() like
the other macro drivers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2b63954f783b..254b8faaa8a1 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -419,6 +419,7 @@ struct wsa_macro {
 	struct clk *macro;
 	struct clk *dcodec;
 	struct clk *fsgen;
+	struct lpass_macro *pds;
 	struct clk_hw hw;
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
@@ -2769,6 +2770,14 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->fsgen))
 		return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
 
+	wsa->pds = lpass_macro_pds_init(dev);
+	if (IS_ERR(wsa->pds))
+		return PTR_ERR(wsa->pds);
+
+	ret = devm_add_action_or_reset(dev, lpass_macro_pds_exit_action, wsa->pds);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.34.1

