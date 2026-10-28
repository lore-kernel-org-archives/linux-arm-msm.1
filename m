Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199694;
	b=K2YhcPOx1dyH5vqq+9h8v2xAGZWpUpm3igh48o9REA9XygCTebKPW2HA6bDC9gwPJH9a
	 1tmq0jz6shL5EsoSWlnL4DoI9YTxuXyvTX+8yAyn30S9ACE7ylPBBx1/4A1SJfuAj1Ggh
	 JsNJi+0z+AIgWwHYvWHOS28c7u+0lgNgEqJPkHLtZGFiMDSja0U2SJXCX9A6WwJ01YZA3
	 50spXXy/kq1qUvyoz2AYBBL3r2qPVJJ9GT2dHgQqN5xPhVGcLb+MlI9I1VPmZQr3duzSB
	 Cmu0/lf253DKqzU2rfBw3FDXMiA5KceUf5nkB3ZPM/Jv5uBKAGXDD6uHFaZzUmtBg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OHKjjVSxc0=;
	b=BnTd1xX/bAs3OAgHQn02bpraB/R1gtkKEA7fQZ7K8m5ES/zLS7jiH+Rv/UzY0n5ZWSRK
	 K1d0/vOnvhXyrIADlMqZ/fsoai+W9DKMkKc1DwbxoWX/h4XfG2QdxIYaNwDgwqyWP8MBu
	 dYE4XEXThDE42tCHMKkF7xJqCvdA5k2LlzlDVk8taFTF37sKXAjapNYcoIxcE1mHXODWp
	 qa96tu3HfAkJ5zTNdpZX+O5eEU83x3qY1gC8o5aCrnFEhovS3Bn4OyGvXgqDM5v/2jDBU
	 vrUATZpHD2youvrJU4s0REpU2SwnStrOGQqzir+hpv9T8PhnGRaq+HPL0u0iBtLJJUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocEuvsfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e67Xh+W0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D55606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D55606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocEuvsfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e67Xh+W0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeGK5692315
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OH
	KjjVSxc0=; b=ocEuvsfsZ+/Xc/e36P8+/3bUH807NE4Rv3ziCka8UEl0ZQ71+mR
	GjjrAiEfmlXMWOnbLc1RqZZzDK2wD75Eo9sOIL1zkzHYSfHw4JHFcKTmD+JWMXI0
	Y9wvlkYNe15QIrL2QYQBhERwsUrxHoyaxjQiCSzTiOX4ONZGDCVARHYEoqZ+InSy
	MkJgpsU5aevHhuXzGBupQQdxmyOVhnUAXuL9or8QfR7t7dajUtn3kPOi+xDcf4HJ
	S6iUhlYyhRqJUWhj7PpMfNII/23m1fuYAlUly4uFqxluNcCJuZmEcOWOE5b7NFC/
	d4EMlsvXPUiE2Kg1HFWu5w0Ro7hzvTCCE1g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be31uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:01:31 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-492f39f29c4so1252776fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199691; x=1793804491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OHKjjVSxc0=;
        b=e67Xh+W0ZJa4rMPRn3MsFJ8tWNFRUIkdCByqKiU1zm7Ejm+u3KZUS3L81uU5skFpR1
         j4b0LBihYKOkeeAn1mUO4iCob/guXH7H9cVloPOSnv5H/jarA/Waf9zKMMAAXt59El0Z
         o9XhIuTOh3JYSRotSeFi7YpjoOb2kolHtxV11EcXeDUw+jwW4jbG0yCYJBEgJHHvc4rG
         +WDs9MB5/UQvBWyredXPxurdo5wRcL2/82fqVMRIxuzuJasFvTlWc1B9UPcmdrYad+u3
         wOTuKIGCW032t925EZdyr2uQj5quxMD95YExGTXVBVscM9NpICDSjFjHrHlOw9oG9zTp
         2Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199691; x=1793804491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OHKjjVSxc0=;
        b=AftqS+WjdkymdHzqKILqLq2BF1Z+kvMXAiwOxejHvghtjSwixWRrStnchP/vgsJzTE
         RaRf3c4gn5Ge/b0zMFRaXF6Zy6GJrqzCCjuqGUYk/vKW65rfXd0QdKHQntWGnMsLLyDd
         Tt7mRyKUXK1xzt27KqBf5lXxDtqWR247mrxhk9s9XSBRCuEYrW0CCRJUCRCBm3RZ+ATJ
         DmLF5FhY9m2Nzl7kz3k49fiUeYCqGl/y7SVIJiwWLyQSt8TOGEehkrPs389RoH9I5Gln
         4RkxY2eoEfZ8rjIriv6aXwa9elLBA80fqisBlF6T/x8Glr4aRm+FJMdFZk9ozSYn5u8Q
         QK0w==
X-Forwarded-Encrypted: i=1; AKwUvBxK2UbJB6CE3ttzyP9FNe7NuvedYCUQ9ghGT/ZjdpA8fMRMOB/PHVXf6mlrUClUGrYYIdUz/eWNNHRp1y9O@vger.kernel.org
X-Gm-Message-State: AFq9FYJWPg9806v5d4URJ1rrjMfR2bqU4sEDN+h77wL8tQcqPsP/zV6r
	I+WQvSBO6A2DTS9//hJsUfpMyW2PbzdJtm/iOsb3t6AVbtTKFBA9+BGbxYyPFbhAEu8uszN1PC+
	kS+MhKo4trTKSMpoB+7/ISUgxLIFuQjKUvey5xChGeAvArf0Gm22WHdTwwMhS9e/WZDc9
