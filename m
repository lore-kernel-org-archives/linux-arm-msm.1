Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB493B3C0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879308; cv=none; b=I27T/BRZ36DZJOMdodtxA6IhQjzMgpgwWoxQiz5CjdGvbrGMNo1ugePNT8q8geXtMtYIY9v8yHXBqlhlvhMDrX/CBMwMd4yas5dnRJr02WT7bo0E04xgi044Igq/1r3rIzD/NkHFs2slqcEtpE6kB1flmMIq6T6ZJrp+5XlxBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879308; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjTaH6nmI7Nrk4btdC3NqPOVh+X3zUVhoLJl+sVD2fXodcJ52xlZl8rByP9oFgP2GEUrg8cIGW3Qz9YuxQEQh8GDKTUGTWGntBWJ+71WtUrjD/qh/kYYF66caJmmgvr3X649lT4EIlmbXzeLnQH/LMpNLU3FO6JDGA4ItoXgsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOLvKDSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQgEQSGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOLvKDSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQgEQSGV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4m2BR2099816
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=MOLvKDSJDwCdMF7G
	c/hsWbeURg66kQg48xz8qmW0sIIYhdzQw8QneA0LcJffA2IQJ9J2TFKJSdbkPwss
	wghNg7yL2Z6zZ13uYWLBWMpEfyQFqSrGHWL/024wKdCNb5d7KgzljTmgXvP1lHHk
	+G+a6Ot4yY3yKrK/WpiFGunsNaeoG0VNVUNvQOwvQ8scBKjZ5qcQPfECMitFaAAI
	P/L7m/IWmMmZhV/EO+uM4LmDLcGSX58EjlTVvkcWudm9M3+/NYXO4CTc2QOXPB98
	Xhk6tyK68KhoNtFj3IbcCGz1dx2RPkk4aRiXhEbQtnICGEuH5VqJIhMMXDmsBKsb
	9eyecw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahsw3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso25157351cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879305; x=1785484105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=IQgEQSGVr4nx0SV7Gn0fBEA1PLuVEAX+fGISkpZj/5RmTRWpcJsrSKpM/HQalISCRQ
         aW/RvE4kMoFgemnBHxkL01Ilxg2mKLAgvyqjYq2SU3bKZ6H4GfzB5HSFfg/iCaGfhw9L
         8n/xLIZ7ngzN+OYUc5iAbzvYzGtjMFJu5ZRcjA1vXLk1mOi9zDDnOCFkMX4k98BAUGe9
         Zm7++foOdABjzfAeCqo7XOV3V86w4PGiKg9Fh97AHr1ToyQK8ILkiDZvLzIFUyc/HS1V
         tZK/1NkBWtDE+7LG79k1t7Cg8ZC+eZz76wz4hNAUSixqk+IIJOK3knyu0s5cepOV8fNS
         7gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879305; x=1785484105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=cdec2GQKPscsCBnNTh81lvX9C0TWQxAtKt7i6a5FnJ+UmeSt9LfXKRT07XGI+c4NTq
         nVx4m6yfB/wsqmfFZMezFK6qeXQsZNdSsdpyC603KXj/snPfaQxRAETa1wFuMxtpVtbb
         KfNbEA7N3P5lvrZ6GLvx3AHn6ibuUAgVrfylgASvbUJMTj03tdjAsYm2Ulq2yOM8m5lC
         FkQU6+SEvu8uvZrNdyUCZVgIqTQsX+yG9M2S3ELkBGp34BiHCexG8x0Y4c5TEhNaugQg
         cYpaBcXSggMlgLlBbDDVY5ATbbxj6qIa32XsqltMZoEizN9bkSbZJJdcr5VXIarcCezq
         m5/g==
