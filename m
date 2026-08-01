Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2213EC2E1
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571258; cv=none; b=Wgfekx7suQFH0monwDRg6AkexnSD9ciI1t8Ecz/Lwx7mcDTSK9+hkDkwR1Y/iXUmgkMlHHTsnXcIBhGykrEUJBvIe3Fqgg79OILa3+1ry6EoVqMOYKyGj3G+KWij3q4/bVTivTzY1cK+jZNAVM4HWUAGbkGm41IC+Wp/s7zpo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571258; c=relaxed/simple;
	bh=GyeeFMzv3svicQKUiZtWEfryK8EEAEfIq1rrZuVTlRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQGZUbwtK/z1X30JklsB0iPnUhcam5SB5pyZJsIiTSBxmgBBTjkeMh+Ic6SQEFQ6+hLVnYxttpo6DbfgewmCrHcgFloNoJEJoJA0Fb+1z9WY8McbBoE5bepWCAXSHFjQeHDvl0hNl5jvJTWK7cyoSL1Uia9ZdqqjVeBd6DaqcT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiJDCCUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yn/avJQS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiJDCCUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yn/avJQS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DPO82065170
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 08:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+OoXSRKnm336YYjxQK273iUKtlXI+xsznHIMq6fieY=; b=TiJDCCUSsn7o8ZHa
	NBFKNIaAY3jSGfk8MGhVL6QdrrUNnfDoWWZs+uPoqWTZM+yhBbaNp4ZEaLTgXKi4
	pgN51S7M9qIb2NGBaSO1GXyF8fhZ91xHalsJAW+6xI2lyS1lUo3/53eYWxxWwLxT
	Rqtfsgc+KCBQYF5yYcfebJXOoNfjlRIFWyoLO7JbUdbPQNEbkZE8OwkOkHmDi3uw
	qgilI/zKZr4rw39CZ/gRjEde3/c6VcC862zffiGHqm88cMpWtIWrnXycjnHe6Eh9
	UvPwChsreLgruduDVaxO4ocpjb1nmkc3aJoaaiYKb7MW8eHgEcTzKbyustU3AdOw
	ix2TCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50hfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 08:00:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso924204a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 01:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785571254; x=1786176054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+OoXSRKnm336YYjxQK273iUKtlXI+xsznHIMq6fieY=;
        b=Yn/avJQS2glLFF55jZtP1Rpps9s4hCwFhR0t0RGL0NzJE/ozHCUE4oTZiWFTfPsHCf
         Evv0GJ+1QVSm4UgzQzyRvV1ticq9yyvy5vrlBY2W9AgZEm7yjwTq2bK/DCEGMMTN6+/O
         Hey9kkPDQPgrbGoJ8mQHrtspuxRTMOZeuXrtJ6b3uP4Lo40CV5drUDPKIiGK8cLnAD9U
         EB6QIBZ3KmTGTypmPZEh8nVopyrYHA5xJJpuPq3+D0qaxlNQF201TOeaxljvq/kBKSSa
         jrE6PrL1drRuT8oQz4PnQuedxcexWhXj3FXoXDDDgPIGYzI7o9cD52E6GZNGZFqhwMYm
         kgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785571254; x=1786176054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+OoXSRKnm336YYjxQK273iUKtlXI+xsznHIMq6fieY=;
        b=Kv8/C8wymN/3bkHYv9lZGLgmjWWFsf85ulh23YPN6DFQEcVfAOSjyAf5pQtLBLRSSJ
         cxQA83C4sFFqj5bc5Jg4ueAtnu+9dzCn3Bn9rYD3C67V6ghVjoHwitpwDUe/pTCfCe9N
         p889kQ+BUywPfe+WpNaiaRlT8dpJteTZg6plrqeeMezNmmVekn9uOZNPg4uMXwTswcr6
         z/vB6cCYoCkfCw8QuAwCe20kdJt9YpxFulDyBQ6uPNY7XOSVd1xrcssSVAUxkV7mRn71
         uj2++XO0TQW+slfZyzFQJNlk7Ngujg0E26a5M64XqJSvUQK2IcugZ1ZclklOFPKTOmSn
         h/oQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBHDNHGwYYCMXXMgtcZM8Eoj/xQSpr1cYl7P76j+t2pZxl9HcbRNm5Q/IoR/U2kT2zlMYbTerpp4y47Sp2@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKYJtGNgmb+InfrRxkgHYkIKXmQJNl8TMSV2wKQtgvH13TxDG
	J4CRF6FeY7J8cPD+0hWwFLCtDUx+h5kgcHPISK960GMdvvPuNJXRlY/H6VFiddvTJ2C9aGTP9wq
	3irQsmZY7F0iJkX5ObW8CvF59rtbFtIosJP8uonz07Hizg5cX4YdXfpAKgp2SYFkFAs5D
