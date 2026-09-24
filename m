Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672847F3C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251665; cv=none; b=oiYpjOb8OAW2dbUch6dU5TJueUl9l4ha6RXFXKM7iVVrNVsqH1275yfXt1bPnnORx8kJuCwfsw6kUNU6Frkon4kQ5KnE+e0jqhViOcy39W1LfWgh1tpWKMESbHtUwMXQ9MkOIf7wxN+Lpv1K/gyYveOQF/BspsR6yKsGTzPoxJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251665; c=relaxed/simple;
	bh=+PKjOzW1qJOcRFt9jkyNFKMBUYcRkBbKtj0rZteEkXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRb1mlmRK5DRtFVX9NT28+IR5xvDKs+ILCZud7NffbXFr9W30UcbbEY+ETgDGi1Sh0CqYAI+uRS2netHWEyxdU0tDBItoc97DA+7QkEcbcV7vFRYD7aVzejpJd0jjs/J8qGcDMmCEORD3gEJlbcT7+GrMtjrXa7qkd5D8JZxakU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AglOg0UL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gnyfnhps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AglOg0UL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gnyfnhps"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4iaW3282904
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7NS4hgdEuI2Kn03sVLhMX8yjBjmnY6qzK/Yb9FsY/v8=; b=AglOg0ULxNznG+pD
	hoCMpYoPcN8KdU5CbM/c3/SPlKoXqPnYpcqj3s8T8ZOIbP3Uvw0/plyl+hjhbTBr
	xmcbF6BPE00vsaSjYB3x1DeagA537xvwtGx2DcxPvPVTtWfXUu9G5ziiy+HZejBq
	zuoXDb5OYpoCEvWrYipIodX9ZzHN228zvDQmNunHDwEzb9fykEYefNWXhXsnI4UM
	b/mIwTHunFyOUNXqkpLLZ0Mmi4NNuHqXbeuepYEqErl4h8FIG/3+8wC0khjIUYLH
	dCL+3HDPHH0r9OBaCFUb0o0fj9wXZ/JJj9T9A/UIRoxR4cnNYVarJSwQZte/I62+
	aYbLOg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fb21aaad9so751157137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251660; x=1790856460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NS4hgdEuI2Kn03sVLhMX8yjBjmnY6qzK/Yb9FsY/v8=;
        b=GnyfnhpsRz+EwORz29R/C/Gf6nl5BE46xQuLp0us2J43gqmQ6qqravyG/7Nz69KEvm
         ZoS4OJhEJQ6CfQjt3jcIazR93Ovh3muoaYCNBuWRGKRJUG9TPVtVhDM6QpucWajf56Of
         XX4b0rUbxIo9B0JxmTUUemaa/FCcH0ULksKnGpw1pEoH4a2wzyv5k3P8Gav92Z+m3jcb
         xFJnis1QsiDAgEV1SUq4SDXQ/llRd/EYcjw9mqOGrN25d7+xe5KcPZh1TdB4mVYWiZgR
         noJoGQJiVaFcjWV0u9bV2LZpstWP0mttrWRCThF2UV6FaOrLe/epjhTjmSJM8ACkwnTJ
         /k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251660; x=1790856460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NS4hgdEuI2Kn03sVLhMX8yjBjmnY6qzK/Yb9FsY/v8=;
        b=uVKbwgErz5g/mjxmi5KNV0VZmh9QOCWO+HSdX15qsadFdb/gsvV7Fv7v8+TqGVpGVX
         AKLXgYekuFxOxkLQPMID4mpotXrEvNEp0bwc7NlXen+NbB7Zk6maIxrVeyiiXARHCEeR
         ocEaZrBQPZTIncycOkqU10c42OnOAj+M0smZPVOOjbq3eNRE0Bj5X+X6TYlMhXkQ6qF9
         Lgq+VK4Xr47b44I4c9wFtk3B73R4Fh3vuKvRS/8frm79btm4wS61L1+03uUd61mBODMl
         scnuYxgntazYKMlxwAN/ivX3WTFjaSEH4WLGWhNCrk3Zx6EpyJNEJlO63m6ds0o25zN4
         oh1A==
X-Gm-Message-State: AFuF++l8w9tHTTFLaw6xj46lnCJ9QDC1XxOrGJIv6KYjADbQRGGKo/uc
	D0rb+guENkEfznCHVf7l1DNHE44m9PARnkmUV8pDZnkxfjBdeL5byT25tJQxtmZZGVLJpUTHfMH
	5Q5AFqlPC+L9gX4EUOU25Wwl8fCLLKI71qKyAhqcloSsRtbZnGEnY+Y7Vzh2bMiu0f8+F
X-Gm-Gg: AYBFou2MDGMYl49blqW87Qi6SF8zeIkh9vZ7S5m7kmLkWJjNYpbSlkRvHWhsKMbwqQ5
	apDLbJ+q9SuMFdLRae9XheoOKQ9ThuawofYXZpaAMhhAlpc4j4i/ZDjRyTFQkmHfwRIuIPXhTWu
	yOg69P2qrzxBz2Zr+WOuaVp5LGbEHDF8fyeYPt8DWnNtdWSwl+Mz18dBoE9N0ZxEYY1SfvLBcwB
	gOBEdXHw0djKKJ3l/rdESh6vnD4TaqcQeqP/T2osmHJrsHzTOBX4o4sEfeemY40/H0L1F+KHcRJ
	YIXqJkOq9c3i4dRYqR+EKQIofOVJaVw/2O8n6kd6pNvxrS5Am1eX9XvNUgQNsaSh5Z/YpVimF+X
	mnPDiiC/c
