Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743834;
	b=UmXbBR9zasn/FPUFluBpHjN9I14VBI0DeQhKg6aLlaL3t+mYxeDh8r9M1lnm8hbUA5rK
	 5Q23fEtWCTRp0X46X1DtjFWQ/TAUcv4Yhws4mvmQ3TTCGcWFuUzcxMtK7OlgBHsWJk+EX
	 Dm0FY3A+VzbbVIx7c/Pcg4fY1LTwg0YGAhzGCFW9voOTVwzOnkHPrYnmENFIkHA11D62V
	 zSddhnDRuD9T3PJFNaPhgMguh7mhpgm/liKPr2J24leeWBhpmfBphriSRNneoFhdEdwdd
	 xUR5t1SKfd6ixMuZUXhyjF3c5GYNhp7V7vZT6IrhINrTOHgBzUFdEAj8evzO7uayhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+9tAxkmKybALjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=;
	b=AY7yIkx/t9Ad8nN1DMetpEnoAmddjyS6e8ThmzIfODmYRxneRAZ1m7gu4CbhOXF3xDLG
	 qvJ7J6rH7FL3DUkbCFmGU0thDCD5m+4xHeMMMAgkV4yNZboJr9QvJ8cxuIIO4NkcvNwth
	 +mqj2LUODwDOGv52bYglBTG+1x737FPgLWT8KGD3MKBvvVTZRNgFsKG0AtbDMtt+QaDy9
	 SahbMbsry6PCYinlzj7h3weFiky/MR/4Egz4dr6gbz9qCxU8UnLfiJW9myT4h6IhqJlPs
	 0gHmQ30vrcdaydKzj/1TwNyz2dxxJGb+4gpt3ohXp/11HseB8J6vmypgOTVvAVUR0lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cS1Avnsl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMmSckmd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB465606D813
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 22:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB465606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cS1Avnsl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMmSckmd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKpTK4033514
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 22:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+9tAxkmKybA
	LjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=; b=cS1Avnsla3yN3HhkWdS+CODOWbk
	IlQu0eRx+V4fe0l1AgiHbbqSQ/xxilssFMxGWnWgL2A23yWGteylTPmtDfH5cyhT
	FCQZcW1q0mYODPOjzIjH0HH4Wq65DJQRMMhX37qTH67ifReNzD7eD/8m641H4iNq
	GAhrV/FqvBYU5lDk1nPJxZ/cu6gOP6hA+ry5Dv4JOvpvXlfPz+llX/OWfcW4ILO4
	tP33WdWfIjNLSy6Z/HUmQch+unSjJkidySq6y7+rGQyYz1t7NXAZ6m2m4d3FYNWZ
	nbwCdhmUJCARtxFQLPHOP/HosCmklBB8YlGskG3CzzubmjNHaz8l4z2NXiw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyphtsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 22:10:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so408414c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743832; x=1794348632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9tAxkmKybALjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=;
        b=TMmSckmd9QQzL5o8Ny4UcJqYsEtlTekETrdMSXVY4kPnnbL79RT4sfAGZKt9cbFrp8
         So1o/iaZwk63Ea63FmKhNXZHF3F4zZkHH/S1Z04f+VAxaixfaI3aE+wialuLaxnygAB5
         /Ry/QU9h/yIO5j6m0VbiwTQViFjztcYWnv6WlZVFwT0f7regaRJe+iNBJHpF+NvXweO8
         6bUo/VHl5bRdYIItxp9oCAHcQZVgh7qUhgwaoU6khxyCDUyRhqdQh6FzNRfBH1/4sqBc
         JKrwLd3u9zGmN7/YMOi7zuejDU2FDaS6L40yE7HRS1vM2Y0ccaxlL9Dasg0Tjd0i9NfB
         BBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743832; x=1794348632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9tAxkmKybALjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=;
        b=h3/HUBdod8EogkJJVkOiSn8+6obC1ClIUfYnSnVT4CZM1NNCgz4ubWKP/zPle/kSrk
         GyqXY8OaT7mUfe5XJQ+CggGvlD6cwKzjEpWphemDcg8JFW0bMhutPlnQTofAdUgILXmv
         lHtDu0J4yHoqikedAYqjy/9zOBokikH4WwFmAHxEvAVkLR5ZyAyZJ2M5RGJqL4CdEL/q
         JiLz28r1SM2CTo2NWTM3fKfGnb2WK0Eb629PE21IKtXnvuTlRwODOJgeuvCQwaR6NQwm
         wWCYAKWKS/MgDYs+EcrtAMaVZkK6Q0u9F/PR6hXSWGX2fil7BcLsVLU7e8oEMJF07uHB
         YPSw==
