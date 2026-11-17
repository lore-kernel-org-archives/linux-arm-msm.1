Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903867;
	b=XB1tyqks8GMGMoT/ttHF0O4ojxGLv8XRaZSk4JhshEnb6MbZSF0EKdaTS/LuFjw7AmoK
	 VM0L8mjyRGSMZ/2n2IVQf2R/NWK2mAGLAkfass+mYP9Tfnt2lNIdx4Jq0S1oyD7Ezeyxk
	 GDy7cwpg5nqs2nRyHvEpwKKbbppis6CZD6+MQIrMXCwBWYkb2eBPhvG7aWHNit5OdlgEO
	 2togc/jA5rQJpDXgJEu4LvpvYFdGUyOpmSLjzL/nhJIey6jto/2E2edsLDM7ms5eGaWN0
	 8dg+SDo+FFd9URep9wv3y82hU5lrdxgIFoealjPh4eWnGUMKHQgY5JaEg0XkowGieEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gOxtFzjpUfLxN/U756DChYjRW7nHZoIiexI0t8uMS64=;
	b=20EdXKrL5d/rjZXKVsKkLNa63uQKiAFAveZ+PFpoz+yM71NGqPAPMPgSXz88umrA5W7K
	 x7c58Is3fvGSDbh2BO1iJXFLS2EfgzNRJOFghvKtaeqCJMvGXmceGKCv/UD+Qa+R6Uq65
	 BIh1NKqdqPG8xGvbnDD9WBHtIAbeIH3MSwi8yRkvClmMU3vnIId9vkyevVp71zwDpBri1
	 bu8U3fStYVhKI2rw1oZWk28c0rfJUYEq3FwXqVFctBSCu+9Wrt803HntIVu5EExHZ/TMl
	 /gi+1i3wp88DB6Ux522DGVHI6KyulvOZPC3hk+8Aeb6nMI8xHM0QSH2VNahDAN4NKFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uZ+N509i;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D56606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D56606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uZ+N509i
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so442808a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903864; x=1795508664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gOxtFzjpUfLxN/U756DChYjRW7nHZoIiexI0t8uMS64=;
        b=uZ+N509iv4LKdxh3M+Ym2H3OFkUBdYdJ2Rr6ukqd2/dt4YbV635rE545dpLU+u+xXs
         Ng98vGPKjfZYh6uVdLznWraaN9hbTd4M2lCcalOujxH8al9EtHJozr3kGTY+axflTGc+
         /NuADXbBILxVzdY8tfWmfsksexJjx6+Vv+5n2tgqtBJZRmA/JboNR4zv9bMNlO9j4YqG
         IW41Le3smctVEk+LilijlIY0lY5RO0dNK2wYMO3DoHhQcE6LcbnjK7b9eCpJDTY5LeMF
         ZzdfgjKz6qusrmEcMnGTwSJNhi51RlNXd7s11qR67sR85d1BW3FXzQXK5WA4t8+HZ270
         6F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903864; x=1795508664;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gOxtFzjpUfLxN/U756DChYjRW7nHZoIiexI0t8uMS64=;
        b=Uc/kfn614q2RFhUfB6U20AMONEgYlYqvDQEDFZpGk17ppOTtgEDe2VvGhYtEEB7rc1
         i6wt8R+aPWXIoXRnZQ9p9oT+NV+4uXXxaqJXGTIbYUTM5ewzqVu++PhGiphWxftBE+IR
         Qr8zUgyH7RuiHONkYhnaa9RzpADEvJUUd4mMGF/ub38QdLOVKOdzzlvlrTHBImxakrzz
         7G5D8s2mnJXbh3VWLgEZi9aY9CuXFTBVSDkCU9WaDrPgUYJUBmNA50xUaXAep9PfULnv
         U2yNOqIGTB9UBVCylnFAZWIpTwyfptBWnf1dIhQG3D1dLCQ2XRs2oi31HjNQGkmkyB3E
         MWDg==
X-Forwarded-Encrypted: i=1; AL+hErElrMLCS2UTrfxn77jbGK6rK7vNx5GMCDR9ZgaHs5WUi0URO+tiwMouQV2767s0JlqCk4Xjuq9TTYdAE9s/@vger.kernel.org
X-Gm-Message-State: APuU4Z+A5HbaP8NozowFG4nZCdybMV2Fns1ycer3rxf0aZy0EaLJELl8
	YNkCLLUa9m8Eua3RGyYbPmrlQ/li3z1hjZxwmkjhAqos/+/JZ/dID+ceahvJvUY5F8I=
