Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595117;
	b=VOpgZltQEUzPLGTZJqVkrG37HgYq52fUMRhImvkbgR4UzaUm9mAepWQdfuBGrOjaLaQ6
	 SNq1xBMf89O9uzJBVPiuZsIbfn3r4SJHjziu+t+tuj8VLtNyOiPUUIV3DGtm4PRZMLRQy
	 D8TSle02zLjvYH/huFsxy3XJKiaNlLvW+vpcl4B7/QXuQ9URJ0rFa4TXAmYxUMTv1XFm6
	 JFaTyYersSjHRNV5mBJQf+FitmaxMIsOTlie4d6V7QV16oBRH+rE1+at61K5LV5ORbxoI
	 JVpFTDARPzk7ISaCkOz69t8pyuVKX+VI9hxJnxyA/FftoqoNprXnVHIoXFXH1JRJ7bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=w2uTsZDSakSIiYfZCZm4T/XmbPQKfvOaN5W1vDGvmkk=;
	b=N8xDH/ROoYo0x+B6b5lYO7U+deAd8NC6UdsfHgsUUn+KD69ufRiqFXSmma9igJpG8BvS
	 HZUDQbJETsysaPiRroD/wpSyJ42Ig3vmaaKeoGuXFf0SEUTyeaZVtOO4yRjdTjaQm2sQC
	 gPPSzvV/gsnlwLqMxbrWb8dja0WrRWRw0Dgby5u+DjdV2csy462RonAXTvhdQzM60P0VN
	 5BOYRF0F9qKMvNlPzL8falyD+D3rqA2tbaMADon77eA4Lsoo58yd9rnku0w9+RwzVGqFW
	 ZDIVgsc+UO2Q0yXkaVi8fJ/dCNCE5kMXBhayidDYrvIoYYhO5ysGMkNt5b3CLJa0+1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BxjxiFJr;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139ED606A657
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139ED606A657
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BxjxiFJr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4922dbcee23so617851f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595115; x=1795199915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w2uTsZDSakSIiYfZCZm4T/XmbPQKfvOaN5W1vDGvmkk=;
        b=BxjxiFJrM+M5Fan2rzxhw8amdOeFldpsV6DZ/IqNYozeMs26pNhTUj/YiYfbcQg8Ib
         MRpWEWwoEYOE1pCY/0smk6YXReJWHtI2r0lBvX1Dk+JHpW/Jrk6353E+gC4j07ku6k30
         F0HqHzeO9rqzBvRFq1eUR4gDM7M/U8lGaaOeI5+FXTbPBanMMxpZ2H60gmxJV2nNkD+o
         SC+jA1h5YnEBEReCxRHCYXUGDxWMx+1YteqgHtpWPCkFpwpcCKIfvaRAuqJtTqJlQsD5
         G0RQUPWGpigtC2esCR5zGE95T2V2/CnozL42iBKdsys/Yy+ccpzZKet/cYfoyC8pggDV
         BKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595115; x=1795199915;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w2uTsZDSakSIiYfZCZm4T/XmbPQKfvOaN5W1vDGvmkk=;
        b=ULn+fNfOEH8vldULLXL6r+rCmBcvvYD3Yb1RqIt3DYwHcTAf0VK/7tGPo9Pafdhj81
         v3oF/ZJTtqcMXt74GYHjQw1HaD9e7jiLI6cx6X8hHwFezlee74NpdSZkscFDI2xe1kOY
         iQkDrYnpE034SmcIF6zIGW073cRY43sTUN+6ycEpT5LFZe/18VVBnij2BTu2AW1ARMw7
         llypdNGb78KhFSWQXHT4bvOxiLpt4f3TF/vbT3mSpk0g7pqtmQpiogXceXNnm05FDNK7
         m0H9wep54zg3bfNQN2/pThVHdVnf/JJalmsz/Ldi/TaW1JUgipiTFQ0wPW6VUdxgSQWi
         8XyQ==
X-Gm-Message-State: APuU4Z+jvtCXbksj7OEXOjDXre0tyq+g1XO/84UBPGTpFhYMJGfjJh2E
	ZTkBJ4jb/vNRCmVSd/7qzgBp2BVz1suDBk8msg/Zi+czF2d8W8iopvh1PkpDT86EV3A=
