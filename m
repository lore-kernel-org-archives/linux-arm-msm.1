Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C618DB2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771192; cv=none; b=MOzquXi0bo/ikzn33QEaakjOxB7es1KHymtLOwkGwDzucMS/IdnFpF9qMnlUREKLgWhakrZK2AdrmFBaUW0P1vJofb34a+MMpqeVesRfoJs+Q5gYXkXjjvaOOZiyoGbclKfMtvGxgfMe/aG/zhiT3d6EcHqd77XlzmiPUHqFzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771192; c=relaxed/simple;
	bh=68ATJgBzTZTUdvfoG0MJ+7Tai0B5DUi3LXxfB1fRbss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jO9DsD/D2Bhm+6n03e0vvVU5FR+E0Ujg7msshROXkL3U1EO5r9uyqvNEC8NammuLWeycc0f1QVNTZE3Y8gG8XRwdd4Jbe8hJueThk7c2tYUA/iq/CS9jjwPs0YMnz/et+gaLW/36o2fvEFKq2zNtC7OMzSHRF+bTnvQEkQrV2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx+fwcSo; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx+fwcSo"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80a123ef90aso951197b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771190; x=1785375990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=806bBlE70dTbD9t6qcYHAWco7K+1cMcnXPvu9D6RFV8=;
        b=fx+fwcSoIDmbocjemiSumadFxU6mfqgDpkgN6mFA+7fhUveMd7p1GtCehv++5muxVB
         YEnZbXy9By1PTM03YShxEp7Dh87dC2xfTsXuqq7KEXqUoR94bUEzExz97ubFZnj5vEYq
         CXzgPImUwLMHMjMIUNpIl4A+FKin0IVcR3fMVKaYaV3ubvROZyqy/yke48IaCcN3N+Wm
         Lm+rQIFrRDSrjTDVzNAz74lHXJz8ZwlHRyrYfQjXz2vkeOH9Yv5mKd+Gbeb6wUBVcvVN
         4c0owWXRIncFmHXRKfYYNMJtm5k+lXQkUkOfLhzGl16ZrTETvO7LW5AhNoxvKrqRb36E
         xfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771190; x=1785375990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=806bBlE70dTbD9t6qcYHAWco7K+1cMcnXPvu9D6RFV8=;
        b=pqzau01SZmmmnSSJJExoZdGCBtJXMNAVcgtMaFXc5JEAerI1gRSiYNCHLEXgmFbPvZ
         RFwkJK5bIj4cA8ZHyLFtuu+NhUweZ78uhyJ/RwRcc6nj2vddHMaonUVzEqRdWLGzbiOC
         rBc2ENMyZwSHkrBgazSaaFNM8DEwJM2O43kshPGvMgs+BxJV/annqb0JTHhXYBBTsCT/
         m4On7ReZ3+1rnbIM14hXOCXna9v2BRgMurRdfdg1DRblw6cvkFhtdds4XJ9KHSTrByjR
         tI5a6BKD4J2gKz1kPI41qekBw3ptALmRwYEaHakZ0d96/dQrr7iYKHiJsqbmW8AHlPRK
         h3ig==
X-Forwarded-Encrypted: i=1; AHgh+RojK6fEkMrprssuSjFoAicHKgGCmW16xCGEPXtPUSaiH+wFG/Dw5QRgXTK5YsCMnPxkQk8Fvicon/coxI8e@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdIf4QEE0xKLfDucky/BtUMlqhk8OkrCF8tmzXD8FV8wilpTK
	VE9CRvD7TyfkC78iSf17G7iN/0DCErROjf83nR8Yik1X/LQTI1kc56jX
X-Gm-Gg: AR+sD10nK/vbhlipyxxmxk+X+yqCimtXNcbtNj24wB9HZfMYJnHRVF3qlsJCj3Ckjfb
	sRw7Re7Pe/gQtOglAyO9YDGV6XPbMrloyjc4PZcngURXIpqJGF/cR7ly8UEVBI3OsDrz0U4yhRC
	59qjFyZe/AeQdqUyXHJnphvzBXn6a9fAab1Ms7Ss8NDFkFrElFtCBiBZutEmTe5rZXmlSaTiXlq
	uvuu9FtMdkWGwOXBnd1kC8aaqZUarSv6lEu+W+iCVUHVACjZ21Vw3OWmuJ9TBMGpguPVeL05gkh
	2fCvNW1V8LEtWSucMJkB1LW2c3TZDsU4niKwdZb41z1Zebym1rpARkGJHwmiv+hqdXXMnft2NaC
	cXmUDzpM2Dutrdl1dfwNyg8kBqjogkuGhjc01h+C8KgcRcwJUSqDP0/ebZJTorzz+7zxfLe8eKO
	kZz5+pCP59TR/JDvns0+YyuWs5wkFNPPY13EJRDWI=
X-Received: by 2002:a05:690c:6882:b0:81e:6563:72ee with SMTP id 00721157ae682-81f4d3b5891mr2221677b3.14.1784771189976;
        Wed, 22 Jul 2026 18:46:29 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:29 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:46:24 -0700
Message-ID: <20260723014627.63310-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).

Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.

This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
upstream yet).

Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.

DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Changes since v1:
- Sort Makefile DTB entries alphabetically: place
  msm8917-motorola-perry.dtb before msm8917-xiaomi-*, keeping
  msm8920-motorola-perry.dtb after the msm8917 block (Sashiko review
  on v1 patch 3/3).

Catherine Frederick (coolguy) (3):
  dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
  arm64: dts: qcom: add initial MSM8920 device tree
  arm64: dts: qcom: add initial Motorola Moto E4 (perry) support

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8917-motorola-perry-common.dtsi   | 412 ++++++++++++++++++
 .../boot/dts/qcom/msm8917-motorola-perry.dts  |  20 +
 .../boot/dts/qcom/msm8920-motorola-perry.dts  |  20 +
 arch/arm64/boot/dts/qcom/msm8920.dtsi         |  12 +
 6 files changed, 473 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi


base-commit: a27464b0b99874d22b04a92186ab7ea9252c3847
-- 
2.53.0

