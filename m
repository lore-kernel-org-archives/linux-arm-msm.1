Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183933;
	b=uI5QPo4CUou1yEn8NMeQlMckeXzaFngXwkjUi+TIu8ABtEG2Zr6+wfukTEZ57fQOVRB9
	 frsFyN3ifYQj8vxB/5Yd5/SIjp6/HU6cPrYgVG3GFaudtErecYj4zsLpzF+ShsmqwTIzP
	 GscNphcSY7WfTF+B/tVI3+3cMv5nW9xBhQx6kroQ7qmBCNGGGTnaiXRdugXtfbO7fIGUM
	 ywUGuEQbII71Kpa/YUD1qUfY6A1bC0BBMjYnjC4SJpVHsXH9Q9SP5QCAvLytsh0u7vnDd
	 I84WqbFKQbYiDOeMYbWTMnOtbJFcd4eEuMkYELO1zFEsgoeub95s8IoZceiGk1fMxkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=;
	b=qLmKN5ZDPEnvJ6BVmRYIWotCuFTWycJgeI+y4IvXOaTSqhlrMO+ny18lFhRbh5eTymqi
	 9T+WldVMhzJbXKh2nMzAv78KRoZbnquMsspiT9MOXXSwSv4WsXSQ51hdNEpsEBDhLr5NL
	 Gvusw0ws4mBUaAiHF0J1xenCD7Z/r4AJeEjJASKG7hBoV18Xao/1w3WQmlFqyBzb9bgk2
	 MTI2jmyi+4YOuZm3wtFRDEqPCwyoA3Nwb1ea8JdpUpcyoiKYE+ZQg/CfdKpR0DwHPtIMl
	 fKKgeG2RyhE8FYgJ6PzG4TwSMcbNq1I7Xy9LRXAiuryEQG0JcmcBJiK4N2+/I8rROhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MlnyKP6I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsDirxK1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB59D606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB59D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MlnyKP6I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsDirxK1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JwiH611863
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=; b=MlnyKP6IIrteuLZa
	xrqvjqkzp9dBygSIxrGWCfNR6rbRu7P2wnRvPrqQSR8OdPixEolQuUSTmoHiVr/v
	4KH0rfMm3xV565D1zyk/lMh0Q9RxIhaFStm/uGtCf1yHkwXvjEK22+r1ZEAh/t/G
	ub8BTHlDGyhcvCqywLuVd8yUV14zfmv3aXXpDCOyt4m/7a7Uj6dK+3GhrV2aW0d/
	BbCuwdoH7s4lHLlbxnCt1UV+AFKmWcGBjwFkhHti4P/FDuWefFmJgag2F3yZ8cxI
	T8jtTYEJZse4qx0y1O58OTWuGbECBCV2wwcvUdENOuNJuzbjp3S0bbXcw4ze4eas
	LANdGQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8y29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2520517c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183932; x=1793788732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=;
        b=bsDirxK1VyUWyPLgr1Tm7tdV18RB76dS8Rl8Zj40GChXvGJ/NNT/1jnGgpB429tGIm
         ywn8djofjOtHXWKeBhU+q/vTm0wstQy++Zr4mEaRbZhYsl1hlp4S1ymNkBn9Kb/FNjms
         IBEVTUKBcle3zX+yV4Uc10ewY5Q0LMQ8RybUawXnROP919NSlvgze1XOwsJuMO5DlaAi
         exPXAj4VPgVvNyo1T2G6UsVGomJgklSSTrHNtkXBoeQgZWcYTYMW2Jv4/ifw244A3B6a
         kyzhjw4mtVRoj6kVxdBphBOPh4OTl4qTnuvbnXfjVNPpaFG+jiz7owlQzSbCxwgpJGii
         epcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183932; x=1793788732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DmnsPu9LkHnfYUxkO27zCm2xtQYkAcumr5i+xtwZnk=;
        b=Apq+yI2jBtslJ3pwLPhDLD5nQTQk03+GHGjCo807BI/F6dXK497NgQsxELvte2lkBc
         FFgczkRJZAo9XpxUYFWXrRckZLZqM0pDKXG9DQ4h6pDXVypgBEJu+3EocE1Z+JWblXvj
         zSWx31nqsU8C8AXh3am0s/nQPoIA7FWMzLMo9iQ4iZSNf1MZK/BKXGo66s0DGQxV+z6V
         NZqu4CwLInRck4fVcnV3bnUcREFLkik9YIhFm5AnEtvQXEPcBwomHmnml2c8OxkKZtKi
         4Hyzd65GYv6+9fmCY+c1RoMs2cppedrFSrM6aV85UbXVT5mJKrRd7gQtQRDKw5Fz4Gx2
         tLqQ==
X-Gm-Message-State: AFq9FYIZFWq79ktpslvH35PPdM161gfA85aqfhLh/5995s2l/TpMVBu7
	1PHkLInRIncVK4XGTYI3Skzild67urubvDiD77pin+cit8dP7Fz9reF2TeZvHWH9NjGBZZFx5kg
	a/h7bLsMrLkG0FDasLf74m2mqry2jQ/+FpzXszb9jkZ5Nxq3IKWLtQcUR2UoNfUcXLj7S
