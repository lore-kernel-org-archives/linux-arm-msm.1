Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60DB3A9014
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785215477; cv=none; b=Yo9EpxWC9shr/Rhgj/RizmJSNf1y2YR7+nhpYyAMWR41m0jO2dc7NaCl88OkUYAeMiowu8HLhKTRv8m2hqVyBGp0TDvVw8Rq+Y1mL9y/8jZOnR12KeLx57DwJdeifsO4rX4191IuX+Ux6JDjKP3JWLMTnhTZNd+6mU7xnY7Exwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785215477; c=relaxed/simple;
	bh=q+UK1XhtSfIhjthr20rgfkj+oUHnC6ToCT9BL2OiKjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DsmfuZv85u4muBaCzivev3+NGBLhBvMDTKNKAvRBEdzzGHot3k/3UydPcjRp6gWmSFjG5U2InvQP4susz8iXHbIkt8J9nM2CaFND1svGQH2uerfxCt9KwYUIjCPqeRgpU025SsqmXCEgg3VXKHocNLd1tZGqOtjqf/w1Uo1OjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1ftWEmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stm1J1mi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1ftWEmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Stm1J1mi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aXsP1303470
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xPwsVOCTiK9RFodipmOUjkKrchhpTiUvCqn
	0W9TM1Ow=; b=e1ftWEmXO2NuLjqe8ijf4CaiYNBAo2aPpqtTohMfL30tz2dWrdn
	zvrYEjK8YcWsLvlwGw9p/SqQB5MtGkYno02y39dPYK9Sl72WmfdvESSsQ8DAFtMC
	rsTU9ksQFZaOcFpFoOBrTZhJASYeBshGk5AnjafjdCZwQ0cbXxJInRFubM/X78Qg
	wY7QubVXnC1+TvGbwC8k6wIqH7bEuVwD8RLMHXBpbYf8Y3zBCGPEKINDBQqngbvP
	0Ml36Nw9o17Z8vLB7wkO9L4EPUMJiTFJl8bHd16tZTThZOFS4l0twBqXJ1Osxy+U
	LbMoqXlh25ipUOv/ltOwytaETuxZNlL6tAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8ajxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:11:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee894b3d8so42462985ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 22:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785215474; x=1785820274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPwsVOCTiK9RFodipmOUjkKrchhpTiUvCqn0W9TM1Ow=;
        b=Stm1J1miTnLPE5hD83Jk2QGb248sanBF3RF0YpZNXZKiotdubkDtuOn17/XaPLeLuj
         pQMc8a/OBMCvE5oVJERqBNn2//3v7mdQ2sgNcJJ0Rf9us+/d/IyoMFMn12wTdEyv6pvq
         z6usuYGyHAfLeViZ+2LnlYRYIadY7bUQZ2Pd61f0q2eOYG0Nc8GrhbEkFYPZDwJ+wMp+
         osRuCXbmf76rqQVIk+9r8PDqEBGXubXuSfx1ihTcLH9gPbMWYAEF5ZvMiwGIRLa+Rskd
         5BjeJsYcaH20Xpg32v7pAcOGhsXpfMec5xAiLebuiomIX9CAhJJrrC9RJ3Xt22+Xo6PD
         jcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785215474; x=1785820274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPwsVOCTiK9RFodipmOUjkKrchhpTiUvCqn0W9TM1Ow=;
        b=aGtx/vzAsRZ9ZugTegSuTBnEYDU3DHBANwdzHmwRTCQAqLzlp5/+zo3463l+wJ0uV4
         D3b6Zqe2BHhazhWulE65sFQQqEN4IkdxsNTH3Ua9xbnu/LgHo3y/SlrUs8YIjJMuO2z5
         w40daTZy0tn0uMdA3HZ+wJECqECxznuu1WkZ3EcICUKyymHyYU0WA9yAK676fVdcEzqP
         N8mI3T6PLfuKdCitc3ipnqLi62JizLMlMtTQ00h3EcDqqRgiUJZEnBU+1LaZjogum53e
         Gg/O9Nie4BNfyMaKM8U/QsVtd4L/eZlulp/dvgCF+qt0tAo2deHNzcA/E5/lypUQlA0n
         UY8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWC2W7fysdtIY7qfb4w8zsH+3QbgHfYLT0AJvl/lKXEUkBJxJAnNa9GMa80Vp+fM3nEfh2WBU5pWnb05nF@vger.kernel.org
X-Gm-Message-State: AOJu0YxjG+mxgdbQVOmUXr1Y8gCaPI1vFtTeyH/jDeDk5kq1sCyuCR7x
	Et9ZIsGzXBaRwbqdNOIOiZALKBHd+l0CE3Uap+uil5xQZ/jg6DLkYhZfxtUDQynpinnAyc1CCS5
	ErDg6zwp98jh1WkxX1hR1qU1hTtCd3Ljuxmn2VS8olg1ZxIi+8GX3uwkuNEukf4ChFd5q
