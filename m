Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461653;
	b=GNzaedmaeAhRkba+Noy3A/7hIX4JvkQ0cycvf3gNqzygKQv7EzN8j0/InARY9JORoxuf
	 jUenRvOzCxFcidmHFQHckZ/2eFzE8CsvygJpzjeyUSJW//88jqQJQin5+IpEZWwAwIJgI
	 leEu1FTH4KBdlC+25rokP3bJ1ioo7Evp7lxsjz9jkspuXmGdIHUZj4RQ/KggS9HOmcBAY
	 cSEcC5Y+PtI6Z8ScGAIPwH6u3YG5E6pBOEmkroKctDC1oKF1sK+mfcYHYgg4v5Xpq9vFs
	 ji4OeIbRU5Bw0kcb8z+rx3OrlZid11xdPLrtqzPiIcNlO3Hqg/Gt1lavhpK1hepFf5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ME8In8jKZ3MBzjK9cpl6qwg+uCXfpWIB8rTznMDme5s=;
	b=4kbyLlDPvLxUxCe+PIEzDno8rAiNnWRovmCoMXQi7sNdpnaNH2Hlf195Cq2jos07/tGb
	 Gour/MXNlevhLXPx/l2RfDK/0J7ZXVDybS1Z3zJqVBMFS4Zv8AAlYz76+Uj5TQvFFMYbY
	 y9nbyf2qClVlP5S65WLN7M4wf4C61+8JLE3KPVtnpzhse6zWVNqmKh+sVLlPmS3o1071c
	 AyOIAT3CQTJJvJHByOc656JZUi4cVhj1D+Eqjl9uovPC8FH58yW0l7ka2qC2Z0stCeIJ2
	 ithvYVJlpNyFQ6BF7JrVC0oxFt/6uJKX+c8REfhAlJ+wg+73sh5YFLojTQow4QJQrpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoI8KwdD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dfAr/Y+w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4943606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4943606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoI8KwdD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfAr/Y+w
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4m0pL3893195
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ME8In8jKZ3MBzjK9cpl6qw
	g+uCXfpWIB8rTznMDme5s=; b=hoI8KwdDW3MCzbBlltDvc7pD6oLqh7PWNnDln5
	KsFgC2ACwmsc+17LNe46yiksi2VVC9Ufo/fG5EtFmScq91cK4PDmVjkM7MRHjd2s
	6XF8bB9gWHjWXxijqzZhHj02F9Se+T3dhtdoTp2FbiiWDomDiy/qMtSYCd3teQce
	cdk5P0FxX7XQTnP6xiFqKdzzXk+sMiUesKy8OJEpzLDLrjerE5daPuPeie7VtG35
	Fa01s0+qcrbT9UNmx0fJDhZM1GkX4TG8EzoOcm+FSz7UIJW0SRVStHDP8hfcH4mr
	hAiuNQIAzsZ4pW/Gj+ST3Q7yUlaN/Mvg2KegcU7u+fmqJIrA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0413-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:34:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so1781572a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 21:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794461651; x=1795066451; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ME8In8jKZ3MBzjK9cpl6qwg+uCXfpWIB8rTznMDme5s=;
        b=dfAr/Y+w6r5zUfjzGBMnt4WGl/qbbynZ6hJ0BwXfsOVb76fNfO0j8U3j3RWU2qRm5b
         UbLw6acSmEL/jODizqQxfpNDRrVLKvGVfGrjyI0RA2A1l2L9Po9JtvJHv8YZ7yVeg19s
         kd4vS+Vwaq8hf73Cv/O8SdZCa8KE3KKgqIqZL909Vdwqel16KsfLliIXSh/BMU+F5z9v
         xTPpUCV0peo06a/1PuuLRgWElxFjxn+h8g6EalajhlZgBLbuEcubbos/LAyCBJjBfjXb
         z+BFmr73eJNNyt7/oeFIiVclx2lxdZww0mMRBnnU1jj58YHseDHtP4lj5eYbs+NY4eWg
         Y6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461651; x=1795066451;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ME8In8jKZ3MBzjK9cpl6qwg+uCXfpWIB8rTznMDme5s=;
        b=QBhPuaruN49/Q/XITPHvOS0EGOZWZ/S+sS0BPBfl1KZ+c4rSgXugdoicKuqdvwzA0/
         EVAO1pVNpPfxtnEbyVwdmGYunol4du9IhyxH7SKkdz3I9Pfv42Vtwu/PJ/qOtfQexphq
         Vad/babAy9A/vIG4hlUFROSfInSoj1goYN9WKFI/BSNjzVdLL/LZNTYbb7mkW5pkzkjP
         QqjNCjpGNBlaWzYHKeAp0D0tZMUBZZs2PKOT678aipbmwk+x968r5oYwDo3ZT3NEjbJA
         GI6tluKY+cvZjt4SLO03F4fXWaFk591qlooPibtxUtqzTVPF1lKYJy6G2NrMWdbMOAVj
         M3/w==
X-Gm-Message-State: APuU4Z+9h71eb0SBjnmJCNG054kBDRefL45W0xAP0XchunN8Jvt0Nxx5
	V6bstSmZPWHuwF2U+sCJyliXJ06aaZHQZ/86C4BdQeJLZx1nKs/CqlTOCrsuUjIA7+11NNOQ4NF
	5qesYSIpBROhYtynlYhIjedot5YyYx2c5uF9negNXLoHE/csVzz7CLlNq2kOAJG1lF40GTW/kEn
	kO
