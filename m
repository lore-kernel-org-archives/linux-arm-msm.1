Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472448;
	b=ZinxS/5Oqj2Ms6gkBkqyXaaTtdzq3mFKniEbUykyhJCBBv+u36yg9wPyZF7aMuT+/aGL
	 Mjnozy/+meJeE/krJaDNuf09GuHQVbDJaug62ch6crLGOPXPpaQWjXkutbwO3FGwqlF3G
	 jNqlxc8vT5TrAYfhS/AVH3rfpu8j0n9/nfhDDY3wypm9bZSIkk1tTSUPXEPsE0Dzyq6TA
	 Fr0lN+R3s8Y2uZtuKO77zJx8PQYbSEA1h/0/4PebWnb83mbAeBQudjo0pz+NTR9h9YOur
	 w2UUD94P28DdykT5BlMf7q0t8r/5RhKfRXU34khED6BjTFfoIg0xLrtNBqiz/TtXRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
	b=b8mAeJp4Tmbc+34DavQcxdvfK1qnVealRqpdkBPQU9tbqo9XgRGSFZrk7gUQIky5Ycj5
	 IKNXx+AweZmP1wSMz6OdjAlpAQmsL9VDvSLnmqJeRMJo+2ZC2EVNAMq+gDCO2KxxXtgwK
	 r1xFtYIaYYrMQt/DmbXvgPBPik/IJECtc5l9/z6nWRheRUSSdvahyyg9TC953pfrqP52f
	 p3U6qSpdy2/hMN0/xJ/9zhKIT/FE7Drly/4J3jumwj8P2Wky9CANt6RtxyxhptyDMxO1i
	 bqk2Ia0/j877rZjWBZ8mlPIqpxxA3w5GC7As6GSllLs3PWh5pZqztwBIp5v9T9lZqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTXSISnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uh4ZYP/d";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564160A261A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7564160A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTXSISnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh4ZYP/d
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC549hC3477469
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRP
	WG+4Um8c=; b=LTXSISnD2o29P/Ymftsq5P9ISlcV2UZZa3dUIrogaFsG6fK8yk1
	7fI9xFKg55kb1Jop+i18dbSwbFvRZdaGqeBdTta1ArDT0BspNlwoeSQ85T2uwNwl
	Jk7Mhljz29L6/3cIrPTnb8/BUJ9Dg58lHZzYUM5FuzH126RD8+efgfV18vzSJQdc
	Ft2Vdwk75XawrOlBSeu5iEjYMx6h11EVRMGzlqLEWFlSVgwU0YBRDT1plZIauIcT
	zsP7Ps9ii4k1RHUSRMH+Z//o7jFbUCeRJmiQMdhhjM/gXQR6uyDmoMYpr4yzlIxb
	M82zRNSFQzOpWfnE0jo+o8qzKlwELmfr85w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugq0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:34:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb5b33499dso163622a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472446; x=1795077246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
        b=Uh4ZYP/dw65r95/KGsFsQwrtbvyghA3vs56A0kWWWqcgd0lBP37JF1KgiO1Cfpbs8N
         lrVhpCVV5skaYk7J96Q/6MQBa1aCQAj8JEBJXm0WXTOWY4VFAnWIvNJf0Iq2cQ0oTwD7
         mXQqHL5egItEZKE6BGXGfjLQJ9tASKIoBVd/Xv0CKqJsVDpzJp1wHso+IvrpHJE0mfgz
         8GzohC8DHUQ0VMDxXpt92r5xrtv7MRoE/QnfFft6QnziNcFuY7Dv+TNQl7eGQFof5X+z
         mw1RewSCBn+3znOEVUZSIa/+IF9vGA8HyvDTmuFQzgDFNox+nTUDmEEEpg/hA0TUtH0B
         OkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472446; x=1795077246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
        b=2fOm3e92HuGjgLhOL8sneGUzGbr8dMkBJnLBJku+liQ+TEiN8MXe3i9uHPqnLETz+W
         LNFx0TS4QI66WKUJCfUL0QXqgIfdqZKmGzy8lE7SVS5O0VijthEsgnp2M3mWHQdffPPa
         FVBqmAXyQFrz2/cTED8VitNo+ehW91aYf8U1IUrSlEaRv5Nwv291edEa7Pv2cjYA2AWY
         JF968nff+K/JhIVRla+9bJnsL9nYnghP6pcBKJb8VgC+RZhGmi0z/WHI+G25ngXpLilN
         Qgw0rGenxLha+QE/yipcSbwRh8AaYfx3SQjQlavO99bcmTzPviZx9psgZG13yXYAsRLW
         FeOA==
X-Forwarded-Encrypted: i=1; AL+hErEs7gJGQAp0YF9LXfwbHD7UPpi4xA0JQ8J97G9VwHGuLu0870C5ob538Id0WJqvfzgO8F1nERU0btQXrUPx@vger.kernel.org
X-Gm-Message-State: APuU4Z9yHIdoK436tpnR58uVN+UQT4D/TyWCfdzcZfk3S+gm1Fpx/Ca2
	Vm+6SQc6HyhNO+ANBm3ZO11ZfkR4TxJKVUF/3v8TroSG7k6ZA4Y2yvOyn6m0LVJEB8m6ZufpKFV
	UN5q/SdGMwUkCMyTG/F04Ebdy2xbXZCIfa2hHyL5g2QqogBdwLY+oOqNAY1d/lKoPmEuM
