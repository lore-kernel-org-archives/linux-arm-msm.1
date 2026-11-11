Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369651;
	b=Il+a4tbHwltRb2XQgI3rEii4RGccgYSZF5Fc9kQajusQKN7rYv9+SdaUIrEp7/xOuXPH
	 v//RgKsifrUPbzTejZrUaLLfVkvnr2kJXawk/FMlgAKf9MNY2Re8u6Zs6jhQtGZDSvH7N
	 0s8xk2eW+UTisEVmtN4LqstPr+SKBFW22RsCoc+DsySFfwD8JeTKpSriXyuWURoXEeahX
	 e0+UJUi4esgj3y6J0+dJwumXpRNKyq6gXqOCFo1lQ5LHdDVVGLGcmod232bSX6yox+Z9S
	 907MhkNBRjGkU1pzr0B5BXnCDUR/SacyIlz9adLsTy0PoU4+S2ARAkfbzX9/0LFNzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=upB0ouVtZOf+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=;
	b=qJPars2AIcsasq7ILv4NY64ohInCfhf6uxb7+KYOIgp5TubPXfyrEbRCVv0gzIxcuF2H
	 DUha7XcTPcs38+Ul9gCuceey7ww/T6WPSFw4TflZ2F2aYumQ1xZNLIWCuvq7DnaENUGc5
	 rpVETGf+R0zsdEAFnSaFVqbMnMEc8eYh1Dv1HB7EKak7OoObuQkTA+jd4QrIo50Ew9BAc
	 1q3RdWcOk8PgPW1jRqc15rtkl1Bxs+0EXgRq7eDweSA7/dy3Vgs9EDdElSIj97Qsq7dbQ
	 t+pUeDWWCpvtFZsMFhFDyOMO1WwVLQfrVjG2/hMcCeFBaSUaN3ZwMkJL8679PNMxxBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QVwU9vAV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c5Ojbi+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49635606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49635606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QVwU9vAV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c5Ojbi+E
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tQu54050266
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=upB0ouVtZOf
	+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=; b=QVwU9vAV0D2Rmt52iM7GbDK0ZUF
	P8it315DAzJoG2UZWv21dz6PdgDtIgSMBwpSjzGmm9v71hEKvXWPMk820VwGhf7e
	MZGR61Zf6z6aTCvuax4aPc/2lByy66GCL58AmDt487z1synAjrkruDru/3WGXHL6
	XV+HTOv6i1EoZ5kNJsMAKRMG9NVZ4u/KZB7tMuU3ROAlTezkVXNvQcX2fsEi9U9+
	t/pahaME7OFWXpz1aPAnrdnNUEdiObHtUsA9FQa4VQt6QNY5je+RqILnUgmHRGtx
	0I8E+eAdVQzs02+Hz5SEv2GLRVxN8LtvN8tL5J4X4nWoZsR3AmdnXmMTGEw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5jbnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:49 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so5532917a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369649; x=1794974449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upB0ouVtZOf+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=;
        b=c5Ojbi+E2LgwumEgCb/6JydZkhh/wIqJqX8yS6tL2RBtNdNIUVM53BLvClvSSnE/6T
         RaXXKuSHOg4uGBi01anpuwuNhsjbV1+YSGr8Jkts5BxlmPUJilUye7MfWHHHWDfZLGz7
         CrclqBszq6lISxwB83e0yWwKArtqTeYR+0w1ZoF1l9IawVnXX2VhUglHMj6Bth1D0yx/
         yVJCAZr5Anhmx3XCFgDfxggZ9SOBYkUpHWdQENlqYwbghGBaMczeVI2jR72wKD/MjIhV
         GAflO3JttWsJPNoYEXSnhJTY6zVKlZGutNsHgmsc1gkVqsUpm4968WwlnyZyDBP0Prbl
         piCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369649; x=1794974449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upB0ouVtZOf+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=;
        b=ZCwCKn8t5PqkEGLi/e5hNHd7p3W1Q9m72T89jNWk4+QvjaPhc83coKSgOQ8lasoO0Z
         t+1Qc7up7YF/gGm6R48jB3m2PLLGjokmL4urHyyODVbhheUwV/JlRuz9kWAZ3fqPCWha
         ntldiM5NH9HK7jOe9JyZvZ6jkkyvWNe8dm4xSa1k/GkrLftCZ4ZK6b7bxDY/NPSfs0O5
         jIPd2WH8OvbhS91uoR6WFXqW+dAzYXlP24rKu38XZWX/mYeYY479DQpmfMhRTa02A7Ch
         S7+2TXPpeX3oIYhnpY+2X3Q1z9FFRZ0Lo9AZKnDb8N7ixjTI0Qa4uo+ndQa1egtL95Yk
         kbQw==
X-Forwarded-Encrypted: i=1; AL+hErH00U/u9zxRdCYQh6vFY+rRp+uVMP4szQZ+Vu0PN2xEu6ViGcm+DAHBeQ5dmUqoYvBTj8vISexvgnXsFaXc@vger.kernel.org
X-Gm-Message-State: APuU4Z/yEChf6fHutEeZ+q5iHd/BnCH60fIhTGZoaI21Q+ozJrVkjc8S
	AQBLk3ipIAGAbT/VJyR7TvpXpMiCv1tU2Qp2JZ1NiuCQTZHxeq1FHV4TDJ0Iw+WbSS2pvq5W21t
	jGlXaqw0WtUI5xc1RpvINL/OaLp/WIebwF88pvZbKkul/WCLKxpBJ789I5wMpmz+rIGwP