X-Gm-Gg: AYBFou3WuhODGr34j4AnMpEwaQ57fKmMWokrtse453Z+jSsWH7J0vVhVosB04MmqcGK
	IfK9o9ZZk4b6ZQ0/iLp2zRM1IsQL7Aho3f2b1FpchkrK3iE6rBjCmhZAQsGuOXLQ3o5on/tpTbw
	LqwvvhtD5/VERoPFiFRtLsosuD8ps7Ntsedd8ZzuudpBjZ7uM9vvGg27ipMywxhPmD94VUptGjI
	yCRtQ9WoqF9wHFPyK5fzDVhTDi1ziRBcdONJkdHreFlbFVXu5mSsDzJER2HdUuL2flYQ1R1RK9d
	XRF4d0KpNzTuMq6GDXNi4WTqY8xOz6YwbfHXAmFE6kao3FrItNOxB61Embjqc5UeW/T497JaGrC
	vwN0flXvZcGCRbulWpv5lEbiW9gSwbxrHSrUgnSRQyTTs9FYm/988MLHn1h23Lj8TjR9K8fTmwk
	BWa2QZnhqP2A==
X-Received: by 2002:a17:90b:4c50:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b182ec2106mr4744140a91.13.1794461651148;
        Wed, 11 Nov 2026 21:34:11 -0800 (PST)
X-Received: by 2002:a17:90b:4c50:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b182ec2106mr4744124a91.13.1794461650555;
        Wed, 11 Nov 2026 21:34:10 -0800 (PST)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm2661873a91.3.2026.11.11.21.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:34:10 -0800 (PST)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:03:43 +0530
Subject: [PATCH] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for DP
 alt mode
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
Message-Id: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALZP9WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINBNzcmsStQtT07RzS2t0E3LrNA1MTU2NzRLtEw2TLRUAuorKEoFCoP
 NjI6F8ItLk7JSk0tABinV1gIAm72PYnUAAAA=
X-Change-ID: 20261111-eliza-wcd-mux-fix-453716a9c1a9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794461646; l=2340;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=baa38kPr+hJAvV/xF+9iBrY0f4mwj5mgcjfVGbGjZd8=;
 b=Hl/+GuJtXuyNOW1pShiG2PAlTaHyD8OhvSgLvAlVVp8LP7QFAeZE7luPLGNUsyMmqOfRSNuqD
 5YR+/hGA38FCCAlxXROXQNpKd4q08JIyw3Th1rs9vd477/If8Mg3xb5
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-ORIG-GUID: ZfBtljH7zW-RnoRi5nsWGZpeCLZs9Ge4
X-Proofpoint-GUID: ZfBtljH7zW-RnoRi5nsWGZpeCLZs9Ge4
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af54fd3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jVEDQz8d6yieKVSr1KAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyMSBTYWx0ZWRfX2JU4Eaqq+4LF
 XsCUy7RmD75feJZ5/S5fFiif77/IMV9rv/qmJN/up9bIQ9czPeFUxCY/fvJXur9o9WaN2NispcX
 TpKEqvBOdl0x85T7DlOZPZTqpqTQ7X4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyMSBTYWx0ZWRfXyhu6u8YgAO1p
 rVyCkidEKHmP4FmVaBXYSiDwCOkh0O6WUPXAOtuzlnvir3tyx+BSGFj6XODy6iPRkkDfJMemeLW
 JJLA24SPsZwwfq21SPjwLaah1I2RrjLP6sdtKETbG6B5DRJDFpVCJmUGmxSD+IrMpKWUhmtZzCT
 WGqGnlVtVWM7XDKe3dtRsI5dH2BQOJrDWjByOyA6mDDbLugkPJDvo4btB4wxtaR/V7IKApjcxz5
 ICtF9qIgD/9dkJ8IE+eZug4lpysRjBwvIN7w3YjxifH53dVfpxYVJVR0S6my3bpgll0DpzPgS5l
 fQccUMy3xSV2eKkaDdqaZ51iU6mIZG+ZwowNciL4JG+PKcOOlt2SqrwKnMUozNYNNAqiwvbMtzv
 kepOGPpFPwULPOl4nbMGOdCGJrgYJb1T4H3moT3JI4YV9gFME+Ke+7LkX90v72f796gnzMvmK/P
 HmQYfnDxOOXnxa7o99g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120021

The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
connector and the DP PHY, but eliza-mtp lacks the devicetree node for
it. Without a physical path for AUX, every DPCD probe times out and
the display never comes up:

  msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
  msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
  [drm:msm_dp_bridge_detect [msm]] failed to read caps
  [drm:msm_dp_bridge_detect [msm]] aux not connected

Add the wcd_usbss typec-mux node on i2c3, along with its supply and
reset line, and wire its SBU endpoint to a new port on the pmic-glink
connector. This gives the AUX/SBU signals a physical path from the
USB-C connector through the mux to the DP PHY.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb..d848ae77ab85 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -112,6 +120,34 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l7b>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+		};
+	};
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm7550-rpmh-regulators";

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-eliza-wcd-mux-fix-453716a9c1a9

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

