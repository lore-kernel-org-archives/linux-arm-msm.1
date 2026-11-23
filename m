Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432101;
	b=tniZ4++HKoNlzO7RNvstcZM7XC3Nr6TB1ACAKvwWKO6C6g/dJNMYZn1snz1YfJoYB06U
	 fvYziUoI1MYBbbQl5QW2dGdKcN2JRzfjaO1WQb9mG92Nfi0fPBBaJB+tXl18Kq3b0+iyd
	 VwxC68PyDf+F751A4fRKItbx4wQUe4Dv4a2NpoKWmS0SH/vt4QQDdKZ9cZKtDwVEAaZfh
	 J39rkSBhL4Ew3sFeogUTgCbl6/F0b/b/jTymfzDHvyoR5zA0NZ5dfRzYXzJOjCikL+0bU
	 8GK+Ks67WqaGstMRf7KRrP/pyUGaDJN8OONoWm/FzBGi/S+eHoIolSMsIecEvIC9yaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
	b=zq0736pAM+EuQQcrlWy+5J1hANaw+0zKZjihq3wd2Dvsy5ppcr52NbetP+QoywiDo3cX
	 wDiJ1EdTU14qj+dwbNWojzHGYCsjEBV9YmYjum4o+Fmxvamqz9cfLlUPIY71MKN4s17OT
	 ZX9qZFzLjqe27u3Vbzwj5e+0V/l3IkS6eWetov1ZjNGUKvXkQjZtiaYNf3Rj2lPDrWQkO
	 ti22TxecxT1mGPHx952wo169KbqCOb2HFkhFLOygNLXHcFYWHtuUHuKqUhi137dhrCufy
	 uMkLRYz38ttQgHf2Gi8sLW0lTBR7ZQ/9dU4VpHR6kiK14M+CM7RQEsqLn7WBkfij8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC15606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC15606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so3510956c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432100; x=1796036900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=ec3UFjGzf+Ax+mOyj+jbqDFmxv1s+/ilYTPPCkCGVgYuPO3q35DWB/+HRF/Oz2sLvL
         3aQyHI6tHe6HhGEfoUlt+RPLm8ZWtFcdQbDy9jO3MlFzg7xTHIVOcfPEQcIPxRIAVWzQ
         BZ5lRfv4aUhyVlfNm6x6F94Qj4rbgapEOVaNaU+0o+/9/9iRZAOfOBG6MpyGxIQUt3xO
         ALHIZuvHue22QtQ81fiHVBB+0KkjfYRpS44nsn1Fob4Ikd3/1INTRshst8/sQFb0hzRj
         MAVu9TNdZwo0izTaUC/5fX2acbHZrF7RzdRbrdJR8h5+MxGc+rwHlVjLyFEt2n4mkv6k
         t4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432100; x=1796036900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=AxHpJnzgiwxNjIF2yPWZCTXm9rRB/Qou3ksqb3jGgO7kvzqmpCEitXhYOTkFtMrGkZ
         XhjHw52mclU8r5F1WH4BUFS0RnDLRFqVYgKQeaaFIHYS0WrJlDVza7roVuGrASC79hIp
         sODKPG4zT5/CKtjKjj/pahzWAOvumO6o8JHZ7Ze5aGYtijZDzZOh1Vg7U2s+fZpcwIlj
         YHC6XIHhFlHxqG+QCr4a+gJ22GrrX32aymIV8Uu30pkrqx4reOYdYOzPDfa8FdJNY5Mo
         V5+hh6Z9Wd/VQjb92s4ZlT7yhZ/QeBb6mySAof44rjGkWnmdpSuLTLY7xh2nDST8DYml
         bVtA==
X-Forwarded-Encrypted: i=1; AL+hErFoEUX7XSe1nScXD6iKgZF3g1lafH7qV3xrWEYLaZTu/5H9/zjmYkqWZa2WDmEVEpDJwJisvt8LrAtE23Qp@vger.kernel.org
X-Gm-Message-State: APuU4Z+z9zWCRPQgGTvYHLf3dkklqyQ0p8MRh82TaUBEBKWTOC0tYq5S
	F/m+dVVXskT/8hSkykUwvSLd87Oe+EV7c6jQmd1awcl8ebX7STPs9Yx8
X-Gm-Gg: AZFdTZe2j3YpZ/fL7yH6fzRV717S+e8yUbweKXh44C1K5PNUnXvRkK071XMkd3WNeml
	JRlTtAhtsdGbRelBYwFrd8VV/r/90kQ6kxKI9UubEtYSgvdOTd/abuiKPaDOGkhncBGF++wjAtO
	pMXu+qvRwiaHaLebfM7Y+EYUUyay6muHUwEID+29tYwGV/0gvRM0qPjA0UXaaxkWrwejvTzWS8x
	dRH/YCpWParsDli81khEEXHDairtFro0W5DBnkce5/hIHNTSDkubn1trmjCWH23a18/j7CjOj6T
	lwwcQvHIeRO4DUMi/8cL25rt7SLrT4iieu9mEAaJF2opXlQDK7waM536v7hRtwczZeiXmLutSRi
	c+EyFcv0sfMS+VCP30WsNpMMz/+d/0xR+22OodMb8KsP7bTsryRHzs4grYERvFEG3eGuuTdRnpB
	p/q6o5jZ/t6Vxd+22Y/jlbaoJ+Fnt+nyStDHmgVZfc9fq0+YbgTfxcjtHqo1CvYta15KcWIgKI1
	gX7SbB1BXx1gWX/+ufOLLNyUOtGqU3O0+omRdUgE1RnyGex/2igZOPlWZYl7UvS1n45SuFKQZ/d
	0ZErH6WI2hKa5hFzWmxFx7fTnQU+OllNiCHe8BVblOTqXQ==
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id a92af1059eb24-1b56f87ab60mr3863029c88.16.1795432099526;
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:07:59 +0700
Message-ID: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

This series enables both the front (Samsung S5K5E8) and rear (OmniVision
OV12A10) MIPI CSI-2 cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot):

- Fix the 100 MHz parent entry in ftbl_csi_phytimer_clk_src so
  gcc_camss_csi0phytimer_clk enables properly on MSM8953.
- Add Devicetree binding schemas and V4L2 subdev drivers for the Samsung
  S5K5E8 and OmniVision OV12A10 CMOS image sensors.
- Wire up CAMSS, CCI, CSIPHY0/CSIPHY2, and both camera sensors in
  msm8953-xiaomi-tissot.dts.

Tested on Xiaomi Mi A1 (tissot) using libcamera SimpleISP and GNOME Snapshot.

Hikmah Gumelar (6):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  26 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 8 files changed, 1581 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