X-Gm-Gg: AR+sD10IQ7tf8O3tbttQNiNxpwI3sd9dNNVXXrD9xpYqkgFmhmtQlPYX7OMqSttA/WA
	mO9qDAX8qQYQRJlFyNk92Z7Kfgv4RLFYBTr3g/VxlHj1PEeEr92rC+bYgBNxwtWNaHZhEh4xaGG
	sJaY8uzqHE9TtxaIorhjivugX0qppdBYd3ZshXbnFNlSr33NICvUQARnd/KBgPlbPB2MPf8Njgr
	p++L4Wr/1XcbPR2ztzd9fhH1peLgIatOuOe98WwoYGI5A3InlZvUFjJhrzCBU1B76W7OBxLGv1C
	rFbKerQeMK0LsgS2bGIwznuqBT+GzgTy4slPICo7cAx8UKsv6k57q/NxV4xBlfN6DSGzgpSefLE
	AJ6eRRSCZsYKMknExMRik1313spi59BRWUFiyq5iYqZ7dEjq9Cz9rT2EkvhEI
X-Received: by 2002:a17:902:fda5:b0:2ca:20b1:3e0a with SMTP id d9443c01a7336-2d015c8fbcemr11760895ad.3.1785215474371;
        Mon, 27 Jul 2026 22:11:14 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2ca:20b1:3e0a with SMTP id d9443c01a7336-2d015c8fbcemr11760495ad.3.1785215473976;
        Mon, 27 Jul 2026 22:11:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e26e9sm46069695ad.23.2026.07.27.22.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 22:11:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ufs: host: qcom: Enable MCQ support for sa8255p
Date: Tue, 28 Jul 2026 13:11:04 +0800
Message-ID: <20260728051104.675088-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA0NSBTYWx0ZWRfX9EQTmu1gBXZ/
 oIiRVD0Vs5VoDchjWN3egDTaoHJGsHOwgMrfpbkyxR8ZbCB0SRpCrW4oZ0LRI40IGh3htozwgce
 3ZbkSG83gFAhqpGTK1x6VT9r7gMSyZE=
X-Proofpoint-GUID: sXSftts-KEnWVV-kqKvw4mmsNag0-t9I
X-Proofpoint-ORIG-GUID: sXSftts-KEnWVV-kqKvw4mmsNag0-t9I
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6839f3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=E97KwoIb8eNdQlaa2bkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA0NSBTYWx0ZWRfX2EP8fc73+AKU
 HQGAFVYjJyzsho30jL1JFqDjHCIZg6HINurs7TOkADkY+CeB0oJEEKa6L3X4rIMlV/sZ2WPoJDF
 qPPwIQgxRAI6VgtwSn37PQJX4I+NYrRMFiUDVlhB1JGSS6HL5Sfc+u/++Zgra9QsYTTfk/IVZSM
 RFYiUd2wJ+6Ra3S1pwbB4pmd9ChR5ccRM+Ou7lzuG971+wtiY/kunTyia+cLEjLa+J60XqHKfdQ
 AqNQOhrcH4CUyM8JwG9G7KWBelpvufoWX8jHfasecFzfqua358KNns1mB0mJLxoq/EIkiTfg8Wc
 cyU+Br8M6peLDnikyTAmGsMn2BnYGN4AO3UwZNqVcOkGRWp+FTqvZBcTLSt+PC6URZo2ITj6Cc/
 4fDhCG8YcIZvMHhTXxryyL4z+BVASm80Ff3gpYTItsVdZr/hflRqIcarKUesc5JO7EFQuMLqYwr
 BGq1FrMSRskAs0kiKPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280045

The sa8255p vops (fw-managed variant) was missing the MCQ hooks, causing
the driver to silently fall back to SDB mode even when MCQ resource is
available. Wire up the same MCQ ops used by the standard qcom vops,
so that MCQ mode works on sa8255p.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 0500320545c4..d2acbbe647cb 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2950,6 +2950,11 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
 	.resume                 = ufs_qcom_fw_managed_resume,
 	.dbg_register_dump      = ufs_qcom_dump_dbg_regs,
 	.device_reset           = ufs_qcom_fw_managed_device_reset,
+	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
+	.get_hba_mac		= ufs_qcom_get_hba_mac,
+	.op_runtime_config	= ufs_qcom_op_runtime_config,
+	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
+	.config_esi		= ufs_qcom_config_esi,
 };
 
 /**
-- 
2.43.0

