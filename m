Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B72414A05
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572541; cv=none; b=BwtimoiG5q8J5F+RnQieuoa9LDsOJiEeX8CWu64/S3Q0SEg/2miCZsejIHh+D0eVYZLzXfhZlktzOi18UpbTjUC12RbwlpP7KPS0AeFB+iykLiab/DSaXzXCw1juXHRtoQYLj8/Lc7L3KydG6xITwwpYGw6jtqfbzFS/HAw4BsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572541; c=relaxed/simple;
	bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+iMGnNclB3lPSXX3ulp88hTjZVIiAQ8TJdXnl927z15mv0//XnInZjKEe7UPUZ0f9NHEEpGOv1iA6u9Z/81taLa1xosiGu+OYXWa1YdSUmSSVICph8iveHEXO70HsAMIfO4GJCzK5aSEXzaz1B0L22U3aRsKo7p02JU6hnZkRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGuxhK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjNtsoCj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGuxhK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjNtsoCj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMiVo1673456
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=; b=FGuxhK48hIJ+qT5y
	YGSi38eWO8nD9GPSkPx9klXybvE9sdMw39nWm1/Yyf839zABAjPjQtoUYlT9TU82
	L2FW2+URPQvkc29jYxHep3K2J1mlOiF6+s/+Ih02kBljEyUhi5Xy9vJG7wHp2IXS
	3w0m1R5gtbuxBGA1FPZg0tnfAZactk5TdR3PiICVXYaYI6BNFKXGtmW2b64GTF32
	xmWuaw/0GvliS4vMrxJ0D7ezyAU4VzZ3EB8q+k7SMfQ6h0C+Tf9swdWFfF+VA6R0
	44IB4lLdhLNODjgTN8Eq5t2rCHoOM3TPR2C1jT5/UHN5ZeiJ6N3SLVxu+MVHBTCi
	eTg4Pg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf119j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so426137585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572538; x=1788177338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=VjNtsoCjDfbeUWanhKv244rT5z1KivaprZmZt4E0A2wnJqxrLQr0JpqzaF0+OrYra7
         6pGi+iTYfbxN7Nsc/e5jSFfaSxSisqVcI/HZ4UkwtPj9nVqzzPzOJLeJk8StiPmQ5LNX
         cmVhbpEvlUfgbjkCol5+NvIeuS9/+lZAOstwIydkisODh8VQu9puD2Z7TsCV9scGBuRU
         EdH4FEE25ExHAlqY969pQ/w9bZYx/pas5RvaImhDM/+92+U1ubSwoFoTE+MHV4GxE61B
         Nh68hp5aJqGTvyyZI7z5wGG6gwobps71/28uwWWSvcrfvVWH83WuJ4QdbVOqbWmDJ+R1
         F0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572538; x=1788177338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=rCyUURB7Rhz7V/D5wSICa4hmF7yKbBXUv/E9iDZkWEZOIYHRBJqbwrcbXeCDytMHAc
         i3D9hqIyeO5IhvIQtgcRm65/uHxIWKu6BYM211Z7PEZVXFmqudO4SoSlnbC39Qn5dGZa
         GjEwA7Es3ujg+w6rYsjGCMxWl7WG5SIzAeMNN47OAtCcIKQdtz+fWX7HefT8Fnpt3z/U
         FUXUd+xb/wmSd6U12S9AiTPNnt9/IrP9DzbrkWz8IVFUpW5cif3cbOapcOQAp9e44a/7
         Kp60W98B7qKxKU9BViTm6itPz8874ikGqUA2B+dLcIe55VKROpugBYr7TYgjwF4xg92v
         qHFA==
X-Gm-Message-State: AFuF++mMLysTPLSop4V4Ej3TNzVw3bb7X2FlzCe+o3FlbifmbeoONJ4o
	lrwEgK0cPOxGA6tNE8yt1GeORhRkkHljqGhEAXNpQqVtYj62h01Ui+d2n5NE6W0lw5WBeVw1b38
	Ru1IrRzUrlOyyvok+mrRee5W/ijum0U5ofoQ2qb41LpvbhzLnGVgpvoDFUeGj/tEDYEiN
X-Gm-Gg: AR+sD11KmANdRjb5EsO5WC/cO0oK6Hp692fKXAKajHXJsRsPaayUxZMDlCJFx95dPwx
	C1HcGSMZ9RSGHMuwLHNkkNhiNRPbaWoEjmWLoaj84tZgbyzZF1RgPrj8KOEoRPCyV/mxOI32uhz
	M/OOdGV9GhjiWQT2mqi/vsPUi6kuhJtWM8X/miZkBMPBR/6n+l5tkwBn7OHiMwJLaqWrwodO1E0
	bEi1kmSq+OYZTZE88IwZsM1c0gAdQEU/QE98aPytan2qRJrNPbeEA169Bq2W5VZynn5LNUj7YWZ
	DbTd0bY+YFn63sJhL6gQZuB9eX1kDJOLiougixBkHbCEMF73Gt2OjG0gwb7JBv5/CwKGA1dd23/
	9Alk8Fapf