X-Gm-Gg: AYBFou0y+6EJEGGnOnMHVD59o9Jr1CrUnv7MelSS0HI8agHxQbm1cgYm+JrWLQRhb43
	uD4XJgCSKwfhfVf/E2Cu+hIYTI+ip+yNnpfE2cGVoDjIuBXUBihmPv0AHZsNv1FysMXlIUQCxoV
	awRg0hp25uOssu8oQCoMGOXE/0+rW9EBsEndubTRfb2jCMmWyggXXgmTZlu3xMZSA1lLEqL4iGP
	jA1JX8selzT3c7+V1AQTCO4nXHJGDqIMQe8eyGznKJzjhEyykykvofoUIqo2+0fUE034rL/PJF8
	lMFRChVHZnB5lWpfPXI1IRDQAqGmP75gFD5JYEIodkaxVOcOHuPMC0FPNgyVw70bxODkzRGcwmZ
	NA5KHA1xsDT9CzGc4zYzjhAE4MVovS5LWRrgFu1hdewxbSTo4FZTK0A4cV4Ey3PkB52TYJ5Y28a
	Pdqmfn5modumD277cF6ysna+B/QUBQDIKE
X-Received: by 2002:a05:6870:d14a:b0:45e:d1cd:5e80 with SMTP id 586e51a60fabf-4a8bb4596e7mr1975095fac.9.1793199690709;
        Wed, 28 Oct 2026 08:01:30 -0700 (PDT)
X-Received: by 2002:a05:6870:d14a:b0:45e:d1cd:5e80 with SMTP id 586e51a60fabf-4a8bb4596e7mr1975018fac.9.1793199689830;
        Wed, 28 Oct 2026 08:01:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm2377954fac.3.2026.10.28.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:01:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor channels for Nord PMICs
Date: Wed, 28 Oct 2026 23:01:03 +0800
Message-ID: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: N8gTzlfAscNCwf-yA20zqU-I74jhMy4I
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae20e4b cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nZyv9QxdcDg_KAYjFIwA:9 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX4Cvz1AljMZfT
 c4ep8vv8Hp8CEVIYgWCbjOwwrulU9r2xpp+c0gEG5pBZsEncKZA+mGBya4caJH7kqgTiKB9lgFO
 QP2USf+9fohTGRYLKmIA4mzk+Vn542Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX65HeYLupgeX+
 O94k++CkqbIJC5Bq2mN5i//Hc25urVz8oPga2gDz+6QQ0NP7+bJgz0cLbwPCRTAMecyJBLwMJyd
 tYJsapBzwFoxrNrgcHNx7vVDOD8m8u5DHIdkKcEpWpQJVLoqpiHJeJ4ZFCD+Aq6nuRUZjU42Jay
 gmm8+nUApGKUn3tPlrNNLtr26U/niIz1etPNqmD1IaIewiRwKv03zNz0dEnsXENvincAHUZO8N2
 Iu1nMNLcxQw6vRXKebqyZkRYYHaPVEh8d9P98xSwb1FvYCHajyWlGEBVvkRiiuZVrrJGs9Sz/6V
 EwoB4fY4ALDpBQJKGbkJMlUtY7winrhNCS9KUc3AJqjUUafFtoY9486A3d6C52rimIP/LtiSsUi
 2HUu3JwJDiu/th+pzITJzPwlhAAywFkb0h50J/29VE2o3+/FZAYoR8m/yMD+e9fyefap7Kam0Ib
 Js0gT7daI6dkU7ag21g==
X-Proofpoint-GUID: N8gTzlfAscNCwf-yA20zqU-I74jhMy4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280059

From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>

PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
AMUX thermistor pins are wired up, so none of the board thermistor
rails feed the thermal framework.

Only 3 AMUX pins are actually wired to thermistors on Nord, all on
Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
pins are either DO_NOT_USE or wired to voltage-rail monitors, not
thermistors, so add only these 3 channels.

Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
and a per-channel thermal-zone for each, following the existing
Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
ADC channel.

Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi | 80 +++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
index 47ea145f4abb..6230fed2374c 100644
--- a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -31,6 +31,7 @@ pmau0102_e_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@400 {
 				reg = <ADC5_GEN3_REF_GND(4)>;
@@ -49,6 +50,14 @@ channel@403 {
 				label = "pmau0102_e_die_temp";
 				qcom,pre-scaling = <1 1>;
 			};
+
+			channel@444 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+				label = "pmau0102_e_sdram3_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
 		};
 
 		pmau0102_e_gpios: gpio@8800 {
@@ -243,6 +252,7 @@ pmau0102_i_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@800 {
 				reg = <ADC5_GEN3_REF_GND(8)>;
@@ -261,6 +271,22 @@ channel@803 {
 				label = "pmau0102_i_die_temp";
 				qcom,pre-scaling = <1 1>;
 			};
+
+			channel@844 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+				label = "pmau0102_i_sdram1_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
+
+			channel@845 {
+				reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+				label = "pmau0102_i_ufs_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
 		};
 
 		pmau0102_i_gpios: gpio@8800 {
@@ -449,6 +475,24 @@ trip0 {
 			};
 		};
 
+		pmau0102_e_sdram3_thermal: pm-e-sdram3-thermal {
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
 		pmau0102_f_thermal: pmau0102-f-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmau0102_f_mbg_temp>;
@@ -501,6 +545,42 @@ trip0 {
 			};
 		};
 
+		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
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
+		pmau0102_i_ufs_thermal: pm-i-ufs-thermal {
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
+
 		pmau0102_j_thermal: pmau0102-j-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmau0102_j_mbg_temp>;
-- 
2.43.0

