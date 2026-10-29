Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254251;
	b=XCCIT3cN5eR0IypkjpJoYQ6x+ACEZUwlW9ShPkAmO8Taiv4Q2R0kFfsKi3EbJZlWAAuC
	 3ErK9FDR5NE6biOYv11OC/0nwbY95pGFk71+X+O0MBegYOkATH4GeVkyfye6HE96TXZA9
	 MsWGFpjncuSGFbrr+eN407HANb4TuVjX1XznRNFG6M1D+sY5HZKGJ5S3UH59hblILEsJ9
	 Ad0IRBqo5pDTx+xQakMBopwy28ngSGF1p5RcurGWou/lXNdX5iYpoqcw+SX4qNRYeITt3
	 o1uGtsrPj7J9YN5mf68EY8WlDyWBEkmZZ/Adc3q4JtDSthDhwH3v8JEhcaAyFwE0KrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
	b=T4QVLCLTfHX6SPr5ukaV/FxU53wqIDaVleyGpu0UInivCz+JgdNOiK6PXgQdN0jq4Taq
	 7VTS5tD+/gf+HiaDvqc1ITR9KVWeK3LVHBtuIxoRG2cjmtblpMe3+cJH8y5k9M7ovR1J7
	 qpz+UWKJhYj/npqViuc+RBEdqTNMMpGp4sIudQb20z7T7Elm6t7DUMy8Ae9CmOFqxIw44
	 lhqEJMbhXniNkTvxpwNxsEZyYROlm+JKRE8USBc4bE2nskrh587ByMPO5AEls/r8Z+uFq
	 ENhxnSjQcCTRMBQ+AFW9Ly2gM2LkXpb4otyg0ksJS7VA6zoeikV+geykg+DwAVTjYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LbY/wECG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz7VUGyy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A09606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A09606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LbY/wECG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hz7VUGyy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gmsh176790
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=; b=LbY/wECGN1KdvcIi
	nOYfp4s9bizNGS9J8YYIPp3wLTVAK7e4pr4qQlovNW266Kzyh6hnUE0+4B2zmZXK
	4pirrCJLei4UsZP7fBj8r/AjiNioL5Rz+yD5x3mOGo1fTfHvUrwU/l8AaPzepwr8
	3D7Vr17MKc45so0DqI8Du2/FAFXSIRDyKPLflyIMZ2fV4NwyvealP1fITW5liNn5
	NeGtYm3HFL4UcQEIegs9IFTuZBEzPGaTqI71CZRv1KiyYMbT7Arr7whc5hBKjPa7
	PbO79QoUJAuKESXOfKZ7SYbMAthmUNxra0jnD+4mDGTP1GedC2ZmA/YurZGQV2PV
	3zH7DA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehu5vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:10:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3598898eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 23:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254250; x=1793859050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=hz7VUGyyvyXqlFxX9wMnDWWThD38tUAEQ4Tn66zocGOkiJ4yqnEZ2ZfyKbfbvsmHoZ
         C1PsU47rAOhdD8tr6+buJxg8BzXEECeAL8Saacq3weGiupxPbLlHVwzyAPyOAGJMgqde
         khIdAEAKYGoAZz8ZlgGAhhAcqfDMKtLsX9VwiLWnDOp9V6rAI7GO7TCoHPyVflUAIpeN
         gGyF3mgFIgQgecxQJMvGtqxFvsBdSfKXPs0wtfH3KI16f0vpeaYpg/+XWO7TEGw9LXRH
         t/YwbZkkzmoMsAL4nnEebbzv8UipeC85Jxngqk2zKHXDh//ZTOAPjSn6v3Y1UQyJ5Rnh
         rMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254250; x=1793859050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=0eFLliqCR/FVYjkU9mgagf4gzRoeZL6MpOYn1Cws/eYXSkbF7o4Tx4hZDSltvfC/UR
         Qt4BFdW/6v8c66Gl6NV/kqaZDgPCl/w4pqtd97Cns4DPtzC61aEa7m0aGGxuUMprCu8Q
         esfjcEd55t0SAaghi31b5pAGNFh4QkdQGgYoOc41Gno5l3EQVt/Fpe+jEzRKAY42p9ZW
         xPvVl4RXSMde8wU/rux0YdE/PH5+5lmcrnZ4SLl/MRPOY7na+/nsqep4iBB+050pocdX
         N5SR+tU9bl/xwJ2VWq7ArjHFrmR8kL5sMN0o2RMoznkc9RnOxgMKkoJN9xyga9eW5J3i
         WtEA==
