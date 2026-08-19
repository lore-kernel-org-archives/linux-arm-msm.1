Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E7C3A7F46
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147880; cv=none; b=JygsoC7KXaONjRIqQG1JrXamgzSfj5X37y2oxF45vDesbdoGZpxT/Bfio8uyqdbCiSYjH/oeDKHQZnag+QLmZoiEGObLUAord6YQceZSPTeJq81gjC4+2YEsVTvk7RafQOdrtw9zBnuHqsp2FVWZuqHs3cCSF10aU9H72znfnVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147880; c=relaxed/simple;
	bh=ZZlgteeDBfUzoNrVmG3yeVVsHteSnimmcH/MKcfekAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUw/ZV9vJ/a67310vTjR6ueoPMrjotCiegQqkzxCEc4wxJiaL2OhyC9e2vOKWBR7ycvKk8ZcApljwDrPDvzjLTVn56CFq3HFxCfkJF1SFOuaHjpTFI446WMsTEj+z4dIaOQEjaBpGMTYoBzLudi27Jpory89Cic1qv//9MKBJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5jMAula; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdhoJS41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5jMAula";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdhoJS41"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0Con901366
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGFUGo1tsAWQ+W3hOgvBYRH8yAG/2nwAmt91QOb+53k=; b=j5jMAulaM7WaThI7
	Z9YW3Tmk/qSIS15w2tLJImQfG4u0rltVjc+YW9ehYw5xpwPbwvMBeDz/7RIwn2sM
	oQ0JX39rCedXG0IvZGotkjWqqG/z+ioDug79G2l1DFLIHkm6hr6wydjp71nI6nsv
	u3NXLqUAbh4kVw1GJomyz9GD3Ub0g+bzJJTUiZMwAxxfdUTMtlltzcRAWwNfj/wV
	KeuObb7NXZ1DUNJk6+kzgB6wqmK0yRZsPsbRZFtg+Lmf3QQHjskjJBch2DFiE/r7
	f0g4Hv4zNun5CYg+3tr3Hlm6YwSH7CjwDytJUpjLiJYztbhXpeGKjy4n5E1o3EaD
	XBOARg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpufyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d58262ffbfso2343675ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147876; x=1787752676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGFUGo1tsAWQ+W3hOgvBYRH8yAG/2nwAmt91QOb+53k=;
        b=kdhoJS41EO+RaXjBw+2zKgNIrcJB516eBZ/vo7r9ZYajVcZ+JAxny0qVVRS37hp9HW
         b3yOWOryweUsSWfRoD7oFUgYBFnkewgMVZigiDBeneKvEE7CrTXvuPyXXsL5D+wfCHaX
         lZpW4o7qV/OlCkMGm/2MSkbQF9h7WwEYU3ak0JVs0aYHjqB0lHvNjItFAoz9WC4HlGJZ
         7MmkTED+AspEmlnUMnT654y5LRdD7tx40TVAEYyyefqgQNGxH3xv4ZRD7tYNLDA9MZ4U
         yzADDlosQJLkpDpq+9D8xG3kROKeKiSyOrSLH6SnLQWGEbyennAt1aigUn6Shov5hDYD
         Sp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147876; x=1787752676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGFUGo1tsAWQ+W3hOgvBYRH8yAG/2nwAmt91QOb+53k=;
        b=Jp4ms5Yy8C3SxgPWqdFD8+VQFqpcnwEyA4X3Ot4ht9xuzvIay3a9+6/gVUTqKBPWXj
         vimo9I44aRRrSGLRZ6wJckuMPiex7BrHGWzN2+NZiBi0grzt3pcNIFfUqau+rKKl2rwn
         g3wJJ16q8UHHNQT+IpCd76zxRr1FS3m/0fYnOQBK8APsdW0aEii+DQLNCiAm+JE3DtWr
         rouzqjW1Qzu2w6UoK/ux5DxlH833kKCeyFnbfGtcL8rCh+Ok7LjV9+emEBadvXJizOET
         UndcLTl326T0EX0lMsSKoEX/psnZT13JoQ9finNNPtXFO1a/cfu6/L+UBdR9iHlSZ8Lm
         g83w==
X-Forwarded-Encrypted: i=1; AHgh+RooNL1wi3xgoqvqTKZx15pemAQV+Cv/FMYTyRYqHVykBpShMhsD26Fxh8WEi4/FA/84wJElbkDXaDaWlx2F@vger.kernel.org
X-Gm-Message-State: AFuF++laQVZFl7rJb8XYIocUw0QNZJnslfOg1dowVKDOZMIh/Qkylt99
	LqSnff2KZzDtUxLF9mNXdJ3VxcgNJF7hb8OErvYRdGauWWIRyVKFvwz4BCpIp5DZ8O3/eXbcWLS
	ylwHKXG6WTTTUkI4oLV/h091gD3kQLaxleKnkudll7ZOfsrFnR/G20FuunlkhjCamGGrB
