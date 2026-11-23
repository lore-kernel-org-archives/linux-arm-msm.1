Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447675;
	b=PSBkydazFhimt3sis1zAZmLDGTcQSn+ObS35xZuQZRoYNJ2AF90hG9TckK7WLh/Rn4Xq
	 gbp/N5k5kOdkKxmXbPS9bQ4s6uPDKBgNgo6s4lvWQBrWoe+qpPuTvBINrKslhaAtackMU
	 8X77Nd1JsKJiFgE2OPRkXiIwWVDaolP/szwHPvlZaELGOE5G9e5piDrREFAThPMgYQ0f9
	 gGT5Ituc7NfBeSdGlo+j82Bhp0u/+oCQsq5ENhgug8SqWC/XejILc+1YlmCWQxDm3Xb1Z
	 sxuYLc/kUqLi894QhPQnV0l58LJfLOi8NXKbp+wShP+O0NAa9aRGnz/xcktYUMj0YrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
	b=0XNVYiRSQFaTkALmU9S70JKUXsEGBw3NboooEuPgvtXMUnEENf30ikJrNmfDNG31g6EN
	 XCsrr82lGo82v2XIVOwrIWFeTJt65L/XGCighiqp8ZR7PuQh1o8wUX1uzgaks6EK2pbLi
	 f97FEs18pkNaIyr8rlFMLEsSdbHRMkYOQ2h8CzwXrZH1PPxWC8/9G8WPOoIUXTSAKR4Yn
	 pO4IjR6+Lh6R84oToyOCS2dFy/UAryBuK71bVaIbiaReWsNHRdfSOAnN3MTnQnnUWAH1p
	 S1SyX6ENsZjKe8atOM4ErS9qjxXvd4qvVR9dLIRhKRvRCTRxk79hl4fMs0GmN663qGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18394606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18394606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38699cf08dfso3296893eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447674; x=1796052474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=cWUb1R2vJjz6q1bHmoPN/LqInvTMfkVUHJM4/GfA2TcN29DOBUjjq8PtpXn5jaj5AL
         93lxc+XMTCtIQ+iYvqkvAWdBYKVc7/OGn8+41OgyJowmRjEGLTX8UIqIv1s8UCJfmqYk
         AzomVOu58i73iY/MROCpGxPoHo9igrRfdDeNzrI7OKLGSbfrXrSHUTMziEfZCM9z8r+B
         VBQ1n3AmEHl3IwSJ1PcxhZuO78OiBdcDPoAv+SjwCWtQ/gu8RB9cWNYT75p2l7guU70D
         nCeDlvuXjJyXpdv3FcZFxsnRu6O3lmeDvcfcQmCKaOw/FgBK1982jNY60Awlp/F1GNiH
         cwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447674; x=1796052474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=ImLTkTrJ8bc8bcMzdCYA0PMsgbb9EPLlUj43rgVFE1TH6wvquueJmN5BsalfuOv0sX
         w4RsTv1VrCCk6o8g417ASev+mXgWLR0nSRtZNLX6Ie9+pLIqhgLOwCfKm4aeKrNSYdV2
         FZBCt5vIpXeB+mh13jSl4vijY5BOrUP+Ti5rFNHvqvoxAqK8Wvw5bK+WQJ5nLVb/XD5P
         JbVI3Tj73PEIf3xad2sDKq8dEpcAs3VzOS24aEQFgG94vykBb8xWkgTQY1LvdfPW6Th1
         id2pBrKLm4K7B53QwbmBwU9ePgblT0jPXqeKhERWtq/6BU7VNX+iGtZ4E0m23w5Nx49i
         Hxug==
X-Forwarded-Encrypted: i=1; AL+hErEvViEjsEFB+0m49ZuBZMrr9CsCdKxsHQcEfK0GJpHYbUtQtEmXJw0pzIAFPu6VobDhds4xruTI8/MIHfjF@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pou9VyYE+vfl6vLS4N6mDdSvpt7e+czOe+aGUz8WFVnSV/xI0
	/JdLES1aDvkkn6N9IrW8M8lSpoSqB7S7QC7uaFw15Wzs19gxjIOu1sb7
X-Gm-Gg: AZFdTZeMe0dEODCxFtrR40mMHK+LIlAS6WCsLiHZOmhbutHsv9/pybCxF1saCktpiiT
	P9VUZYpLdaQohGMiNl4ciydnYeMBB22p6NI3Lw1AoCJI/DLwX55XzPCGB5LWE8AdMFGaWKVeFQ+
	IXQACtKcDozKu7dL+f2oMbHvXB1cbva9IJKNXxTw6As9MIj57ZRi7Rls1N71QqRMscE9mnZ1aTx
	XF3ttq3VmzGRcvFvuOAxfOZrgxyK866FNIwpUyzFGy2LZci8n9bq6G6HKGgn8EVZU/UmPMhn7Rp
	deO+iPYFxRG04n0eq9vMTfrku83AWlrDBRNsCXkBradeDdd+r5+YjRcueAhFVmtwL4vlvcDq6Yi
	0CoDCEDuQsx+6/U3chj1FOEOk3Tv+J60A6NHW6FedUzowStWGG8rpwV+LCcuXjYHV/YnPYeiAln
	HJbS1WxPmH/YrX8rkyk2rEw4HUnlKIT3At5XiJ4/FnG6WEsAKL70iKjdybjfKRDDshSWZpSguQn
	jpWq6/P1a7jutOwFLo6C7J8JNmJn8RbbVMJOONpypUnxR5equr6Rq0+0Hm24ODmf5La0gGX6yaO
	qwrhNVqSdrHmo8GN9AP3tkZXKmExVl8GVrSBhpFpfDNV1A==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr12093640eec.29.1795447674020;
        Mon, 23 Nov 2026 07:27:54 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:53 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:15 +0700
Message-ID: <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Changes in v3:
- Add Fixes trailer to clk: qcom: gcc-msm8953 commit.
- Fix $id and $schema URIs and switch MIPI CSI-2 data-lanes to 1-based.
- Replace deprecated pwdn-gpios with powerdown-gpios and model GPIO62 as
  a fixed regulator (vreg_cam_avdd) supplying avdd-supply.
- Drop unneeded <linux/mod_devicetable.h> includes from s5k5e8.c and
  ov12a10.c (suggested by Uwe Kleine-Koenig).
- Fix runtime PM ordering, pm_runtime_get_if_in_use() <= 0 checks, active
  state initialization (.init_state), v4l2_subdev_cleanup(), exposure range
  updates on VBLANK change, test pattern enable bit, and endpoint/clock checks.
- Drop undocumented interconnects from camss@1b00020 and sort nodes/pins.

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added MSM8953 SoC CAMSS node and MCLK pinctrl states to msm8953.dtsi.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  22 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 719 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 555 ++++++++++++++
 9 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

