Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621969;
	b=WXNLDRg/GpEzaSOPLSuOUz+hUIG7DjmAxAtLLepGvoAJUm7ko1+TUiq0sFkHsXGEglra
	 RNBmVbfLmzhNNbeLemfHZF+PGZsZgTEPIH/4xjBp573vGG0j3FrudjmpPzPdu17LG9yDL
	 11YODwWlqIQ8GwhHZ5KE8yG8sZrog0bqs8j8GwkRQ3SBsCVEvkEDbnuIQQofPlckJh4MT
	 cINVRiVaUJ72WymWzsqTbGDZB6euwBUp2BmMGOsgH/OXZChA3rz96Rb4iB3XOSD/2Na9o
	 gE6ssKbPNaf3pLZFlVBpGUqj7/Qz7ulUW1sRDb+JauQnwjxzCBa7VWIuVS4OYy54VBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MwHNjXTNt0u+bCEWd1wPqor93Tx9nuqFvKCrmT6b1ZE=;
	b=MziELrCSj41lerNLallHd+bW+7ugpL3OANXhv74xt6IrjaZHWOkRM1oFjC+yNcpzsdAi
	 7nSbJlbeGhX0RurkdcwWAZcLHWITWq6r2zHckZfhqm91k+rOSBlgls3obPd28G+CtBBjh
	 Z7NaP0T+zpLj8B67OThqZxq9Emfcozhr+HVBEIAMVTsJ3FKfFUoClnasfuseA36R6vYXM
	 OGL46js5DYVVCGBA3cFymrlu9chmtPDSNtEL/OqaTkDTNsf/LxW4iZ8Mg42dC8kek2c92
	 2BWe+2sZJbtXo1sZRUczwmsUqYbfZlLNrFJYyK0EDCdCk+dspG1O+5mkQnE2coNT0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SrV+dAjR;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15F606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E15F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SrV+dAjR
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2479860a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621968; x=1795226768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwHNjXTNt0u+bCEWd1wPqor93Tx9nuqFvKCrmT6b1ZE=;
        b=SrV+dAjR8I1l440+SPZa5VXt5CnSngO+8rg8puX7LGOii7nOX+yhoTZlMMmqbH3I51
         u0Vk1HzoA1/EhlzQlBItuoEwGYEld6gCwr75pm3TeAAPjaU91IgAKlcJR9ZVdvW4AVq9
         mpJq6UYEBKbYFOb6TsTREQlPXTBpTTnXos1Buh5qi5YWs9KooQMNWjjwsE9Gqm/TmMkw
         xrI2z0i5k09Wflw+52Y4QJrtB/ZeZtI3HlLvZK2tJPAT1IbQYTg/UmN4Ef2UBKp4X5Ao
         kxF4rF+VpYPrR5hB2kQNtCSA6ulsHi+m2Lrf0S3dDW/2ZcvmlqxgvNCtVxTXpSog37BS
         INNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621968; x=1795226768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwHNjXTNt0u+bCEWd1wPqor93Tx9nuqFvKCrmT6b1ZE=;
        b=AFrU9d3X8D8L8qlph9hYwAc0wSp+tC17RYX2aViVrRZEXe6uoj4x41oiwAtxnH8Swn
         ZNP4ihvB1g6ykbTsuH98nMieOmPRdJLmbA3HxMrPUG3NZ+GJ4z5iymc6Qbi6ufWRzJzl
         nxJCgwiRXPF6RSB8MgCxVfpxECCsQ+Xz02x6WKsd1xxIe7e/+ITI52TQuttPx2QZd3tn
         iTfuTQ3VqQvOVKIstNBeBp4SC0f7ldojdJ7P0v4pe9PmE8+lGG5D/+prC0CFG2Sq0abg
         gV/U47fR2+EZv/0hQuwMV9BB6DOGJrrPbU3Qu4gKapyoD7v2bp44yLndEPV9E0v2wcVa
         bvUQ==