X-Gm-Gg: AYBFou2vUOr8byEMEw0vcqLsiwZnhy9xywTiI7rWwUPehJEjO8zj00pH9+OCf+BBqtI
	cc/5dhg9/rR8RKVnynoDPoQMJJtNMoMKTyq3ijjVF2wzikUz7MwKY8kv7H0JWA28DLnSjth6GEF
	yWB11w2ONay23HIyqOCZ4Ck6CcYt5tP0ODi013Ty+wXnQtJ/0S+v78zskcdjNah4TUogtO21IdV
	i3ap7GJZvL857ogn5FpRzbxcZR1lkhO9sVlJv1wQM6U2HLtQF6iJYVGFzW9LlovaeNPUBSyYyPc
	JZHSjl0u1s3dhicZrZWUDnY5SjKlIXa8f0e0HGM6V2uq4omk8ZH9inyGCu2IVEk+XQq4TG+r2si
	itlzQ+d2Kc10xbO2hFyavoidSAGl4F8/Yao+ec+pWLr0FlEaVAt9nLegmEJfftWs9CcvHgJmTaZ
	DpR7xRq8L77jgROeIuF7CxVogHnczlD2JJUPgs5BYraxhxTUhzbMJi8PFrxqHlJ8JjaXTWoUj0V
	ZHrhX/13PgAnQbLmro3LiFvAHOMADcQuB/FPdzwL8a8pnGqzujRonLibAIUMKXiHFtsBvHrky2w
	unTuyQLYo3ClQFQvxiYRH7U4a5S+6MrzlC1CSPV8KLVVTi+Lat3SgGzB20j+kTuGVOuYj+a6H2S
	RW77v7zomHdWeteuKbid4UkkV6m5pLGRdSSTJWZzjS578nWOD
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id 4fb4d7f45d1cf-6b7c0d166cfmr8598960a12.40.1794903863999;
        Tue, 17 Nov 2026 00:24:23 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v4 0/5] Battery temperature ADC plumbing on Qualcomm
 platforms
Date: Tue, 17 Nov 2026 09:23:10 +0100
Message-Id: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OSY7CMBAF0KtEXreRhzjYrLgHYuGh3PEiA7aJa
 KHcvYug7kVE7X5J/1U9SYGcoJBT8yQZllTSNGJovxriezt+A00BMxFMKM44o85WWmGYqQ2eaiW
 Ni8xp5TzBypwhpsfGXa7vnOF2R7W+l8TZAtRPw5DqqRnhUSnKHcchr0KfSp3yz/bOwrfG58sLp
 4wGxcFro4L13TnalOd+GuGA/IYt4g/omBB7QCAQQbYQWrBa8U+A/AfwQbkDJALHVpqjsToGw/b
 Auq6/pytrZl8BAAA=
X-Change-ID: 20251010-bat-temp-adc-8539bf0b85bc
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=3086;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qykqVKt9uTGSJ5RitqPySDdIMTQiACLcAePA/hsi8uM=;
 b=u96NawTqxLv3u/fbHAuMVFuEZGpZtIpIU6w/CdWExkPyFU6d1we9grj2ozoh1gv5XGR2PKbBS
 m4GD/gDw/heCcBt+La5UrW33hLFnCRUYGIf81WfggK22+AXh7iFOUn3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This implements a solution to get battery temperature readings working
on (for example) smartphones with Qualcomm SoCs.

The solution chosen in downstream Qualcomm kernels is exposing
ADC_BAT_THERM_PU* in the ADC driver as temperature channels with the
lookup table ("struct vadc_map_pt") for the specific NTC found in a
device's battery patched to adjust the lookup table. Patching a kernel
per-device is obviously nothing we can put upstream.

The high level solution proposed here:
* ADC driver provides temperature channel in (milli)volt as IIO channel
* generic-adc-thermal driver converts voltage to temperature based on
  provided lookup table from DT (driver has one IIO channel input, one
  IIO channel output)
* The fuel gauge driver can use that temperature IIO channel to expose
  battery temperature via the power supply device

See RFC for other variants or alternatives considered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v4:
- spmi-adc5/vadc-common: Fix inconsistency micro vs milli (Sashiko)
- spmi-adc5/vadc-common: use 'MICRO / MILLI' instead of 1000, use _mV (Andy)
- thermal-generic-adc: simplify devm_thermal_of_zone_register return (Andy)
- thermal-generic-adc: move iio read + convert into gadc_thermal_iio_to_temp() function (Jonathan)
- thermal-generic-adc: convert 'register failed' dev_info to dev_dbg (Jonathan)
- Link to v3: https://patch.msgid.link/20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com

Changes in v3:
- Expand commit message on dt-bindings patch (Rob)
- Some commit message improvements in generic-adc patch (Andy)
- Fix dt node location, move higher up (Konrad)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com

Changes in v2:
- Rebase on linux-next (a different patch to add IIO to
  generic-adc-thermal has already landed upstream)
- Un-mark as RFC
- Link to v1: https://lore.kernel.org/r/20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com

---
Luca Weiss (5):
      iio: adc: qcom-spmi-adc5: Add battery thermal channels
      dt-bindings: thermal: generic-adc: Document #io-channel-cells
      thermal/drivers/generic-adc: Allow probe without TZ registration
      arm64: dts: qcom: pm7250b: Define battery temperature ADC channels
      arm64: dts: qcom: sm7225-fairphone-fp4: Add battery temperature node

 .../bindings/thermal/generic-adc-thermal.yaml      |  4 ++
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              | 24 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 83 ++++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   |  6 ++
 drivers/iio/adc/qcom-vadc-common.c                 | 16 +++++
 drivers/thermal/thermal-generic-adc.c              | 27 +++----
 include/linux/iio/adc/qcom-vadc-common.h           |  3 +
 7 files changed, 151 insertions(+), 12 deletions(-)
---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20251010-bat-temp-adc-8539bf0b85bc

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

