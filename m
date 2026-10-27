Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088639;
	b=Pw/Sx6UelDlX0HDHH663IejHsieLyPIznYNhxfC3saN9gd1o7SjTq4iRYmp1ar1UJrO4
	 sM6X6d3CCfZIAOGZCJvJr76zIe2IC3EdsGw62rggvemeqTWO+EfpLNa67gVYI14XrMqMR
	 JgRNomi49170arz78bNJxfSY3LAUxz2RKLXOhAlA+usTD9tf0WqMEbB+/mdSB/SzIIgMC
	 m4em/X4g1DlsGQt0CvDTguxn1UG0/8iSzl4JHJqwZuNUeROzA4gAS/VYzSnW8z0eODM9f
	 NtVZLp8r4mnJMulJkSRXr/w2s3ruWlqfmTUa0U0IeOzjSFDx+YhK851vQNcHco7Myqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EJml6LkzSdxjzvcMjCvcsg9ewQeSkDLux3QaJXnvGRU=;
	b=wU02ggzC2SMgByzQUO3xN4foZQpeTPeeTQQv08Rj7A+Z6NgKY1BaW9o2ritzZeE3sfIb
	 l5A4gpzZziZZCTaBrqxb06RSqCC69l933TlSS6WGNAyXCtQ0I3Ueso8dZCfjkFkAjeSX6
	 8oU1xQIY7OX/O+muIcVgGKSdYoIPr3ndOk3RLTVgXQcPZ3h0uwinVQlZNQJSFLIbjZFmX
	 oUQHphkCm/brlwau2u++OZkCJKW/L/lwNfqm9arJyR/pLEQ3AJWGw8tzWak+RydliJ/Yq
	 ITG3Y40U/K7pSZukd50R/EQDCxUWRa6Gb2k1eeMrCE8bJ7/bmzgpdgIUF07r3/BFgDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PW8KVOik;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156B606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9156B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PW8KVOik
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2778902a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088638; x=1793693438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJml6LkzSdxjzvcMjCvcsg9ewQeSkDLux3QaJXnvGRU=;
        b=PW8KVOikH45cI6r4z/VgBektu+0dGD77T8bLsrxpG+Qmdaa4kIkhHzZJLDZ2FvJxXy
         KB0prV+DIw6UtaFrJjoaDhwOGZ5UngmvoXUQtiyw31PT5v8eofgYFwBrYdI2O5zvdBAW
         3MaCXmROn0ev3EnOVm8kw7Xj57NPaq8qQH3wFkAZeAyGWYZJJ7HByaXmLFznboiCpYzD
         8p+9eyEUHE96pXty3CFycY3a1ZRtmm9b1CJiTS4PTktW9/58rVrKPvabUhsxqtC8AwSv
         8Yug8b/o0wsDJKFpDtEWyeDAI42tGVUsxteQ+Yr9G7LDpIMgN9bQI5tjlzQenkKp7ao9
         +oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088638; x=1793693438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJml6LkzSdxjzvcMjCvcsg9ewQeSkDLux3QaJXnvGRU=;
        b=GvCvnZ9l2ecP4sgeKuxGkg/0oBbrCGvx/rj7S23+cY0A/hHFdY/A0xp5ELfYYrAq57
         9VzFcLRP6BuvrjqGrgbqrC6QQB5tniuOuhUrxsssxXzoP0kE4A/xa53VSguPqNzoQ4yM
         sCDYkRPEovGEHEXRmIjCJt6rlTqjoE2rxLXokQhUlaCfQ4+JBbdIxpUipeBtWCpvhgM+
         cIR773RjhwTPHalaKsAwWa22kO2VG064BbP8uZgs7Xh3BCZCZoJS0yCkdOvpEb+vXaLv
         vbt/h9kvb9sy8+kXdCLoFRHwMpda+X+H5Ma6Wz5OaUCHDIcs1Jk2LsNLq7Ewhs3ayj6r
         gbQQ==
X-Gm-Message-State: AFq9FYLjkCZ/l6te2LP5WG2NQbiQy2jDKnWHsVKlfM9gl/jLyExdZAwa
	fLw+9dyVqGa/j3xVu7VdK2euFnwyvKQGWy7qrvpMdnUOW9dzFeqs28go
X-Gm-Gg: AYBFou3DSsVw+jIGyFscMpRRZC90g8iQYJ5JA/CrPTYDjMUpPNj4lqTOalVPE4jjA2L
	pDb81mGimnMNypZh5UZmK9zhK0891HnG4SJASC6LrXXangzIUuzLjBL3PiAd901CgrDN2OYU1Bb
	LBLKvuJfd4FMaaULRLqZYNI4mEbEycukmd72sJqqbeGP44wgLLhGLD5m5oHzmLm+CLgmlHaf6g4
	M+yuHW9lGZEyg9FbN7Xmzk8R3BCLYw+Trs5TC5UOXZRRt1S22a2GH/rwwFLQXj50Iq8gF9w3dVe
	26GimfcwgPqWaY6A2+IXq43EjjrUSIe6wsmbexkHmyF8rKhZ0BKHNTsjcuf3uL/M5u3sULIffcT
	EA+bbZ3nfectm1ULBfSLJHwxagBv6IPrukFtnAppIkeSoqYF3nZ4/+zTxG7V1H1mwCesNqMomQf
	zxuvHziO0/JBmxZlWTkCuuVBw0JtUHDm5PlNFZlT5N4qJ0tIPwhC3/noB1MKakhFj2b/g86tj50
	SNNdMq2kIGQ7TJKPnWkuOIqkpmJrDQphQBR5ZB4rBe/PlXJHv+NcUcED/6PE6a+6gjJYCoDUA==
X-Received: by 2002:a17:90b:2648:b0:3ad:53a7:62d5 with SMTP id 98e67ed59e1d1-3adeae6d7admr6673934a91.12.1793088637747;
        Tue, 27 Oct 2026 01:10:37 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:37 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
Date: Tue, 27 Oct 2026 16:07:58 +0800
Message-ID: <20261027080758.3990418-7-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 2 LEDs controlled by PM8150b on sm8250-hdk
which are not added in the dts file.
The LED1 is for heartbeat indicator,
the LED2 is for wifi activity.

Enable the LED controller of PM8150b,
add the LED nodes with proper triggers into it.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index b32f254bf..11865abd1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -614,6 +615,24 @@ &pcie2_phy {
 	status = "okay";
 };
 
+&pm8150b_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		function = LED_FUNCTION_HEARTBEAT;
+		color = <LED_COLOR_ID_GREEN>;
+		linux,default-trigger = "heartbeat";
+	};
+
+	led@2 {
+		reg = <2>;
+		function = LED_FUNCTION_WLAN;
+		color = <LED_COLOR_ID_RED>;
+		linux,default-trigger = "phy0tx";
+	};
+};
+
 &pm8150b_typec {
 	status = "okay";
 
-- 
2.47.3

