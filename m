Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458214;
	b=AgOCf3HbfVZUBiBnV8Kl0KDFJU7vgD+whG6ZwmA2xOTwhDl2FbjZJbUywl5BZtEOfWsg
	 bE5884cD1LYrg5QBt2hqYfjntvw25itRK6hsw7gTRWu20YYo4a7oIjEI0w10hWsRSG9QR
	 9xYnaKFgEk/q8vjokf5naOsDJyy07H2tYitvugnjx37msx+YFd8BjLnbHixFCxOLhQ2Mw
	 SRGbuuy1hSPi02JVR+BfQXbOXqM0lAKWNW5T6XDOCQj/k2bY+DlKB15GaHD2V2YpkQmEm
	 uxFL+/6h+Cq0omWLyXLfg7QIj5UkiKq51Kjfr2+EBQOAejRi+/Ym+Vn0OfpW5Wep/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
	b=B23JNleho2J/HhSKJ5j5Zf+9QdFp2T30C/7DOGZTs2R/07bnO9+qlQj1o0Nmwc0sbwBe
	 H1o2ZC6bwP25fAmrnjmA4RUs3JxJfzpz3WbUxQC8R52pWwFRmXyLlVybqMuu9/ONjMQxz
	 uLyB0t+yZo0e1aO4IouBCcjxtgmUjTwbElDYQF4jx3d1TOGn0btnEzntEurq3feqPsNwK
	 qwv/WQ29fG561oEqjcmPWb9Fxp/kUdjzu4yUlsv5bVIt8Pe3jx1YiPdK5z0p2u0Xv4xHY
	 2j57Lm/CoPFV5krgig+xI7QwpVK1lcvEoPhIHJHfRs1Kr8OuIm7NfcGED5dhiiRYM4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuXnm4r7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVNUiu7f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B194606E937
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B194606E937
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuXnm4r7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVNUiu7f
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zhua3813251
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=; b=NuXnm4r7/MZsW91P
	slXnBUybmCS1KKywYK0AWHwRQApA2pDwphTbAGaSONAojlBBprppOwjVjVo35Ctl
	4SuDQwal1gxfvyfGJVMR6IYHRSjj1kKz6WHsPQnS+uXTrmcMTQqkWMBvE9qz6fWM
	9swm3LuA5KUgpYq8VSjsmlTH7QK1pwpbViKpZjGZaLsnOLwXOC3rYeGjeYHH7KF5
	jga8vpV2YpnPsFqvi0PM0DnSRmNBqaVfQ/XeP11RzXUu0QsAO1121OxN4MY++9cx
	60O88rUqb/N7kesQt/Qe2yu3X3uW8Tax/3ftRiB7bxkje301qrLpK0SLdmZVRd8l
	bIDEJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0j4es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7247704eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458212; x=1795063012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
        b=bVNUiu7fPcLCsdBPEUJF2ipb7Mw4LLUEG96RgnT/Om4pHzQ+/T+f9t4JyI1AD8zgF0
         e+f1QnKuL2x35XYHq5hxbg0enu0kji7X8aF+2kbTvtSRFTrpajV7lbQoddg8N1jmdKUU
         SLvcxdlc7Qp5g4M/8sfMXMKZeVbI3JLACkSh3nSVLJVPDEMzyrq1x3SxMO69ylxkq9uo
         C8aVCgA2iE/pF00Zv7LDdUdecMajqMYx6Bjo9gtz9eVH58638S4YvHj0Z7S6yV+y05iF
         jrIXBbYqvjnbSJruS3YU5fWnamPdZVlF/mco9vSeVUIdd4VHg3rEMD2deTA7nRzIQCkm
         TtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458212; x=1795063012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
        b=PR+BkPJzMcyRajfWyRzPhiGH5ScyPeFeIuK8VeYEGsgWnPS/YvbKeyYXYE4ia5cCoM
         cwg2vTjn2w+w8X7HFx9rBHQYYrS61P1sknkP2zjVFo90FlQ6BOgjSayPX1NhdhcLB8C6
         3I3p66YFUl/mvDIIb6aN8VQm8oBleKNSklIyeX92ClQD1h/j01rGuFVxsO6feDfjzZ58
         GggzNZycG/0MeDrv0hf/KJLMmX8+5FYIyGTjRWFCVzrZ/pH9flVqmOVuUrkbFGKQJAhG
         yDzY0szfl4lvggzey9SPl8l4AC52Tx5Rvwg4/JLnrPuFfPr4802OLeNjdV1L+ZIr6Zti
         Ibig==
