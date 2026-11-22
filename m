Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329963;
	b=vY0lnduxMcCAKRpRvy5cw8Xwbo8bG/k63+pyz6gZ1fEP7bpfmaXunhJ1E/hiqXaI/FM6
	 H9EvaBJ5lmfB6lTxCahIY08qKg4vFvTv4VKDWrf7xJK0uE9lMSeM1yqzaxGyAXiRNRYvO
	 ElCVQAzQFMoBOJZB/EsSAxQTLl9Uzo1qGEIlvomN84KfJ4GpBLoTuHGp0MYnfg1ATOrmG
	 R2aBY6OT/CErTyt4cgr/2/aovN4rn80BeCC1bOLvyJCxIKQB5Rnm3VnFC2ciCsN5l613t
	 T3w8dr58OqPhv9OCycKju9mmEzO+uJ5Tnh2d1LORAl9belLpllp7M3SiDI0MbCsZ8Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tuiQQpowNDqgIViUd3V9zwNZ82lxLYXnJLlZHlSUB8g=;
	b=NLaa846olTw3Q8aCzUNUU8NZRnIXuvnfXy3/UyM4GoBP1cGzqwZr+lPNNNA+W4ArVlb5
	 ZX7cL8na4ckRP9lqnJcqAhbUk5DA1ZrYcf3fn9NK1+IAlztPwGCLTieVkFlYxSdPNDOct
	 L0DlQDfaSg+j/KjXi4Qyc+SAsbmah/ZqYP64rHe3oa90k3cshu4xx6xS2eMJh/NlDdV+Z
	 xx1ANwPU+ybEwKMpsDEG0pX3mDcBEarah8dp3/5fe/H1zA4oQLQSPYs/W0jaVU0r8guxY
	 58HG4DQGT6Th4gmDbvgrUN2AreB7w7mjEOKyCtYvCKdpnmPLzZbtW8C1J2opi01Vm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV0WbZ7v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVMZWAu3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2851606A32A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2851606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV0WbZ7v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVMZWAu3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3k9iu2378844
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tuiQQpowNDqgIViUd3V9zw
	NZ82lxLYXnJLlZHlSUB8g=; b=AV0WbZ7vT2NcAG5tkq4+5Wq87eEDHO/50r6Dmv
	tskHEeXHI49aFcGrDi7gBYrBQNmx2gtvJtDzfz9RSCq+vIkZGfBpoe34ipds3vSq
	xnxnRAKCwrw/YXiMjIR2MDJiz8aYFMNWGvmzbD+tfzxt+c0yWzoHGkV3ziD+MrXr
	lficYUvYtHjM9q+wQozxwth0lAa5CGkkY5LrmZOS7VTrrq4DXnXTlyB8CdOB8xHX
	Ookk7wJu5TFrrYx7kluPWtLIKmWxqmx3zD8XMsLJmjVMm5RmfrSGSyRATQCDWHxQ
	wExjQJcJx30Wa1wHAOy7b077t1zsA2Mq1s1/Uy0Lt8rQ3/NA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h32va7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:46:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3291243eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 22:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795329961; x=1795934761; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tuiQQpowNDqgIViUd3V9zwNZ82lxLYXnJLlZHlSUB8g=;
        b=iVMZWAu3/MXg8/uzA1lhXlf0Fxwcu54+TU7BUKXF+oFqNUk72uHm8g5oW5IFw14wVg
         98eZyUgX24Fm4YQi0o2T/0tMJIXx5x84Hbo6tNHV65L1S9XxoVNnJY11l6YOloYG8D1U
         DeJ/Ws6DwQoG3g3XJYrK75/GCIkdVccw4IBYI0b/8f69BgLSB4Mlgqu4UEQHfgDm5CVd
         m84c4wmPwTgkkpeRSUtr/2e4DzRqbvrt0EGAoRJahgG348dHQ5EZBzTvlGwElOlYDv7u
         quaaws1VRcfKfAibcsEjc7ZXnhn3XiWqp+yHH24PMmDpT2/CAuLG54yPZbPm2cbcpL8U
         YYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329961; x=1795934761;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tuiQQpowNDqgIViUd3V9zwNZ82lxLYXnJLlZHlSUB8g=;
        b=rJyAN8hM89ccSc+NPNINoIa4caapTD7kTXoFIWMTRcivM+gw+6yeHp5hhgoUXrNN5X
         rrjwmWXoeLsjxR/hH4a47pZ9bpPpiziR+LjfkeIpxi/px5NhEhOx2s7zvNS2rbm79aVI
         igHzW89M+4dzYZ/Yh3QyUaSgLrIHaqteQMJuMRW3Let72TZz2y/riEa2MbXg0WsLB5kA
         0f/86b9i+h30qLA+70Dnf1MXoZKrhlZzvxkPkbPXVuN84QVudYAJFCWFhy0BktDArShR
         wzrqiUX+H/3Lk0hI7kDwZq1K/W3vO7JYM0m1a4pzkKItzWmd0YrtGgorIyES+otXBpKy
         vVgg==
