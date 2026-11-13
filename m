Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574455;
	b=0s8FksZmGM6ZrDIKiA+VqmWO5xGPVKFbQNWTFQp6LCqPk1sD34B7offmiNuoaTrto2ph
	 3roY6epfkW5gO5wGtLfMDQbN30fN/gIeLw6f9KVNRzu7Tee+wqNNKSMDhLyUkUpXt+g+P
	 SamWoezyjqnQD8+TyjQTOXSTU1binShjInWxvar+jYvI36h4UeTqJ6hk1G6/ZPZ4BmB4c
	 e+X0PrZq9NKIdNv/+xTxIiNJfmfb8kDAMDJ9fOtXVi+hpEcMeXGfJzT01JlUJL3bjGy+f
	 8bTBN831Ab8lbBY6g62K2jJFy89Hj3yBmeA4SfZfxifPcNRSl/lvE8289NJX6wIjOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fl9/gcNoJhNDn4lgp/c0zoafZrHmOW6xOcNOdliPVJA=;
	b=Uo5h7IH1Vg6yGpEXXnDxg3CPh5PphHOKxzUIMt+32MtQwwLpeiafxSo6ut31WJ80sK7e
	 yNGlAxOEF2xST+OQ2E2bm7e2udCkb+ho5zrof/+75hy9sNnljuf2Oxy2Y6JhtHnFpOyt8
	 8IR64XvBWECqhdzBLQoaMNLAsCIIpcaRXlYyL2ZNCrUzHVXw0o4G6LO9ko6DJrqHTPoSr
	 R1rrDFUWLn5MLwxyYP0GPwa/oIP2TgPyGlRVczen8fcHjVIqhdViIlDGFFywrzBPJLohs
	 74brshgjkaabei+WkzTGJUBJFKbweTyt6q7+Ydku65Tc3L7UyJAYOzFI3NIF+o5Q68w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DH2gxZsK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhnvS6UZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5EF606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5EF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DH2gxZsK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhnvS6UZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcKO688952
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fl9/gcNoJhNDn4lgp/c0zo
	afZrHmOW6xOcNOdliPVJA=; b=DH2gxZsK1TaI+9zK0CbNBNhPdIXMtgHQ3iXZlj
	Zc03kiMYXQjKyeHNSXpD1x4W741Dm/8JK8B0nbYifcAnsZVnJRcOyuPHKCdPhdB3
	3nr5rXlnrSOcAuIMPKZsfJMZJCl2JrJ8qhXr/EtQZppgiLwg2WgZdWJrvszKg9nR
	tD9TDpSB5xSPng+lyOzF8jrio+V8s2FyZGvzf6rFPzgjFx0brfrmSyV3jEAHKdQU
	2ahZuGdZ0eWlEAORz8fIeliwOG6ctwlyKYz6bk7/n6jZsp3wHUIkJtkmxhJvqifD
	0TK4szEUIx4nZAi1SMKdWrJeK8Wh8ik8OfsIFG3vpfR539OQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjdf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:54:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so927310a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794574453; x=1795179253; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fl9/gcNoJhNDn4lgp/c0zoafZrHmOW6xOcNOdliPVJA=;
        b=LhnvS6UZVu7sIVuetq9r7QyU6QY/Nm4/n4RGjtcxQGF4DiG+V501SOxcU48H1LBJVy
         Mwde/ioaLc+npOCehqALxNchKKRVmkJVeRu4ylb5XcwGKy0BEcqzrwnXFkCnrWnSiCPO
         sbr9RdstNRW03ZpAZCBmgnH8n2B2ijr1BhrWIiaSEc8NUZ42U33aV3+BVsL5S/eNl0TC
         LUwq819gzFKlZ+dTbx8PJfo9Yq5dVIOiHkuzE9ErkUTDy8LbmrBXqMfIpYc7GV/wQ5cO
         +uR/mY3pPTeG+Cv6NhIMk7qa5yrwXmZsFFtwT+jBSqSfE17tcbPe7j2hQBnNKf0mJMWT
         yT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574453; x=1795179253;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fl9/gcNoJhNDn4lgp/c0zoafZrHmOW6xOcNOdliPVJA=;
        b=cAkySYF1dUz5yd4j9/0qrWWfJFzMZD/3db62PubhsVyXsr7/Jd2LP7hghv5SSleVDi
         murnK/jcUJgnWNbPsKQZG+XxAkhu8N3ulbGQ37U7buh4orB2JavUJG7Ltt3bKHd9/Ctu
         uoVOYyjivwnR48QwbTNPUiQlwbJ3vvjjiO931rsWZ+eKqrL1f6zbk7vm9vMsTaOPLoen
         66OjeYJ8cMHV901VVtm3j5h5hSrvUEkQIYmbb2uL7/YjKoiVcIYQ3C8LfFM9JsDvLag9
         nx1gSXlMFoy+UOqQz1pHVYIng2QAZic6y+AZxDr1UFzJ35XPc0ifIjKVu6/hgeokIECE
         e1Sg==
