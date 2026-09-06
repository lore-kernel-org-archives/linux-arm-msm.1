Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B2421225
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704469; cv=none; b=X3/AFkvpWH2X4U37NQIyhkc//Ubr0ieH/W3+3qFlVr0+WdGLUFazImhNXxKdZU4jJaa265VoL2ai4uMWpY63nsVCbmgLILKWnSpfPuh7RfOiX3zjiu8xS5BMG8S1ayxsH3cX5mzYJUTd58+WTi3zzhI222x8dpMyVzUUv2ZbZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704469; c=relaxed/simple;
	bh=M9kXVsvI7HG69slRlyhwlWfg6E0tC1kNp8VaQyyX1U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdWinR1SL7mDl3hCY2c6/mzqXkWvc6Cm07nYl7aCEbiCkHCkRIHSZF0SEinZlvivc3fRZBhx3/x59bra+vI98S0XGX+FE5nAL5Vj9ubZOztFpoYB3ffMRtpXuLkoW97e+8wqhfRYQ/4t6AK1iDCQ5sfOb/9OEhMZvZGiqXP0EN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pelDQ6aM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pelDQ6aM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482f9309813so2312127f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704458; x=1789309258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wPHsZMXlrul2kEoI0D9Cua5RpROo0Ph/WeAOvQ4+Z4=;
        b=pelDQ6aM3Fs4W22YSR7mpvbxlU9ht4jtwQgAE7SRAaRPVHyaNVcO1AzSMGqmHIpiNm
         rZu0n/yHqBFv4SG1mFJavR0OdF38iilK/QftxgSe0OXT3G0XC1ZohSEv0eONf1gFNz37
         7LPx8cKkcdZD2zsfp7bvatgETEjkOHbObdoTzYQROPbxbZhxyKeZOC7wtBR241Tv3imt
         fQzeyllo3YcpiMBu6EaoOXvAF4oKZojQDbDK/guJcgvNwk/sZA2dPTD/v02nSR+/4wJG
         ZOPACsVFySv0AkNOY0eNoT5ha7a38XZBrDLM0ZEvursFcw+Wih//5E1tlPYB07m3gujQ
         cTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704458; x=1789309258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wPHsZMXlrul2kEoI0D9Cua5RpROo0Ph/WeAOvQ4+Z4=;
        b=aon58MFwD9Q9c5wIIR/Fr/LqHr3baougRNp6MvycmayYIajOb0tcy89qhGXoyuNo6X
         Jbbg0J64jaAieLNY0k1UbnCy+PVEoE2u4DqbE0MbpozOP3B+NW+leFPxF3Rtq64z5Uhe
         Vlsfbcc0pSs/+/lKdjvk4YnxjZhdali7AIe2WpqbwNZ+LnvuNNP3Fd3eqXGYBypyn6tV
         4jYkuI4HvF+BJp3X24n/9y8dMA57HotzHQ/Feq1ssn20dnVmo4ZdJXhJ0PmaDuYjK50L
         CsnqM6LUoLD/NzHpOl7pkHsFvfyz3HdeKsNtsxHEv2rMlPsq/TmyJ+byOHsOJoo2mHvu
         0lXQ==
X-Gm-Message-State: AFuF++mkCjKmLE8CKbI64OoKxObAk2JaiSDh/+hfiamjAxwG4H6CwuiZ
	CwXrg3zpovY+G31qW2uT5oqcLEpM/iTzPNrsmwFMyGxMx6ZnmTZHxYVSeC37ETXoNto=
X-Gm-Gg: AYBFou1gzU2bnfHMrH2P2MdnV25wRrxSLcLE8Md0S6ZdiVdOxgJUs4iEWSAZNN3rHB1
	4qPH2FZLCrDNtmyTKenI26+Os1no4gIl/dX8t3RVwfLdXpW5Ruzn8VRLMG9oBu3n2V4XvXGrSe4
	Ff/ba97ai29XIYudN8/GJ2jzp8PqdZ9aQnbv5FXv+XNOjWYE8xe2v1KNuZHGB2Yf35+2KGnu8hO
	Tsf04f/UsdYhrp+Pj+iClK3HSGfpbjD0NYwjc7XGPtuJzOrM9kvR/fxd8WuKquPsmDKhpI42MLG
	rzsNWmenopvJspLvLk36mc3B58nK9iyw/xbIxFpPCKp/JB8eCj6TdKSu3Ynaz8TIlKECih7TF7b
	YUxsMoHU14nFZf5Aa8AosfjVKgVJB0uMV/Ilh9EZPr2VMwm2eNLMvv8Lqv7fxFRPLlfYr4AJ6Wn
	3ICENCFif+L8p9CXE+gnoOnqj7GAfJUfgiylOPK/dMvEfhOFb2uq8AMh5BKPv9QrTITs7HYtxy
X-Received: by 2002:a05:6000:4304:b0:484:3313:fd86 with SMTP id ffacd0b85a97d-485872d6572mr21988661f8f.27.1788704458322;
        Sun, 06 Sep 2026 07:20:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:57 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:48 +0100
Subject: [PATCH v6 03/13] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=M9kXVsvI7HG69slRlyhwlWfg6E0tC1kNp8VaQyyX1U0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbAm6bxR/Kfy+NxpPoSkGez9TjpCzOcAgauo
 sme82jpTgyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wAAKCRAicTuzoY3I
 OkWoD/wK09Lv6GwavEHT7Bs+KoaD0OxDkciHX2USc8PW7ogXNnZ8uK2vRKo6HCysPFaC2wD7L/6
 TKvZ36z9jP39H0uBYBG7/pyOFMNSRGBSbb8dX6X+JzuOkfSo/6A+Vy0GFBkeutmfi2dyPwVM2Nn
 HZPrPtZvXTZ0zTJFy6hZiaXKnlTkZeJQa7M/vJ2CHVfUzAYbv9IDPXpHV1/TDNj2aGANoWqvaOk
 /k5pjl0F9Ld1AoomKAiMqWPxZpv8no+svxaqGIztEUkEYMRTpDOV0Mmda5KHfD8WIn2cDIVaaVl
 3vijVSiuJauYylCPbOFjWw/08eMlzZM7n1QdzVudiB6Tqm4xFy/1Zb8VSg3cJujfyVGRpHm6joy
 tMniO4m4cA0goJ2z1OYqUyA0ZvfmQerKtrUaL8beNFdJv4P25+VudhQl0I8qOaCWiINCzatwD0Y
 RUauFFOl6/v4nwBWBubZ1m5d4UuGG3rNEVZZPxbrNynS0EVwahVoatoD0zEV9ongwzKMfD7Y9NU
 4X4Xv4QuWeFvSs2jMh44F4jXC2q8e1X893Fy1W1jNj4lMdi3mzpAWvhDODBIyylkF+9VuRR2uGr
 G3kwyBZJa0SfxSxAX4lQ+zjWSiNQMLGu7385+EiL7yaTTheMfdRCegDj6NwSEKXbuyLLn02aBKX
 gwqV2m2fXmD6cOA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142b..9a8d6f020a391 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.55.0

