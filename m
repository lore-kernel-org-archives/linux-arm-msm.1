Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C946AA7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647899; cv=none; b=lL/xFvNXBww1UZTeKl+WvxUTK5mEH6WzCvASnaLXbj0EwMwpa2dxGSbkWPIahBlHn5GAQGS8SoAo3jW1/V6CDdCMtpv95YFS5ad4U4mHARLJUhtJaNERGQmSjITQsWhcfhwgYIZeJKswOseZP/thThg3/MjCb8IlMsJMERUVnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647899; c=relaxed/simple;
	bh=/PryJv7W+uy9HkkofqaOpwbb6s8l+jS5ePP+MWugDj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdsgmadP1O0Z6mPj2zQxDyJ+E97ZS6WoIyvNkkW4RthVwW1gt5XayFt1r81VwrX0PltwVB6WlnBli8yULlPJx20svERyvChipHLuCmDWA9b1XQbEeDcKVJuRXcS0pTSQF4nuUCwcYL5ZVjo7gNvC4t+QCG8NXUJeQVgXIJsNO38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObhrW7WD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObhrW7WD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so16533725e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784647894; x=1785252694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8Jq+6AcZCRzEmUc432oJEifbXOVSRMJSvwbPU7YXGQ=;
        b=ObhrW7WDcewkXpFhx9hrZpl4xLfpVpHxAWmbxC2Oum5ufQuDi/8PUMcx7JaD/uWXwG
         bzXm4eRuhLlm1KelQa59Tw9VqjTMitVghODrcPywH8aFlz8thYAZvXf9VzdEv1/PZcGz
         XI2LWlqbFoVCsBoKsGbAHXQcIPLiaezDg4J90wzzipK1U5HsFDNdRdpbirJ4I/8akcks
         kcbsr+qEq5e2l3e5sYRbVio411lJ2SFPIKmx/4LYauFtIfrjhthu9nuW8v2rFZeFGNgS
         wmJ/4fC5KNSqpcxNyXV567/Kl2kMLis7hLSoZgMSxEh9dnzIe6YSdJQyYGgAFkQN47sy
         MGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647894; x=1785252694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8Jq+6AcZCRzEmUc432oJEifbXOVSRMJSvwbPU7YXGQ=;
        b=nTv6eozHsDI18ssqad2PHWT3Jj1h7jyG70V5U3dM3xIg8RA9x8zVe6zC18m6yqNgES
         S2Z21ak0WhxojLMmT2e+Mh+0F4Fm9GbkvxDEvBpFkqP//7hPlFFt07z8hO0cOVUuZaGN
         AOl/Oyc1RmeL+8E8cic/mfml5dnOm6nmFt7rPD+vXM9JcQPaieTqi41GThSFWJOMRzkR
         MqOrXo/+1vvx5e4BvNNvBJDv1XpENo3HgeFY9d8bO+B6lJcHRAxAFmpSJl2JpA8F8GeG
         wClXMSdCZndkzMBa+8euKrGguX3R8seK7ssvEs69dOz/FeHP9iBT2DxAxliJt+JQp88C
         Qznw==
X-Gm-Message-State: AOJu0YwFoTfhBVw5BJNGv7cLzBbV0Y4GCVyD5w14uhRGP+3sdU4Fnxxs
	Dt8JlvnS6BMMxpWF+1mm7o0ynrb354BhvxHSAdZBbNx+LYEXzty0FighI44zyARC0E4=
X-Gm-Gg: AfdE7cmQpJK/n9H5WSHzhueG96F4kRQqCCxFS/WiAdZaXKvgMB66mZSBm9EqusHrQmR
	OMJ8MENz2jUKWEfJTyjQQWMkPLOeQu1c9SuF5YuDCW3f2Te58HYbGGBGb1gQUcgzVQdaFRkFRof
	nDdsIcE5+9yEsyJWSY26BbFjL53J7zybUOKwaPwS9XkUcJwtzNz0LBI3nw7y7EwLowp6hl4he4G
	QK/EovZRAEbpyhC3MwSjkHo3sAhWbnOYeCI6EVBl32hpnny1caEFLbpfdTTTta4nHPoEIwJzh8N
	+TTVWnquoOShAvqMhkJHXU8DrjjAxfQoKXaDZnWrzNk4INBFhqQKvwRcmU4tNo4NR0MWVFbfRYG
	LqPHRA+ljRTMq1WEcyff5AeIzWBDb742IGskLNKp79l5QzPaLzyagUZfoH7DZuY3Ynylyob7fVy
	lqLndoeqM5Ib/sPEWZtEboAfFT/juO1XPjmQ==
X-Received: by 2002:a05:600c:524a:b0:495:5a0e:6d8c with SMTP id 5b1f17b1804b1-4955a0e6fa1mr135033915e9.27.1784647894196;
        Tue, 21 Jul 2026 08:31:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm1043495e9.12.2026.07.21.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:31:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Jul 2026 17:31:26 +0200