X-Gm-Gg: AYBFou1CRYfp8xj0aoSWCVxzlLZ/Ofbx68kYR+PncUp919YHN6Mw3pMAsW+3pob/9UC
	mWc8Gg8VseCGCDReMkRtAjqZIjaN6g6kRueOwT/eRAwU/G+It6REm666EM6GJ2xXHSkGxLgelpL
	1ppfEnF3ky5E0VuHHhbZJDc/WPUVnkwZZpYVRhgVhHA49Fy2vPVtj1YoO9SsnVO1VeDGstdbM8y
	K95JfaH0PiAXVgYtAtCTyWQ7Zp5Tg8CRg8ISfuPP+9h8USQkfqX0YZR45Efq6tGYneAO+3TtqBy
	u0Tq4r9rBiFSWopdeieYjNXO/ni6ygxwscr5KYyb3f2aBYR6YBcTxydzfj19EC3ADDPA8UZQrmQ
	1s1Wp+1dsSglco8bUurugB8MyPVNpPqEd8aeO5qG/Xp5Xk7T/V/aWKu+9VycnTc/cKUBvyvcmZR
	/dO+KfsxWS26052CD+fwFQ5FRueJRhtl8Z
X-Received: by 2002:a05:6808:16a4:b0:4b9:a8ac:480 with SMTP id 5614622812f47-56b9710037cmr964664b6e.30.1794369649024;
        Tue, 10 Nov 2026 20:00:49 -0800 (PST)
X-Received: by 2002:a05:6808:16a4:b0:4b9:a8ac:480 with SMTP id 5614622812f47-56b9710037cmr964637b6e.30.1794369648518;
        Tue, 10 Nov 2026 20:00:48 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:48 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels
Date: Wed, 11 Nov 2026 12:00:19 +0800
Message-ID: <20261111040021.3636059-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
References: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX02rWJpDTDvmg
 o2jByayLpXA2tgY/vZnIUks3LQhKh3L2qmFWr3dSWWD+fkpWJft7WtSv00aVtA+SDz8lGG72oSO
 43nONQkE371lUU5HWXKfqZzXEbTAIJkWcNrll1xxDfOZu3l1TAflcgqqN6Hd/GvR5q+4OwYwwiu
 47SPUY4Y9PSFj1T2vY1S/Ym+WPmA8nwMO/iuan0dkiAbHPodUXJwrihIO0q1txzg9a4sHxoLmJN
 EI1hLUwxYg1uHHMuSQcnVyIXdbSokhCuJyJZnmdyZru021KpCO6fKcnpBQ2/NYeSQYQvTbhMwYy
 9GFdjyirfdzMxaJRLDsE6RF02PTlaI5QE2U/Qd/lHJGfzkGfw1CJAGPwk/bPWEa35i22UUtEbln
 z1aDMlmX+goTnAvZ9cyZj7O4VHpEEz/HjafsGxndgMR3GawjhpywmfOlWk8XKXMgZwCEzQ1oUDr
 HiheQDDY7vOCrOIwnDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfXwKLfRtAhzHx1
 ZU5KJ0nHZWgsDcaB04S27fRrwPlzD63zFpkrxJVjth7sUhaCVSmKh8AHruZElMXDdzoQiqa/NEV
 Liq18b9hbuo7PCJl7ea5L2uHDibE4us=
X-Proofpoint-ORIG-GUID: 8mCa-vOH_l0SOC8q4Ns2_4CGkja0mvT3
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af3e871 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TEmDzvwZ9EAiO1TzxhoA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 8mCa-vOH_l0SOC8q4Ns2_4CGkja0mvT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110015

From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>

The PMAU0102 (Kai_MV) ADC5 Gen3 controllers only expose the
REF_GND/1P25VREF/DIE_TEMP calibration channels, so no board thermistor
feeds the thermal framework.

On Nord Ride, three Kai AMUX pins are wired to thermistors: Kai
instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's AMUX1/AMUX2
(SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins monitor voltage
rails.

Mark all Kai ADCs as thermal sensor providers in the PMIC dtsi, as it
is a PMIC capability, and describe the thermistor channels with
qcom,adc-tm and their thermal zones in the board DT, since the wiring
is board specific.

Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..550cd7fe0ac1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +422,34 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
index 47ea145f4abb..26c4d126a23b 100644
--- a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -31,6 +31,7 @@ pmau0102_e_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@400 {
 				reg = <ADC5_GEN3_REF_GND(4)>;
@@ -84,6 +85,7 @@ pmau0102_f_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x5 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@500 {
 				reg = <ADC5_GEN3_REF_GND(5)>;
@@ -137,6 +139,7 @@ pmau0102_g_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x6 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@600 {
 				reg = <ADC5_GEN3_REF_GND(6)>;
@@ -190,6 +193,7 @@ pmau0102_h_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x7 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@700 {
 				reg = <ADC5_GEN3_REF_GND(7)>;
@@ -243,6 +247,7 @@ pmau0102_i_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@800 {
 				reg = <ADC5_GEN3_REF_GND(8)>;
@@ -296,6 +301,7 @@ pmau0102_j_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x9 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@900 {
 				reg = <ADC5_GEN3_REF_GND(9)>;
@@ -349,6 +355,7 @@ pmau0102_k_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xa 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@a00 {
 				reg = <ADC5_GEN3_REF_GND(0xa)>;
@@ -402,6 +409,7 @@ pmau0102_l_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xb 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@b00 {
 				reg = <ADC5_GEN3_REF_GND(0xb)>;
-- 
2.43.0

