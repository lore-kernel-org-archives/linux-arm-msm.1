Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8674749F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848751; cv=none; b=kvvyjYMQ0CK6Y5xy71wI0AhW+3iMP1KpzhoNCJN7q0+FUmPcuk2Ra4clGR/kv38nSPzgiMzZskPd3mPiaQBG5zpz924kcY0wzJvZ1MmGdpEoRD2TvBQr02uyylUktYZXqMxIoowkK0idUuS2XIA1A35hpqlJlaUZfyJEfip+sNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848751; c=relaxed/simple;
	bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKHASFcZLOKbTEEyyWw3COVSh5egklLZDP+DT1116wCAWl44S+hghrU+liflLRktU9u9fB4Dxn6XWvu/8ATGePi30KlzBk4Qlz2knjnCnyrT2der3jS9XfCoMF/WL+MZTNF3+iU7VsUkss7SSLyZGCDevdbX16tcjWHUCHttZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o83TyDGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQkGRman; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o83TyDGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQkGRman"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcRRT3360395
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=o83TyDGb6xN8gMsb
	k1u4uhRg6AVRaGyBZly3yJylYQopQlfd8SX+Wo9UEXt+L+GJZ9qzDIbeNzbsVomG
	UqPe3SWefrPwtG/p0etjLFCYFeh1vdT0IaRnjRwe1fkPJUkd3S5G/zEYlXySjspu
	UNBc6r3NGpu1lQOjcFG7Xws2VEaqbuEvWXJAs+dGHKuAlGiGoMseyFRUer8gqEq6
	NcQ7yGhg9gK99UrEc7qwrwJKnXXrRjm3JeNL/Vxieg/aKPau7p6xy4pJ2oerTcAy
	5dg9PdsAxNgY6/v+xMzZmaZ6DI+HP97NfRJ0nf6gUsRn1Op4hwxV4BLfiFQnSMXj
	otmmow==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t3dqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:39:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4eb9e05a8so153847a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848745; x=1788453545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=GQkGRmankbkBW2HwadWNp0FD436ZWUQ6cr60A/dWNPTE05L4UGg5ndE3NThAfIp2cO
         LopTCCiVx0+UgkEifu/0r5lPrcJZUOkaATIsmNULV3T5rIiZ1XsPMISjdaNNGXn2eiAN
         OCAvhdH7hrCczzpwFcrpkFmeomXCZR3iKD6XcUpARhLkh4+BHKilGKWDbiI4URINkbk/
         +k576lv7BlkjCJ9FzFpzSAuc+q2UYcZ/qVOfgqPh5yCE8fg4NsuNYhE0clOt2ZURTqEO
         We8lWiiZfckdVLFzqAT/4YHpHYouCZDKNYnYMNVkDiyq+WLpLPZhncaUJyLyF4Y9A5eU
         twrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848745; x=1788453545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=nRViPCxoDPGOJSAEcopTtZNCBE2e0wQxUZl5CV30KthjmIaLme0hMcjerzxxpFTOdi
         iE6dKQ7mlkZBpWH/6DUAqbDRaW6mF6nEkOP59Gfe8HJlcW2huD0/r3jLvHM2+molCwxo
         DLcCw2iR5lhzqiUmVW7gYgViAWBIZhrS60jQe+62nV4ne+E6uQOtrpGPvfSlSgazZ8eP
         DzsC05XJYVEyajpxexqopf+k0/Cx7kjFMBHLUl7CBTJvPVHfhuhFK8GhMdNr+3AquIH0
         zX8Mvg4PaPBp65PBS3MdrcuT7ZhCLjn+71+TLHEy5rcPz7xjcSqxvERvdLo+unBoNvuN
         PgFQ==
X-Gm-Message-State: AFuF++kgv4ewDp2wKHpp5Wf8VYr31i6EI77n0WEVh9Oemw+h+fvJ7s1s
	+usS8lyRSvNMjO1OD6Uz0EBpldMv4wL0uyuDQil//hYSvg4vKPbx2FqX3s7aUu7GqRuEXPjitCk
	Tq5ql+ISncK7vjGPlx+IR4Ita06tAvBdWX/98T9dRRr+IAKsY/vlU8xDYRW8YZPsTaaBd
X-Gm-Gg: AR+sD12DnaTObhl09nqk5agUaHdAqFeE5bGIkhnHdPSFrnIUDXb6sGfvAUv4E++wd6A
	2xAaYyNQN17rLITEIdmNZRleTQx67fTKzX4E106Z0SB77bvtmvT7EmPzU04iu5eglToM6WimJov
	ubJSYT7dEOoCN9LwDgKzizDL4lvlBTdqxOMHqAV6C/UGLKafX0S2QzjyRcM9I6HHIxc/0wAQlVk
	g0gcZz4rlcxQWKeeav45mtx5rMKoUrL5lJU7tXpXR0Sdl34mxmHA/EUhkV+TRtVtXL8oKWLdjSd
	cozW58HGty5fqIzwTrerZo/ttxECtV/kDK6SfPz51Ap0tz9tqCexfx9GW5t2/2n8U064EwUzMpQ
	/j/u66Te6h+/XQcbM9Ap8ZUoTEL5di36kjYkUUUbbY5UWBE2VxghoMXylTan6VecU4z+xGKn223
	3Xwc2G6YiCviYL2Tm+TpVwQ74=
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126298eaf.28.1787848744960;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126243eaf.28.1787848744519;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:06 +0530
Subject: [PATCH v4 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-5-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=O3qlxz7x08CxfPx7NLFQOLsmocO6gj9/OPvgz5ckr+LYjwS8kVRwv1nhMSuHzk1SITQ2RAlQZ
 oh0cx0wx1jqDxuqlif9h+RqOAy1CpyG+tAYF0Bac5NKmhO9lTdGgQOA
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a906829 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: M7fImABgZD22zDwN9PIMuygtsRXgnu3F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX+nXdvkYl0gct
 l+ZP3o52g3PWAO77QPz0aSMdmXXEzykuWdq01OBxOBtDaoJJc7oSNYLG4yu+z0GhLESKhVH/MCx
 aapIeQJ3BeVmhmarCgR4lEJrQUrwaXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX0pfUgJTL0Zzy
 izHNiYbjySaKHqkrJnDYqKf+PpYwY/7lKf90T2DRQIcVZnuDBf37ScunHw2k9xFA7ZG/wcmU0FW
 YM6LCT1PE9N9VHy7cMK53jLIN6oMx0CZtzkyvzAASTH5a89S/ntBFmau7GKYrnhB5gcLiyH3+S2
 n+bptCTdvt3Ozq8mI0yfCktVlmBIHh9cioEGOk2Z+K8Ki2MBVp6hPYr+mURoxp33TxOY36NHCJf
 X2rlwqWMzpTkxUcYsiQgVHkAsZr3ashztWFHjjpRE/njFk0rKeZVn7k6BdBvnpmG+k/WS4+0wui
 1RTE7mJL4CTMVgF6e5kP82ozGX4FhCDP6gWxUMWY2p1dBQKWaU8tI7FewUzOQrH+7+LZgB991P4
 oOSL80kch50s+jD6kyTfSTXXtWO179l9suaDhER23CQ9ctATASnVpimkX8lBVRzgrldrCk+me6o
 ghgKujtqdwvXOqC826g==
X-Proofpoint-GUID: M7fImABgZD22zDwN9PIMuygtsRXgnu3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

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

