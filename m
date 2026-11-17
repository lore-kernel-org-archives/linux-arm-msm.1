Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913796;
	b=mmTYUmJAei+BczylOqOKRWqk2FSE+BeTsMNmgZdC0pRZfXbPPewY+03upprVLTFN4bQX
	 A+MYAljvo3EhbQioBLNO0IWDevI2aWv0F+SrIAVSGlGkYGI4li5EXzKhAJ3RsmySEgxPf
	 4FC2qucdv+sPVWtt5qd2gFxpVkBl0l+qp7a21K89AJK2ZMRjRuucBJcF55wW1CLtXUHJ2
	 +n863gsKYwdVuIekU9y/Xr7Hgso//W0rQrVlmtGOzOKd8iCmHJVQ4ecVNFAxnas+dwA9R
	 4n0HvF/3//ubC6Sw2Rj6JTlJbkq/pRkVnIyLChbP7nb3rMXxBgeV8vRLgoNFBdgXIJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/EqLZTUDMhPlkceDIaWpBG7Dtr/l00OcSGXeCW+uLTE=;
	b=oxGP+LA5MPLKMxUFDqvI4WCealrizsn6qD1yC17f/frFtUHUBVc1LCw8zF7bivDctDa1
	 4XLb4fO3eJRwJIs+YUtNbQ/miuCITusUlhhycYdbBPF9S6Dc+cHWjOqxTR9/4w7H+XTE8
	 SZpxOO5JVquR5lMz3JHyye9neO9qyubbYnbCxo8qF1Bb+N8p3FtDubXozqbhGmGXiuogA
	 hmMkudkvLHR+KNdPknMtZaege1F479v+icqHHiaftcbTgU7RICX+aNYpGSQ/5m9IplmT+
	 hkOJrMSSPRsudgq1bnDgsA7HGTowG5kzSXT56Ovry+8AyovXnhK2iOwa8hxAGmNlqaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="1paC/UZe";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1C606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F1C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=1paC/UZe
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so5006729a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794913793; x=1795518593; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/EqLZTUDMhPlkceDIaWpBG7Dtr/l00OcSGXeCW+uLTE=;
        b=1paC/UZe7AOB1VNol45f0EVVlCQSmD48EMl+iRZ/V9Qe9JARGUIrTf6QIxI1RIVYD2
         7Yck65VF+Ev2boLZg9xgfX1MJ8bYraMhevW3X8pvCf6XSBFoE8eFLNyg/WIitI2siKgd
         tJyWOfxHoEOW5ods623LCo/Es4A+gtXev6T0glcX7CMo1gyDmJJxgDJwrXJqxM2vH5p/
         paAScXeGRWZ35Sq6wIVWkw9YcWrn/2DIRifgypED+LmArDa4yWSKKYIlv0gyNwjKXmMH
         ZyHQgZemAdfd6g5ZuwSSvBY7rqw3ThiUujWcT24d0PT5z95xU+pJRNPmdPfVx27vQOel
         n2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913793; x=1795518593;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/EqLZTUDMhPlkceDIaWpBG7Dtr/l00OcSGXeCW+uLTE=;
        b=1yXoy0tUDHt6+pWx4kLRPlPRRwvhXVXXUrH5IMHVmPOXDM2iKXUfTdsTJcUPUZ/wLo
         LcZo8bc8kLKNBZ9JXIpyd3WwWIyy47ryVIHwGaQDMtjmxDPhEoogqYS6ndhzTxAHAweh
         YX7PnfnAgFCSaUfJsOEDccf/5FF/fp6wU6zbHU75jiENcZDBfns5dX0IfdzmbOLV0nn3
         VgVrcCidlcD/9bnaeyFOUHFRbbW+4HR0/1C28/Cbg0c8+1xg9NMCgbtR65I4MhTw3FS3
         yue6oOBdmO5buV94jrzJg/ICtjg60ZB1FA/+oNI5IfpOM4xxdaNdvGPF3Ju6NMNbRmX8
         7OiA==
X-Forwarded-Encrypted: i=1; AL+hErETxgQPgMii3TQPK2JVpzPRPKrS/x/chpLh4L85LUQRdWtMGkQqPj0QdJDQCOPm4sJE3dcnq0brOT/UxPEk@vger.kernel.org
X-Gm-Message-State: APuU4Z+UVrrv14+c50Ouy8t8B4IEBWe8IloDaGHOC2Chv0LtiUcnQkeU
	Iei69iV9zTdUy40xqIQ0dF00S6Pt05qQe8zD+JrNsv1LCXWTG+DfmtGxF7DjgqvSk8hqIOeKAcN
	9NY8EJIAaEw==