X-Forwarded-Encrypted: i=1; AL+hErGE5FjHVaEhRzmlJ8h6qkybJL6qbOpICe5E6fkV9v4r5cNQhem+heDiVsOXpyB7NPy+ZKmcdOQJlucukL+n@vger.kernel.org
X-Gm-Message-State: APuU4Z+4rlifIiFJ+BnZmrMOFiiC28WWNB9RfW5wlSx8tcpqYB3T3//C
	+L7ilFGKNuPC3JWlV01hvdiKNdMs2caNaz+Gt65z+O9uFEw+nSwzqnef71Kehx6ZV3spgRIYu6G
	0ptoRjKOP+ziDAYH1noMaocmvcP82uYYl2s7pjYa6nNCeg3vjvQs53m4VrtSgLkvfH8Ux
X-Gm-Gg: AZFdTZe2sIi103Ql7M1Q5d4b5RzfVRV+KmHu3sCnPqBFQLdI1N9qs7nTXTDy+jvdLOG
	5d2BUZh48P5pFkNVvvJsUpv277eag2YfimMqayH6vsmW8GWl+XvrZ57+6/qxhInwQ6LZHRwqhHo
	9L+Avypjb1aB/8eXNQZ81BSSK1tWm1mP7nJ/XKaJ6YSOYPRODcSnZNbSM85YlaEjfM6i1PcRVdm
	H29YDxyhuqalMeRhL/TbegbDCM67iqM1TADR26aSGdfe6Vfbxe/Za/1LIJWXHH1BBVlCUgaU/Us
	5hm6AFDzQPBVlx7YSFZF3uciGmhOqpd76DS1qMgzO4JEoau5jAyT8ofacRpo+Agqcn+hyGaLpIc
	mnu6QCTqLU4LRq/anbWEl/DUyx2/pVXIz7hVK/5ITKb1cUIdaaUNFhaDwCUikqaLoIW7CHjxx0/
	9teDW0sdWH
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr8055978eec.40.1795329961379;
        Sat, 21 Nov 2026 22:46:01 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr8055938eec.40.1795329960649;
        Sat, 21 Nov 2026 22:46:00 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm27598615eec.10.2026.11.21.22.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:46:00 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/4] power: sequencing: pcie-m2: Add PCIe M.2 Key B
 connector support
Date: Sun, 22 Nov 2026 12:15:50 +0530
Message-Id: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ6PAmsC/22NQQ6CMBBFr2JmbQltsRBX3sMQU8ogY4RiB4iGc
 HcLbt1M8n5e3izAGAgZzocFAs7E5PsI6ngA19r+joLqyKBSZWSqpBgcobk19BauMabJqqLSRQ7
 RHwLGeW9dyx/zVD3QjVtgM1ri0YfP/myWm/evO0uRClvrXOrM6ZPVF8+cvCb7dL7rknigXNf1C
 2zrkBS7AAAA
