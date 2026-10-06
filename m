Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD133A6412
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328281; cv=none; b=QUaVj/vtNH8rxBNEVUs9aJ2CNPnmrdJ/24zBVBznHm7vTtbWsUGgJDT8Oq4rAaYPe5HRZQozOTpskugYwGCUxal00+HiXloKh+jxXhNnEhs8bOr41GKLLaZSZZNVf4DUS+DGOZvYeF1iT1HNJwjgR7m/IEWmvVkSoIhM+VFm+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328281; c=relaxed/simple;
	bh=Fd1C6JrErj3ebsoTBnuZXnYsPKpUIODTop9GoIVFZUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rp86D4XC04e50i8dUqdcy55pJkYuNnkc2m6qI++inGIIP/sOMrWWu7KPIieIPNXxlQjAyKSHADbiQeiyavQtzfSqC/fkeZKcb4Qu05F3zwhGRnjacrFWtYRnWVSOq/Wq2y3pceorx6Ijo3Bfst1b++zrYpx7Or1D/RtJ3IjV3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNBZl5TY reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNBZl5TY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lf3301900992
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4+gioNUSCyN
	gt05FitiOd28+8m2vZHR7GzI+4PVrEiE=; b=oNBZl5TYGmk+Ck7+l0V21S/yOGD
	7MHKaq/mN+SoAsgbZ0/rEiS3Z+0Bue4SYmIb3ov9xuxor/7FHSKsMeJV1tGmiDar
	XofrMLvlUnylnu3Rm0YiWDCB/mG8FcMi3aoYJYv6DRPBkDoECJUGa9OYjRJIly6Y
	PXypD51nrx7hCibwzOZ5dKmJ97XnyWfMYACBonkw9hUsDArDHpy288VSBhErbZCz
	NtcRqaWHSt9gjc+KIAB9HT0/yJoKISaz/yqRrBcS8eFYR2EgDf+picpnn+DiVW6F
	77E++RmNV5W/XLjD+ugPfgrfHxE2Xy79hS92Ui+Wv9/ErtPJinfGQvYiXew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhn3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso574290585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326497; x=1791931297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+gioNUSCyNgt05FitiOd28+8m2vZHR7GzI+4PVrEiE=;
        b=KRJkxOWleD0LaDUmwpIbiprFO/OAL00pxaLwxFUvwy8Gqz5csdB+IArFU4AgsNuCuJ
         2d5KYfNvKV+46WQM71zoYW0OAMrEWOzkW9in1FbXhj7Z1M6F04GwFhurpFBDVgEI800f
         wNqdrR4oLaZHRdjJlSpdqAb9X6rmJ05mF7GXGNp/bJbD6Odquyx8UwESrHItuD0qiWLH
         sM8eL3aYU34SiiDjxXCqNelSRaHm04HpEzGIKLbvb07Ii+ckkffV0zRVoAs7jWTlUy2H
         eDYusf7Q7y97V00QFjleZDaM2aMeykeIgkUd3MFfgqtgGAPQDr05DjbWFpFuOSTNST+w
         Gilg==
X-Forwarded-Encrypted: i=1; AKwUvBw/RTNmKwQ78ZYNQmfEempz/9z8J2nI4Kh6zBN3/j1u9C7Z6uy6dtenzkQbZhk82r/lqBiL1l65nsRb3V4H@vger.kernel.org
X-Gm-Message-State: AFuF++m6ws0u1YafY9cQ7yf72kE+cDa0xg5gcunWsmA+eYEP9KB2YKFw
	boIS6RwEjrObttImgUE+4jl49lznQ9KZMY/D/GGxdImHSDiLpQQFfSm3BmiR4qWe3qpHOqXGkex
	UpQj5dI5cLkOjrkIyr+/EeuOHUetslU7fM+SSpfkuAVu3Kvd55Wig1fX2Qawxt/JNUDSH
X-Gm-Gg: AYBFou3/bq4JF1nqlM9pJVaFZKvk/abEk4Mc49HamshVkNwvl8xfze1x0oedwGcuR8c
	duhCJj15kHyK/DXzKPQGxHSfNVy3ZJAfjkzp0RBwmATx2tTOUh/epFIF0zra7ruqxIzMncMDR6c
	Opp7Gsueq3f0WdBIxQZwIbJStIijp0ya03sNbs2+vaLqYKtKdAWgvUY6S254fxcC6KWCfe77Pfh
	bhntqGsH3Bk5bQPTh1V7SqeNKhB226hcIwtiknC5bL4ZteWdcxqYmAZVLOViuPqsBpRuWqXqylF
	d143NgBjgbjZqHNBGGE7XdrrJS5mVBjs/vjCF4CJP8fVsGSgLE98AGzUuw4=
X-Received: by 2002:a05:620a:6f03:b0:93e:9809:dbf5 with SMTP id af79cd13be357-93e9b8c1fe4mr67466685a.72.1791326496797;
        Tue, 06 Oct 2026 15:41:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6f03:b0:93e:9809:dbf5 with SMTP id af79cd13be357-93e9b8c1fe4mr67461285a.72.1791326496260;
        Tue, 06 Oct 2026 15:41:36 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:34 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 35/45] media: qcom: camss: sa8775p: add pixel path resources
