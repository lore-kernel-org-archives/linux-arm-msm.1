Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585906;
	b=kxlHMnuawe8yNyKZlZBXsYEU6ZtO8nZ9G6gmpQscqo4KuyxU+LM61Zd5zGA+NBSQDgiy
	 2nLsU8jYco6X+qnKZ6CYD7fU9MTzdyzFY5op8MaqeEU0njXE7cDlo5U7zPxMMpSOdOlH9
	 VWF+n7Zti5Okfy5tFQKvPmp8Fd18ADVq1oe4leaYA9IvNKKbde/prNXPD1uUxvkoYJaHW
	 TZ8w5Ss5UpOjm/au8yXy5+KnMb0hV67NZ1URxjP7Y4WZyj4Qj9PocZ0+Nn9+s76LaaVnI
	 Qg7ysrkTEC9lzFOdD0sXxeETRVTECsDwapHXjcdZrVNz4hZT+12/l/KKk0M5L3CiMfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7Kw3jpXIq4jFZtKzMcPDKxBZyvXYg2GOy824z751lHM=;
	b=MXjvT1dShgtHDwXmhLocGDhSZo6Kk+gigbSn+7vSAYnISZWhoF51f1KqsuInvi01hp7s
	 dZlpWKfqe0Ws63Rv4pnLkgFloO6zQENrNIvaaf9oQDGTJfqzQH0t2OcFCLL+4nVXHaG1m
	 P6koquXZosBhgr/mUOp09OIk63eECmdZkNpm+29sFCVKXX6KEtYEqsEGrCqGM99yJAtnV
	 wlqfCHSWPRXdK0iYZ+L3Kk07OpqAmKjsCSa1Khof2tWA9NvKqefnYtgES27pn+kX6Va4T
	 +tuxgAVFQTzqhH61XnskN/pSlfc1a0rJ0ZyP1rWkpsHWPEMx8F7mytCOU0g2IVpLGTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="SOb/xgQc";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF1607620D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 16:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDF1607620D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SOb/xgQc
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so2147392a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585904; x=1795190704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Kw3jpXIq4jFZtKzMcPDKxBZyvXYg2GOy824z751lHM=;
        b=SOb/xgQcyJqJV3fKqjmRGGbJgehdAOrhA3EbTniYpSFN9VG1M8/QE6f0G5SaWLB67B
         wX3cksYY2S+OXmZfAKrm8S8bm9fssk/Fd5med7zF1L0uhNZbzjHhV4WfOcS70B2DmX4w
         MaOdUK8lcTnJ0ABUJzCvWVLoRpVNd0U0vaEcEV0JlfPZy+HDNcjk9VG5yr5GCHZPdcBi
         tVCkSDlzKAy1dBv9LaTKGzdR+x9fwiUA+4Ekkz0C5Nqb/re+BZ4MMule3tszbeJ2zRXY
         SVBlR96YUFt/di8TxXsZRllTLOy+i9T5HIfJBglIHabYyg+5kJb7RjoYoU1/9WHf1WWe
         MyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585904; x=1795190704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Kw3jpXIq4jFZtKzMcPDKxBZyvXYg2GOy824z751lHM=;
        b=GS8YL1bQJ72XL9S0Y6VmdRI4s1LEKHCYaWviHJolQ5PxcVW0aRQ72jjEZgNHiu/Vd9
         Mshn7bULoysPo9lAfAwtwqSLM2Gjz7Z+YTw2hw8cpzn2dQGirMyovafjiGKZBN9XrAK+
         v+Nzxky49XDbcYHt0QDz5RptonQQjevgwQEeARL/zHb/h8JoPpVi9h3zpDDPN89qFru1
         /njyVyg1zsWq7UF7LiVbqVCyM2SfQL0FbQmcRQwdltM/W1aKnmNGJAPYTkBZYP/Wq/vh
         50aIfhccbKL0xLct+CD9jcOLx3v2n81KIuTV4sqGJ1E/xe8UFBdZUabjfahb4E3zHT2A
         KTvQ==
X-Forwarded-Encrypted: i=1; AL+hErGKR2vzdfdo0riKlGT0pSw87/uFdozzix/TcyonIxsdJjHK4+cEX79T+NXB6uHmX7I/e+4uoRQFzuT+VJdw@vger.kernel.org
X-Gm-Message-State: APuU4Z9PwSDbLj+Bf5tnAbC/GbenqYyIPrFH1mdPcS0ZliCHPJAeE5iT
	esMXCLeOpbLfLIpswSNNIp/Hp1Y77sjOFP6G+XBvrpswey5VVivlZgtLYqEo6GSKGHw=
