Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAF4FB9BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554661; cv=none; b=IQsk+pAHIyvxj143ey/64EL8w3QObtzOjJa6acQOsZTZb0L5O0kcCuL9H4R8SrPP2S/ztt+tWhFMaBqY3fjHDdRNEHuJjJFvBAn9VyVOKiXFBUzyQFLlMcTHtV0UyxaGgNpdF7iPAgfcGT39cvkFL+i7QL+/rUApBcbOVHAJWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554661; c=relaxed/simple;
	bh=0T4dQbu29oPHtUNJMaj4IA4JQ3pucb+UYD+sfPAtCoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V42xpsnPpyUKsd079KFf/VqjYD86oGanWGxULd68UHrzGzC1Q232cZ8NKNvTJz8ZfPDvHiOzOtWU6eVqW+7vl1GfeeHheSNJFzssYRK1U0wN9OLu1dOcXYNZO8Dhq/dba66Q4bFqDe/pcKEYpBkwiKDabVqJ7rEPG4JvjXiilg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ydux3VNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aj4gI02H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ydux3VNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aj4gI02H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92g3E2348128
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSSUosnYV8bVdtrO8uA7tDw0GoPQ4dpOoCCpY3yu9hU=; b=Ydux3VNACXLfeysb
	CdWisWTkE6rbUvCT5Sz00cGKq1mosh7AAPvdwMJhAY5NH6sw/g+yeG2dOkxm1IeT
	LO66QNNqdNcG/Bk9iaialIEQjT7IVl06iSreopleSpQLDczDwvpZDMq9GBGJWw5N
	rnkRZndbCBs/QzxstNtRxK+ZhukHG8XoWHPfGJ22T7+282IgBGGY4UUnKbPv/OMJ
	hj2OEYDgr0JDJO6Rcpc4X4wpGIauHiTXT6wqAvTh4xCSNH+HjM3+bn3TTHElTKD8
	8iHdoHc0/QLrlTNJpsf2S+gr0vRnAwLk4iKHJD4z89TRDwOi/+CUzclJ6UMvUTuc
	kaksTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so675328685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554631; x=1790159431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSSUosnYV8bVdtrO8uA7tDw0GoPQ4dpOoCCpY3yu9hU=;
        b=aj4gI02HWDN/CoVNEDCGoRnpTCNNnBnJzDrwMYEkL6K7eAa/kT0o9uwJ6HPPqrgkmf
         bHwy+xdq2t0NmmdIUCWhoRQPfwLBU6mj7UIu7k+oY4Rrv2KL0qALMcb5AoHX3JBMymz9
         n0pAyd6z57wB2qjc7vdAamYTmhgRdipkplTlReQOQxI0eYrmn1JDEw/V231B+z3ZCPLb
         tkNlxbEDkobdiu2/6bJJEb/dCx9RuDEaPGeuRvS7+xgdM65OD9lsidiB4SMzpBbncX71
         f3QAHglOhNvbMagyv3NZl3cy7wtKLmkKx0DiKvEVWtCSMRzvFOYkE4A4IjnJ+DIPfi5x
         D7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554631; x=1790159431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSSUosnYV8bVdtrO8uA7tDw0GoPQ4dpOoCCpY3yu9hU=;
        b=CUmYlWKD+wBGLtWD5o41iE9pFaQw6wP6En+nVewOz+83QfsUcYQ/1CNKYvedCi+lko
         XLs6JybKzjB2bfHy41xOHknOc95T2qvtf9gLfniAA/086Qi8wRZiYc0vTamE6JPJhsrf
         3O5v4ubTXhqesoUlzKdKNNxaynz/FkuJf6lnApE5x3u9+oPdtaZiryBaql0wmrIVZ5Xd
         G3HqvXU8detSzB+wn5kil59IFJE91g+XhX2gt6zmU15Girxq8Jo9GRuYW2vxjptmMvzc
         L7T7USK62ZKxETbJ4a7uZtasy3TZjafGCGNZN2O3N6X6F1wGId5r2MBjtveEtRNttoaR
         Bc+g==
X-Gm-Message-State: AFuF++ljFdKCv7nfsRmkTcKE7t+MMbZd0G7EWAvNyMtC8qWgqN8Ie726
	V2yNiGa5zhXnVelQrvhfGYIl09NNti0550+NS6BxsWMmbWMCL9HNi64wWmXOsY/ge8ACrLk+dx5
	CyKlhgfuK/gF8XMiq8vcSv0uvJZ5wJEC0VbMOdQ9a9KaxWUE3Gvihl4L9vep/BPZmmYHc
X-Gm-Gg: AYBFou1gmb1RFM+JQfIRZzZhGQkHiagGpGtrwGBLLh5qILhATVVUrQuO9ZINLF2wAyL
	7FAzRFV16OJSZDFuxHwTBU4ksYgXWOQ2PhBNbGMvMpoFIE6Ftkq4477h73G51I7tDk21e5i3UB4
	JrMJnvFTeAYpJlSXJfsXqwVOUW3e0Pl9wmzcsJ3/ttuOZmnbR2RHO3R5E2YC5SQVH2VwkaSYKXi
	G2/OFxuRdn3pZxZgFR7BcbZJoNknXUcQULiTYMz0pYtbgoUOx5N4ssopqXpvUMRzb8s1cw6Yayd
	7y4s63DtFsxUi6bswL5srrPevMMgoyJGBJXi7f3vdRXvmbfBPHtafzpD1uW4zPymRy1KItYEBND
	TclElgXY=
