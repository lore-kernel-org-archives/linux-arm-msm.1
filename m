Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A1375F8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373827; cv=none; b=LHhvGGbmz4WE11X662tjNEIFBAURgCGY5hnR34b7sH2Fn1tE8HpvRMZgVHpfxTj+vxcy54lnUHsSwFgW5xfu7kYCGXhrzachklVRJ/tzP4kbRD0W2D8n0199624BsgLGngBhFK5+cCs5f1bg5ICAHAKVU6TBkirosSTK8XHg4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373827; c=relaxed/simple;
	bh=U2fObva/T4kb4gnGW2Nd5bcGjQpO3qUpI3v+NuFZT80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDDpf8vdIvvqvFftEj1upWcPBgytoERT9Myb3ffjp3EdbwwVUalPHmlQrqY51cDT/d46Kv2M1HL4hPoGqWXZ1B1ag9L0iFalFtRKXE5V2Td3OLiNPlzwBC/00pVuY/EoNt7zBL+RcTX0CZrk3BG9Hv8SUm1VHruVt9RGXh/4xno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZK4k8zT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZK4k8zT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so871936f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373823; x=1789978623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDdWbQbVn5+bafx3DiaQBgQ61FY9LOrox9bmnpws3Bc=;
        b=IZK4k8zTtDuva5FJNWkxh/YAunjlvDUeOuwsPgN0/ONSwLidsMf1GdJTDRv1Gskf3R
         XXM/WcoRhUON13Tb3oPy+oTfMNa57c6xgyMs3pJuklo7HzDhLadq/Au+YLqDbiESiMZN
         NIof1TsyDzE2XtBtipxEwkpZ9gW71nJcwVk2wB/WveaX4RNc2PglNl3d74wU9/meX88I
         3gYlgGXYpf7xDinlQEQtyxlR8W7GXgewfNtp2Rr29oeJBczewPSQ1uVi4vs/QTepJ7ko
         rp9umskdHnBESNoAo/pvZeD7ZfTk+jcr8Idx/D+f25xblIVbirJxTtOENxVHmFfH5KuW
         iMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373823; x=1789978623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDdWbQbVn5+bafx3DiaQBgQ61FY9LOrox9bmnpws3Bc=;
        b=YG0/xNu7xKVmyJ9fBmyHDklZGzz9Ud1M8SbDBeK3mMdOWbx1g3qCjHM3aQxecrDhvI
         dM6V48+SO/pCJmTLqLbWmypvhUD7gQt/NDVJdNHcwTEPAztr/BuFC/pI9mPZLDz1QAKJ
         dIHPUVKo6ZrUPtZ8itTrZ17p10703xVh55CvnkwwAglwfXHXul8b9vQnC19qTatPKZQ9
         4QXnuCQ6k4T6HIBVb3sfl28J2VWuQy+hIedz9z82Z9sPPGxH241WC1QhSl5yFvH8GsdW
         za1GRaYq1HI5s6H3m0lOzJtIJOdvPBYr62GAQ+yI+ZY+IrBnzF5D+J2pZCzsykUym9L7
         MEXg==
X-Gm-Message-State: AFuF++kizuMIQsBfSNlr4p2qJTgur3ja3VtfsKyU6Nt5m8XQ7HWvaVzJ
	E1Sltk30ii0shN+t+4GBuZ/uAy+03V1xg92s4kT24Nz51A0U3gjfaFme
X-Gm-Gg: AYBFou1ApQFrBhtxtbkEcV7r6b4cE6Qy5V3PprzOE+qdZoldeeiDjHau/7UlZArB64j
	GLmwdvOPlLfe5T0SGpe3+u/ZErEj4g3JJwnMZDCKHOoY3FVYFn09jhLTANliiysQp/xtzET4JjQ
	2kHV01dZEtsh9gMYwl2F4MGhn7wSCHpjKEsmOido/x2cRPllCaXtj7/5yYNkhJm961AivX/oEOt
	6dD4gr+YB2fB77ZiL1fFUwvB1Cb/AIGlqB+NrT7xyO8nPIhUD9V03C36wH2vRlkIJVrJi6WX3EU
	vjsHPQNG7gVbj+zA2Naf4DcvW7CL/tvo1TptnNSbbhN7PYeYc8lnq3SOIsNawIxdaevl8ndGNgl
	XOjEUP5e3TOchC9bECgokGD6Gh5FA2rUPymwFLYvnLSUHmSy2i9aumUY2+GVAgv8aQF7XSCacAS
	emoB8N2W4ryZ4DrrC1JllAnBOMAO7kjTfvGmVCS1WjtfNfCelIFP/flUfmupx9E+fL9h3giiNoQ
	dZcEsV6SbH3U4JNFg==
X-Received: by 2002:a05:600c:3e17:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49e7a65e422mr30100785e9.5.1789373822299;
        Mon, 14 Sep 2026 01:17:02 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221963dsm202053055e9.2.2026.09.14.01.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:17:01 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch
Date: Mon, 14 Sep 2026 10:16:52 +0200
Message-ID: <20260914081652.5935-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The laptop has a camera privacy switch on the side of the top case - a
slider, not a mechanical cover over the lens, and it does nothing to the
camera itself. TLMM gpio99 follows its position: high with the switch
open, low with it engaged. Describe it as a gpio-keys switch so userspace
can act on it.

SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
camera privacy state, and it is what the Lenovo WMI camera driver and
Dell's privacy driver report for the same kind of electronic switch on
x86 machines, so use it here as well despite the name.

The embedded controller also raises event 0x29 whenever the switch
moves, which makes it tempting to report it from the EC driver instead.
That would be the wrong layer: the pin is a plain level that tracks the
slider position and needs no EC transaction to read, and the EC event
carries nothing the pin does not already say.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34fb983..b5848991dffb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -51,7 +51,7 @@ sleep_clk: sleep-clk {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&hall_int_n_default>, <&cam_privacy_default>;
 		pinctrl-names = "default";
 
 		switch-lid {
@@ -62,6 +62,13 @@ switch-lid {
 			wakeup-source;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 		};
+
+		switch-camera-privacy {
+			label = "camera privacy switch";
+			gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_CAMERA_LENS_COVER>;
+		};
 	};
 
 	leds {
@@ -958,6 +965,12 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	cam_privacy_default: cam-privacy-default-state {
+		pins = "gpio99";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";
-- 
2.55.0


base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
