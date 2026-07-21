Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E47246AA72
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647897; cv=none; b=a8pxONPgoRGcW+7wZfV2oZnbut8l32B8Cw92rn9avnvj9lnp1oLt6I1M+4OT0MW2VdiraMsSUh/JhqXjrKbzcP/AYp+cTlET7g/jra93gMRgEi0fAlwyKUEa1e01zgUrrJ4QU3Ha95gPHoprtwWzINZOebRXNEDPyXWJMbF6x6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647897; c=relaxed/simple;
	bh=YxmKwvrIzwUkLsdRZaUsfnJD68Ezo5OH45y/BuVJcdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqkFIl4+wQb8gUL9GQ+jR8WnJk1riYIQFtxAAdu27l3iNgSCx5jqW18nP3Qpss2lLD8LtvBzEBsMbWi8RLySe7w7tj6DPkki2jvb5WlBk4k8cpcBn7IYEhY1xqrsXFh8ggLP8AvoMjZrDZHa2+wAK0nEtOQO60mPisUJR6+IL4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMA6vYKT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMA6vYKT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so16533645e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784647894; x=1785252694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWf0ZSrbv977JYaTjxjFli90HkAL+UE449SK7FOdDXg=;
        b=QMA6vYKTHro3r7ruHtGIDXbc0B4OVZNkE4OrDXSSBD4KB6wgN/YpvTB46/oO3Pn/QG
         2qzvtDodWpHNXvZJ/AGd/Dh/ZmTldjyaFpe4i+7nK5l0OnvpW4Fo0rQ51aFPqG0r0Jbw
         zP1iwR4lB5aDFlB8aM1gtyG0XkV1UZzUQa7M0xG+gdcxee6S+dznBrwexLytmnLe+bHx
         s5fRoJEV/JtPLvTtbvRFNYMOVy5eXzVmb0qhXuo1a9bIHlb06lY9c+Owl9lk13YWZqPE
         AZDxV3j+5kNxvZw+B/bSR0kn6tuFk1NPkTcevfKHYa8/ncQi3PtmXCsb7ILMVxgfFzWG
         DOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647894; x=1785252694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWf0ZSrbv977JYaTjxjFli90HkAL+UE449SK7FOdDXg=;
        b=SG9rRsLv4y08c/QxWbAn0lrnQLlbVejwneXr98hs1l8Tmj1tsDXhpFea8sCQOW6BwX
         bm9k7wAjPN0DoPqRQnSXg9Rd4a5BfcChDTQ9ap6j5I9CjvLWtPvrgh7hgwmdrslNufq3
         IrsutJ8h/ZRFmNYiDp+5HkBcw3f3o19JRw1yxK4kjc4xUrWOltdNQqsC2790Vrcs8Xl/
         xIEs43Gjp+VJTb6Xgn6qYP8YQyyHhfl1MOJEtY0SWDm+L18Va9psY90GV9in6hOkOXdR
         on8eYTnfnTksnj4lme3JKeg5xL+jQIwjgMRwSosOxh+j0XkkzwUY6g2GqYTwmsMcFCiX
         HslQ==
X-Gm-Message-State: AOJu0YwbjpgzAyz0sQ5ZwzPKvab5AtRGVCN/CvELUxf3Q1l1ccxlPsLd
	pwfzOI2CtAVrK2YhE08/TDC407ZLl0hBt6mDqwZfLIq+/J51oaiU9re21qF0pMXaIzU=
X-Gm-Gg: AfdE7cmmgPZxPfpUlmvxx8mQsWNrF8sQyUDs9e2HyGgZERMZHiNg6X49QibjDZiNpwP
	+NZv8dfmY+ci45UkpphejhOOY6O/jVrl9fOZHC31h8iOxh/3nroooOfVyit6FVPAWsG+3HtmHMn
	xiL0OCeb8iT23ypLfNURNXL/TFReYzinDryewloBgeBisxA/GdlsMQtGVqa19m4UMmVqTXY3l1g
	GdlDKdryenHuE5QhEqrgmGD9dsKERMoZD6f8Bom+5Dwzvcx7hRmUdQuAyXTz8V6YjR8K2be8GQN
	5ScovEY0tqxiGRxWsHjvQBkQ2W+KUxfNFLMzOEGcMKj1L7ezwGekrTAqkopVo3I0IztTzaPWgnS
	zrM12CUfE3s/1eEWWgBbGA0u+rUPAxT96M8AUqm3GOcQzpeSkmO1AMpgTloZIpsVCRPBVNFSlf+
	hiaQ8rCfogb2X3ZfW0iIpxtj61Rr3oQU6Y1A==
X-Received: by 2002:a05:600c:19c9:b0:495:665d:75df with SMTP id 5b1f17b1804b1-495665d8542mr41459995e9.23.1784647893519;
        Tue, 21 Jul 2026 08:31:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm1043495e9.12.2026.07.21.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:31:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Jul 2026 17:31:25 +0200
Subject: [PATCH v6 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-topic-sm8x50-adc5-gen3-v6-2-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7154;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YxmKwvrIzwUkLsdRZaUsfnJD68Ezo5OH45y/BuVJcdQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX5DRzanSyXiYkt9ByRh2MaJ70x2MK0tfqMzH4urD
 vOh2IYGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal+Q0QAKCRB33NvayMhJ0WAtEA
 DBR7PMU7D83KkcCt3wtzF+pG9EhumZ9iG4lsE+Vmk9/xjsThqNJWMyrSf4thX5zkwqXMvi2xs+pKTu
 aIkICuZgQBmjlXuZqat+8OxqXwBIbvoeNTj5cCQWz9LkUWRginu6H5nCaWAZii39wCF/a383ZyyXyx
 PzQAc1myL1gaAG7LOBOFx0oioAWFYUwgnNQTgIUZ6gnTM/OUPby8eJFLGV6cmnp/rOZ1YTvVpMDJy/
 zuF3GZGfdI/CaRACMK8LYNC+edrD8Z3LTc9VtP8CXZb0GqVguzFz1eynKGSgc2c1A79Y9LyhTI7r/O
 +ovokuaDlai72q9L6Zib8F6SDl8qnTgRYpwF96jS34qbkl/xi2uLT5nevXmkXsPe8H3G4pcA9ef+Uh
 unUuK5gQx3BbnlCZynyXDh+ctLqf+ZvQsDxMdGmRECsaDHNnC+PZ/E5komqzPPx5tST2v0MPRrj5dx
 Kjg2cTnFsNhdXWAknrPdW2d5Fv6g72oTIgO1KVhW9xA8hUZIFzUS/gMtyTmlT5N8rlrrp3iuHslo5u
 x1Y9ZvuWaf2oxDIr9dxdD5St6PzbemZ5svoH+/HLTDczVmT14RitOBVPyF3qZrbQE1So3UlVYOxfEM
 6eNVKrhmNV2ORk34EedpKqEwyyCiAf/EBmlIqBGoEBU3ZCbfKCrGQkKcaL3g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index f2effa55d819..144e105b734f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -205,6 +205,92 @@ platform {
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -995,27 +1081,218 @@ led@3 {
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

