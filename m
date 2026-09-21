Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3583546F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971666; cv=none; b=CPbI+XU+XA0KuvJzxIrPbdU9ekUudRBER0cEfTGjQbX8BsxZHaZN8H69laMXvEzNqahYCNz60kpKLH4DU54MYMQEbOKHZN3R7KbwMqTo5ZSkHoCr5Ng1oHGh/ifUUfzk3VVzxiEFvXisf9YyVTpgt1VEPJITVNef/MGRTSuXGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971666; c=relaxed/simple;
	bh=N63un/lF44JSQFd5hBeUuqeP/RTk7RsvOxT0zvGBptc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnIINQOoYYzFCGIOqwHZ5G8r1Cir1pA7C5ED1gE4C8NCk2QXxHgPQBsKqbPkeiS+89EoBv50IcVQoaGuHCWtiulpcsJQtgqFT2q/Ooa02vnHlXEBgyXLPuJM1VQrpvJ5vx+HmY2yaxps4CzV/p11tiYHcgVKcZCKDi3rqCw+MM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGlSz6Uu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHjx0aS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGlSz6Uu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHjx0aS+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZS503490688
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b25OhBNDuWnGd0/gPjM0hDgSKVy4dyq4uzoFl6nEX7U=; b=IGlSz6UuULfs6HiK
	ZUfn+dWbNfcfTGFYt164x6c1gpRTZgHYIVtufh+GO9QbsNZQ/JxL5IcwpvPrIEen
	c4nz9OL9xRf36cRGY1m0bIsEK29fbm6kI6iHumjZCdnLHVYrPdx4Vzc8xvAN7Ip1
	S0usPhI3PS9EOIbORae9J7oCytcYUfp552S0VySp3PQEPUHrAzFYNQjEZAVMOmcm
	H0SVlwGpQFE6nJfzDUUceeWu3HO1jMo2L4N5muLaVz6npc0Zoo9GWGprMgFtOcfB
	8YmcNywYo9ZQl3c/Os2o/dhgL+hWM4CdUd+1ZxfbKbjoVR9q1lypPCMPiZY3/iD1
	2PMnRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9vvas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:21:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1652128a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971664; x=1790576464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b25OhBNDuWnGd0/gPjM0hDgSKVy4dyq4uzoFl6nEX7U=;
        b=NHjx0aS+V2aQwzk2UyAxfAa5Al9xmtehf0HDqovvuvEONxYJZcozSzvBVZVlPaTcEU
         0unwbms5lIt7UP3Hqm4YKD1A+JnZvQKOPiyvAoRcOjqfgT/PvSW8dlDUUyOXeZ0SR3uL
         o7r2XwARzNL+rDNLvf//mkOZwjBNw21/bDN6cFcWAbzP0jPwv8lchdOOYOLMfgmOKXD2
         w3pqnhZCcI785rrUU5i8WTaEGUCEB+b9SofLdeg7k0mM+urgEHD0yysDD+AuweaNxy0w
         X4wjjmb+Jj/j25cB3SpT1b7+bitubpgd6NOYCIkXpFTm+jO90gTogPloRlziowPG8yKW
         9Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971664; x=1790576464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b25OhBNDuWnGd0/gPjM0hDgSKVy4dyq4uzoFl6nEX7U=;
        b=TLnJousDKN+Nf+XxRPs6C1hYYn0suD5yT4PaalU3aRmhqra8cv/o7nzgdS7YVt2wXG
         Paz/TFL066XNUGjiLbpRfndhAwAwUfqixa/HXAhOjpq8aShMvaFBabAMnz/Xb5UD7UzN
         eASS0PFF9nonTFJ4F9bZQ95mawV4CbMFOdUuKwgy1jcHwCGH6sKwQyaE0Y1sGhrDhjDC
         ymwVrTiIg+sOLCuI0t604ULoNjhPmJRG1R3KguPCV51m3syZfiEHblYoGA0couzp3CTm
         roQAlp3kTFIGSolqFN/W4px5Cb+oroSIcbfPA3k7MtS/2PttRi7EATgzkxy/s8sqm/7L
         NioQ==
X-Gm-Message-State: AFuF++mksXA4sPJG9nc+rbsVWLMntwR3oDnHfIEq3XDKJa2lZdjJc+xe
	ptmsrJp4Y2O3laVFxDWAnAWWkEfasP0BkbEnUwYEFhp1MOsIkKdRNlSB88uc1yy8CrrSheWA8gt
	pnTVpILuntRAg2QlOUA67VD4LtNqxVO/S43Ly+8NX09eYFAF+GKOLFGwnKyAdiPJciZ1M
