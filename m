Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9E386C37
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181324; cv=none; b=h+OJ41puVi8s2LMfWicd23WpfN2IIABv+Cf3iyOzRzVZuZPrf3sCa1lDFA5GDsmb5PPIPPUWkWdJ2hikoEFEVKXNsq4AnntXtEWyqFM0pRMzDC6OIxEc2tjmIgqbsQjg8BTmKdhOlHBHrZFyfVx9pIF3S758V97xFL/KlKVLwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181324; c=relaxed/simple;
	bh=PncJSMdZfMHDBKMVRRVDfV2r/SfHWp8nQ/6Kw2Ksz1w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=grGg3JNnwp6kVlobQvDPAqv5nIDaB2YVYWQ3qpsZp92u7I6CZPkFM5j2AdSkKXx9nR9E/r1kuf9M3LQahlyU+LSGPjUw0eYlsR9EHMVDjI5I7V9wZtVXA79bF13AgUYVceaxcwLP5rw3doAu1btvC2xS6XT00MjLZP7LUKwIDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeS39Sn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqgeG4Oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeS39Sn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqgeG4Oc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wMjX1753954
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DvNnJu3tyYiCsufVw6dXC1
	UJWElGK3jKtWuRgPIWk+A=; b=eeS39Sn7n2HppPRl4csqcHLtb7CNBFZme1NUDV
	k/HaHkXxDyDmn2djJoQDRi5pS9iSGRA8UMlu/gDw+/fYvEoo8WxEY/dgo1h+4DVH
	fMxGs/Bd0noI98oTDGdqqDtzEz0l1ITS8voJKuUDgnmiMgn5qlCcAm8jP/Mt7Nkl
	wxU6kIlpXHDROnsmn+jAk1q/5NbmaZ5jJQxT3pg8HZvnA5LT3wdabYJDxgQvcWRk
	y30aetkTWqhUOCD5AKL1pCqPo7NiBzeKTUcdw4Znusv1y8vvyqITxsoAXznWn1RO
	4kcZvS2ibmIfIYZgKPKe6MtllAPFtyBjOub99dIDWT0v79jA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe855c6jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso9737612a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181321; x=1784786121; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvNnJu3tyYiCsufVw6dXC1UJWElGK3jKtWuRgPIWk+A=;
        b=BqgeG4Oc6DzEUpI7PidmvPutOTqjxH/eDAs3t/Qej5cnizk4bmKpTAyk6Iqe97hlPR
         /V3JbGsGCtlet4rT2t9DCYPZ7zpbEGzq9v0OaXR6nZwGCCUZ1MDmbZJDfajpB/dzZG4Z
         cKM0aZR2NyqbSp7Rffol7ZcD9hIr0Sw/okvvEZ5DeikWpW50xhGxas6CFJ+wKcGz+/WQ
         lSlvHQ2sh6WbmbcuS/6OGelTzyrL4LuJ2n9dnHAIBMYdzs/tq263r24dfL9etwh2gaNm
         9uio1Y8UGSZhzDq+5AOZNtSItCfDdUyJlJKPRv98LgOY75hCeSohD+dG6Djc4uweDGWV
         OvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181321; x=1784786121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvNnJu3tyYiCsufVw6dXC1UJWElGK3jKtWuRgPIWk+A=;
        b=HxL8W/s2799yOevWpXlXuVyZUGUUYp63qWsFSlg9WQFPzxaQkEiOmDcNo/HdycgA5+
         Ql3iU4Zq1IRuMZpQSHFtWzM9uBPSR1zK4N6WjYO0kwuJKZVaBJpa9Xb6UptE9Kh5gT8F
         S+iOhAfy2+Og4usMfHm2rbBkXCMgveOxYTKRb2jhIvrFCd8jsOyBEERfGTAk7QcPju2e
         Uvk13mKBTBokN5zvbDhRDa/35jqnrORhlyeP14wmNVa/B83C03rlx9j3/R2532rhvD52
         tH7o/LM3xbSYJHG+nz2TjI7kv1K2i33uiQSkL2yhyzohYO7xnKMMdaNoCrHoI1sgf/36
         xeag==
X-Gm-Message-State: AOJu0YwRgNOSdBfAg7YEZHunUJkKbq4Qj4BJ39MaAzhOHFD8XtkOgDQN
	3Kfiu4otVqUoz6Gr1JVjl8qoMYQlbIZI9lAhmUEsalGxFjcmrbqnUWPVFjk2Ju5UAIx3cKOJc7l
	cJxNbxzyVYSyzs41FA9KkJfuhtySVNCiikjPc8wVHmVYjosk7ueAErCtG1zLKuIZGnFtraErGd+
	8u
