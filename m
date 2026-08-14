Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA73C10A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717362; cv=none; b=LZ9PKY7doW+U3nUtdtq0KcnbQF6IdvenScCG7n48XDyuHGt72SiV4cmEsGOIuc5Rrbsv6eEruy8k1J+s0VVc9c9qYGVH8g+sFya9YYsOb+fqmcasfGAQS0J9zpaF5441Q/58gfu/sZIIOopAaGBAO7QydtSYnbfellY5aG7ERyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717362; c=relaxed/simple;
	bh=5v6E1c1bpUjv6tsevr8SUqv4GilTVaBJ1UqgDQojZPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=toN+t3oIzNylsmG3jdxFWgwswYZCVhrjZJEE0T35VOqwuY6UJR9YKriyAPkYm56zEYhbG//fp2nvEZWrZFCw+vgA3HWLlPn6ivTbP0+P2t2UiBWyXCwwA87dn4ufIaN7EblhZu7cApqZpht0cdQDrqAUek+4vzG8393juNAFciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYfm/5TC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IU4D9LF1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYfm/5TC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IU4D9LF1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDx6VT1907100
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBkqtOsAJvOsFOMYqdz9keOMghTLdXhNWXLS0vjntog=; b=oYfm/5TChw+Dmdkb
	17//r+GqHg1Joc/FTAevJW9FB+0P2hfE254+YuXrdtQhHWcV+uZRJ8ZU3M6jwmvz
	fTPEdnTsC3OVO7yS34PZswi/af+C6fIHIaAXdgbicaL0tMtr5bVBTH4ZLudumVWe
	Hh4oEvVeo4BW8+vs9pUxEg9Wlq9X9QnNqC+xkMcDf0cYK2n99kLWAxUk2W2e/njU
	7elhd1iG1jlHcDuAxpxdBmu+Uxm+cuP/68e1fS+1oxBBwI9/7DDWtfG+a8rkNeDF
	sLEFKbfynfv9gq8nE8qAxlT3fG6JD4GdqA9Rk6wHsAScsUaKi+vPwowpyitrTpDb
	X2uOuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexhqs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1926761a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786717348; x=1787322148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBkqtOsAJvOsFOMYqdz9keOMghTLdXhNWXLS0vjntog=;
        b=IU4D9LF1e0ekJ4cQvMP7uncX/WIt+CTS586CvM1iEMYFaktKKgoZWmvY9PpA9nGOf3
         rkzE3Bf+P7Fdu0nwV8Uyu9Wb07Bje4ppsdZ0yxoecE0uc4CEnYp5uI73JUpEFu9HNbOc
         Ka7tvct9CSGZVja7VeCP74tMxAP+VKMivMdFhuUcJrGJeXNETioI673UILWOb8wbGC+z
         mJ1WtiyDk7cJJr7vdOak5gge0bYHIthl0UR3rUoJQVw0ve7e4xo4rnEmFMHC5uzyAm20
         kiLNKGZgOL4W7PtCtz/uW2q5fTI7mDTZFzmZbq42Dt45ptcibGIBgxOVIb2d8rk9hMUL
         hj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717348; x=1787322148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBkqtOsAJvOsFOMYqdz9keOMghTLdXhNWXLS0vjntog=;
        b=CiSm0eCdoBe5luiGU6cvAZbNf/jyu3i9xrQeW9nFztvtwin4hD8ZPNgu3uwnekBLP/
         EpmQ0CWr+EbyXkeUWmL9UpufnKZZxoGyBdkQs2OlXROD1flMDHBNVnc+/CJqXs8hg5bp
         3UQ/xTiPI3HXXv3TqnPJGtNUFrEuv+kWM9lB57qiIxVXXxkj9KqjYIKYLjyH5rneHkEu
         vFxMH4AMNDuPmHz5VEbQkLAhjg1H63TBQ+vPyRXIAG6YFsE7aMENU9VcUx96pzRfkS+N
         vHitrdL4zUY34167O4gzzvNtzgK+WWzSwjlxXBSjaEFGB3yYgE8XaYP+iix9/b1LnklI
         JFqQ==
X-Gm-Message-State: AOJu0YzTJEypD700/MfVNrJCFkFbTHjYagdb1yzV1JD/aG5RyIP7nN/s
	Hl8mOFGYYFCjAziw3f8xlZ7mn7+zKFaGgmT5jaOw66Eou0cz45B6LhT2GeA/+z41xgYZpbw5s0W
	bN9cwWbHJbneFOyHbx8BSlzDc8fTEMdW927AnuQUNRKAvdeLq2dUccqJpRBmEDCWOFJ1T
