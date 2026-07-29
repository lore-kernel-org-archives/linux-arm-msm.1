Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48CE3A3E77
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307566; cv=none; b=VwVs5HEn4rDmz0W3Lye3iM2mij0At6Xqv/5KUYvp3yp0QoyeY1Kc+KA+d++fW315VECn/Jg0kilpklNrbnGeSYTq6BJ9v935V/Jmne2SiAYJcen8NOL1YFBTh8Rnd53Fgf9L4BczCu72yenJX6NhCuEfiCIPeHYgo8/M3xt5Frs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307566; c=relaxed/simple;
	bh=UtKjADk2rPeLePZUyAblyIugJRkeY1U111MtwFxEW4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8Mf58a6a/Rr2M9QZ6GjtMyHmQknGDqJYdakTCg27tWqldpa1S2qRbzyqeQ8rP6EBWyTQL+PXIa29YTtopS2J112iD8VhCVZ0Z5lz4GcuqQ1zxvXL/CBvIppnViA62z78iRxCCXS3CG/t2B/Bgv0gMrSs3l4wRq9C8nGP9Ui/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOWg1sLj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOWg1sLj"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so587535a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785307563; x=1785912363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XzqpL/KwNW7VWHUSuueZGeJItvlfPLClzRtDIOx/B9o=;
        b=XOWg1sLjw3t9p6pNHq03Rj3pJdEMtVOkLRG3Lwo9jdK04qIjPQVRmhfjUjJVdIXmpM
         ps7oBrEKIBu0ImBSWyBIGQOtCfzM1MWJlbWDjy35arONmvMM+G82i7kw49cGAm2+P5F7
         3siRc8gvO1Yijxt5fWlqWLX7TA7+C4ttPF/vdQQkhSwiDYw7yyawOvfkkuvkJbmoIyC0
         E32zj1lb9zUdOyb5PgNFvM4j2qebFE3U2auJZZMwoKZRhBjl6i6+2hPxLImo4AqJX04x
         T7ikRGp/NCV4NmGQvEkEjCXtvonWeQ/FdnwisfldbDNhVXSt3Kp2nStrQ+Ui8hMihixZ
         3OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307563; x=1785912363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzqpL/KwNW7VWHUSuueZGeJItvlfPLClzRtDIOx/B9o=;
        b=jWkusivCKtPNByMA2GLzre7enFJgX96t922uddlwBcJpld80j5B7HFQ9OoIs8w+bnp
         9cdjKgpZEr3vZCL7DwLakXdHQxTVDniZ7C5VFZ9u8g6g7PGQSh0Xzjn1PvolRWHTYpQ2
         eOWIgFiPMjcTGoJduGFFCy5u4rENU6dDTXbagkof3qaG9h8R8xm8y/MMmi1pcepnhvlJ
         LVuxcTrPyUO0SAjpdX4MSsDN3yS5CucZBc8cEFATY5bszSoR9DedrVYD0otVprXlsugu
         x1VzDjDLQckTL+Oao7BvLnQdpF2HYzdsYeepQv85WyiQmOyhreeO4+6Lkj+ZbzZYu3B8
         KdOw==
X-Gm-Message-State: AOJu0Yyh9hdX/ClkJ5Lq0d1fvvkESVA+ijfp/EaBxU0dx35/UYdd4otC
	P+4ZJ1G0a+YWqFCjisfVeEdV1DqD3WCtvtk+wytsxkkfVbP5zjbGn2mZNaxmNZIxTNg=
X-Gm-Gg: AR+sD11u6LaNxzNn4+NUEAnR8I8+kvT1F/YTGtIkfVkvJ0qXWdfY4yKRkhN0BPy8Lm5
	uzoBgvf76vrLvSfYS98GMTieCVzI8rr2N1zC6HBharSmKdAaNqp1Ciog7ZOtWoF3g7zGe3TCm/a
	TAiP0878jSSMvK5noDLBWyW2ceQPgn9ihYvA9bm335RjfltBxdkS88q5ysnCHL6DQ91I1w0jv7A
	yy9c47+qfmZ1jAwzseDHdBBFLCnnB8FPj2v6UYMmpP68zahVWVHCCdrEYQqKl018/ompfVy7dZB
	RwYdxNifzQdclwSNw0TK1a71EExK0XSuXGowsoUTmK3cKaUXELYQZiYrVj1lFNdYQax4MQlaxyB
	WD2iHCD8jL/Kmwdpl0yG/zqhHbnANwVWTcw0MQ6y4c9vIGcXaGY1vDSEGAgsy45akGoShRo0LjY
	dZq7j0RY9GSNizQWQQTTj/QZD3oqHUHcsyNltoPxJSt0JHz/ocHrF8S6p7KVU1FyRMtxce1irbB
	p8NNHU=
X-Received: by 2002:a05:6a21:9e0f:b0:3c3:83e8:c211 with SMTP id adf61e73a8af0-3c8ba63ad14mr6402910637.63.1785307562881;
        Tue, 28 Jul 2026 23:46:02 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba35196esm480673a12.17.2026.07.28.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:46:02 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v3 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Wed, 29 Jul 2026 14:45:36 +0800
Message-ID: <20260729064538.19564-1-kaipeng94@gmail.com>
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
V3:
- Re-sort *-link and its sub-nodes. (Konrad Dybcio)
- Keep a '\n' before 'status'. (Konrad Dybcio)
- Remove 'output-low' from wcd_default. (Konrad Dybcio)

V2:
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
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1483 +++++++++++++++++
 3 files changed, 1485 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
-- 
2.53.0

