Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B724963A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809565; cv=none; b=lwDYxGbzFlrW00EkWlnZqWnwNOozNLbpQ8AEk8Kx/bZs8McWF1LHgIsINJnQqB4GLhkwsF4a8a5mUqec4NsZxscyFD3FEeKJVNvb6Dj1jCAeEXTc0UFa/lOFgt7hYQ8q7nsMbtrbkum0/0XarHdnjF7N0jjakeR4aQEGAUA4p24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809565; c=relaxed/simple;
	bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CetJ4TP56mptWRRMZZwAJoyFc82xZBx1Jo6lxdjaiu/JjCQG24jHBLMg9MVHYaRymrH3yfGK1/Oj7/cK+4WIV6lp3dn0hJrFjJz5f0Say+nt7pXbUvCCUnD6M7XOOthMnZjAboGncdQWqLqzU/LnoXTGKnPKzGpJOn2KlMY/foc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqNqiJjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XymnHxoh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqNqiJjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XymnHxoh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DpoI3567794
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=; b=mqNqiJjZonsfiGmO
	N2xVpAR8osDUem6FdHBM4/GiYUuPmbxTdq6Fy18211lJej7paqf5tsmrSI0Yi3Ot
	g51sMxUUIwdJ8aEbmdRUms0RAB/dhHfZNX4OI5VfXFE8GjAwcqrmfS1DwhV7dsKJ
	RmAoSD2+ivMdQjQj6qRIW/ldJVYVbhOxsbhIAoOAJ+cRVvh+0bpRCd4q7c9yrL4P
	xOaAHAk41YZXfSt/ExMSvzxfX3FT+1Y/0kOPHg8ebFiMA9O+s7G9FP2Ffart18+w
	n4F+GVsOvqcuU9HTsZ3Ch6M546Q+E617GWKUsg+bPBrd7R9gQkLQDAWWvBCn7Hct
	EeMi0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520qf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so17791781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809563; x=1785414363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=XymnHxohbDdzpMIg51LKqhwziYKyUKQu0PM7dR7eBfJDsEcYd/MdiEwspnTLfuIb3w
         FtnLESWy3MIs7y+9cMqTfwwpo1Dzg7rzBq/+AwTujJhv3bsVGZoCeTJXusAZ+ux1IyEB
         Cw7yPZ+GlutnZxZFwbYuVezrMOR0hkePS3mY7N8Z/X7VaZfLm7WwB9OB2iHGp94oOg6J
         sru2mdWYGObw8eqCiGfPYfPyXZZTK/Swn/03t2Q7JGsYUizxXp0RPJ0ALcNCHyGtd3Qi
         OsoYoFjvwj2HlB5QriSJAZdNy3UgE/6fLXoWDN/m+NAxJpv0any3BqCPL5iO2/WP95B2
         vYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809563; x=1785414363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=CE4BRrGtMg111qjJYAw/42q6O2jf875ERAnEhz7tQoC3ypwHfsb/lxAUuo7YqnIlkS
         FhqsRgGx/elJwTJzpIu8bf5GmqmWeyFxAJfB/7yKl7X9Mxw4+4xie7w1mFSAJlZzu+e5
         HSOeZgH+F01URVYyHU+lBOP0gH4c8UML+dIqmPv/+miPyvDDCxEuhhTt+V747fQzHUVY
         uxRhw0rek98euCCx8OAMWY9t0yYVeW/1E0YJu5vG3I6XIrwuaERVB+jNjigXyBijX13P
         5pEqzTDRk3WKBn+ys6nDn0GZQB0YXoFIoc4E6ZrRAuLASt12TMRnnC/r8nmWW8FenL9W
         I5Tg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3a79PtgWR5rdSmqlNZi/Gujo1cIB/PDuFpuCWT3CSi3eBV2s2lqjK/WdK2+p8e8reBXfN3MWmyMAS76hF@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFHg927m4TN2PXaTzvr4Ky79qfI97qnO5m2aMm43iBep8M8p8
	vQLd7stXewjzU+18sbzCLRkHMft+pd3BaBwsysNKd30T9kj7hlkDnyjCnIGnKj2gycxJBDhVcmS
	9qdhoiiE5jlVwIwlnVq41SrjlHuAoCF0Q/UeLirhvABl5Gv5GQlNG7q+Vesd8fNigK31D
