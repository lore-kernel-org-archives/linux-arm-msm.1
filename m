Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690826F2A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647955; cv=none; b=OXizalG236wF1Qd+Vw35W9zjO5BA0FEQVc53YzrULB1jIC6C7za2tm+lZFWqipjKWJytA1zAB8I8qA1pbgIQHGAPg0I6UhOccRYpPypfgLCx9So4kcNFKYXppRNBubWU22gvGEGFqVrG9Mhh4y750lrqw0ZHTS2dbUAGXtIDR3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647955; c=relaxed/simple;
	bh=wsoL4nEIAJ6nsrtXPaie/LR99cvgCumfdGmB+Anekls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dc/xrT4LMI9EJp1ygNdSAsn83iO4gy4uA0vl2QjBkdZBn/hbrxC0GysDFNZDkKOszB0lg2UM/yZAqQ1IXU5utSCGdVVPZtjHM9zHSOmt91xRdSHE51cWByVL5R5ATm1jvHSy2yW22aNJuBK8Svc4kbyVwjcKIZzS61o8I8gHN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paBXPwL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpsBgMGW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paBXPwL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpsBgMGW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZnBC1258882
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=; b=paBXPwL9/a0RPdKj
	lW1jgzSkPzaI6TFud3AgM57NbU1BIZgpXCBkMBgKJ/Mq+TJKY83XZ4fVzifNKE47
	pNSj4WtQI5f+1zHyxAm5vWYT5xfoVOjGTFnWt+0f7/8mdW7cOVOfe67eTmmS0QlB
	cu0chgfnT6u71l9keMKJ/2aDyrwar0ehivbEeWMujDgW6/QFC8jhtA31q6I48hyq
	lGzwMWdz/UpYLFyCvigAMxEZYBsO7rc/tS2bdTkb4ENjg56g2avnVHa+UDhoKPrU
	D3MB9/hx1iLFVlHzzuG4dOM1TWb6lZuXFZMVgswugK6NH6VAgfsdFxh2i4pvq1Pr
	6o6m4w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgq8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1126036a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647942; x=1790252742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=;
        b=TpsBgMGWfyLbeF4+w764XZjEnxwYPPJfLAYXCLZsdPi5GbDA+c1i1+S2xkckIzyp/1
         65YavDJjC7a6s8lMNhGwUzqKHk2w+K05YaUjSRGQ2Fd0zy8wYsDr1NJn7lCf/CxV1mdD
         9D93m4GT7hQrZhJHRrqMDQRLs3U0dHnJBccJE5FvjKlPd5Mk23GpZSZf3KgWHDPNm1CV
         dlRdVwNb2Rm8L+T0wdUDA+jmiP1F2khfCdbUHTRqe94xrAO5XebeR8cMd7KI+zOjIr6w
         YoP7HXRUeha1UA1D6Xr+Au2KZ6MuwKxuRuO4hVsp2x/ZM9X6DBSVeHkfC3It2eci7OUH
         y46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647942; x=1790252742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=;
        b=wD4uEgKbnAd+Iwv+mfc1gDtSM/lgxmFd/xZB2f/Fh82bzT2gc1NzEjXx8lnGzp+p1y
         kFBRGPlu1KYqsIK4NbsWypuLQn+dDSN/aLYCnLumdaQoYGTle3Fyt4CkcE0zqBhDvLpv
         1smFU/b0G5o2gF+NmNtUX6u5Zw8lzidSwBItfUI766lyk9BBGZrViVHi8t6loD7vc9Vj
         OqTXYSrnZZ0Hp2Gvg69U7NxUoqJHZ5K6d6HWtxx6JOLSsFHaCMj+ubUS+phRExbrP2h6
         zC3juoAXrGwMTkHe4PQXl/IKg/5EOsx+hUEOHLPoXOTVo4MQks/yXsT11PYMnL3pMu6i
         xnCw==
