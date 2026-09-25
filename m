Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2254E50D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363838; cv=none; b=NzBYbKcqvL8fuOfBePK63jLFCoBOwBA1dWDNXqarIaErX4e+mn5H4CqkQMahxKqwkpFkRHDy7L0K77ahYKtq82a1B3XYuU3H+J1lz1kVLcbBCB8BqBwU3PuSxlP8N5gyk4rX5ZiKmgMnBunvMArSsY7iJVus8gy0aDpbhc1fpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363838; c=relaxed/simple;
	bh=eut8Cv4jfu2+xcxUpOFcKOIZy7il2Fd4FaptjLAhI0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muVMKh3e6aQQEiHxO/WJO/nuxX/HUmzxX7TXxV0Pq0R+fZsyTuC2gDfjRsowtg0T1EZ/p62Arp92afZ8sITSR2IPXUVGRgfp6CR8kUYSpBP88am2lqpQFGN9QHbIDzIwc3+ejuw/Lif97kSaugocwOUAEjHkGIxupbTFndlj/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JTNXrVcG; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JTNXrVcG"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so201464466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790363835; x=1790968635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIUbYqTz3s4MkcnIs81Mp9c9fGlqFAgb/HyFW+foZ1Y=;
        b=JTNXrVcGYtuPL/Jr+fr/lve9oCbNKcV3IWLq/7Rpnd0cWmGqjZZIkZKCE5GwZhS2nC
         yv1qtmlZA5qK6G+z7IJzZItxloPMzKXsplpSbmYDjZrXAdqt9hBoXToP0DxJ7T8LMt1A
         Hwo3PgtV5UIgTyy7oOUWwfGNTE+E8JpYJ2j8hTnk1qwlvedvje9Y9x0BbrzUPgKR/ene
         3MAdatgW3BjE8gjBsOwpQjKI6FaQ6Lm2IYDYyvl1+Rs/wXbQYUDQJc+3E2bSJf2Q+j8k
         d6wvrFzatjuMwgvYGX+82ox4m5BzmbuuFrM1cngyRjLutu2CcV9WpW/NFZnYT/kL1889
         +20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363835; x=1790968635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIUbYqTz3s4MkcnIs81Mp9c9fGlqFAgb/HyFW+foZ1Y=;
        b=dgLoDMD98RXrt5eKkoCIK0IVkgPiabeuES5KExydiyN4RPFxufJxrh90b3vfTcUbR+
         +oeuLH8cBaOv9YcY1CkeYtBf85NegZyIirKouH72aKZtaAzY8IgsyR6FP3ar5AtC2q3m
         pyEhhoqrCjc6q/EEP0/hIvYnrJnmMdq2WozeZ5T7AAv1eS52NKVsD0M1tqToBDAPegqd
         izKMdOEdvfRNUztMPOwsCIcyIZPI4ZE7SuiN6Q1AothQRxl3aJyoA1FDmjHuuOVSJSss
         B+/8K0bKLmq7aCASmTZiwwwDdxbiwa9/lNTeVjnCTfVk4uGZ4PuGnSCVJ76EzEO5JMn6
         D+yg==
X-Forwarded-Encrypted: i=1; AKwUvBx4VqU58Wa3b70hXVa6jHpqVIZBREZzUwvyOpQj4GP+gy/3vX8v64cpB++ozERr6kPVhy/+rjnMucwg2Wcs@vger.kernel.org
X-Gm-Message-State: AFuF++mCUzPsmbgWtnPKgRjCwzg6PYkIucIjkeHMYgAN0IVvYgHSRbfG
	oyPAQPU1oYdkzDQINyd8zAriuXrhkifa4gAyqAXPcYBv9e5GPibn+QiVin/gWO4/s3Q=
X-Gm-Gg: AYBFou11PPBpwdS4P95Fye4QZTs7gAl2LvAyx+flUkTlZ1l1pAMYyEbrhTYUDXS0YyS
	VMHtVwIxkJ4hwRAsdrBoj3MaQirEfQ7rPcp5jvGdOIbVVOn6AyRirvkIs5qPzq6sxIFb4s4IZE5
	vxjvUBpnTo93dx1tIpXauBb6mmhv1iZGa1BrEcUbDAdkll3syJogjBxd9N7dLQse6C+6/y8mOUw
	rIfKULmu70jAUNFLyDWHeN0sQDOZWzlDxAJ5cYo0FcDf3zDcBte7lxc7Zapzu1ZBV4e/zmiIbGr
	Day2zknXjfmuIWf2qgEoxBnRTgVAZIWACkeLD2QUxbXIjpPrLHnUuPOslasOFazw/D+GRq39zTM
	oU9LoWvpm8SEYvuuyuw4meisXLdme8hsNG+ptyGCsAvSVRjZH0B53F8Xe3mCiy4JJ4FgkPygcV3
	8Nt3Xagn+Zwov0Qu0C6+BiFwYwJZI3464YUuo2OfdpaTxClxjWJZDfX7hhKEFJQfm8N7Q2nRUx9
	Rxe14MuXy3Ez4kbGN23ao1mZqpAJJbmZljDsmriXUTSbYNow26c/QY6eNw7AXU0qStIA/9TZRka
	Y1mklJWr4VbZt4e6inJCv0q2osyvPvjf
X-Received: by 2002:a17:907:c23:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c2ac23dcbfemr638910066b.10.1790363834719;
        Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-212.globalnet.hr. [213.149.37.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a309sm160881566b.62.2026.09.25.12.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:14 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
Date: Fri, 25 Sep 2026 21:16:34 +0200
Message-ID: <20260925191706.1579990-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset to SDHCI controller so it can be reset to avoid timeout issues
after software reset due to bootloader set configuration.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a11..ecafd4cda6e7a 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -471,6 +471,7 @@ sdhc_1: mmc@7804000 {
 				 <&xo_board_clk>,
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
+			resets = <&gcc GCC_SDCC_BCR>;
 			non-removable;
 			supports-cqe;
 			pinctrl-0 = <&sdc_default_state>;
-- 
2.55.0