X-Gm-Gg: AYBFou209OGixjfi/gDEXLPtVpJFFakohIlfLy0/pZBAh+RI1PgwXr+XDjMImfFksPE
	8cnDhKap7xGYCeGHgB8t6OuzqXCH8ZUmZHhUs4ONHUj3HvgxjaFecvBbcMpC4/8KZjfjq+lfbRJ
	wzO9mWEZ2Scp9zvgrD8TuDkf2myeSzMjxPSE8Q+vLzzl50ApqJJTJBoln1IzvAq0gynNAJeFZG0
	AxFHxjFD/cqUMZJ9P9smi6z2q84jkfOI5tKXf5GZX8TtUljeS6icyHd0rGtiO9eUa8oJ1biopXH
	zzkEUxfWLXDc7qVc+vqy9Cntqd/qnL6cDYX6te21lQAH6EuxkewbXENPweyRdihCm9JilIHdrsJ
	PiBTQnCNsgzHszBo6nr0Zdh51iXiYRZCydRhFepxIstg6QAUbbh3ckxPkmXtlG1bSdjyQ3BAsMo
	FSgHzTxK9tBU/gqV83m8fIbbPvj04O5vpQV/7kh0P0zXAlljYlceLLaRV9XMMMYXFxQbeOZrsKX
	DP9FSDqhdeHiTfuCX2aUo1KAlOnsIIrInrF5cR5Nq54w2aTaAVQT3OkkpPT8h5Jcg1K2MxJb5+1
	by/YGSOjE6EvHcnz9S2vUMowetcXQxzMPwpVg8fO11EbNQaXl+yd8HX+W3cKmao1YuDQmzsRPYL
	e9naZSYU=
X-Received: by 2002:a05:6402:5630:b0:6b6:e857:19d8 with SMTP id 4fb4d7f45d1cf-6b7c0bbf8ffmr7846372a12.10.1794913793290;
        Tue, 17 Nov 2026 03:09:53 -0800 (PST)
Received: from [172.16.240.105] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm5803509a12.17.2026.11.17.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:09:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 12:09:29 +0100
Subject: [PATCH v2] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
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
Message-Id: <20261117-fp4-regulator-supply-v2-1-d6585849821c@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZjSkEJdeQ/DouAUxiBtWiASw
 t0teACXL/nvvw0iBaYIt2yDQAtHdmMCecmg7c3YEfIzMUghldAiR+sLDNTNg5lcwDh7P6xYWtV
 orUkrWUBSfSDLn/P2Uf84zs2L2un4OhY9x+SvZ3fJj92fxJKjQFXJqjJNKQzR3RoOvncjXVv3h
 nrf9y+SRewIzgAAAA==
X-Change-ID: 20260901-fp4-regulator-supply-7f6b999e9624
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794913791; l=3743;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bNSXLD8R7osoKkLGMtIbMenLvf8i5vfZneGntJkMw8E=;
 b=FfB8C2ZPRRcId2mEBxFyqZw3SUgOavnm3FscUT3lfYHiRffRLkjc3jcbKYFgj0XgHbAIqrFX9
 3b5Z4oEKHu+Agvk4hGamlAn66l4MZdvhaomh9DSYo54itKAWGcLeYbS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
the parent regulators can be enabled when needed.

While not strictly necessary - I was told the RPMh is handling enabling
the parents - this adds the hierarchy to regulator_summary and not
parent them to regulator-dummy and really ensuring they're on when they
should be on.

The regulators s4a and s6a are a bit special. They feed back into
PM6350, but are not modelled as regulators (or anything else?), so they
also can't be added as vdd-*-supply. It would seem to be possible to add
them with their "Default on booting voltage" from the PM6350 Data Sheet
in the dts, but I'm not sure this is desired.

And document what the "missing" regulators are used for.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Drop applied patches
- Expand commit message (Bjorn)
- Link to v1: https://patch.msgid.link/20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..aa68a827a308 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -80,6 +80,17 @@ lcdb_dummy: regulator-lcdb-dummy {
 		regulator-max-microvolt = <5500000>;
 	};
 
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -298,6 +309,15 @@ &adsp {
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm6350-rpmh-regulators";
+
+		vdd-l2-l5-l7-supply = <&vreg_s2a>;
+		vdd-l3-l6-l8-l9-l10-supply = <&vreg_bob>;
+		vdd-l11-supply = <&vreg_s2a>;
+		vdd-l12-l14-supply = <&vreg_s2a>;
+		vdd-l15-l19-l22-supply = <&vreg_s8e>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "a";
 
 		vreg_s1a: smps1 {
@@ -312,6 +332,14 @@ vreg_s2a: smps2 {
 			regulator-max-microvolt = <2048000>;
 		};
 
+		/*
+		 * s3a (smps3) is gfx.lvl
+		 * s4a (smps4) is supply for vdd-l4 & vdd-l13
+		 * s5a (smps5) is mx.lvl
+		 * s6a (smps6) is supply for vdd-l16 & vdd-l18-l20-l21
+		 * l1a (ldo1) is lcx.lvl
+		 */
+
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
 			regulator-min-microvolt = <1503000>;
@@ -410,6 +438,8 @@ vreg_l16a: ldo16 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* l17a (ldo17) is lmx.lvl */
+
 		vreg_l18a: ldo18 {
 			regulator-name = "vreg_l18a";
 			regulator-min-microvolt = <788000>;
@@ -448,8 +478,24 @@ vreg_l22a: ldo22 {
 
 	regulators-1 {
 		compatible = "qcom,pm6150l-rpmh-regulators";
+
+		vdd-bob-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s2a>;
+		vdd-l2-l3-supply = <&vreg_s8e>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-s8-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "e";
 
+		/*
+		 * s1e-s2e (smps1-smps2) is cx.lvl
+		 * s3e-s4e (smps3-smps4) is VDD_APC1
+		 * s5e (smps5) is VDD_APC0
+		 * s6e-s7e (smps6-smps7) is mss.lvl
+		 */
+
 		vreg_s8e: smps8 {
 			regulator-name = "vreg_s8e";
 			regulator-min-microvolt = <313000>;

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20260901-fp4-regulator-supply-7f6b999e9624

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

