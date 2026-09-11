Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1763E8338
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106878; cv=none; b=TMH2VfgsLbBZblVaqiHdxuElEOCP/QbKGm6zS8sU/Il1DwhT677vDcayMIyXua+aAAveWkIx2W9Hv0LD7G6xxSqRYpCdTTt1gXeTEghZ0p3iduynBOvzoSkC+SNxM9WlqKEj/qBeEzY3/fwnneIBA4jB0zD/YdlOVDv/uhhYTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106878; c=relaxed/simple;
	bh=Cd3mY4lw6O9CiLPwQeOysjmDupIzdSheTF0aAisYNPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDZn8Wq2EQGF+f/jxItNECBvfrV0PpT6vD8R3v3MGQ75BerV8Qhx6QEhg5zA97k8BJ/IwzHQXlX7/57hRvgQ5yN3D4Hm2+5AxKgiquE6NNVejdOfwSgWGyq+vfHe9Y8YsrTPAwb7hCF37BzoG7gv3iKsL7zJ8HW14EzKR1fsUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdQ2N6kI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeHhdzOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdQ2N6kI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeHhdzOq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vQSS2986637
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yePI5KGQotMqq3u/jk5fb2td3xJ9uYISnnlPzF0G0sQ=; b=cdQ2N6kIF14wUYsQ
	oBAFowzdJM2T3zOxUez7GDYxXR9RB+DA3zOVNqpj0jF49kfQBFbd/Z+ebX/NXvaE
	wvjamZwLmAcyiImjY2yt7oRyF2qHY/GMdzqo0lyOew7WCrdAgg274t03rmz38GUW
	ntUCo93WUKu7bxxVoFGAipR8pEb4wQGqCZP94ANZg6skc4Pgbfr0jDdW0WUR+sV9
	3UuH3iBvYiv/Ejvt1U+jlOhFU/4zkOFf9VJywTYWP9ar0BwMgqHwhkr9MkVNZRaJ
	T7XeFXZIVP/n+pVk7fKYKoK4/Yem8si4nycIOEvN60kzvsE+XEZ+t9uTNoA/XxPK
	MQS+mg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2a9km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:07:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so862857a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789106874; x=1789711674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yePI5KGQotMqq3u/jk5fb2td3xJ9uYISnnlPzF0G0sQ=;
        b=NeHhdzOqW5Cu1cZbv7omzSTQ1qbpvEnFaXr4rdcAjhsZOcfk1NZLYgNl/jEIOvzmhZ
         oWceTyIrBgTkf9mv5qWSZh2IZTQUoGpFEC4OUp37SpN3UpI/W7I/e0Y9Qfa5jFHF+/ny
         n1ctQoOqrxw+RV3V6/oEfbnC18oQ/YjMylTVQjX2ybB/EMTDEWcw57DDwKhKjcpi7QfP
         RXWztfydu0excRv8Ju4SEjzsmweXbLoIZ5viHfkd3SWKjIlf2eGUAjeK82H6M5VHpgAj
         KeJgSNyPjMIt+r7WjFuzic8gLm73L03H0izaR1GYIqkvYWC/Rn8jmeCYIcVFav+HRI1b
         agRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106874; x=1789711674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yePI5KGQotMqq3u/jk5fb2td3xJ9uYISnnlPzF0G0sQ=;
        b=o3PXQq/ZrU8DRjqy9/9wBSM8NlO4aX39rVLvy2xvmRnARfyZRFu0W3KxyXF94E0bzn
         eV4QjQHUnIazQpZKaAyXo/k/pJXFPTesVG978crQXdZCnEwYPSsDzWai/vBGIaK5To7H
         PAjXPkjz3BwquZiiq35d7s2WPciBG0f0Q/9e8nJ2Dg7xYC4YTG7xsFDdQtnPAp15fNer
         zMKS8xya9euTLRooEuN0CghRx4BQ51KfXNDkPYQcTPOZYSlbybIk4iZOQC4w3TcpOvFO
         kh66J14EaaUC1fhnG9u7KcUeyj6JxPnKqeGoCn06+J5FB9QvrDrNR9NiOPsm5UbDIO/Z
         CoxQ==
X-Gm-Message-State: AFuF++kWCM6zMbzDNgPE2n/QfP3e/N+EKfRiX62DyqnN2mJ3SXeuLhcR
	BmmMdcbVbIraDtYdlEzlR+geW17TLZ3dua2JiTUg9EjXLy40NcaKIRdfRGyR3HATNizPjmza60j
	HFxEcaWlVX2DNxoIpJFvKBN4Sz1a5BECYlCMrgpoggmPuYFv08oaSbUN4fIhi6y33FQRo