X-Received: by 2002:a67:eeca:0:b0:7ab:f5c8:4e11 with SMTP id ada2fe7eead31-7af1f40f506mr732841137.35.1790251659473;
        Thu, 24 Sep 2026 05:07:39 -0700 (PDT)
X-Received: by 2002:a67:eeca:0:b0:7ab:f5c8:4e11 with SMTP id ada2fe7eead31-7af1f40f506mr732837137.35.1790251658953;
        Thu, 24 Sep 2026 05:07:38 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:21 +0300
Subject: [PATCH v2 09/48] clk: qcom: dispcc-sm7150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-9-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+PKjOzW1qJOcRFt9jkyNFKMBUYcRkBbKtj0rZteEkXs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJKt6hYAF4jDceApu1mi9QJGM5gAV8SaRoLJ
 WuUJRELyOqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSgAKCRAbX0TJAJUV
 VpESEACiLFBQM6O5ftoSHB872E6yzFQI8+yupOXgPvj7AlIVv65MOalLK3VO/CnahIolCUtsCOi
 ytJsOH2taS+uff1QZHNXtP0FPsoRO06Z+JbeDvmlR7f9u0zbM2GEi/DkoKY6EKqmh5EeQwKrRqO
 i390cJbbqPau2h1RYTEbfl/UD+mJILn6H6duaTATA/FE3utEA6rG0H2sWPO/szGTWkUyZnryEgg
 SgcvyJOQHpEzStrxn0HgEE94Z2bNAdrENKt8ajoesFKtzlc9Hr68+g0dNkPqtlW6phi5b2kch5R
 dxaQBdqpbbJhuyDues8+Y4Zdg6cyJEGfls5jgNJ9DeCNblyWu9sDI1dkiuImAcGV0JZqY/lIavc
 XkR5jq1D5rOPhdmrK6mUTlJLI4At5hlSWvzC59mwMh5jmhhRxEFO5YrHTsFsixt1K+an6Js8EpM
 aKvFEnMklncbZ/Ytt0RTLcvTAjpDWWkSI7grxhewBRGPh374WJBRO5jXQW0oQ7RsyOUnDkxsSw8
 u4TWudD+pIwjy/w27zbn3aHGS636cNfmPjfDR/Oq9rFPPvUKpMwuCIdTFAC4nUaFC46/mpialRu
 ohfDga3KK5XN/HOAoPtyV13XPf9VbsEcwKKlfTuLoz99MCueUhkohGyTTXEteXq6K+V523Rm0wU
 +RyCKKUuvnzSdpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4DjdePiv8Vv8
 2VXQ0siDqjKr5ljFhZnJ+ZV3A8LlDgS/NwyebGnS5qCXJDjdKCVmeEh2Y49lebfjoRZa7gLhkhS
 RqzsK0mqz8oY5u9fW+71ustrKtW+EeU=
X-Proofpoint-ORIG-GUID: vwRzV70EEdHVCSjaP06vYqgqXYl6OsT4
X-Proofpoint-GUID: vwRzV70EEdHVCSjaP06vYqgqXYl6OsT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5g6NaJSZ67/G
 jj3HzsGfsZ+hsPwIqshSrcF7by7AcuTJ8oYg0QUM3Ni4U3CrLyJSg4dStG83Wc6bHAOEmLtKPZh
 a1fDA5USPYzgVaZYurAngQVruTpGgOmecXdaNjXewsusYruHI35caJrgfejDyUGzwcSBzM/HK9u
 gwiVl5SI4puSL9/Emjoi5d2k8e7lpuz4pWqvVOy0Op1cU7DdkrxKcarAly6eza09J6gNDLhP9hz
 ODwEQMufhPFU6tMqGQNffLPDpthB/pF6Yf1xNTVW6jA82h8PXFyr8VzrSdJu1D8NEdzxiTe+v7T
 zwRZnOTnt502JXReX+BU/dWnJIn9kDvyotoCRVpXKHQ4mthEC1FanpUP/dJf/caNJwae+c7mwti
 dvg2X8gW0rN87bPzckpPcuNWsZ6NQ41E+w35FlrKoKFaLBoDFIWeaxSOvEkrWs/udsDN08otpUu
 GzkqRWq8zDNeZLCEQFw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab5128c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6fVa3aOakVPtjiFSkAIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index b9df6153e50f..da7610856e56 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -963,7 +963,17 @@ static const struct regmap_config dispcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 dispcc_sm7150_critical_cbcrs[] = {
+	0x605c, /* DISPCC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data dispcc_sm7150_driver_data = {
+	.clk_cbcrs = dispcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(dispcc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc dispcc_sm7150_desc = {
+	.driver_data = &dispcc_sm7150_driver_data,
 	.config = &dispcc_sm7150_regmap_config,
 	.clks = dispcc_sm7150_clocks,
 	.num_clks = ARRAY_SIZE(dispcc_sm7150_clocks),
@@ -991,9 +1001,6 @@ static int dispcc_sm7150_probe(struct platform_device *pdev)
 	/* Enable clock gating for DSI and MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &dispcc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