X-Gm-Message-State: APuU4Z8K4PCeT7ORKSo+PLB8FsGM9SkzvnrzIQOBX7Iy3tOTEVQUUUrH
	KhOh2RHX3ne07vPNLpd660gk4tQjmIyjJfbULK3gZgFdDopR4DZp8kLWrs6Wk8BBfTpRA/lNrdF
	s89BPwP3uRfdsHndJxeMAopmd16eIXEESIyVkB1DdtLKxPgclrSgXkCe61BqtI10VdZEB
X-Gm-Gg: AYBFou3GhEBEiQepJKikoKUTpzONbbq18lL6Fk0fLV1xH4JvsTMMl0bwrlDJN1Nz0Fp
	TrX+dqLvJtuat+LiAsYaqDG6iWh6367BdNhGxNcC6X6DF7Y9cJixJOH3lslYQIvq//b6VMd6NWD
	cwQrXD419lSiwWU/mVKnLcQHmS68itb1JIuOMGgxamufCuyDNfz2Rna6o6JS53Fc1Ub2RAbG4f+
	8OIJLqW90ym1GnXw1zXWSJH3eBQalq+FnqO3aZFtKtOXV8iR5QkMZxDh6jdvCRzY3fp22conP6B
	R+rcZfrFXseCg5COzua+LerO7A2nQMyWtYaUzzQTtP5XQCH9JgnPiTnulN/slUASLhunninquIp
	jEg/OkTuzwkntah2QV9o2k1QHeON1B45KN2WO+lsSHESKLs9YNy7VwF2b2mZktKJFdiFHf+wTIM
	Qz70gJcJ+y
X-Received: by 2002:a17:90b:4c90:b0:3ac:9a5e:9cdc with SMTP id 98e67ed59e1d1-3b197d301b6mr4920231a91.19.1794574453271;
        Fri, 13 Nov 2026 04:54:13 -0800 (PST)
X-Received: by 2002:a17:90b:4c90:b0:3ac:9a5e:9cdc with SMTP id 98e67ed59e1d1-3b197d301b6mr4920207a91.19.1794574452766;
        Fri, 13 Nov 2026 04:54:12 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862426sm9670195ad.46.2026.11.13.04.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:54:12 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:24:02 +0530
Subject: [PATCH] arm64: dts: qcom: nord: Add EL2 overlay for remoteproc
 SMMU mappings
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
Message-Id: <20261113-nord_soccp_el2_dt_change-v1-1-2a7aa55d97dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGkI92oC/y2MQQqAIBAAvxJ7Tmi3iOgrEVK61UJoaEQQ/j2Jj
 gMz80DkIByhLx4IfEkU7zJgWYDZJreyEpsZqKIWEWvlfLA6emMOzTtpe+rfm4k7qtHyNDeQ8yP
 wIve3HsaUXuYBdNpqAAAA
