Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FB4749DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118659; cv=none; b=qGi6CLyTPJVZ4hNAs7mTIoF2l4uv5DIu5li8ljK75dm7bXpIPm1Iot+uq2zpzw3sc37/36LoFn5Wuk3mHx9qnit2TrK/CNzaUuGriJFAcHznec6F7udPL5kumpzdTiQ2j+/f/vPi2Fx2yPV5xrxLZw9NJxXNmEtqnshoS5xeCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118659; c=relaxed/simple;
	bh=RTHMKxogHTIVdAiFZGs5J+GGbqRIMipvqbZrX801VyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3Lx5E01NsHTyleyWi6Mh9j6YH2oaE57osrDjH07DB7QLRcZYd6qMvV27zOK56kqYuRqRi9nZg9m7NIml3OnkqWunE+xQFNXBYWQUIkLgPmXfXgRi9sFII/Y7hHjxfsfPtRymhG/umGiFS5dUXKVwiAbEYMJgW473LjpGzmUXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPJkqmk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg76XiL1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPJkqmk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg76XiL1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FRcpJ1669644
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33TYFwncrN46/2iN8rzuq/WUVc3WbHSRn/5XMBLGW3E=; b=BPJkqmk5xiiSKIkk
	/ckRYGErHWsuHeXCA4oA2j5STN9JCMZAKT/9bg3MaFkVUOOfPJ9KGQoiUgMk62db
	ntA5MSPm07aWlksqvIF+lYMdBwPF/zvnMhRI0tKYZhwmYUK3ELozV7Q6W58QiN0v
	Ei0X9Xa89KLjvCjI+VgbBvpj/89LtrWOOQdnjEhyaczjnhI/vQbbDBD5kf61uKiZ
	VdpE2MvXl5B+Rn33GyKLGVMTnbNCeWtTojLdykGyiTzPW0Ud4Dk2BlG/MsFRMK54
	hde9fepDPfqOvkghY1uoyh00YDNSeWQPaZjdRhMPTUYKFOgzKjJLE3tGNPF2c0zT
	cQsppA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gvt1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:04:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3293697a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786118656; x=1786723456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33TYFwncrN46/2iN8rzuq/WUVc3WbHSRn/5XMBLGW3E=;
        b=fg76XiL14PIkmKGjYK1I7wvP3yV4KzsTc1utaSCejTyz1ppZMsZ0pTvc5SJXKHd3ZW
         ihBMgkb9gtRG6xaJMgBMeIbgf1p6haChLg2VBBkPm/Fhe63b/D2X7IA4UJvTAiYDC1q9
         n0wUdiket+MVhs+C1CCoEGQDP1KIx4M0P1wJWBkNr61/uXWfGjBF2DnKg314CrbW9SdM
         H4ivsHWai9H2HTVyfAHD/QoVG04r4357++A0Gwk3NTM46urRVglB/Loj0MC8H+L/znap
         ySnKzC7L/8xFtImtD+sBx+bMQwU1SwsZhATry7LsM3wf2yuMDa/hySLF/2PiMeOlOdCo
         ShXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118656; x=1786723456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33TYFwncrN46/2iN8rzuq/WUVc3WbHSRn/5XMBLGW3E=;
        b=oGaU2OJaC6p+xXcyv6UxeP2FNH3jpdvWRF6UecXRhatymSx3lIgAEgPTVLrv4PDCRI
         hqdSOpQU4lgZVwofMndxBz+mWnqYuTLYsoNuQF9YNZ+8FYzFrp9jW2wLRxXx1ICqAeDd
         SH0oiiz5MmGKu2Ylz88yDR60nF6h4CG/EYAtbHbK0l4hKmYhUDnGJO2hLu6BhEzVUf8h
         Tk+H8DyqqDmt4iZWOQoY1wjfz0U/IeJE+SOG86y+zf4kro49o4K0gssCkLz17Bn016hy
         2yBpXDbhn8/2Bspq6UqOCqxCjy+x96ASsZ4mGrfg/aIvscpUELXTS5y1B+ZpZCtFxFaq
         WQAg==
