Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341894A5C40
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144901; cv=none; b=gayA1QgwNJwT0jV4UC3M96cnpAUo/hkThgpdZsIm7DbGmLhTdmHVfl1BbrWHob3Cdham4dwY4FVaNcElJaB26Fo0NKDXvVB82bU5Yd0oODSG8mPo68yljZxi31TkIeZ1rjFt9LgUNz/FOeWErruLOxUuoeTl8xz3GDrVEQinkJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144901; c=relaxed/simple;
	bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUFGmJlivID11PO4w570SgEvuqllMQQC3a6fR70oanGgPvu4erwz/QzOySfy2OJRbxJDQkKar4D97VcM3lmlflCuCyaylr/v+54eLUGGvlTTxL2jWjhyJ3vVvo5U2CnUMfrY44pPyffy1EvLW51w5DXYNOkSzyFWYQGlz6gvw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmyRy6OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c453K/IV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmyRy6OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c453K/IV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2tV1370692
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=; b=kmyRy6ODbeGGJDql
	tLlqQb/qoL9ptc9pa1T+HjHK+Jq+PIv/Oven08MJRUnf3fRpLZiI0WqCnb7ikEIA
	T3jVLqfjXhLIfP9+NePDbTfY8TtZLsvnD8trSLaV99/FRCxsGp1S1ysHza5Xg1Vp
	9clFdaO8Oy8YUnh4tlAlPrbf08FQPcbi8PxexyopGQuqBwhSb8DXNgaUdQ7jpu2J
	d4xn9LQCahehcNSbnhqlwSliq3Iki0yq/H95sKGLy4mMgC1gpGztaBd+lF5nUp6c
	z6WpZ/3Wdx3T+DdU3aIqSgTYpi0xhhHdOUgzoIj45h6qHIbkROIbfvZGe8Sdsgpw
	6h9xrA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8jsjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:41:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1368867a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144890; x=1789749690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=c453K/IVau8U6PY0cc9HwQmxD5x7UQx91ak8x6QX88jJYy/q/w+RWPds3ZQVOrhMeb
         djQbJDtlKq2C07/LPNFLsh0uhqraalR5jQnhMUzOwLh36UBS1acZenpHugGh4lBo2uqk
         UYi/4jDBanLLjAPEB3jMcGdElLHDZoOWjudX7aLmY5rUq6TJG8ZH1AsvbKnOS4FzvwEG
         ivlaatQ9FCzE1dDk29lKZgRY73j5K8tut2yjVoN1cSEXWLyXKcE+gZhBhJJc0Qrd9WGJ
         X811hH9HxWZcPjwHMeA0lN1nx/lDrj+HJudoWe8ZiQHlWLlib8iKCk7RLUUJMJvwddWi
         d7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144890; x=1789749690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=Wc7G9sUCnQYt9T3Nz2RYMJYAsJrNeLB1/7aKIp9J61MnFCTXg9FQOh3xl1Iw1FMuBo
         l34VexpdDput8h6jG+Z1loF28eYZF8maDo4EPKPBBeIy0XTBeLV2HCAOSS7MI6GJKUWo
         CkMkSA0FHhk6rDIQj3D7uNiqp+yv2kLJtgpka8N7kp7Fy4ea1AgQLc6aYtHyNVxFw19W
         CIV5SSALktaS5rZzb9BVa6owYLS0n/YFG90aIkP3yUmuIq1/VTI0+W33Fr6PJu/JPcZA
         /tR2bzNigDL7c+gt9V9A53jNMLZ2y1xzrKW+6YDRBFL0axyrsQz1PbYv1d3nrhDERohK
         M06A==
X-Gm-Message-State: AFuF++mOa1pL9eoaVawyUQCuprTcHKwdLwKa3n/oyA1eY8Cntaveq496
	DAyhiZIExeo1HkYWtnoYKGLF4V9vpnsLfFO+k1LD9joFIeDBv0tqcegfffRFZAWpuCKIcFy3qhj
	U9KhmjozZTlFIfNqgYE65cL1mxiSMuBV96c4/xvvfnUjCaK4TBVzxlQ/9yONPlCXguhXc1oSmUd
	Fg
X-Gm-Gg: AYBFou0B+HoJMqRZOhR+ikHY9QlqnzQf7rnEFfffeEBC1XQHK7pRzOv2yqfYfWFxKwp
	0B/xzhdQP6CcpzQ6rZUBcL36sqChssKYQ4l8UGcKB8MrNxoxAVUyvPxmNIwe2ZvDzbwvqi/pbI9
	BOmH8TOvIdrDr6+nrwbUb2ZNPD9yAnw6l1//vrgV0MaLbo+yWWly/VCJiLVEHuayYHt6PnfaPNX
	+05oc/mz0A+ddo+xSMdwDmtpwNJzsDDVE561zjH6QRrlMx7SIQgj3+ecHVvh3TFIcX0pdmJDv1m
	NCsEpMOxlBeM4RMcFvvLxczEu12OgaNTGZ7NzoqKNYPx6xasRywlA3JhAN/MqUz2BjP32sIn/0Z
	W7EPWGXWfAUuHVMIig+4=
X-Received: by 2002:a17:90a:d64c:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39d9c1b6992mr8112085a91.14.1789144889835;
        Fri, 11 Sep 2026 09:41:29 -0700 (PDT)
X-Received: by 2002:a17:90a:d64c:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39d9c1b6992mr8112043a91.14.1789144889329;
        Fri, 11 Sep 2026 09:41:29 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:29 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:39 +0530
Subject: [PATCH v6 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=3268;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
 b=N+lYwej1D65qnYclSX33pShkkVzsQQLo8j1GC8wZPEjr8j9DR3YjeZPGZOWRzB4ku9YCv5jFQ
 EHB9/liJasCCGlRHxlGk7N/8TO5kpIU0BLeUiP6TamfMx5j44U5nAjp
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: Msi9H6G4el-o8cJIcwpBEo24pE8rV7IW
X-Proofpoint-ORIG-GUID: Msi9H6G4el-o8cJIcwpBEo24pE8rV7IW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX9OMVMy3KeFWT
 xEdpNh/wvkKoG0hMYpRgg9IhlCiULrQC+LkmU7/VEZ5roJZ0y0gk0PHwuCw0Zo91ZWFNvvwMVME
 0AASN93jiW3dTk0+Ybqhd1l4+KsQlEZpyVuuAu7aCOOpX8NoVrRAj1zBJsUgivNDmIXiWAxqzQK
 EfxhSwN7ZLje3mv252z3YHH/nu1CDTK1ggTw/iImHySsOXLlVdrRF0IH+AAz9TidBaAtJoS9jKK
 ifgjim1OwaeVUqdo+tINryjd7+zRZ5BS0L0/3W37TheGJmCMjhpSofittah8Wcd4Ck+SGco+7W/
 7Jain9ZyrxfP54JlI5EqbQK04F48e4Hh+z2ofW4/arFG2R+D9gheUe7k3tO/Unr0t5DgfQ5tq8T
 3rJqU+iwL1W70ccpgem+FPjJQatxf9CU92FQi9vZk0jsAl0rGcsa9FMr0b3ScDkUiF6/0vpOyPN
 qd28EVE9gVKqbIiGTmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfXzAuFm6QUC4YT
 QVpUKaeoDbDE38tL7DSkd5OWFSd6w1TcRWmvtluIaNwllHVh68r/gvjwxe+jA4yA5lOWceW13K1
 DcarRrP3I0WTJUQ59B44MCTgVz82oQo=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa42f3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110233

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..77de9db8c119 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0