X-Received: by 2002:a05:620a:648d:b0:914:afc1:c66d with SMTP id af79cd13be357-93bb7667c54mr281835185a.11.1789554630980;
        Wed, 16 Sep 2026 03:30:30 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:914:afc1:c66d with SMTP id af79cd13be357-93bb7667c54mr281826885a.11.1789554630426;
        Wed, 16 Sep 2026 03:30:30 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:52 +0300
Subject: [PATCH 36/48] clk: qcom: gpucc-sar2130p: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-36-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0T4dQbu29oPHtUNJMaj4IA4JQ3pucb+UYD+sfPAtCoc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9tx0E7IbD7dx9ixcFQo4kmobzbcTPvrlgv2
 ocNRkzPAzeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbQAKCRAbX0TJAJUV
 Vo8YD/4p0sJSzsnCt4aXkQH8gjr0nYkUCQTaxvkSrF7W1ffFkbD6c0Uez240WX8IXEnSU5xCOJF
 zS8WABTsM4RjjIxV8YOzFSUBkfpFx1yJgWHWDKjapLlM4XxLBGXwKJhQulhmpz6kKrXuYc7WoUh
 2UTHaW693dyzmJMy9Kdul2JLoDDqq+rO0E1XSU7+P5D1wa9lnJjrdsNWO6+/90+0cOj9dBAcvDa
 4uGKlRw6+uRmFtMlnZ7R3UFO1Xf2usbjaOMeFvVsbsPHDdeusE6KhgTiyj9TRwd/laBfE7Pyko9
 0bsHyy0FV0K56aV3iNrDqOqV/9BKR3RwYTUUhDORouleu6PqG8G3yjI6/QhZniOYzTT+/Qwm+PS
 h8+oTEXxPjAxQUQxiYzuaZjRp64ObD+81pkfl8EYfa1uKUpRFXc6TK5mUVLz+n8FgjXUtq5VOWh
 qPguMe+Q0yZtfyet+rMPYJRa7Lt3ooP/4dYIHmiMFWYbPKUGZ57xQYam0uNkI/1ycmFys7Z5uQR
 Xs815GRHHNxNMEcRDkGTveudrX3gDCEQRTvGETaNahKxnj6lkVmVfQ4/XCt/4tkG9mAwxGUNJoi
 lsadJGZ0QDmmm2lrVIZg+IX/B2f/Tu+3C/Zs3dDmyQaoH7Bvgjn97Xk6LqgevprNSLw531Ju4zu
 nSoX1lm7eWnC19Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: nqggovM5eW8rAwDPCsF5ACFpLpw5eY_K
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+b4eiSfRLGSr
 lIqsznW4kno7t2Yzaf/aHE9jSOSbs37MXsRp79JDVEXdsO/7uDQDX30EsEX9Rfd/SrnR1b35Joo
 H6AS6EgwDntY8usZlCeTsXX0nmWZi8O11KZt0S4ebYRyZFsa/n1paJEBnwum+uulCBBsREQahvh
 jMCXJgdEZScsyJe1+Y6ONP0vxLCJTdC26HSOmRxJIdQnruLQTa9B1PhF+X5UyuLU2P/3Vi9a82N
 n0/Y4f0QOtt/ywH3Uppb57D79G8tVyJEuxOnQTXiNoLgseELh8X5NUxkfAycTZ2KKAd/jAU8LZ+
 wV6Isj1tsy6HO2st/RbAtMh5n9UYDiPlEam8T+r21khWFR7sR2cJAk9tmNIkdlBTen4oZMt4bGA
 lWbicxIsz+K3+E47E0vRoixd2fFXrOqxjqL1Y0zg2gB02mo2iY+bDXm18u6sM8+xrQKLXvUsWN0
 OV34rVcwvrIemFO874A==
X-Proofpoint-ORIG-GUID: nqggovM5eW8rAwDPCsF5ACFpLpw5eY_K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXwu5OqU6cDWsj
 QHl100gHqfCXwTD552I2QR5Rw8VweZXPkekc51ms2ZdflbVi9ZBKLOAf6AT2UydSfHXI17KpWhe
 Xp8cUx5ryyNDwVlNtHdUEVeRmsnTZus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sar2130p.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sar2130p.c b/drivers/clk/qcom/gpucc-sar2130p.c
index dd72b2a48c42..fa261664c1bf 100644
--- a/drivers/clk/qcom/gpucc-sar2130p.c
+++ b/drivers/clk/qcom/gpucc-sar2130p.c
@@ -455,7 +455,17 @@ static const struct regmap_config gpu_cc_sar2130p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sar2130p_critical_cbcrs[] = {
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sar2130p_driver_data = {
+	.clk_cbcrs = gpu_cc_sar2130p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sar2130p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sar2130p_desc = {
+	.driver_data = &gpu_cc_sar2130p_driver_data,
 	.config = &gpu_cc_sar2130p_regmap_config,
 	.clks = gpu_cc_sar2130p_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sar2130p_clocks),
@@ -483,9 +493,6 @@ static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
 }
 

-- 
2.54.0

