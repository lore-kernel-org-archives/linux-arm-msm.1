Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23D8C1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401940; cv=none; b=YKDuZG94U2yNNPZjDcrhspQg+usMbvmbhU9vkIlS15qxANInWZ2p0OJmd36/XSpa2T+hZs1WXXNfOqDvBjV3aA0++jOGMAzfFQ5omeo2yddaLPVrDLBO7mgRaS85Lqww7gcyLnLtAnI4AkUOHXhGquTOWv0lUgO6R3YthNPUcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401940; c=relaxed/simple;
	bh=e+8UUpMKcnPf75LsVbXBo8HtX9Fgl0mPigLSGru5/bA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udIv44qWTqZ2Fd8BhlUjrKA4C3+Vnys08YAieUBaQuMj2Y+MBuh4mG73Rr+NKK9nG5CLYKbZ2pCTEZv6NGjoa7lzImPc73xkUiJGNUY6hVY3t/Yx0FdkX43Xrsv/KKLEBEPHxuhwKQ8Ea/v7Ueomh97TYlJT8Z7lpv3BunkEp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqO9ppiy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ0hGwAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqO9ppiy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ0hGwAF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P239724563
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M16eCydctTBsxx4X2Yc0HeC0QuajReVm95RWjvQ7sNs=; b=mqO9ppiyfnFBXPOH
	8fCdmJOAlWbT/IuRkfFgT0LXN1O4BFSUWo/ZInA0Os92X20CNnTlg2SIYfajjwYC
	jpGXq/4psNhzh091LCtzuKg9RQII+QcV+fhHZeO+bUMHboonR/xojjJkw7KlTDiz
	dGSuQPMYmIw2AI8vpCAeDQnczQ5cIPschIZB4Esr5p0aaCJbeHcoYgnps7HuVfwk
	qNSzkq39UVsoq5EM1CXp9EMcht66NZrAJl4H7HZ2434Qu6MZAiKRQDBmcLGnNBzA
	f+QyH8+jjbCWDrtK6YadPt1/ArOFxMTOfMsqZpkxd3QpIrYZygXoEO2ieGRBE3uO
	b7kcPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gbqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so4837818eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401938; x=1793006738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M16eCydctTBsxx4X2Yc0HeC0QuajReVm95RWjvQ7sNs=;
        b=cQ0hGwAFtvZGz0OMoly9HTrT71yeHTtkVyVpcQfj9j7bkUl8jACmZFTs8mX7mpdJTe
         +9kCtfH8px4Ilvo6VXfJDfd7QzLluQ/AQKmRXdQj2BNvLqOBqfT2gMTTre79UmtFFycz
         3nWDH1CXNgTIq5FEtC4WD9UGebsEgFdsATUyOyTAI0SnOyZZwb2oJgRIcbO/Ul4ei68V
         mQER+k4JP+jFSrGaizW3kBHodf7x4msfFB+TZi52mEVbCww86RqOLPzFwHhbr2xl98eH
         k4WDk1lXYzRABm31Bw+k54vQXe8MmSnSbPN+Y6A1ypmJjnX1cClRTJYybQ3cBFkzNO9R
         sqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401938; x=1793006738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M16eCydctTBsxx4X2Yc0HeC0QuajReVm95RWjvQ7sNs=;
        b=1sl5xnDn0o5JQKKAbbDdMnwZPY20wZY8702fDQS+TOOZryLWLQwo8TFhhybr6GAcFQ
         A1yMbN46uqZXeAxHHsofQ9RfqON1qEiIKLfzDmgmFfREZiOjXR21SZ5cvX+3OHssRAp0
         9zxwzh+SSUwop5DN3ez/yd7kOqReV8YAvBLBinHW3jrxklsGn6wE2u9lqAiSr/CzC5tU
         vK+N1evSPcjvqkt243QAU1xDI/lAQuE6OLRchjYkkBykLoF3xsvQUI93wwKMsKO6ONyA
         kLYmIdg/cbFqfmY9GQVk8yFWPxpGaoHVhEtHydAx14yzv/kjzUKlTrEd9G4aXo0WlUQ8
         IjSg==