X-Change-ID: 20261021-pcie6_fix-cf66f4b8b387
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795329955; l=3040;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nBLbfXrnUeOg/k3lrOwzMPzMyjCM8oeFudQrYc52rUI=;
 b=w0703ZbG7o+IyOKcodaTDYKM0mrFG87bvx0OmCPwNrsb0f1gNsudmjaQoF/ORAk8AdndNGWdj
 gYfEUfxCaXeDzxpAlxR0a/rHWuYGe3GTmExBpLrYgFg27qpjnbhIHeQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b028faa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zkpMToBQJcapbifWyZsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: oN8eTuErip02OsCkBi8fxFkhYb-52Wo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX26xx5jLuB4z1
 XnGuPtzhMudaC1/NzkHTTqrhIRfAIEjsSwHEklBXlNDSwGj6g4WG8O9RGmawDbnAZnRuKZ1nIWK
 ZCKTafM0dpZqHNVxjbzMUk+rXZXmJ3Ow9qkDKa2cVZOS5VsYeP+Ldxo1dLYvGSQBEhWNOgNRme7
 1yhbZE3rw1e+hSTZ7SnGb/JiAiZE2LHRmiblTN9au2jOJvrhCIq6HLnmG58mfDTHz2JGpBb3RkQ
 T81buUdJKarbpieZOIjjxg9M/TXFAyIh5u+2MXTr6xZY/aysuoQeJZYN69Kwrdfk2sX+SRPBt01
 v27I8pFyElSdMM54amVXou8Kua4HXIR9uO5IsfTj+DpP0iDrhHEjJT7hw0dGDaOtA07xzo5THP6
 kxZJFOI/3hOfCUVxF667CyO3nTScwK2rMRdC+o6fS+JD4+RWTyjRzdTyIe89FZZGoQ5cVO1dB+M
 lh6vHbqtlJpPCqT52qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX1SNMIBSXh1wE
 0dV0jFkAs8FMUUA5ZLIHU/cSY69v0Vn0be77lbVgEv7jJc1LI6HGBa7C1DdPiIASQadzEHvy9Wx
 TzMuCIq1O1VSIZ0d2WUSnn3MUqD65fw=
X-Proofpoint-GUID: oN8eTuErip02OsCkBi8fxFkhYb-52Wo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220026

Add support for PCIe M.2 Mechanical Key B connectors, commonly used for
WWAN adapters.

The series introduces a DT binding for the M.2 Key B connector and
extends the PCIe M.2 power sequencing driver to handle the 3.3V/VBAT
supply and the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1# signals.

Finally, describe the WWAN M.2 Key B connector on the Glymur CRD and the
Nord RRD. On Glymur the WWAN supply moves from the PCIe6 Root Port node to
the connector, so that the slot power is controlled through the pwrseq-pcie-m2
driver and the PCI pwrctrl framework, like the other M.2 connectors.

The series is based on the qcom tree [1], arm64-for-7.5, which has the Nord
PCIe root port DT nodes that the Nord RRD patch needs. That patch also
depends on the Nord PCIe controller support from the PCI tree, which is in
linux-next.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-7.5

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Binding: describe SATA/PCIe SSD Adapters too, since the Key B slot accepts
  them (Alexey)
- Binding: add optional config-gpios for CONFIG_0..3 with the Table 3-18
  decode, and config-state to fix the configuration on boards that do not
  sense it; defaults to WWAN PCIe (Alexey)
- Binding: replace w-disable2-gpios and wowwan-gpios with gpio0-gpios to
  gpio11-gpios, as GPIO_0..11 change function with the Port Configuration;
  the functions are listed in the binding, with the IPC pins and CONFIG
  state 14 marked as vendor defined (Rob, Alexey)
- Binding: add optional alert-gpios for the SSD SMBus ALERT# (Rob), and
  i2c-parent, devslp-gpios and pln-gpios for the other SSD signals (Alexey)
- Binding: replace one port per interface with one port per muxed pin group,
  with endpoints selecting the interface: PCIe lane 0/SATA, USB3.1/SSIC/
  PCIe lane 1, and USB 2.0 (Rob, Alexey)
- DT: add the Nord RRD WWAN connector (new patch)
- Rebased onto the qcom tree, arm64-for-7.5
- Link to v1: https://patch.msgid.link/20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com

---
Krishna Chaitanya Chundru (4):
      dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
      power: sequencing: pcie-m2: Add support for PCIe M.2 Key B connectors
      arm64: dts: qcom: glymur-crd: Describe the PCIe M.2 Key B connector
      arm64: dts: qcom: nord-rrd: Describe the PCIe M.2 Key B connector

 .../bindings/connector/pcie-m2-b-connector.yaml    | 332 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  29 +-
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |  40 +++
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  70 +++++
 5 files changed, 470 insertions(+), 2 deletions(-)
---
base-commit: dde0308a2f8867806a444df1fdd7e685b1c56d5b
change-id: 20261021-pcie6_fix-cf66f4b8b387

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

