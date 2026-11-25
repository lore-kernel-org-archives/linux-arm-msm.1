Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609953;
	b=gBZLbubmtIVxKFHfac9G5OjhcyVkUvZHxkQ8iRjgWpwkt1RfV4NSN/h7hqMViCyz9PT8
	 XJW7MmKnDWhp7UAnP+qIvOL24kDh72wruFVzqg9X35iVMlnv4CwzejimvUpCD6M2WTVfq
	 PZwDlmPZnb5Ixfo+iCazz9rgBIcTUxU5K0lCC9iRK2EOHl9ALm5ErsKvncnrjNrRjX89t
	 KYgY0E99SIQh0/CbxT3DAzNLIyCt7mmJO7m2Cq4F+QWTFJtyCuKFFNsEY2TtDPo0/bZtz
	 LE7pBCfklP+DonZlaH+Co0aX06Qkbg00ei8bQZdargoOdVrn7eQnM1kP2xheOyqrA5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
	b=ML+51r0s2uqeRurJT1RVPrROoYtD1xuUPaPogIHC1ri4jU6Qz8NXLSauTvgl87yrN3P4
	 nKQyczsRDBjH3bhakYsPq7+YPxhmH5ekvovfbxr3htLsCDEyBAphK+zVAUhT4IZG1bpZU
	 jDoz5zbrDtK0nQCsw8gRvSDk4Qijfue3zWnlidYLynEgWo9zjaiyRoMHefrg6wHwLMCx6
	 oSNa6QcwrI/XEYUOE0BV+yzyTqUgQJm9xQc4QCUoGQVNVWpsGKcipLhoSjwlG4qp75cR7
	 TfplgSbGE2eJDDlPjSB0d2ZwRuQv0aXLfrAfCRMSRDHO4SBaPSRi4xXubxKvuDaQbCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ppjk/PHX";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21533606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21533606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ppjk/PHX
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b413997581so4469414a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609952; x=1796214752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=Ppjk/PHXaFf2xFYnTBi2dflKcU0hPvBRvusUu56u+X6FH3/D7MWrpc2TAdElIndzie
         r5b5IFSr/FZecCaM4clvxCwNoPcyYCygW4Koc8jqu16fbHdPP5dNj+f2swgSkZUuugCS
         s/SADxoPwCg0kTSvzM+rCUdOzdhHnBwOs2YfOqthL3g5i8/CoSyc6hLmvarCkZTahFTm
         s2Qr3l1l67VnUTiVAahMxc9jHO4cyRjmiWlR6Rq7ZUl6A9f1iACWbpvHxkVIw4jnEEpg
         oJHTRzVHAKJ302EvQMbmkA1aqM49jXXVkKaOxNi2ML0YYdIPxip7PQknR2CUZFawOUun
         6ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609952; x=1796214752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=xDtiNDjR1/ywCLXsvHf9xDI8QuGmtRgDbSQ/yfGnMXmPIerkyMqxjwwc+yxuO0ZIsa
         xsgxSdn8oEFd5EoPMmsMkTf32242kubAze0GUHhnPvcAnr0Ld1B3oUyqG08YV8gFu3Wt
         8kpdV5CR1kSLyhi+ij8Ej8bSfaAco1++eMOGq97PWCYt3ylyv+xuXi5qWE1eH1B+N8KB
         /yB6enAno21dRpichZqCrEZAiA/paIIpn817Se9anisz5aBUn9esv6TWk+gVuuMcY2xy
         VvO3Vhp+ITPmgRGwPBCiFMBsuCNoegwx9Cyhq/sP9wDfhZpSHvzQwC0pInXQlQs1S+KM
         aRiw==
X-Forwarded-Encrypted: i=1; AL+hErEFlMovmastUjNiB0oqYhrOjbSar7UzI4BFoHVxVJEHIgxBgkBFkLzDWHwJ+S9KSpOr+TzX56PKzu3QQpzM@vger.kernel.org
X-Gm-Message-State: APuU4Z8mK6Nta7VwBSNkn3hJ6Y/a1uSPk0tavAIqkDW6xWTFOoRRIzdF
	poe6Nx26n80b9XEAg4eeNihQ+Gzf1sn6MKqe7/0IFad3QJBfRSnrCK6d
X-Gm-Gg: AZFdTZemH6TvQPeZLyNaJ1XAeRfONBioGvAG+p9HUR/IVtjkBFRRoLszrz9si/z8/8Y
	XyR/EgQ+eCVuQNjfl9WOYg2+9DvSGv5RtQwCPMtK2re3eKfrMKCaMGoByrAfVlk9YopjCbdat51
	C9J1btJfOG9crhejf9tYtZ+5iMS9gKlSEGutsNfajDIfNgFMfZN9PZpwAJNAem+7WMrlnaRtzYn
	lu8rYmbs/l0Ut0l8avsCO243Cjn/wjPQxO1q17Hb3vEY+jge46S8ylxqwpz7+YVG6T+SB7/W9/l
	S45yT/MZ8Xty3RjxZCa+BkGLzp1IiieCAi/LNB5eglMpGXHWQerOk16m7ulQ++XhGUKnIMlaJRD
	rcSDTft8BDe6t+Md88xBWG3zvokXMTOSLXwanNCGCUZxeIS6jFNOUiTgsOOQLoq6HWMCeyN8bSz
	C5Zu1zW5eQjun0a+0O5VImzBfdSiZ8dASkJetF2/pSW9s5CEAoiIgYsqL7ChoIsnGf/JMk9RBjE
	ZYXftCBDP2BLI0EEgtTW/GFOuUI1W35EWy3NGhHA5ArU8N7JGHHNEdEHvD4XIiRtwkrVSfTsyhv
	p9TcXQ4fdDSuVF7luKEiaKQSu8eubiIUHxuUQgHIKssz8HV5
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr16172380a91.54.1795609952223;
        Wed, 25 Nov 2026 04:32:32 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:39 +0700
Message-ID: <20261125123146.379057-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v4:
- Wrap all commit descriptions at 72 characters (Konrad Dybcio) and fix
  all checkpatch style/alignment checks in s5k5e8 and ov12a10.
- Keep CAMSS CSIPHY0/CSIPHY2 data-lanes 0-based (<0 1 2 3> and <0 1>)
  to match legacy_phy lane_base = 0 in camss_parse_endpoint_node().
- Add vdd_l23-supply = <&pm8953_s3> under &rpm_requests for S5K5E8 DVDD,
  and specify assigned-clocks / assigned-clock-rates (<24000000>) on
  both sensor nodes.
- Request powerdown-gpios instead of pwdn-gpios in ov12a10_probe(), check
  IS_ERR() on powerdown_gpio, drop vana_gpio, implement .init_state,
  add v4l2_subdev_cleanup(), set BIT(7) on OV12A10 test pattern enable,
  report 12MP native/crop selection rectangles, and validate CSI-2 fwnode
  endpoint and xvclk rate.
- Use pm_runtime_get_if_active(), check __v4l2_ctrl_modify_range() return
  value, keep post-power-on delay unconditional on reset_gpio, populate
  full pad colorimetry, and reject active format changes while streaming.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  62 +-
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 760 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 9 files changed, 1821 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

