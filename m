Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600952;
	b=ClFGN22IndqVltEpb9vIAuTvtexyn4FdLtqtH0iCLlMXP4k5ZUqueLrgMRWV+dCiLdjm
	 hISd8msle7Kh/H5+IB1Es8gggzvz9NE8B+bXnkqEn3ClcTQbFYaGmlTnqFV0yc5F5vZN6
	 PCxwHmvGu7MYBBtFedknIew+WIv2J/N4lM9O3w9Uhe15TJl8wltka5dtIWKdYQtMO1bV5
	 BVL7n115skydeSqkSTDKU90xJMZvTZo7LfJmB/RIs2yGkMWXXjTvZ2OnFN/hr+ley4XHL
	 W392xc0NHzexpNBTMvH6CIzrAcvygjfSquEggaiDBdEiTbfutXf9e37mxCJVDmjnm7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=;
	b=F91uAcOkCpSZ1aWmlZlVPE3rmpwzswHXTAtKyay/q1g/l+yDbBRH0How5TEWjRnoYU2J
	 YAzlzCf4FKydJWSELVmOWGqPRW6xrSqKO49R8xAWXXjp46HtvWxHeNg1ppVktD13O3iam
	 HvrYpBmS+F/plSWPo7hbk6AGNeODUfs/2wpSg8eWZ9vjGpPdpnn5kq4HXe8GpOHOcTRnZ
	 qf0+RzLMY6fCkOd+E3mzrp8hfE1RTYlsDthmo8oVensvFgrmV/AJLUOBZF1X1pvhbqW0J
	 9Ab2/qtZHxSL1/2siskXVuDaVY2aFsmNqVTfJTSs+z+DV75+jZ5PVi4C6XJsbQtq4Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nm1Em6hE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5Ip1IY4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FDF606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69FDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nm1Em6hE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5Ip1IY4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mLmt555411
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=; b=nm1Em6hEOIfw6dIl
	QjdFg1yKuYUHDS/iexnJqQI0Xa77ecz79gbmqdLRmzjrQ9DP9kdxJvZlHy2bQnCY
	mH5nfPS7f9uSIXkhwVXfUD10Zxsy4aOxJ2TfNm4Wan/BX4mDNzn8+Hgy81KvPQWk
	OqztoJA6MdcV69sAuKE9DZH9vLK5TSOZSt4vsKltJK0bPFSUkJbsAR3xDge2CkaG
	6ldCCHPzGC/MxEMIcjLxBTuCEPXiVSAbyOXOmIfJ9NR8NTNs+F5Pg9FuUwIaan/S
	3ctGwk9bk7Db7Tg2yxn7taJ2QlvALrkhPJHOT6LdeG+u/EwV4uB2qmPu/jP2FueW
	Mm2miQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnr7rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so6549327a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600949; x=1796205749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=;
        b=h5Ip1IY4eSGc0Wo8HjTl9/wNNE8mWU0DC6Axb3TE6fiUDcEbazI8JFy1YywaAMxvYD
         UmuAlpnovK6lVdkjruBt+mZceg97uXpktfFMPZuO0NeZV/hI2UlTSKuq2o4qmF6GNrsv
         OGvPlUukc7iqGJ2415gHJFuv1XCRpc82JRPkOwmsAh6uJbYD62vvsiwRXheP+qAqXpLz
         YabtsHbUYv0+DGVrr8PVHa/D4SYCW52n4hVdh1ttnI9qlrg5XU+36F9nK1LhMto3Z4pu
         m5QWn3mB7XGpBlyXWAbSIX+IIXhSNOWKqIWjCjj+GSKHJC2pLIZGf059ZEy80D3+NF3P
         qThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600949; x=1796205749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=;
        b=g9cxUJV4Fy0NyUKJ0tTNvSNcLiHu3T6pHgXWl2mBKaeJGiUVUU+Mf/B5slfzOjdS5U
         K19zKF4kLoXFFz9ySHHP27VwEbA+J7sl6C+d7oxwdtnvnzPTfrzd7aiJJdrFqUALjSnp
         C4A7+LJGH3xZwbe68hlp9yvKxDsWdQ2ByzJzN+3zW+qNH9L5BFlYLQa3zrwhSV4STQSq
         XaAzO1FqkpmDFZV97vu9N9hTlcgq9wqcFisc21j/ccLOyDVlm+q/tB7KCcQ+EbdKnDnH
         U8Jee4xkp7uuAPPOGs/FsTayz/xIjCmHLx93k/lBPsR+EaeMFNTUeQ5TTBYtzxFzEZpj
         xR5w==
X-Gm-Message-State: APuU4Z/iA2rjI/k75nPgjgAXPn4l0mDCzoc2WJ2WTSeK24S/qVnmQKPN
	GBrAXtjU1njXefzDDfiQ7rhfSCtavZco465PBTUZd8ur2IEA5gVuDLMyuNPvv0ewI9cZEmTuvKj
	g58F9RWCtyhHJwBc72eaRJU81uio8PD26pCm9FnUJfsfObGrXgcaXc8szwH5XLdAIT873
