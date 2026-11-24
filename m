Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517720;
	b=bvsnEyVlCI1EQ4k7v7nT6ClubJt96M4zc5CeMRtsfwLLbDLhDNGc9m9kLwnt6+xBKKWL
	 2QdAykmCE+mssqjQNX5Dj3HV4oKTMU3gsVYLThc0UOeq7DrmBtKm71eYZfLX9kay80ijx
	 B1t2pIX/5F40oUhMaA4FpgoGN5PxWBwuY6L1A96Ph/KA+0FjXJnFTxCGHFYAiWJ744ii/
	 1gUOGCVhmvmPNbXrJHSa8ldnhaGkgkjan8syzTnnFJxIcIQd+98yC8cpJAIp0fx73jnEw
	 METgf+w8TG9hMLutUDAVj7fsHwzV7zOhygc2kZHZUnJj9JAx66/ohwtiyQdOp5LBc/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX1SLF6qdE=;
	b=FVLVjDP1jt47XaU6+jVAUFD7HPxJZ+eDupo5F4ua67wa0ToKKtaCDWU/2v8ABypMfRwt
	 S+m6m6TgaYKYmTfZ/ysxAI0CwzjD+60BO82qQuUdYzsn6TGSAmyMVLZZWppENd9touu2A
	 Y1TboFFcgkN0u/xEaxtvRDhTSj0kU7TdUIzMphV8vplw6ZWzlmysEA2ZEt+P1FOPlMeqO
	 UD26MyVnnMlQjlUG/xE8JPRKTaeT8phfAdea9pOxfGspPS9Mu/WbA0P6qSzl/5eAwH3xa
	 egaJ/mf3myxUsuc3n5fiFCJg6/v6jFfMSiAdL8MhipD5OJELlh5rCQeLyIre8XIJoFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+lHwVt0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IR/AL0kg";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB424606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB424606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+lHwVt0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IR/AL0kg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8VNLN016829
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX
	1SLF6qdE=; b=m+lHwVt0/EPdLs0KfDpvrKgv5hv+xBQAXuXJN2ZdQphMQD9AhgR
	cQjiF8ABTTfnmJ7QOM+B8EFzwrF/B99crUKa4d1x/+nk6Vu8WfxsOKetFND3kJjg
	8J1Zht0mFgnnf4iOt7O849iOKCcOb9ca8QARq1hV55Ohz92lHua1JVfI2ojOh9DF
	zjnZ9sP4W/xgqmqJGRziqpEG//WTL+OL3a+c9uMdsKi9x95Kte0TpWiXjl90BB+D
	lYHtDavYlgHA9dQsbT2IBGHf180MavBeS/rAn5fXCfRV8Scppdd2lNolfFdeyk28
	/NEX+SaOd7PUnhN6tLRRNL3INburEyOJqmw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nueem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b45597c7so5305622c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517718; x=1796122518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX1SLF6qdE=;
        b=IR/AL0kgqjV9g4hSw8D8xhxXho8K35IHQJ/aS0RumPBsjxZD3a/uyx7CzzCi9wUnhu
         xIf9YQzASshTcNUgT6gMD67dhHNeDzDKla9wVO+qdF/L6pCRKO4hh/EBXNebhZDLQn50
         q26slekiFr1ceeN6CF5bJZtNOam7+AOwCtXX492gFqpzBtCTNyPCf1PkgMnNZDUMjywk
         MieEZcHOVV09jy1LA1P/nxPxTHSDoBu0pDX8czg87Ybu3kkPR0MjNNfBpJhbdJP8Wtjh
         3xtM886NdRVPL83w6wA3507l6NaSTAsatIbmbBvwWwNk4KptGNAuMK2ByTPhBBYEOjD1
         freQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517718; x=1796122518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaoDHmsRZlPH0GxcRak6hJ29lY+5PVrmCFX1SLF6qdE=;
        b=zCnFVUfvRI0iKtzkN68ocno1dU3qFgZONIqgkqOpQd5WLl4k33Po2vsIdEMmaJ9Kfo
         7/Vmqqh/Jq9s/C5ClJjIxyT3pHFVhF60jVidV74OwAfdubgeH9Y8QNLOCJeUBAjahWLD
         upSnpvgTuujpTbFNheeCkNlqk7NvkfQ6MAnYw7lKkZLCXV4BPIwPki831TMXRFTMvMIy
         3DOC9Zj1C0jsPouLJu70ANaHkvYkyAhobHaf+QjUl1A9QznrTPCLHNoQfEUrDcssKZ0s
         ewo/PlfVeHXuXkHXZhCT64UYmn7DqSx6/W6eg0G3BNZXQSUjDFs0noWCVQF9DC2jimZt
         0j4Q==
