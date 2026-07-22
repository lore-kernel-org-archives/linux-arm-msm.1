Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA920440A21
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738235; cv=none; b=di387bq2FyijMhaaTiI3+8hLIMLBFVIG5kds6YNVBFFMZgc2Y1cdDhgL/0opJBs7dn3cQpsyctcms24eTeeyiLKCpBb3MtfXLLhtp2u1DxKwy0TT+HxI8ETu0q0zDjZ5ggvxsB5IVz2pAbhakJU3LfqsCxzUZRz1FYEAg/5J8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738235; c=relaxed/simple;
	bh=S5PhMsC6yS7z1bINKvuzVMHA53qCHkHxeuG5dKaL380=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8HSVqdZ935hTIwXjDLAtknnuo+rO244aTmF9tTzPDJgc0U1G6/DLS/1b5Ga+wB1xzb6i1G/6JIYXdKX7icyWXo4JROcSjahGWqmNNci+LTN1Ecu82Trqr/N1xAK1OQgrq0jl6rNfqJl1irgda0wkLb/RC0th9KFMPyK0Zr5ADs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi7lYqZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDk1SV84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pi7lYqZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDk1SV84"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXuKA1259240
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IhQcrp6tnTy
	WYmWCp82cuq0ptzWFXZKnDGXpYxg08zA=; b=pi7lYqZNz0sNvRk2VKj0zcONF/b
	55ZWPCKY4s6OnZ4ZBBzO+9lHaYDGWg2Sd+YhnaUY7yqgk3dkptbCuqLDuAlieG/g
	2lD0ZSPzJRJcCHV4mNGy6ssR+e/C7ZgFv+d+VgOB+ik3JKPpq3ZCBneQ9YsfLblg
	ZCbHES443wI1VUoXsZbBq7+4eebSDYb0+lFAye1d+f49HZzfqOz5wxy9NLcKYCXP
	q6Mn+i4+F6lRZx1wyF1Jt3yxUlADZQ/iNy/vBeJUzLhz4E1P1utXr1DMa7RtIPZm
	BMcbXxko/hEy5ixq/Su5wKFMT0iwXtBk9XZuuxWJ4kQfJv1rgK+mZE6iW0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu79mb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec91dc265so924147585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784738232; x=1785343032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhQcrp6tnTyWYmWCp82cuq0ptzWFXZKnDGXpYxg08zA=;
        b=ZDk1SV84+40di80m6eBIG6mbfQqiqmNtBr1GRphoaXJaKRgi3aT7xyM/X7lcSItqay
         bmyog/a1ugHrVtS7npbjE/UOTtMBD5Wu6tG4VwdgT6dcU9u7mRtaB4/toNRUYjbFRaxf
         C+VAo8qKvc+Mcq6DcWTJW+uuAXGqXm1MIg3uwycvTT0jfJmkAKHVmW4zoM6iglWvB+/+
         geyJvJoMSi8m0F6DWnZs1F+aHqrrmisdxNivjAVCAOZrMJHmjASdzfqyhNTBBdBfNaWC
         VhyMV57DxVfMoRkzCoNgfC1BrPSYwWyFh5uSRAR2D0NXZyyRlt6YkA0ES2hGq2u6c81y
         2H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738232; x=1785343032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhQcrp6tnTyWYmWCp82cuq0ptzWFXZKnDGXpYxg08zA=;
        b=jbVsW9JOKDuofeopI29R/L8IdaLK/JAhcgNAHB1OnroQSi9v7yXDTWhER9OLDSRpx8
         E9yvcnYTT4EqL0cTaTFF307wz+K1XFWBEfZBB0Sl/QMHkECPs6rDHjQtJjKbJIILsV4K
         ITbcqZ5AXORv1Bt0YsfnzcnjXy4KuzUKoPuUeOmZzQFqvJitmpBs9ao95O8subYaLZBt
         G/IP0MX10XmgO42Gc7X7mUFvvkNC7FQi4ZpP3S4gdf3b6xPAFGYe8BfbZM5+vAPfd+q/
         SeCpsFr8aY4vX7kWTavCxH+loT0Ykyu9aVzSOU1BMX855h+au0xYTbbN5NrlANui5DoP
         1Ybg==
X-Forwarded-Encrypted: i=1; AHgh+RqB9WB0k3p+gGyfkzOF7sW5L82Uq2mpauK1df8J1sNUbW9sj4M2FzcGvGKBxjQz1wQ3hL+kS55B1kHWRYhu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6K8wTb85rYUBB0LzTnABi7lAZBhKF8+6MeaGnwRt1kIiJwcr
	b9TzOm+Dy07XFCjFt8KJY1tCncjfx55GnjgqLFF06q42n7yI2aqXohTNITZT/eiDHz8XY2DdX+4
	YG5pDB9Hi1Gg0G8LBXdW8iE4q9gChSgb1s7Rx5KWzshy/zO5rF9uDrwDsudLtJUNbWK1K