Date: Wed,  7 Oct 2026 01:39:43 +0300
Message-Id: <20261006223953.3382273-36-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X9EMgTmkVWPnjls6EyI_Eto19KEkfcFw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7vIm5HlXEI40
 O2rooi6Zo5ljE3EPTsHSfYrNpPoFg7zkoMBWHAecu5baP2Zfub091tGhZGApQm4PUQt3KZ5wfl1
 9Sd0KjoWKbd3y64b9oTgt3CnhhJhxKI=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac57921 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=5BPQ63iWCobm2f8DXA8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6qQNtP/L/CCJ
 dM/3quiAcvh2nBhA/vboSddrMfrb989bxAEZ/3QoU2iRoNByXHrj2tDYNKeChda4DtVrZ22X8f7
 dKFNz3xCtDwr3j9OViayfKhqwaYLwSH2LllDTEgThzQhHjQBWjP9nxcSS/LyAxvdd2zSeE3vDU5
 MHvPjoE3JeXEyHBqaPkiWpJ45HFgcru+ku5k7nwWYRuRB3MEvfCh06Cwz4BAIgjbemFmxC1kj54
 kpRd7HLsF40EANWhtQITiHhTuVhpgliS0aD8txiZv57SaJjnr4T5TJGOJP3BqIeNI+rXIKnmOO6
 ZfogSLBcY7DSB8rCcOygOhOAWACK3iZ09vi6r6WnkOcGNmf02e+5e7I2nH/UjV5xxDhrYMbaZc6
 R4JcTBrJsi9oEPBHcC0PBM49ljN437q61dpa/B6rvUg89fqaN5pVhu5PzvpSWHKye2ZRiSgscki
 af86crbFKE9dZ1aOqzg==
X-Proofpoint-ORIG-GUID: X9EMgTmkVWPnjls6EyI_Eto19KEkfcFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the CSIPHY, CSID, IFE, and IFE Lite resources used by the
SA8775P pixel path. Add a separate compatible so the new path can be
enabled without changing the legacy resources.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 424 ++++++++++++++++++++++
 1 file changed, 424 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7a3e5e6f81e1..a0b51c12c0bf 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4382,6 +4382,412 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_sa8775p_pix[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
+static const struct camss_ife_stream csid_ife_streams_sa8775p_pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_PP },
+};
+
+static const struct camss_ife_stream csid_ife_lite_streams_sa8775p_pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_RDI3 },
+};
+
+static const struct camss_subdev_resources csid_res_sa8775p_pix[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE2 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite2" },
+		.interrupt = { "csid_lite2" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE3 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite3" },
+		.interrupt = { "csid_lite3" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE4 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000 }, { 400000000 } },
+		.reg = { "csid_lite4" },
+		.interrupt = { "csid_lite4" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+};
+
+static const struct camss_subdev_resources ife_res_sa8775p_pix[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "cpas_fast_ahb_clk",
+			   "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v41x,
+			.top_ops = &ife_top_v41x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.mod_ops = &ife_mod_v41x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sa8775p_pix),
+			.sink_streams = csid_ife_streams_sa8775p_pix,
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "cpas_fast_ahb_clk",
+			   "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v41x,
+			.top_ops = &ife_top_v41x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.mod_ops = &ife_mod_v41x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sa8775p_pix),
+			.sink_streams = csid_ife_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite2" },
+		.interrupt = { "vfe_lite2" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE3 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite3" },
+		.interrupt = { "vfe_lite3" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+	/* IFE_LITE4 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",
+			   "gcc_axi_hf", "camnoc_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 0 },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "vfe_lite4" },
+		.interrupt = { "vfe_lite4" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v30x,
+			.top_ops = &ife_lite_top_30x_ops,
+			.buswr_ops = &ife_buswr_31x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sa8775p_pix),
+			.sink_streams = csid_ife_lite_streams_sa8775p_pix,
+		},
+	},
+};
+
 static const struct resources_icc icc_res_qcs8300[] = {
 	{
 		.name = "ahb",
@@ -6275,6 +6681,23 @@ static const struct camss_resources sa8775p_resources = {
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 };
 
+static const struct camss_resources sa8775p_pix_resources = {
+	.version = CAMSS_8775P,
+	.csiphy_res = csiphy_res_sa8775p_pix,
+	.tpg_res = tpg_res_8775p,
+	.csid_res = csid_res_sa8775p_pix,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.ife_res = ife_res_sa8775p_pix,
+	.icc_res = icc_res_sa8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sa8775p_pix),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_sa8775p_pix),
+	.ife_num = 2,
+	.ife_lite_num = 5,
+	.link_entities = camss_ife_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -6449,6 +6872,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sa8775p-camss-pix", .data = &sa8775p_pix_resources },
 	{ .compatible = "qcom,sm8250pix-camss", .data = &sm8250pix_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
-- 
2.34.1

