Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DDD2E737B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314752; cv=none; b=SU57+Yyflt2K4m5Na+mjc0mSWrxGhdRiMKeI7BUlamxBG6JmHqBE7rUeCwPcME3dMwwJpcxJ8RY6K7hQjz0gUZIE57g2bnIk1lqTHeLu6focHFKwLAEsCUSmIN3SgEPj+zCODPPAEfe3N9WvntCAxF0iJZWfaHnRenUa32ccqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314752; c=relaxed/simple;
	bh=2w8PO/4Tgh25HFk6nyzACrDt8k5i353xABVv5znYk3k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R4OqxDBNJRz8xuxdlDHXUMzTw//LazjF+GvW0lLaCuITvCO7EEAS36BCyvCydmoptPpnHnM4DafgtjaJPYSVetu67Nphol0EERdxHgaJ5zrwltaQLoWujYwBzOASIPY4GYY/IoMe51DHZUsIq1m0ShYpdu2buIkd0/vjs8o0Iho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmMt7vyB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmMt7vyB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c197e7e4e94so178781466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314745; x=1787919545; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/b8hDyA3Tux1C6emr/gbpSDfkZ3HQcig3Nns7k266mU=;
        b=RmMt7vyBWvFmWxapVfxpb3bHrxMwp7ylmJ5OHSIMHcKLGKeVD8YrS+t/Ks+gyuTAX+
         yc1Z5L1BPg9LTKKLfK7OZbsOrt+JEd0e7dIDwOE2V40xtyj7gQtSOmAoSEmTdqKOzCXI
         zasw3FpBEFcKSLCvmy1gwKSjBC7i1jmYGkWTzWHdN26LA2P3vKRO2XLW/tPd1w6Kt0tt
         ty1lO1XV7JBBlzhzqGECVzp0MAzpwzkqWTVHl6tsv0yE7OWC+g+A569LRAeAp0WHaZQ6
         F17r8HXCIzDt/AfjI4d/2V6lgSK6kxunq5ky2ci6KVv2sb47TUzi2nntBOWRTBQRobqt
         gGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314745; x=1787919545;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/b8hDyA3Tux1C6emr/gbpSDfkZ3HQcig3Nns7k266mU=;
        b=EVKSs5EkGcArRQdSecAeohFSWHmLhsUUNOisC2pqfO7ka6SdQpvIoDwhWTZTFTgUT0
         lQU4XkyZeRTMFwCjFddD3w+WsRAyJNsT9nNU40volzw3f9k28bGkO8Ja00vmtA3UIKm/
         Btkz3CjUPEyypT69qtbJAEgVgadM3RFSNJgY8EkH2uVZlGlE2S3eUW+IWN8NIIZhGJy8
         ktaeFEgvlmiA6dlbkZ3HrgByc3Vblg2mEZnzhz1luIwkwu7+14G0taXrTT+8AATB6abG
         qXpD86JlwUuWHxPRNPaYhovT32KPYBNe0OeY7O/6l5qWLXpD3MvXvuhOaq4v/u9FWSbm
         kIbw==
X-Gm-Message-State: AFuF++kkxrteyZrCY6Pkh9RP1I7r61vtGdaODDC7RAhM9DaUmmOjDhBl
	M+CM8TyToFvLwXwHE5/pMnbH1/hRLR0Eg9pPYfRhzei2x5nwUsTSSKzx
X-Gm-Gg: AR+sD1325yXRyxJeiyIbsHUPWtzVlWYQV6zxo41qR4JfKnSsEYZ6KCWn9YJmZqFLTPV
	Daa3EM0ph7UXbIXR6PwNTlNxc6fUc57tpPDllvN1qCQ88FGSeYlmOiO5YqYr3cABEVtfWaegaF5
	Izv/76/GLxhLOoFJ9WFNeqLsDSx3kq32g0RwTOQwdApVOsDVoBhVajE1pRnbJe7xSX096vKZsqz
	nJ2spSd1kSR6n42YCPdEGJFFFJzl3mFQhAOP+k9/S92leg/JLTBOTV6t1tK0l5ZLAfKy04RiFXI
	rLpi4ONQiRlDhtwQvnOaIQgQWOZH78R0Vz8bTft3HlnEKE7eV1uCrD6cc33uNbfLX4WA7ijw2sX
	lrNW2O20qW9qWB4+z33ot7szZgRXMX1TiPf2q5VlEDNOieZzvf92/KEsDcKzbnB5SSCrBmD3WNP
	tsdEyrmXxIq9LSJk3K2x5KUJxDPmGqRKndk2xv2xyvNbNnEqw2kAyAqiBfkxcign45f3unWxUnz
	E4JPPvOiaG6Wz4MzcUo2WQti64=