X-Forwarded-Encrypted: i=1; AHgh+RrNvYTibZ7cZQEBSCjy22igduxmNKItcD3YagzogitjXXR74qR2kXK0sTmHDrDQjtMsv291I2DUlSAecueN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/uQXlUxsMzwbrk2uQHSOA5dgm/MHMCfTC3GRU6tUETB7ILLXT
	T6/XENG9+YmwjHscAKNLGhywIDFbMRZmwsObZqhq2fwv0fpOS7itDP71PMFmJvHmKGM/jmMRGnH
	0jVnlq/p0I1AN6qBDytHIT24TeBltllcAf3CkyB3AEfmwUOAlyvruvnrszEQxH7qH3WL8
X-Gm-Gg: AR+sD10H7h5gc/aleLHHX57YaW6NwoYMr03YdI5W/kJ+px5MsHvme39XjZ7ee8axhe6
	Xh1frdfMJoqjNItojAJ3+Ynij2Si9e7g+790bJsudausUGUpdrpNwOFt/4EOncZz7CoVQvic1U8
	O0krytxmK4cBDf+ksGirHCJccHlgMSHiezribC3qKFNw9CWLofdQFRHcC868j6yEjZR/RpRbhle
	IErX322OCV8/yNENmA/P4YyE9J2A1CqAjf0epKWsFCqMIl6vRIivVLRoxGWCj8mg5EncHik4Nvq
	B0EC8Ps+vrARt82NqOQ6zdFBI983VqxsJHjmZLIuOVmoJzmIsqML9AOi5boNK3NVuyRP4pqUSbQ
	zsIt01wnkXQubhkwQZCRVWPx5rZeddHAXa7bt301qsaoX0qjN0b/Bu3hJSPCO7JFoc4H2pAPcuJ
	Lxu0WN+KHPjSs=
X-Received: by 2002:a17:90b:2dc5:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3909d79f314mr12715370a91.4.1786118655684;
        Fri, 07 Aug 2026 09:04:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc5:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3909d79f314mr12715044a91.4.1786118653692;
        Fri, 07 Aug 2026 09:04:13 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm8337541c88.2.2026.08.07.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:04:13 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 21:33:55 +0530
Subject: [PATCH v2 1/3] spi: spi-qpic-snand: move command mapping helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad-v2-1-8ec821e2f22b@oss.qualcomm.com>
References: <20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com>
In-Reply-To: <20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a760200 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a1To8mgfp0J-3_lObMEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1zdxraPUYWSHj1f_2gj0-RAep1dFv1cH
X-Proofpoint-GUID: 1zdxraPUYWSHj1f_2gj0-RAep1dFv1cH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNSBTYWx0ZWRfX9YtdCXR/yhXK
 KOzSb1CSlfsF9wCpT3gUqMqQujKKCCBf/ofZAgPjq7l+AXUNaNbm89O6X6AbE/8zwaV+8M3DZTv
 PNDLBewe3gqg8NPzEJIUCofoMPo3wJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNSBTYWx0ZWRfXwruFDsWX5pNB
 6M69ReR6T0bE1EAKBSTc4GTceCCKIvOQ3yYYiawGGP/7sDaW4UcK9kbTtJAGDtolLxuPcSUpAYx
 WFfC9OgYCmeMVP7U3fKys219kgYSiM/RmOvRRQFicbpl2Byxh2iUsk0DnK7m3J02fzIZRy2eHRV
 7BvCwhbeMecdToalQZccnBhqGjWCIZ5hp4bRXst81RzudHElSlzNY2wQdnmfXmVmejvVYBDCQCe
 NoBh4WligeEnLg2NRF+lj0i8f/Urkt4qeLTo4LSQTVCjbEQQJjEZk59MrEydLMc/Y2zevw4sLMp
 z7OgRwRw6XgkPXT9sFtiNl+DR+oZH3dWBOGU+w3Vy8ircw7mZS6HR1nvq3EEzy3W8bV5MH9z8sG
 Ss1g2UiECWTbqbfK7d4yLjykkPwf1lEQw5as92vXtelCnY5a4edF2JE7uJsulIXKWz2qBBPj3Ll
 cZriOVasjSyvqRiJIYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070125

Move qcom_spi_cmd_mapping() above qcom_spi_read_page() so it can be
used by read path changes added in a subsequent patch.

No functional change.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 drivers/spi/spi-qpic-snand.c | 96 ++++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 1e2fc875cd66..db105b3fd601 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1004,6 +1004,54 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	return qcom_spi_check_error(snandc);
 }
 