X-Gm-Message-State: APuU4Z/TtUGAsGw3kXOmGmtDI3WykilSWru6I4TQK6OgFJLzOFgLVgu+
	Dik4kawtwgTiE78jQHIMqQENUpGa7T21pkKEnOuTAqfvQ0/ruCKOMK++oR0YyRRrVXdlgwfTOuI
	8udbidEbmB8iq+WORZ9pWQyxOZvFx+mLOXqXrnuIIjLWgXslYvHtXzLrqu7bmWjKDKo2Z
X-Gm-Gg: AYBFou0zL79UKGQT67Qhx0gqu/z3sMkzwZGnwzpiSnRdr6DS/a4/v2hnjaOzKpfLvO1
	2hj6Prhzqlo8zM0gIZDeTvsdLTGJ8r4iGl2iGfbX4lrsWzlWd/ct6DktFcIKhGYJqybRAIP2kDG
	q4A2MwLPlz4VQlVS5y0sDviprGEnzP6TBw6eS4b6tn7O/GhoUnNqmUdgnjiQaNImSm3pS1OtBh4
	9WkpYnlOfICv3aaJ8PIWL45J+GDfqDxN/QHPQUiSedJ+btNetfK8KSlePaCRDAfVw/GwQmsSM5b
	/K/2LPnfA8QMgC0qIFZgTzZ74yeqScY6UZ2LOSlaTNRx77aZS1dhZiry1PoKtUhpZMWRciyKCUJ
	vda2tW0Hj8mcQ2LJdc0SBolSO1TkVKkC2WKV8WLlz1qvK41IvIkbcKoE5In/NjdRa4/crDfxOuY
	a+WWbsX2DVJgHlr1g5j22xlZGoI6oYXOASRWDx6IonczaCK5up3sktVK8pf09nA18kKUMxpnPZw
	fWNpdE=
X-Received: by 2002:a05:693c:8801:20b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37685c7a193mr5060020eec.21.1794458212282;
        Wed, 11 Nov 2026 20:36:52 -0800 (PST)
X-Received: by 2002:a05:693c:8801:20b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37685c7a193mr5059993eec.21.1794458211572;
        Wed, 11 Nov 2026 20:36:51 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:51 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:25 +0530
Subject: [PATCH v9 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-08-dts-v9-6-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: x_RS-gprJyfJq_j00gSTB-QO8wtd-6k6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX4QjDiHr7Sg1d
 ehgnF/ThmxdnB6paJ/6A7klHOXA2sAnQZ60qmvH/jGlXLMPrxJMe6KQLxCYfJZ+zUxnnu7xJR3G
 dlLOCmINsFAnKZX0xWgUWoUM5S/UVR7mDM3uANmZsCKJTRqzhZu1e7uHHatq4H3cUGVPbclAOZq
 VwJ2Aov8TGdf04pklCgq2KrcbRZ8CrcG2PC1kQwJ9Jf7u9ZXHmaho0DqvKRGbKUnIUZ37OJj0k7
 2YUaz8aRNE288FbbcIzCf9/l3+IapTzyevtHXeXNgBlen8Ku/WBmLolgBM0ezu1YPeqIILq5fey
 3VrSF+Gjc3bnd33PLVYXpVEcGxbRnbOS+TGe5ylMa7PDZzSeaoQNkoqj8StknESS4Xux6RoIXFy
 kR0ca9KrwKpdgY9i6Zo+LfExSpI+jQvYCjg5nsCGpF9LcY0QO/5unTMcFMmpwtkRgTS/RBJY29L
 vdiWlg9T5+UEU0J9h0A==
X-Proofpoint-ORIG-GUID: x_RS-gprJyfJq_j00gSTB-QO8wtd-6k6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX+iuNz4yIJUJ2
 PvImpA6PpJ7+w5tF2aWPyoxYcaNMQHAM2UHFhnGnacl+EmBgMNECwGOQzFSuliAiFsei0Xq3wCC
 Z1sCZA1PR106ICh2G/fudD4zQTiIk2w=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af54265 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  4 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 43cdb981a4ba..aa8b37d837ec 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -22,3 +22,7 @@ &sdhc {
 
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index f3d688fded80..267255d2980a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -164,6 +164,14 @@ opp-1416000000 {
 		};
 	};
 
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -456,7 +464,25 @@ sdhc: mmc@7804000 {
 			clock-names = "iface",
 				      "core",
 				      "xo";
+
+			qcom,ice = <&sdhc_ice>;
+
 			non-removable;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq5210-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
 
 			status = "disabled";
 		};

-- 
2.34.1