X-Received: by 2002:a17:907:1907:b0:c21:3c4e:cb90 with SMTP id a640c23a62f3a-c2469f98c93mr602288766b.0.1787314745047;
        Fri, 21 Aug 2026 05:19:05 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:04 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: Add 3 new devices
Date: Fri, 21 Aug 2026 14:18:59 +0200
Message-Id: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6DIBCF4asY1qVhwIB21Xs0XSCMStOqEUtsj
 Hcv2I0x6fIl8/2zEI+jQ08u2UJGDM67vosjP2XEtLprkDobN+GMS1YAox3OEx30ZFr0VGorLTC
 mlGYkkmHE2s1b7nb/bf+uHmim1EgXrfNTP362fwHS3Z90AMqoKrVSpVUSlLg2L+2eZ9O/SEoHv
 sP8iHnCIJiVBRTClkcs9hgOWERsrMwrg7VEDnu8rusXaXdoPzQBAAA=
X-Change-ID: 20260810-next-patches-6ad6d10077a0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Introduce support for 3 new devices:
- Motorola Moto One based on MSM8953
- LeEco Le2 based on MSM8976
- Xiaomi Redmi 9T based on SM6115

Device trees besides enabling most of supported hardware also wires power to
subsystems like MDSS even if those are not enabled to lower maintenance burden
on out of tree forks.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
Changes in v4:
- Leeco Le 2 and Motorola One fixed-regulators aligned to schema
- Motorola One commit msg reworded to drop touchscreen
- Leeco Le 2 added lacking parent supply for rpm regulators
- Redmi 9T makefile placement fixed to be after other sm6115 device

- Link to v3: https://patch.msgid.link/20260821-next-patches-v3-0-cd64bcef6e21@gmail.com

Changes in v3:
- Motorola One Touchscreen was removed as it doesn't work
- Leeco Le 2 gpio-keys node name was fixed
- Leeco Le 2 volume down key via pm8950 resin was added
- Redmi 9T Reviewed-by tag was added
- Adressed more Sashiko-bot warnings

- Link to v2: https://patch.msgid.link/20260820-next-patches-v2-0-7130d68183d9@gmail.com

Changes in v2:
- Adressed Sashiko-bot warnings
- Added Krzysztof's Acks
- Dropped confusing link from first vendor-prefix patch
- Removed ramoops nodes from Motorola and Leeco patches(now handled via lk2nd)
- Motorola One USB-C connector and FUSB302 is now fully wired and enabled
- Motorola One Touchscreen has been disabled due to panel power dependency
- Motorola One debug memory regions were removed
- Motorola One regulator setup values were ajusted
- Motorola One NFC now have more specific compatible
- All devices now have described reserved GPIOs and trimmed unused ones
- Leeco Le2 added missing pinctrls for peripheral IRQs
- Leeco Le2 OTG is no longer enabled as phy dependency is not enabled(need rework)
- Redmi 9T USB-C connector now is fully wired including pmi632 setup
- Redmi 9T nodes are sorted now
- Various changes to styling to keep nodes within single dts consistent

- Link to v1: https://patch.msgid.link/20260810-next-patches-v1-0-79a779d76173@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Adam Skladowski (7):
      dt-bindings: vendor-prefixes: Add LeEco
      dt-bindings: arm: qcom: Document Motorola Moto One
      arm64: dts: qcom: Add Motorola One
      dt-bindings: arm: qcom: Document LeEco Le2
      arm64: dts: qcom: Add LeEco Le2
      dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
      arm64: dts: qcom: Add Xiaomi Redmi 9T

 Documentation/devicetree/bindings/arm/qcom.yaml    |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts | 440 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts      | 442 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts   | 497 +++++++++++++++++++++
 6 files changed, 1387 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-next-patches-6ad6d10077a0

Best regards,
--  
Adam Skladowski <a39.skl@gmail.com>

