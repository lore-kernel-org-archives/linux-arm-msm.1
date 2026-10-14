Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8804AB3A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974015; cv=none; b=UD/UvyTQDqtAE1LcQljC+oMevo535QyStUiymIFYa7QhWHFiyTpQOBaczUzirebq8jwinuxv30VRP4NEkZ1d308Wx9tvQQSxwocQh8rOt/19TAhco8U8QbqdDgzUR6Yc8s7f23xBYlAPlbYXVl1cAs1V7OPfo8Cfq4ztvn0mF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974015; c=relaxed/simple;
	bh=U/H8rooG0aANY17cGDSuKEZnrkgTspSZCjUK/K7PaQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcIJqDGRaUA3K6GLAMOmNybORNcXit7FzxbX0LN6LSH/lu58Zh4Ov6GqygGSKAc48Jl3dV6RD0TeK/RKn1JFZLKmfkNHYmzPiU7nTQQvPLzeRy3998I3vJtj69LapU8osq6ao8Vp9dRzP0jG/5M7tBRw0+2Dszz9adP4fXC6a4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiS503+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3L8gj1L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiS503+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3L8gj1L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9gaAO2222861
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5eYgoQqncUBjHrzgn+QSiE9BnE3XSc+swowkAiV5zE=; b=CiS503+8nJ/svC39
	BXtGytw1r8z4xsR/3tQg3PAvPaKN7ZZ/CrZopQCDeeLUcLgv7F7GHp7zOzqyZ3PA
	uUZlP5pAYnNrrJNqBsdB80xBNAysXjH3lKUPdwPe8uYt5nsynX2OE3xw33Ru4ck5
	XgLLpGAB0c6e2bpDUgwQMhNeU7M0cP3GArWdv4YDqkIO2t3HaLaXP3H9kNR5Gkjg
	+T3gFUIp/Ql620xIh4BmoMpzATvh5OuUN4zdmOjao0rTyH9kCJHHUd9XjRzGKgm9
	gbkH7QmfHmz+EpLzhihYvkyq3H3HaJ0lTvxafkYy1fBtRPvIC/pvELiC7IRwr1kI
	H3f5Cw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsb5k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-898fe16133eso281008b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 03:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974012; x=1792578812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5eYgoQqncUBjHrzgn+QSiE9BnE3XSc+swowkAiV5zE=;
        b=b3L8gj1L/vLJU1mUcQCAqjnq38NTc/92kxs3PfN8eO5i8V1Cs6NBfpMInNGHeDnDoW
         QDZEqtZyXPm5Qae8hhwQ8g5WuwPldVez0W/KPxV3IMsNZaba3itQRBgYhC1lx5lO93uK
         px3SskvS4VyfGT+ZjPR1P3MnCbJKxlv4SE64lT5+xb21SPWGxVYXesPFt8gNHdwO5Axw
         Z4Ns/JufNfphJfZ7i1wPGVztaV0Bk1PUNijZ/+NhudFN4Z+J4sfXCDch6K0QAr+WIl3L
         BCNKmHwpyWcNP+Rep74yKeJvX0wSE5yAUlHPFY7vtfYRtasc3Maf29iid/EicBjh9H3K
         udbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974012; x=1792578812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5eYgoQqncUBjHrzgn+QSiE9BnE3XSc+swowkAiV5zE=;
        b=Hpf9VALkhjhpNnZPgkHJqhYh/HZR0DRRTR/e64dLeaBdax1gj/E5CywQDheZFtq5vG
         MJodE0a6pFNf1xuYQnX3MVNiP4MWpEBv+jVV5sgWw8Nh45Kiuvtmx1YB9ADG2bl8JRWQ
         Ij66SfPu+cMhmqTpxkQwDrB88q9aZgxdB3FP2jdMvrJ9u17JvHIuMsrdEiEXTK3CpGPb
         BLhJVx//Kj6boqlTjrSr50WSFbqjSbydA8g9LjyZRj6LmAyQvEPgz+kjPiY5j395We5K
         rUSpbiJLCGVUo9JC/DnG65jzXffWYSjHD2xgSXVZcg156cxjqzsH/GtMOGvG+iy9WXQc
         YNwQ==
X-Gm-Message-State: AFq9FYKGvCsW3vY6dFebFat4iD3AUx06hrfNbe0B2cJRaXhMIyoWJzDK
	OyCPdQbrA4+6r/MAhoulQT2uw+ZmGCiJkkIerCcnPHf0tvD7wYNB0Jf/f5Bj764gT5VmHnOE5N9
	9AuW+ZIpVg2/rzGoegWmUcOkQjqUh2Bn7kpirvez9U3IDPpe/aqdap4RfIxgjK3ZScDvUsYGw5n
	93