X-Gm-Gg: AR+sD114pl7dnoRRgemXzTOHr4WWBjZIY99xorwU7dzuKN0WhWAaSRGwdcdEezkse8+
	EGYC8q1ipUp8CcatEo061fHHGuXwJUPZgbYP8bykXcm9jyalewqYp7x+gfw+fbpIXKzt9KyAOoN
	SoqMNkwyNs1neLIjpYO+Z08renjZcNNEMmb6OlMQC5IScBd05mu6RpciVPWRAXozpkt64U03PEQ
	KVSGgYsP3PI05pz1gIlwslvHujAr0mMvbEiQNWRVedzJwnFqs+eF1qAs98Y2qBFpfXUhde7fKtM
	N4+xYJyHELz3e6ebYuwmXZ5w+a5b0UKdWk0SKvi8QCmuOlQUUL1JChEXQ02E/dSSvR9OQwL3yOR
	krZEQMzr6Z58ULieJRkECx0y2Krfvjbhsc27RePDkA4F8XdocQsDFrCWV+qp0vMk8y9YBmAc3A2
	ai6HofTpKA1s3tRu8=
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr210226881cf.35.1784738231639;
        Wed, 22 Jul 2026 09:37:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr210226581cf.35.1784738231081;
        Wed, 22 Jul 2026 09:37:11 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm1301150a12.11.2026.07.22.09.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:37:08 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource table
Date: Wed, 22 Jul 2026 18:36:58 +0200
Message-ID: <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ByEPQE0jgfuJB5ujD_eoMldqHzOBJr07
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX2GnpIpTEcvc/
 KEuPvub0Rc5SmYkdmM2WCJIb0Mvsb7zlMRIuHQQhxr93ZZm0Crw1bB0LpCcRXdHUsBjyskYwKqU
 /TR2r4KJCTQm+L2PbYpHXdTfUiDE2tw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX0Kuc2Es1WB6k
 xKA7Ix2m9t02aGQU6lAb7WDCmQ51H+50XBdUi7eKUWAtPcegj/85IIy0GH7LempzOaU1uJfTwjX
 YaPxUCrGBREf88IzK6Ihm8alvAIMRZmSM73Di6cqDQsSmEOj04lUaJGZs+iMlDztV3GwmNF01KB
 wpv8H4KFiEtdfW92qeXq3rcauKNww6CasjyGA5JJENoXzBHtIJ+g7LfWw4urLil196olpYbNePM
 BTwtB4kn2powK51NAcw0NgLrVIBnBm59wdJyYkSiamcd5C5aJ5aaRniIru+f4PmjK7yQuRW4FT8
 QZOsn1/Ez70pBnAg4OKP3+jzru3n6DmeSCLFnS08XgTS+jKpv9RQO9IFoenXUaViqAsl/BPHMZY
 kfFlVk6CDwei02kSyl4xcGuSdMWaSfAyyIqz/lo1t1b4uO6NAvOAy6VWp+7Aqx91wkBe3YLHPn8
 vc0BMzOtjeNLAF/MMRQ==
X-Proofpoint-GUID: ByEPQE0jgfuJB5ujD_eoMldqHzOBJr07
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60f1b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=OSU0MNRdqBj5gpyExlMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220163

The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
info and use csiphy_res_8775p[] for the qcs8300_resources.

The only difference is that the qcs8300 has 3 phys vs 4 phys for
the sa8775p, so explicitly set csiphy_num to 3 rather then using
ARRAY_SIZE().

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 70 +----------------------
 1 file changed, 2 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 477358dd39fc..eba14a6ae7d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3657,72 +3657,6 @@ static const struct resources_icc icc_res_sm8650[] = {
 	},
 };
 
-static const struct camss_subdev_resources csiphy_res_8300[] = {
-	/* CSIPHY0 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
-		.csiphy = {
-			.id = 0,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-	/* CSIPHY1 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
-		.csiphy = {
-			.id = 1,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-	/* CSIPHY2 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
-		.csiphy = {
-			.id = 2,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-};
-
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
@@ -5555,13 +5489,13 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
-	.csiphy_res = csiphy_res_8300,
+	.csiphy_res = csiphy_res_8775p,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
-	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csiphy_num = 3, /* qcs8300 only has 3 phys vs 4 phys for the sa8775p */
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
-- 
2.55.0

