Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750840B6F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561850; cv=none; b=Or6xvshXNu0F32xmgiO4aA69M3V+m+iKyy2JsW8/7EY/T4dzDtIDSpg5dFfZtORmQDEDn9RykNyLVSaNaYdK3572e1XekbCtylyeMrMB9oQ/mbGvEo22S1q8RvUoM9Jq49pIIQojB+ub9xUy2o+wqJUr7i13NFGeHt8iPxDpFWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561850; c=relaxed/simple;
	bh=GyeeFMzv3svicQKUiZtWEfryK8EEAEfIq1rrZuVTlRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4CikjwHXq8S1XjLeoU3WhQrqPlHti8FgSGVStTa6ZMs6nn0roGNbTjgj1Cldnb25izHyPSUkNSM+Ke9oNaZ/nCqOvZGUk+OibHT4jrXY3iNMpLEaXacVSpJn2EZ0AS44mafpJXLkeulayh89RZyKCSso+dA5v13oVKDJJ9QwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RP2IY5fy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8GmSCIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RP2IY5fy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8GmSCIH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLdh22912378
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+OoXSRKnm336YYjxQK273iUKtlXI+xsznHIMq6fieY=; b=RP2IY5fyHaKAp80G
	VLwOTExgzucfB9LhK0UoJK34UgEoadELpeE+owpkFXPc9bMY0kPCb6IJh5agyOtU
	EBBAhR+6gnMkFD5oqcgAi1AIWiZOwCks+iwTqV8LJ6OsnfNIe476QGsNrG2C2/x5
	0OcZXgYxqdPj+Lf9ItLIe133Qhj9e/l5xlnhsKEYvmDqAtSRnvcMbhiUq2Tv6KXX
	G+Bi9zFQd0rdw8msZpOI5AJqyc3/kQbR/tIVlc1Nv2HFBgWypjMa4Id9MLMlnPfp
	0Z9hTyWmOqS3pwOnamd4vPzKmXeZbRPyFCV9UOprdQiSRzZrtTDlapyW4me/nciU
	lBcKKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c27gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso145906635ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784561846; x=1785166646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+OoXSRKnm336YYjxQK273iUKtlXI+xsznHIMq6fieY=;
        b=O8GmSCIHJXktZ3qf/uJxwrnHM68Wo1HljKM8eiXAX2PBOFL+l3gHuay2qCQP2X94je
         yj9+k8DlXQDHWVVZoTNtw66nSqwvGflNEBodhZ6qCkb6itjZKneUBOP+tqmNwF3U5LXT
         36eI+0WRdwHvOuZ+VEgVbiKyeX4aGiKFD3XOLzJbwjXWDygkuKrxSkjvtUxTCe7z90EP
         WM8NDcOhxzcLbTYZxv9sxOR19l/hiif+AhGHpWnhio03yBHt7OPygIQDXHJgGPad/uaG
         +hKB/ZP5xsbmtQ7jV7uzR+C6Xd6AcpLkTo8iU8Bh/5VNMNmHCkh0n4tI+X7F1HIL9EGo
         LpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561846; x=1785166646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+OoXSRKnm336YYjxQK273iUKtlXI+xsznHIMq6fieY=;
        b=L+eR1kcTjX8AN0zJ+M1ruMjibK56dIXwzXIrRLEO3KyySaDWUOqeTw+IkUm5FDf/Qr
         gEaeJ1c/9RkPz9kr5xUugvqnRthW9WBSCRPkJsmX2mcORpYvpbQDWUJhArEd3io+9tCn
         g2rm1xkJfHVLTaMfuJv7N+0104afhVs8Nw/BP9Xl4l6oiBkf2WrJRD8a7Rr2RkX8jBmS
         7woS6qIPAK46nQZnROBVmSGTpc3GX0lGW/x1j8Byuys/bfPf9l2ElAs/QKvU4Ef1Bx1/
         JfoPBnU8PcdPBh110cu4OQ2nTv+dA9cPC/KZl3JpWc2uJo2yFQU5nH9c0XgmbHnVimD+
         i/iA==
X-Forwarded-Encrypted: i=1; AHgh+Rql3/6ywHx6HiuL1INMpYACVRKAkGk+tWgXTpY+mCS3N3mvVVxTA/9trM3AOOdKkjz1lBG3a5U6+HyETuaX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88XqiSGfaZ3Pwcg6kKNfSbDHkoVhOog81B5LU1Spg+PXo+zTK
	AFkOWPPrBMfDTw74mpSneFERbk/KWpnZgBLDOntk+7OZoSHIkxw08aijtuiFlLqsTTtiOnPdv5e
	rdGAkRGaRLL1OusAXX3eakSrREE/c54vtAgEp4cTplfSTrqbT6MvPr7jd7XOloI2Ljz9QI5dn8G
	I4
X-Gm-Gg: AR+sD10QtRyvbxECjRGer/h7Y+o5mKewkbxqZ835/xFy18lYXuk1LlwLTDpU0A8xEau
	+uAAZM+5VfaYhOnCnvl7vXktlFJaR7x/UVf5uWS0gS5lXNOS9wD86CU56/UYrUyAFh3bfwiUZ/U
	InbPH1gwLR7WzxievSCt6CZKqBsZnDBLTxjTOuxFwryzWHsXJAuEaxm8Ceexuw3Y18M1kxWCle7
	Z1VUhSiJMb/r627CGBH9e2aXLt3cplWnHt0WwN7iGodg5h/VUbYmX19m1KKvLsTmiXwpP0q49L9
	OqB1gqE9AC5BM0yCKWWVmiY66yqMhS2XJGce1CdaltL+yResAzr90DiebhX4iG1M1juxdeR7+xk
	I0JuPElkJihv+RSJAOOfCrbvoC8At0g==
