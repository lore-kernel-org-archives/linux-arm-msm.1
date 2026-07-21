Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8E3B71D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609869; cv=none; b=SP/rLSwrpNqYvEzi6OLPPzYLeTv8+FvPmP0WgRws0EHnG5ZnoemDafn25jONLatWCoRmUgvKsLwhBvCpUw7WxsxHWZ3I2cOkMSVoFnPCYRoBgazU+kRLje0LXhargQgUfH/CVrqaSlv2lCCFQjpJnyIUhlaand6keaps28GImJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609869; c=relaxed/simple;
	bh=IteoMfGjbeqEJGrWmwtqWMVhnwfUXO2qdRB5FGs48O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StoUA9ytTVhRpECHthgcjzaKTgpkqoUrLERWIKAOGc2QgqMEKyenJtqxPuKT3SYomnCTsTrLr6A0pVWgYplRq9bEIlL5EalZSUEKkF3cscbFk2jyBufyXfeV2A9JlS2k8c85EW2qRn5Fkz0fYpZK1MuBEoSqcxh2jVjBLCKYrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYsL7LCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0QIuPp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYsL7LCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0QIuPp6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCquO3978349
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPw6DyYFy7X0/NpUd4qPJ3Lfh/rFDYfjwyxK57Y9PHc=; b=TYsL7LCgLDbRXlNn
	isE5bB94o9DUZ47r31PvHQbokfDqJJqmGKStOuXIT8ex50dU3HnEHGV8XmJ9Zwdi
	PILCQcYqzBW/DzLFfrDE8ssn+SZ+IM2mtF24fJyiVrCa2LK0SWOlE1MESNPAfXW8
	xTUV7ssMCO4kft8bH6HGKVieKlg+bbKubW9qZ3VgIy3R5MPrJRzRM0+p9+iIZOWh
	HgybCrd5iQlV9EDEH+L23p5C8L71hZKIWfbBmZ7c6wlC5VTUz/T+EMcG38Imk0JG
	e+6qxedzrUiCoUY0rQTqq/xaHsUX9FC8HNHNsmGAb9DY0b+hvyS5ERzX6jBSCk4e
	3yaWFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv42dt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so191562865ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609866; x=1785214666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPw6DyYFy7X0/NpUd4qPJ3Lfh/rFDYfjwyxK57Y9PHc=;
        b=B0QIuPp6vUIWSKcLomFkYz+6WUjgo0t5JmEIArDrMWybilvPKmXEJZW7euONn9I1vA
         zaqDElEdPEwuYAN8uf0C1x1Fo6ikzZU1FGHoOCnAp+4So8I4VbfVMSFJa0OKag/CRMBD
         7jT/Q+0TBqPAI9/LZPoMGwiUcO419yPAwJ24XIlRUMGLR3MTNHCOENXGoR/ikl65x2xu
         +6fVHbF67HaFsQRtlRWRlYptSQJH/wS8YwLjfZkfTTjE9YTkh4WGEbkO+i5tJ0+xGZcX
         jjALJALV0xw6OrautscpKEF36d7QwiXTnaVWiaL+r2OgrUllJnVQ8bo08OJUe0UDtQ9o
         +sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609866; x=1785214666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPw6DyYFy7X0/NpUd4qPJ3Lfh/rFDYfjwyxK57Y9PHc=;
        b=gSqFXEJ844t0RNJR73nPw2+oAD3oaXc+OKkzq+HAMIK4yQPaH6NhOr2wNibid0U62C
         n939FN/N1unBZRa4GT+qHbnm0JHC8lsVrTSrFwMpPvICWumzSneC5GwMOVmHUi5prirw
         MQEIcbLhGDxwYHezUBTfVxsy8oe9ku3LUfELr3jB3v1FrpMlHhy7oot7d/wZXJ30lH/u
         1RWbnC30YWGG6TglIdjdbrADPi69Ps2SrrbpzKip0b1DQ8ucdC2sgBCtRqPuo9Y2rSAY
         vuzldjKfzVmxZr92/Yy5RS8U6pzuNyhq9XkKlTKr9EJ8TGYMWRLm0KXhYCEpdQxkfHQX
         blnQ==
