Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56B3E4113
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374604; cv=none; b=V/EYZKu0Ms3PLOsby5DpPOvj/6FqSuNNXWSowcXHSG299HlXz/z5Ji+gLn2Un9pv24OxzxG8+hGM9nYXB7cDgCphdlM7wZe/EkSuhU6tiUaILvj7uR6AtVKEpEh5xhK5+4RCFyq6R/OxzPMq/OP+ISYPveHTiqqjrMKByjBr59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374604; c=relaxed/simple;
	bh=5Dm600bPPTKtyrUOHXhYpa9N1nPifHMEOCkAWXwfLx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3uEYy3Md97839Jp+pOGDj+R3rn4S826QHKS2OjVnCr5nkXgEqeiE3RCQFDDWuM9JDs4/2xlrOUKaAuDcck2rXLMdJGvTtJKPIZo6Y1o6zTazgn69QVUlI5L3409pcqbXxtTeBJirfQxj+HCig/n4Hz0uhgWtXmn0ixak7BadRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrHk/JKV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrHk/JKV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso14308405e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789374599; x=1789979399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygduNeN8JV9frRntM5qlOGqrIEENJQh2+4j84dc0190=;
        b=MrHk/JKV63eWsxXiwSMvRuGT9aF54r77L6NN2Luj95rMcl3Am0GjHA+4DzQgUyqf2C
         VuvHggZLyn5mmhSl+zUxjp6VhtRaw0Fye/KwTycMwVm90J8Wb+pAiK/Mn4BIgTRZZky9
         tHXHwIdXB8BAqbA3jb4UQlr+LkpW1xTIwRmfnK3OHTQ8TEC3xhFtouihYCdGYDTb52jd
         4032Iycp5cc9Th/r/M3bQt3mvQ/8mSgZirLH1jFuiYFa8o88JmgY7KnZvHjIkPMW6h/C
         MzXMSWJ/qzwVrpQ02nAW23vNsokTTjHVUNrYneumOmVhXA52ByPb7Is4Xztlw3Cs69xf
         zeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374599; x=1789979399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygduNeN8JV9frRntM5qlOGqrIEENJQh2+4j84dc0190=;
        b=pAmKa+onFiVY6gVzIVGuU3G17a2UJni7yJ158/H90X0tbimN+Jg3IdIJTSwCqg5lgB
         juFq6rvVkzWqAsFpuSO0402atMWkFUGv8Z/Dzo9uRrozxhTmv3ikZcceAlAQR8J2leDu
         ipV06FdPpMp/wEXsYtwQj0a7X/aKr3EF5DLahbFc4cIO02bZkdAWk6mVLvLOIftXMQYo
         HHHRdeVVvqhuL5nj9ksXUqubt4oYs0Hjmp+A05hRcIKonbQw/3JcnwW2w0wf5R7K1cGe
         unZ059SEvaKUDobujHTluAYqZTLOFKQfXDef5dTWlGw69wWwLx1GggPrWf9lCgnb6s02
         vjZQ==
X-Gm-Message-State: AFuF++nN58exo7bX7efpdKmC3Cu0XEVAAQrNRCH5+6AkVgIQlbULkC82
	LW5kzcmixTVkD0jlCi1iqlBhyOga904pvUlFG9YsBg1FOZ5ltpLWMXaHyeZbnYrLYIZEhA==
X-Gm-Gg: AYBFou2CJdb6iTBLSznETpC2DwLSaHHByoiHsDFi11ykKsz8IMHUGUvfHVcG4d87FzP
	GfroQu080y6U9EixBNojwu0sjlgKyZtIptRjZ1hRg9CtriPbV4YeVazY1E1jlr4O1HtfENrV2vE
	mx7CJn/i+T5K8yA3Lsq+yTTMB87DN0xl80ziaG0A7RCz6T+D/7iG5oV+sQjMk8Etu0zEonCeodE
	FkySZLCawph/XzsinCstg+5iW6Vicl+n6iH0OfKNU+A7WHjzDmXLUQ5JfScbBD0tErsoSnN2gDx
	XB4QiHkjcYng+N77dXMwUk0BSBz2cZHG/AegeW6+LoKAoh5ip3BrQCdzWBogWbNlddc4riSSQs5
	qyYyNDDX89s0vvTHjKh3QuTHLFpIrsAbt0nwTA01gp5kvalbWfNXxNxIbal2ejbAhpVR0UfupZd
	G6wkv0if8YS/NHiMtzVGTcMSyEjQnLrneBF1/Ap7TfvUKq0nr5/eKqUWUWgsABhaDkTgxo/eTVg
	XhLA5jVrh1OqGL12Q==
X-Received: by 2002:a05:600c:198f:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e7a66b2c5mr24553115e9.10.1789374599199;
        Mon, 14 Sep 2026 01:29:59 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm23378826f8f.30.2026.09.14.01.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:29:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 14 Sep 2026 10:29:50 +0200
Message-ID: <20260914082950.9393-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors, the battery cell voltages and the CPU fan
speed, and drives the keyboard backlight. Its interrupt line is TLMM
gpio66, falling edge, for which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

The binding and the driver are under review separately [1]; this node is
inert until they land.

[1] https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34..30dcffd 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -652,7 +652,15 @@
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -983,7 +991,7 @@
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
-- 
2.55.0

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
