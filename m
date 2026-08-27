Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F5480960
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853124; cv=none; b=TZ3hYhFfR4zX1x3q1JFjlvjWXsggvZR51I+LBK99wbxCVuyDcs/OwaKfHFzr4Htg9uSalfPGl14KJ9PrJSTXEiIVNlIc1iJbMmZvmpMtvsUs3VtBc6+CChU2ZTdc31SOFLRsgf+gixgnhYQeuAnsh1B4GExLnGPd4SBQHu85zN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853124; c=relaxed/simple;
	bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ebpz1h9HZlWzqIIHUexy1rxmRUkoETacuMyc+tCHwfcYRzCiJ4UMnoxiQbMqa6bpKpCy9awCjcVyA5RlkE5qRUgr9px5Zd/2EWXMX/Ki7vp5BGUbQcAxQLb7Oj4aUjTjYAfczWxRK0JemGkdcMHOiGz7f5+YNrZbmiZf6uXJAKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFjphGD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGKkloIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFjphGD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGKkloIQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXjMa000731
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=dFjphGD1N1rclYjX
	8PSV+w6jwQkIr9YsWFTgstUfoQy0sQTtmwYkZwWGWf9WrrKhCCKDRV9Sy44n8wgX
	9/R6ju+uTmnYRNLj+F+bFhRAFosKeaoHAEdxTGctP4oFWJxbfstvSEJUzPcSqTvQ
	PNhSNznNXpI7RwaYqH/7/klKwEofU5m8o56E4GcbHF2B02b5CeFb4h1MbghFoCUj
	5CVoYfBPrK+W2mzMsTawrpG/17oOGRoBu2cW0Rr+OReb1yrcvZn3KQF8wr4wmVr6
	0MwOr0Bz145oMEBJLNBBgoFa5ucHyykmQjLc6lZbG9nt5zqEaGykFAl2Pl/yEXZh
	n+8o3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etvsgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:52:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so1205005ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853121; x=1788457921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=OGKkloIQZCYNqRsq4nlpVvITEsr7LRElGFP7JZnhPYItECyap+1/eK33XW54trtgh+
         yVG1I/6qoP8QNUhmYp1iuQc+1fjYAkpjV6A0fDSL2uIpIG4MH3i3UqNzVZAl57iHS51V
         r0O4btIzSIuoZ5bVWoXESoGRlbUwaN+kyhmIiZYoW607zoGX8wxaI3ieMkIJRf/AbWSC
         dRNW6VJN9f2XCy32mGNqd+d2M3KXYdrBXmb3VhQEMhGnL/fzrkYfV8BtdK9AM6FSO8m7
         5Yy7ckN03M0RhN2LZ7HK3c7dp70sTrEYll8QJz2RuFrTb2l5RCnnjRqOzBg01UrcBsXs
         ky8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853121; x=1788457921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=mMKo49S6txf3Kc4iB9H+N3DQGboLiMWhP4UYZRwifpWk/8174iovMPAeeRdfg9m4oC
         pxuGDMl9avZ/30hWRaSFV9SNLl/61cmG4BgWFc66eksycDkOGY4l4Wnk4OKkwec99MRs
         N68b37T0xyn4xoEsHXiFgTqOpgijdj8vnH6JUOp8EWRrfG+sCI6buj2iXvHVNI0Qrzcj
         H/Q9eQxdaI5q5qoT5KCP/KWpIvl6lH0jMaExRfoJ8Uw/Tplh+bOA4k43lzL5LP1RdEgf
         28LRhbfXhdCkT55VaFyiSN3NlZDzvrxKH/20m8NYJYXYHmrQWjYScWHWoR6NF+iwFmqi
         Agsg==
X-Gm-Message-State: AFuF++mSc5GNb1lXcEuAAuQ6O1hBqLnqVVDnoQoZSA6N7zVXBri4MkpR
	LOTzjdW/luc76cig5gbMO1B2ORcE39gwRCWAyOAdrKMLwtwmhizwPRFRQl2vWAgyHNa19HNIMgR
	8SLBlVi0FIYdA4bLOryivAMMj9n72g+3kCXguMj8/8S4+gOiFgLXEORKD4jy1F1YVMB6Z
X-Gm-Gg: AR+sD104tMO0znS0kCmtAss9lWbKs2s9auTswVVH9pxy9c9jBlK8LIUU8FrPTyfm6yE
	yxRWxyOWVbugRNGJZPsA45t/ddexL5SkKLGqYhZizDo0fI6fknsDm9Bd6j7r41XWPXajZr46E/w
	vdfh1qviy43nZBr8sRyKRkHIEHauNqZ6W/5yPqFaY1PaQ0ziHoR6EnayEP23vr7xOY9lM9a2qM6
	oYxAoOJDL/C2J2GbBcpUjcRUCBqwCpQ4QnKmtYvpMrBvoGc4jCa8dfa1IXhMoNmO7MbAf2q0LwN
	qpDfLF3HDzQTCoNce837+OMGr6Xk5q0QJmgridiLrq+ZlV2UD+I4Jf5f/520PZ9/i6EQQOwBCfi
	C4hT0vRZU+50bqxguFsvDQE/EpDjNnDSa3P/L9nlcR4nQ6Z3YRiJqnq8VSjDWhTTyKhN1sUKrQ1
	r95vtWTNsNf3XQyKmRWqHNW/8=
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15356005ad.4.1787853121199;
        Thu, 27 Aug 2026 10:52:01 -0700 (PDT)
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15355045ad.4.1787853120764;
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:08 +0530
Subject: [PATCH v5 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-5-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=DJ/9X+zyxNdrjvjVzxUgzWUEDwu9bnEmv+BH8gG9CMZaVCq54yxqRXbSgGYGyRBaV5davTHKd
 C5aYGAAFLH0AN+pHU9UyxhEQe4FgERHHN0OYSx4KeaK5c2jJs9Qpcx0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a907942 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: NhRunHxjkJfYBTQl93hh5Yx8jW-usOLL
X-Proofpoint-GUID: NhRunHxjkJfYBTQl93hh5Yx8jW-usOLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXydunUochXLxq
 Uf2Rd9NbHgxmy90E5fEc2enf/PIW7EkVKAbjYyfeNXFZCV4qyTKg4ncWz0Veu+/mP7RAuEW1hBN
 t8lqdlvKd7r4Ug3Nv9WWY8kriqEVygJgRhgoyZ2MBOWjJSfCvyk+mhKuaotfmOb+RRxT/kcti4L
 1xjeN//I8cwP24DS7B1TYXZRhfVNJOO0hKZtV3g/OjQnPwoRSKyfnyw4gmCqbX6wAJ+V0Qw89n6
 Nuy1RBDn+DvXWal8Cp8m+zVd1mfyJrXhJgGy/oIZtb2NClnMx8IB1f/z3b2+QqvG0C8C6TmrIdi
 GOEF8jWIxg5px9sm9+Y6r2s6/cMUL23ai4kNeLOkRUR5S3Tfe8uvaCOMa8BoBosgna6/h4PjntB
 +wiVtfhno3pP+TxlrQhd2rcbWKutkzrKV3TOmgHMY4b7no/zBoaqrWcOgK4+CVq7e5va936rlc7
 Tq9YVq3inZEqB4Pv5BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX0w4VgX6Jgob3
 JYfivVXg6vnqLrhvG6MzuApl6If7mscNy7kfOTC56ZlPRc3y1uoNLcYbuRU+z35Fb9dO6Ijm9oN
 LqdkoiVMsm0IyZNbzekPp13A0+1Pnjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270151

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae273..ec8700b6186d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1097,6 +1111,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

