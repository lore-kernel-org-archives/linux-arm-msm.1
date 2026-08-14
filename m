Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5CE372685
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717364; cv=none; b=uhMTIRhQu7vQXoe3hu5n29erjwnzs5tRy9BQh8/BmCapPPhgi+hrislYpWj34YqFeqYxAb5mJWUQBWVpr1bGni1oC/nrvgGXhUaQfdUiFRw1RHGRH94Ex2M7qQF6ZvX8Ogn/3xFVt4YAZVMhj4E3Iym+QGYQBxcCwX1TsA1Qu0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717364; c=relaxed/simple;
	bh=dOhqOkzXwdjY7dpH09KEdu7NMOW26jnhkkuPD4V5HAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8d5zuupDu85aS3FB0c3azNsbs8xnumkevsh790j8D9IkmjsN6PRrndKJsVH+aM84b49x0Cp14WpVk9Ti8CmJUJSzd2l4TB6RUQ0WGK//TzdHm8deFGzs3SoECJd2QR7nT+MgVRDQ35un+WCuEbOJSdejq3pymI+s85ZurGOSmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Au/47Dmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLHlsVwq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Au/47Dmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLHlsVwq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxSQJ1564801
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6Q5RlWwCynVFlu2s8MiterOx1z4pE2fafLr2ecIEQ8=; b=Au/47DmyhCPWh1kA
	n50EmTpn4YCKua8Q6Jd/zRkOkWrvJkFkT4LpQ5+Oc+eju3hKyLE8g8/XalPyZmXJ
	O1X8CCi1zdy6AttSrqqFt2RTyeRa3bcY3HahyNRMKVmZFsjrHQp7njoFjHW/QvBQ
	3+BhUZsqExn0LujLCY3t1GLdXqYkm8Qy/Qs7FmKXPyj0/Ajo63R2ewZ0eTB+Fjgn
	B4zSpyc/fZ4+Kr1fzQY/2YCnfq04fHwNrXtOLcliGRrAqogiNHTdUiOtDNH257uI
	ZFGXtDtNtXNzEpi8bL0G7WB3OeU3jOvQCDYe9G8HXhww6ekWsr+TCzKRjfN1g4Cb
	TKwvMA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f4k8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso770823a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786717349; x=1787322149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6Q5RlWwCynVFlu2s8MiterOx1z4pE2fafLr2ecIEQ8=;
        b=kLHlsVwq/rcz2vGWBzFdXCbxJOIpGSj6csKwBWkbGcD9R6djW9B3EIWWAiE1YwIftx
         emRrJp9BCFA8bk+BroyvALdp8Ub0FBIZEzhu4I9nW1369JA2eJw42H4+JhdCGa+CP/m5
         aGCUiR5iWSRRT8myKqDcD/KDB5GM7t6e2Invll2NBOdPxRS3l5zaAH+Y6Pu5qipREUgM
         5woGk4brIHZy6pULW0XZgRlT61VHITr/c+iKwy/C/C6Mj5Cr8LR5H3vQ8Kf6Ewd1KBTU
         j9w1TSP38lThhXVTYz86fPoUYyewN5Z4J/RVn9YH+Yp2SBjYUSGRhTAtpoiUq7mTCW2M
         3bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717349; x=1787322149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6Q5RlWwCynVFlu2s8MiterOx1z4pE2fafLr2ecIEQ8=;
        b=Aiy0Tf1BczZnknxyTR/tckdaJieXi2UhJHsr8s6Yb8g5xsXv+tlFgh4Kt/VZ40Mt/K
         +Zc9n6XeUUFaA/abx3NUGJNxrfb5aKytFBK9pFKMzIXOQjNYLh+vec5h8gIbFl0hvU+j
         73zNzVS4I7aedGfLrHONFEC/sh5Rm1gpW/8aRI8XYLZZBmq0KlTgitunsTwNDd2iLsok
         6SO1D+vBGRkMjHK4hTsy9gVHfKPYAYCW21BpfXMlHZBGAU7WImV/HPHc93p1BCqRpv+n
         0Yurr83qWxt2Fpd/iHcw8qsFH503/pBam6A5KItTE4CvOTIH1Nad4cAbHyv96H3SC4UK
         WpNg==
X-Gm-Message-State: AOJu0Yw1NX1n7IYH6/fgHGLTSKCkH/LB6tVqD2nbig28WCm2SRNWDVSL
	JhLSJH9Ja2ChiXL2g2XQl5Cz9pclHaTB9754ZWCTNacya/b/edVRhVd11NthUfdv1moKhtfW90g
	6eKVjJy1PkcdunMuWFTI6w9Uk48t4I/uzaUJgD1EbY1AE5Ykn9tbsZE/ksTU7oFkVlUPp
