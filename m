Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660763;
	b=eLc2W4m7cUj39W1344g/Pdpvg8BnxloZgAVh8fp4zSHjBOoMf6I/xyNtnZGBW9ce/CBo
	 utfHy7H55UYvZan8MNutU8RY69LKYxKLwyO4HBGbcJiFuSspd8X59zlbX2M/3QNPE/3sP
	 ey2zQAVdE0DH85yWpRA1JHFrTjI0XIyNV64hTU7wUWBvBQm+0hfwswU/3fgVSYlaM96Fe
	 nHtRPCrqmAwoqKujEvp3fXgZthl8RLctH7JQ7ur8Lm92b8DLh3fPAfoILq4KdUJ9XUiiy
	 JP5mx7DzX5wEqQfHg6RQ0IltKh7PFFfxg72XAUguNw8te1xiJM3Pt/ZUd779xJ86IAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
	b=HbsXeFVV7LMsv9cUoOf7uLqrf/V6tDCWCQ/QYGRdeL2bwTpAyan5XCEKTTf8WUM3i3aS
	 Kp4aUnKNpM+iZSXQeCF+BYf9A3iGuimfnl6CPn1Er/FnrbwpOhqKkiLZGJ5lrJLI/MCfp
	 6H71qml2AsKSWEoWhaVtMBWWsBEGxgeDtS8JvLpI0tjSElbHM7U4qFScLs0ulNMxcRcys
	 pA2BATM+zS6wQO2G3IO2MyZKZ3ECkx6VbEAgpkONKfamiqpfUD+jlWJ83ehbW2VTXQIVG
	 LgG+ac1K3z9w/kB0wmEnU2oewLVA/pmU3j2KY0p9qj5uxDr4j4+70VQA2quDcGDtdwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXl5+Gb6;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87DD606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87DD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXl5+Gb6
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c418e215671so200448766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660760; x=1793265560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=gXl5+Gb6xohglf6t2PtAn6M8rqT9TTuWwPgMpEtwM+UheIq1KRs8zY7QIDcxht8PzO
         1ZPZM24MgSPYmEEdlvK0bB9tF6GRM3hX8M4hvq3GB62Wf9Hq/BSjbV6k6rm9/oqpqI6+
         QD/pyF1oFgvvojgb2GEt/vc5HSrimYUihuOmfp24y37TXu1kydvHQxL6vb9gtANnAvNW
         xakS433LHUxbj9ne7GTnnkWXBBRj0mfV9/oSDK3v1XmBBlPsUEgzsLX+NgA23e+vDL80
         aCT4sMlH6auzjfpbhbY/VyDrvvDEth0whQcVz0H7zvh/+CvkNcpd8+MMIrL51M8uuflz
         7apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660760; x=1793265560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=GsRTPAZ3QHg+bOe6U3f4+ZmLmMX0v4aRWD1NpCBPHb1vQ7oqYTYimYMsbRQldq4IAO
         1b0qn94p3MVk67Y5gIboMJ3UDTwEKnyarK7tWPtSwwjtgiD7c+O+0Tx0NnJ42NzPO8ud
         JlaL+LBsN0irYXg/eE01epbwB0XFqT+DHiAKmJayPcQw/i41TKMLMTzqYlt9yr/npx/g
         wc2P2RgmGgYgrgH3DrAMjRgpH/a4dfi5E46UJph86bCyiOxjmWjP8GRpueadjeNtOn+a
         At+cBzl7BIsn278Cq5zZ08dyC3LXLNs0TRTwyFKTnO8/vbU7MCVdH7oslPPFIYUutV2b
         A6WA==
X-Forwarded-Encrypted: i=1; AKwUvByNFX1rWaAIJ4OUMSjbEuFBfE6wQ/hSct4R9iEjh9+jzrK2gYgMUQhOym8EbXIBtE2BifoPcty77golw+3w@vger.kernel.org
X-Gm-Message-State: AFq9FYKu67RJmX9pVTsO8mSh3Ka3iX6NJIEzFZs9n4ZldY0DaJGT/SLe
	LxJO/Di6f3pO22HlYUFZ5uUAKople7ljo+q79sqmmcEU/JJeOtAfnmbbAGriFHgg+FU=
X-Gm-Gg: AYBFou1z34aMSga/vINVdZKx11CdRDJuziCBZWOzM1HKq3s0S0XXB61eLA3Wze9cYCr
	vhQF9rRNwppf6nA9ohNBwrfk97ybJpDZCpcRxnM/1gNgXcfAWt4GPH6lHZaAQWGb3ZSDvRTznLw
	p/b5oEk5YQ576eOwEIVtv4ZJbbzEX8/go1aR1wMm2gEVAU8wolcN/GMiIC2fVR/lSHmeHIL+bYb
	ryWKGGHKRkcq/luHjroPdWNFnhfCBN+swND4LdNAsgPsMsXU77pt/hNlwsKL9aBliMB++7h9PAj
	Th/ZNK1Q2JJCuoZudfEn9HN+RUTzm+CJJaBtGTkc++cEYiANAOx940vEVAZlBwlzCdKSBsCaEIw
	uBYGF4FtBCrm5LoYbKzJ85wGzstA6vb47tvyV1T+BF0KKloC5NP9+ar+LleC2X2DRcYUArj2zpy
	kxSsj4ZGoR4xjjNJerPQueDDSXfDetIWCcax0My3PBcuuJRs6dQUhwSCFPKseL5JvNrql5erVVW
	L5NkiuXenIrxZcLslKFy0CEPxRZ9+O7ByfJduYfJrFmC9d5xvL/G4KeGi9AmkskO9wAB6TjfwLo
	mYsEdY2Ibf3Yj/Wg81KLBEdVzW/nn0w6VoR2or3moKOfNcdPwpLndyCHHdYzHle84pTrqtiuXL7
	0KnZ+Z1K5eGvzX8xBlHdMgKjVIk5cH2ZVFO1oYPw8/adHkCGMie+ZV2bUJrL6pHbmWsYr
X-Received: by 2002:a17:907:c608:10b0:c46:8c16:a656 with SMTP id a640c23a62f3a-c468c260476mr152082566b.18.1792660760257;
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:17 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
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
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-3-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1650;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aA+iGNmAXb9ktbwAU0KbUX7yr+F4w/IPZJ4vFwuykl4=;
 b=7+N8AToHLH9xdV3tCOOMykHgHkC/SjnCyxhXQF5Xbwj8wB5CmBkIGumo/1wSKGWDi0IkaKEly
 nKKRh8WkrzOCBsnRZcvh+pPmdQcgLeB6bDtrGICgzm2J/XqZ0xXceoc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..76184027221402e57a569d74749350c1482f5afa 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {

-- 
2.43.0

