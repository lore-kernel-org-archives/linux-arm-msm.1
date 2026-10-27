Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088632;
	b=IGgYXsqMDT/2Tl9KBTtJHBa+R+RALbX9GgLY3RYC9UkZi7Z9QzRz/k3PVGuyTCLiN6hN
	 JsevtGrzmP9ac5K+fKqPFatcwN3YNfiTTBArkkA9QK9KTe8g3mDNeBm9U9miH0z/x8SLp
	 /pt+6OHnL4TyPA5YT6WDjcqg1Op1P7Tkwtz7X3W/swOVzDiiCAvT18exAsDeTtgFAkTJH
	 YigPIy8GzU86uCLN27XqonghMPsJWJhnjkhxO1x2YN0UU344gqGaPbaZmuvMJXoSpLiLf
	 PyAdnF69tq0OTb/GdsHanj9FFmwCkIkjMjGgo5ZcifZ4+NE+6/eFlQaT6PBLXuLQ0qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AzsQXFv7FsTwkUEghkVXxk+mAwyaKwsw0bJgHhcNoYU=;
	b=1poUX9ADvNCK7wcpQqwj4qIZUAYJCF5lom+rJg6xM74Y1EpB96/a+tlatdwdGfWwiUfJ
	 Gugeq+Pl+opBWKazub+c8RkHAJGenhkRwA+8IlQJeDb7TXSCI5sBUik9gZbAsyp2up7x0
	 VqP1nyAVJvh4IgMzI7+XPO869WG2poIpQCm264QcXy96WPu2VuaBKo9hj7Uzo8nRSPOtI
	 1Ndd6BheNlAeo1XELl9Zn8Bhz/dBDwuZcFe/wMPax4Im9B+QyiuBcmaNII54OgBgQiWWr
	 envsHBQLytR/irQ+OXh5lWT37ps/j9WT2eXTZMZPUK9r1js3WbIrFnGUFeg0GuC3b6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXpfxjzk;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F17606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F17606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXpfxjzk
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2183105a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088632; x=1793693432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzsQXFv7FsTwkUEghkVXxk+mAwyaKwsw0bJgHhcNoYU=;
        b=jXpfxjzkz6z6bRUqVUQeO/4ecumjeItXaGjnLKeVThkI48nQ23ZozcvxBS1w7xZjsF
         gayLrgF6258/KC9RYZHynUferQjle1UiZVUuGhSpS3Tj1ewbG2hHb/MfkBZfg9PUcxI5
         itdJjOMwMwJo5mgaxxGRFjHIwg5euu2ecr2IbuFjWpYwezfU2UrasehMz4fOheuHt/5x
         bRN7ihM6ZKsUe8tjJ09wSS6+7uIsDGLUZXBFYjVhxe55TlYixEUHcZHA+/HCi+OiuYA7
         vPaYNkgf/bKKchxvCyn+Y9UJkN5dGhTmw5KKq4VZ6YTKcThCN1xYKisLBxOkzXg/e9op
         7qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088632; x=1793693432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzsQXFv7FsTwkUEghkVXxk+mAwyaKwsw0bJgHhcNoYU=;
        b=PZqVEHlqZwne/zAbjebDNmB9o6hm9k43SCn7gbTD7qJuFhtjfbGIuNXiHHq7AdSrPF
         +ke/FECZTzMi+MGucbuNVLCvmWe3U43L8UOnCq+xfObvriVml8LU7cJTCq4zf7nXtEAA
         fThRK9O9zhqS5GHuQZqGpDg34l+mGS+qd2/9XwUTPJ32aLpfV2QFiYm4jwTl+tMAuSrZ
         ntdcmayiK+3KLAs7/YoMqAljilHaLHrdRMFGPGxv2TKC+o91sOWugqslPLdAbe3wkGCq
         WM3pb6iAjriXVrG77ovW9EGxSb8jpnFs1fq1WOnMbi/gOXZjBYCt4kuobaxPQZvxsW0d
         MJyg==
X-Gm-Message-State: AFq9FYLqb/jxQWFg7JE0+VeTWyyfk2Za0g6Hylcspc3tJSMpG7e1IieR
	HH4isi9Pw7qBOd+/BkKR5OG3/lBDkmICdcPfqX5MOThvl1h2MkutCUI0
X-Gm-Gg: AYBFou0/TPJdwD0xdjytN2WJaM3AEZzS/27tJkM4JxA769zHtcBOwZbAu087StB9XHK
	wMMiBbjkf3in7XGk768ObBtMgwKbLRbSPU0lCi4S7Dqy7zLUs7rbjtrmJkbT5Vxcv4B/+NSZHdu
	sYP36jga7p6/ugpme31MeapgMFI1yier7/TWo331F6POQsuxkL6TiD1irsKNQ8Lo2hgqqpCScFk
	R0zH6hP8mYRZIeWgViScA1XKt8R2gPHKJJoqtKiA0MxqhwaTXlL7X4TEmiBvZC01QML/qAnE781
	QLOs+4ero91Wz0XMHZT5BMBV3EIYEuo85UL+9YnI5V7HqK/BGD3gQfV2HwhwIERFMhPA6nxdylK
	EXmEHtw4o4z/7mWJmCvE67gRhDX21rXTQPveAhEY8R+2eB70R/H9vdUNjqqM02NgMv4p2GejRuA
	wCqMTdl92/CbexbOgKT6YNqObQ4gU7MAL/CqnYt8taam0Oou0GcQgFcHBj0a0yA9yXiaqpqNv5V
	C3ofmHP3nuP/VJjOVeew+hzIafEYNHcxggtr7X41u3c/pT1SRl5MQhgoL7O5d9PQRw5kAOpfg==
X-Received: by 2002:a17:90b:1c0d:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3adea9dab5cmr6997154a91.10.1793088631459;
        Tue, 27 Oct 2026 01:10:31 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:30 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Tue, 27 Oct 2026 16:07:56 +0800
Message-ID: <20261027080758.3990418-5-dc_redstone@outlook.com>
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

The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
The pcie0 is for the on-board ath11k WiFi/BT module;
while the pcie2 is for the M.2 connector.

Add the 3V3 regulator node for pcie2.
Enable the 2 pcie controllers and phys.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 96b4d6c95..6a7852080 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -57,6 +57,13 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -497,6 +504,30 @@ &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5a_0p88>;
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
+&pcie2 {
+	vddpe-3v3-supply = <&vreg_3p3>;
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
 &pm8150b_typec {
 	status = "okay";
 
-- 
2.47.3