X-Gm-Message-State: APuU4Z91EoQ6DWhFbtEQ9R0ZG5MQE1c8SwOl2Q3rpCxvdPOoAWinwQnU
	mxjGUAvg+5qmdBadBDj2p0S4pDIYvjog6wvm0PgrbmgYJ6WRIsuh3Opsl6ijFkeWbsTUlz6fd9F
	fYgn1f1vVLb6v77JaFNLmfJyrJlTxb8HnrH6uj5CuS8JTg7LsM4czber5ZVqspfWVcyGH
X-Gm-Gg: AZFdTZdsl+tgUdmWjwXD+F2bKasQr9509Lf2Np29GGjpO8Jdc2pPypcwkvMnpTK0F6l
	dO6R7CJAb37xURMXJeDryT4CGLgPf+YLmevDj+8VsLCr7qAOCPU9tBt98UH25PPkMnO1Ua92WHO
	xO7mhmUZZtdNq/doJ7NsdDvg7AexMTNa1Kd3LkSGY1FHGXrrRwJvF9LypCINtkeiso7HW5EnGUW
	68AghrQN3+mULVlybeGwykC8fWTfDGEnm1vWCqLcWzGncrnnnHkIxYQc17qvhMgvNjW5qoLXCW2
	4oQE0fhbPbgiTU32P+nge5dxUcWftYafk+Qg7PMGlwjzpouBM6ZLwj/yujMUrcU/pNaD5ej0Zee
	mPTw/pAf2fvWjj/9Jw4XU+JZX5i9v5EJfaC7iSREEVi/4HrC1XndXptn1d+QweBGNA37W969qC9
	uIoR9T0zh5gPBCln81Z2TgHmREMb53H9g7hmFSPsjEIW2Nev49qcjNptpM
X-Received: by 2002:a05:701b:2088:10b0:190:f24b:9491 with SMTP id a92af1059eb24-1b556877bbemr15734142c88.12.1795517717636;
        Tue, 24 Nov 2026 02:55:17 -0800 (PST)
X-Received: by 2002:a05:701b:2088:10b0:190:f24b:9491 with SMTP id a92af1059eb24-1b556877bbemr15734114c88.12.1795517717201;
        Tue, 24 Nov 2026 02:55:17 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:16 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: Add Qualcomm Seca SoC and Seca Ride board
Date: Tue, 24 Nov 2026 16:25:08 +0530
Message-ID: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8eNQOMoIQpvY
 HnTC3rT+bjyl0Zl/lK4LFv4DyKxCkT7IeGf0mOjIJ71SM8GbSEBRd7z09vFd2Plg6wOgoMwlrJe
 15JW2u2ZRZnX/pJQcBYHY2HNtngp7B984sFDHnsJjb5pVQ1enFDau/1f2ylx2OcEkFFlYe8gnPR
 GWSAcazzFxcerkHGnKdnZ9HmCMKyikVmgsPSDqiY7H0lJQM7cT/BZ1/yx7WUJG4W38yTOiKp+i4
 kDd/Ky+IM4JUWLHgr3YTsV7puvSOSYbkRRLrNFnihe9fsMtuJ99g9MQGoEvcj/jXMDFoBg0cJ9J
 9DnDmJKt4+7iQ8TJYf87HYcKfro+rbTSWYR5Ka/3nyIsTwubAVl4sA4Hs20OfvvgcD1cTH+MMtN
 ygdKciayBL9/CJZThboWDyUbKg4JpPTMCz0e9M2nnT4E4jxrKmrE6YqOqz2SfoaHw3scp60zx01
 jZKBFD7az3sACWL8Arg==
