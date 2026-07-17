Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC03F9F37
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294676; cv=none; b=RD9jWQicqclhNBW88+xOqGgpyAN52cJXqb4UTQWMwvD3EGF/1j5kkWEbFNWTkjPnMDHCr/JKjxDAKywvMDfFPVo5FUqLr9tBqvqCmbKbF1kawlr67Z2h+vWpTDu0YVsuIIQmO4DsC8mtDVSF5+6tn0ZWzlzqgA5Kk4QZAmtw9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294676; c=relaxed/simple;
	bh=Ts5q+kqfTaMNJiEIyTm/ek2bYOkWkZ4DPRtDh4ZAplU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qAVJrjaYW1U6kJbScCjwpGABDnrTH5xS5xpCbVcGylqfq6ef3TnifMS/jtOQnxpumsVXjRswoyoAPC1aF2AGej7H/CF7xoSuYxbvbkuhU0weyJYJZt86MuNdbb1kSOEW5Y/Uk4AW/0MMHv9nXa68nE9+z91+qgrr097SC1wPH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA2Gtdfp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA2Gtdfp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954afac04bso5364935e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294672; x=1784899472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ME7NziQ2ShyFM7roINztK3fiLXBSO/S0bE9HR7+Zss=;
        b=hA2GtdfppuW0e8X/ozShJcfM8MfeWXRYW6fh0ZWvt8CI9ikvxy6AbZnejCzxDAREMX
         BjVwelppyw6Qp9XUFZIaIDLJuDkkGjeE/jvTY2dUdzHUmByFeZtu3K40w99QYk/R7uDS
         nJVMZ0qkDMO8bas+CGx/ilty/py9ZaHIC+rk8wESkOIcMsIsZ0LSFU1fbdlwxeJ4wA9B
         ILvWUWBd4corXQ2RE7t128Gd4VSN+uZ1Eb0RbuqM66b5q4ZeRyFr662SdBgU/mMIUS/x
         Vvil+cyMKZ4VP3qF9NG6S95mwJHaIVc5zirQrwiKKqrMVm8hMigJeVLvoSBBG1vhHj84
         VIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294672; x=1784899472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ME7NziQ2ShyFM7roINztK3fiLXBSO/S0bE9HR7+Zss=;
        b=aiztZMyiEtEJHq8UxcN0z1GJysOwxwAyoJw/xGK8568COXVNbsXuMArTCWpQixzGea
         8frMDqmqim+QwUXwtMeVrbQE/tQ4UB6o04Qv7zYxXrPq8wQ15ajTmrk7c65ZpNh9cMxi
         vmipaKl5hsFeqdYWqXXCbs/s5FKkQRONv+VkIh6JiefLwWQsZ2GBARYDrHI8wSSDPvm/
         IMHUOeAGeO4D+q8P5pLF0WAK+qlt+CYs5a/CiiDlEhR5JYmArjP3XKVNDXix4ysJT/eU
         V8uillRQpLUsuMAu+tNOJYl1gyjt7lpKkGbgbqkMvUJMtPrvp+fNVSSk1FkeV3WLbsaM
         jJ6Q==
X-Forwarded-Encrypted: i=1; AHgh+RokJaf6expM3nglHulVT8fwFB2vVRFNxiozEm8le10gAMsBP/eImGGq5MWvN68ajUyhAtfwKU0OOizQEuDi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6u64oK53p6doK0ag6slcLxEvOKP9BcP5+drmF86wbG8tr02BW
	kOgEKaC1S0iOIC/BxnGW00f69c5ztcoDFU+pcWcEJNNFVrGN08PXG9P1
X-Gm-Gg: AfdE7cnHsUMxBjLMI6Xf0AM6NS1828V19ovSh477/D0qij20cRI0oUaLY6GbhWmVLE9
	iHoWDOkM6w9Ozcu4r/XhkdTSVM+NCbBQ8uR3E9KJ/jpBJqZZeUVtjThe7zZVnj1CQZox65lMrs7
	LS/1U5ak1gf6dX53AkKw7bb/gUXC1mfuKA1ZmERTvOGNDXB1eIqVT19msGJKa0yhXgUXPtMUtI/
	i4WJyO1KHPSkicSiVtlYulnJbLl3kQe274asILg979V3JYWDd9cW300NERAPSCejsH9bYrtv5dE
	+mROr9ebfTCdSL7D6BdiNzfsjLGNneTaFwuy7P3cdMyZn/wESD+1F7wwI4DLLhiTUm/GzuNHwao
	LtTVFOpiokXs6tt8CRMDJ2OwyLaEVSKEAen3uC/YGLxzYGyuY6Z5G3aTAZvwxAPRf+iBIJL+GO9
	ishH5iTx/bduABzDU=
X-Received: by 2002:a7b:ce84:0:b0:495:4487:61af with SMTP id 5b1f17b1804b1-4954a51659emr20959275e9.36.1784294672077;
        Fri, 17 Jul 2026 06:24:32 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4288423f8f.5.2026.07.17.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:24:31 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Fri, 17 Jul 2026 15:22:16 +0200
Message-ID: <20260717132218.27007-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.

The supported hardware includes regulators, UFS, USB, GPU, remote
processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal sensors
and the hardware buttons.

Link to v2: https://lore.kernel.org/all/20260714125806.310708-1-oleksiionchul@gmail.com/

Changes in v3:
- Keep a blank line before status properties.
- Use interrupts-extended for the touchscreen interrupt.

Changes in v2:
- Drop SD card support because card detection is not reliable yet.
- Constrain the UFS VCC rail to 2.952 V.
- Drop the unused FSA4480 interrupt.
- Add the touchscreen pinctrl state.
- Reference the reserved framebuffer through memory-region.
- Enable ramoops ECC and use decimal notation for mem-type.
- Allow the unused camera PMIC regulators to be disabled.
- Document all GPIO reserved ranges inline.
- Replace underscores in node names with hyphens.
- Drop the unverified USB limitation comment.
- Drop IPA properties now provided by kodiak.dtsi.
- Drop redundant USB role properties.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
  arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      | 1108 +++++++++++++++++
 3 files changed, 1110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts


base-commit: 1c553b3d0cfca9cac2186daea6e2f81808ce7d8b
-- 
2.55.0
