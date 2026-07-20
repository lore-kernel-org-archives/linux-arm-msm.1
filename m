Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1741169F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561853; cv=none; b=A5lCyLH30JvNaY7Z094HnFBGleVrtIY/NKQbsiS56XIPLAdzJ6w6JmCsvmg3SDSnlgzgFkODIMGJ2205DC5ihyHnYwKdUgk9Tq6uGGCvd4Gy7TBuCx+JYhRZ/eco1PA+CVmQLYH/2a7ktw80BEpgmY7yZ/jmn6Tnui3XgSZpkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561853; c=relaxed/simple;
	bh=LDV/7ZZjELHLmEvMXWv/iTwNwGbpfh6h+meYtaQ+ZRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xspv+7EtZfA7QRmux37ypXdLAFThB8CQ2X3NO3vCl5x/tz5paBN2FLD/tCVxmiRwYP+rCz3kSjIyJsutuE0faPKksNlbREs3oRdrTs6WNmmO4r4h+URoJ/0Nn+RgyI8kx2aTVpm1crGwyMpEu6SbQHCh2VkYTb7OJm0Nxa8eq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1WbS9KD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7HWk/GV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1WbS9KD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7HWk/GV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLlRe3018835
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VmVZ61RHHStejQPEUBpRnq7JV+D2OKXHPHl5T5rsqM=; b=i1WbS9KDyuSh/09v
	hSVrE2E9yV++Hqz4aNhdor/uStMKGNqtehgcmuBdarQSDPhBhWFBQl+7PdxzAPtl
	uV95bR5HFOFWgt3/17LD2SE7bhz7qlvJj3soSrKdSg4cQrw4DpWhSOCRkM1g80Cp
	vb1u5fNA3uOR34oVtfac+9dkfoTXCI1tjuJCYVrOpcYuuJorFFH2F7JYO6/asGiX
	GaNzvtXkpkElsKP8u9M7nhWGu2G9sVEas/kILK8lxMQeA4JFudmznDlZAgU9f5j6
	zF3Rxa8na7avxNtsmviv28I/mEccvJC3gi9IcyGlxFI66nqBtLXB3aZ8VD6PoMfh
	0Qc2gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9qbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so4335123a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784561849; x=1785166649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VmVZ61RHHStejQPEUBpRnq7JV+D2OKXHPHl5T5rsqM=;
        b=H7HWk/GV1HOAkMNPj+IqbZqRIzD9eurNwAs7gaVthOxOx7WPVYnHq75X3ILdNxtGz1
         mA/T5+jVKWIr53q6sjcZ+DZE9hB4aC25ZAT7o9qc6/AldKO/gtBI3bEToGIUKLpd9xzJ
         s7UBOIrhxz7JxoETaD9HN+uRqsabMMvjYcobdJvzYNXSlbQCOBlOVLG2V7D86cUGmtLS
         Xp6MsHjp9y4PYIc9lS/BNzX6rGEC9eSx2TPmMpFl61u6E6iMDokB5ixKRD/w2EaLOA+z
         TX2IIywIlXoR+r86T4KpQ3qG6rKZJUE0G1G9qsv9PkgmiutzZVfb4inJIwy/Bq9hOLMU
         dV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561849; x=1785166649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VmVZ61RHHStejQPEUBpRnq7JV+D2OKXHPHl5T5rsqM=;
        b=EsBJKbM+V0oT3JRvAiOuHaipPYcxPJH3M8sY4atTh3PyVN8o4MKxK32zIHdU5RMm67
         iZvkCbbxtk1LywJ8bYpy1A6Dv2b5ystvoMyhtamyqlpI9FGWyhcH0NYb544uXYFRZDwg
         NBSpuu1pdcLfXrvw+10FrtddMHw87qyKEXrOpuNwBSRKcOnb0LSl4DNMIQ9wubkvG3O9
         Fu/MyYk38cNna8uW+rs1PmUGeGrmEHCxanE7eqXMmldmOwiZ/0TUuLfPL6BhgCdRjYDo
         5/3TqINxX+3Lm2pDmrV31WuS1G10zFTi/j0DaESkjks4yJeSwvSXSOSArMdFYI5DK9eq
         aRcw==
X-Forwarded-Encrypted: i=1; AHgh+RqsaqBQc41cNp/Fs/1I5w94ulilN5fvp+E25iJHcJpzNjXntmpnaeXbRapmnJrajInvjWlwoPH9TI76q+Vs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wUxLCzsrzs+Wi2r+NMYT/iqZ2LZxUznunvc7cG8+0VIwgEDR
	sAMK7w9FbkGq3nudpCDTaUxxHHBDax41nEh0tXXS23d2x4yoZVxW6t10tzMovtYjcwIJ/E7g7al
	59uGlSUrio5Oe8HDmeRKdhMQFjTIipZ3vLHhgHLk3dTmYY36Wdc7B0O3hzzNn5wtPNlWu
