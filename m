Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590694;
	b=Fc9zv2NdofkPAGXiXuNXEy2eVCXzerBA/Q8y8TP9D/u0qeBZBJKH+zL79Srfpip7B6XG
	 KAi5DyZ5afwizy2FP7hBL+7SzrFEIOE16UTNKWewj0wqiDHYMpylciFN8zGoDHMGRbx0e
	 u9f/uBpaVOZo6BfVgJN68229oHilg7mZV9m22ZdQ7/3YLROwso3VCkPOwAfRtm95LZjVc
	 5WFgyuPbMTugxRS992lQuF/wribyWPIYjvt9gLHYSd3O8utzMb4Wz2e6Ae+q25AWVI27u
	 LIwFZNLg6c3nRLvy/JXrn+NTXYPaUwsHeajJp/ETpM8t+73YlpEvjnBg8yZiVd8ZSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
	b=t5XMomxwKvl6WfOXOqs7j5QR+5kljXFLw+F2/fVQvrdYzQnYLrPJXZ04oBMFyRNmJN4U
	 ooFPTj6ykmy54StGtN6MVG/kus/nbO4od8PM3TIq2Y/pqnezBXcUaY2xxZfG0YZJ43ND0
	 w9s+sztWWBz0LJfDGiMG/Gn7iyoIMqnC2lkqpbJI2Q1H+T+UocpKrGZ7g927Is0oz+tEv
	 BvMU8vFsbjGYx0O4uerCLMhNuuX5ZjMhVrMWAceXdJAoDAytZGmrnDwtluED31V/TXrTT
	 S9+oZ9EjvTyC0fSQlGVIqq7/3hIrtYTxs4z6ApqiNEMk0ycwLiwy4tcyoPhrdaZ7OfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xkws2U00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNEfIIJs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91907606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91907606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xkws2U00;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNEfIIJs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg4NL1599912
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ic9YLfgNTNC8LbkgAOfvr
	1E7rxhwKyo7fVG4O6cpK8=; b=Xkws2U00vMsA1S3OJf+Kw6noOrg8AI/CvYPANc
	Sg666KXvUcVP+7qkx5tMz1s7O5nH052OysjUeUuAZJaa2bC+aSOEnTEvn12XVcXB
	HBw3mrJQLkStrg9YO4fjzdphRMJ+ZmJ7+XzOTeU4sb1I/yHZ1Oj76rE6gnXj5D5u
	P5FsgZTvzzDXBHu3mmah2LBznuvNXLGPGiWfA64eY9NiP+LzBpLEj2R2v4qErKgm
	R18rFPtJLX95IPycmcNBo5UFDutfxwBTn8GnLNlwH6elY5Ys9HExEpl3m9Dk6Z9P
	t4FRo/q3uzReAdm85y9F5MqH+MPdosxVOkbCvelxBDoNxmgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugsp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:51:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36696c9f55bso819915eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590692; x=1793195492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
        b=UNEfIIJs4Ycd3woFQgfVGa04dQ1czRhid+p7gU531tuGOXSSe9JJ+72UaqU1ncr1YS
         J/CN3CCTvRHsN6VFhFrNDzM74VXnTjNyTiKYekuD06TKqMSfEzlec7kXwEFofpp80FCW
         rPK5ybdPVIaR9xJEwTFCFc1YdyBbDnm4YBRmBCDzagT6+vYGHcCGwpHMTefaHAmf0R7p
         8JYYfmEHkNAwD2OZChpoWylEQlnN4EHPqsp5zeP3mnkxvPnciR/r1jRkXDP3GGp5ljao
         1oxyO3r/a4R9nyZ6TanC7BzTvxfhG1DmTX8HjXKudDv6/YA/c6QjNpyjNO6dRF1N2r3J
         HWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590692; x=1793195492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ic9YLfgNTNC8LbkgAOfvr1E7rxhwKyo7fVG4O6cpK8=;
        b=iC7MfqvHtqxiGIh1EFx5uWGHRRZih3aDubEHikfheI3qS8vLiAXNOPQO4u+nbjb5yP
         YqWLCn+zIqMF3+Qu/sExW2MwFHcy09Xe/ElUHWRX5Xex4dKDo+2Xs2chh0JUEVmXaCXk
         u9oUglE0//aGlBBKyAvp+WlNDhSk9R8Dy3/TSJhdGmOQQxkI/knfZr5SLE5BNqiiBy2k
         CxdxyrJTaVZP50CsMBxFhtzhj6CW8GVOI7N3YH/8d3IEPI+oR0JvvexvBokfDJVZF+NE
         YfUkpD3VOif9dTQGJCBV9sKDB3tOgqDzdlETuXm0VyUOjtMyve023lullT6DE2SAEquH
         ZkGA==
X-Forwarded-Encrypted: i=1; AKwUvBz5eUA9AwIzdsWA8yrv2PQjWh0COoex7WZ2PSortascXnLNJWSBNEJH5tpn5FiM5w/eTgUhQB7DDQP+zXyV@vger.kernel.org
X-Gm-Message-State: AFq9FYJtlFDb9c6ckOXxRfS6iHSJehmqVTVpWJYloQ//0R28v+yc6+ay
	dQ4uppoeQaYiYvJPA1xXxNzyC84tfFKgLzi1xe8YgFQ41YfWoerLff7kEaTY1FVQ2VyX1E5YjBJ
	M4342CyKbBZ0CoQ/LwaISW8D4WX9gDm0n2YySNOps7vNJ8+HoHV7iAERTCtQwi20jiG5o