X-Gm-Gg: AYBFou1ieJyhK3jtAuaj1bf5LHOxYHlPT/G0tgR2fH6K65RvGSUMjXuLfQWuYr6DPxl
	Sf91zl7u6ecaVymR2Kk97SRDP1VNPMLnVMHElr1X2F4vyhL9poMwYLnazR2biw/TRFBCJoiuw9g
	ENExJ4++fMPBv3u3LZ4NI2YePtACKkHnyv5Kr/dnWYlWcdZrsCaxV0819XZGvGBwl+9BVUvasAX
	yekAPB06/JZ9Y5+ueJS4jF/p/gk0ddNc6Tb4S6JM6X6QA51DQGxj2r6YHelB/5o9Xc3KekCQNwZ
	EKVWldNDUGpxg20ySfpOHAMFqVDa/I/wNQGvXBI9DhTKKz99gR+7QHXAy11pEZibLRzp9Sa7+ss
	TVEWxswVAucOyawoq1zewYJ01mKJZE6AKf/zQ7UVkceKCsAkpj0GPJAiBbgxTUom/wJWQ+UNTnf
	jEEg==
X-Received: by 2002:a17:902:e547:b0:2ed:630:40ac with SMTP id d9443c01a7336-2edd7751683mr80863245ad.2.1794472446117;
        Thu, 12 Nov 2026 00:34:06 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:2ed:630:40ac with SMTP id d9443c01a7336-2edd7751683mr80862985ad.2.1794472445681;
        Thu, 12 Nov 2026 00:34:05 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:05 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v5 0/4] PCI: qcom: add Shikra PCIe and M.2 Wi-Fi/BT support
Date: Thu, 12 Nov 2026 16:33:51 +0800
Message-ID: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bmAWU--zDB4wEjOSajUgsjAmSFaRGNjf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXxEV2I4JpfTXP
 +83yuXjrB27Da3VPYjqRLx+ITxB9s9rW8qxaanoimw9aXjB+Kbj2Q7r2NA9UG6hTlJMklBu4ToS
 VkcmPJRUt280gqlc0EXhrX/wulF8n1c=
X-Proofpoint-ORIG-GUID: bmAWU--zDB4wEjOSajUgsjAmSFaRGNjf
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af579fe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=f2qYStR2zr0EFXCAC4wA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX1I30vej/W1JL
 FxxnFJjc+FHV07pkZxIWy4PUbrIOB5IX4FwVQrcmWcauJmdCOndclS6D7I4fLGih8hKjG5I0oyM
 vsg3697Jv6h9v6ZzLiR75/dnua9Mu1doVkznPdJZA6KrlhNAuvzjXEhk9JZkA2G0jbfshWT2OsZ
 RpGLI8drHOtnHVpQCVEdmCZ5AZ95xdqelNDx5+9DklrnrZ99nZni0cXYDG91bn2K2/iilJf0qNU
 bNtGpTcslWv9dtiIEhVoW0KYNNFye6GgWSE9VAaSuoX23mDyp24hGIDIGUbFeiqu8jFM+dKyOfQ
 +yZ4LF00NmZkirjLOgJlgR0CPURJ0Vvr9Q8J0zGjaTqo3/xJRKnCg9zq7HyYTH+MhMPlqFWJgus
 e9y+HmqwW/znf8Hm+MPI+Gfbk4BCEsismtVuWmC/6CW2KhH95AIhnpWXIEq8yRoyR5y2B0v3qlR
 t58+uaYaIoM75y21F2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Add PCIe controller support for the Qualcomm Shikra platform and an
overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Shikra IQS EVK.

The previous overlay revisions depended on PCIe controller and device
tree changes that were only present in the Qualcomm downstream kernel.
Include the required PCIe binding, driver match data and controller/PHY
nodes so the overlay can be reviewed and built against linux-next.

The overlay describes the board variant where hardware rework selects
the M.2 connectivity path instead of the onboard WCN3988 path.

The series has been validated on Shikra hardware.

Changes in v5:
- Rebase the series onto linux-next next-20261111.
- Include the Shikra PCIe binding, driver and DTS prerequisites.
- Make the overlay self-contained on the upstream Shikra device tree.
- Build and validate the base DTB, DTBO and composite DTB.
- Start a new review thread instead of replying to an older revision.

Changes in v4:
- Build a composite DTB to validate that the overlay applies to the base DTB.
- Explain that the product design does not operate the onboard and M.2
  connectivity paths simultaneously.
- Report Bluetooth UART and HCI validation.

Linghui Wu (1):
  arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay

Sushrut Shree Trivedi (3):
  dt-bindings: PCI: qcom: document the Shikra PCIe controller
  PCI: qcom: add support for the Shikra PCIe controller
  arm64: dts: qcom: shikra: add PCIe PHY and controller nodes

 .../devicetree/bindings/arm/qcom-soc.yaml     |   1 +
 .../bindings/pci/qcom,pcie-shikra.yaml        | 192 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 122 +++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 158 ++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 6 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.43.0
