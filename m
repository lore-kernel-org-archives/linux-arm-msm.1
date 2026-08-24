Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E741A4E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572539; cv=none; b=N9hxpAHntTC1WcAx5jOaa2jdPLqtL0u3d+ZmDeGAh2XdUnKqfLuG+4IIeImYNAsI/t33sqToduzRK6n44frsoLd9qFb91DJ1uY1GrLQdKcq1Ndkrp5vX7mNbV6GObZqKRGziF7omgteBuaZTYBryJTqQz6IiPCMgt0SMOGABVwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572539; c=relaxed/simple;
	bh=iUAm59la2RPuw9YPE/Fxbi/Qk7PVnKlShGPZDiBCGGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lO7GwKWKeRoxa0avfsl8WcVnKAgulyTr2Fvzg3PhD4w+/FiSjHDtzOh/k3hwLczJzEzXqME7Hif+ga5b+l+2cHne55TtaDx386Y9Tk/u04BojnkQO0Ad2j/zif7bcT0my2GGCE61t7OPdNeJeoy2GQzMet49ewTWD89iP8sHD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaxcokuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9oCo3eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaxcokuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9oCo3eI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMR371800184
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=; b=BaxcokuPdnkXtJ6C
	4Ijqm48epBRNyx+VnrbbcdKGSGeRUDlGm30vL9f5K9rH6/TpxoNkhswYi2gHofSQ
	QVcn0KFNZIx1SnUXxA21vPrJioLq/oPhosTUURhPl5DEq/WK88C/dQiJRkuYe1tJ
	X0aPSLlnBB2Bgtz158AE0Ed7ABrv9OYKcotgmvk8Q3/YcO5xMXbQBtonmIKgVui0
	5YikBqqJp8bYm4V6UYLLMFwcGlS8m4qHD/SsArh3XkVpWR621Y2NIpxtqBTZFfqq
	YM5rbPVZwrBuA20r4GOLjMhyTSlvdhEN3GwavZoXenYWPNNpfx5g6UC4u0KqQvV0
	UhzYMg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78c1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so39419566d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572537; x=1788177337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=;
        b=S9oCo3eIuAv4i22mFyl8cYeVDdtIOIwx38QRhObFSJDn1Aqpm7gi+dULNZFwi64e3M
         /3NWBeQqlCz9VSrRdWHW4AJB8xd4IzHl2ZUpQj/4lAX543ZEUOHtkevlNvWi6Y+qQZgj
         ZT8oobfZz51bs+K6FbDh/mC4VVHaBcPZcwdOBM71WiDcaIWaPJ3lzKN74cQy0tPA+lY7
         VqFPTSafWp2YKj51FZkkprXTuzpSGzE6bgG1LA158LAS2oFav29PbzucqDperO6Ws4pS
         lh/Fy1FWzq+oY89gNE8aFdi8dlKjjbobv+IaDD37h23LEHUGPlreBD1vUhu8uCBEULMa
         OANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572537; x=1788177337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=;
        b=GROYpZvQ7hUQffzPliaaNB/qHEBiznD8WWEcpTxJOGzARevawodT3OQPPqpEUmCjk+
         dUbgvdiUUdIUKDg08sBI1KrzU02W2wloF2kkZa/G4qLcoKQFv9IF200tDWPzhsFCIDrq
         +e6YhN3+cas0S1kUxHPzLZ7V8eaZuuCR3z0KlQtR/U8zclhD+Q1PB45eqBVn34c9/tj3
         PvC6dYC+dM4LQoAbGYcCB8dOQuE0dzp5SADl282bUijD6KRn8R7r3eZSTOKT6tnUlEQd
         b/m2aFU25eAkQ9ZhZp4zZvjJ0kV3+Tg5a0S1WAOd8l3E+0Fzag1yA+aE+ffman1ukDEG
         DZYQ==
X-Gm-Message-State: AFuF++nLgj5baAbZNBpFKoPsbNUxdZ9XcMADSm5//EvD6oDLFLAj3oxW
	xiSz1Q28hXSfTg2tTqIkv0lkavCkYhRakRg9OAYHR0bP5Sr0m+LzkJfjfbm2AQjcdxcL6rkTg+q
	m3s8u0SycfNHH/tMtvRErT6BagJGHkHOrj4ynLCeyHKucqg4jxnrZmMLK+2zH2CRBjN9q
X-Gm-Gg: AR+sD13UQvl4lwD/8uQQhQHaeWNbKxcZ1nQ02bxHMTd2l4N0LqGvasZVlPOcE3KqjLg
	FXKu3vEQELtZxsQmUBezoZXwMTFR0kqxZCan6H/6DSYd0lrYgG+/6QKbLQ2hUz9GBlPELrZnOpe
	y7rVnG8blELZ9EUZvit6BZd9ufqDgF+buieE2y7VShIVEfDxm0qD29ZMc8EIN3N9UiSJgecNM4t
	XhIJzfaTemlzM4akc3KYc4/Uxuo2tZiBB86zhEIHr/jiBMCGy4G3z+W9DZQInP0ueNEzFLd8PuZ
	APLjcJtCupPVsxzypxNTqpk0Foxv0Q54YxGkMm2OrFR4ytV0RKVaBKqhhDi4vpWuK2aFOgdV/3a
	lzMBTNJBV