+static int qcom_spi_cmd_mapping(struct qcom_nand_controller *snandc, u32 opcode, u32 *cmd)
+{
+	switch (opcode) {
+	case SPINAND_RESET:
+		*cmd = (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1 | OP_RESET_DEVICE);
+		break;
+	case SPINAND_READID:
+		*cmd = (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1 | OP_FETCH_ID);
+		break;
+	case SPINAND_GET_FEATURE:
+		*cmd = (SPI_TRANSFER_MODE_x1 | SPI_WP | SPI_HOLD | ACC_FEATURE);
+		break;
+	case SPINAND_SET_FEATURE:
+		*cmd = (SPI_TRANSFER_MODE_x1 | SPI_WP | SPI_HOLD | ACC_FEATURE |
+			QPIC_SET_FEATURE);
+		break;
+	case SPINAND_READ:
+		if (snandc->qspi->raw_rw) {
+			*cmd = (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
+					SPI_WP | SPI_HOLD | OP_PAGE_READ);
+		} else {
+			*cmd = (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
+					SPI_WP | SPI_HOLD | OP_PAGE_READ_WITH_ECC);
+		}
+
+		break;
+	case SPINAND_ERASE:
+		*cmd = OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE | SPI_WP |
+			SPI_HOLD | SPI_TRANSFER_MODE_x1;
+		break;
+	case SPINAND_WRITE_EN:
+		*cmd = SPINAND_WRITE_EN;
+		break;
+	case SPINAND_PROGRAM_EXECUTE:
+		*cmd = (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
+				SPI_WP | SPI_HOLD | OP_PROGRAM_PAGE);
+		break;
+	case SPINAND_PROGRAM_LOAD:
+		*cmd = SPINAND_PROGRAM_LOAD;
+		break;
+	default:
+		dev_err(snandc->dev, "Opcode not supported: %u\n", opcode);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int qcom_spi_read_page(struct qcom_nand_controller *snandc,
 			      const struct spi_mem_op *op)
 {
@@ -1268,54 +1316,6 @@ static int qcom_spi_program_execute(struct qcom_nand_controller *snandc,
 	return 0;
 }
 
-static int qcom_spi_cmd_mapping(struct qcom_nand_controller *snandc, u32 opcode, u32 *cmd)
-{
-	switch (opcode) {
-	case SPINAND_RESET:
-		*cmd = (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1 | OP_RESET_DEVICE);
-		break;
-	case SPINAND_READID:
-		*cmd = (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1 | OP_FETCH_ID);
-		break;
-	case SPINAND_GET_FEATURE:
-		*cmd = (SPI_TRANSFER_MODE_x1 | SPI_WP | SPI_HOLD | ACC_FEATURE);
-		break;
-	case SPINAND_SET_FEATURE:
-		*cmd = (SPI_TRANSFER_MODE_x1 | SPI_WP | SPI_HOLD | ACC_FEATURE |
-			QPIC_SET_FEATURE);
-		break;
-	case SPINAND_READ:
-		if (snandc->qspi->raw_rw) {
-			*cmd = (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
-					SPI_WP | SPI_HOLD | OP_PAGE_READ);
-		} else {
-			*cmd = (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
-					SPI_WP | SPI_HOLD | OP_PAGE_READ_WITH_ECC);
-		}
-
-		break;
-	case SPINAND_ERASE:
-		*cmd = OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE | SPI_WP |
-			SPI_HOLD | SPI_TRANSFER_MODE_x1;
-		break;
-	case SPINAND_WRITE_EN:
-		*cmd = SPINAND_WRITE_EN;
-		break;
-	case SPINAND_PROGRAM_EXECUTE:
-		*cmd = (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
-				SPI_WP | SPI_HOLD | OP_PROGRAM_PAGE);
-		break;
-	case SPINAND_PROGRAM_LOAD:
-		*cmd = SPINAND_PROGRAM_LOAD;
-		break;
-	default:
-		dev_err(snandc->dev, "Opcode not supported: %u\n", opcode);
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
-}
-
 static int qcom_spi_write_page(struct qcom_nand_controller *snandc,
 			       const struct spi_mem_op *op)
 {

-- 
2.34.1

