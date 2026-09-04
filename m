Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7D4FDE64
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536577; cv=none; b=hYIgbXQl2u/i0DHULCggI1N2GWCTXF6onWjhrlO8EMw+ediLU+4QWgnhfWCbj0HzFyXaNZ0ryvyvssdxJx6BRoNpqBxPLtt6YqRiiITSkbHXqrZWXaVJGPdxG50eiEfv0zu12AO0CdfEXhRzehpuHXZy2oXMFznl82zZUPhHasU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536577; c=relaxed/simple;
	bh=i8r9ZnGm7UzMiQFW/7A3fSPuq52yoy955ncVpzmNaO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8/zO+WxKgplxn5Apwj3Q/633gba8sIjr/bYGWr0KOA7+q+PARByxuGipdO52dmftVJ54Qzvm9OhpYQGmkdjS2UwPZtG4BLB276YomxRNYr7bTOFDf0ruSGUFeKC9fTHAV2X9gxwaUMLC2SiOMDKTslsvDdNx1++aNLJJKsk66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THofIXlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jt/JwmTS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THofIXlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jt/JwmTS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiIFn3874130
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 15:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KamRqdSZl64fR7Veb4ozRWlQeNymX8Nh+XyeNQ1IdNI=; b=THofIXlbr4V55jOn
	Mu2NH13rB70VlQkKRxl1826j5h61trEXAGB6wPHU/hXllqH6PNW4Ax8nu6bm9Xsg
	4AM5SFFges3J2cn1vyvfJefGyVIIaKAZ55XJWr5OUnFPAbT/QBsGsyy9bZDNQ0YC
	4BzTIDFkYGKcnElrzhw0IphkqqhpOx62c8a41QbTiHrRcBJTTulxOrv58nfpbndJ
	6+pzBFiG56MNq2btKw7pDJooE8ocaUDwFO2v8nsWsi7rwZs0swY7WQ0VQMDHXJyn
	IhE88evhP2kJ+lOlNR17MH/ArzsFmNU/T3GFlGemtXs4J0Uvt5X8Ny4FyTv95/+x
	ISsuwA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00yg9a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 15:42:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so881609241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536563; x=1789141363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KamRqdSZl64fR7Veb4ozRWlQeNymX8Nh+XyeNQ1IdNI=;
        b=Jt/JwmTSGXmVl6wYqeLLxfW2ZD7oAyBx6BE7/143oCSTsrMS5p9VaW3b2OH5nOGqEp
         6q46JPNMacL3hlU/264RFWz90ma7lPFYlTXLh58QowgVvYq8xNiVqYAIGE6trj0MDbBn
         tQlwAfNkQmoFLulL4UlgChcN2mnCcFGvomARQwPssYzox4zro4sQ1LFfkE/kAxVENsqk
         CkCsQZIHnHbeQLdUnc8MGE5ArYh6e5XEFfwYxH8gyZzIE7KvfDAQFeTlxBT4B6MUVKTL
         Hw1H4JgTo250YPH1XtUrFPN6aQgmAPho51/4HBB+KsAFEpx3b0yFjFOh0LwoTBeuZ2wo
         5tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536563; x=1789141363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KamRqdSZl64fR7Veb4ozRWlQeNymX8Nh+XyeNQ1IdNI=;
        b=SkpV5IPa/GbYzv4Hv3c2kyVUP69rRlMum3WusDhpFe9tXgXTFNwhHEwBtx76I+0KaX
         cja9/7c/jCsKIyQBAbqI/eTr7kLwH9qkxS1f5cEZzJfI14okdhpHXzEmncG8JRJHq9UP
         7/07nQvfgPOnoOFnX60ccDFMq7HJISJRZ5dbOeiRib1NB6GeUbt3bkFiXpw/2kp5qz7T
         gwJYL+avptOLvIJJ//pLlsdUjJ7S4ab2h7Sr8H1ZLcPat5erUwNjcrxy/vCJj4g42yEt
         uyPORFk4mBljHu4W8TDYf5tQNlP3FKvCUmyP3gJyCdP379h8YahyafEBJ7hpMrgjhNg9
         +EaA==
X-Forwarded-Encrypted: i=1; AKwUvBygs3+3cSDIMhVpjBtVwn1cWGlM8D1k0Ob5zvcAPWxUDltz6IpjyezIw1T8gu3IJSUS8Rp0otXpmnC577+J@vger.kernel.org
X-Gm-Message-State: AFuF++kUButEU3mz65+ek6vSTEj9DXfrw9IlYtTmI8kiGo854rnWAXtI
	Ldyx1LwqRzm4tP7k97MF4S05Fmk7f6Bta5SohxqktsdI9wb9FNaTxvFUTwTeYUhpe9EF6vROHJ/
	iJX0ySZvlTWeII+YDkhUvz6xUgExKqlJpKOV5z4hrqLf2kbcdc+Uz2qtumQHYOxlOie6f