X-Gm-Gg: AfdE7cmENNrshSD1hmip0cn+cVncBojId3Q88yhmLLIh5PXX0QNyPyvWVMCVGgEOXnU
	U3wzz0cXg97bQi1r8g9AKZP+4NFlymZXLqKhh8Okk2hDSoO8e/7DszV1z44kzNcN9JKZ5cB3tq1
	36/dGzDox13iX3dATIAiBorTSetzvvL2j87frnNTzVfkPOS8pCrqLMN9+k8ri9jiMXvqRlToWAQ
	0uy/VVEvFUygu8ujOExXnXfIMuOmK2M5rYwcmG0z8XD/pa6ER+kscFUoRvKvBc7mjuENvnjDQZQ
	ZEVCj6pdOdvJDRfW1c0h2pjOPxf77kIdtcCDDUM6l7Gi0UQ2zOKd/J6ZEDvT6964yVJuKfSMpmZ
	hzvhGIG611uvgmRaART+7iGaWeex/pA==
X-Received: by 2002:a05:6a20:748e:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3c38d8cf148mr19391990637.6.1784561848962;
        Mon, 20 Jul 2026 08:37:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:748e:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3c38d8cf148mr19391943637.6.1784561848298;
        Mon, 20 Jul 2026 08:37:28 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm38572824eec.0.2026.07.20.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:37:27 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:06:40 +0530
Subject: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
In-Reply-To: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784561832; l=9539;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=LDV/7ZZjELHLmEvMXWv/iTwNwGbpfh6h+meYtaQ+ZRA=;
 b=8B+Fnh6UTh9QYVSphjh53GC2HrFUKSu0kpDnQOiAz4I0bmUQt/HY06nd9EF+Vx7vqkSrJpxdH
 fN1NDncwXlVBnpWlaxz21PAFCE7vm+Y8SuqJpIm0LSJRG3XOM9Hc0PM
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX3IkbePG4oDaG
 Q50+eWYaHeLcCWOn80xhw2Tiju/D56p99pkyGSpJOsvbDqmZ9moT0emEAlHcQL4E/QEozLnu7to
 kk0qQKVMdH5N5Ph+U/P1/FEQRx03p2o=
X-Proofpoint-GUID: ajIRsjDa7Rl-yCejPjUALwKZ-qKcJTgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfX7CoeT4+yp/2T
 fq8PNR2m2fuygft/RHTwMsGJfOBOZoauMqFs7M8OEA84CD3PKMiX8Gm27HgMMinCYP89B7fwi9M
 /ir/gXCjmb/eDdmudMli+m2cHuqTUalljHyN12o7WRtYZE33fVnr+88/i3chn0q269q2yOCApS1
 zFvJce+ubK6sz0/Ojj6cUBhOo7JojMcQYlOttr91u/Z1n8MNG2rzaptpI8x0At2H/spAZAiDiff
 etXCPGgjtfq9ex1CCNqm5816OUVkUmLPyxLDokbGNYhu2Tq56se52isWo1g8GQGN/K/89Wd/BEu
 EDCrARw/niC+LfGd5pikIgdSaEwchcqB+capeziVwxsselwqu54K3x0GIrETOUXCY/fVlFvSfV/
 VT8+0izlrqmr3cLspmn3px7pZDVOF41/UMHT4J9Oq7uu+0DV+fBnIWetUWdTh0IXuozffUBqMvb
 VVcd+yd/UFb0aytVAXg==
X-Proofpoint-ORIG-GUID: ajIRsjDa7Rl-yCejPjUALwKZ-qKcJTgo
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e40ba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IFsKEvjZkw_ifPfLhG8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200174

Currently, during regulator registration, regulator framework sends an
unnecessary `min-microvolts` request for the rpmh-regulator device. This
happens because in current design, we do not have a way to readback the
voltage settings that was set during the bootloader stage.

Fix this by using the rpmh_read() API to read the regulator voltage
settings done during boot and make it available to regulator framework
from the very first read after the bootup.

Also use this API to read the status/mode/bypass settings as well. This
will provide the regulator framework a sense of the initial settings
done by bootloader and thus preventing any redundents writes for any
setting post bootup incase the same setting was already applied during
bootup.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 161 ++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index c47dc9f92279..56a51f8893b6 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -4,6 +4,7 @@
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -61,8 +62,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
 };
 
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
+#define RPMH_REGULATOR_VOLTAGE_MASK		GENMASK(12, 0)
+
 #define RPMH_REGULATOR_REG_ENABLE		0x4
+#define RPMH_REGULATOR_ENABLE_MASK		BIT(0)
+
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
+#define RPMH_REGULATOR_MODE_MASK		GENMASK(2, 0)
 
 #define PMIC4_LDO_MODE_RETENTION		4
 #define PMIC4_LDO_MODE_LPM			5
