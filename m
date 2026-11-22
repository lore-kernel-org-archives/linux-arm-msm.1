Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384116;
	b=yqzQhp0T7iy+ly6zgZ/nhs6YHZo31e3CpYC8hznbgIQt2srqqDIymK7V4qea/MFHkaTB
	 b1ubGoCHNmIj53+F/JFAA8+iDV/dbADhfKxchKf+UhzZ+4ONtnIBlaKJrQNbIxzIBIVdV
	 5dZsz4nxqZLWQ3P2j/622sNo25E23Uc6Hjsf9bh5Ac41M1a68vxk/orwgGd1R0LE2y7Pm
	 zvXka1TP6QDhqK5hcI8D44FRGF34ctuuGWQhtpO9HsEm3Fy5QWJYPNB6eETli8HOOF8YZ
	 hs6PyhJUXdxwybUtluWwDp/IghkhSDEr06AIIaGzxbersy8RNGWb1mGubdre/+mRwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384116;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pSLhsIbwZ9ueq868k2rrczxmLa+WaBFggzzt2CaJAhc=;
	b=dNuaBkQV+q2SmU4B3Jg350Cbj9YZGrbgGY/doBxcQ3nPLod06ocY/wS0vZM2wR0SbvGA
	 uCRD7if81jSeRouVIDulhvnogmakdWEhdfnFMxaIChVMY8arKlSTMEDzEEWaz1/6YdyKX
	 CX3c3yOybtlH/Wa/9uvQbWbOKPLKAWMNsLG94dTMhBBZA2X0igLqX+71lMEKi3WTAmeK1
	 gSrJrxRgxLbMGy1/3YYOl/vufahdPBDycpW0VLjnUrbtngKg4/DF2qBJBuig4Ezg1YKF9
	 ZQbnEWRzgiXstdu7uaf9+PPHoaPBynnkXBsXZuL8vD1+TW6dKkLVXlekOntHbdsE7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=bzvJA75G;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB271606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB271606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=bzvJA75G
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ehZBvKbSmJsHXqz+5L8veHls/wX4qsWZg42tCt+K6cs=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795384113; v=1; x=1795988913;
 b=bzvJA75GcRZudGWFyK6rC5pyVGLIhSgC1V7OAsOvsdsxOGdiK5k7zT0d0HNs1HA7kFTsVzyq
 lWhFV6Hjxo79ecb5AOJmWOqIinjqufG4oWxgompd8o937IevlZpE+w2Rf3Q8xfMH5mXFqQroItD
 zs5hNTO1IPxZae+8Xf5ME9AJC0ZF3HPsDj97j9hufrAdEk0uFPegpMoFvz5OmmxVKjpeU+bHB25
 L3nWy72icCTidvHBpPET2TjMmqm+kh1y1wLZAYQl9XDvaML6oaCm0zU4QNwdWS8SbNiQvlFEOJT
 rpWZfbjEPtkiNQJaqBJeHXHKtKJ+MavQlP6j8V77CNbjw==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df95091bd50bf055;
	Sun, 22 Nov 2026 21:48:33 +0000
X-Mizu-Trace-ID: df95091bd50bf055
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 22 Nov 2026 14:48:23 -0700
Subject: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Enable slpi
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
Message-Id: <20261122-sdm845-lg-judyln-slpi-v1-1-2c77758618c6@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+2ACRokVyku1EztSBolQ0uLe
 PdC3wHeCZOqYoh0ospbTfeCSK4hLI+prMKaEAm+9cE579nSc+h6zitvr/TNhS0fyq6TMM19WOZ
 B0BCOKnf9/N/beF0/rkgQn2cAAAA=
X-Change-ID: 20261122-sdm845-lg-judyln-slpi-14e6ab56cb8e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795384106; l=1710;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=ehZBvKbSmJsHXqz+5L8veHls/wX4qsWZg42tCt+K6cs=;
 b=R2U5ZT1Bt22RnCNetIZh8dMc6uQyLFAm3bfPdEWrixrtK9yMEWbEMdUlTAT6DhYbdTq8QyrvC
 uG1bzGTwCw8ClwQQ28GTDiXI1dHI8kwxnlt/v42W25aiPOezxVHcKNI
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Set status okay for slpi_pas and provide the firmware-name for it.

```
remoteproc remoteproc3: slpi is available
remoteproc remoteproc3: powering up slpi
remoteproc remoteproc3: Booting fw image qcom/sdm845/LG/judyln/slpi.mbn,
size 6627444
remoteproc remoteproc3: remote processor slpi is now up
```

With a hexagonrpc patch
https://github.com/linux-msm/hexagonrpc/pull/30
and appropriate firmware from the device, sensors work now.

```
sudo monitor-sensor
    Waiting for iio-sensor-proxy to appear
+++ iio-sensor-proxy appeared
=== Has accelerometer (orientation: bottom-up, tilt: face-up)
=== Has ambient light sensor (value: 21.000000, unit: lux)
=== Has proximity sensor (near: 0)
=== Has compass (heading: unset)
    Light changed: 6.000000 (lux)
    Compass heading changed: 103.589447
    Compass heading changed: 103.591545
...
```

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 349faa123ff1..7c4eeff4dd0f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -141,6 +141,12 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/LG/judyln/slpi.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261122-sdm845-lg-judyln-slpi-14e6ab56cb8e

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