X-Gm-Gg: AYBFou2K0MIDmUKfjl92tOEkh8Muko3LMRnUHyM4FqxIjhiHqDpz5Se+Y8ij1K07qzn
	rmcazbcz7RBcs5ytouK8lRgOUICYJnAiDL6bZzkzvNbduyGYZZtBAgrR/sw96r2DVKnbKar8083
	hkzyMWUk1q9Y/o9Yd8k9Zix5gu+l/Oxwzslv7DcNMv87nI6FQXLv6HeBZ5OI7r/fsbvi3ahGv1U
	nzPTozmUIYGl1EnmQD0LvcZyK+N++G5yN48ejd9Xxs6jl5KsmQiXAaboJiQrv3KPuNZgIohuhfC
	R4uNyil3UmeQtyBcB4STAW9lM4sPPFxfatkQTkbAwJKJ9hg9TAvdhFbCafhdHzVRHRNBMsZwiV7
	h2D3OUbvldKX/uznFD4M4PurLAPLPjH3YSsjA4WP5d1COccUDe8fGff6vVtmKk2sOVCpAJn8AiH
	A=
X-Received: by 2002:a05:701b:204b:10b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1a6c800e5acmr2967049c88.2.1793183931567;
        Wed, 28 Oct 2026 03:38:51 -0700 (PDT)
X-Received: by 2002:a05:701b:204b:10b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1a6c800e5acmr2966998c88.2.1793183930839;
        Wed, 28 Oct 2026 03:38:50 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:50 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:00 +0530
Subject: [PATCH v6 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
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
Message-Id: <20261028-glymur-phy-v3-v6-4-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=2505;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=vJCG3Igx+o3iKS2uCeMJkCfwOhV1lYTiyUt2vCdACQI=;
 b=i6srCDerdX7UTdkxOZ9DwZFgpi8lttjaccsdR1KmJ3FNLQdXp5Z3u7yc2wllcHcjDptAqHIGC
 NcqICQf/cUqDLhYjXpS+J/PHK09fKFxwhT4clFC44TJ9NUU+yWj8ieu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: N0SM8MZBifIkWaq1O_WtyxBKR-hpiQGU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX2Tsv/tiHxeq6
 YQ3LIyaDgST5SrELjnPlDVmsRJhMsFiOwXjBPW0ngD6wtOfB8l879tGBEJqW7pJ1oBHgRV0LlL9
 YphZ8viJBXqzGgTWYxdEiDn/Meco/Ao=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1d0bc cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=I9iHhWb_IStLGF-kurEA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-ORIG-GUID: N0SM8MZBifIkWaq1O_WtyxBKR-hpiQGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+cHTpIViIbFo
 OW2H2q1wd8QdoX+Plw4B+MDVl0Z7dqLfqNvQXjO0ClOgfxCTs3vGAm1BKGzBodN/NCMCl8vm2HL
 SaJkGxVegP/ypOkUYWgoRbEJ5NiChNzB43i8k6gCOUEZe0SdseC8umzL4lCrncLK9YCr60nxN3d
 EiWDTYNAxaubKwzmzh+RkvYR4rYTVLJORU6ga65/a2++zerTrrxOovXLFHZN6eRpDWIWBR6833p
 vGoOGh+9BM+l5a6DfmPCl3cOC5ueiKn1HPtcMGiu75BXF183YMP04++ahXPu/CxlPykUWldqnnp
 lc+0T0qIgVUR0RXbY9uc9DlviyfAKihB/SReJLZqxBMVzPlhySBM94+ldzWzLIoMgMOawW+84mZ
 FcxBT4fKqAlpSNQcgBlp5eU2LW4P3Dep87xs8AuzuphtjzbQlOf51Xdk76Ow/iWCw7eK00pyGFM
 fmMz6eJveHmercYDXZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Glymur platforms use a fixed DP lane mapping and do not support DP PHY
mode reversal based on Type-C orientation. Add a configuration flag to
ignore reverse orientation during DP mode setup and enable it for Glymur,
ensuring that QSERDES_DP_PHY_MODE is always programmed with the
fix mode value (0x5c).

Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 71f5e8ccfabe..062ee4397171 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2565,6 +2565,9 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* Set if DP mode configuration should ignore TypeC orientation */
+	bool dp_mode_ignore_reverse;
+
 	/* USB4 specifics */
 	const struct qmp_phy_init_tbl *usb4_serdes_tbl;
 	int usb4_serdes_tbl_num;
@@ -3429,6 +3432,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
 
+	.dp_mode_ignore_reverse	= true,
+
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3622,6 +3627,7 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 {
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 val;
 
@@ -3635,7 +3641,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 
 	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
-	if (reverse)
+	if (reverse && !cfg->dp_mode_ignore_reverse)
 		writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
 	else
 		writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);

-- 
2.34.1