X-Forwarded-Encrypted: i=1; AKwUvBxAk1Vmle1go9tJ1oTw3qAs0M7d2EHxF8YPAdevT9FRIXzXpnJu//h3xuWuV0T+je7XNv/nHR9525R+WdnD@vger.kernel.org
X-Gm-Message-State: APuU4Z9GVQxan8FMwZkK/jL8I5Lwm59ChbdcdE8SK8aPp2YFDn9S0AHg
	B+/WaFzdsDd44vXJnFyoxbDNRQ9gPa+Q6UgY2CmdFpsW1Rf/AcLjKlWkCGqXVro3MWQ6XB8/7FW
	aqQxHHRLKN5I7V0PmkjCZQA5sj9CmAttPNPnkzVTwXCtr5SpOLnSf3o7pzalA3QhrFpss
X-Gm-Gg: AYBFou2D9IvtBsmL5FWhJBRIEtWEYcTiT4stjqM1sSkCn0SZT2aHoYaIc9f/6UOKdhH
	Z7KdjqIN5+YT+hk9sr7EkK5N7zO/scgsaYGKRa3gYIdtgSbh98dkP7kodPe+1+bi2G0SYFm/RH6
	z/mbO/Se3UPJYGqvYwXzb6LiEJJoTN3p3srBIp7XfPmH3OUzSqQQ0x/wvTWwRSxl/A5lOnSSmje
	x0OSRBCrU9+N2f2llO1fpYHzt8fMAfC/FTVBYcUOuK0wd4TFMRLbsi2ofzD5tQJ5+cPW269bcp9
	9InrNtdkM5sRX8NK6IyJQqiYjVw452lL65wgc3VyJlwFy8yxtcJ6POCkfcSFzgA+FD/ZCNpFSzW
	y329YWlcpnAALA5jQgZj8gH6qV7+b6WPtU99ho1YNeVO/GNg+bfLDCp4VhEncJaqVdHqeYBKyVS
	R8zNlvXnkRw75QKv4q1lZNuEnH9BbP
X-Received: by 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1ac5bbb4b85mr28440948c88.9.1793743831593;
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1ac5bbb4b85mr28440910c88.9.1793743831041;
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:30 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:25 -0800
Message-Id: <20261103221026.3662383-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX3GDJHnK3ESER
 TvNs2OXwTyZ3loKmtB9Isfe4PIV4jHJWxeoB6UEUlqiq2NsywXC9kuvX6ssYB+pwFA+Hq1d9w5u
 eGh0JdAOHexDdE9twvUCyHuWqngslVs=
X-Proofpoint-ORIG-GUID: GvJgzZ0lJ24SxP_95p_750r0zz5xQLDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX9F4mYo5e08Ga
 Y8lQt88BYo2ADaXEVGMQ3+LRkF35YEwMW+ViV99FvpLLzPb3qXrFyhE1NggHe2uKq74HbC8jyJ9
 Sc4yZmK9+Ibup3Vzjah4u/bLOPifM6S5PUo2TUQhYQQRWECfHFNqyqNkKsrrkGyv7dw1Rt3FdPl
 HFY9d2P/NYuujn4tuJPCG2dIf/RVX29EsKCkFdG2J79ipcUXirU9BhXA97HqybDMMRX69grl4FD
 13+A39qnG9nfj/VnloQ+I/t4MveFGh6gvTE32kO7PbHqMyKzcs8U6Q/n/034YRWD8WVRjiXDGcR
 A2RBjqqVkfv2Kxkauyi3Wy3z6C/zQDYcvrcfXdzgObJhjdqXP1hDnBBkhf35XBvK0HHzLuMh1X7
 Ja99iqibKn1QvdJfTzcp49kg8UV2nT60yHrGNe7PWPIYF6AhuUluLP6Khe1EdS81cE8Yks49MdH
 arLLWZL+yj7b+qXNvEg==
X-Proofpoint-GUID: GvJgzZ0lJ24SxP_95p_750r0zz5xQLDC
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea5bd8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=n2D47ajo8674fvOcmZAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose the three QCS8300 CSIPHYs as standalone
qcom,qcs8300-csi2-phy generic-PHY provider nodes (csiphy0..2) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 +++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..9585bc723fc4 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5577,6 +5577,120 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,qcs8300-camss";
 
-- 
2.34.1

