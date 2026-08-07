Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB77476068
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118664; cv=none; b=ckrlpF0nmV+Rf0h07K9g4pFZU6x4e0PyJ3cpK6EZP6bI7CCZ+UBCDbJaEcCbwTGLo9cCXTCt2Gk7p93sOdCZ6Kf6YiT6dNkwflfO9SEZdLykdgEMpKoB87yUDPclrEY395q5YM5Aa4HEjD8XrhaU2Tx4VjsEinrOJ0TczPUx9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118664; c=relaxed/simple;
	bh=IWPoidckTkUCDUTtIIpJEWOGkTo2Wd7LukBSrJluNS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/k8pXoqd46YjdiWHZJiWXsd7xzVKGNVaevBt10MNypLhSDC2wWyiiXWugQFAdaC3yDfNWPkTNgOHqpP1UCRToSj8wqlqk23aAPBSeSPX2A69wKTuI7xFrc2wdVcD5dgGDQGtOlra6D6YO4wKA4UkhtEwtZcMc8AT9rKWrjU8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIHsZmDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGJcsuyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIHsZmDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGJcsuyw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FS16Y1367285
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKafyX1Wb/XkrOV9lBc+42hvctUQmClx/XghBkmhpvU=; b=IIHsZmDJYpG96qjn
	B2VTNH33vkcVgVB9pzSuC3Qy9the1galPocuRT3rtudgVPSfAxllPb60RW+F7wA0
	V5UkaswvoSw6PvEb26++ptg2CMLgL+mdVuFwvODzIjsJssgqzqd0Ja8X1jhqGitc
	tm5DBVkmt8RdhoUnAszVGjPvwH547hVHvxE5ulz7xlCLhrUuzNF540J4l5iDQyIT
	9Td53i7zttedGxUTCB1vYKD6zgat8YeI0XCFzdqpVIFWGPLVaHehWPf+h6pmKnIg
	xcMIuAwtyvdQCMWIWhZsLZ1a+FNVNSOtL9RsABwvyXagoTOEd5589fcM36yi32Sp
	5FPZ4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp9gxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:04:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so3764665a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786118661; x=1786723461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKafyX1Wb/XkrOV9lBc+42hvctUQmClx/XghBkmhpvU=;
        b=HGJcsuywy99npCKts2Jz2sVqXWc5y5mUvsz3dwXJ6M16cxOpJxe3JKpjuXXnJkfHiN
         IzP+DNzz7E/qIMdVy/t6TIc6cTzJbeGJhjWge8bKVUMtDqWjPmHdBZ7BOG4IMxP813Sw
         xIznE5n2Lf4CCiL2hAkEN140mM+u53AV5Xv/vx6b5OoPDLUOfO4ppRMJLN+kMo9hKdTh
         j1Hgdep4YHEA453HTvq6kkh9U6sZIxpNzweM9J2jbqElaLYDjlX/J3EesDmbXNAd7AIv
         T2GyZVhohypsKXcpcBwDHUBQ9vDx/GefapiACeU8m1wgpwGBDIP5djtIe1LDyDkVMc+l
         iFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118661; x=1786723461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKafyX1Wb/XkrOV9lBc+42hvctUQmClx/XghBkmhpvU=;
        b=Kdvm71Bx+27C/OenjiLmq0yL1Y6UvOlkop+sWidG6IaLfvoSt5Gd7/RkPsEm8QXKbe
         NIZrYjeHJGE+uJtiy/9o+obEqP5YBDkoYgg4xiluw/Eo1Owl4wcEUw6UFFTjRJZHCnXz
         JAE/9ypBH6AL37Jid7clZg87Pjt45gNWNSh38f6Yrp7q6c32UCvEOrjQgkTuzHtz+H/0
         P3K+DL54UJowQOHQRwhNKv+6woEwnJUGVIyAhQs1N9GUWx6owfijZ+5fYBX+cNUgX8v7
         cMYEEmjNFgRxJgRXlBr+t3gYT7+Ow7dGKFu1Jo/geRvZM40XcCWFxan2RKKex9uwDiRr
         MeaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP/8QR50rc3eWNceyawNSfHZDSBvY1Sb24ZkSIxHamNcj5g3AOfyAKh12X46Tb2oRKudNrTXlH7o6yZ866@vger.kernel.org
X-Gm-Message-State: AOJu0YwDyeIt6eG4IOl57HchuuRv/i7ismUsWmrtHUCNrHd+JsOfWKF1
	2UPHxF2mmLY2WqgKeFd8mzKkCsYDES9dFRRxthgmd4gofiqAc56z3ybPWcp0McXIugVboz2lQFg
	c32PDzhaaMvsiigOpmagh7f/v6G6iHN1kbu8OkQGFzUQZZD4K22Av/5PtI7lpIHBYQCFf