X-Gm-Gg: AYBFou2+yMDJl6MUxqB4Osx2qS1hyeWPbDrjXlDd1A/1S0t60hlCN9EyPfJyRZSXzyk
	Ei2EHnJzjkEC/a3k+1kaQS2R55rQRugmTe3rA7IP4d+Mlbgs91pq5AHcQLpiRq4ardKiGmWS71Y
	jDu+EnGQlwo4yH7gMA5wUeyZVfW5lyfHkPKGubasgLBhDOzhauPru5iCLSim8FFte6Up9KUcBJn
	tSv8DTWLEdcgVFrBbUhyqjuMDuEmAsnnXPECo8HSCWLu82vPp85G+fQIybVJuiG9JKzNpMomP15
	ZIINjA0WD14X10gedwRNRk6me4kwXuJR5uCf/3IV7tOndkf+Mi5rILbqdzVJkWd8ycs0o0Scrvf
	/G6kQ2M2np2uWN9Y9y5eW5w8j3aONf/oXiNgayjLAtOgR3t08CcnjGNS9Ma0PQlL1N8x41xj1Xg
	uUSizT+U6jt1QjmCHp8Lr4ZDTzxKe3WAMqFw==
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15957319637.33.1789971663893;
        Sun, 20 Sep 2026 23:21:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15957280637.33.1789971663524;
        Sun, 20 Sep 2026 23:21:03 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:21:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:44 +0530
Subject: [PATCH 11/11] clk: qcom: apss-ipq5424: fix 'ipa' typos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: f_emsawQ5Eq514nmt8_jEFhjCMho1Jv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX6vXHlXI3ykyk
 C6Hg00L96UZrh1XRoJX+tjOtLqBEe/rEJkvzAL0KWC/ew47MzH4+AJOgZ4shToHjFmzbj2r1mws
 HAbO3rcipKCQPKdaI+t4iTTPWgbMouwpndTQxIonjwSt42nTf0rlidsHapuC1wKNOqzG918vqGi
 a+zQgS7p3pGE8tF2pu4wSo9bgS7IBhWlrreDaSi3jw5mvSU5TX8gYuIuJzG+NZ5FUt15I8ohVhE
 Kh5xcKfhGMUQJsep6O98NDk8gqkiI4ZcuXWrSyiCgXTi7Ho3HJmbu7Znt82hBJGwqAXTLHFo4wI
 WDdBcanIZvoxr89vFkBZPw5a4M4fohtstiSBg08lPlcgFi7jFVEZLY7rjbzqPzWwD8OO7v8o6tC
 6rLyT1HPIQbi3qePrJZ9PP2rCcbfutAEczZmkgeknTnJHdpu/8Yaz24FAP89UgiMfpUq6XLWwqP
 Dos6R6xe9ec+Ry/ui+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX/WysDa9ANf6u
 6x+BDZhIyJLDh3sVR+ytg/hYAQ8XfPrlGjJF3nYkoSDBgP6U+mrR55Z3UT/kil2BcOzbyanM1tt
 zxJKKuhZTYrRSmpWfiRq7C1bC8ZRhiA=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6ab0ccd0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=G9kK3WARaQJXF0m7GhYA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: f_emsawQ5Eq514nmt8_jEFhjCMho1Jv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Replace incorrect occurrences of "ipa" with "ipq".

Compile-tested only.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..abc933570cf2 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -206,14 +206,14 @@ static struct clk_regmap *apss_ipq5424_clks[] = {
 	[L3_CORE_CLK] = &l3_core_clk.clkr,
 };
 
-static struct clk_alpha_pll *ipa5424_apss_plls[] = {
+static struct clk_alpha_pll *ipq5424_apss_plls[] = {
 	&ipq5424_l3_pll,
 	&ipq5424_apss_pll,
 };
 
-static const struct qcom_cc_driver_data ipa5424_apss_driver_data = {
-	.alpha_plls = ipa5424_apss_plls,
-	.num_alpha_plls = ARRAY_SIZE(ipa5424_apss_plls),
+static const struct qcom_cc_driver_data ipq5424_apss_driver_data = {
+	.alpha_plls = ipq5424_apss_plls,
+	.num_alpha_plls = ARRAY_SIZE(ipq5424_apss_plls),
 };
 
 #define IPQ_APPS_PLL_ID			(5424 * 3)	/* some unique value */
@@ -229,7 +229,7 @@ static const struct qcom_cc_desc apss_ipq5424_desc = {
 	.icc_hws = icc_ipq5424_cpu_l3,
 	.num_icc_hws = ARRAY_SIZE(icc_ipq5424_cpu_l3),
 	.icc_first_node_id = IPQ_APPS_PLL_ID,
-	.driver_data = &ipa5424_apss_driver_data,
+	.driver_data = &ipq5424_apss_driver_data,
 };
 
 static int apss_ipq5424_probe(struct platform_device *pdev)

-- 
2.34.1

