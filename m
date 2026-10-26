Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014220;
	b=jbO+Ojh+JHpjT6P50bewPgZC/QjyZIfbIWlVmqUbVLhSMDjhU85QUr/GPGRjr+cZ3Htv
	 vdtFPqrveIMyXNog74GQZ3OtyVRZkIzoHiJWs0p2yZpEXc7PCV1ZjO4TSssZwnaiOSE67
	 q0F4YXUtCWR2HPo+vlyhvpgYIIaOsVkDfqqYAv+ktV/S6JMD3kfGfuSfMtYFCUU2GMkqN
	 InkhGFBX+ldVXIkrSehNQu6TNcQoGv3TABblvCD6EM72Kt3iGrK40MZEVPahlyMWxlH2q
	 lEBH2UFCj4+SPwPNqIh/AWLJMBa+n8j7PW2cOgn332C1IIdBIK+EQ6s3l3l2Ccj5CxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
	b=QipEjdz3XPpqBtr9jDOW+bCXpSZGhuTCsQHzd2/aPRjbY5B8UQQ7NxnbcE+8GqHgm+3y
	 37gTzhRDDPAJNDtBjHdIwpUXWICAkk67qCW3/xfY+y2nn146HlamBAR6hy3oD4hxrqzBF
	 Ap2SOohzpirqim6+HmIUdK9unaffBwA7/if6CXybN77YbOd/lq2erHg5iUyhbxuP/3a86
	 MYrdZi7dEELAE/QneJzRBUBp2NhQwshmag/38C6pZt4MOHZXdes+lBgk7mlQ/fBGlj+9l
	 p2yxIl74P6r8SeCagPtOIRlIJ98NyWB1oK1HtZPJ4BHcLY0b8Dc2Oji9Zjqjpi4/V0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DegWBcjt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABC606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26ABC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DegWBcjt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYrr1547961
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=; b=S4qG6BFZIZ7R887c
	q08zSadn5YqdRl465l1JEkvMZtIQ4Iur6HbCjN/4lXxcggrGkZvAHSKe+mVZpeix
	/fM7kh8y/aw0dVx2b/TjjPbZZmJNg/3vK4Qw/hIk/IccKY325p2fQFeH/wE7mL/j
	Q31qOcW7rqFOO90kZLb/+DruiVRO5JjblKC4q+ZMhF4lyDh0c69Mj5mLEmXmMtsL
	1eAoORa4Z/eZgIEBK4agkqqlcUqFfpgaviNBcCjXR1HfuzaSFJe6bk3zNIF6m2l1
	XJblOSKdSc/w0jlfsQGgyaP/FL79/bTpUAOKMvYa19KdpXA/W3nNhqzYWWVltzZn
	gMZZlg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst7ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso3171987a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014219; x=1793619019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=DegWBcjtZ8j6fkJwwCLAtxSOj4T7e8osLJz5cVn4inUgG5b9Bfq0EFoTq7TIqrhtmA
         gGWN2reQ+NDWqIuSR+eyN0m3btVXYYJa22RazVEOSj/qSq4ciWxvzE8KfyinGkotrmdE
         IQjgpzYb0hGwrWOiqq9XGNeuaPOQlaX43VW2yO8/wk02blQf/AB8KZ9/3CKCamwFo6+2
         od1/KXIfITib7jGXrFeF4K/5Rd2sMOyneCd7O5swB4BOpXmwEulNf6xfOLwn+I53C1jI
         no/yqREZwLBnV8A2EeXgDuU9Nde7UtBu2oIKVQXT5cRWZt8HI2tqDPe9Vf9OPE1j4Z8e
         2WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014219; x=1793619019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=cpz535KLXAPZyV+vR+Sp870GzaSl6IJoC42Z/LCg4Q2IsSgYcfP49HMfkHPGQtzLV5
         Wo6NxDZxDrx8t3H8NGZw7xs3RtRvHy9yCbIC6a58merYNniKkvji4SJ1P479nEhRkQe6
         gR5M9vQBDOBfDGyNv+ngCyzRgXi8xkdQGILj53wEcaC5dWb46rrG5D/+k4NmdBvzaWYJ
         prA1165urQAC//mP/CPGG3VNFAiDVvM9TD9EYEqopbsqP/dRIN5JloLr0tN3wS8pbl2T
         nDM2xoE8/ZncVfcwciBllDZvyk7+AGbTx0Xqn7VfRrwDz+3nr/SdRnf3xoWDT9dw5FjO
         8m2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSJbk3L/fZlSkWFkOh8SaaF3jCR+lojFLj835qxK1F/8DTPqvv7z1VYAcT7cCkNOEfG00qg3kTW2pBb/Hn@vger.kernel.org