X-Proofpoint-GUID: ddgE-IAoAolEw68C9lu9sTccCfwJmWca
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056d16 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0wVTXZc6S0-_D5ZzavYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: ddgE-IAoAolEw68C9lu9sTccCfwJmWca
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8Cejbpn8wJ74
 VD6d5fl1KlurczTcAcfyhmUm0k006fhKMq29VDiYxIkFbmzkStdFz7txgCjFElF/+exHeLHveQF
 Yzgj9BZtyFZ5Xc8kuQTRaIFLoRvasEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add initial device tree support for the Qualcomm Seca automotive SoC
and the Seca Ride board:

 - dt-bindings entry for the Seca Ride board
 - Base SoC device tree (seca.dtsi)
 - SecaAU GearVM layer (seca-gearvm.dtsi), where a VM manages platform
   resources as SCMI server, and the Seca Ride board (seca-ride.dts)

Firmware managed (GearVM) device compatibles use the "secaau" prefix,
while blocks described in seca.dtsi keep the "seca" prefix.

Dependencies (posted separately, each to its subsystem):
 - pinctrl: qcom: Add Seca TLMM support
   https://lore.kernel.org/r/cover.1795517583.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: mailbox: Add Seca IPCC compatible
   https://lore.kernel.org/r/1a2010d7c4f4ae5d4629d2709157d7d47c20b3ea.1795517600.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: mailbox: Add Seca CPUCP mailbox compatible
   https://lore.kernel.org/r/5bfd311f596ea5945b7c2251199d2d0ccff41133.1795517617.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: thermal: Add Seca TSENS compatible
   https://lore.kernel.org/r/2d8b5fdcdff1f5d0df738d84773b0ed54159eee0.1795517630.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: firmware: Add Seca SCM compatible
   https://lore.kernel.org/r/80dec38b30da490c8c7a2d0e9c03c9acaae0b8ad.1795517637.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: iommu: Add Seca SMMU compatible
   https://lore.kernel.org/r/27f6e560a71f770078ef26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: interrupt-controller: Add Seca PDC compatible
   https://lore.kernel.org/r/69d22406d920bb2ca437604092b22648fc14384e.1795517650.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: qcom: geni-se-qup: Add compatible for Seca SoC
   https://lore.kernel.org/r/6e09e1ce0d9250af78da72e464b7f99f942e1d7d.1795517657.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: crypto: qcom,prng: Document Seca TRNG
   https://lore.kernel.org/r/b13bc8fa6aac6e9164ce9ad0ab202d0df491331f.1795517666.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: serial: Add compatible for Qualcomm Seca SoC
   https://lore.kernel.org/r/9ec98ffd6cec85ad77738128329ec77777a1f69d.1795517676.git.yadu.mg@oss.qualcomm.com
 - scsi: ufs: dt-bindings: Add compatible for Seca UFS Host Controller
   https://lore.kernel.org/r/61136dcb5cde2c0cfe1b8f3a488e9edcf36043cf.1795517687.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: i2c: Add compatible for Seca SoC
   https://lore.kernel.org/r/0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com
 - dt-bindings: spi: Add compatible for Qualcomm Seca SoC
   https://lore.kernel.org/r/358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.

Yadu M G (3):
  dt-bindings: arm: qcom: Add Seca Ride board
  arm64: dts: qcom: Introduce Seca SoC
  arm64: dts: qcom: seca: Enable Seca Ride board support

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/seca-gearvm.dtsi     | 2862 ++++++++++++++
 arch/arm64/boot/dts/qcom/seca-ride.dts        |   81 +
 arch/arm64/boot/dts/qcom/seca.dtsi            | 3339 +++++++++++++++++
 5 files changed, 6288 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/seca-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/seca-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/seca.dtsi


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