X-Gm-Gg: AYBFou309G3FlPANGWXkY5/MnbrPOoyQEpsuudCU3WlvFUDJlGQb1f5WozkDTODyNzU
	yJaMqPpHUGFCE2VAIKgRlaetfkuE6ug9SyuExu3a9Rl2boUx1NdH4gyQ01J7Dt4MXlCUrGcxxfo
	DI/H7KP4P1jQ8Lar5tOy07x/B7qK8AkbIZKiHVgn1FuiQMHhXaON9ZHEHc/SKUgMLguIL2DAKgg
	NqnVmn1VMp98HCdi8X2yRTpWDvTsX6SWMKT61gJZMf9DHKMKWeQnPmduuptsflFmlLUyFmveVYM
	gXl8Tp05VkYGvARws7cTFGZN2Ub5zkjQ9EOGy1JZCk37BRYRVkL7f0Z9YpKyI4myz8sI7FgHMks
	UqfgiEswsCz+s6+OESp1BKwsrgdS6J/SAYhNisWhYJex8XbrOD/d9MYXvexIGCATKkf5iqlZtEo
	uNy8oDZ+1k2PtD+mreSizbTztnXFqkLeqVVRnZTmZGDDUvLzIkUOMjcdeJ/T45IXrERojUXKLac
	5UIp9FNEcvlG4g70wXd6AH0FE2UQ1pYOsDkbwsOeCCVw1vHEUgU/zzuPyrjfJHXym3lDZcGoapB
	zdcMZUIauLriZMYV6aF1ORVJPl5liEECGtH/inm2EjQBW9ep3fs7JUtRiSskOU7P
X-Received: by 2002:adf:e008:0:20b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-49c71e3e1c0mr5943328f8f.9.1794595115227;
        Fri, 13 Nov 2026 10:38:35 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 00/23] arm64: qcom: enable SM8650 audio without ADSP
 firmware
Date: Fri, 13 Nov 2026 19:38:14 +0100
Message-Id: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABZZ92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3ZL8gsxk3eJcCzNTA93UHCPdZLPkxDQTI2Pz5ERzJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUAxccrKHkAAAA=
X-Change-ID: 20261113-topic-sm8650-el2-c6caf4237ca7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nNsA+r5juXKjiRcSwoHtRAKZZ9Tqefl8bh/M49w5Yxs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kct6ILQiiCLBdkeOYZBX88DapotPq1jQSJmYtF
 TxO++kKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHAAKCRB33NvayMhJ0Qt3D/
 4ypug2YvyBD2m7gomADVISy/gSHyEitoz0M8hnoOG086qtlX7QAs3zWxhG9WDSNbqImwU0LbZFHgo7
 Uiyk5KZ7aUvHg7L8sW0OUiFWbTDDmx8ihF6GJiJm4cPsrO3PaBMQcjca4eaR29JjQafpKE9u8rSPbR
 UaxgAiGGeAEqEXcK8muyQuUGBJOdCL6o9o2yNo7ckfQDg9K5HI3mDkcdD0er4ax+pJ7aRN1ZpB993R
 nZx15WZ01xd8vtp0jCd91qCzL/B832FQnwygf6Lp2zwbYElCarQ5d7wxTWFMuJOLJ1vHhFavnXJxb1
 FFZW3luqvZAREglP+Q1o05SO1N/H3Y3aRFyf/ob9+KPVt83xNSk77jrcSyx0stAJhRndbnMNZOFyPs
 zbr6V5N0zL4BMFw/ye18a8UpedA93NeohI80VDEfnYwjTHNC5H9GDc0UKBNHK7lJxoMyc3zvDgDNmd
 OYvbRhzSbVZFWbcNpWVVo3SXFEPolkQBQd8+1ZRnZ/j/XyoN/8F7HyPTYw2K7vAdh9NclY2fbo34Ma
 /N9qBQqqVvf93PL9mXQgWMNwuGPM1y8Ki/YKzcaYHBhB+wLBuT+nyeajeJj7X5CGI8KVIzCI9CsV6V
 QiS7q0nqc4VDLj8TiY/mLqSNNFgCPGexp5j6CQi58uspXjJgw38SaaYve4Ww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset adds the necessary plumbing to drive the SM8650 audio
interfaces directly from Linux. This is required for boards like the
Valve Deckard that boot Linux at EL2 without the ADSP audio firmware,
meaning the audio interfaces must be driven directly by the application
processor through lpass-cpu.