X-Forwarded-Encrypted: i=1; AHgh+RookgbUkv32zYwqKT9Ec64XsJHbWi9EZQeJzzcWzEW49ENvjkqmX6+UtOQUdoC+VELvzpT+GuLNYanIlzfT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9cXbf1Q32jfCJNebr1XQQzhNSuqwkhFcQHsxwOrA51xr4oWoW
	/7RK7KWCWaMmDEIFRQBK/blZjtPMHGH4QItooOzAE2iV6L5pDA+Xypy1vGv1P+UVmOjoGvraMde
	Qkw1L+Fr9HcwU4J/2gRCVA+Wl6GhE47/EabwEXzbBbS8bd9UgzMeA3ZQthsE3w8YmUmm1jwv81I
	GyXQs=
X-Gm-Gg: AR+sD10pt3GZnbkaz7D5TVFIboDoBMLey/ixcxyiNf8tYu8YRoOjaZwh8Bq6nfGsfoL
	P1tUZZHsIaiZZiwxwXBWU+zVyfw85my5OejcwbDi0EN0CLLGqNB9Wrhq/Lka25HSk6JpCem07+G
	7TgdZcza6Eb4nJmNnWFNukT2HfMPTBV33JyHFmoRxl8DPuhhk3Sybx4D6k1Ugx3pfo3mdUSnLpW
	btGmGfTK/B263bl+ZYX11WA4W5pqlinj+qGbhxqBT+sgWvQoiOE9/kLZ9pTh3Pltp3gaAzUvtk9
	Adv6t02krPIIAODScnmvy7eaxkkSlDs7z9Fo10xYzGgUcf5BqKYWbBHrrqxiIIn240sYtixF3mn
	eBfuh4b8yG4MQy8VSAwFv9zaix+eRK6m1jEyBU6F8ZdBgai3EhJm2edUiYxRtNeC/gSl3jpGtPg
	2Yr3zA6u9ntVUthYhxzWKUQ6jhToQi13zlKF/6nJNykwb39qexVg==
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr55302951cf.25.1784879305118;
        Fri, 24 Jul 2026 00:48:25 -0700 (PDT)
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr55302711cf.25.1784879304551;
        Fri, 24 Jul 2026 00:48:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:18 +0200
Subject: [PATCH v7 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-4-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
In-Reply-To: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX2VOeQoZg2sUk
 D2HbEckF39nfMqQRGfM12KPPBYnIJYWWK1CBKWqmDTieQZM42Dh1g52RH9QGmZssOBBk7IDGmjl
 EuRtsH8Ls9Awy3sF08c36hbE8/UOKJE=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6318c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: V23GKm4EgYkydnW0pi529z_PEcxBRtzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX6b9Cq/jNC+B3
 D+4a2uDXnfXeddX8VyJJAcn5WIO7OgGtuG87vWqW6lylqNnkuJQ2TlrMfY1BZzyE/acefl4ZJOl
 0g/jMdby/9gn5EX9ShkFjkq/Pxi1nRPrqpRJPm65em1YjOr2VL9OInxVp1CMNM3VoHCFEBQiHHB
 jPLyOyucor656GFXxab2jV1QzND+R2LMU8hAHGSZ0sKybSkpqJomuRDGxd/2TDwQJ8QKw+WsbEy
 rIWL95f77JtdoHddneQlYyashIfevYoqoAtj5wvGC9p9ZQz9oCXnmk2WBhB0Jg3UQ0Y9Z2koZQp
 QdJZ9R1aAZf7QBBbMM0XCI/F6U/tGq2yY4f2njQpczctmUwV7nRBHhFCM3ajQ6OtOYMC9AEQxhT
 BMF+wgrpBALPHzrNJhXWneFHKtFzupNK0I/FTThucVirA11dKj6lE2ZjJujDVAXnED5xO+8U6wu
 Wse28shSH9HhpqaNhng==
X-Proofpoint-ORIG-GUID: V23GKm4EgYkydnW0pi529z_PEcxBRtzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..21e32df66667eab2f882731f6ef09b7b6e29e61b 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1

