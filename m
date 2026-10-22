Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670235;
	b=uL9HFVxaddG9BNMms4Jvj4F48xbyYPbFc5OrLss5ilIL92jTbT/uiiR3DvXT9t271HDj
	 NRNgVJE+pd6IJy9J5zZ2X+Z8dQR3eFKUanvKN0/gkMzWKVnnYoEBNvHz6KlEQOIWT3JV7
	 6/I3eKdICnkVtx03Jy+tetxkHcbvYaft1KupohLlyxk+X/gCXkqn+ePwgbzOSWdRpCCJw
	 FWFGi8wJTQlRSNC7jm+YPc6jDON9SEDnvb78sezifIYbpnEbb2eYoWKq+SYRYfoCnpoYY
	 iAtDbXG1a4xDHsTVpnLHySYkA60WfeQWtmkmcPuw7ZLnrieHbv5KP19x4AkLRYLrGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
	b=FEoXqc3O1nJy7/Apobr00Sy5EkJGayELS1fmm5lM23yYmg7u/qFAHyZWPAFx9ckahugZ
	 lFlGkPxYL3wfB8DiM8Ls8vSUAv7i8DxCu0LN3jHqikl7DLWRlIoZQSE/rH2hHsdn5ZCoO
	 yY9Y3oEkRuooYO72Zzg/ZrNhvm7cNLoPzIwfhfr3b4J4HzCVg6e+YIYUPOp1BOd75iPRv
	 AOXrkS0E1EZfogOvBW/E5QcOHxUKle4wJnqU7jz6gTchQ+wCyMN0TdjtOu27MyId7QO2x
	 0MRp8bGFBB8ql42m0JaFUqowZ+IPv0nTyZRGZWojFDsErosUsqW0opOkht4hpKTvVPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDfUdMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuXCzIeF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577E606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A577E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDfUdMD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuXCzIeF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA07Ne3427109
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=; b=RTDfUdMDYIJpOVU/
	LuSA8ohkpGW1wxiLOWMK7mgD3qs4PK7KkkM0htvf8iNzhlrCRYvsycaksRuSqBK3
	i8kN0RnL1zd0A345THiSss7c0aR+UMCd0WHXeWS55DFd7Q+nIVTN6Bs22kfHMn+w
	WZPPgKs1O0wf1LzSPko3A9cbQpFJsws81Y0MG9ZrUvF0cZtK4D5FXyy1AGUZh30Z
	5kb70XBwqips1e4UxJF9WKunutQ0uBpe4D5cTzvHjATIHfwhqj5Mz+/X2oKryVHz
	LVBlP/JKYuZrtrVcMgFsNtZ8yYNBMzPQqio7oQpIIIHGbky3GUTDQ3a73ZpkB4Ly
	F7ttgg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq1mde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-193b5eb133eso668813c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670233; x=1793275033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
        b=XuXCzIeFVJs/+8JCS3sHZb9aqIFI3TNt4ckou0D46cc1j6DY0oDnRu1G28/wl5ZMvX
         VF8MK6E/Rj+d8hlqKf4ShSjH1xRpd9pRfikA7rfIoqr/I74+Ees1muJRb3+RYwf8hqSW
         2sM4eqJLQAQsjv4bd2QKMuxLpQeC/zsg2RGvW61H84J7O6rD1/MGOD6SoMrJnlQgzSVB
         XYeoeqq/hh7InUK0zUUbAJs9c6ZQ6UJwEhKisb3Tj18jQqTbEub6Cd7CRlbNNZPYJ4Xg
         +CQg/JFZbaN73X/4kJUVbDNJ1PW4joe4jiYK0UiUNP8xNFhZAXYoVpRI2y9jzFuwxrvz
         NEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670233; x=1793275033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
        b=Ludhs1Q2SZqRUZ85drYJNpjcEn++2ZxFaLZz7MC48OZKCXVvDOt+639QvO/hlZoQmd
         o9N77kdVNdux7DJ9JeH+Zjd8cLWC68vOiH30IViA2yfuKdSY4O+nvavfkEceSAxQmcA2
         ZX8Fq6bphBFHrdf+xXk1uEKVWJI2JUu//htgXe+vaW9/ZagserNYToJdAsefIeCK2cGR
         Qwll43dbilwLeMOqCf2o+Xwjk7EvUfoxM2MIkJAw+2CyGY1e04svlMwV/OpT4jlmnYo5
         vmOOjADzHtPTWD+9jdGPWljQZX6FoLLotrE9bPfBHXfj5wbEzK/9eaX+qUP3xXuKKqSJ
         noQg==
