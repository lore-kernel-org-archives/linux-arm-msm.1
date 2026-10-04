Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723B42124D
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109327; cv=none; b=c6lXNh4wJvYI3OiCldWw4Ii9RyciOOclK9CQzl+/UjmYvltjhozHjnZCIicYXDsGgmSnIGMUTdA0RJXNHk7Bv5HlIwmaMrwm6hTerooBen9GvMaITaggG2ql3i8r7NrbTB2vWvCCO0qV9FKFcOQ1Copu7v9KM7oxrpJnRcWxa2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109327; c=relaxed/simple;
	bh=FcdlSDzdUHeLk7zXnkTujjlaMpIZtJvTAJ0MR99MbXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZQ0Y7/cgOg7PojZUf4Zp3FrFToW7rzOYplqPbhBB5v9b/cHJZRcJ9lPtZT9Q0MUDQfIBwkLoP5qhudFW84rYKXbdcoefTUTY4R0c7maN1+6H8nCgBmtDT858W41b9NsiY+gMt9yGde39KI4OBRihtJjUAu3KfpKK5LT+PEQIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5jpUf5r; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5jpUf5r"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so361880f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109323; x=1791714123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9juvpA1LuSjQjypWT3wpnGjBUsPRSPUA2tivnHQSsM=;
        b=J5jpUf5rCKzabzf5JO1ylTiC1p6WkF3ifTg0xWi40u4ttY8QQ9NoEQlJ/VX6xahzjF
         dRAq6FwUW929qiLmL+e2dzKDJ0VsBiJY1YE1LrOhJb6RKHNQ/SUUnqocCQ3ACPh8hd8V
         bqm5+oG5cU38PFXoJuKvI9AThFPkwKerTxr8zqmTd97NNyHarmPj/j8Y4uiwy543sSqr
         8LBhMcZTHViHchcV4R9wtxiZaC2hiVwOb0+uEk6YsrCw78KQp5WSmsc4OxaXsc5ewSAn
         nH2EW3b1V2vWj+J4h1yy10v6AbnVof6+TxNCWJjH/gUJWgSH705UelLaU5fDwHWa20zA
         JgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109323; x=1791714123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9juvpA1LuSjQjypWT3wpnGjBUsPRSPUA2tivnHQSsM=;
        b=OOI5juHcer2CR4hiL8BovEyz17JP/15Z/Yp3+ibTObd7R25prZbJb3SmJX0iSlwl5z
         P7wvqToM0GG6CgrJHDUIRTskyQu26usF7fdxBzgzKlbNnMn4VmTCQUHm1XUMnaHZw+PS
         JedcP11wahiqroHTq4bIa2XS5bZ5DkohUea/zHLAp2Qhy/BPu4Aj6ZPWO9uj6iVuN3AP
         QVP9E8xAy4D3SA1iE/2H579kUwtE6JHvJsNWD3KqvOgGGrtkll2yOvBF7xsPn614b618
         Y0dgEnRXxNuHVxmg+WTyogvWfwPGM0xs1+tzuoPc3FQnuzg80IKxKSk0gCSpfFcPS/W6
         adDQ==
X-Forwarded-Encrypted: i=1; AKwUvByCgseydI2bGSblfhlsovIm14dAf6v7UvBDYFTnULQmKAo9mMEvSbZaqNfIAiIaThIcY+q7ivMosR7C2qIX@vger.kernel.org
X-Gm-Message-State: AFq9FYJYMidg+7kaZfxEpnVV3FB7kls6Mmkr/P4L1MDPLsYmyrK0ph23
	EbGbgjXAcBT0tXBxlE6Ryb2MYquC4wWeLLPvtNtB6wTCSk0wk1Y9Jrtw
X-Gm-Gg: AYBFou1gxHAUceyKcduQLdQs8aPKr2AbCLaDTH0zh75hjCTnWsMM8ACoHkbe5aUJPOa
	7NHOabJRGQD+MPA6mk6CACOJDxs3P36x50l0iqLOOsElzFEAJUh8NfgiPVC21hdJfBOmeMqKeXc
	h7rM2teWEhvLla/qDWF3IwTIFMIts+M4vf8sjoMswJCgm/RuQqbfDllgh5ieUJNzuwcfmSnRwsj
	fCS2aO27gNlyrMIC6d0h7ALg3pL3Yvdd3/BN5/R3/JAe0KX+zWXcMLNmtAYFA+vaN9E6Wm6fjuE
	pZoyv/Yr37peAcAI09rpGo9vxN7xdt6Yms5fJsUaI06y9SlvXBxAWlAthhVfJxifU4x92eauvT7
	FZi+3niiMLOMiDGicmfPpjod/6bxufKWrjc7fqKCypYzM6QjClw9KoZy3WE9C2Y+FqKWv77dIn6
	CZCjDWA3L9cwFQS7yOjPoiI/yzUQxFhHNELM1R4xQxsFhydctuM/q4mF3IWy/aq9vcSUZikryY2
	fBMd+0s68prMd1o8FY04tfJZSWhhhmoGOdiCdTBrz0teGFUgvky/d5KtaJLEanl6eO+SPVlt1Kh
	CeNJ9y25
X-Received: by 2002:a05:6000:108d:b0:487:27f6:a4d3 with SMTP id ffacd0b85a97d-48b1274ec77mr9525780f8f.35.1791109322990;
        Sun, 04 Oct 2026 03:22:02 -0700 (PDT)
Received: from pablo-macbook.tabby-carp.ts.net (128.red-88-19-81.staticip.rima-tde.net. [88.19.81.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm17101811f8f.10.2026.10.04.03.22.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:22:02 -0700 (PDT)
From: Pablo del Arco <pablodelarco1@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for monaco-arduino-monza
Date: Sun,  4 Oct 2026 12:18:49 +0200
Message-ID: <20261004101849.34191-1-pablodelarco1@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
for the Monaco EVK.

The board boots under Gunyah by default. This DTB lets it run Linux at EL2
with KVM when the boot firmware is set up for that.

Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>
---
Build tested with CHECK_DTBS=y on top of qcom for-next. Not boot tested at EL2,
the board ships boot firmware set up for Gunyah.

 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e0..859586cdc 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -68,6 +68,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+
+monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
-- 
2.43.0