@@ -154,6 +160,7 @@ struct rpmh_vreg_hw_data {
  * @voltage_selector:		Selector used for get_voltage_sel() and
  *				set_voltage_sel() callbacks
  * @mode:			RPMh VRM regulator current framework mode
+ * @status:			RPMh VRM regulator current framework status
  */
 struct rpmh_vreg {
 	struct device			*dev;
@@ -166,6 +173,7 @@ struct rpmh_vreg {
 	bool				bypassed;
 	int				voltage_selector;
 	unsigned int			mode;
+	unsigned int			status;
 };
 
 /**
@@ -210,6 +218,16 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 	return ret;
 }
 
+static void rpmh_vreg_update_status(struct rpmh_vreg *vreg)
+{
+	if (!vreg->enabled)
+		vreg->status = REGULATOR_STATUS_OFF;
+	else if (vreg->bypassed)
+		vreg->status = REGULATOR_STATUS_BYPASS;
+	else
+		vreg->status = regulator_mode_to_status(vreg->mode);
+}
+
 static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 				unsigned int selector, bool wait_for_ack)
 {
@@ -248,9 +266,34 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 					selector > vreg->voltage_selector);
 }
 
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int ret;
+
+	ret = rpmh_read(vreg->dev, &cmd);
+	if (!ret)
+		*uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	return ret;
+}
+
 static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	int ret, uV = 0;
+
+	if (vreg->voltage_selector < 0) {
+		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
+		if (!ret && uV != 0)
+			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
+							uV, INT_MAX);
+	}
 
 	return vreg->voltage_selector;
 }
@@ -284,6 +327,8 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->enabled = enable;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
@@ -333,9 +378,27 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->mode = mode;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
+static int rpmh_regulator_vrm_get_pmic_mode(struct rpmh_vreg *vreg, int *pmic_mode)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret;
+
+	ret = rpmh_read(vreg->dev, &cmd);
+	if (!ret)
+		*pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
@@ -343,6 +406,13 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 	return vreg->mode;
 }
 
+static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	return vreg->status;
+}
+
 /**
  * rpmh_regulator_vrm_get_optimum_mode() - get the mode based on the  load
  * @rdev:		Regulator device pointer for the rpmh-regulator
@@ -379,6 +449,8 @@ static int rpmh_regulator_vrm_set_bypass(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->bypassed = enable;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
@@ -401,6 +473,7 @@ static const struct regulator_ops rpmh_regulator_vrm_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
@@ -412,6 +485,7 @@ static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
 };
 
@@ -424,6 +498,7 @@ static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.set_bypass		= rpmh_regulator_vrm_set_bypass,
 	.get_bypass		= rpmh_regulator_vrm_get_bypass,
 };
@@ -432,6 +507,7 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.enable			= rpmh_regulator_enable,
 	.disable		= rpmh_regulator_disable,
 	.is_enabled		= rpmh_regulator_is_enabled,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 /**
@@ -540,6 +616,85 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	return 0;
 }
 
+static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret, pmic_mode, mode;
+	int sts;
+
+	ret = rpmh_read(vreg->dev, &cmd);
+	if (ret) {
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		dev_err(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+
+		return ret;
+	}
+
+	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+	if (!sts) {
+		vreg->status = REGULATOR_STATUS_OFF;
+
+		return 0;
+	}
+
+	if (vreg->hw_data->regulator_type == XOB) {
+		vreg->status = REGULATOR_STATUS_ON;
+
+		return 0;
+	}
+
+	ret = rpmh_regulator_vrm_get_pmic_mode(vreg, &pmic_mode);
+	if (ret < 0) {
+		vreg->mode = REGULATOR_MODE_INVALID;
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		dev_err(vreg->dev, "failed to read pmic_mode ret = %d\n", ret);
+
+		return ret;
+	}
+
+	/*
+	 * NOTE: Since BOB4 BYPASS_MODE value = 0 we cannot confirm if that BOB
+	 * regulator has been sent into bypass mode by bootloader or if bootloader
+	 * just has not requested for any mode voting. Due this limitation, we
+	 * must check if the read pmic_mode value is non-zero before comparing it
+	 * to bypass mode value. This also is needed to avoid setting BYPASS status
+	 * for LDOs which dont support bypass mode, and have the pmic_bypass_mode
+	 * uninitialized value as zero in the vreg hw data. For such cases assume
+	 * lowest mode/status, if pmic_mode is zero, to allow for mode voting.
+	 */
+	if (!pmic_mode) {
+		for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+			if (vreg->hw_data->pmic_mode_map[mode] >= 0) {
+				vreg->mode = mode;
+				break;
+			}
+		}
+
+		vreg->status = regulator_mode_to_status(vreg->mode);
+
+		return 0;
+	}
+
+	if (vreg->hw_data->pmic_bypass_mode == pmic_mode) {
+		vreg->bypassed = true;
+		vreg->status = REGULATOR_STATUS_BYPASS;
+
+		return 0;
+	}
+
+	for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+		if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+			vreg->mode = mode;
+			vreg->status = regulator_mode_to_status(vreg->mode);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_INVALID] = -EINVAL,
 	[REGULATOR_MODE_STANDBY] = PMIC4_LDO_MODE_RETENTION,
@@ -1838,6 +1993,12 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 						vreg_data);
 		if (ret < 0)
 			return ret;
+
+		ret = rpmh_regulator_determine_initial_status(vreg);
+		if (ret < 0)
+			dev_err(dev, "failed to read initial status for %s\n",
+					vreg->rdesc.name);
+
 	}
 
 	return 0;

-- 
2.43.0

