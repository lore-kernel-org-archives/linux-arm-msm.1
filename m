Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC823F660E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218694; cv=none; b=lnTLc7XpPoUVCN9rHoUBIH+YU7+p0xvo+ggXvv6sLGmonpArvXUmMOwWaYaVGSfdLZL4n7g5ukC3wL2AnJTajHWq4dofwrAAoQOfZZtZDNkbFITA3H4yCM42Rq+bHlmDbEhM7HhtFwgnQc6h/I9X9l6Tiv/O1uXNZTHEk4rcnFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218694; c=relaxed/simple;
	bh=etfiY+PwLIr0eh64UPPY0tVGl9GnSfqZZ6UXyBwGV24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XvH5cW6BinD+1IaGLEe+4WKa2ksB0HpU44gCRa+asR1XrSWuYZQeKFBymZ6lYEQHACDm+FimyqIxyAKyl1RAKGEiQFVoO/HjMceNLSrjdN1WrAEpIbTCyP+kQ8X1tn8kzFV6mi99kY8OMqbl0anoaldN+ozogk5SFNfcxyCv2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSrOf79i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0jQMIas; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSrOf79i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0jQMIas"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eZ1t2161130
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NIX1wKTHzmNkLxxGykTdyB
	F72vLlPWweEc8exmaaQEg=; b=MSrOf79iUxQgUKqfRr2DpIyUpchiTiGgAxO+hh
	hJk0rD/uOo6dHxzRrzfP6CA6biKZNsv72DD+3ePr1yoRR0OPjhFgzw25LKLR569/
	50lFdm8KfbG4HzDwWMSsFR6dBjC+ObLWBsLQTSMM744mom2XC33yxgB6GEqjaEtQ
	lVXwEoxNbxApAT9nv+JUzeH/ewsToQqTY/rkw8cG6cOnCagFkU+r/9GCll2QxAGm
	ERkaYW0H+abdLieu3KmgXiKpLnBJLwMMxYmTNMnJ+JyWOIFh8a5REmaQaGh2dNYy
	+HC8+rjHuBDfWp98t1U1rEE/Sf+jOuL1D2BiHxZETZZpXmEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rmsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:38:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so8747995ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787218685; x=1787823485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NIX1wKTHzmNkLxxGykTdyBF72vLlPWweEc8exmaaQEg=;
        b=j0jQMIasdba4/5R/ylznPhwpmP8wbUFqwDbTDlqtEQiEUyQwleM+nIjyDB6RIZcgOm
         TsAfITGuFRNSyE2O09v1457f+dR+h9RcneKofKFacJgSqQNC166GrA5qI+ho9CjlxVp7
         sJYAqj7/AWeVg0X+lmBZbIbkTUW5wgXAAZeU5wYsoE2Osy2CLFIr7OoegMSswqF5RBC1
         VelswJZkpXBZyJ5xowKa5IqA9+s1dIq+LCfrkK94B5pYP8bCXCFy0YjBfqFFbepJ14w0
         CU4ds2g9KY3Y7EamYsuAWV6FZ/wz0Nck8KjwrQRT0XGuSPJNzyzDf40UtZ/+YF21gZ30
         eXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218685; x=1787823485;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NIX1wKTHzmNkLxxGykTdyBF72vLlPWweEc8exmaaQEg=;
        b=bNSNg0flFMSNczEAGUSwnsXdX3/Jbl34y1mo80rb9yHJ5aXKV8aIgxomYPhplV4+bY
         w3gnDN5+00waEIj8kwsYJv/qd9nWr0CG0zlYV7zByA2DGCpKtrEXEofke2xevFROj82q
         s57Iiz1/m8CxVfcZN9setCqpS1XzefvOXE4IDylIEC9dqQyNrI5H06A5R7lpYJ66YtHD
         /5Gk6cAitB9ZvZ+fcWqmeMro+BrbTDs6QEg43OhoXDRBT9MiqPdbs9F4d+Za9lGmR2Wj
         FXtuuukB944izVTVy8StxU7ZFqyPoIDMnXxrTSLsvM2LbN9jH3RF/MUZVz+fYAsLJczK
         p72Q==
X-Gm-Message-State: AFuF++nnD3oN14I8lPenc9rZ6T5vth/7PtHAFTYi9gm7hYFHmQS3Naak
	yEKUNxfbI7OdrM9Ypa9wMRDYkWicRNpJRsHfyb0MAENAD3zj2QL+aeGyKk8gpskTO//1OVqX08x
	AOvaJVmpnHXmv6igtx7+0pVnfViuk5HMGXPYKuceZAVnDUOk40ak6zxqBNjpGCda52Xy9