X-Received: by 2002:a17:902:da88:b0:2ce:7563:70a5 with SMTP id d9443c01a7336-2cf3484ea61mr166751135ad.6.1784561845475;
        Mon, 20 Jul 2026 08:37:25 -0700 (PDT)
X-Received: by 2002:a17:902:da88:b0:2ce:7563:70a5 with SMTP id d9443c01a7336-2cf3484ea61mr166750185ad.6.1784561844023;
        Mon, 20 Jul 2026 08:37:24 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm38572824eec.0.2026.07.20.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:37:23 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:06:39 +0530
Subject: [PATCH v5 2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-b4-read-rpmh-v5-v5-2-cb93fb95f565@oss.qualcomm.com>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
In-Reply-To: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784561832; l=2563;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=GyeeFMzv3svicQKUiZtWEfryK8EEAEfIq1rrZuVTlRk=;
 b=N0iiMLND25DXfG7oMvfrzn536H1Ed+m30bkTDCYC/xNyyFNG+iVFN63m1k9hIfUvq6ultPYm/
 1AOBjMG1bh4ABkSE9DB3wES+KMEyXn9hm+Dt0EXJPYoYHNguvhDlSsW
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5e40b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kIXBIbc_WAS2GchaIWAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: A-L0wbyjjcJS-CUiLUu32RLsvQNkm-qo
X-Proofpoint-ORIG-GUID: A-L0wbyjjcJS-CUiLUu32RLsvQNkm-qo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX6DTYTeYPuQdX
 FB9Dd+3pzUS+t9rudA04YArPJ+QUG4lweOgHm811OqPbieogaY1mAvoNrLAiMXYddVds77/UFMu
 lWFAdBwEkNPqzWiUaxE82sLG+zfPBEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX7438RfZl0g3Q
 nFn2UmcSyP30xamTOIwQAvd6pCgv+jzqcov9YBl4C1aH/BZbazUQkSsqAAZKYYq2BgLnrIqg8Kf
 nnoWSQjbwGFchvhlw7oXUJ17luuRbGgKxIZ/IZYnFO0n+UYIjWS70mY4/wQnjLvGcTzc6n8gi6L
 b71KwV1f2uUyKpjuTGdvHAYc9tSfDxsCvc0ScdwBL6HxjMCfd84E997XsNJDoZZCHutlA00bFLR
 ugJhv5nVNChBc0DoJNWsjQYAG8pYepOoNS73ItyCZm5xAs6X/UGEPimvFeEtQ1beJ1dK8KGa3gc
 k07H/fD3QII5E46HQ0+wCQVtAPC/zbGCGS1P8g224rwZ0EqYgqF4aLnwKxiFK8HQfRieFf47N+b
 lAY3ccOnMF/0UmNQdRWiIPH+eaky8qF1F2rVETZcM3pAfmjtEszminPseI8pTGxvm7pSKTrtKrn
 lP2nEweRBcNwF6M54og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200174

Currently, when `rpmh_regulator_set_mode_bypass()` helper function
is called to set bypass mode, it sends PMIC4's BOB bypass mode
value for even if its a PMIC5 BOB.

To fix this, introduce new hw_data parameter`pmic_bypass_mode`
to store bypass mode value. Use it to send correct PMIC bypass
mode value that corresponds to PMIC4/5 BOB regulators from the
helper function.

Fixes: 610f29e5cc0e8d58 ("regulator: qcom-rpmh: Update PMIC modes for PMIC5")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 756a4201225e..c47dc9f92279 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -111,6 +111,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  * @hpm_min_load_uA:		Minimum load current in microamps that requires
  *				high power mode (HPM) operation.  This is used
  *				for LDO hardware type regulators only.
+ * @pmic_bypass_mode:		The PMIC bypass mode value.
  * @pmic_mode_map:		Array indexed by regulator framework mode
  *				containing PMIC hardware modes.  Must be large
  *				enough to index all framework modes supported
@@ -125,6 +126,7 @@ struct rpmh_vreg_hw_data {
 	int					n_linear_ranges;
 	int					n_voltages;
 	int					hpm_min_load_uA;
+	int					pmic_bypass_mode;
 	const int				*pmic_mode_map;
 	unsigned int			      (*of_map_mode)(unsigned int mode);
 };
@@ -311,7 +313,7 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
 		return pmic_mode;
 
 	if (bypassed)
-		cmd.data = PMIC4_BOB_MODE_PASS;
+		cmd.data = vreg->hw_data->pmic_bypass_mode;
 	else
 		cmd.data = pmic_mode;
 
@@ -767,6 +769,7 @@ static const struct rpmh_vreg_hw_data pmic4_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 84,
+	.pmic_bypass_mode = PMIC4_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic4_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
@@ -975,6 +978,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 32,
+	.pmic_bypass_mode = PMIC5_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };

-- 
2.43.0

