Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437361;
	b=SAh0WaPDaC5/LEbLMPchh2OoIwpgHgKYyXXPnbsQ+v7qaQrJutnIkoqBlzWChkN8YEUu
	 22TYzsRL1Hq2tNYoLY3/bZJFue45rBgC4aV4zE8i+PWNiQ2k4dXKc6OIq5qBfS0ETrybC
	 5KhA+nAdSndYAL3/jdpsIVqEHphRLPr5LgSpysTuqMVFWB0dYabdXSSlkM9Q0pUQQePlA
	 YpeyzYQWMJq/Cau2UpFxr1EIxpLP4f2vQJ3DdlKoQa8bnYZvKjK0WVvUuJq24AR18br8o
	 4+drGo4PAJD8MoY/W359+XQcJS0YA4gUvkm9GhgpH85epfCBCDH6Z3Zyspw5CbPB3bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
	b=FgrW5Tb6F686etc3hGtoYAPi9o7J2srdPrmKIAS9b+2H48/uDAds/zVvUFKV/qzjRgc9
	 x+H2Jhm9qlqpq2Z4WbbSmIWQaOioYL1KqL9kzDlxQ100JIkUSGnD1LweFJ/o1Gqky+tjP
	 TsYSPSfSQtWqnMl0rSRs55o6xcnQmQIGC0QhUQGKY6E8b14qQjcXli9rGJQKxPIV2oH3u
	 bhj16f25bVhUA9OateK35/7fqw1CF19p92WHiSNxW7BNVDDYWjcelCo7d6MDigo2e643O
	 OPZtsC+GnLgmuliqHWIiNz5iBcOnT2DngwbNy6scETF5RSxtnhY7Zu+mRPNmpEAhgiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C223606A33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C223606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38431138772so4119352eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437360; x=1796042160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=QTqnQskKRIE1cgebk3mNS42vnXeE3k4W3M13JDorM8JvXmThQ7ACiYCLcu4VK+bQ9V
         g9layI4Geer0IOQZSMpwe9SmleQDj3GdZ0xBTxfRnNCZcIoDxaN4eMTAAQcEORsQ0/80
         tii9DA5HDOBumdveehsPOCePuj/xeFzr+6lGzKrTexMPx6iaf2QQaouV9oVfECfX4GbR
         tktf5MzOOMFFJmCl5KCqs0BusxJIYl022a8IDjATdmIUAL2jKzvhtbHQmBqgFV+QyZlp
         5QUGCEimTBcZ/hVaYWkKucKZXfSp2wPr67biq8Y4qw8gmMngKzfe9Z6+Nfv+VVPoYlOQ
         cPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437360; x=1796042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=ZaElS4t3yV+xo6uogSVb87eymdvR0cOW/jgV8fCGFIBe2H2jDt+LXkWuU9911UO+Q1
         pPkzo8kflimqeMmgnI87CVGpK1/9eI5i9C5YTLN193RXlpsJ4s6mQ4XeMjk5Mi8TnHzX
         hBosYswxeAjqU5DcObJxtZ+shIz9rsb5mQ+Ve3tDhl2TwKVfgTm61Dn1fq/gzMfJ3eYp
         475lBciw4YaFkoFRbPL4Gpa0cl87bOrAQN8xiMnPGCXReSR4Wth9WHJenVw38t3dlMSV
         arcZiIIZyMMQJ4507nQJFjn8Rg1xmxoDYXQyhBYaUYDNCaYpNF81B6imDSuC2L3ZtMyy
         HYvw==
X-Forwarded-Encrypted: i=1; AL+hErF+pzBEXyANXvPV3NzVyYgZ11g1pOXblJFj9h6sQ1+W1u/eYi87q2kjEpCZhf4BEBg3xJdC3MIyYW/lByUC@vger.kernel.org
X-Gm-Message-State: APuU4Z+heBTwxIIdKrRUcDbQg6KnRZRyAzytcdqOvlzOHOYtmacK3eWd
	H2pjQhaTLyIy4pWhXfdP+EUeZ7c9x3MOtDMuEOW4+EyI19OnXSfnTCrbrLjW1fyAdQ8=
X-Gm-Gg: AZFdTZeGHn2PwitYDvSYSKAvLn9nx5INqf6chDdT1zuELUe96uX83YbvR4N62YaCfMG
	cE22AAfdHQBeN/klxQ7yj5OsJA0uOZ7CsjhdKC94rQDC7j3BC0B8B9DngfJ7abtwOPDX6KnTcil
	u5xAVcuT0FBBXPHVF065TzJY2Qx6vxbtJOImsPUjSO8K363bG3dEMVqweOFIqR1NWvcyMsyXkuL
	G8x14gEeNVB19F/dOoUs4qalsMkBsiHnin1GxTkG+O8A1jdLgvP8fDCWLLcVrsJurKHIhnoEtwj
	X0r+sLUIPydGbsh2B0/zAcQRBlFd9Mya/f4O5vYT84msu5zrIJ3WaWjjBadmqPKo/hiXpLlmqXv
	QL4mVRzbS1bpoAGOiouHZOuzFGBw7Yf97yK6Ymv1TIATzUE1eUvS9FP5P5Lx0mBOTPdKtYk4xIK
	SVNhxDSr9pIjxaDl482PrQQby/aUhOjbWxONNpxJSRqC2K3nZyIE0MQGQ83OaEkNbizPv8AxnN+
	SnbBEC6FcQDNe24jPMTfep+Z1nNlO4NqLKVYpfU9X8yLSJTlgkpF1Gf6yKdjXSXuTiAP/lLlu3d
	scpunwUEOrgCzXYPqYEO6C77YKjW8DSSeeMs/meFuspMNQ==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr6531336eec.24.1795437360084;
        Mon, 23 Nov 2026 04:36:00 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:35:59 -0800 (PST)
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
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:39 +0700
Message-ID: <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added the missing MSM8953 SoC CAMSS node and MCLK pinctrl states to
  msm8953.dtsi so the board DTB builds cleanly on upstream.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 155 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  18 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 9 files changed, 1728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