X-Gm-Gg: AZFdTZcMgGPAxH7tZug36nTmbaJljVUhlIq01kOr9hqSOg9wR2BXbas459lSzwTiwjy
	6CSQgxPZrniZLYDPcDHCJyhGIKMKnvZ7qSYIWInMFtNfvqQgXp36eHORfdimpmYg6murZ9DLPhq
	D7vJhN5VwhYwI/mOoZ/hBBZ3OGAZ7xQZGgXsz0SvvzXo/b6Sp7BAXtMBXS8TGoJWCuf5XqxTiSt
	Zkvx2qBVUavYVl6wELDcq/o+Qc6xS8WP5L2pbLD8PS4ZctLEj1TXBSGf63i1Gc6xNq6F5F/0cm7
	+Z48+DZjB3Qh5q637GOwo2v3WX4cn99fgCrXR3f/JFf7oRZzxR4WEP6R30ZiKkW9bVJ2fvrXy6e
	0n82Ih/T1IoBZHRIyo5NZsJRAMGyqs4VQl57HzXdcwa/T6NJb7VFftjj7KxCkUS8OgD+FCGBV/D
	VWCRgaRaH+zfMq7vv2GE30099X+Msa1t0ChLjkubrlcg==
X-Received: by 2002:a17:90b:442c:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b41c92a922mr16922059a91.33.1795600949139;
        Wed, 25 Nov 2026 02:02:29 -0800 (PST)
X-Received: by 2002:a17:90b:442c:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b41c92a922mr16922038a91.33.1795600948678;
        Wed, 25 Nov 2026 02:02:28 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm29610915a91.16.2026.11.25.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:02:27 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:02:09 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN
 support
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
Message-Id: <20261125-wlan-bt-v2-1-3ee862fec57a@oss.qualcomm.com>
References: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
In-Reply-To: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600942; l=3144;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=4xpAeV657+F5cP1FIk6WeWwuNZbSbN0fEfOJppsTcsg=;
 b=iw7Pulk05XE/HRfbnZgfKMm4tiRYO5zseCPPp2d0EE33EB50i8lHD33mJb+BxXuNfNn95e/g0
 UmBXGloKlsJCe21jh4wL6CYYSIewjVE/hpnX3ZPLfEAa3R309ABVevt
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX7aZx2qtVByFi
 RVbh0GvY8ELZE5raOXoA4WhhoLRYBdTk3pg6V7/56HZmF/5cyFGpip+lmMWZO+KEGhl8NB0v3vv
 2ur0FnEOV9kLRXGct1u8PA4JDPw6jfU8xlr3i6I/6b6w0my+omUZgcvRLGFb5Kggz+ZYJgjVnQG
 JGRXPTxBsbF0PG75Y+UDV+emSXJg8K+1u4OENTVm2B62m7tAGvXOYsXVVP8in6TFj8HBt3467qm
 Yn4shycNiKGJPMeqtDp0kEP9feJjqHIBN2TyYGUHGQmHBaVjfpcxIxbUr331TBJaa4IsB/gBTQf
 ehOB7S4uCNOZhNcL40K6MavGvveNcKBZ8Wmck2Eh1vsQRAZerRlPNQjAgBk2k3YyUzWdXMsvSYX
 2XPK5raNkGu8FJW3UitfeE9lc5CL9mIZUqOFRWl+L5DH7L/7YQP2LQLL6ZoHRcvwjnf26w79ZIz
 1egAtDlfAVGWaIpxgPQ==
X-Proofpoint-ORIG-GUID: sHViaVlS_qggJQ0RXFbgHHBLwUOF2Uis
X-Proofpoint-GUID: sHViaVlS_qggJQ0RXFbgHHBLwUOF2Uis
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX2mAKhe2qwIiq
 ngx1rJ38oVs1FBbqrW4IyQwFKS0aavtrgLAtcWu4JsvbQfXqIc76EbHteqYIL0jrnn67uMnlfxQ
 t5j/GZFMGtVoezvBTAbUZm4UlSDDuag=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b236 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4V4p8McF_eF-Umsk-awA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

Enable WCN785x Wi-Fi on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e0..09d5ba4190151 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s1j_0p8>;
+		vddio-supply = <&vreg_l2d_1p8>;
+		vddio1p2-supply = <&vreg_l4g_1p2>;
+		vddaon-supply = <&vreg_s9d_1p0>;
+		vdddig-supply = <&vreg_s3c_1p2>;
+		vddrfa1p2-supply = <&vreg_s9d_1p0>;
+		vddrfa1p8-supply = <&vreg_s7g_1p2>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -757,6 +814,21 @@ &pcie0_phy {
 &pcie_port0 {
 	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie1 {
@@ -808,6 +880,16 @@ sd_card_eldo_en: sd-card-eldo-en-state {
 		output-low;
 		power-source = <0>;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio7";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
 };
 
 &pmh0110_i_e0_gpios {
@@ -906,6 +988,12 @@ &tlmm {
 			       <119 2>,	/* SoCCP */
 			       <144 2>,	/* CXM UART */
 			       <211 1>; /* NFC Secure IO */
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart7 {

-- 
2.34.1