X-Gm-Gg: AR+sD12UI3MQXposK+JsaKwcf8mctZPYfhs0W2at0JMC5roUNQqPfBYcXmoOi7osaNt
	8IeqGdFGl7lyroWxMHyxoePT7D1Db8p8KP2v+Sft6H1Sdvo5X4qsoleSCC4NVUFjztSDsmzkZcx
	yxLdgoAMT6Uo9GGrbEcx3Vp0gg/eRSfYn1j0JZq7ERIUV2KO4I31TGvem02X83zjeEQaygAZ4C4
	GvyiLhnhxHi+heEXcijEnrITecd+gPHXEKwWMBNVACCiPKSLz6W56Od2Kms/cTbZrktnewDPBA0
	b4FQ51/yvQSASafY9Ywu6KQbr9UNmJVZxMfs4a+ieAJkp6WFxblqS+IPkYfRiJvGlV4cQx8Mx1+
	K/6GzMDxaVW/Zxr/eMtiu6FbeplQWYFc5o0JOFyJDczQL5q/jiH+VUrB7ymxlIIEL/owA1MYpja
	Xp5CcQv5MrTNM=
X-Received: by 2002:a05:6a20:9e48:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3cb85ee77c2mr32272955637.25.1786118660921;
        Fri, 07 Aug 2026 09:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:9e48:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3cb85ee77c2mr32272837637.25.1786118660388;
        Fri, 07 Aug 2026 09:04:20 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm8337541c88.2.2026.08.07.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:04:20 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 21:33:57 +0530
Subject: [PATCH v2 3/3] spi: spi-qpic-snand: Handle Macronix quad read
 opcode 0x6b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad-v2-3-8ec821e2f22b@oss.qualcomm.com>
References: <20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com>
In-Reply-To: <20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a760206 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FygxKSnESxtamiDJ3dkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vjiyWPlyr58lA9nCvX5hkzFDZ_itM83m
X-Proofpoint-ORIG-GUID: vjiyWPlyr58lA9nCvX5hkzFDZ_itM83m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNSBTYWx0ZWRfX+OIqEjW+h6CV
 CZoDTpzfg7zT+GaerHsYIVewych64NHFBgIvRHqDfqx2GRxjey+Z9NG5Q5HUH4br37JpvGcreak
 Re7kTkIkXU7IT+C9Z9xpTBRUoTE56j6+2TN8Nw4g7ISaUTa9Sxi8RY3asSa7sZvPniYufnK5qIq
 GcjfVk2lwCl1KndWE/6qXl52s5GTBkE+sfpW9a45DAfZDNf4Cw/ZJugl0Pk9DsZa2pbzk09/h2J
 GIJ5oRzqkNjf5UEMTPoF74zyro6VLekmFZ9aRtvtgScF6Onv7rUvR75xFoEQZ879QlHTFeaGnWF
 9dvyxyFQx6bgqzHdfyFQNRTOaBNOIwDmh3MQfg1qYkjGLgBWsxtBr9fugjp6yQDfJJhBo0GXaV8
 vb06pSXAGMkAUkkkIZoNPM537Sd3ZaAU/+EX5YW4LtO0sH9hzbUPkLIgiThWfu477mKaT+vUYIK
 9tVV7gPMhKQksZXh5Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNSBTYWx0ZWRfX70T1Bk8bZu8x
 7/kTViG5ypIlnaP4boibJurbVefgeOUXX7g7s2+m7NeNO1mGZGbSJgu2krT1mI6a+/JC+pWKzMw
 xXwg9dXAPjCC3XXqpi+7gFou5/ddHAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070125

Macronix SPI-NAND devices use opcode 0x6b for quad output cache reads,
while most other devices use opcode 0xeb. The QPIC SPI-NAND driver does
not currently recognize opcode 0x6b, causing read operations to fail
when Macronix devices select this cache read variant.

Add the Macronix-specific read opcode to the command mapping logic and
treat it the same as the existing quad read operations.

This allows Macronix SPI-NAND devices to operate correctly in quad read
mode.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 drivers/spi/spi-qpic-snand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 6ad2f96dde8c..61b1f2eb19ce 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -52,6 +52,7 @@
 #define SPINAND_READ_CACHE		0x0b
 #define SPINAND_READ			0x13
 #define SPINAND_READ_QUAD		0xeb
+#define SPINAND_READ_MACRONIX		0x6b
 #define SPINAND_ERASE			0xd8
 #define SPINAND_WRITE_EN		0x06
 #define SPINAND_PROGRAM_EXECUTE		0x10
@@ -1036,6 +1037,7 @@ static int qcom_spi_cmd_mapping(struct qcom_nand_controller *snandc,
 	case SPINAND_READ:
 	case SPINAND_READ_QUAD:
 	case SPINAND_READ_CACHE:
+	case SPINAND_READ_MACRONIX:
 		if (snandc->qspi->raw_rw) {
 			*cmd = (PAGE_ACC | LAST_PAGE | transfer_mode |
 					SPI_WP | SPI_HOLD | OP_PAGE_READ);

-- 
2.34.1

