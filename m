Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5023BADA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622318; cv=none; b=SUH7H8g5rfvtwKpwreWMFestzrqCpWeh1gMvExpyYLTfN38dZkb+Zgnyj8jcNJGuDNSKBLwRh8LLfcg2C+I2jgnxibcozvGoxoivcAPGNj9WLVFikHaO6Pu2/fBCF8SMRws1E13ic9EiwREZRhdJCA6B3BOyIXJulFSD14JQHXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622318; c=relaxed/simple;
	bh=jykxtaXVnSoyTKVPJp1znE2mN2KCMcobywMTcQilV0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5b8aNkJ9XXOmfukb0u9KQYL0XVri0Jv9jit/qSSend1qE9HLh9w1J29s91VO0nxh9XQKLmOneL+BZ1z7BE7VHtHhlGk3XYsXOSU8erHFCyZ64fURMeIPXzOy5puS7YFdeijVwyLzbr+B1DLLy2rnm4/jRmTvALTQUTod3Augsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZbiuqqP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZbiuqqP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso10183686b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784622315; x=1785227115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAt6DAOdlJUc0rABH5B/sK5tagQJrN1Y6Ns1Hb/K3hQ=;
        b=UZbiuqqPCey8DM3SFd5+PnzsOQHEKHQ6YbYAyne1aw5Q0z4BMYBFa9DnEh5OBijRmw
         S0pmTXgyt9PcZV4T2dZvBQyvmXWPORHBiqTqyi2/I2XZaaGRsa2S5lmnoqE7fpJ/SdIg
         5ZjsPE8PYf+iIFgfev3aazcz04CAGuXhy5asiyrsYWbMoatNtP3ng5f8rUAOs9BgXVyh
         aidV49fS7yBsgQfuRP7OyFg0blSiXlmeugp3rGYKpuLpsJZD21xFnYW6yrSTlKCaCY+q
         QsJWYinC/ymyJPp2rBoTBn8zIQjumo2tX7hxHUlY1b2Ba60y/JF+24sDEvxOC6sdksNp
         BTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622315; x=1785227115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAt6DAOdlJUc0rABH5B/sK5tagQJrN1Y6Ns1Hb/K3hQ=;
        b=O1KtgeR5O+9xrj9s1TpQ71iQ2wj8mI/5MCU0h6qiF7PdyuSAf3OvmOit0Dso41GdnN
         RzRHJEwZtiAdMUA0Tw9Gq2n1n7LyZihSCA4PCs1hmwnSzuSsN+s+9UkCPay1CFRt0W5U
         Z1HcyAUcT4DozquVi0PKM/7silAd0FZdut0o1xs+wEfjxA7PTFa23IgnlATc6/A+NQ/8
         lUG/8azvK1+UwqbZriCcww6oK+btTwLxdEFPWF2NsMRcRCGlXZieBc0zzp30uFTihjUI
         /4slbl9/QK523vK4IQtIATvzDs7EjcKgawTRv5IxWyQRMgimMPKmjW/mVnsbgaE1G2QT
         E24A==
X-Gm-Message-State: AOJu0Yxb+Q04gfy1Iniyxd9W3dSyTKOQEbB6oBJ9v6oEv51Y3/vmRpQI
	/p/YeV/lil/SVCMojF2V7yvp19jgGrgSPTNMnPLocIKfzLWFxG/f+XXu
X-Gm-Gg: AR+sD12J4IemZxaAcGaXgP9ZILnumDBXQyJ+G8K8Kf9F/EQ2dKLEVBLz1nc38eLZhGb
	DO8GUDJyEc7Fteq+BJFevSNfiOVVj2mNNPbQY/XBmBocwfWlcZTiffGiOdx6m1W8/VwctGXndAc
	O5Vq2LvMzPYp6tyoAbkHtu5dD20tJRjU6UYh6FzRMgffaWz92IyXf5YwVu2c4dqFykYM2Z2G3GR
	/1DgNGnsdRurghn5XVZ+VIE9yEs9DjmWFO5A7uBL9jxCAq771WjMzb3qt4wWaT880X7OLJhBicO
	gpBSsyscRLIBG4bChHxtZ5zs/nrIKheon86NPv3+yrtQUMs/+L5rQ1YsvpVvvNwvbHx/mhraKzU
	XfRKCe0qBqqPBjMLWVKFq1khHx87Lnl38LV9WIAhBCfQ1FoqiyPcyzNf+5QaeGkzjMGHBlQRTar
	fOPp6nDUUo
X-Received: by 2002:a05:6a00:18a8:b0:848:2f84:732 with SMTP id d2e1a72fcca58-84c294e8b92mr17030900b3a.69.1784622315353;
        Tue, 21 Jul 2026 01:25:15 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad88582sm6886600b3a.1.2026.07.21.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:14 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v2 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Tue, 21 Jul 2026 16:24:08 +0800
Message-ID: <20260721082410.18275-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next / Ubuntu 26.04 LTS.

Tested and working devices:

 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git

---
Changelog:
v2:
- Fix Makefile entry ordering. (Krzysztof Kozlowski)
- Use readable compatible string. (Krzysztof Kozlowski)
- Fix sound card model name for this device. (Krzysztof Kozlowski & Konrad Dybcio)
- Re-sort nodes, pinctrl-*. (Krzysztof Kozlowski & Konrad Dybcio)
- Remove those regulators without consumer and lack of a required value in DSDT. (Konrad Dybcio)
- Remove ADSP/CDSP fastrpc memory. (Konrad Dybcio)
- Add iris firmware path. (Konrad Dybcio)
- Delete usb_1_ss1_qmpphy/usb_1_ss2_qmpphy properties of Type-C. (Sashiko)
- Delete usb_1_ss2_hsphy. (Sashiko)
- Remove unused pmic-glink orientation-gpio. (Sashiko)
- Remove node related to WWAN. 

- The Webcam is a USB device, can be probed without any additional
  node. (Sashiko)
- Using reset-gpios in swr* seems common in X1E devices, like Lenovo
  Yoga Slim7x, ThinkPad t14s and Microsoft Romulus.
  Because speakers do not completely work and I could not see any
  effect of changing it, just retain it. (Sashiko)
- Also, the HDMI audio is the same reason as above. (Sashiko)

- Link to V1: https://lore.kernel.org/linux-devicetree/20260702063156.35169-1-kaipeng94@gmail.com/

Kaipeng Zeng (2):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1484 +++++++++++++++++
 3 files changed, 1486 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
-- 
2.53.0