X-Gm-Gg: AR+sD10Pf31imbsDVZjXwiKtOVXhbsOaD32iRiWerDg22HWfPzV5Z8LctWRTBsAdZPq
	JbvyE5xtw08vj6DnG2tUieCqEGa3TSzNe9rVtQ3dxXJeAm3Uy08POMtMntnser+d3JP5jNj/cjP
	vY0SKeRw9d3/Nvzw3yvftjn1dV+TfHp0PV7sX+OIKLu4DJ0lZoWQz50YRsFlO8bt+JgJpYslMHg
	qzJ/76ynLHdTWcP+6kSmG6KAFlZooV6UPfUkPBjpzN8AuTgy0SEg1KGvYyjPIIahei/uu1UlfN6
	aEuwKJKIUfmWUc2timyiLum2mC+clKQPgvHqoos2l2qKBAo8q7XVIUgKoUFRyHjeu5vWBz7CroN
	m6YkPkdKzU4cz6fb00F3SY3TYp9/Pnw==
X-Received: by 2002:a05:6a21:4683:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c92a8f08femr2712854637.60.1785571253982;
        Sat, 01 Aug 2026 01:00:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:4683:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c92a8f08femr2712818637.60.1785571253497;
        Sat, 01 Aug 2026 01:00:53 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm24739838eec.28.2026.08.01.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 01:00:53 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:30:28 +0530
Subject: [PATCH v6 2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-read-rpmh-v5-v6-2-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785571241; l=2563;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=GyeeFMzv3svicQKUiZtWEfryK8EEAEfIq1rrZuVTlRk=;
 b=WgjZ3HbuziR1xTvPHg+CETzwMapg5C7bFEEG7NCKL6/dTmPSGCOQIO8M2h+GUCI2YlIhxtJvR
 RP4pQRxwuXyBvawggeSOqKkYE0r9jmzDRfIXNsm311NXrtVsKu/9AZz
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX2c6JvCEnn35J
 Nwdv9FKu6NWExdKX1HS0gJvQLUVbz/Tiw/UVoK29fVfCgT7ctS5jvBa8pRdHyI0yIMqIY5ikfnx
 Elc03arZoY/t5pQZplwEBc9P6u6XhK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfXy+iqJ7T5Q9pB
 5cr2Wb8MjwDKwIMW3vmq8esTfPEkZzZq7qCVIuoSeE7yYQ6tETXG79MzJREryNYCCm2qDBry9HC
 D6f78jjoF60qq1rq0HooJjaEPrttuGe+MuMQqXmBD87XDr46WlI38cW708+3SxyN0hJK+2o2WhC
 1AKDjUOgzXRb9kotKeM113YeaXm3jbS1HaAxYupCyFlIOaff24qcKaxz9lu9kpcD9xCyiOLukbl
 WG25fyDX/gJdYiVFGYCi7RXWc+lIB0jMUmqDG8lpXsB/m/UXnntNbbmVNINR+9/Rsvt4ueiySnU
 A2WmS81vaYtEYvltdFWgiwGn0kP8XR4qn5BFglXlrgho5WaCQRhV7NAf5FQcfcEC7/L+7zY34ZD
 fM16cWAizka0eUHSgLYr9vO0Y8gZqMklOLzqILkGM9JkutEGF5MX9oRKph1T8TJUQbAFo1UsB7e
 EoXV4qTl8qf+NnGy/oQ==
X-Proofpoint-GUID: Yb164zV9UivNwrFEkFxMPZYHsXSoMpeo
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6da7b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kIXBIbc_WAS2GchaIWAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Yb164zV9UivNwrFEkFxMPZYHsXSoMpeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010057

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