To: linux-arm-msm@vger.kernel.org
Cc: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: QpJLwrebvnj11oflpoAuLN2xU0OGfTpy
X-Proofpoint-ORIG-GUID: QpJLwrebvnj11oflpoAuLN2xU0OGfTpy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MSBTYWx0ZWRfXxOE2C0vHJbAR
 yU0Yto+VjHtsFiDkL3c42yuGGWZDYV+4OB5ggrVE4ktHn2NffHFFxf5hw8JX+jthMU+XuUyMQ8k
 +c17Z8fTEvtI9eraCZXiszwXELPQS/6oU7ZMp61ojpjlr1HoHZ2Z7xkOvjnM1u5fCAroJM4YnPS
 F4IRAM/w7WMFAOOTC+QTk9fhBv4a9l9a6h3hUdLOtvmBP58yoccucFoImZMeItOFUCRC5qDhm9F
 Eh8oZcTK3xzeRCKhSQrT1cCOqJ7Voarb4Oxp5ja/RERWhKtziOz/sH8nme0FayxmqrZ3pms+wTi
 CPXZWF2mMFCvHKJ8HQkQCHWdBwtDDX6zlKLbxX0GLUXGXEfJcTBaYI4zK4FQSBBMSsDfrDU6nHn
 gouezgUMrmwf/ij22xAWz4cFvEU2TRcUO5Kp3x7o09YAB5EFnDGM3g/wqwVUznIvWAtcLHUT+BL
 I8rcoOlEhGYa22bimzg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af70876 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Owh0couRmD2wKVmIMQoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MSBTYWx0ZWRfX0F22DbD4s1U7
 VzjOZ2UHINLhLYPnT6c/enzmoTROu3WCq7xPNgDSA7+YGEee3mlO2fh90rT7p9wBCM5gamdKPSm
 01crPPQVkWo8drB7aJYAFmd86Mr/iTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130051

Nord boards currently boot Linux under a hypervisor that manages the
IOMMU streams of the remote processor firmware. When Linux boots
directly at EL2 without the hypervisor, it owns the SMMU and must
describe the remoteproc firmware streams itself.

This path adds nord-embedded-el2.dtso overlay carrying the iommus
of the ADSP, CDSPs and SoCCP, and apply it to nord-ride-embedded
and nord-rrd to build the -el2.dtb variants.

The base DTBs are unchanged, so the existing hypervisor boot flow
is unaffected.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Dependencies:

[PATCH v2 0/2] Add binding and driver for Nord SoCCP
https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

[PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc support
https://lore.kernel.org/all/20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com/

[PATCH RFC 0/2] Add binding and fix SoCCP carveout for booting Nord devices at EL2
https://lore.kernel.org/all/20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com/
(allows two iommus entries for the SoCCP and maps its carveout
privileged-only; both are needed for the SoCCP entries in this overlay
to work)

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |  8 +++++++
 arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso | 32 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..2e68993907ab 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -190,7 +190,15 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride-embedded.dtb
+
+nord-ride-embedded-el2-dtbs	:= nord-ride-embedded.dtb nord-embedded-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride-embedded-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
+
+nord-rrd-el2-dtbs	:= nord-rrd.dtb nord-embedded-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso b/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso
new file mode 100644
index 000000000000..50c5057f6683
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu_0 0x09e0 0x0>;
+};
+
+&remoteproc_cdsp0 {
+	iommus = <&apps_smmu_2 0x0360 0x0>;
+};
+
+&remoteproc_cdsp1 {
+	iommus = <&apps_smmu_2 0x0760 0x0>;
+};
+
+&remoteproc_cdsp2 {
+	iommus = <&apps_smmu_2 0x0b60 0x0>;
+};
+
+&remoteproc_cdsp3 {
+	iommus = <&apps_smmu_2 0x0f60 0x0>;
+};
+
+&remoteproc_soccp {
+	iommus = <&apps_smmu_0 0x1960 0x5>,
+		 <&apps_smmu_0 0x1966 0x0>;
+};

---
base-commit: 84470eed3bf92713b51cfb2ab38d62be932b2c09
change-id: 20261113-nord_soccp_el2_dt_change-b2e8231deab4

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

