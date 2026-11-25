Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596147;
	b=vBzohgaRQaBTSZgEOzU7hq0NfIuE6Swu7bsFUqf5Z0zHRqKovGgIlMY8k+t48QamqoGt
	 cvwRrVRyuyrZjxmZpwdTqiBu5d8FsMtwwr/zGYe9giBU+FCHP22ACvOLYbZfySXb6abZy
	 ydA8jbhSMQ9dkYih4MqSVKUfsGHuYJCisntNBuSo2lXLXpkW87nVBF7rdMrheDn2x75i0
	 iO9OjaLfshqyChoq15SfHvE9+PYn4tjLG4TZwqWJt/7vlkZA+XqCNcX+ssx+pDyGGbXdU
	 Jj3gfr6jddAtyLcZ6OHUqgbPvUXKy9KtCeLEs5Ks42zuzq5RrmABfhgDvIExSg9SqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e7HDHkfEFaERbfFKtJdW1zcvY6kQYZ0C1Tsrbx9wAOc=;
	b=VAU77i3dQ6ejDFP4JlsABSBazxqu4yMZx7MsIzxTOOV/ySHX1jkQCl8vzPcubHLtbBjk
	 cbrCHNHQHx6NyY+zW+XcRkHrsugt2mDlV2TtPJJxqTpSrIPU915FS92V49jf4Pw1bMYIA
	 it7s4qcsCZZ9RB0cfTQ6yQ8Uy9kCv75WalK9bS1Fl/BNr+ZPeh3BgMhzWyamnZ6iFCK0s
	 Dwec3JRsTk9mGSSBQ996lWmyK66/luQSHC36ULYo/uCuowhzJyecGMDrjfA4GtUES0ciF
	 nG6tAUUTZDFlBgGECuBr2Yo9/YAPJS+qtMh6DY7FoquadvSH9/9auZszDNsuExRqjcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nApjQyHv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZK0etzbN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F09606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F09606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nApjQyHv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZK0etzbN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68SXN3534094
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e7HDHkfEFaERbfFKtJdW1z
	cvY6kQYZ0C1Tsrbx9wAOc=; b=nApjQyHv4oT9quenBBxIxAKkLHnWQKSUGWcOgy
	70+5rJzsyMIZef2Iow0pmyL7v0pK7fYsfos/HpWxv0RjRzZrHmQrGvUhK3STudC2
	cKrKLOeUmcsGqQ5QL6nIgD+pqzH69Nf9OCMP6SL9S8RUWL86q5i/skwo4+CzwkGK
	C9z2xzKlbFfpkhCuKll+Swfvj9fCfS77kPsh5TZTzf4e24PRAbUtfNOnAe8vuWhV
	DUccSqrGSAtGdEmrfAqPR6FL1yomAcQbS7XMFc+5DR9JzURzl5+ddTwQyWQDeZIV
	CaHUGuTSs2SuTXtks+K707i75rOui/1NJvAVdid4Y8mrZ3iw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhsba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:42:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f02547a462so9633335ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596145; x=1796200945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e7HDHkfEFaERbfFKtJdW1zcvY6kQYZ0C1Tsrbx9wAOc=;
        b=ZK0etzbNwQQ46GnyPAxJbh4Y0W6GFIrA8Km3pjSAhpX5opYkOfuQYahI6SG+NKj9oe
         3IxUhx+/jGA3p2XWJ1XKJJSXWleh6OoinRl3QVW8IIhWA03xp3yxaKfJ5V7RAOup7tQQ
         KTyqpbWX6N1fuFNwV/IFbfvG0SMre9JC1IRYHrDJuuf10MjayitDHCYHma9tEtLngC/t
         7tMBy/90h/BlvGv2817VIg1DXMCAOmWx/NrY6XJlrsZWMpYjll7wDQ00vRWaNOwcalaZ
         a/Q5PPsd5kErCQpQpGnWfUTfAZHqDZGgQ5SCIFIExDKvuKXdNd7lUEFl4lhx8j9fXAAZ
         vNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596145; x=1796200945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e7HDHkfEFaERbfFKtJdW1zcvY6kQYZ0C1Tsrbx9wAOc=;
        b=h+CrnBqTJVTpIsBeJ2NA6+1DcD5jc4RyLzs40vGy0snD6kIoJePHBaXRovxtJYEfub
         LDs0Mclo3TvCLcKRIa3/mrUjJmrE4QMM52j5kStR1aN+SUg7LZQGIWlg0g1vGFUi8wdj
         XjVMENLN8DGYLXLhAId8VCE5C/wH/mRxIEaZAeB/mtkgp5DGh1tindmvwPp7qmTg/BFj
         qQ0IiVSd9ToClFJswRRRcaAPtnR4n/oKFbi2dychusa7hkXeLj9fL/pHyfiFUsNBpfhV
         uaEKaumCtNSmse+b/zZcCaB+gUEl5DJ3+KYKhqhJqeZvOK3mf7c4JZXqTCNPSCxHx5WI
         bvuw==
X-Gm-Message-State: APuU4Z/ESVaOmjhhQqWeaGDBnagW3YxrmFUMtHAvy7g0uMpk3ghhAz2j
	QoYLOp+NtZmawrZrUi/B++0QJNhgH598gGWVfy+LWija7HatGjVgPdaL+3pVahcbCG9kFRTzscf
	Vwfbd8C78mRDEg7XsPDmLWQWCkvTARrAStqXgzLjL90zgGjUCgaf2NvjezHvhpsFX4vDe
