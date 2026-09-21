Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB295494A1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983264; cv=none; b=B/wHc62YIv/dfmWiyFb68sD8ySP/7BujVjSVGJMaOjkuyPBgWxhgVRNb261YjV86cp+KSdy+C7EM5V4tkRomsywGl8terFnhXm8btYYOwfOnfjECEkt6GoxnVgN26sZXU2NwfS3VHKP9ByPp3uO3i6TifDVq3bx3Xa2YIPG2HWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983264; c=relaxed/simple;
	bh=1VbwLbBIUh9b8IPRANpvWaAwiHFOkp76hogbIk7DodA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOdqLH9HH61vVRtlMLG3vNNePitzWgz7FOlgSO8ENlcFzzLpwAKPHsfJxY4u68tS2xv6/ohj6jKOEorbzv4YhsexkvfaoHFhOjYWBDCsZmhjttGBPbOQXzLHEHpyxBXZPDEGEVgBb0akpOS+X6ABMOj3lxZv2hTICTw5XDf6ApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON2VBzMQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON2VBzMQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so2107189f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789983261; x=1790588061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vr1Hjh7AwrjiwGzdIsIwelbKhNuOiBeSErsKBn6SLyQ=;
        b=ON2VBzMQTVV65+OKnarhqU6gN1XErOuXXHstHNwRgbPQ/SI/MtlpmcJ4i6DbH62C0Q
         NV5BbAj0uJNJTuNYvwgibJLVUf54NMfi3Hdklv5rJ5gBth83TuO1epE6wSfoAYb40Ksv
         GUu4696HTzxvvBJKobe0W5pgUIkbfA3dGt9rwJYL342Xpq4ssBe+/fv4834wtJSUzmTR
         LZAsOASs6nu4nC3LUroqpIXx6FjdKNVdZWBuQPbCh+YRygoUeF3v/L48Ymlts4GMLYKX
         kuQX+1x7ioOWLtnWhGtwQ3YQd6sw16OThbaCyTqH9Mcy7lPvPPlRPWbwoMnvFCWOwx9X
         BNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983261; x=1790588061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vr1Hjh7AwrjiwGzdIsIwelbKhNuOiBeSErsKBn6SLyQ=;
        b=bGHMcYZRjy8ixJ9l9SIBzOVVLie6lOCSOFp7x6sj+KsSkVt3FHGgoB/sJad25pVUIE
         UMCysvAFXlcUQpO4fiZ7ooFfBxJsCshfF3Kin+/JhOXud5qw3ULc/nmooLtdjl5TKXdr
         Dxj82kWirQabSHOnorxmBqRCdOZwrqPFdXpWP5RtsHeQy28qjSCH1oMKb+BpC7O+zJ+v
         a2/rItDKHms3T5/dYljDIFKjNDA+S95l1sUmlHycJ9U3cAUpWWR2kIniNDQ0mL7sNoY3
         xMJ4M/mltpqNSiNcMTCdgobxvcOseOjqCmyBSbAXgnquxCBO77rF91/hG3Md3IGYc6R0
         3i7Q==
X-Gm-Message-State: AFuF++n+KHzWCTJHN4hZRqi4r0FV/h6AMqQ2MqJhoWCQImJ+NfLokaF0
	muSR/hyF4/HXomCc5v5yt0aP9sIkldiEw3Zldr89Xn6NqdFwHgPJ9O3p
X-Gm-Gg: AYBFou0dUW2lOY07ErI6JHJVLr29NIh/Vk4WMEEfslp2HP9oBnqhxdlLfHMSwXIGDv3
	7602j/1X3uA6d4R5N+9FTNAOrZGcZygf29kC2c25Typp5n7/jjIagC1xWXAZ0RKlxmlmm74Pcrx
	oPxBxXVsOqnTXoUoP2RQXANN5yogWX7I2tfyPwC+FidON+f93e7Ab4nm0Y1P97M+t8OoS+mcqep
	gCRgbVQCFK8LdcUF7Qg4PK78hIYrku7V46vKdVrSY/7r+W+cQ0dD0Ir2Fnea08DFXebicT3oizh
	eFvb86RRKnuuaZ5dMj2ZVjkD8PCSCnpMRq0g9AK1yQN7oehaY7V8LCznp2ACl4z5DNRVYfom1y8
	sJ4U1d/rlvt4wew6mcCXcAla8M0mEA7aoI5gRQfdNcqVKM0PT0LYUv3/v7S+qu7S+GrVbJKyOat
	Mdbe7L7qlTDbc2e2G+aPjnO9lj6Hlml3cWbbcminqBfpNio9/B9gfDvDT23N/uT2QExCsq6g4Fh
	bFQKUFj4acjgEGx3WThuNCWwj2+xEIYmaM8VjHDTy8uQ/UTayT6uDzPpg==
X-Received: by 2002:a05:6000:26cc:b0:487:77c:f704 with SMTP id ffacd0b85a97d-4871e3834f3mr15264648f8f.57.1789983260787;
        Mon, 21 Sep 2026 02:34:20 -0700 (PDT)
Received: from gil-endeavour.hs.rfd0.com (bl10-2-111.dsl.telepac.pt. [85.243.2.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724595289sm22906820f8f.29.2026.09.21.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:34:20 -0700 (PDT)
From: Gilberto Conde <gilbertorconde@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
Date: Mon, 21 Sep 2026 10:34:19 +0100
Message-ID: <20260921093419.2870168-1-gilbertorconde@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO13 supports the PWM3 function at mux select value 4, but the
pingroup table leaves that slot empty and gpio13 is not listed in
pwm3_groups. Selecting pwm3 on gpio13 is therefore rejected by the
pinmux core:

  ipq5018-tlmm: invalid group "gpio13" for function "pwm3"

The GL.iNet GL-X2000 drives its fan from PWM3 on this pin, and the
vendor firmware muxes it with select value 4:

  gpio13 : out low  func4 8mA no pull

Add pwm3 to the fourth function slot of gpio13 and list gpio13 in
pwm3_groups. With this the pin muxes as expected:

  pin 13 (GPIO_13): device 1941010.pwm function pwm3 group gpio13

Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
Signed-off-by: Gilberto Conde <gilbertorconde@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq5018.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index 03cfba9534f..84392fe258c 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -563,7 +563,7 @@ static const char * const qdss_cti_trig_out_b1_groups[] = {
 };
 
 static const char * const pwm3_groups[] = {
-	"gpio45",
+	"gpio45", "gpio13",
 };
 
 static const char * const qdss_cti_trig_in_b1_groups[] = {
@@ -689,7 +689,7 @@ static const struct msm_pingroup ipq5018_groups[] = {
 	PINGROUP(10, blsp0_spi, blsp1_uart0, led0, gcc_plltest, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(11, blsp0_spi, blsp1_uart0, _, gcc_tlmm, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(12, blsp0_spi, blsp0_i2c, blsp1_uart0, _, gcc_plltest, qdss_tracedata_a, _, _, _),
-	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, _, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, pwm3, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(14, pcie0_clk, _, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(15, _, _, cri_trng1, qdss_tracedata_a, _, _, _, _, _),
 	PINGROUP(16, pcie0_wake, _, _, cri_trng, qdss_tracedata_a, _, _, _, _),
-- 
2.55.0