X-Received: by 2002:a05:6214:501a:b0:8dd:fde8:68c7 with SMTP id 6a1803df08f44-90c80ff04camr255164736d6.30.1787572537425;
        Mon, 24 Aug 2026 04:55:37 -0700 (PDT)
X-Received: by 2002:a05:6214:501a:b0:8dd:fde8:68c7 with SMTP id 6a1803df08f44-90c80ff04camr255163736d6.30.1787572536822;
        Mon, 24 Aug 2026 04:55:36 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:05 +0300
Subject: [PATCH v3 18/47] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-18-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDmY2hh7qjGzxIsb8lmqUt6ZKS8DG/HWHebm
 ZJOV9ei0giJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5gAKCRAbX0TJAJUV
 Vpq7D/9vr+QUS7UKyHxlTeB7p6Rf2pa8+fvbgYGPAbV2itoiKyLNT+v7478h8/gNV++M/GT9T8J
 6SmsVnQUex23GdRwS+HWXraS0P13O+ygtLopGnJPdJrgolfIkCi8lqHhRovxXypzm8rx6eMv2MQ
 +9MrcvrJ6AGqOHcO1BhSAHLpDq8JaWcK0GLlikY/miwkkvylbbq9fx03WprfeNaZHtW3MNTBXqJ
 yuQY2F0XTxPWRcfyrra3fW++firxN/EbcI/06SffrVWtIa3t7jQ/C1O/vrUJhNSNnnxeyOeGQqe
 0lE6t9HZvEWkgYQaQnUVAG8ofs0UjPOqpyLLiNy011ITgkLd1jLWTaY/4oYyd5Dxg5oYsAEl12u
 gLULVvRa0s5LbXCbJy2ayIzyykiXw/6BqmtZMFJLMjEveSpPDBi9QDvfQsk0N9G8oOuHa7zmctA
 /uaUAgXDyMNPR9LPGXBdznxeQ2ItWvY5ypGwToMWQucowpq3/v72MvMDL05UtzH2iHec09Uw2XI
 CPBExeGKaYcKE9lrIFkUdh4VV/aqts1RZ6cBNQ3zW38LsgKNA3wuyhFhDU/pnDqCDFqdTAnz1Eh
 tA+sT5nuDYXNh6fnhVo6NKDkh2+cBDTQGbG9ATM9STx/uYlRLcGYvEqHUb8YjjUORfB4rG4e+ka
 YJg/CKABJujYeuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/TanJoJGP6MG
 /7v8r3zBwOuiaXn2boyeGTYcVeTCAwAMkLO9yzSkbho2XfJ0oamKQWRcMNCLogSfaeEMbXOMdxZ
 Kf1QTe5nanTxqt3ViLCTTkTnUSsZ0b0=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c313a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8PvlzMxSm4feIZWpt0okemPW2pHgHRFh
X-Proofpoint-GUID: 8PvlzMxSm4feIZWpt0okemPW2pHgHRFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2hwdM7I7wNM5
 i255EeGzhmdL47aqCWUmiXPOvELhl0MDyP9fkYgJuuyLI9kJ9is4r4IkC29ClwnLJML91XHBYiQ
 zqpDRau7F9gQasG/ucDlQCrm2RsfEI7N75a3zvWJ7fNmdnBNsB+FH6hNpfV8aKFp5RGflkE3tmS
 p8g3oXQhVRRtYnEH9LfHtBLXmCdDEScw7+o9V7+fJE/TDASI4GnQ0QTYE55egupiXHFtASQowrm
 KUqymUtvR6fj+OhTFYxp0l6AVB9Z/IDEzXSmargD7k5qUXg5mPiF/V3Phy3Ouj9+NJKu7ssfSA5
 fHZQYolAhzfGtTuRbsgbanbtpSJZ9ZZl+YxI+f8l3dFobAVa+3UCH1yeebDjkB07un5M336lBrb
 3wQqsVQdFEhcz+KifmEkCsN/0BjYOe68g+QbS8XgQlaBpMl03/aeQ6MRtyExWR54lxk5pObQ+6V
 rvzF/B4M3vNUbQu+dhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..bb8f6efb88b1 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

