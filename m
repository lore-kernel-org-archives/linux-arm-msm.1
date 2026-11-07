Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018396;
	b=pDkojRU7uWEUhZA0bv0RMHu4+LvZhIXmL2fCeFMS0IeUk+03+RVGgUPKJVrY0UkeVLV9
	 +iT2SarO4efQKbTogyIKJK/zw/o6t8jJn14Z7IM6ogfMJ/tRt5RGDkRethd+Mtu27OX3W
	 4TjSOv5/DGmmgWj2+U596QGeeRtjVcMkIiGEGcJHsKXqBfJc7AaO9819l5LeoBQNsYgki
	 CzKWwEXxKZo6Z6X++0nv4Clc68jGTrXtxE0CGDTiCPp0alduYvvG1C8nnmeOEN3vWZDx8
	 KxPQdmc0ZssYmmlBf33u7EJjjmyN6v29okSmW1GlEqCF5+4E5xHrtlbAMZHigusCQ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
	b=w8BMbQGeN6CWcZimr3M6iGY3bcRuRsM6FAbRnySoJzPiPLfz2G/+kq7EuyJ7dmsXJXGT
	 vn75D2/7Yx7swCJ5T1nVwY5pb9ERUKVhRpQOntoTmw+h09Q4oSAlWWFyFBVH5VBuOBR7t
	 LVtzwOJlcv5hvcb7HrEO6zhjxUDURpiStUTcdY3385tM2W0X01YKSr8Gh6N5MfrS6uidP
	 sTZGzhVfcA1y9WTltDicWtBEqgW2VsD85HUgRWN4HGEPAGDtkLqvF9MMzSp2Y5uf5RHS2
	 AdDFcp6gA/5A4uMFtYTfotqsAjMwyXmc4MHboxWPOZxdGI/N/aNvBUlw/zYR+hnJg9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgpsMcpN;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B7606A330
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76B7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgpsMcpN
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so536250e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018395; x=1794623195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
        b=GgpsMcpNnRTpfI0IGsiJYRIK5C1tEg2vO7Qw3brjlZ1E2TIOcrf0yvf+aB8hxRzUMh
         r9acsEbwSdK+w421Zmgn9K/cQM+R6dTKdr6tlevwWvBRCfkP3HfyYvmyk7bKnabXcm3W
         c8DOzP57ND0Mzvnrq0u40AS4K52gIeQwRbe8aMdTmdG12fm8Ip5zAesxRhuwcZxeNQOS
         maXenzfFBDrPSmtfE4Ozu57snZqeURs9z5Dh0DzqGD/C3JqELtPndOVQ6m+pUf4j3L7I
         Wt1vg15H8zQ2pRdZ5Kauspgl8r/BUGFggzxWzK8/XyJN/NrKX51GXvdXMSqETZfRtSNq
         ZGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018395; x=1794623195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
        b=ihBqUEO8tclKmur8yBNK+nUXMrGJlUGWXhArLs8xehGFD4FcFJulb9IBmTROJ6od8r
         wfc8Z0Ap6rZ9P5Mto8VB/gt2QugARiFNqAKsBTRzrXBH7ud4SR15m8wjoiD8q7ynQ086
         bBCD2bmPlH2RSz/qvvpOb2ajFWkPD/baZkej7+nvkKfE20YwJz4yprLF8qwCuWeAhqUw
         5oGEhwjTmD9P9Jo1xcJi0aFLbzCacVpKsHv+8I2cVijA8TtaNAL84gTYajg/aQGEUY0b
         JpCu63gkZUALQU+x34+D3Yho8IElELkrAxkHCJm8aErz35V6NJWPuT0BeNAcTMkAphrm
         8lJQ==
X-Forwarded-Encrypted: i=1; AL+hErEBVA6vHBjwxFybnchpabgpqUbSBy+oCBqHoSjOcswej0RyOVfnMRHG3Zrv+l6Z+q6D2gNmXJAXos8j4N9B@vger.kernel.org
X-Gm-Message-State: APuU4Z9UshgWHm9jSSCIQDslEHmNctwRyd1Pd3l2a23RAy6L/4lq0zzt
	QzsKRpvkLs3u7IjrCOfo5ksH8YNoBRAWCOZ3aqENrH4WWMq5+4mXZEaL
X-Gm-Gg: AYBFou2tL1fGi/DKVxSUQJbpblivjAoHQ07YUeyN0MJsDj+2KiXtm07XSsPd3BDJhxl
	Eay1rlBR0Dx9IIZg9cBWW14AuFeOvY5ZmZmCsqeznZpbH1wBXhG+OJElI3z/g8GB5u7xyD0AC2j
	qF+gJ0Ou8uN6QHvO7U95C9ViOiNvxNVKvCHrWczxc2tY0PrnWewIJCuLcszVy+XgtinCOiOQ7FF
	BwJqrJ+S186u60dRFPYumypmpmrgM7ZKqSTjlLzjJmJ5NOVRPDymWleZvhxHtsC1K1Pi9uSpPR3
	eiss1SWc3aW11fRhhFlymVWGVf3jwDOs9CJnBHDennq/P030vSAZn5dcS4E+8cnWY1VHfr2tfyx
	4OTXsoEmNqZpZfLzUxXgQzPUOr74Uwqq3QaAdB2Nn3Nhqy9bDqb39Tz28aNBTnyVCFrQHKhZyyi
	UcCRY1sdx/E/l6nqvd0WX0mQnlrSPXqSAxpYGCkvGp2LyLidK1QkgHSV4cvy8Rg09/iorBa9bo2
	LoqEe6zQg+kq4ndUOT8urCC2cz6djHFnVRLrI0Oqz+EvYImxYrZ5d5tuWAjt+FxR3eQTkZd8dKO
	fLcrrcJZTsGwezjwAn0VUBEEw3B0GQ==
X-Received: by 2002:a05:6102:32d2:b0:7d0:6cf3:d8f2 with SMTP id ada2fe7eead31-7d2a157bc3amr2075226137.20.1794018394730;
        Fri, 06 Nov 2026 18:26:34 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8aeb0sm3142227241.9.2026.11.06.18.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Date: Fri,  6 Nov 2026 21:24:51 -0500
Message-ID: <20261107022453.159341-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..608c1c2120c9 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			sound-name-prefix = "Analog";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.0