X-Gm-Gg: AR+sD12iTYVfE2VB+9Th4sJSG0F1h3lRi3HeGIqZhtGj4z3hT0SmawGivqxWWefrs7W
	Vd7iI8VWknPbFOlZuMTLCApxPUsw0rTKhcLYR4iAx22sjveviB1nYPjpRdXhajhhWftn0n7PGiO
	IQPJVEjvLeGK7BnvoQaO7+hJeKizqIBHPr37rAyXG2Rs04/wcZYdGnpsmmqzZoT/zHrCeTXWgwJ
	Y5xLxF2z07FXvhgrIcnEHIfKY38cxTIDwczZVhAv8urgtuGkIFEOQfIkgnm0/OhwqBjxYMf5vGf
	Hhs/Uxtv3vVQNVCojW9WU6r0iyI/pf79XeH2joRlBuUS8SIGYjmomKj8Z4kGcboM5XM8wDPqK1w
	45GYznyFQNqTt8QcDYXIGkbRnVCzjpFgQ6v0sswTjoNAoMxfKpdI=
X-Received: by 2002:a17:902:f68e:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d5fd491cbbmr46770995ad.0.1787147876487;
        Wed, 19 Aug 2026 06:57:56 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d5fd491cbbmr46770495ad.0.1787147875882;
        Wed, 19 Aug 2026 06:57:55 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:55 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:35 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: monaco{,-evk}: Move graph
 port/endpoint anchors to board file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-4-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _YmKe3a_NDb-y7mfodi0mdlNGEO0L9ne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX6iciFnQzglvB
 HRtjKkBk2Mn9Ca0oKU0JYZCGI/WcDKNZKU4V/N04Y0CGWEoEm65Ghe+td3I5GTVjsuqxUiRRX4W
 pK8vgVBmxQ/z8S1K/pvFrzpL6Y/z1wZGMDWj3HaMD1MVMYMm+5zBRmt/i7cA98sXUjYo/2uilNL
 6VkJjjxiVLhE+vyIxtR1+qyyJJvr452Kt6mmxSHvkRmui/mZaxEo+1+TmKqpBCSsibloTfA0qFh
 8Qjjy5Nmazf/GO6WTIYKs4AerkQD/j1h6IdFGGwp5cZOmDAe/ho9GHircP87r1/+11TLW4VRrxi
 7T45q0pmCUBENgzEko2TTVEjF71yLUpRRh8nXmXeeT+/4wMriS7tpjPOVv0j/YOz+mYB1gDCmA1
 VCgW/PGCOrPYwXorf3oYGB41fAyyLrJtwEUZi6gXmamLaDav3i0jqNUiNsblLpciBs1j8heRZI9
 gZQd2rn8TSWFBa61h4g==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85b665 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S8xJJWJrMX1scVWJMSUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _YmKe3a_NDb-y7mfodi0mdlNGEO0L9ne
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfXzznwBhvmM5eF
 Bb6hJWUBzK7s36jkk6oJXcjTEMCUZaCQJ4OA/1wH/xzPDD400/U2VS0VU95l9rXzFvtZPG2yxNx
 58MtxIlCinYJQgfVcrcZUWIXc5gZG7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

of_graph_is_present() only checks for the presence of a 'port' child
node, not whether remote-endpoint is actually connected. Adding empty
port anchor nodes to monaco.dtsi caused hci_qca to enter the M.2
pwrseq probe path on all monaco-based boards, including qcs8300-ride
which has a soldered WCN6855 and no M.2 Key E connector. This broke
BT initialization on qcs8300-ride.

Fix this by moving the port/endpoint nodes from monaco.dtsi into the
monaco-evk.dts board file where the M.2 connector is actually present,
so that of_graph_is_present() only returns true for boards that have
an M.2 Key E connector described.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  8 --------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 5930ddb3b4b1..5aae3d8c66a1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -688,10 +688,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
-};
 
-&pcieport0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -974,8 +976,10 @@ &usb_2_hsphy {
 
 &uart2 {
 	status = "okay";
-};
 
-&uart2_ep {
-	remote-endpoint = <&m2_e_uart_ep>;
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index b17d41059e7c..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -1184,10 +1184,6 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
-
-				port {
-					uart2_ep: endpoint {};
-				};
 			};
 
 			i2c3: i2c@98c000 {
@@ -2406,10 +2402,6 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
-
-				port {
-					pcieport0_ep: endpoint {};
-				};
 			};
 		};
 

-- 
2.34.1