X-Gm-Gg: AR+sD119XbVu1IT0Ixp4OsA/x0bZChdPGrqkf/1gWEd/LlnqWCCJxwCtCDN3Nt8okSN
	z2ZvgLRrqUmobKtPzVoIi5kZfzpszR1KDZkbxKZKeqy0MCPSJbb4+UR9zVciVe4nT2QhGCgQmq4
	BV+ttOwg3DFt1Fde/Jm4FYTb/uKccfVafoRkgUKg6WTQUYV22Dsvry6yNQNVdChYX+VBQpnXR3/
	j2zbmi/hEq2ef/v/dBstLHrP9KyzOhqa2KpCI0WUt7Dcr4Rh6FANSbZ2pLdosr5f23nbTLvybUZ
	CuBwnvCDLmV6imJVLMG28igLOtoWbj+oGRiy3Yl389yRP3QHNjGtipBYaQWCVrTl4sHkkUtYUH5
	XTe2P5Tb563u8uprS25bs8afAAjHyJ87bpmY4yxZO4PQ=
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc71fb5781mr7111763637.24.1786717349190;
        Fri, 14 Aug 2026 07:22:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc71fb5781mr7111678637.24.1786717348524;
        Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4895520eec.31.2026.08.14.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 07:22:26 -0700
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5018: Enable MDIO buses and
 add ethernet PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786717346; l=1193;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=dOhqOkzXwdjY7dpH09KEdu7NMOW26jnhkkuPD4V5HAE=;
 b=HLEKBmbpFugGTiraEJLH8a2E1Z7wcsJ2SEnRnl2XdJ4z4XZK3KpiTX4ywOe5+i3upSUz+BG6i
 NiJ5A7Fx2fcDuaF0jKs2gs5RNvBLpp8mJiqdpPO0l1G2Wnrw007irqV
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7f24a5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GcT4D4KdeairXD8JEV0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: i4NAv5GItN0zxrmrRQOnvjIA8SrIEDcZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfXw+BkpzqAtqwn
 Gq8BXdP9rPzMnkU3XQUB3tjS5azPHFsA6lzqXsNeFDqeA+7RtVkV1FfWInTbKbNjqn9p0350WEU
 ZVy7FAnjWqc2HayCxBp5793nCbL46GEYNf+gUYIEqwLfUY788DPZ8/7tmB6m6peM0nST8Mo6jGf
 eIX8+Bbc8f5BE058m97eXYBpbCQqAaq91i2t6CAPGaGoWoY2CnpfkprtQuWAaBVoEik5KIqL0fg
 jBTt7QA3SHyPUpwNJgeG6ng6ctajf6r4REmWS+7/WUmJY3L2p8yaVbq68Cc7rEQJ1eXK7riiF4e
 j9uIcm1HskdDx6+Zmi+nCGqPuC/hokg6RWmIhof1HUEH7mbgzt3k0a4r2lttfRjEh5p8GEbyiW2
 tlNVgQycrgMZen95o/dMts7q9elPRcoEfsyxeAOSES9lV6H4K7PhpkmwJTOn896FLqqoth5zh7o
 T4DhcMxb2qBYU+BdF9g==
X-Proofpoint-ORIG-GUID: i4NAv5GItN0zxrmrRQOnvjIA8SrIEDcZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX3sRyakOduXHH
 QaYF6h7jhMGcc1fdlwsJlVIXrxOBo69EGViQjvRPhmeOrU9riiXYz69uuznu/ezoaOS8WLkN5Qv
 GCsbF6xI+4dmHJktl/BeyegmnoVYG+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140109

Both the internal (mdio0) and external (mdio1) MDIO buses are present
in the SoC dtsi but left disabled at the board level, so the board
currently has no way to talk to PHYs on either bus.

The RDP432-c2 board uses the SoC-integrated EPHY on mdio0 and an
external QCA8081 PHY on mdio1 for its Ethernet connections. Enable
mdio0 and mdio1 with a 6.25MHz MDIO clock, and describe the QCA8081
PHY at address 0x1c on mdio1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..aed8359b1931 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -30,6 +30,20 @@ &blsp1_uart1 {
 	status = "okay";
 };
 
+&mdio0 {
+	clock-frequency = <6250000>;
+	status = "okay";
+};
+
+&mdio1 {
+	clock-frequency = <6250000>;
+	status = "okay";
+
+	ethernet-phy@1c {
+		reg = <0x1c>;
+	};
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";

-- 
2.43.0