X-Gm-Gg: AR+sD13x4X9yehz8dm7NwzDY/VTbWLFK28/75z9eqsYMFTAUnX66D0FIiO5367JnFqL
	UZURHo4EdLFHQz0vPFKhKI+ZOxm2+7XcBflGACrMo2XbHZ5KpUlwFJgw+UJDiiGhRVWNhHH0cwq
	BO0ct/m5k20Ex5/POoqTb3lGsTottK+D3hLgoT3BR6YK9Op3oaYQhH+48IBL2zub0o0eCGcjomQ
	onY232bROfkkvcH8QQZdiT8PGHVXH5HIaFJAeVoJr+uXF2anWPeQIYumGtxjii6bK0641t0qfSc
	H+juX1wIFz1m8IX87XXjw4VY+MmQAfdLXFpOyxTzxxuptAi3+B0AE8zHAJ4QWiiuzliQXlzyMXY
	EqchkIgZ/
X-Received: by 2002:a05:622a:1b22:b0:527:809c:f9cf with SMTP id d75a77b69052e-5283de0a9b7mr23362971cf.21.1784809562390;
        Thu, 23 Jul 2026 05:26:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1b22:b0:527:809c:f9cf with SMTP id d75a77b69052e-5283de0a9b7mr23362661cf.21.1784809561715;
        Thu, 23 Jul 2026 05:26:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15236106f8f.35.2026.07.23.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:26:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:25:50 +0300
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-1-93e17e687384@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYghSCib5sF1WeQwY6Y/Hg+yOgU9XgulybYd4w
 MD/xlHv8BmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamIIUgAKCRAbX0TJAJUV
 VmB9D/4h+Zn7a+zxPgpjhqawZXegajf4cSdZ82p+8HXJNBBubh1GB62C6xD6C3G3oMWzdMx+Bm1
 KDk+ZrfcWaxwZVQGgig4m5bUMFoR0qmeIkyZH5dQkVOOfP18isNaCXRXNAqlMrwsS4wUEVvcCa1
 edL8LJER7Kqb06J30BHedrP6LLGA+/97k9HRs6Pms+pf/G4URgTAasZuEs0jJPHGddWhCnPWuaj
 e82YcjmEq5x7ubWoii8RjRelwukEOULDe2hcYyEwa3qx7rBRLoJ3BqruWzv4+WdmO0g5SRTICZ5
 p9WVKxL8HiH3UtCpo68sEbdKEOfP2zHHW+cPWDnWyY7tLVd4gsWCg7Xh7k/rQUz/g2Z5dufMw8Y
 VSkYttdOCfv6WZTcH8QvAd8Q697kf2WzOJa3hIegNPdoFgT3kDrrvHq/HINg3V6ufFn+kU9cF1o
 v6Jo6codVCwRgDvEttWi6CEPMfboOhZygkFLUVIMAukTzoP/PBR4EM2wLfUhxXgkoKXXV6i5V7M
 /OpMjdfv76T7mgpn6aUHq6YJ9y7ZPQBn85JjpIdabtHGXG3qnxR+J4YthSA65tCzF3o27pW3ap/
 5+Ef9Gn0+XhlMJDgWFwwmXDRT3nE/WpgQDpvC8pcQQ0mtTEA7B5rSp3DfUPCNt8E1QBgKp4I7Kn
 qRSG/0OlFtyMnpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a62085b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX09DeVZ1RwM0i
 VfjTX28GzGIH7Diwy2sdGLCs9YYaIUMEmrwq1lfQsRyPcaztLWLpcMCfk+k/4qoU5+g/A65R6lP
 MZzLu5uW1HIiVrzAshvJmO9LWBYqAtQ=
X-Proofpoint-GUID: I07ti0EwvoHXNHcaKncgRWfbOkBtd4Kv
X-Proofpoint-ORIG-GUID: I07ti0EwvoHXNHcaKncgRWfbOkBtd4Kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfXy3SidiLt8/Xe
 Y/UBqnCLqd4h4SASMED53FSY1d1QYHE8wAqYODDgOsUids8oqROlSVl4yJMdrNisVz2pAvfGh1F
 AiDT9roSMu2sH9TU9Bxaz1Tf7WAOmq7bkz82AakYUPI1eBlhkpDJEWXkmdwtfSI/W8XZNzRT47G
 TEJF82bXlVhygZCgCW+crAm1ANRi/CWH8u/xorFtjReEd/VmWgkYX6suflsPtpeOnV3yCVI0nhW
 Gmyfa1NqbtgzBECgSr0kwZECyWVMrbl6BFPN9hmvOuKKpZdA8WFps8w22TbZeikOlpPm/kzqtLn
 O1FZfg9+L8n1FjIx0xLw90seLtRRa+wYq8QjAYr/PEcGDSkw92gzs3hl03ymQwwo6YO+ThIIOCp
 2i6ojAGGzquWG39AqXCCZSULMAFMaLw9T4CAHzzob+s7d1G55wPH9htJMhvThYcZ/RdiMV4XlsC
 z7rGij+f8j+10HUnrBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230122

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..e38a1d94fbe2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -626,6 +626,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