X-Gm-Gg: AYBFou0V+8hgNXuGCtR/i85NLji1ZKot/lkeLzdlRM/rLPUmydiz580ouGCN0fiCswQ
	B9FzP049jufMCKAyg+2rT8EFwxFxXro6jHG8lekXzhsaMYY7/yvXVe3+6yXRYbUAEPbWWwlTmWM
	li2kttkw5PpWwRi5NmniiPPzsNpiswThyJu9c0FuNrFBgpZXLkCpL25CAFtcREbg+tYkaPg0kjc
	ABNdA8fmntD3dWHkJPinBepODeyuM93a+OFZLrJweo//DslFvghHdJrqMjhPk49aV9EdH9fRjgR
	/LTgpBa+PdOw11gcJiBp+fVcQYMDkD7nMdcQcMh2MDowDdeJy3Scya8AXYZ2bM898E/1cNQ1Xl6
	2DM5MN0SMC5sIoME=
X-Received: by 2002:a17:90b:35cf:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39d9c2114a0mr4364285a91.13.1789106873775;
        Thu, 10 Sep 2026 23:07:53 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39d9c2114a0mr4364215a91.13.1789106873257;
        Thu, 10 Sep 2026 23:07:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2989933eec.30.2026.09.10.23.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:07:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:37:20 +0530
Subject: [PATCH v8 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
In-Reply-To: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789106853; l=5483;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IADNJGu05uB5Yv3hUj9tBA9g+5avzypFsPKYMeiw32s=;
 b=G1rszEnMIndUp4/CXfGvoZvcoCN5IcTKDF0Pxq8X8FgtnlKUcFC9xkr1rySkJ/OEaK/Dwcw9f
 DQW+R+QBrniDGlxiwcnJIvYGcJS72vx3qFCkx5aQyqr/Fe4vsZSOvm4
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa39aba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rgYtWjQHuMCZsFrwjbgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Nut8E2UzClFC37sAZUqB-ET7NcL5dB-5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX3hllLx69lF/k
 TTVz+R/pJZqK1KPC92sMrk6K0Cx9CEOXuHiKd5BLPBblFoQgCG4QIncHuz3AMmvdRrMQeje1LKT
 7a5NBW21lQz4wtRe2QP6AkiZq0GKpd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX+vox3UzO5C0i
 hujF9uJ+TggUymTTjJsQH6tew+ZEmwLB1XhC/6npLdEFbII1Ti1HvXyZClzh4BbvR6AEszaM2ZN
 i7DtsxmKahEkP+q/LJXTzE7x4lr3iliVTMWg/TPfYNCWydjKagyEqJDME/Cy+deipI/YwRt/07q
 HS/DR4pvvmdz5CSwA7YA7ZOkSJmownNkE4TtqHCnTcSPK3hZkOuavk7lKW3RkeLVh6KeWb70Uj4
 K1cpB3LTSdeok0InWFRVbOZxUCmWsOIMM3kHPjRBzttcoz7YTSUUpFCdhkuPa1H7fD3ixQn+wAf
 b3wFKRKQETLdV9Kc12v72qkjsKZECbSf9d/+zeJn8/++w1wfXsTtWWheW9YXWofN/Zoe58B8Dux
 omdWRQwoCHT6vGNLUU/LXpG2AYxw0XT1WC8p5iVWfU+zHARixT8AFWWq5FIaIkOSGowv9304tUi
 4/V8h4/UQjN/cwlyc0A==
X-Proofpoint-ORIG-GUID: Nut8E2UzClFC37sAZUqB-ET7NcL5dB-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110083

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable USB controller nodes across Shikra platform device trees and add
primary Type-C controller wiring for CQM/CQS variants.

- Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
  and shikra-iqs-evk
- Add Type-C support on the primary controller for CQM/CQS boards,
  including role-switch and connector integration

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
 5 files changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..286ea46d0c36 100644
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
 
@@ -57,3 +65,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index fde7fc035bf5..541ba278bb2e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -85,6 +85,47 @@ &pm4125_resin {
 	status = "okay";
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
 &pm8005_regulators {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..01400612d147 100644
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
 
@@ -57,3 +65,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b9452d9e93f..7cdbd257e9c9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -20,3 +20,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..543d769125ef 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