X-Gm-Gg: AYBFou2wBVyCZhCeNSE/WR2t5zWmXBALY9FVoLzFEcC5a1XXm9cA33+N0UgFLs8fBfc
	AkEoir9Nud7ZoaDbYGV9HwaSofgz4Q8ATyWDLXzAq/eMR2HwrdbWD+u0GoI1i+UiiyEyjMr11zs
	AiRgxa8fE4GxNqBw346aZ7s5Ix2FvfTX05FLaik85/B+N5OR+q3draOcLXeGDCkIHaw53Eqxaka
	icQb1GoCkMTQgPhq33vCwsuLMTmWCehyXn27fFOPkaZST1wfRGH2avRE/1WRvdd21VsgLyw3A0b
	hTme2cX+6B3sGSqWA+o1gcRU0FxgxxVWQD3rtxXNtsDCqOdweLf3cm4XnJ/1VwlofbS9dbjrmCp
	Bb1ZGQtwVhz9mJxKMjjE=
X-Received: by 2002:a05:6a20:734c:b0:3de:b120:bb87 with SMTP id adf61e73a8af0-3e16bb7126cmr13171967637.8.1791974012021;
        Wed, 14 Oct 2026 03:33:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:734c:b0:3de:b120:bb87 with SMTP id adf61e73a8af0-3e16bb7126cmr13171949637.8.1791974011571;
        Wed, 14 Oct 2026 03:33:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:00 +0530
Subject: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=4668;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=nt4RrUUJgtVraKEfN4PaTsUlc8ESaCHG5ZgC2U6FpxE=;
 b=NyQHJnzC4qmpVLrUnkJk+5qjv/LdNXWObo+hRoebzoZaREO2rMgHczHrdsOlAqmZXylVVfowQ
 7fojZT0iHoJBX6zE0keEbWQjRWz5MDDMmOogasfo+nA9ZjfbYslRXjS
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX/vKEwui1bnZG
 8Atc5UHkboSRp/nJImElRyJe+JG8XUMDpOVS7pnbt25pQC8ly7ygx5jOm0rbFWvd+3dMbBzI72L
 XS3U1YVyOqr9hWs65tDOHvVTBNQnngdLNTiyQjdZE9fn/6DBQM2b1BOF5Y0iKS4/fGa4q4misUd
 /+zU9qXK6+3ovVcjilRkTuuwkIHDLdXfT2Mo9SnhYmJq8mHmravZQVynZQumWjz8e8H6i/jZOWc
 5btk/q3300TIIyNXXI/LZdQowhbD8HuZ/1gDn7L6NpYgqW53oyVhfm1ze9SuXn8KJVWtJ/NuFbn
 FwMrlZ6q95vv9ru9CTMKSQ3GIlEjwHAAnxJLX6x0c9We2vN0pTGNV7j4u35SJtVv7eMcxotIoj+
 bwcCCF7LhLIaNteG8nTV1+H2kYZAZX5j20yONhs9B+Xt2LVYSj0lpnWjWX44hIH/pLxVIdXXc8q
 A88WeLRHAhYH/+nG1sA==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf5a7c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=azaBX0EM9DmJuHldzdsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXyPM3vlAAOO5l
 9A/kwBCdV7aqwn0bvTZR6lV11llXXMvlZv65Mt4NULSOegXm5xWtgRBeWYV7mcx9sMuhFuOJOek
 tKS0ZuQUYYUG21v+F2IibzjFHP1l+Og=
X-Proofpoint-ORIG-GUID: ULPkVwi2QnX57Nw02uFnClP_cEG4XJ-u
X-Proofpoint-GUID: ULPkVwi2QnX57Nw02uFnClP_cEG4XJ-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode support for PM8010 LDOs using the mode
control and status registers to allow clients to vote for LDO modes.
Mode voting is not supported in the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index b484c0f73eea..ae5370770b2f 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/i2c.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -24,9 +25,19 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
+#define LDO_STATUS1_REG			0x08
+#define MODE_STATE_MASK			GENMASK(1, 0)
+#define MODE_STATE_NPM			3
+#define MODE_STATE_LPM			2
+
 struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
@@ -134,6 +145,51 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
+static int pm8010_regulator_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = LDO_MODE_NPM;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = LDO_MODE_LPM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(preg->regmap, preg->base + LDO_MODE_CTL1_REG,
+				   MODE_PRIMARY_MASK, val);
+}
+
+static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
+		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
+}
+
+static unsigned int pm8010_regulator_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+	case REGULATOR_MODE_IDLE:
+		return mode;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static const struct regulator_ops pm8008_regulator_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
@@ -143,6 +199,17 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
 	const struct pm8008_match_data *match_data;
@@ -155,6 +222,7 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct regmap *regmap;
 	unsigned int val;
+	bool is_pm8010;
 	int ret, i;
 
 	id = platform_get_device_id(pdev);
@@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -EINVAL;
 
+	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
+					    "qcom,pm8010-i2c");
+
 	for (i = 0; i < match_data->num_regulators; i++) {
 		data = &match_data->regulator_data[i];
 
@@ -185,7 +256,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->supply_name = data->supply_name;
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
-		desc->ops = &pm8008_regulator_ops;
+		desc->ops = is_pm8010 ? &pm8010_regulator_ops : &pm8008_regulator_ops;
+		if (is_pm8010)
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 

-- 
2.43.0