X-Gm-Gg: AYBFou05YE4Id3A+RPtlpGpUbIyJqtW+gc4Kb0YbxBqzVsSmd40NyBMOnq5sglkdIQ6
	zr5RuzvQM3rzKzuZf2qyPrwOhaRSSZdIPBhZvJdnQHDTnV1kyUQJa2mmzQpWhaSF/JsEpsSK/Bq
	wOXoG7HOtA9r6w3nilHf5G2CZUhYNfJhlVFA7jf5X65rDHaT0anr3yYlkeg4TsB59UWBvatN7WD
	XjT4RZozJ4m/eS88yXu8rdV2+EgLgJBUhttaLjZkYl8zCi1CrDQ2z4oIAjKzZd8Dqs9g2xbn743
	4EMBJJ6ns7jAoCTYL8oJKzcjkVuvLd9RLRkEh2JbMr/E7zg90AMWh7PtfAtZR/KNQ4kn9Xw518J
	go1KSynDMHaHe9WI5lr18fmIniQp+c5LAOvhrK5YS0TQLtKtsBg5d0EZLaK28NUpeIant139liv
	bT282BlYReVeXaLw24RI9PGoIt/451xJFLc9WDiuAy2AEykO4aIHU60qQbpN8teEcihNaBxRkXV
	ogO0zpidlspsRQUxiX03e01oXsPg5BH1NU3oZO1koU+GH4Dt33cyGE6xorG+yeOlkcSojZ5nXQE
	bL/DxB02dPf+898wgkTxoHAUdLiDhZI+UB/g+Vc1AZCmOrAXTKdBs9GTFwuDwPTflKN0qCG3aY8
	Aaor7PDM=
X-Received: by 2002:a05:6402:222c:b0:6b4:d1ed:95b3 with SMTP id 4fb4d7f45d1cf-6b7c0d200eemr1933559a12.41.1794585904556;
        Fri, 13 Nov 2026 08:05:04 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:46 +0100
Subject: [PATCH v3 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add battery
 temperature node
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-bat-temp-adc-v3-5-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=2551;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BTbJE+uVkaO8/e9NHFNdcxadF4slrFM2xvgSTnvAGGo=;
 b=cVBBAj087LJNnomjguZpThneLwRiRu9MSVg4YxOXarDvVQijERMPCJyr2UsYdSnMUUXSAZRwj
 dA3YJuS87CcBsIa8XButhSk1nsJGHUrL0+mPVI/KRuZHfjefLVspIaC
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a generic-adc-thermal node to convert the voltage read by the
battery temperature ADC into degree Celsius using the provided lookup
table.

This will later be used as input for the fuel gauge node (QGauge on the
PM7250B).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..0b8c6f353f96 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -96,6 +96,89 @@ memory@efe01000 {
 		};
 	};
 
+	bat_therm_sensor: thermal-sensor-bat-therm {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		#io-channel-cells = <0>;
+		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
+		io-channel-names = "sensor-channel";
+		/*
+		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
+		 * 1.875V reference and 30kΩ pull-up.
+		 */
+		temperature-lookup-table = <
+			(-40000) 1673
+			(-38000) 1649
+			(-36000) 1623
+			(-34000) 1596
+			(-32000) 1566
+			(-30000) 1535
+			(-28000) 1502
+			(-26000) 1467
+			(-24000) 1430
+			(-22000) 1392
+			(-20000) 1352
+			(-18000) 1311
+			(-16000) 1269
+			(-14000) 1226
+			(-12000) 1182
+			(-10000) 1138
+			 (-8000) 1093
+			 (-6000) 1049
+			 (-4000) 1004
+			 (-2000) 960
+			       0 917
+			    2000 874
+			    4000 832
+			    6000 791
+			    8000 752
+			   10000 713
+			   12000 676
+			   14000 640
+			   16000 606
+			   18000 573
+			   20000 541
+			   22000 511
+			   24000 483
+			   26000 455
+			   28000 430
+			   30000 405
+			   32000 382
+			   34000 360
+			   36000 340
+			   38000 320
+			   40000 302
+			   42000 285
+			   44000 269
+			   46000 253
+			   48000 239
+			   50000 225
+			   52000 213
+			   54000 201
+			   56000 190
+			   58000 179
+			   60000 169
+			   62000 160
+			   64000 152
+			   66000 143
+			   68000 136
+			   70000 128
+			   72000 122
+			   74000 115
+			   76000 109
+			   78000 104
+			   80000 98
+			   82000 93
+			   84000 89
+			   86000 84
+			   88000 80
+			   90000 76
+			   92000 73
+			   94000 69
+			   96000 66
+			   98000 63>;
+	};
+
 	msm_therm_sensor: thermal-sensor-msm {
 		compatible = "generic-adc-thermal";
 		#thermal-sensor-cells = <0>;

-- 
2.56.1

