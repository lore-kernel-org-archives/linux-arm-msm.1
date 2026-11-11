Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416632;
	b=C0zfpjc/P12ZI7W0Ce9GWxL1jTaBYUPVjIGo2X3lAa57NYy8+/NqKNoQX/3k62a/DKJI
	 tNjPA3BCjRh1H+CTmRM/edbAbYar7qtRzLjyOWIRhlF6UGD79Vad+EKx5cUi1CaqvRblq
	 BA+iDWnm0cgK7k1+5UIWdmSLolCEPLXxYZ72VJLdr0g+iYtACzy/gZDcAA+uKNnntZSQj
	 1ZX9331rz1Gj78n5MX/TuKapajn/b4letiabF3k2lR3dei69KdtcK2RG6Ge0/2vEUX4As
	 m0/LJzfC1MLIYV/Gqfb47TdRXjnVomTUqFz0Eix0XUDfMYB6TpCwbkt7+g+9YXqbqew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bWWKZBV2QErgTygOLGhRJUJAI9GgPMuvttoX9R9xSPs=;
	b=oxZl97BeK73kJ4Q4lzHQrW39EXJXflmrdbJAJ0fvm3HSK2/HU6LhYNWNWFfnRsO1PHpa
	 PuzSi5UT7Fhc11Y5ukrVWAPJe0w0ldTsBD9754fCU/pUBOk3SY5i4egaKe53eN0qqsy0z
	 pqp/PYXAIKJyD1cUvXWdvKzqzUbz/v41hQs3phsOsbISIw0niMQ7tCCdu8dzeZ8gUrK9f
	 8NsfR7UTKO9xMy942WN2u079FmdZ2B1b4NTS0V9qR1tOQNHtoE/4P/0TMZmFPx9mpY1v4
	 o3g4mGpLUgqg6muX11D5sgPaCEeiMuLid0TkpW19m/UXRVjs0hbOHnTpN22/WQQ9dTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dDSf0cQJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cikO83QY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B0606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F8B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dDSf0cQJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cikO83QY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0ANb618000
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWWKZBV2QErgTygOLGhRJUJAI9GgPMuvttoX9R9xSPs=; b=dDSf0cQJC+MnF9qG
	wF/KNqfinidUN7G80sxt67ofZrhEHWEmP0VmBzlHsA8k91cHn2TCEkmxffEHmy6A
	40Wbid4nb301JnuqFYtrwwe1lEm+5Z/a1w4WLltf3nUm9xxhf4UcVwD1t+8saitM
	VKgDvkCorMzGoTLPdxWduadSdb1ymOSUxM6WCqsstQ9/rnBHlLfRj3JzXYRMiArW
	l5FXolczaqiKmJ5hRP3iGsb85lPTVh24JTxGXTxwGs46ghvunI7qBJ1UtUibn/Nw
	LApx3Iyv+BmIthyl6V8hCTlTO6zGGBDAkXKVvxwxZHDnjPFuiDuae55vVHvJ5Xtb
	5T/K0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjsqb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso3056079a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416630; x=1795021430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWWKZBV2QErgTygOLGhRJUJAI9GgPMuvttoX9R9xSPs=;
        b=cikO83QYSQYkm5EjJ3JfCp6YpTN7bWkAjaaLP1j2Z++NYmJk4gBlm4GC0T0p3gItsN
         QBPE1gE1ook5a1nBuMO2r24jvPVEmImAWzOym+v2Fex8CrX51oF/C/ZgnPQuXBFU17Z4
         b382GK56G4XOE9iJNQGwnjgS4kEibbptN+WnqDNYmkday+w7AR/pJrRAAR9yCHaoCkLq
         NrloWVycsM0uUJsgx+41TVopkYHR/SQwiTe43NbcyTaISrT6TUudaNZuex8p7BuvAX2r
         J9jc4jXyTrj8oPb+z6u4tWEV5edh8sRSjNUvfKEvoctcp2DkuYK6PEpK0OcmrMtSQ0RT
         T13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416630; x=1795021430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWWKZBV2QErgTygOLGhRJUJAI9GgPMuvttoX9R9xSPs=;
        b=adTxfOM8joEjgAPJhOLN6AMT2nhmugR0YE6mzJR9v/O3frdl9aOhx+AAED2DrM3Fm8
         faQIvQrPAZ0GomjOouLCaEl/65xUpNi5uQUj6lktsXowlAb0uo7dRmfy9SPjTcj3U7dJ
         x0Pcujtu50q2bMBwZwZPexc0p+hbKrjPBkeCnPPcp3zCbwnERKtx6yAMlhYUnlUNDxHp
         g4RN2NkbOa2axkF1yLi6F4iOrM8M6ABxkeIW7VGY0U9/liICMC+Ii/gbPf69q1/OxL9X
         u69mSn5gF9FiRjdZ6TbITjeXaX1zWNtsFBuDbbLhk9UCvJnGcXI+4vMSTvgGcungtiXd
         7T1w==