X-Gm-Message-State: AFq9FYKsY0G8RBRshixNaMrMWgxHDQatxaQ/5rcKOJX9HctsYKU9LZXr
	mkkpyPJ/rHGg53E+D4vnS1GYzQmyRJtPtTusN6DoR0+55h2+Nc6wIwdB058q+70Mk380F/BSj8g
	tpK1M7dFlxuPcCyxIl2iua7gAxetwEGYcSBH8XHgBmhPGfAqkwIEzCaMsXdyODtBjccGq
X-Gm-Gg: AYBFou3pi1CTjMc8ZFkosWHJIFPc9YjMX6LysQdJ+vLDo8YezayNxC32Q2i5qDdtCNt
	OoAD3eIO3yOWl2izfnsyqB/jNHVF6OJa5LwYrw318D5rPDFH+u7CVRJnM63RpG83ElNwFjOGzgo
	5136+TdrKBCOQY16p2B/3DoKyMfXEIzyHfLjxNsHUcfAiCEHjczvaqVoKvxU3xCU0dRmzTQ/Sh5
	BoaY76K58mH+fDV4OStfUJDU9Lbsgi0xMdd8W8ZomSePSD5wjG/CPao8fBr+AOjgeqrlx1mMg9F
	ZlysNCv1P5RUvn6Gom6Wljgf8/f3eb/5n3/yMilAcVoyUJZSd1Pc3tIrrF6RI7xhUHXAwT6rjfy
	4VpWnti+oZBiIHawiqGsXrZLO9jYKLR72pg==
X-Received: by 2002:a05:7022:e80a:b0:15b:722b:4bfc with SMTP id a92af1059eb24-18513b99f8fmr14119616c88.31.1792401937967;
        Mon, 19 Oct 2026 02:25:37 -0700 (PDT)
X-Received: by 2002:a05:7022:e80a:b0:15b:722b:4bfc with SMTP id a92af1059eb24-18513b99f8fmr14119568c88.31.1792401937362;
        Mon, 19 Oct 2026 02:25:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:10 +0530
Subject: [PATCH v2 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-2-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=1064;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=e+8UUpMKcnPf75LsVbXBo8HtX9Fgl0mPigLSGru5/bA=;
 b=Bs9h4/gScBQ+ICpGxT6UyZSLyD4UgaAYJ7CkTR6oMPjiE5t5vCjr12WRJ+wHfdjNiOmOjiYmf
 Su5PUarPnwEAcBhtsfCOD3YXoKgSnXI14zFwO7v+KrsG9hrk3OHRxkz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXyBxVw73WHXG8
 p1gW+nYc2vqbWdOs/N48bYUGXpQN+/zc87wo7pz9hhEma0G8adxvG+7mr2sZinH8t//PsBXrMev
 XtFNCoUIdhOjgDEew9So2il36FQKvUs=
X-Proofpoint-ORIG-GUID: VNaoI-1VxSU_DGawjckGvJpLinewX6ux
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5e212 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXz1yCoIpL7kv1
 syON3B3ZPr4HfsXg1ZxT6ADEYCBWg2T80OLUvTyzZTh+nAvFDWk8as0t7JsA07PUmaV2PGJ4nO2
 RReGhEpXOD3hN+hi6agJp0BTb81byqxcMoUpeELJAw3rqbaBUCmYvjKPXT5mlcuVlccImoInoyr
 j7VBJZ06Jap4puV7NXLEc2hpwwHMqVSDxADeX3Ep4rtG/w/MMa7Aood/eoJSIsISW5d9tO5nN+2
 9gLX8Mm6dVvhAUE/7JWbEgur5gjhhWFMItd9R1d9UX3s88U7EhupWlS28SHvS5Qc1VZ/hAbFv2J
 G/3xx+RxzHnfO7Zw4VUE8itb9KVKIjWQm3PUYH1zZIabBTbykLyEBXTc3er0xyxYzESVNW7mpJJ
 0VBeX2BDwVtnmDhTxmTc+gy8cNnednCmpxix3ol4EByuFPjyUeL3BciuJL5sMC+9gD7rJElwA3s
 g4JpvWyUSYm+0XzCpzw==
X-Proofpoint-GUID: VNaoI-1VxSU_DGawjckGvJpLinewX6ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..1ed0b97f883c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -17,6 +17,10 @@ properties:
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1

