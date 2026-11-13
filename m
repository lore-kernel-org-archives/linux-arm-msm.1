Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557801;
	b=R9EXo7tWEE0wzX7soh8DF9yuUE3DaSRG/2pd4vyhZMeVR3GA6CCMk3nqo54YkxPD1uaA
	 rsqEfFcCxAnUQ5krAJXgJKDzUmNj9S/0eLaiPkMU4IhPhIezB85y3Ic1gNIji3vlfuhzE
	 0jcOCgZbTAeLCjJjskqTjfkTbRGE6lf5YHBuLSntOUJlbd9EBoHpNhAdLUFBqBRBiutG7
	 qZYviQoYnDMZ7NIPFPAlpTadit0XvQ6nV5sstVY1/9EfZpsH4uJlMhY8yHG6sgRVMlY0p
	 U8Drlq8T6RgZvRDifxmoNDelqhHqCSgQWXiDgzEbHf1DVoI6XvykQQFidtpGaH94/SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
	b=JkLhjrAXCFyISyT8fj2MUjF/GXiGQvHR3T78jme2z2JRnD3lQjF5YHwVOifavrwolnUi
	 9hxXH3/T2dKJ0bO5iQbqf56sWKjPKZJLvi3FT/fa2OJkBtZjeI1/r2CD4rNrGbHZr//uf
	 14n/b9RK29EWxEQRYnZdJceEfzABNmUTF1kj8SLN7cMBMtU/nTB9kmD8omsz2hmU2PPIT
	 Vk2JLEBW+giM3RkZMEqMnXC6wIOa7qwg2g2zgEAlSEFcDcbL+/M0Gvv7n99gGO71D5agN
	 lnOs5cZd60bFT51aF437OHZcnwPZZc1uT7mcbvoZ3XOt6N8QaX9trxS+wKpvz46PDrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXcNDLdh;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB4606A886
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEB4606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXcNDLdh
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so1123618a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557800; x=1795162600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
        b=gXcNDLdh0Slah8YZc8PKNyzBkj1Aq91LtjJP7wmzAyIX4WXfCbYzgnJADFAwa/fqnv
         nwBTueq9cA1vq8F6GUwm/HMjqmnepfWBp0KuERX4Hy8A7/HRY0y1KJxJLYx51KR0vuTu
         8OfLdsJKXyT5eAKeZ5dKgpr9H7Pq6HVCyV+LnqF/T4535BwLnCyVUEyPzLuyzolpEmqt
         SYbcUyXEOy1xzaLMYS1lCunGwTVzElx9wTp9pEB+54dw7QUVTFklD+RiHFWK5I28XXKL
         J7v3P2KczCSrnzaRwXwFisHLNYqXt8hj7W6QBI82xzkN1KIlSHQeGzpQMrcvppCq7cCI
         qy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557800; x=1795162600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
        b=v3jQXOpjkjSJtuOAZrDuO19S2UpcYpyRwwuotCkUdwHAZEhSdaXYh6az7mba5E6CFi
         +MQf4U/PdFnBOfKESYV+dcTbLYytSjBXJUHfY1zcEe2QINd7FZvyVXhGM74UCVixfSVw
         bGsAy9NqrpbgReypcqBtkfxN2DzWUzcR0I0AS7ZlIRwQkXMrKXc95ePn1eeO8ON9HPzw
         KHeeO+1HWL1itbHQVUI1a272uysL7+4aRkLD85+4vfyShLninlfoAdtXoVL1bjygz7fF
         j1GOQ4HrJcqnWRbcBrQkVIs653catTi0Bv00gbZcGsz4MU39lgCW5L32FfpxLaTzZaeN
         Rrqw==
X-Forwarded-Encrypted: i=1; AL+hErFQ8Av5gpt7SG91tlI4Xp184zCpPuehEnAG+m4758Upwqh2e5NixxAg/ijVy6jyzVIN9jrvzL3/ngQisR5O@vger.kernel.org
X-Gm-Message-State: APuU4Z/F8V6sGjhzSjTigxT6oudgk2d1JDgxc9I99MJpEasZ/QN9iN0B
	qFwm0RX+KpVjMfu0y4mzDvA+DOWNoPiGX5VXQCN4U+LC9sKtKwF2Vya+bT2wu9+2nKs=
X-Gm-Gg: AYBFou35bcaoXJ33O9u2DMxbPJfahbzmMbrT2cSXWk7hGl/1XVSwZdn3DUkdg/I9+dS
	FdEWvg9CSDQ7/1Ys4J0adAeI9pHr9pIp5ON6r1aoLU+jdxfVZif3wi0eyFekjIc6pKJEbciKCYj
	1xPYXO5rHKE8egH08HwQbNg/RYuqVPa1mOS7a37i9D1lGOtprJuhjmpKhzGk1qzayAno3Q9qaR9
	UhAliwvOIStWejd4Pf81LzV9rqhVY2D7F/I5SOeeFwBHqv9000u6ff6vrqa7Ou0ijgKmrWVBTKx
	NhhwVMCeyy/i4VaUdhqUnq4McTIrFWapK9BuGcOoY8yKiqyyLvzts+LH7Gh84CTt6FVBPH+5KI1
	KARLJW2eATaZn6yLm6xSs21VYqOjSaHR/krtpy0PMGQeoBWDOHWzQ9QFj+nVuhIVgoUcBZfhZwy
	li7lEvyQ1sb3VxCv2I/WCRLyN6zyDyzhtA10hkv8RthmOIEdcWofaXGF01nFWBkB2zVzn51QPgr
	mt+GVN2Ruk6in2jMLqAPjS+dMDgD1fpyvZdevdVIQps1gRtDeM2mGpM1tnXig+QNdahDdM1Qjbb
	AK/kuqMdB1o2xWZQe/ViwMz4qtFcRSZ7ah/EIREV6x1yCaAQ0ZRdng4M6KypdRh+YztpnhvrZi5
	zvdr80ajA6TjXqMI3D02GSR0JMQIz
X-Received: by 2002:a17:906:7955:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c50963aeccamr142812166b.18.1794557799688;
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:36 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: sdm632-fairphone-fp3: Wire up PMI632
 LCDB
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
Message-Id: <20261113-lcdb-enablement-v1-2-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1750;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wQ/by28OhYBe7ilOwgM0g82bOPZkl3Y5d/m2CTiHTQk=;
 b=xjIQGYG/TkAs5AVuy5/TMPcmDtNlgeT7SLb6wQ1pox7NXz9Ag7KKDE2Jg7Bzrl5jRDReHViPt
 48kqvPIPV74DgvT0WZjTuVj1XV6VCe66T0+9a2YtTF3JIYZ+u2Gz8Dz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 3223884f9cd6..77331ae6a692 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -72,14 +72,6 @@ vreg_cam2_dig_1p2: regulator-cam2-dig-1p2 {
 		vin-supply = <&vph_pwr>;
 	};
 
-	/* Dummy regulator until PMI632 has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -175,8 +167,8 @@ panel@0 {
 		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 
 		iovcc-supply = <&pm8953_l6>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pmi632_lcdb_ncp>;
+		vsp-supply = <&pmi632_lcdb_ldo>;
 
 		pinctrl-0 = <&mdss_te_default>;
 		pinctrl-names = "default";
@@ -212,6 +204,20 @@ &pm8953_resin {
 	status = "okay";
 };
 
+&pmi632_lcdb {
+	status = "okay";
+};
+
+&pmi632_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pmi632_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pmi632_lpg {
 	status = "okay";
 

-- 
2.56.1