X-Gm-Message-State: APuU4Z+iM+xS6UIPmxtNoKVGmc8i2l4mAqlLqa/w/CWSo0XLGZSHd9FF
	MfH3wfaTwDJ10Kl8lQzhJdbsa9yuQ83Q4Bfx/9Td3wBcwXKQP3HtZwkC9l84PU36K7tG2uZt+AQ
	yvVE9faDTbDIpwLDpfuR3uDNawVzy44G3Dab0IaW97+reosD0B6RLqHT3hIxu+1vlZ/vP
X-Gm-Gg: AYBFou1X9keYa3fF0Y6pI9zeYfNxJYs6nurpxBg+Xf60fQ+YD4WEEedV2SzFJ1VgLF4
	6nZPp3LKGRlRNDeffcdwD6cVWh7uwwWl0o9cU6bAvOA4haoqOMaYJ5pWvL+0KPAo8ALp7P43MBZ
	lSfGyC5bo9w7CAimruKmvyP/RL/W/VpHi/HbhAxRJRHNufD0MlF2nQ5avm+XSA8P5+Bu/KCtfdH
	Xu3c/bobdhnx3L8M/l7ChCvYBVVGKeyR06GvpnWT6Yk+aESoFongaInHYkQmCem1duzrZnHn0qd
	4aQCDJ26Q1fUfbvkCdZMNckoTqVc77r9tWkbrhUXcPk1NAZX85Cf+bvIMf+O0GDCeuOSDVcPBBi
	qGjGjgLH62mu+uTQpLSQVtE4yLVvWQK1BQ+6Md8NKs2It7GlK2ko0JHMyLxnYeb/dKnc=
X-Received: by 2002:a17:90b:4c05:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3b182eec312mr2629727a91.17.1794416630295;
        Wed, 11 Nov 2026 09:03:50 -0800 (PST)
X-Received: by 2002:a17:90b:4c05:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3b182eec312mr2629663a91.17.1794416629708;
        Wed, 11 Nov 2026 09:03:49 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:49 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:52 +0530