X-Gm-Gg: AR+sD10MZomUS4VqG0Kl2wEQN8cJ7biiZuX9nPGUKe+EGaMjq6Z+rDJIFhJbkpyVmfr
	qXzH9pSrK/hmFVhjHHZXOX7hTod6j0YHBw9cNzopXQbYnrmTAPA5zeRH+fMD11uzezEyomlMs2R
	MevXWC58hFCV37i7vFu9pim6jKMOoutAMUeuAsS9rucYtngYUsUtje1lJZ6BI+wXexpp36QIGUX
	jOBd13Q+wl136n4lOzGURbULJkeajnXjj95n/o4kggfJcYp1zKD4VPcQav3CNoQG7/G6KbTSO9S
	0zcIiEL3hjQpKCco6+9ho84gnxGS4IM171RQ/Ufh1tETWGvnr4DNczgS/QXKyuFO6JJqPrX2cu9
	oLCeaq7lzvZaPEKZEAQD2iihAmlQLSf7n
X-Received: by 2002:a17:903:3b85:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d61a0da51fmr66469915ad.8.1787218684727;
        Thu, 20 Aug 2026 02:38:04 -0700 (PDT)
X-Received: by 2002:a17:903:3b85:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d61a0da51fmr66469235ad.8.1787218684234;
        Thu, 20 Aug 2026 02:38:04 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1c9sm4343065ad.38.2026.08.20.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:38:03 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:08:00 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfKhmoC/22MwQ6CMBAFf4Xs2ZJSawVO/ochpqVVNlqKXSQa0
 n+3cvbyknnJzArkIjqCtlghugUJw5hB7AroBz3eHEObGQQXiteCMxrwHvXFzpNnwvSykdaq40F
 BNqborvjeaucu84A0h/jZ4kv1e/93lopVTHLbKFOLfW3MKRCVz5d+9MH7Mg90KaUvQkntya0AA
 AA=
X-Change-ID: 20260820-shikra_dtpm-2bc494dd6756
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787218680; l=2785;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=etfiY+PwLIr0eh64UPPY0tVGl9GnSfqZZ6UXyBwGV24=;
 b=uXnXPmSzXQnFPfP7iFN+KjxEikRsLy6i6R7PESDHycMmK/5RD9dshRFjSU/2HjJtANSMGwJyB
 8uSQvSBEzTmBCotLg2MgJ3alN+HOVOBwVMQNCM9m3+S3oxCosUwZIZR
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfXyw3tOGdVpkoD
 rHF2ZImUuWfNUY0c3NN13tebt74TFNwTuZfY43FSMizfrcFenA7l+KST0K20VD6110QlDe4rIfj
 ynV+n6zimeeRBsGtu3AA439Vm/v3ZN+tHHTzo9yTARhynGSxRuwiMD9He7F1l4jGZgyXTXja47S
 0TmC7PmHVnuC91pX5UF2J8Fx6rBw53ArngFiT2rdHySzrJDRbvIJ2UWvdpwz73TEqhLnhQrSPZT
 6GIG0Npz3c9uolnY/RdLSxvdPHPmJ3orrl+p/ZMsh/P79NHk7sccGOn4XDD8IZvZ/NfUxGLJc/o
 a8uiO+m9qtTkbZyvu+XsmR0SPi5K28SMYZVQaK+LdatHw8O55GlSIVrzOxPmWXyWzkoj4o3gLXi
 WITJ9yRcQngjBoaXfKg4qUUHQkvyBp89KLAz6+dUo5nZ28/CY72rS5eQGcKVk2qfPqlOd3SS+LV
 vtb7PWk22hTqfqNoPZQ==
X-Proofpoint-ORIG-GUID: zomF7txyteiPocRJooYp844hyQ-WTWKu
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86cafd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uLInlHqCeYv2vpw5_MEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX4ZsIpVWhaK+m
 VZQaf6BOd1OFwCR9rRexfni2txLPL+uh3Ba4bDSpUnEf2FRPv5zPbt5Gt5fr2fznI/nzXmk2Qrn
 JcCeZprAUPXKmWY2exusSY81vt0I1KU=
X-Proofpoint-GUID: zomF7txyteiPocRJooYp844hyQ-WTWKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200070

The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
connected via SPI5. Enable the SPI controller and add the TPM node
with the ST33HTPM compatible and a 20 MHz max clock.

This change requires SPI5 to be enabled in shikra-evk.dtsi [1].

[1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
connected over SPI5. Enable the SPI controller and add the TPM node for
all three board variants.

This series depends on the SPI5 node addition in shikra-evk.dtsi:
  https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..32916e9df9d3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..bacdc7c77c2f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..b42f94708bfd 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};

---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
change-id: 20260820-shikra_dtpm-2bc494dd6756

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