Subject: [PATCH v6 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7112;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/PryJv7W+uy9HkkofqaOpwbb6s8l+jS5ePP+MWugDj8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX5DSHgGRfrMu4I9vFYDfDycnLZzoR8mnQkmL1xCi
 Ldl6AaqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal+Q0gAKCRB33NvayMhJ0XnPD/
 0XBRsVx166chTJFX1u1r/RRxByf5y8rRVWLrePdDTujs4gAN3PbrZmWYpaq1NiGtuRVIzeeHF3jj3y
 H5FSsFF7D/39ZKv266+mlWTzZDENGjzPbSplCzUisOENX4Xa7oL1bNyWEpWxDgoIRDtc616LbdlEde
 GnfysUYgAqXnTRunP3o7fw3N9AnuWgsFZjGuNjRbTUtI4OWhkI3R3tFnizJEfjtOz5BkIN77S0SxRa
 4NdBrmypC7zI4re1wc21Xf8doKBdkBTeSSeKt5MLG40NrDhco/tcrWOsFM+7WAGUhu5heB1Zc49oVk
 SO5rn3Hl6JySIIgkh4TKb57GlibzMgjW4rd8m2tnP5tCDkrCGDEUixoe+6Tes9vJ5JkKvtuOvfZlz0
 r6Btvnu7JUc80LierXXHeZo0Ij4QBZC4dzrkJ+GZPYvAjv1ISpYR+BrikGUaTQotDI0VXodj63jr59
 rZBSv/JRsoRHa7uuNHHEjwOFb8pgnoJb+nCTGQwwYwf5yR5FXYetj4GY/JZid3UGODlv3keWWwjYBU
 oIPbUQZvgVTsDRLN7fB0qcJuZAfmpd9R2TweIDdMZrjDTzIw9BM8jb7t+qAjy5zZ820Z+lFxbgUcRV
 QLFk9HK/XCVwjJIxx6bdiD9xp58WuvioaAfmQW7ruE3z3GEC7Eoyh8izTAfA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index b79558938552..58c71ac67da5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -280,6 +280,92 @@ platform {
 		};
 	};
 
+	thermal-zones {
+		skin-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cam-flash-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wlan-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pa-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rear-tof-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		usb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wls-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
+
+			trips {
+				trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1100,27 +1186,218 @@ led@3 {
 	};
 };
 
+&pm8550_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550b_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(7)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
 
+&pm8550vs_c_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_d {
 	status = "okay";
 };
 
+&pm8550vs_d_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_e {
 	status = "okay";
 };
 
+&pm8550vs_e_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_g {
 	status = "okay";
 };
 
+&pm8550vs_g_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550ve_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+	io-channel-names = "thermal";
+};
+
+&pmk8550_vadc {
+	/* PM8550 Channel nodes */
+	channel@100 {
+		reg = <ADC5_GEN3_REF_GND(1)>;
+		label = "pm8550_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@101 {
+		reg = <ADC5_GEN3_1P25VREF(1)>;
+		label = "pm8550_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@103 {
+		reg = <ADC5_GEN3_DIE_TEMP(1)>;
+		label = "pm8550_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@144 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		label = "pm8550_msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		label = "pm8550_cam_flash_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		label = "pm8550_wlan_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		label = "pm8550_pa_therm_1";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		label = "pm8550_rear_tof_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@18e {
+		reg = <ADC5_GEN3_VPH_PWR(1)>;
+		label = "pm8550_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	/* PM8550VS_C Channel nodes */
+	channel@203 {
+		reg = <ADC5_GEN3_DIE_TEMP(2)>;
+		label = "pm8550vs_c_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_D Channel nodes */
+	channel@303 {
+		reg = <ADC5_GEN3_DIE_TEMP(3)>;
+		label = "pm8550vs_d_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_E Channel nodes */
+	channel@403 {
+		reg = <ADC5_GEN3_DIE_TEMP(4)>;
+		label = "pm8550vs_e_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VE Channel nodes */
+	channel@503 {
+		reg = <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+		label = "pm8550ve_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_G Channel nodes */
+	channel@603 {
+		reg = <ADC5_GEN3_DIE_TEMP(6)>;
+		label = "pm8550vs_g_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550B Channel nodes */
+	channel@700 {
+		reg = <ADC5_GEN3_REF_GND(7)>;
+		label = "pm8550b_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@701 {
+		reg = <ADC5_GEN3_1P25VREF(7)>;
+		label = "pm8550b_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@703 {
+		reg = <ADC5_GEN3_DIE_TEMP(7)>;
+		label = "pm8550b_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@747 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
+		label = "pm8550b_usb_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@749 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
+		label = "pm8550b_wls_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <15>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@78e {
+		reg = <ADC5_GEN3_VPH_PWR(7)>;
+		label = "pm8550b_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@78f {
+		reg = <ADC5_GEN3_VBAT_SNS_QBG(7)>;
+		label = "pm8550b_vbat_sns_qbg";
+		qcom,pre-scaling = <1 6>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1