X-Gm-Gg: AZFdTZc/EKnLDy6gsSlXpFQQXnAD2pg+z7gf8EO6vbyHFRamG0+UDjqcFOsNg4qx5gp
	wSlqSBctKJPkJ6xzB7a+4qxQHUmkm2Qq+SOUxbhB6yGOETbdJnl67vVN4mZDNhUGSBNVEOXkIaQ
	MVbW0vbCchI9nbvMjWzz3aYBURGjnNDyaVPZRbtsWOgZJfflTM5T2TM44/ONmQ+xdyEEU8hD9Kg
	XRuvdta/QYDW12iUvSNKJPpMD7zkLKFPm4/9MmfJ26Jo9UFNEk+HF14Zb4zQD/gUWB8s5xo8HLB
	h5ke3d2+kVMzrTKzRVkhBxKr4Nb9s8uiHtw1eofbf8vzU6K+mYCsHlLkx/a+Ns9lbN+q0cezwg8
	tXbS810pKNDHXtLT4PY309T5sYWqrDqNbtY/GBYJg9wfD9po9gI0G9/Ir0u1aQZoCn7QB3dBpdW
	8ecJakoGSvWjoWY8NnTTjOzLw+TncJaTUUZ55ICiCHp6h8K2h24eZHs2Qffx3qMH5cOGFF2u3Hi
	x/tCmjfN9vnvbWqq06Qre89FEYHfQ==
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr277187065ad.3.1795596145320;
        Wed, 25 Nov 2026 00:42:25 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr277186845ad.3.1795596144891;
        Wed, 25 Nov 2026 00:42:24 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73406645ad.39.2026.11.25.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:42:24 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:12:03 +0530
Subject: [PATCH] arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB
 Type-C
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
Message-Id: <20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFufBmsC/x3MTQqAIBBA4avIrBNyqIiuEiGSUw2JiYL0Q3dPW
 n6L9x5IFJkSDOKBSJkTH75AVQLmzfiVJNtiwBo7pbCV5Pg2mvKuLafgzCUV9q1ZbN1hQ1C6EGn
 h83+O0/t+RQCI92MAAAA=
X-Change-ID: 20261125-eliza_evk_display-1285afd0624e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596140; l=2278;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=md3a/tWXidSrtndwE/grT/xgj6VRbQKUgkD8FPHLiHs=;
 b=rZ0JlKg/QwlQFNNkOcJB15TZyqaJgQllq5ji8B5n/msQDeGRb/aVzD9joizCD14HESs+CzoQM
 qkMLoCwZjIIBIaZ97pRsc7+TERkil+yOaEODce6RJqSSojpk+zOBRaB
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXw260DbHjpA/G
 8Pgke2ByizZB8y+9lmnjrtB0q2imQLg5TztWLBZrl9weu8Zl5Co6qwGa0r6T1pafmSDPGrEZYdQ
 75o7yR8kkJL0VDugRwbjsrakr1l+/lA=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b069f71 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=csN_B1snO4cipFbdybkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX10s9H1M/efpl
 kD8STclgyIBUTVkpQRQL6YfFqQE5vtIqJ88+I/TMGbvsTOYIp+tiRIPsnXahxdbQ8C234IpDSHl
 nv0izTmHbV/TBTHsO+m8qVLifIkPCAsB3x25YV+DfriXUAZFJCtL3lHOnQaLEKwTXQkQMZw5rt2
 3LBfCCVUu2+2mFgqhXd2robsxSVv0qV8DpTFFN39/OnqkGTeAlBLZaSHDK9smkm8x+UgHaH4YRO
 GMD/letJC63kq3mMON+k7OeDzvV/QA9MdSYZ4nTjlTnQgXMtPiwXv4fugpXf+gQ2MThLzDUCL1+
 YAEfX5NDP9P/2NQR5g4mJLpcSLNwkWhzbdl0P9gDzpf2Tvtg6qF/AqzYEO8IMgtq+cSj5dg+zPK
 7z0BNpw+mUiCj5wjujbcMaWmSuXJ3+bZ2zuZfdH+HOqIe16zyfqVc32LG8z5zqIoSuMUXDdf9+p
 F2UKaqPd9as/Y1JRDrg==
X-Proofpoint-ORIG-GUID: zH6uDFxWGsboEIoda5TykBp4MNIANvUH
X-Proofpoint-GUID: zH6uDFxWGsboEIoda5TykBp4MNIANvUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.

An onsemi FSUSB43L10X on the EVK carrier card routes the DP AUX pair
to the connector. Model it as a gpio-sbu-mux, with enable on TLMM 177,
select on TLMM 178, and L17B as its supply.

Wire the pmic_glink SBU port to the mux and mark it as both a mode and
orientation switch, so AUX follows the cable orientation.

Tested with a DP sink on the Type-C port in both cable orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d..8c663ef6718d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+
+	sbu_mux: sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		vcc-supply = <&vreg_l17b>;
+
+		pinctrl-0 = <&sbu_mux_en_state>, <&sbu_mux_sel_state>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
 			};
 		};
 	};
@@ -491,4 +520,24 @@ m2_w_disable1: m2-w-disable1-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sbu_mux_en_state: sbu-mux-en-state {
+		pins = "gpio177";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sbu_mux_sel_state: sbu-mux-sel-state {
+		pins = "gpio178";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
 };

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-eliza_evk_display-1285afd0624e

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