X-Received: by 2002:a05:622a:2513:b0:52e:2d19:b242 with SMTP id d75a77b69052e-52e2d19b3c6mr4868581cf.38.1787572536369;
        Mon, 24 Aug 2026 04:55:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2513:b0:52e:2d19:b242 with SMTP id d75a77b69052e-52e2d19b3c6mr4864911cf.38.1787572533926;
        Mon, 24 Aug 2026 04:55:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:04 +0300
Subject: [PATCH v3 17/47] clk: qcom: gcc-sc7180: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-17-f1205a92682b@oss.qualcomm.com>
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
 bh=iUAm59la2RPuw9YPE/Fxbi/Qk7PVnKlShGPZDiBCGGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDlI4CqLPHVwAfAF9jor/4ujSyoQKbm4VPpt
 y9rSonlmoGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5QAKCRAbX0TJAJUV
 Vn+hD/0X7c3qvcWakWpjzHorXbHwPQBpORaodbX6DZaKQsrY6LoCDkO7vHzCitcAcvJ29vsTcTW
 D5PycQ3SFAc7N1oW/z6eLr3eGYxPYEEAZ8jNzTPhrGqyEpjuscr4ngz1GI3FUy3gN+6aQEAdvhL
 fHZrhb45iyyWvbdzFf4y8k1umyXb0MAyjKiWw18hY6xCs9u9v4D9wTovtNXRcooVH6eYTqrBKAv
 So3JY3ME/ajx3AVNtBjS3ERi/jvOeZsvUCZJ9E9iqspxiD2oDVs9cXhHAi92BPpHqT4c7ycSDWf
 L0s0QcKNvhyxvCRw0cfu5Nhf0xAjAxwRIUr/RqsF3RX17EJdA+XFXi0SGVYdIhhZ7QM1s1yJySV
 Y+CmFsNW4U0rQLInhccXGyPus/vqdVn4lmEj/QhExcUndCdfET6KVTRs2MtCTH2SeFvgCzXyQO8
 ldWouk5r7I57vX6pkchlNUvKeBy2wVRoquhDkefOTipeLfsoAjGU3Ds1Nm2gbNBUuw5vaT3dj3W
 4mPwppR59+Yfy6LSOnuaw4ped73YGLyTEhubxs2NkZLBaF7Nm1OSKpNWzGsw/KT7x6b+xRce68m
 ZYJOCeG4pKNHJf/2wd21Q40BiYzwlOUZF8z3XpokJf1/4PqumSt9bJCMlqGbEKdtGi1rxVj/pL9
 ZKe5cCEwYNPKkOg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c3139 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwqLitbUEN0go
 sHURGQJmDC0P8TGQpLl2inrfVhfxsJ4ZWtwzkNytcs7c+ConiLxc/pLncmg9tPVrEKLcOphZEpV
 HeMFyMe97BWo824i40oJEAFgmeiD2Js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxLFiAQdk4Tj9
 xT3lCrhCxG0t5PE5qYS1AZA65O3ybgVChobmhfbDCtjt+vjywtLG8fCBuMhe3ywpBMAURB06fn3
 bMSY/Q49sQOn9VPkPZcovPSQJNkBSLB1pGldjsJnGLoI171sIEDzXNmlRaK1t40P5en+ngq815v
 Y3Q2X3trvGouax1VsW+q+ySHToTPnr+jJsFxFryVSOf4zMLKd0pcqKutu/N/D+QLGJDCQcJGy0R
 NneQLrKbF2s4p4hmDnITbhuF0IrFpgEZlerrkbdILk9Eel9MKw3YKhIgc5oodpCoNBLVLOjLgl5
 9+6YdB5FkyK1zSAGsDICtTI+ASusgzhLwkb3ZLWAP1FscP7M87mp37LNOG8TKR2VIR9wc5UAs2G
 Qrs+V6D5rmYWhBTsPDE/2lxfkThJ6KcBURBV1GlNzhOOqv/GzTihKTcjIm80lU9t/9bFMBoYqOF
 AbQtzYyMIrlPn5O6w7w==
X-Proofpoint-ORIG-GUID: csX5U9bSDw30e1JKrfC2xGkNX3sQ4Lvu
X-Proofpoint-GUID: csX5U9bSDw30e1JKrfC2xGkNX3sQ4Lvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4a49ad7a9e5b..f3a245470a4d 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2418,6 +2418,7 @@ static const struct qcom_cc_desc gcc_sc7180_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7180_resets),
 	.gdscs = gcc_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7180_match_table[] = {

-- 
2.54.0

