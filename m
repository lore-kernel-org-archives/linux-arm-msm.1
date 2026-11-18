Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995169;
	b=dq+j7MPDI+df1EOgu6lqumIp3bY0TTzwNv7957HWcb3bZSJyFonuoL01GhryJDa0fUHz
	 dqE/tm5dLjOrFyp3r/ZPv0nexOVkzuMK4JcipazwPQCp+JMpNetJTH2SrWmsp9cMzeTOJ
	 02chz8UaMD6fWvTKP8cDo2Q0Vz0FUirWpQMGbBMSW2db/CUkC8WZpGxLrEnR5btnlhM+M
	 95jCcbdmXHB2y1YsYjWqOjx3c7tt/nZ8H1ytRU0l7w0ngZBszi351JflHR8wQBhm1Wt0x
	 cB/ZK50+fWfgd7mdDFj5s2Ph1CptBS94KPW7+pwWHejq1989eX7Zy4VDEdb+olRceNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
	b=nCiFznNgKjsjF1lnwki0wH3nAqivaW1P5rcvGW2GCu6oaoS/zrBp5Jm1phsh+nadgAvf
	 dtg+Y6skMiN+to4EUUj0UDlQ4z4J8pQw97bUxeIWjNPrCJ+PcMAQO8Zm3ltfDh8V5hLrd
	 22vnmLheXm8mQE8vcxCzCockiy6rMyKUuScvO7tYvfEvIjvYYskMwoFMnnJj8mPQky8BQ
	 AqJ0m1lnw9dNjrAH+6gr+n4C/YSKtc3nUWpP2K5bbIigF/8VHQi2la1+sQeJjNbYF3zth
	 wp1Fyy726VgwjUNfQh/rAzHbw2CblKanRl7TyCvXBtZKxXpOw5j83yWc7NZBIHanCIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OlMIbgdF;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81329606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81329606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OlMIbgdF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so693462f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794995167; x=1795599967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
        b=OlMIbgdF0wF88RNTAla/QVbDCTtCBqFsK+c/DaRfcr/zqjmYToILqRVtT4rXyZ/rnA
         xT85U6rbGkOpno5ESwCY/QjGUA5EidYC+4Fr4Z+vTKHZQHmYaxTxlHuU60tPgagsozQ2
         ceSSMRJF0LrCMyvFFE4FxwXSLrQ1iobYPdWrAUVulparBJfd7VjmfdKXKccuidQJnVZ2
         BibjsxLnRo2vKLIHQkCVMKjBgADuPAiz57jwGwS1K7eNuiw8DKfM2CD+byKYkoIrQpBp
         xfOJKAWrFgz4zXcXSgkZAN1U9jyVscm3SDgF23bKDMAtT2ZXdslpA9gsVoNGJKyBRcNj
         6DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995167; x=1795599967;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
        b=QWOIX0PPCSPrTwr5Zj1w7lniBg/6sNc00g1SLQ9WX8piiznveLSgEqbEPKAOKC8aoN
         G+mWPVEUBfGsmxbC7G4sWqQUziqAhWtjxbc/WYbVyOjvNP6z2npbz/tdyp5ORrMzuUde
         rC5eqSSXRmEOAhb4Mfgn6NN2EwChLHpir8Xud8lE6dtFfJWo5iL42I7zvRMdMMb8+PDU
         uGaWDo0IN/MdCp5dJAPmDUeo6CSYdpU+SA9ER5HYYgTwOfhbliPPOLIBn+pe8g4IKWEf
         Twq7b60nvMJS0DeSatHrM51xDePepfBVb4fUynQxcb5mRWeZ5op4s4fbaEapNGRKLvyE
         Xj1w==
X-Gm-Message-State: APuU4Z/BA7CxuNe+MhgIeb3pv5kZdD3zH/CiF1j7h688JPX1CUmiUSDJ
	lJGcP1/AzVvU2z2RJ+0qbvLEN/34WXq1a43fWVwfrINmxD8vLjdufRilieohbXs/ySk=