X-Gm-Gg: AYBFou3vZhC566KGCOvtW1lXucLIvoCiUu/jSPzUcyk6BtAHQMXQE3K6KJaQKkYmNNF
	h+IdyKKfAVCp9zpTmoxJlbYaDc5sOxgNlYdVBMlNr4i/rHETOy/ALkDMFXUNiasme3i2v38brbM
	W92uG1JeDb6zXE3szH/6l6pREt84a4FlX7VwIpLYAZIVEK1lkB6u8+DCDAWQfmTQQ66aG4xi9FS
	ow7Dbig8JCOzLujVWki52rYovVKbOeChkrIb+mmT9FgNFspozBxpxq72BRUS+0R8KO2g+GA6olT
	ITQTN0nBLknHb6/hwY1017199Q1jOc7NPWqznrbv/zwIkr9dvQOrCekRGcnMah5OL7NKrhkyozj
	nK7txwBzwJzMH1DgkU/B5nEll9bPpm5uL9FP14o6X8ciiEpwFUJDpAF1MEwg8HN1FIblPZlVrg4
	OLR4z4qssFtGCWJfkqH9eKCUN5xdZwCZPN61o7FAU1qxFCyQrmzl8=
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr2523634137.4.1788536562890;
        Fri, 04 Sep 2026 08:42:42 -0700 (PDT)
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr2523620137.4.1788536562532;
        Fri, 04 Sep 2026 08:42:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:26 +0200
Subject: [PATCH v6 11/11] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-11-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 6Sogfck5hd5FhLjA6Cej5xIAiHkzzhGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX79N34/pzAgnP
 RTbBKL+QKwRjFnkX9YlDOW/LJQJyUi6L8BxDVZ34osqMlVX2c0fa2ed+Yrh63d8X/QseYh0gxL3
 Mn0QWgrH/zx+Jkgof8oDuc4dJTZ+SkvgLpmhCj+0EyLcecx4IFAKRJHoR9DVGs2+JPSqRu03x1H
 TcW0A4lDv+tTruo5TGkqX0sLGipg7H/FMAZR9Z4hqAq8lwe+p8YadVbfzS+liPdcgV/DPl/U3fW
 Tx23onGzwosIVXfjxEgC7hQhPRFpGXylgidtRcDeO0p4pfO6bfVACqGjF/Idx2n9Glt4FlC8S8c
 vjf6TqVeoG3ycMKZWpmWMqGXDb4H7Ddcd2vTgcTOEMSSW1rr3I8KW8ZZ+5scnhqQg7Pgjqj82yE
 j6Ox3jhjHfDNsaTs92lrYNNYfHJiNYn+k22OaT+Ffd6VUY88iNagIOIneSGA9GCROMIYXG33iV3
 wAT25gBHvDlGR4V9Qqw==
X-Proofpoint-ORIG-GUID: 6Sogfck5hd5FhLjA6Cej5xIAiHkzzhGu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX3EayCLWBkz+0
 w+wsMOFdVoh2szpp4JGyFifZR0U/EfoG9B+DXY0RfAiVhEVc2BYS214C8qNFNe0wcW2/Hpz2bpK
 8gdRyQwCpFeP5ATLCGJU5zsJecHm5Iw=
X-Authority-Analysis: v=2.4 cv=eZcNubEH c=1 sm=1 tr=0 ts=6a9ae6f3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040143

Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
Arduino VENTUNO Q board. The module is interfaced via LGA and is
compatible with the M.2 Key E.

Add wireless-lga-connector node using pcie-m2-e-connector binding,
connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
the Bluetooth interface.

Add pcie@1,0 downstream port node with pciclass,0604 compatible so
the pci-pwrctrl driver can acquire the power sequencer and enable
the M.2 slot before PCIe enumeration.

Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
(gpio56/gpio55) used by the power sequencer.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 299d0da15a1501a03e56025f928eb456e4e2a7f7..afa6f0ecbf60210055ae17d756091523b91dc98c 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -169,6 +169,40 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wireless-lga-connector {
+		compatible = "qcom,pcie-m2-1418-lga-connector",
+			     "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vdc_3v3>;
+		vpcie1v8-supply = <&vdc_1v8>;
+		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&nfa725b_default_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* WiFi/PCIe */
+			port@0 {
+				reg = <0>;
+
+				lga_pcie_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* Bluetooth/UART */
+			port@3 {
+				reg = <3>;
+
+				lga_uart_ep: endpoint {
+					remote-endpoint = <&uart10_ep>;
+				};
+			};
+		};
+	};
 };
 
 &cci1 {
@@ -429,6 +463,22 @@ pcie@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pcie@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			compatible = "pciclass,0604";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x020800 0x00 0x00 0x00 0x00>;
+
+			port {
+				pcie_ep: endpoint {
+					remote-endpoint = <&lga_pcie_ep>;
+				};
+			};
+		};
+
 		pcie@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -523,6 +573,12 @@ max98091_default: max98091-default-state {
 		bias-pull-up;
 	};
 
+	nfa725b_default_state: nfa725b-default-state {
+		pins = "gpio55", "gpio56";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		wake-pins {
 			pins = "gpio21";
@@ -566,10 +622,10 @@ &uart7 {
 &uart10 {
 	status = "okay";
 
-	bluetooth: bluetooth {
-		compatible = "qcom,qca2066-bt";
-		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
-		clocks = <&sleep_clk>;
+	port {
+		uart10_ep: endpoint {
+			remote-endpoint = <&lga_uart_ep>;
+		};
 	};
 };
 

-- 
2.34.1