X-Gm-Message-State: AOJu0YwGIlyPLhwmzqu+7EPcS2MskBb5JO5C0IOh5+wBeIm4VttOPxvz
	Zf28Tr0AIl4N3YxnmV9KC7FW9dTE5J6iNACXIGYBeYPXDq1Ty582ybHHXKMEGS5/RIraTMHxnF9
	CgNBu6/ADCEJjuizc/mChSVyxmQT6KpkxRDfx7deP0RECNksvHtq0p1I72BEOGF0xPe90
X-Gm-Gg: AR+sD13cy1ouFHBEgtkVisYc1pSsIlwEBbPWAJLwCvwI4CGAF8uVugVDYXOYwdjF4mE
	hMRgJE+F53S36+Al2aMBKJlUW+s9jaLdShMkOhIUMRCcK9m6B2oaGHGt61YiULMGJnD5vZI+b3/
	e/8KvLDGdYyNlsWRY78GRCDkqujrndVbgjAMb4fYW8WLXfH3mMvh7ai/Qq4kTbogkktQfXfbL3s
	2j7k5xCpHQum42P8IbpIvb6jZakDRR8FOfAnu4pbaks4kEWHEW31Zz2qRbpzEWvjepgv0Wiagjv
	GggTVg5gmAr0mAUNbhb6xVdwkXAvWYxr8MTTuDjZy9SeSmeNlZ9719jlFsDqpMLLL7u1devWw4C
	ui3QrLa/ezJaC4vCxcfSTZgqAxZFG3hC8HTttxP4lwjiDKWVDkl+o3xo=
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr11107105ad.26.1784609866064;
        Mon, 20 Jul 2026 21:57:46 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr11106885ad.26.1784609865604;
        Mon, 20 Jul 2026 21:57:45 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:44 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:57:35 -0700
Subject: [PATCH v2 2/4] arm64: dts: qcom: kaanapali: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-knp-camera-v2-2-a21c3f0ecd55@oss.qualcomm.com>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: jNhBGxIFWRJEvZgpGXP9tcEF4oGVIT6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXzSbx0w0+j8d9
 RA9rTMp0z2z/RqW3qKRWmpo4l1eJxCCDbsSDWpmxKUkCR+dBM3EznS63raMfdRwPh8gyrgiop8y
 CIaA+86ChrNE91XMa3pKu7rEecA+E5ocWqNGzm6ZhmqqCej1YiueFfCj2QfNKCR5az9e29ocYBx
 X882EPsORO5RCGVQMtYfYsF4iRLJ9FOvPr4LSKww5gjCzE2xIMeXo7Np22SswgD00CBvgJ1rOKI
 aGD5MLJfjWqalenmxPm1RZu9Y0XGBmYeTTLLR4LnfywuBYTlkF0EXfhR3nb4hcalLPZgKoNq6Rj
 KoPyRQlGThYG6vkrm4taibEGAlLAYq/xh8z7uOGYI4wp5qOzzQ8FZFHhhXan7wrEnK96J5O4NcO
 shb+iVhTkh4YDdlSOQQV6ZAFH+mtlpQ4tD7OmPP8QT2EnRKwWRmZuAflk5ybk+TzMcM2YoOn7o6
 SPomNQ6r6ij1vSZ7roA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXyFrgGQOaZpPY
 Z3gV5+3GRhaT/ZDbMjcoeHf9UY6p8e69W1gnK3jgw+vUegTVWfLrkGW2L0JLVL7yssKnCXviAwy
 ge38+0k6m0zqvzyOwnEgdsrH+8kUD+c=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5efc4b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qJXDg8zzmFl7OFIyJIYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jNhBGxIFWRJEvZgpGXP9tcEF4oGVIT6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210048

Qualcomm Kaanapali SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 282 ++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 81246faf45a4..6cc7b32386c4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3698,6 +3698,96 @@ opp-480000000 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;
@@ -4258,6 +4348,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