X-Gm-Message-State: AFuF++mC8cRdxstflsnOJlX8T1VgMPX3hYHAcEXYSSSgQRvX8nVvHaVC
	UiLPCLLFduu1suXBqdGyjZU52675Ffj5Pmn+FZRY5kBO87BNV11RsmwAXhFzSLyOjRFD9Zhocoo
	yYc35JrPZnkOa/Nq9wu55/Z57Q4cXPvJMWUfkUFFvhPLOJOd39UVKbzSig8ikD4BgAIl/
X-Gm-Gg: AYBFou3dBLbGeYON1/JnpZMId5zPHSROvxJHJ0yACRlUN/EiS/irGjNrx9p87oo9aJk
	BCP0huzC3Ftcr3UVnHcp76sTU37fc4G2WvNI6o7t+xUx9LhWILw/F9kRM1pO3s9EqnzeWuelOzX
	VzHbPFxKIqoAvHVmV7CS1NXmSeYKwUtq8aTmYi2EzYBV/ilwqSMEyES2sCMTbK173BgylzaMT0y
	jV+Rq+eVcUvYku6xypaodz8uvjoVSX98BSsUV/5FXk3Z6HLLOluwqW9ciuaGXWcQw/36DDd+q7N
	VgElid+P6RLOGJJ4XwY+3eycUqodxkNcSnJl0lhxxa2R8oxVWWu2qiSJL6xf7PSj9qyl1gKPG+q
	fNrjLhtJf0mV7EDTxfB5PnKZeatG9WdXTvq4=
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr14729509a91.17.1789647942201;
        Thu, 17 Sep 2026 05:25:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr14729442a91.17.1789647941627;
        Thu, 17 Sep 2026 05:25:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:16 +0530
Subject: [PATCH v2 02/15] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1566;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wsoL4nEIAJ6nsrtXPaie/LR99cvgCumfdGmB+Anekls=;
 b=AXq3bfs/uk8yxo7y5nQmGz7DDL9JgJguq2IRhZYy1U6hAAjlJbJ0yniLEOCGJYPGUem5bNJ9j
 OkGSJ39yxWoADMgx361Ma06KZdtuOHQuiBt1+xH39E22bdECDV76Zk4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX/7xn52CRLGsS
 xbRP0bHqFFrRjY8cK26WQVfiCjaDtawBIsUGqb7NcxnIoAuB7D5EobC8jwYSBxzCvoZV+4zOuOW
 KbRYzS6LRuIpWpIToLwxkh28kcyWv6y9Y5BtF4FxZoxrApigzRX/gqiS4qqF9qJY7HVXOCbZ5+C
 p+aW8XMAEiqXqN0/OUOptUYfnnDrGEJ9ucHVeD+VXvBEVcrZEo6n1DtP5ViFPBxeWYV3s5ZFf5y
 jrLaO4rDCKP20vs7i82Anzdx5nY6KHsU4qVeijJHjXIPv/HGOOh7U3PNhvsarfc1+UUyG0RpB7M
 MB9kRy2H/ZQTsmY5ZDvQxQToZVWH5I+JzJCbSyZ/n0msYjfRTvECws2R1YWwA+iiYX+bQZOeBFv
 Cvr1G03Oc4pFydJ2WSabxboEFa0gwwzSzYoOgz2v5A0OCdp4S0OFxt1Xj7IEnr1llG5HFvkbSnH
 Lph8/3+1ZAqGaE2aRgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX7VFm8G/Fy5uw
 Td6pp8bEQ0QPy7FGifFHlUuEQOHBvaVlOUHLmc+uezeM4PZCCeKqQGXJA6l4BPPvkHGgf92lvvp
 0FFfO+FOtZ3iHGRMYZ+Ud0yTqUmRuWk=
X-Proofpoint-GUID: R8KsA1SL8tMzVBS966TF3pKwCeyIqP9E
X-Proofpoint-ORIG-GUID: R8KsA1SL8tMzVBS966TF3pKwCeyIqP9E
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabdc47 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5038d0009c1a..bd8b69e323e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,13 +967,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
 			pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

