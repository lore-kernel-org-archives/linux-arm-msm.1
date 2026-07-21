Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11BC3BADA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622366; cv=none; b=lDpwtgtjxdtO1pKXYnmE+lJbxf0aFsD8jk0BKo5VsfCCf8VR13ehbpwlajL/w1LuJqs/uNUHgphZdWjEhT/Yo/OoftOBRKQaoysDNeW+t1efWqVW2Y7W2PXUJamMYB/eW8kv7qhWohU3jWrp2zsTrujB0cVnOJg4H+AI3mev8Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622366; c=relaxed/simple;
	bh=PuuE9E7ZvzP87W76cdczRVwR0uCaeNPsgy33spbpPBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btrla38rtFfjOrHe9Qm0sv0QAazOtGJOObEp/HfuSFQvtjr6MAn90rNuvuo0iwD/8ltq73fvdugc8TCwp+sVBfqodcwSq7NSNOJh8FUa64nd45mWEBqu1FWZQ+4fgS8dTCS8BPfwH7v8zyXSqoB5dwcsUbUC+FEgPPEyXSVx4Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lotaO8yf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4aTMEWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lotaO8yf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4aTMEWC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6GQ6G3980888
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/taegp0L/e9Hk2Fw5ohqL7ginUxJjHRE5690Rptan8=; b=lotaO8yf4VHSUgfX
	MDn+92yDcri/flBxMebLbmD0Oxo7gzuLGdAmO42zL421rlDOCuixqiZLxccQb5aR
	MbNIkSkJSuLZxVjQigEysEwLvv+CQQno7/+hBlUMjb70JtrVNMNHHl49oqHNG7vm
	E/pCC7zi6K4fE1jEfRK5X0nfk6iLw4PYC4fOXpfrWMkvGg7pYaMO5vYhW0ncpgol
	p/quGU7eOdCODIw0t4IOHwuQIHzbuKS921kK+nH+KaVytGfxrEogBjj5DHvjc51m
	ddf0Epe3LDXApXG3Pl8iFu/NMMvmHOz4aPReQB3/Z5hNAFCYehrwCSqi9AdWNsfm
	obG1og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv4390j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a87ef9713so67015201cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622363; x=1785227163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/taegp0L/e9Hk2Fw5ohqL7ginUxJjHRE5690Rptan8=;
        b=E4aTMEWCMKxcUcyvBX+fhAXY520uc1n4DMfePDnAEzmBWXLWT55n3hPR3op5Wl86Xx
         xygvhIK3K3vK5+m6wmh0osy5Yikh/CNNJZNQaH+cIy6IbTDrlEAikd8h333oeEPNJ7iz
         2XS0sQ75FW8GcbbEHPqnQNWYzsrRU7cDcvxkJPSbsTdqFyCnSnmCqctTHRyxn0CeFVYS
         XNQVfd6jcmhLPqDGqbTGugfm4ltcf0nFW3+YQ15liYshFX3a7Plf05TO/omcwEnI7F9X
         jAdKNt8lfvTtCv+/pBa5tNFxXRok1ggPf3Fq35Ht224m97hTZXSAZpbAT+fdTRMn93BC
         WAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622363; x=1785227163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/taegp0L/e9Hk2Fw5ohqL7ginUxJjHRE5690Rptan8=;
        b=g6XglDsArxTZA1iuFUhn1rRG8TyvM60oiuTjz+wKfGHWqzUxQlmdDTSY926yApP90D
         U+BaYfgzR809wRXZyliHKtKHxtumV5vJSIAdlLncHFfB7mEWhiyHP3QGyJENPe4thbVH
         Hf8yVT6K2uTvpxCgOBS5OD7CflLvOKZovZ8xUkvMAschlXqo8SyVABg4JJkx9y/Gwivn
         qPDOYXuVB8bAvuvmGaG/pxnnNMhiPmf5PnqdM4MEmtcSkVhLTyV3YA3RhiB3vY0EnXuT
         sg4pRTu/3/X3gCok5L/I4F6kd5hDDCtqQ2zPUurTqsEqxJKzE8LLp4s99Ny18mdapBJV
         5vxQ==
X-Gm-Message-State: AOJu0YzKAh6OIkOfy4F5pPzB05IjkRVtF/oAymQX60pNeU17WGnA3TVv
	5AtyYJZS0j6eKPlEqXYrw8GxvN6hH4L2vAw9fRy1SHPWKwylFV7QNDUHmMgFxy4Z61JmV1zgVgd
	N5HK/RFDQeUWVe0Js8jiLRn6au4sNzuJC/Sl7HrkO9MGtpRVbjZDGJFPHQfoSugTDO+wm