X-Gm-Gg: AYBFou3VnzeNY+DNUrHGn54NHlgjveTiaY3+xNYIQmlufgNyfG8swav0rjrVCCmHzCK
	xonSgzL6dkdo3AYW68W0ufmg2cm+Z3ydUtaZB9tamyregbRQ9VE61ygQOf2TEGqkkImxzrHgsdo
	i3Q3oH8Ki6RA7toRx/fZ9ZDvk0lJ5ACITSxbeKS5s9PX6cCh4Omg6niyN0akXKYFs6fUv5OnwOt
	arpwyG4HJDbMv0CtdB+NartG3CodosjbvtKqsKkUtSWR2iHt65NRvXDrIraHS/g6YQhaqM8Tnir
	MNEgZiIHbCxUKKpSd+Zr+68rxgHQlsA1eVSK7XYqxHfyQnKEHUrBbmfbZzQiFI1i2RVSurQndyi
	QkjIkmKDGutg37ohFnYN9IKi8J42N6MTlgQ==
X-Received: by 2002:a05:693c:864e:10b0:361:8d0:6c7a with SMTP id 5a478bee46e88-365fbf86502mr7227533eec.26.1792590692110;
        Wed, 21 Oct 2026 06:51:32 -0700 (PDT)
X-Received: by 2002:a05:693c:864e:10b0:361:8d0:6c7a with SMTP id 5a478bee46e88-365fbf86502mr7227503eec.26.1792590691495;
        Wed, 21 Oct 2026 06:51:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/3] power: sequencing: pcie-m2: Add PCIe M.2 Key B
 connector support
Date: Wed, 21 Oct 2026 19:21:21 +0530
Message-Id: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFnD2GoC/yXMQQqAIBCF4avErBPSwqSrRETaWNPCQisC6e5ZL
 b/H448Q0BMGaLIIHk8KtLoEnmdg5sFNyGhMBlEIyQvB2WYIZW/pYsZKaSutdKlqSP/NY5q/Vtv
 9Dode0OxvAO77Aa7YGxJtAAAA
X-Change-ID: 20261021-pcie6_fix-cf66f4b8b387
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=1492;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=D/UvRdvBDBS/Rq/ST/CUi0Wd5LwynsMiqdDmEgI5bRI=;
 b=GA0GHTLmE/SalAfNw5rnP12qL+JshQsAM+buh9CGhLL9xvLCTlyCtqkJr/0RW7F1Si1RVcTQ0
 hf/aDeNqM2qA4j+XzATTEYLZePe/7mYoVq2kN6qI9GE4Y3mgCNdcKLS
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8c365 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KRKipztoQesxEaMeAmMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX51S/fTlunspI
 oEKZ9bEsNuOWyJEbMHFdb/wGFCZdVGojRBf3aoUVPICMfpMLe+h3caxgOn9EBwS2oR0PV5dokLE
 Z5/knC5Q7qToLHRUPpKnJ2rVREU9Yp4=
X-Proofpoint-GUID: nxX9y-0B2A6wLWeZ_ATIe7GCXsimGnn5
X-Proofpoint-ORIG-GUID: nxX9y-0B2A6wLWeZ_ATIe7GCXsimGnn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX8QAm1aSk5jTs
 jItKepyIGPCjwxfNwTU8mcRNZOmTrUYcV0isMVG420VUEGIzWm9IVx/0f2Td5KDmZD63Xe/08YQ
 HEtwPUoN2ALqGfZBoPyDJ9tygdQhIEcPfPCsp3+MuO3bVhDgpjAyo6aNlf/XG18qBZSXHieXGR1
 2fqOnhLKi6PEhpWm0rp6WvjCMaXV58PlfnwpvhNVcW6ATIB6jCIyJOKKK0vS/R3Qyg46lVLNt7T
 3wkcmp26fopi6pgSnJ9ABshiYC8w+04Nnd7mrCjJsZfdQBVQlxmJipc9wV7k0UVcIsp8O5ENsvq
 7We3aj4xvdkL5Yzz7m2cLxsoNvcTdEZRfhEzXJkQKML7xfkZZsgJUFrCxsfbfXSdz31sjN+fBPQ
 1KpRgW2cGtNcsEB78iqN3XdeAEfLqx87WmzWNMlriqFNASx2n7tJuxo70BmbipLarqU6MiVZxyG
 kYZ9YnemWKu47xO695Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

Add support for PCIe M.2 Mechanical Key B connectors, commonly used for
WWAN adapters.

The series introduces a DT binding for the M.2 Key B connector and
extends the PCIe M.2 power sequencing driver to handle the 3.3V/VBAT
supply and the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#/2# signals.

Finally, describe the WWAN M.2 Key B connector on the Glymur CRD and
move the WWAN supply from the PCIe6 controller to the connector. This
allows the PCI pwrctrl framework to manage the slot supply according to
PCI device power-management requirements instead of having the supply
follow the PCIe controller power state.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (3):
      dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
      power: sequencing: pcie-m2: Add support for PCIe M.2 Key B connectors
      arm64: dts: qcom: glymur-crd: Describe the PCIe M.2 Key B connector

 .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  29 +++-
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  82 ++++++++++++
 4 files changed, 256 insertions(+), 2 deletions(-)
---
base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
change-id: 20261021-pcie6_fix-cf66f4b8b387

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