X-Gm-Gg: AfdE7ckwVZtJpQfI7j1b52yxicgvLV1REY8LkuvpH4lr6AFi0tkOQ81hjV4Wb8peYmh
	+8ETn7iTw32IukCsV2SzSLzmXIzaBRkpPjMKvQTKhQOMTD1jyiTIHLZOsHKlrUvWLlQT23PqdiC
	QQ2ZNafpI9U3g1tmpCx4nCf7DNeYEBk26s9p7vv/ssIvzklAlz0YSB1sr+YNPBGMirKjuAboEFx
	+6tYUDTb8fAPqdfIMfvS/f7y86ppJWwTSbXbEnZQpjeeynhp8/P38mciPiiIcsd7gMSslyzN/Kx
	DjAg4FDguce5Yp8hOpGd9Qk8IyEl96kQW7yH/wixxda5QJnU1lA5iAn9pTG8Lq8rr5th8EXoe6J
	k3Hidk9i8TkJK/Sm62916s1MFXj9qCtYe1Pqc6je7DvCFFK7R71UH6LPWPFUWHsejdOeu30ogJQ
	owzoObZIu8aC0=
X-Received: by 2002:a05:6a21:4ccb:b0:3c0:9c1a:8938 with SMTP id adf61e73a8af0-3c34d8b396cmr12085156637.64.1784181321601;
        Wed, 15 Jul 2026 22:55:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3c0:9c1a:8938 with SMTP id adf61e73a8af0-3c34d8b396cmr12085120637.64.1784181321169;
        Wed, 15 Jul 2026 22:55:21 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:20 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Date: Thu, 16 Jul 2026 11:25:11 +0530
Message-Id: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD9yWGoC/1WNQQrDIBQFryJ/XUGt0eBVSghGf1sXMY2aEAi5e
 6Xpol3O4zGzQ8YUMIMhOyRcQw5TrMAvBNzTxgfS4CuDYEIxzRWdF+t7XzJVg3VMttKx1kG9vxL
 ew/ZR3bqTE85LNZZzhMFmpG4ax1AMibgV+rU28Jsz5C9G0QmtmivXgkuzcuiO4w3NWdDstwAAA
 A==
X-Change-ID: 20260716-quad_dts-6bac0484c08c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: kmy_MiZMZBgwoJiRJwktc3oqZqHbeNNH
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a58724a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9rZjSWdz6Z3QmuJy7WoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXxnAmF4YnND9x
 KBAByiAFcAfAmAZByWCTcJC8LgSOvVPNijXxSM1DTkO0Pa2/ABjdFBeqsOKnQhxKVzTqzw2RjNy
 uMrXlTCTHHhFMQ/R6thtuFFF9pzQiEhbNMjP/z6DoGnhgDT6qMqsAtkwUj2qA+7GEjharDKAZBN
 xzvUi1ktAiAwatXP8Ep45zjJqFxH5oRoD9LyUdmes6ikj4tIiWbr1GZKIQwgoze3HpdhjVH+8Xp
 J6+K/DxypdH0ELH5V2Y+GjLyGJ15Wgn2Fl/FQvg53MZI+NCyE/ovLUZ6E1lHDpuHkChQZGwpujM
 aNBUqWolzHWpOqT6MVV5BSkhwUHkxILkVlGcQk5vfrfu5MsXKBlL04LSnHgwFJS5wkbJntNeVJQ
 4J1P+lfK8HxNxx2SSTCxe3b7+N1lJ9T3cmuxQCoaBeNkemqffMBm9j92yPkUrLAuaOQg8d7NI6o
 5o/wjZWQVO3P8MTk9OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXyA5iO2QZ+OiV
 gUs1Rshkm1bjJSDH//9uDHadJQeBSpiibLnzjB1UN81um0+twbQLGL+z+58QpMXdVMy3hq6oHJZ
 W3cWw5AHDczoBwc0tUyddL8CvEp9Fd4=
X-Proofpoint-ORIG-GUID: kmy_MiZMZBgwoJiRJwktc3oqZqHbeNNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160058

Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
between the QPIC SPI-NAND controller and the attached SPI-NAND device.
However, the corresponding device trees do not currently describe the
bus width capabilities of the flash device, causing transfers to fall
back to the default single-bit (x1) mode.

This series enables quad SPI operation on supported IPQ reference
design platforms by adding spi-rx-bus-width and spi-tx-bus-width
properties to the SPI-NAND device nodes.

The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND

 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
change-id: 20260716-quad_dts-6bac0484c08c
prerequisite-change-id: 20260716-quad-ec2765317214:v1
prerequisite-patch-id: 912ede01168ddf0476ba69ab0db786186073f817
prerequisite-patch-id: cdb88acd348e7dc5136fa9b94cc06dcafb0f478d
prerequisite-patch-id: 932ca3dc3893df6de25928b24c7c24550907088d

Best regards,
-- 
Md Sadre Alam <md.alam@oss.qualcomm.com>