X-Gm-Gg: AZFdTZe3i7vBDAUQClJyrHDw1S6T4d5iex0ofMAn3FfKIJMzpIeV4rHWH+M+P9i7ry5
	8yHY4L446+ZqIz87Kq4efyImRVgzXR3QOG70RHbvWGOWsLmnCVQsCLDykXbMS6jKwdDPuB0/0vs
	jIOiwPqONzWwN1Jf0URPX+uJclDo4Bp6xZyT2c/3fRYcyadPPIh2Oc++uQ47+6UTh6X8sIWjb2s
	E9PGr+ov/yhtVMqF3CHavI0o1waV1MmyVi8S+DsDAf6t9jkmop65DotIq3022YtCmU/XAohcfI5
	oOBgfel45JRMQXaNA4HccO/65QbAE/GkWjgoTZFsG2R+HsGtHjhcvIOCEu8YGJJX2LNwlizMmHd
	MJs/JGLaO5yrSlAVAe+KpQvrOCJAg50StkBkpD1N/rL9PM6FTaZF2aG3CbagzfWM+t8zmR92Mb4
	j3iw7H5/7nykhKi7olX/aUvMwXOioodNEunk+aqZdQzf+S4qmJeIqFrnbyYyDvi8hrOQ0qICdwA
	ZJ0M/rzgYhP7oSd1LcjJjlT6Or+fDbQOIwi65uUXQj4X7QjUWvv1M390gvLxtJGzeFHSlCd648r
	QtQkrWHwIk2dJ7FR8AthjaO5EQamQ6vH952zDGStAJGzMgAMuw==
X-Received: by 2002:a05:6000:4812:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4a63c18831bmr4235011f8f.41.1794995166803;
        Wed, 18 Nov 2026 01:46:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm3422097f8f.10.2026.11.18.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:46:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 18 Nov 2026 10:46:05 +0100
Subject: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
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
Message-Id: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-B4-Tracking: v=1; b=H4sIANxz/WoC/yXNwQrCMAyA4VcZORtoh6vTVxEPXZNplK0jqSKMv
 btVj9/l/1cwVmGDU7OC8ktM8lzhdw2kW5yvjELV0Lo2eO97LHmRhDb1oXNInB5RCZWHnAtOmdg
 wBLeP3ejpcAxQO4vyKO/f43z5257DnVP5hmHbPoEStDGFAAAA
X-Change-ID: 20261118-topic-sm8650-deckard-reboot-modes-6604a5f1d796
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4ZnlLeALSzVqUVc/KZNZljqw7GUsLWbDl9Viy/ZS684=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/XPdQolEG1UfaITInP8T6MtD9n8GC9MTmTZtsIxH
 uxdDzUaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCav1z3QAKCRB33NvayMhJ0XPHD/
 wIeS+uyeMpRPRDpVGwLxG8iizfRO+PVN6UUDPAyeFtxkIiERuCKnOUEdyb+c75fjh3O1f68LMl/RTb
 zr6gKyu847aPS5wGkRxyo8M6Ra8Oqxh7u2/Q8E4pFgn1qkIBz5nn2Ky8Sh097tqSnEn0421nrrcm6k
 cj2gNAF/Vta6Eukz2rLVBHhL6QMv9IPUWAEwgu6q0zkD/pVMYTTZ+ctmM8aqMjfJFE9llH05BvdX1R
 tGgChyr0zO+s7IpfpppS8Q4WR7Ve9bBw79CIjXVC7EvToDdyBelxzfhrzdFJ3LuPYZH7dDLJ/D4z1w
 8wO6wcGPE1QE1hjc6leBE5aifYydlMbO1RSqd5AJDs41+fo+PtlnYbLdG/fD5y/yVoIsWxSaIIGCXt
 22T37ZQiTkyt9BLRD9Fpk9sOLKElVe1NLWIPt93xu0e5fDOF49EW1fdl/OP00Z87hl8GnrGos6LOEs
 QXSKMKGbLL9UdD+8f2lI6gR5KSo2SwYLNjJVYYML5xbG7QfIA7WGECtX+6vdTps12QGkNyxXnMW7ji
 ZtSYusMhpHFB39+tcSqRSYivRshnLOUKT3IfnFanphtUDmVuFtAiWHjgH3wRufDAn2wdUT96OzsWtH
 8bKxNg76F1vQxfA0C+bsO+TwrKB5glqvIcRLlbrhkvWCDOSg99mlBpwHk+DQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the supplementary reboot modes supported by the Deckard bootloader.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3a9d9f7c3742..bf757b551507 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -10,7 +10,7 @@
 #include "qcom-adc5-gen3.h"
 
 / {
-	reboot-mode {
+	pmk8550_reboot_mode: reboot-mode {
 		compatible = "nvmem-reboot-mode";
 		nvmem-cells = <&reboot_reason>;
 		nvmem-cell-names = "reboot-mode";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a83cad8efb2c..111d00085954 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -1159,6 +1159,13 @@ &pm8550ve_temp_alarm {
 	io-channel-names = "thermal";
 };
 
+&pmk8550_reboot_mode {
+	mode-edl = <0x03>;
+	mode-fastboot = <0x04>;
+	mode-usb = <0x05>;
+	mode-initrd = <0x06>;
+};
+
 &pmk8550_rtc {
 	allow-set-time;
 

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261118-topic-sm8650-deckard-reboot-modes-6604a5f1d796

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

