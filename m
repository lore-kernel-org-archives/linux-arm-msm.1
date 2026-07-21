Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA01F46AA9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647899; cv=none; b=pblVNi5lkx6hsKIadOuFSXNA10pBAb4sRfWqF2JAb0SRkl9AmkZSzod5Oco5h5C7CGF9scAS+LQ3alw4wGPHtiyuWi12G6NddLT3fvyXAOZJ2J0zqu1ZvRIAJGjybzXcG6NRq6D8i9E0+2L1b8UZgDMOWc+eaVnElTtrIwd6NWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647899; c=relaxed/simple;
	bh=Vaw43O7aTU3TxGDPJ6eTHDui+Hjkx4vSJcKDH124tEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4oZba/sOsYPutGUq+Ex8dDYN6Y2SolUNtsiYVeU8jv1kdH61iHMqrvMnr9tlTvSaeQU9aic4Ne31gh258PEpbPI7moAu+ndnPA2drDnAEcIsf2V7Xgo2NFQlmEXY1+9/fQ7+NMgAkvJ1wQJ+nhCxmNsLFOtUeRj1isLUi+L+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hQRFQViA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQRFQViA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49548e01d02so20609335e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784647896; x=1785252696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2aZMSFHy16oQ3tB34tqhSspcmT+xnl8lwbGM+A6ULE=;
        b=hQRFQViAjSjEBPdAxxWOIyC6bxCy4RogYOKlV8tGpWA1LwO8wOFoTWt/O2xJTmp9AC
         YJ6EJY1yOmQOSlzhbR7X5sbBYmXXa3H1kbEWzzahVd0suOhXSfYZ+NRNx23PEFjqmn8e
         UjrUL1efyd4ZSo+iwFhWUf/cK4ZSsx3r+1kbRZcweD3Z/OIO4AgthMKDXWp8g7U6aA9f
         JwPQirLWppLaYZQObbbc9ciIklzR2Ifcc8L4T+IgFDZeD4GTeAsRP/wJFPzQzNvsy0BM
         x4M+BjBzP3sVOpiO5yLXdu2DJV7PHjfhA/bm6T/pfKXXdlfFHk6QZFWY/xUJVMxKd0mx
         tWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647896; x=1785252696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2aZMSFHy16oQ3tB34tqhSspcmT+xnl8lwbGM+A6ULE=;
        b=J+U+bZopAKMMrJiZJ7xafD4aznH9Yq2LFlVxVG/kvSpErop3k7M9lgW2hgDFrTb1E9
         eZ9UX0odKUGEoYiuZ1LMHeBrB+Zfm2MXmAkdCqnXzwuMYJQFwvF8n5nwnO7dAp/tTAuC
         gPKY09zvqXNbBtWXhhuGEgW7TvvuzG18EmiJo+tKK0wB6nSv3RBBJkIbMRwKAb9yWW8p
         rjX2YZwMU0KQEqYoA1zG0oSoODR4iBeDK2n+RRzWNKHoFtJVuzBobshUyt/ojnqz15GN
         TXm0AvjnTM/SEaVxK3lARxEIymRGppxHFVNkW5cJ9s/H8s6/OSMY1LwxNvfP1M02JyBE
         naTw==
X-Gm-Message-State: AOJu0Yx4dqHh5zQTyahJNPFq/3heyEbh//bPZfHAw2KBNAo2Cgjtd8dj
	4CwmbiF8bEvjOESQEPpjnFBfRT8nBjN+/93TUMcXpIKFwqhMOcrF4oPgj4/Nnetbuyw=
X-Gm-Gg: AfdE7cmW9crh5IkQBqRrIZ/FEddZYpRze8i9f3YPtOHNcn1t+O5R3wgUUygvO4FWD4f
	wctu/wfwWb1sg32U1efqaH1VpT6kIQii1tLT3fZjLAfHYAn6fRMJlPqXZeTZ0YwdB+X7F5Tm8gL
	iS6UQmpKQHAf3tNGZVzt1teCE3TrbGrXuFOVQrShsCS/T7bfmcB4qCkoilSR9gEPz72hoDhYgCp
	6F0zf4qRLTFPdjm3vMMlVv9i6nIx5f6Homuub5S3ZuP7Cc2bG1WoBbNqpyr1ak9lpFRPBXHjBF1
	vSv9zRDV+jRaNEZ/ynZbjNCjNkj0cA9H2tkSwsPOGSBGe/nbLj4Pi26nqdrhiYj2MNTt196ilQZ
	s86/ciN1Xr/7kIVM6ocvX2IdfNbtAlE9P6Q15ZNuQMIWlDZrfPUYT88kUlmBfYkV/THIaodj8v2
	h8vPj/zALeRCOYnJs2cFI225E=
X-Received: by 2002:a05:600c:5490:b0:495:6130:7805 with SMTP id 5b1f17b1804b1-49561307a51mr81079295e9.14.1784647895490;
        Tue, 21 Jul 2026 08:31:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm1043495e9.12.2026.07.21.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:31:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Jul 2026 17:31:28 +0200
Subject: [PATCH v6 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7126;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Vaw43O7aTU3TxGDPJ6eTHDui+Hjkx4vSJcKDH124tEc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX5DSwQ2ZUkJ7oK6zUKlawuBRMmH/cLel8dQ5Gwqc
 TCn8wHaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal+Q0gAKCRB33NvayMhJ0RTlD/
 92GnCqrasFgww2bH6hmRPtCHBEgIgaQs8nepzRCP/wxAhecmaa8+65qotda8WQQfmz+H6Cfnwq7TDp
 ctgMjYT/xc2r9k5/BcUJRkTj80w4f3zJiCPGPPGZaHjgJSt823SSeTxcAItbdBxAIrJw5H1Nm+Y4Wu
 BZc+Ef70z6QRK/7u8OVvVB6OZ6q/+6BJDb1VtHAR7jla6vsGgwjC6DblmQIWX538E7aI9SgjZUqdNV
 B9Jg8h6nytQ3gaR9COU8p2F6VrJdjPkqC+chqVMIM46YWgUDV2y1EPGs51K+OUdsJwVYLg8PeSFNH+
 WdIW3vxlO19cyxuwVW9BQMlTw60ebKyJ9jxXEqRPp7zi5B3uAcvTUssXCYy+5IJVA4eHIkqb8vwF4x
 3y18LnwRTt2pehi0BSu29y9IAkXvcMJn3DrysIM9BsRMRF08+R0XMrrJTvFZPCTv4nzp/XKyJkgBCH
 GvQ7AKsD0XbwJgOocTSHbY1a2HbF89MUMueAH7h49bm8rXEWH6v+yuDOnVVmv33dtj4+xmyyj8F1x4
 S3rt89eHnNU+XPn6rBoyj/eWeUgQyKwJNMIMLOA0HiPOvpGYwZPRjwHuvN3LHyp7L4xx1Dzuzsf8Uf
 5MCY3yZ+By4ZpHZCoGtaswJ+PPI55qOpyTLv/DoV/0O0c15twKJFP95DKJww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 80bd2437f154..71c0355ece4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -220,6 +220,92 @@ platform {
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
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1040,27 +1126,218 @@ led@3 {
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