X-Gm-Gg: AfdE7cl9WKec1HIJJH1gA0E6w2W4jk+t8g9Si6+E12pzKqQLczcuPop+j64AqQLk3fJ
	XbTbHVVue7MtV98GGDqKaKK8B9ZDwGI6CIM4TQUDI+tF8lYAwGT351lg4OPKCXHvhPoFycHriOv
	xA+5qDj78//0JD07Z0b2SeLzs+W64t1+7noB1HIS9xw9ZqhGo+VXFDDooXiYdA6ncvXYmTeT/sj
	1RPKwfQ1C6JpT3EAtJjfvsPJ3eagqYZ+lWz4D0UZcuF+yrvcQh0dS8CmxB5ycWbPpR+J2NzUDhe
	wM/kNGiAxjR0lJYqyqBsmlX1Q9mvma01JfbAMHBUnI0OODXf78eQXzWYlFLEWlkcuonPar70bYl
	Grz/1gHV1
X-Received: by 2002:a05:622a:8cd:b0:517:91e5:1086 with SMTP id d75a77b69052e-51fc1f564b1mr194705691cf.38.1784622363023;
        Tue, 21 Jul 2026 01:26:03 -0700 (PDT)
X-Received: by 2002:a05:622a:8cd:b0:517:91e5:1086 with SMTP id d75a77b69052e-51fc1f564b1mr194705391cf.38.1784622362324;
        Tue, 21 Jul 2026 01:26:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:26:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:25:48 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2598;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PuuE9E7ZvzP87W76cdczRVwR0uCaeNPsgy33spbpPBo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0TfVRyBWZmqQwKQ/c37dFNP1SENnNBxPWL/
 LNIaXaEKx6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tEwAKCRAbX0TJAJUV
 VvkcD/4z7qRlco5ln84ERsQAb4xRelmyj5qNEJBEWeNUpPdS3nYCHefaED3/52G9vi5tIzXbe3k
 P8CT2PFi+6lNtE/QwkkRwBc2+xWuCj9FGiIo66rFmYEz206oSeh7/gb7m0+QYx9uV2zDRJDP+Ga
 BT4tUKZKYbYpOlPPpD/sfWEeCncCwzYs5ZhfHqckVeOfuWERBjpHg/AQjHpTTrs4KijOY9vxrv5
 Ln1XJqU/zz0yGChzDXKqeBSvAoDAlOhSzCVkEmERIvuXxi7Ro3HEbEI3J64vn7WkHP+VAZ8dTo5
 Tx8MZCh1L7umC6liSVmE6YDxmbYvf5BT7rMQZRX9LMv+hE30jDPBN1ROVYerddzz4JxvbdHtkR3
 IVUf+0mcpPCQ+IKsRgTsn+U3KUpFEyNLQnVRgh0lHaxg0zlUf+zegvvU8hBge+bovihi0r7bzhw
 5A4Yb9T9aY1eDVRModtTlKYDKdFuZpHXANqHbMC/C2VcvDlFnvYhvKHgdaYcJoBDZvXnyrQcpY3
 K8HHPJxLLlg5ml9VK4KCYP7RMAv9WCPzgkaMqegUeuK6C42Zrkk2iJz0jX5cvJ/U+6b3oV0jA1f
 akOyGS9v8hBwFxPCTG6g2Ue/plqkq1Ot1icpqchIf8e3dZv8bgl69DmcgsoYAiPFNUfi5dy4+lR
 z4pFazAtzxjxrBg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: U62_IV9bp2qUejg96HYZEfwBHTAhT-rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX0yKGlpB2o9bZ
 ehIKDZPvlprPwkvan7x5oxRWlZOHCezU3LNDxJ208ufeHI7wW7UMybqnr9oD39TNiJn0dFmDIAt
 Sldve7jvDyk9J+fNaxD2cMYtXiFl/b3pNBBlqklCGzu/HsrVrd263f1fksdJkqf9WCqfq9Oqq/1
 fS3IVxSo3AlmTwLWv3BmJfzW45qiVOCr6ARqpYSBScUfl8YukOVfEMFvo/8vz3Qr3+7PaNDzYhX
 U83dsIpxQbwJ+G9nEL9R459D5D9ij7ZhHQCO2psPCQE6TenOPNk67jIvHxL+/S0uMPkG0LV5e/Z
 rDgq6I+FJzAHam0UFQfc3Sub4p9PvdmSV3wjGjHlekKof1MvxOEpzLzxmTHKHYnzfsbMzRqi1by
 iGQ9F7E11rsR8qB7UnEIjhMManCJUrpjnghHKCPJ90Y+1oSUZ7zIS6YRM8j+egUN+SLdjErf1Ix
 SwRTQLA9XwrAd8cN6FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX1fDV5G5dY/u/
 KJ4mwcdCAOY7M1JsXTrnkYZ/m66+98S2FYquM0iKX3UyDMZA5yVwKeP9TDVWzSThPCajp+bDHU8
 ggdEPtm+61MbmpLvjqGkc7lFTKNXavQ=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f2d1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ka7fFnpjcXfis0az0GAA:9 a=xoDkV7_e_mntWQL1:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: U62_IV9bp2qUejg96HYZEfwBHTAhT-rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087

Describe the CDSP remoteproc along with the related SMP2P.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..0c6fdfc5a4cc 100644
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
 
@@ -3737,6 +3761,46 @@ nsp_noc: interconnect@320c0000 {
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
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