X-Forwarded-Encrypted: i=1; AKwUvBwrXTsuEQYibsTtLxPgiJg9ux82rink856+HYJttDPHo+XtemoYyt16Lxa5xYY6kx2OKh+yGFdHII/LHvRG@vger.kernel.org
X-Gm-Message-State: AFq9FYLsK7zrNHx3wyFJ8eNS0b1DQ8dkgMpHnakfnSPkvf22Hku9+GqI
	cFpFWmql+EsJrl6C3loJkzIyhCfh9OLczJEqjZ6WtfEciHKw+C7vA3xow24NJZrwB5S21BIXWTi
	ewVmk5KM/9vxDohLJz7rKR91Jyu5TJ0bhORA8bV7i8W+W8Wm0nPUCaquf8m1WI+sZc3gp
X-Gm-Gg: AYBFou233JJAbrMFXBT1wZlTVs1bj8Fqt+6iUdE0FqsHOFTtm2MCzSIjANcxEGPRXYs
	G5y4mRxHndXZ8aAatLy9MIsSD3A3NqYhOuINjcTjGe3Dg5ASurIQg9uuSD1HBtzxbOKwmYOK3r4
	u/3LeVjQGTafKDps5p0vOzI2Jyk9G5pppbd06k4oSjeG4935hNaVij16o0LLu7BWMnn1Fbs27Wd
	WJVGWJAnSoE+QYSOBKo4lbjaudu8fD+7Q3LDQdGICOBFXwSDDWBM/s7JwB1y2p5LGXt7mjJ+eNr
	RvT3KtBF+AQOrq3JVfnEoznzEOpDnWUNZGycPcOIiiIGq8d6BnjW7fWMjHqc6xud0v7l1KQyMZU
	ANJslG2lRP56iuR/xjaprs8TxGTZqYoudXbORN/AiK8cmVb0eHbEZYdy6o90MEW6SR9wfhRXuz3
	Z8VWB2x0I=
X-Received: by 2002:a05:7301:1a08:b0:36a:dbb:2607 with SMTP id 5a478bee46e88-36a203ba789mr5853257eec.23.1793254249664;
        Wed, 28 Oct 2026 23:10:49 -0700 (PDT)
X-Received: by 2002:a05:7301:1a08:b0:36a:dbb:2607 with SMTP id 5a478bee46e88-36a203ba789mr5853211eec.23.1793254248817;
        Wed, 28 Oct 2026 23:10:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a2e29sm14038935eec.26.2026.10.28.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:10:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:40:16 +0530
Subject: [PATCH v5 1/2] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
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
Message-Id: <20261029-nord-v5-1-1a13c214e89d@oss.qualcomm.com>
References: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
In-Reply-To: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254236; l=1074;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5BpZafnsEX7T5i/WZquEyzAEe3ckLbNCfbpYPY2ev+A=;
 b=9/mtuPRHFjU9hftDlwFyl98mTojHjainBfGm9kDBYc3t+dgIKw/cai9hgOJEcUbaRVe05SckT
 /rPArPfRimAB4bsDcsiBYz8BUs5ieEvmn7qezfChXhAgp3aj7cTw/tm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: -aTqUH0YZjkt3QE4QbJWSUAPN9l7dGOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXywk1/VObnzqv
 e0b2gNA6UtNpktKlBab71KRp8g5kC4pbW62yzE+GY9vCVh3E4XTdVp7O7NV+4hSB3yqbotMNm8G
 alpSBEjfvX/Ryd08zAp4yefMLjHQEkS1gMFBgmUCCGJH/DKdhiqLJ9I+OLxEURy2TqepCqN89yz
 QJd4GqSaaAwP/xZOs6zDqERlzVojFBwdSaD06zbaJ1Q9h3L7exxLggJ4c8Z6Tz2NLXpXe2q2/uN
 egWTZIDtDWZdXqFbC7UUose9uc2lM71gbLDFEivaNeL9mevTtwS9xPwbddpBG/vN0NovUnC2cw0
 H5DsSP374jCoibgM5NgIrg47WH4cJWl1VwF9u/6gu1Z6ATXxm2pKxIL5m/nFSfh5BM33FgaEKG6
 A0C7Z8QOTcnr0ThsFyM6V8Ts1MVvTtfn/hWVyptH5GgDJU9DehQYf4jIIsPj9zICUtP0U4+yxlt
 8KHx8qw/ETxADIDdSVw==
X-Proofpoint-GUID: -aTqUH0YZjkt3QE4QbJWSUAPN9l7dGOj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXw2i2ajRJCTMB
 M3MNB+eqhTQ7QN5coRX9rKLIzljusAzcA+Dmkb5QdREw6E9HldCS+zA8o3M7FwvfTH2+PD78bOc
 wLr9aIJqPb7QpSb8ZbyXVENA/9KslSw=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2e36a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