X-Gm-Gg: AR+sD125QzoYDBEGFqVI4QFFOaBl98yw5SDh2S6BMq4qG9ZKAKMvu94bPGgKjA6rn1i
	vry+g0EcZnaoTnIC5bmPBxZ0JHFXWjnqGcFka2JduqQNwUVuMIw+GHUlpMF9LIn9IomfEgQVgt2
	f1GdSFRaIfims3aHSEOouS/bxHlIwsP50wNNphOZEEC5RhcwQMFrSzRpv1swHkrOgUFrJKPKg0W
	kO1PA0WjqkXFHr84F9QI7D6q6RwiYcF/dlNy2cy8Zr47DIS3LUWn2JvDTCKbH7wKilvwyx6jVkt
	RA1E4gQPhOhsUOFfNNKypz60vLSdcQVGZ53jNGhA7sp+PLD7CVAPM49Xxa25HXMw82rUAGo1mYF
	2+5f5nBr/oCTOhGYgiV3g3Nb8QaaEK3D6W+wlnl9SQII=
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr7099624a91.17.1786717348357;
        Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr7099502a91.17.1786717347742;
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4895520eec.31.2026.08.14.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 07:22:25 -0700
Subject: [PATCH v2 1/2] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5018_mdio_pinctrl-v2-1-ff90d6605d61@oss.qualcomm.com>
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786717346; l=1659;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5v6E1c1bpUjv6tsevr8SUqv4GilTVaBJ1UqgDQojZPc=;
 b=NTIDu3PxGlGclXFeGGp7FDU3jfos6GzWmtenh6zWKUtPSaGXshaA0f+ULMLGWGq2lqBhTr9ce
 1C8pJP5YKfBB75sV3fsc9ebv+JVgInKsL4Hpnhtigm34A4moTcXz/Ud
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX0B09OAVNpkYh
 GS0mBegsQKsJqZTKzP1kWE6QnDS4bm60ZJOG8cIfe7km2th6mrgjEp+nhkJj7ygdsmHxwM92tD5
 FZ2DI8SpHLuc1xXoWcyzcT/Z1Gls32Y=
X-Proofpoint-GUID: RwJUxInOkddTxFL1Dumv6UzuhHBVGqKn
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7f24a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=etYmfIWrwypQtZQWCWAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX6QX9sURC/Fwz
 CE85v/yWQA0CkXZTl92l8mu0Axqocd7SDrsgdjlQa2x7RMNTNThTEUpajh1siRMm5tE54ri74h+
 5zYovBBVxuLUB0wOvV+Vp2jeptpxYcm6w7Z8yEiRZWCQsq/BhaxAQdntGFM1WdSeuK43N85jooh
 Fsg1/ZE8Z39/mMyoKj0K35lAK5qGk1YPfMYEmZ7Ca543pSg5Do4DksZqm5lIeqjigAkYtR71IJl
 CTGySrTd2bpdDlWfo2EG4zs9UoB2lvGPMf6G2o6cNo+5egtF3L5m+1EBcFZcos2o2Z4Nr4wA9QF
 LuEs5/nPuRWPfi72W54KTXzE2zd6h22g5wJwahSuWIQ1M0l00s8hri8rwGoQ8C1A+ebYl9Q8vue
 rQlsSqdeFTYnIL+m9lr6iEjt128C3YPlN+s+cqjwGuIP4LFpF2ZGnF26B+jNp2wplNTNtF+wQqS
 svI3b7duvnJlT5NXdww==
X-Proofpoint-ORIG-GUID: RwJUxInOkddTxFL1Dumv6UzuhHBVGqKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140109

The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
TLMM pinctrl; without this the pins are left in their default state and
the bus does not function on boards that enable it.

The MDIO pin configuration is identical across all IPQ5018 RDP boards,
so add it to the shared SoC dtsi.

Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
8mA drive strength and pull-up, and reference it from the mdio1 node
via pinctrl-0/pinctrl-names.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..cb3e1202b582 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -241,6 +241,8 @@ mdio1: mdio@90000 {
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-0 = <&mdio_pins>;
+			pinctrl-names = "default";
 
 			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
@@ -421,6 +423,22 @@ tlmm: pinctrl@1000000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			mdio_pins: mdio-state {
+				mdc-pins {
+					pins = "gpio36";
+					function = "mdc";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				mdio-pins {
+					pins = "gpio37";
+					function = "mdio";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
 			uart1_pins: uart1-state {
 				pins = "gpio31", "gpio32", "gpio33", "gpio34";
 				function = "blsp1_uart1";

-- 
2.43.0