X-Forwarded-Encrypted: i=1; AL+hErGi1LDWlWMtmVt9LOoKT3BfzE2nv2OleEovzT+rJoDMb0SdnhthkkDYNR7jtPQZsh+fDRcAe/ecvXrrlJvZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9HQ50SIcaAtMrdrLLaGt83bs68cgHgvl/zmqxTzLdq1tJ0rgiU
	t/5YrvbrsEjY21xjV2j6rALykKz80yoly1HLDoquVtaKbVApuPWGHzLa
X-Gm-Gg: AYBFou3zvNajIbfOKqAy1XZrHU7fspGPwRXfcE8PvGboQLND5aH2Nii9qUgMz5T4YYP
	8gUO1HfUtYverC9P+KFrfABCPKpXsjvTktBBTjK20VVLQkn3CnPhlR8+Oxaxb6Ypp5VNMoOQFV7
	H7b8EjCZUdc6HmHR0pZSToF+2i/2KDJ799bJDnIf0ZMhUHIXG249cEvwQIaWhXcSE7vwunat5kO
	UNtDRfWH6hAnryh2O6Ydl+ko4W/1OI0QMv649r+mbLAiRwlMw5lUVNvacR//Mtp83N81hzRwLuZ
	tu2Q2cmusb9XRily1sELxVw9icvwqGC0EaBVxvL5SP1oy04zkUKLp3I+2fZe9XpjFfZPGU7RaFy
	XGs7X6aejX1+3PbDc/e5qqrupPMTRi5wUyNjeAQ5q4JqQyb+wzLthGTG40giBPcF2XcPbm+s1qm
	U55B/WR5/sMrA9o7eFbaJjAlAxlotIy5vDqcp7dmq/JKu//D4YfHG/vtTTJvZK0y6/5iUw2DqmC
	3ackS8ekqENIqi02ACV1cFOaJoP+2LZP8DFDjU/gHr2UYoSiiV0jciR8y+Ss9ihoiGTveQTkTsc
	/901dAxlYyYRfTLBnoMOE8l4aaXq9FPM4IDm9YYfqjJqGNimiXbI
X-Received: by 2002:a05:6808:244f:b0:4e9:7d56:846f with SMTP id 5614622812f47-56e640bc904mr4002307b6e.41.1794621967148;
        Fri, 13 Nov 2026 18:06:07 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3f179sm3385433b6e.6.2026.11.13.18.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:06:06 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 13 Nov 2026 20:05:06 -0600
Message-ID: <20261114020509.632311-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e
kernel. Everything listed in patch 2 works there, including suspend
(s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is enabled as in mahua.dtsi. Tested with the msm driver
  patch from "drm/msm: Mahua GPU support" [2].
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v5:
- Drop the &gpu and &gmu "disabled" overrides, mahua.dtsi now describes
  the Mahua GPU (reported by Sashiko)
- Drop refgen-supply from usb_2_qmpphy and use the common l4f1. The ACPI
  tables vote both l1c1 and l4f1 for this port, so they don't decide it
  (reported by Sashiko)
- Drop the stale regulator sentence from the commit message
- Link to v4: https://lore.kernel.org/r/20261110202445.14100-1-jeff.roach0@gmail.com

Changes in v4:
- Rebase on qcom for-next: drop the PMIC includes, &apps_rsc, &tcsr,
  the SMB2370 repeaters and the phy supplies that mahua.dtsi and
  glymur-cob.dtsi now provide, and use the new regulator labels
- vreg_l2f0 is now 944 mV from the common file (was 936 mV); tested
- Keep refgen-supply = <&vreg_l1c1> on usb_2_qmpphy, which matches the
  ACPI power votes on this laptop
- Move the pcie4 endpoint under &pcie4_port0, since glymur.dtsi no
  longer has pcie4_port0_ep
- Link to v3: https://lore.kernel.org/r/20261028191800.27829-1-jeff.roach0@gmail.com

Changes in v3:
- Set vreg_l1f_e1 to 904 mV (was 880 mV, copied from the EliteBook) to
  match the ACPI power votes on this laptop, rename it to
  vreg_l1f_e1_0p9 (Konrad)
- Add Acked-by to patch 1 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20261026154001.9323-1-jeff.roach0@gmail.com

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 647 ++++++++++++++++++
 3 files changed, 649 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
-- 
2.55.0