X-Gm-Message-State: AFq9FYLC1UfxWa7nO4CbjQtTUFanru9V1NnsnkK3NjZeyvXvfTZBwmOP
	GbMOhKzuDJWOT6XuWnYSiL/YW7USwVeaQIWXsq8JgACG1s67rmcpJ0fvEJxf+Cjv10awmfcp587
	3ZH7pyrMURmPWL/fmR5jjkFnAi40EvsmAro1HLdCgtU97njD7JAk+pGMVujyTwU2vAeu4
X-Gm-Gg: AYBFou3aWGuxQJNxqcoQPhwy4hzF6mT0yScG6Qw2usbIf4Qw4S07QY5ZX3ROTZZDEse
	QHgVoWDh6JRB2noLuGqGCotMCXa25XR/vKSP5FIhG3dY+MCY3Z1a5RffmjhAjmGzGeGosv1xNBs
	qen6g9XAJScyocRbrVOR1gs9O081XmnAqr3Jn6E+j1QiXTVhOIbWZzoEukJ4luTQQG5XYAfumpK
	I66lfZ0xSiPOpzubmYKs6W8HUmPrWKTTNs5dCg8eQAXWLtcyhoISh18Q3T9698/EqqPO3nLVC9o
	8ydaEeeQyV6HyblAmOwejHotKXLY4qQOhKB2LC+l7nBxPLHZUwU1kssj8UsbeOo6HSNBWDuulKo
	miCcn6B4JJnK03wsf3eIlowM=
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308442a91.9.1793014218330;
        Mon, 26 Oct 2026 04:30:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308404a91.9.1793014217632;
        Mon, 26 Oct 2026 04:30:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:30 +0530
Subject: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXw/fNEy/1wvAu
 HaHaJ2REh2qP9F9QfJV6/mkwsWRTW8EFJdLY/Ks8gDyuasE3JAQ0HJ4gCmNTPcjckYP5EhuP/Le
 QBoww9krW0gTgyhqcty4avI+dH2nNLg=
X-Proofpoint-GUID: 4wWNYDQjQ1OSnF7iuoD52ec5rMEX6NVK
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf39cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=l3K8MKQ1fDOuS62S88UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 4wWNYDQjQ1OSnF7iuoD52ec5rMEX6NVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2EaDhP3fH963
 SZ/vrhQLNEwgTYJFVbR9rurbdPsiLopzGCdtDe5kFyYGpLV7hAdq2ar/INutdeDB2GZC0g0Qbz6
 b/7TVKmz6JxON+RZKNZQn5Lz/pqVZGr9vbLmM4rZ0chyQvvIfutE5gS/9EJ5rRozzmH7SXqDL5p
 u+6PjpZR1VHYBIqZXpzqigdFWEeckktIY8aG/9ajBmx1okk2+i6QNIdZXPta+lMW21OfUagTEd5
 ywuEOeA+0iifU56o7DqhmTdZdkYWw+I0Rg/EX/IFOY2wz3Z1t4tC2frcS/XVV24gP4iSLXf+N7Y
 K37SILHp49E5GTwmzePiDgxKjcttzdlap3qpQ1F267iRecP0LmkpW+w17mRkE0rFmoXc6ErXsB1
 3Av5PDM1p1HkoTqVbq24U16rYo/CRadXG6zAhoapYz9YOnUzvBGCcoIN9hcgHDYUDJ4zjpYx01t
 7jwuKbk5uuX7LD7B90A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
GP_MND select the supported PDM source clock rates.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs8300.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c  | 20 ++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf558bedf524eb2ca959f3e9e5c22e..9b558ea023ad62e6d465155e21c54376d7b99732 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -1654,6 +1654,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1662,6 +1676,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2802,6 +2821,7 @@ static struct clk_regmap *gcc_qcs615_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 916617a001c854c1a0349c1793a427a2822acfab..4a152e95aa997bdcc7ec56a6ae96c61b3575cd88 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -2280,6 +2280,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2288,6 +2302,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3501,6 +3520,7 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614162dd7d5d9ab9f3a20c390ed0512..5ed3ec74b210807813f97120a4a19773f3f67d0d 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -2712,6 +2712,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2720,6 +2734,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4406,6 +4425,7 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP1_AHB_CLK] = &gcc_qmip_disp1_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 78399993cdcee225d2f21f39844b056193bdfca3..dc7a855be0234f6135d461175099862f2d486d9a 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -1913,6 +1913,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1921,6 +1935,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3250,6 +3269,7 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,

-- 
2.34.1

