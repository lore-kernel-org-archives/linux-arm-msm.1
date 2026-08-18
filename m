Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963203C2B92
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043944; cv=none; b=Rfbqmb0Njzm4U2+Cpzrr9UEOBjkRkHvj5VuEqQzuRHM3zNsZWvHknQaT9Sbfj6PeZqpSDBSHzxOPi0PIP75n4GOb8jzbLVNCcMomCdGqhIYEKa2OgP5ck50IGFL+eG1gzzmFx7nG42u0gGMPgvru2hcTcfPsAmFu3bf16O1eUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043944; c=relaxed/simple;
	bh=lhWUtyxtSb9+AzL65uMEepXGAnX5bvba2sh50dD2gk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TapyV4FY66fjmR+uJyLZKBTG+qTQ1Fpc0KIN8MYzvhauZQRHBshnKByQnoQ0LChnLWY8SJmee/IwrghiWm4l5voJVpWDjThRN311zEJGcyAUnINQPozVW6ZD8N4tcHU9QYUA7n3WIVeGwgK6FnK9XPMxZQPH4azbxDT/1fBf4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDYOjk3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTQXyn45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDYOjk3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTQXyn45"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BIHO243024
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Pk7pb43Qvq+nmHrc2yfkX
	ZNK2t7qCsLr1PmUWZP4O4=; b=WDYOjk3uH0o5j4aLNXTYQgaL27FvjW8RcKvSpF
	yWpX7K8NEQp8A9P28hNokIeQBQEJ4hxT6oI82d4e+8uLyuZU/6qLo9g/jy+8xn1A
	9t/32uIPCDA0DEitCvSdRTFOgs3iwTO9RvzEiDexTken+LSFakrDJB8LkoJkKpg1
	9oADHck8QUarPjE6PbVoj3PrOriptdLqBvsbN7Pnsbmik8lnaZ60xOq2vzxCv9zj
	t0GdLlKEGzbBC9T9nC9a97fZSrW7sPJ6Wpd+BWz3GHRcTiuUkppvpYiMtI1hnSjI
	r/v5OAOvQPLvVD7akxZ7SX9neE5V0dzTW3lHgNBXfBPIuFSA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hpm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848662cd2a1so4711590b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043942; x=1787648742; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Pk7pb43Qvq+nmHrc2yfkXZNK2t7qCsLr1PmUWZP4O4=;
        b=bTQXyn450BArdovxOVIV8da+VIUaYDt5WQmCwMfHMG6K4/+wJkDFjToiu/VW7w8XBj
         Gkf22BhGtNUAqsDuEN089p+x3Zco12GwOalBNZWTcM70eSnU6vlSeGW47+NQrIjlhiEb
         RbYZtAfzA9ntEYJs9n5rdslaorDzmacb7dNoh4fbKDdgb/vArwC5uniycQGKM2l+yAjT
         2WrTgeEuRpQDT8Q50yGRijfQC97uIh6NOlriekeCYS/t59RZbd77HwpabawMu72R2PB1
         AlRkFarixa6FvTkdF2dBa/XLDzufCPuhGVA0eSKZARZbwi+3wJkY+RWuSbA0CfaYQuH+
         Dbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043942; x=1787648742;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Pk7pb43Qvq+nmHrc2yfkXZNK2t7qCsLr1PmUWZP4O4=;
        b=dVEyPbPOkibpE5hCeaKC1sF2vuW7g/xy4wcZXbD09yFScL50kgY8apMiOeIF2ekoKP
         KBnHM7qVatJhO0c7DwJT4Jko54RTLPAuvvXCm/M7fLu4suwlUI3OV3BW1+ZMF2USVSaD
         vH/3mUHZvrEoM9SBlRgAUHOxO+aC8FWgbv/tplSCopXpEUgnlakCWP3XtZVracc2Lrkv
         E86ODQ9mkZf/pxbUry+TOPFtzBfNWtYM4XU5cc5JhhhTBi435IeZvhOD9Z6mkzHppRiS
         J5uKwlRhU+DPg1NhFzX/6CwMz7H0O5zyWP+CNj9mECeCcCZWVW6d/WU092Ppe2qVvSzX
         AX/g==
X-Gm-Message-State: AOJu0YxIwm7I279t7HyNZRnkeKCjkuoUyFZfrbhAi4nqT47/4mzAr4jk
	A5CGyNFCHhMgH9ErBU3AXcQaVl7XcGURbpRMiEsbYppl861hFJ11E+GPeKZK5O78vO0scpLa8VW
	Kl/JqvVHhAil551xj2+kHlTewBIWWP34qqBFWuY7GJMIw+1tw8PHUQi3nwePjGLB3juGg
