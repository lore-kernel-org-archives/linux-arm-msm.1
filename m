Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FC0442FB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789820; cv=none; b=iwIreCMWDwoFJCUdJ+K0qOwhzdKtWpuxP0lEioSXV47n19iXhRH9Q1j9iWIdv/2FnlWXLb1PNAmP+tJzHbcjskEyjuxvu4UR+M6VSTQeKrpGWNF0/UngheQ7pcOv2I1AiYlBhUHF5XRyjtUDQ/RwAWyfnzVn1k/A1kNOc8ZOco0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789820; c=relaxed/simple;
	bh=8osHfmVM/x10707NVXOB5jMsFNtRSzg5BZHUvq1PGuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ValW3aYrbUOcB27PG6/X0kHHBLnPGiz8Ts4dNjwwm6QP7KRoVLUZ3J+R9e0zqEH9AHFBIYp55Ewz+Rtd84yr3gehaxKrFmMuhDk87L4MGiOWhjIXsT5titRKigw+PlVEo0ZXIETwz43cFrRm7oP/Xmwbgghf0T7EpSHzTOTA4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKMEqIZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aK+5QciF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKMEqIZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aK+5QciF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PcAg1787075
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=; b=YKMEqIZmV5dvh6tj
	ork9SaU+Dz7HG2wRT6Ad4sqXHWseWdY9/mRoUmCGwVWfPNucioSV2ZfTqGFnKVS4
	Wv7RBkr6eRxNxmW1AmPix6dsG3Pa5VCVTXtCHB8n96jZaqxd+AJ0+mhW/SLGDP+W
	ii40mwc1FpOXBUqtApJDw+9E7A3vUPBcK8asy6Zie1wKHH95XDEc3JGiyIdLdxSa
	INV5fwFfxtbZ3M0Wx8CWf86YguiVcMDhmrIeCJxWnpaTY2/zAtvE2pEsHoB1HVpO
	JMlIgPVO4NSxnJVXqMUQK44etEoaBCGdkDQ9z08LDmvee8E4pnkl/et50CryUzzI
	YT5/mg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rgjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a0c25def6so1713638eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789817; x=1792394617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=;
        b=aK+5QciFBSX9846G0iU4l0+385WBd9caftbKc2Q6HEr6xAZPmcuyiWwC7eeFpkKXVi
         PrXZ41s0TGBSl5O7FTx4TbLtE8JQi/n9S/EJCbMsE+FhxiTvYuJFfircugp8v2J84ltd
         3/4jzbziQ1dBICvHnXAi8bLjAkwsQRwaeJfHYdWJLrPMdnd93+Sya10rHPD59vcHdCa7
         yP16qT+J3gf+6MCRNiyrfgVgI2QYPan0bu+74PzJynZa0reNEiZK8zE/X6CfnzR1OtqE
         2xtj83oy2OY6V3dJ5t3vmpO21ZbFFuTICy8IxOObsiv5b88X/LtGpB61kuBo7RG3B5Oo
         ikgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789817; x=1792394617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=;
        b=wE8sKwc2cAok0tvr5juwKD3quoai2F33yKO3pgV1DteGAqMPEIYIakIkyWJ3vjb3p0
         LP1nms1aGZfMtMMT/3khppjtIhi6KXUbkzxzWYw2oChAwk5AKDrxc8bL7VHKoueFG5Zy
         PTjWFAiXRTyn8+jj3Lp8LiCHPfyJOc/2AkJuJuKiKjV3dhMU7XVZn25BnpjpW0hM9UCj
         eMJ+peN7nt5be/DfuFIiq7Outr/RUdRMJnY+OsCMxjG3eprhzkK078cLE3wpdJxmCNak
         LksvZ1sNmTOK1dPVmGRAnP4cOPSytMpMfV7ARty9jlSDslxMFJkuSrk+3q/OtW56PiFu
         R4DA==
X-Gm-Message-State: AFq9FYITk2GSphlrpb/2UVgM68cI0RPWBujx/1/DXPUfwPleNsTjmFKu
	yDd1SDGLUQZ58EyI7ENa+kRee3uIzOxpK5CSmcuzJu/GWAdvDa/55kB5CTA48eZBRQpuyPJWhvu
	13MbSY4GGsrTO2CTV207YmYkL8pB2f0skJR/E0ciCbLqJxIH/aqkWg6Fjw9oi87FgTGWK
X-Gm-Gg: AYBFou2sb/+SwTRmfGJ4eujNdM796AMkha1TJJGPreQPRrPg/gOC5Z8Tef6MpIqdRLS
	DU7wWYfkHUpVMxgCjn+nCsblC+vymkty8OyVbAJrSM8M3cfg/ZDNlk4oi8ExzDcRg6tdJNxej98
	Q7Fq+TY7SnCNxH6NEuHW2RyJ/j4Px1/24+OhaMpGt+B2KXg7ZJS2X0+Oznuj3WKV1x4j/vNUi1p
	txLHtBdmr3dzUucISPtAZBWlHj5ew5gMGBGPBn7bN4pNe2v7us0B/a2SD2dB/mbNKqYipfBeqjO
	jXEBCypvt+3JP5cWW7XGuhOUcJoUj0v3EXSh8FHqSRHC7VvmV198s1tXxpsof8Tj+zcwWiDH8yJ
	6dWguLBqQuC6Y8B3J9U4bAuEiVpRevhDt5e7+6sSAqypdFRYe5cI/X5kefqoxlMT942FwABefoA
	/ABPkAQF5ezAXwKoo8PGu6Druauc6v
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr11555460c88.18.1791789817087;
        Mon, 12 Oct 2026 00:23:37 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr11555429c88.18.1791789816486;
        Mon, 12 Oct 2026 00:23:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:07 +0530
Subject: [PATCH v7 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: QsPMKU3V9tznYdxgmyh49eRKQldylpQl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX48dCxN3FtyNY
 kticzw5bLzNcLbB8uCIDezSGPKgtnb8uIiXZ2j5T6yGzGhTdL7GzeMSEj0JkVwJz72VsKgZVtOv
 a42MOKqpfB8ngMdm9XrAS+y+mo9sdyU=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc8afa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: QsPMKU3V9tznYdxgmyh49eRKQldylpQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3u4Oc2urM/ud
 wWR3ae+gHeYC6UbueMInjk3Aj2n4MCPkKCsZ71gi1fnk3R71wiJW9CSqf3T4EFgYmF1JuWu4M2F
 oGWzBfps1Cmfla7z0tIDYilhcPVLJYFRzq9h9xdoevS+tPmPmwhqGWfl6iraU63VM2vW4qmauYy
 h2i8FPZkZJoHn/xfIQGzDzMQzL6yrw8vxuBoVGweQkK7O0erxRUIx49xPTs8hFRR9QOAxlkZFJ5
 ync6yt5AguwHPUyfQy4ELgLO3zQUDg5eq9cLBeYM1sO529X830rgDZVvkkrORClR3nBwH8FElKt
 U4aY/gP49JRYX6pLdgOjAk5uRevFHoJ24PnjQN7j8142wjAANPM2et6SPsOFtxhiM9PwnejhHrM
 uWQcy3BZ3SkBULJznLMcaikkQLN7zuwdPNLmEKQkpsgA7cBXRWlAlLeuWSRvvRjMTeAeNfGiyO5
 OYsrL+RARF3kWLpyP0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index c14b42c22616..910196a23ca7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -392,6 +393,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

