Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425143FD127
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218971; cv=none; b=BDBT6XrUmnsYjdmtWOm2MtZHcc6dJPP7zVlL+CbQHYGf3/6HZmFiUUIsgOhLvbg6DOOf+CeUhp7dNKovtysh8lhc03Fqz1G4AY2B17W3nNqZ0H3pTo1Kg/fdepPzf44t+7z7tSyJJAuBTUCzpoOk/1HOHv6HjtdNTXXLmufvDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218971; c=relaxed/simple;
	bh=SLgt0+h14ZOfuzmTLwyNLNXs7RHbAk6hjl3WhGYDpWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FnYtsiM0TxJ5PbL79jpmIHZ4LlpM3l2xgQMm65LVp6yZApN/OCJKnS9xhZrzJZdlOXSsPrBz2TFZO/8JxsU9ImPJBWLuCqLQKXAt212SDVOKXC1+ozc2SNsJn4oxKu3PJmMcsIH00psqQ7CmvywkygfAYvekPbiDcFnm6sbiG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki5EYMVz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki5EYMVz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fde295992so690711f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218960; x=1787823760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YzL2SO0oanEljmvoZAdumsTt6y7BipjLwI3m0jswq0M=;
        b=Ki5EYMVzCHWLazlYFIcaQLNvLDDw0B30mlaO61852TGR2lJmPBpa2zCty/UZIAOr+t
         n9BG8c8tnWslkKfW5EOB37taEUilNL/ZnQqiPeU2SVxtMQQwLYX151BZelMLVYHtMKc8
         BOhAsKPLeLUuiaE+au/I0p/oxLwDOvjPhoy9Dt5GWSxoYCbo0JZPHl8ptAyI83PqOaAD
         oz5vzwk6KC3Pbl/Tdgb0QNatUTtXgzCj+E42FuPw+Ik/5srgApCrtwPG+9szrLfEWo1f
         wfx3QDyPAfokjmMY9vvYVSnfJTWRixcuIz0lyu1NHyf6ExGiITMxDjgwMXwVUj021tEW
         fz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218960; x=1787823760;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YzL2SO0oanEljmvoZAdumsTt6y7BipjLwI3m0jswq0M=;
        b=sBVwV8zg8xK30tSFUtvfBMuGf01VXiMb3BeEz0Vmm3s65zAk1dVurN3i3nXh/ndfCG
         H5+yZ3zTl70ZqPdhxxNwWPMt0TiAIpX8l38oL7dvnzcMX6faov1KWSoRw8mTLn6B6fKH
         FU0g0CH7ToYYNeOR4HIw42yi8DH+2FSJeqXID2LoEQF6OJUwOzTQcu1trlqXYSOoDIer
         qnvAAOHSb9ePNLjcwbm14sZ8I8t2gaeAq3p03TeTT9cjn1Ei+yhysIQfaiAzYyRPGaFi
         geFMNXZtUq/zh0OHhCTiOfTUqtddrNHkRygcYtxK/OP/7dbNWg78rilPdp0Tg2/b137R
         /M7A==
X-Gm-Message-State: AFuF++mYQFOhgzjeey9EXpVnmepsuDPlcpCqbDh/83d/kGaKjWBElDXC
	ojCmX+zrqe31EEHbJBQvqxcFn+8z6lWfV+5DcxWnXR+CnGUR0C0WqFlA
X-Gm-Gg: AR+sD100B0lKw5a0rTlVLgIw7Yuh/zSxWsDNDHl2YwOB3l1JStmWRDYInswRBRVV31Z
	T53xYuCA4DShut/4O6/8+BtT7EJpI23tlhPLJFILVWYST0VVybddsbN1Ut3hI//LPzcFVTClX62
	zbOrzlSH/qpY1LFylyjF+i8uamVM3ECHsLTW4FDTrRG7Y/jMSKpbA5RQ+kB8fbHEyU9tlQqykeW
	kS+W8rMJkZOoMPNFaMqVUmfQHk+L6a5mPnT0T0bfaZRiG7UT0/dXa0UNxSXVRYoc9PjjHZY+8kv
	krFUdWMeZUQ9i9ipnEYDuI9FgKKrz4ruOyVHPK3mvgWKLyQPLWz0yuHAZ8ESxDzqOqB9Q3WBRU1
	50jiGt10FYnQqyn92BAXPdpthSsi3tgPYXMpU0C+MvOj29LVOQINoKAxzUzOvRYhtBgUvmex8JW
	nh37YUijrTqExiIN+xfBu8xyf7ls4O+Efv24FcNKLjQPyjrN/N52AV7mBaMKG+rLR3Ua1/DOo5F
	tPugm1ab4zZmEzZ86v0T7ms
X-Received: by 2002:a05:6000:230f:b0:481:562d:6fb1 with SMTP id ffacd0b85a97d-482b782c84fmr7644350f8f.6.1787218959842;
        Thu, 20 Aug 2026 02:42:39 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:39 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Add 3 new devices
Date: Thu, 20 Aug 2026 11:42:23 +0200
Message-Id: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2pppTTriyv8wLGo7whh5pK0EQ
 /h3AdcuT3LuuTMkjsIJLsUMkUdJ0ncrmEMBvnFdzUrCymDQWDxrVB1PWQ0u+4aTsi7YoBGJHMI
 6GSI/ZNpzt+rH6X1/ss9bYzMaSbmPn/1v1Jv3Jz1qhYpKR1QGsppO17p18jr6voVqWZYviN89T
 boAAAA=
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts | 460 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts      | 435 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts   | 497 +++++++++++++++++++++
 6 files changed, 1400 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-next-patches-6ad6d10077a0

Best regards,
--  
Adam Skladowski <a39.skl@gmail.com>

