Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323945;
	b=QbN8UnaKJXsKriS7ZsO6Xo/aOKPehU7M6uT+US4U4osWa8wE/YJvJbzqU5ZqmSPbZraK
	 w2SCdgjizqHx7E4BWDmIiG/P7X8b8z2LunMulYSrM5np5CE5E+j22NsiOYNDM2yEbwB9s
	 V1LuVQ7yMD5wbq7AsYsl8HgPvJQY8fEtmy5ubkhyZoE2v+NXrZbcLKM9AFV/f9Jgj+pY2
	 W8s545BWAunC6LWuNdUoCMpJzm3INJzwWDWcC4pjUnnoVS8wHihQ8cno9MYSyJZkAYFKj
	 uyJXQpJWnuHogod2PktkeRtqpWYQUaqGpG6eowm5JczJS9boWPyxtp8x6YGQgB1GeOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Nq5H3D0euCZbOqXD7Z9fPhPXwWstdtaDfGJwD5+ZOc4=;
	b=477ajZ/d+F2vLHABJVKSMM77wsG4LdTpw74IVdX0CIuskB9DmlZlJX2luknNTb7YVO48
	 WiF9fi1VJbwIh4+zaDYnDPB8IlK81ydn3uBrprf9SAwidTybK1OQcH/Y/nK6/HYX/0re3
	 aT/8HWU2Y+v1jKzDciWjkBRWBJsr+OQwGv/IlznWoOxKvsqDaU81J5ro5SkKpYOVJdWuh
	 hq8cjR0uFiwZhA1yCVOc8VaO15iX/9rfzN5crIphMj0H1t9zQXiFWT2SjACYma5e6Td2b
	 Pbc501mWnPev2/gdJpKWnkyZRCRtMXTRoh+M6eb6InlbK8Pt/hZfpVQ4n8d7+U+eEBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e6/bSjPE";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96AB606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6/bSjPE
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9f6a16aedso1322865ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323944; x=1793928744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq5H3D0euCZbOqXD7Z9fPhPXwWstdtaDfGJwD5+ZOc4=;
        b=e6/bSjPExYAE08iP9BXgZtCJA/pAPuh+uQXUpMG6VAw4Rx/+O371EsVOT1hWKh4E/2
         5P7vwmC8HEMRm6FEKkjRilzkgATY3qs8I0Ldm6YYIH4+I517NqZSCT1C4g0nc/pMfZIe
         F8uuFmjfKqXMBlwpzoWNUUkF8q9VIdFmSZM9WDIeqEOK4OPmCpN8tnib5I4dWgMVZ7kG
         J6GeA3Av1zVevFv1tcCC2Z7bHwXnOmb30Z+oB0K9t8NhoPOS3Uc1I59TAz3afWYoFsm8
         fwEIx3YY//Bw/RubdhzKATFpUsinkz0Ckcq5GYguAUWpMK6WCqCiri32rY7UJcuPx9fF
         lnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323944; x=1793928744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nq5H3D0euCZbOqXD7Z9fPhPXwWstdtaDfGJwD5+ZOc4=;
        b=xKfrQdTl2z9slg8GOPiR6IPkVSJfkEPs6abHhsh/6TANFkoDghm1FVk/7DIgIQqmxm
         Er1QTd7eHJnjRXh11MT3+oNCyu9ZyB9XOny41dSJZD0XlsbCAZ4u9pea+qWx+j9Ja0hJ
         6KCTcaf53i0/AR3rH/OugoXaf5u/U9UYnUk3V8z18fZ4m53JPWaU9ocr88Yr+FMc0r0R
         ZNCu6HOt7U3+qR8YaYeuHtB1SsA8emcxaNoUtB9IsCO+qyjqR6MRJ33kYBNHdfCwypVQ
         hzU9RBBoFTguXIgaRUfqsgtbPb4VwhgRn1zzo5bWC8Tib//z7gUWFUGp9iXeseZblU1m
         Tyyg==
X-Gm-Message-State: AFq9FYJjkiHT4gaKNiVZTDxFPmaDtmmJT1Ed8K4w71WE2YwtLlcbfMNb
	OcWXY42CxEiAtalDAiI9Qzwmp+XmAO6PGbv2BcoID8kpp2KRF6IDF1aP
X-Gm-Gg: AYBFou22osxBD9DA/u0ZtcH0A18bZhwWP/xQmiatYw/3owrwv5HHTJgp2EN597gXWUL
	3rLMx9npzW12sP8lEw0nLHI70KZPbWxEY28I2S5nvnqf6s64DFVjEaGXXS7xFVOLfFl18I+jQDh
	bIcMv+F1iut+hmeH8nLxabITiOY3vZMTBOfI8UWs2kufzHt3VyL8/I5AZ7h4zoAxbRAhL6s8kxc
	bKFWrSMv5Gg4p0pETA+0vXwB8d6tzSoARsehcLVwP5wcxUQ9d9K1P4/CI0CHsoV2RuPD+CLU31W
	Yx7Kq6H56/bq0IjaxsbQ1cXIFqnNSKAYMXmVrGQNS3ENsDSiwP9ARR+7UPLvsdGjre+TfQeMOVj
	QdG5SpgKtKlxw3ZK0DjURoSBf9vLu1MvvvCA7RR2zWHv1Ir0pYK2rJl2kM0hgBineNX2euz2axB
	Ktx3VrqAaUj0J325sVPgdw+ODjB5E4o3EDFCYXMm76g8oNU0dtplw/nAOTlhTHnd4aUoCCngZ0m
	YumMZaQ9JavA2Jbu7mTNxQsXx+121gciZDq5fDv187mYBzyAF4YqEhZBWfjWynWw3K6gGqxQFHY
	k49icH1RB3r6p9EgqKBVsqfRhSnrOuXeB6UbQAXZqKhx
X-Received: by 2002:a17:903:37ce:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2eb36395be1mr10276435ad.8.1793323944232;
        Thu, 29 Oct 2026 18:32:24 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:23 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
Date: Fri, 30 Oct 2026 09:31:35 +0800
Message-ID: <20261030013135.158157-7-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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
index f25447f1d..58b58fca4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/common.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -618,6 +619,24 @@ &pcie2_phy {
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