X-Gm-Message-State: AFq9FYK2bijygMccaSCsh7NKVjLKP4j5ihKFELdcC9/NqipC9DmzzEqD
	OUq6ywwvom/2xXTR1yVzJk4Y+LKUI6ojpXmenq4jlAl6h4cGYtjdiroVkn1itBM0I6Gbc0eQsFF
	kWTf3ZDR1FyF6nkb/3O2X/febQv7cYlXlhdlOcNvSlA8gL2OwED30HBEsXP3LiC0SdVe2
X-Gm-Gg: AYBFou3EB2pJOurFNc+rrkfsUPiEpHKQKECFvJw7K5z5iBOV9pcc7DDbD5+rwgy6fVB
	g7zTRhKZxH+OVplcU6nUiIdQxXBGdujOHqT5QwkoYzoAK48N1YpHitPUAtRxjCI7uWKm3iwINdU
	Ki19p1tZvEBHCP3908O/UDYphWJ27cYpileP5w1ziS6fMJZdX6pCbyuJF65ZHqsqJVOtavQlulb
	gTRKrY5gVsuQ91qv0e58mi0F61pMbKvbYoHYrz97JHz24Z3uPHXyuPuGf7FnWf/aRT/sluenI8v
	7F2WGBoKxyEiOdrx7nYrytd/0yt6PuToC1chNHIwHnT/RIldx6yApAraVUykuF/Kue77HVrUrnu
	0KURwqN9htTmob2QLnchdmcBTRR/WeB5KrOc=
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id a92af1059eb24-190a0612732mr9083365c88.2.1792670232757;
        Thu, 22 Oct 2026 04:57:12 -0700 (PDT)
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id a92af1059eb24-190a0612732mr9083313c88.2.1792670232128;
        Thu, 22 Oct 2026 04:57:12 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:11 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:01 +0530
Subject: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
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
Message-Id: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9fa19 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dPIVYjRPlg6xE4C8lnEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 0m_BWqQxptjdvK_oOTsHHuUx7ZxtByUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX0oIRFVh+pqK/
 CMuNXM/bnY9MC+ecJXHsaflY2bgqzgKEkD7c++AB6J7k16HhM1FFHC18k+s13kX8qjVLVcuXaMv
 66n7SZB6NG7xTC1TDmne54rIXW15ea+1pgmZvjiNzyHgip36INrgXEqhVPcT0HO+Z7SZZZnYwPG
 DlE2pIdyL51C9LyPD6+vbAZa28QrcaCZxJtNrtQ6aP+XYCHQf6XExIVr6+Ddf1AZ2/B9SpeZMSj
 aRzFpR60A1CJgKK7Uzune3bn4T3ugfTxo65C/qAcbAL+fDZdE2wmnSV+7T84w7BEhqECrgkVNJ3
 zXw+L0g5wiURWLbtfaYbe+XhtWLvIBt02kBKYrXHE8VR0tfLm+TYd62fBrKigNBlZaRWUPoKQ1E
 w+a5dxONQG898KyHFbiyE+hdKWRhIA==
X-Proofpoint-ORIG-GUID: 0m_BWqQxptjdvK_oOTsHHuUx7ZxtByUD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX3/qZmBYteQyJ
 akvd0v1i1qFK9Y5gtMjMPlC+iclC4/0U1ksbVA9QtQVA1Jpl65EsIfhqvUrpyCbg41pO2wTyTdd
 kUkmbYuDV3L2ZB0dCZMQEs4fiRIc3t8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220047

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Move the SoCCP compatible to nord-embedded.dtsi to fix binding
errors reported for the Ride board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 10 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 56 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..11317eb45e57 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -430,6 +430,16 @@ &remoteproc_cdsp3 {
 			     "nsp";
 };
 
+&remoteproc_soccp {
+	compatible = "qcom,nord-soccp-pas";
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..441bfb003f77 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		smp2p_soccp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_soccp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1587,6 +1609,40 @@ uart13: serial@a98000 {
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			memory-region = <&soccp_mem>;
+
+			qcom,smem-states = <&smp2p_soccp_out 0>,
+					   <&smp2p_soccp_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";

-- 
2.43.0