Subject: [PATCH v4 3/7] regulator: pm8008: Add mode voting support for
 PM8010
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
Message-Id: <20261111-pm8010_i2c_support-v4-3-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=6338;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=4wpXvQDL4G2QvgSzvrLmvg1aqhh5YyKzjrVv83oJ2RM=;
 b=YnMJiP7Bzh5eIZ++TzzZb2Sq8zJ6mIegW7mAtyjHML3IDblLC7PcR/RFRQkCtGyNAlX7y2Ui4
 AVTUe0UGdgqCJzf4S0dd4O/RONsHLVc+ncm20e0iAYK6fgii+HLQdLr
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX4gg1yMt4kFwd
 sJ6x/YK5nbgnyAOgB107DTZJ/kguvEkVPl0LOdSdRKBEgrY8+ZyXogTO4UCRX7vcMhqo3pn3Mmn
 l9FE0IKCGqZDmthcfVa89J+9BvehenV12SlsS0S+4smOEoVr4ok0QJacaWsAZa8TyVBkP2XSLHY
 m++pm7QDoc/aKasehiK8dLlgiPJDI/ygwr6oAAe8WX1oN79OCpesaB1Di8CMx8mOogtpl9lozDq
 PjCJnHBd46x9u7RldKXHs6aUu5p7g+3JssUN1++ZNH5k93CBIyF+kSjRWRnUq9GPSn5GyKuK6pA
 OCBl1kvkESppk09RN91w7kgfTOMc35LlAOJqioUatiCrKJf/amR4rcX/oi/6k2/qh6ohwuURSvC
 IVpU2DUgAa3ihqcBF+qatuMe50lt9q4NRmOq0pyn+5gz4LkEOKJZmzENH/nFgi9hzP/CNF4u3NJ
 oZassRqAgoJUnLDkPMA==
X-Proofpoint-ORIG-GUID: rSwuMBf9HH_nhxbKczbCyCKajHKcza-I
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af49ff7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9b6pvoUWzmwS3gtn3D8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rSwuMBf9HH_nhxbKczbCyCKajHKcza-I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX3+qUAuEbQPH8
 Ovs2As/RkXDKweHC2sDcbXLGeZv1q+qWEHc3Lnl364na2P3P+zfUsJhghX5JOf/rPljOT/sJ9WG
 GIxR47ayn6v/Cyg9rQpxOj7q6p/yR4w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
using the mode control and status registers to allow clients to vote
for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
LDOs and not supported for any of the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 102 ++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 0ea4ac016dc2..395d5582f6af 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -24,6 +24,13 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
+#define MODE_CHANGE_UNSUPPORTED		0
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
@@ -31,6 +38,7 @@ struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
 	unsigned int		base;
+	int			hpm_min_load_uA;
 };
 
 struct pm8008_regulator_data {
@@ -40,6 +48,7 @@ struct pm8008_regulator_data {
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
 	int				n_linear_ranges;
+	int				hpm_min_load_uA;
 };
 
 struct pm8008_match_data {
@@ -71,8 +80,12 @@ static const struct linear_range pm8010_pldo_lv_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
 };
 
-#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
-	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)    \
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range), \
+	  MODE_CHANGE_UNSUPPORTED }
+
+#define PM8010_REGULATOR(_name, _supply, _base, _dropout, _range, _min_load)    \
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range), _min_load }
 
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
 	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
@@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_data[] = {
 	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
 };
 
+/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
 static const struct pm8008_regulator_data pm8010_reg_data[] = {
-	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
-	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges, 100000),
+	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges, 100000),
 	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
 	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
 	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
@@ -134,6 +148,69 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
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
+	ret = regmap_read(preg->regmap, preg->base + LDO_MODE_CTL1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	switch (val & MODE_PRIMARY_MASK) {
+	case LDO_MODE_NPM:
+		return REGULATOR_MODE_NORMAL;
+	case LDO_MODE_LPM:
+		return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static unsigned int pm8010_regulator_get_optimum_mode(struct regulator_dev *rdev,
+						      int input_uV, int output_uV,
+						      int load_uA)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+
+	if (load_uA >= preg->hpm_min_load_uA)
+		return REGULATOR_MODE_NORMAL;
+	else
+		return REGULATOR_MODE_IDLE;
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
@@ -143,6 +220,18 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_mode_set_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+	.get_optimum_mode	= pm8010_regulator_get_optimum_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
 	const struct pm8008_match_data *match_data;
@@ -186,6 +275,11 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
 		desc->ops = &pm8008_regulator_ops;
+		if (data->hpm_min_load_uA) {
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
+			preg->hpm_min_load_uA = data->hpm_min_load_uA;
+			desc->ops = &pm8010_regulator_mode_set_ops;
+		}
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 

-- 
2.43.0