X-Gm-Gg: AR+sD10jtHIYnYbQNyCRAgdpcbiJMJqSgj8aK9GGuvQ4J4zDfWUW2QboWaJ0HUQrllr
	Ktd3kA603xvOakS2OnhMlyCTtZj6u6BXia/nyyRwX0TngykIMjFlPLCA/10OSEIZJzs56ZGYBBw
	gzeKsT1AKKHcWT1+L/ZS0oWmu491qQ2nSdJLW7FKm5JxnH2w///y6SYZbD76FgloHBlHApjzEtf
	f8qr8kQyO4Js1+xvdiIypzD67L15R9g8ORHupQWiZRJPyEcB5qZS52+yvSK8NfB6m/JXy14Z48O
	qCd4os+Lwvqw9FSEjla7LbPoYADWAbw6baet9TM7OOffo4bNnr6jSmiJu9cUfyRHp8Y3f9AYoZT
	pKWBuzKkjhMGo1BLjC6DGmfUslJ3eTpXUeCZ3E5bStYW7JjqjeZcVc9JcFnMpYq/18qqa6A==
X-Received: by 2002:a05:6a00:4648:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84fde2363b3mr32808349b3a.16.1787043941898;
        Tue, 18 Aug 2026 02:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4648:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84fde2363b3mr32808196b3a.16.1787043941370;
        Tue, 18 Aug 2026 02:05:41 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b404f349sm1514442b3a.24.2026.08.18.02.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:05:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:35:26 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on
 primary controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFYghGoC/y2N2QqDMBBFf0Xy3EgSl1gppf9RRKIda9q6ZYy0i
 P/euMAwcOHce2aCYDQgSb2ZGJg06q51gZ88UtaqfQLVD5eJYCJmCRe0b0Iuonz89VDmO4JUSHa
 Oo4IFYRITV+0NVPq7zd6zPaMtXlCO69ZBGBis8407RhpAVJsv9S6HjlOLBcVav42ik1yPURkFc
 BZJFUgFtw7RH6z6lF3T+O5dSbYsf+4px8PWAAAA
X-Change-ID: 20260812-pm4125_typec_changes-270965b03486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787043937; l=4140;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=lhWUtyxtSb9+AzL65uMEepXGAnX5bvba2sh50dD2gk0=;
 b=IQ/PJ4Bx++/kGaMZ+T/tXKhSzsw2z/oVUgqI/DaVcE+Ly7BEa1ZaMfE0RDOwCcvfumQn+4vtV
 MM5qct4DVPpA8rgEAWjpSn+okRSpJIckVC9rIpwcYzRMSb8GOal2nMR
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfXzZTFo2rum//O
 eQujR1/nh91YL88/UxpHrENYaiTy+eVdXSWbHIKZBneFrRLSmWcO3w5QUMa9drHGXH4XUfjPVQn
 klIAbYYKe9nautBqdUGS85aWWTtfFtKALplXgC73CUw6d3jkRgCJM3pXT4uLEKWO09E+aEYwS4W
 YB3xXh1Uw9OsPTjf9zMsnD0v+nSCJoJi7V/2XIPben/en25H7td0PaDOB55VQ+WL08F92KnrBij
 TOhxnYgjqOuHTL2DDgdzJLys4YvIWR26bB0KKC19KglV/NkjtMOOzmAB9NN1+r15t1Uw++C/e1S
 PnnhqC9xisgnvgb48uSCuuoyLUYVv5atls9dJrBjPBjrdgYewXjlqhZe4N0i7KuI3q0CO7KfHXx
 qU813Gq3t0/GsSbBrWZzbcbYrKd7q6xOBaqgg9XgsNJkH/Z/ybpScacp3S5RyJIV/zQGNIbHoyA
 UhB5S5QdDMd+zsguhuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX77Fp6bQzDDK6
 WYKuOYRYFQkG8tJ/05FzGayYfg4asLSALCN8rh3dw3D6iku5zO1yBSYrvpj9j4nW1+UCMXKTzSi
 UQA8p6IpX2UQxXBUze7Qi17/3qpzY+s=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a842066 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FuVrwu6O1lqxZhQAOtgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9J_H8n5g_MIc0WXlI8qYg5LnKCG05W0M
X-Proofpoint-GUID: 9J_H8n5g_MIc0WXlI8qYg5LnKCG05W0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On Shikra CQS/CQM platforms, usb role switching and Type-C orientation
switching for primary usb controller is handled by PM4125. Enable the
PM4125 Typec node and add remote endpoints appropriately.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This series has been rebased on top of (acked series):
https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 20 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 20 ++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 3866ab8b0faa..286ea46d0c36 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -58,6 +66,14 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -73,6 +89,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..7c4be6294162 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -89,6 +89,47 @@ &pm8005_regulators {
 	status = "disabled";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 34568f1c7b63..01400612d147 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -58,6 +66,14 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -73,6 +89,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;

---
base-commit: 72d06ed137fd7c3a6628577ff4c3bebc7932937e
change-id: 20260812-pm4125_typec_changes-270965b03486
prerequisite-message-id: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
prerequisite-patch-id: c6f8b2af575482db2b63bb1050f52b21a7879e0e
prerequisite-patch-id: b9197f0bff253726d4d5a1d4e0a5e1f193265e6b

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