Without the ADSP firmware, the LPASS clocks (MI2S bit clocks,
codec macro MCLKs, LPM memory clocks) and memory zones must be
controlled by Linux.

To support this, the series introduces the following changes:
- Bindings: Adds dt-bindings for the SM8650 LPASS core & audio clock
  controllers, LPASS CPU, WSA RX/TX channel ids, and Senary/Septenary MI2S ids.
- Clocks: Adds drivers for the SM8650 LPASS HM, core, audio, and
  AON clock controllers.
- ASoC LPASS core: Prepares the lpass and lpass-cdc-dma drivers to
  handle multiple LPAIFs for I2S ports, allocates and maps LPM buffer
  memory for DAIs, and adds support for the optional WSA interface
  and Senary/Septenary MI2S ports.
- ASoC SM8650: Introduces the SM8650 lpass-cpu variant and allows the
  sc8280xp machine driver to be used with lpass-cpu to keep sound card
  bindings working.
- Device Tree: Refactors the SM8650 dts to move EL1-specific Gunyah nodes
  to a dedicated sm8650-el1.dtsi. Introduces sm8650-lpass-cpu.dtsi for
  boards booting at EL2, and wires up the speakers (Senary MI2S) and
  DMICs (VA macro) on the sm8650-valve-deckard board.
- Defconfig: Enables the SM8650 LPASS CPU driver as a module in arm64 defconfig

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (23):
      dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers
      clk: qcom: add SM8650 LPASS core & audio clock controllers
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
      ASoC: dt-bindings: qcom,lpass: add Senary & Septenary MI2S ids
      ASoC: dt-bindings: qcom,lpass: add WSA RX and TX channels ids
      ASoC: dt-bindings: qcom,lpass-*-macro: document less clock when ADSP is not used
      ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
      ASoC: qcom: lpass-cpu: get the optional codec_mem3 clock
      ASoC: qcom: lpass: add support for optional WSA interface
      ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
      ASoC: qcom: lpass: prepare to handle multiple lpaifs for i2s
      ASoC: qcom: lpass: add support for MI2S_SENARY & MI2S_SEPTENARY
      ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs
      ASoC: qcom: lpass: support LPM memory type for I2S LPAIFs
      ASoC: qcom: lpass: allocate LPM buffer memory to DAIs
      ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory
      ASoC: qcom: add SM8650 LPASS CPU driver
      ASoC: qcom: swd: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai
      ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
      arm64: dts: qcom: sm8650: move EL1 Gunyah nodes to sm8650-el1.dtsi
      arm64: dts: qcom: add SM8650 LPASS CPU dtsi
      arm64: dts: qcom: sm8650-valve-deckard: enable audio
      arm64: defconfig: enable the SM8650 LPASS CPU driver

 .../bindings/clock/qcom,sm8650-lpasscorecc.yaml    | 179 +++++
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml     |  20 +-
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  17 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  20 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  13 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  21 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   1 +
 arch/arm64/boot/dts/qcom/sm8650-el1.dtsi           | 775 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi     | 222 ++++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  85 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 799 ++-------------------
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpassaudiocc-sm8650.c             | 777 ++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sm8650.c              | 509 +++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sm8650.h   |  47 ++
 .../dt-bindings/clock/qcom,lpasscorecc-sm8650.h    |  30 +
 include/dt-bindings/sound/qcom,lpass.h             |  24 +
 sound/soc/qcom/Kconfig                             |  12 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |   9 +-
 sound/soc/qcom/lpass-cdc-dma.c                     |  47 +-
 sound/soc/qcom/lpass-cpu.c                         | 344 ++++++---
 sound/soc/qcom/lpass-lpaif-reg.h                   |  51 +-
 sound/soc/qcom/lpass-platform.c                    | 482 +++++++++++--
 sound/soc/qcom/lpass-sc7180.c                      |  10 +-
 sound/soc/qcom/lpass-sc7280.c                      |  10 +-
 sound/soc/qcom/lpass-sm8650.c                      | 651 +++++++++++++++++
 sound/soc/qcom/lpass.h                             | 198 ++++-
 sound/soc/qcom/sc8280xp.c                          |  16 +-
 sound/soc/qcom/sdw.c                               |   1 +
 36 files changed, 4471 insertions(+), 992 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261113-topic-sm8650-el2-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

