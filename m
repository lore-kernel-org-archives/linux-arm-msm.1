Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376487;
	b=llh81c0IQA7OT/3Mmh+1wFLjYPnC+zwzHnoYqV89dzZUB0pKyzc36oH+x9IRC2IYc9Sf
	 5qKayEM6ceIsPeDyNSqc/sXAdZ05JnNtJ1HsQg/pB/Xjlx/cH7N8TL9/B+Yh4hASe4g85
	 TJ7d8X39xyU6RwiGNqNc3U1+lVSo4MyrjRBtGIoBLdSWMYmX9jaSbbsrl722/qEjt78lv
	 UtKm8ysgRn0EtQ5THYgzY+Vv9WuhVvqrIJlzIJZ7mDXA1cVeR/Xxmx5lrK992wvL4725v
	 PHw8yucNAQcCoC4ltm8XnLgt/SFowxYWv8iprw7XE1Vu4WgKGdAAxz54WHsj4PFmjoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=;
	b=PVsh7odteGvExMTM4fZ98ahcd/Yb+rPp1/uJGnRKeEFkI6xA+WuEPzkTgQTB0VSRsNsm
	 qdrcLq5H6PhZBIS+9zdkjF6ly5zfQ3UhLZ39E/xMH8/d1nlMQm7zyymrp3+mjB92BGaCK
	 SAcFBCxIZrsNVjqIlNfjp9EGAO526koL/dav2+boM3nDpsUNsdDScb4nYrPNlkrpl71YJ
	 7GlRic4fQF9gP934Ku5BZ+6QZNwBJUglXoquBCP2ryYc3erRsGVm8Cgi/BcI2vfvrbvfT
	 NFad0MpxTy1GQqYNN9nVChGIy22tv5jzeCaKgjAYkwgUhRPJ096HGx2d/SbzDPuGf0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPagmhAQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clQq0gJw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B166606A33E
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B166606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPagmhAQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clQq0gJw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVYPC412750
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=; b=aPagmhAQWCANaq92
	NJQb5j3qzkjxu4ybQLyUefY13HylNTd5dR8efJul/XArUyqhE5WWn5gSq5APP8bN
	KzFS9YIqRejbXwolqIFHpjKqwmcISpY4JSSbU3dbd4iwJOIk21nByitML3QJAXHp
	PpEbAfGevIwKikejmlVwlirb4ERpxNC/Zr4ihgRbX505tGiByVaCI4eiykLrTekR
	tcpQXOpYAD40o0Ylc79JSMY2mZZCmmmgGk4Mhcw5Lpus0+hhpcku83xhfqlnj5zD
	sXovGdwLetHzKxlJ318JjJCxrVGVu/68r3tNPoeEwe1V3c9L/7nOdK9udkWCwEcG
	HOE6QQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m692-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4424195eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376485; x=1795981285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=;
        b=clQq0gJwMs4mQpQJd10SoQzFBAhWimQbm/IICAKjOb3waEJ674U32w1t13cDnpq1Bo
         8b/SDDtCo0nO1iIVZzKqiZwtz7WMf1cvpp15Q4TO2MCsyO8YDsQbMBsuP0uuRdzIGTrF
         ieWsWxiv5GC1mI5pRKjckEu9elBcpgeHfQc1ZRTtuqXog+zNAi5D0f5jP20+EONuWSIO
         o/qc/1T8UoZxCwn3JPd2oYc9UlbvrWfZPVRbLKEfDYbBE1iCa62Y62AfmJwl7GNA1glB
         TgY98xZccgZOhb9IZAsX4ksiBHb0eonKFRo967ZmSX19+IKU+HzJuDD+kHpzMXfpRPkB
         bgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376485; x=1795981285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=;
        b=G2auO0oce9Br8EAcAHzIsuBmPiNISIPGLNl5DFnwS02dDI+nWKeaU/8+bWRCLnwgvS
         +w1HHsZhjRMcTVpGKOIrWwF7as6b6Pc8JBUl93pNB6E4PlVZHsDGHl77EHKuZFDtRZ8e
         mzeRnQW6IlNVf2YdmKfBwFHNLxhJVth8osci4yq2nicIj6ow6Ne/fm3yAiGruKL8LJWB
         whiMCBiyAVWXfQPdQvaeqrffRHEC8QEqwufVFBkGxwStRYdgkg2+8Jvl7MYeCve91U9D
         h5Ww3x/JiBoUFvcvf5QfNaXOKshPR93FyivuFnOjHtPy3HZ9JQl//QhLvsT8gSVTGlLS
         2cag==
X-Forwarded-Encrypted: i=1; AL+hErGcaP2ZSFpu7Svzie0BhG+NIH0kaxw8w3xMO+wAOuKbSZvAWMI8AogD0GGNI3IOwbA7PlDCGj7EbIha6za8@vger.kernel.org
X-Gm-Message-State: APuU4Z+kQCIngr3OqYUg4z5i6DQTUsvXZzByWcWXdpSPLXhYffkG3se2
	BMZV0LS/zYKkl7PR88vn7LyARyoZRD/GBr5biVwIZfgiVcgoWXVKqpgGxikF8v1kgqTSgVRUxu1
	538T+p1Wc3jbU/WdO84ayg7toiwGQOIKwq5MOlpvaVJOinnjxMrn5XcR5MBCFYfK+qa0g
X-Gm-Gg: AZFdTZcPamREmMvpB2z43DM3TB8vDKgRkjjSfrojaLRicTf+woHzteEJQ2usTugcTQB
	7dv3T2OXuIGvQhKXWFbirC482muDnMY/i/j0qPtCQpqxTV0GeG6AHHHOfMW1ggb7dvhOl7Of85j
	D13J+4d1JZEgT/d/Df/ynd4bnThgdztYLOuLQ/iWerKT2NK3mQHjZtXCxi4eOrzXl6kWgjMfg37
	Er4quyt2sW9LGXKRiAPEEJZF+CqV+F92QJkxeHJSo5C/NzXe3mSDhdoCvcbxSofVA+A+kXRDdC3
	ppBP5rTIetwgt8ZIePTTOIAjwc5/CjDlVH2K4woJ8iB3CxELr2+PmuVKNClLgrmnoYjjQFLdv9g
	SzDas3OYwAW4bBJ5GOxiCOA5x7kmruMq87Z7rQksooIfCqb+kjFqT1GT/iZCOoWTpS+Npggtqxn
	FArfQ6kl3zXg==
X-Received: by 2002:a05:693c:829b:10b0:376:feb:2df3 with SMTP id 5a478bee46e88-3856f85236cmr12193785eec.20.1795376485393;
        Sun, 22 Nov 2026 11:41:25 -0800 (PST)
X-Received: by 2002:a05:693c:829b:10b0:376:feb:2df3 with SMTP id 5a478bee46e88-3856f85236cmr12193755eec.20.1795376484904;
        Sun, 22 Nov 2026 11:41:24 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:24 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:48 +0530
Subject: [PATCH v3 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible
 support
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
Message-Id: <20261123-shikra-machine-v3-3-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=2047;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=BCHLrEhwGhe1O6yp+CHSIz3VktK4Nv5ZZBQEoMfmYEc=;
 b=gH8tAk1kaREfDEeheHZdrbuOQocoz5hcTZ6LpEM3sh6VwjwpF+HP/1ctSLNvJVg28xNIhKsyy
 wKNxOraoxKcAYC+eOzhC40pP30q/tQ/n3rUYleYcuLrxAXiy7Vr1iGl
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 30hLQ6e6Lk2q5DvLzBc4YCYfA1wq4-db
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX2UTmpcQcT8KP
 5kIW7e0Oo1HIr3zWQs6wq4otSck3ljqo+aXYTPJsBTKVIlzdXuSIlqkFF+kL91bz7yNCmPfhHRL
 IXXR4luYfh4qy99vWZw7Az1pwmqgCKE=
X-Proofpoint-ORIG-GUID: 30hLQ6e6Lk2q5DvLzBc4YCYfA1wq4-db
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX0Wl0FULXKLYj
 CaL9279GcNrAdvo/Vnj5Xuuq80Y3nsPVt4tM+eqTmOMV9tlgw78zh6IXsIBlDeA56kG+ERfdSnk
 rOYqbzqOyUg5X7P0zUDawz6r/cpX5bjWwIDd7uUqV62CICVILGFec51ldK4Me1OqUrmvti8ug8Q
 bj8Yq57yqiCtM5EjuXz00I6C7NxcnCirwOB2y2l3V3HN1SGkHW0PAqdRZ+qWhjPL2kSDAPSy3bi
 27n8g++XZF0psjN4AgKnbFr3IZdYtMzXsik5nVbY2SkUtQ/yyHDlhJxso0Di75vaIv3baWflB37
 ULOueC5P9edHVvOQnhUCjOn8Xl5mDL/ITuVFmnXVZujWw7jP+9/MzC0FYezemGxNLsZ0V0NwMmM
 S2W8eY2rlTsqqUHRe2ccF9a73B2JqSW57OEJ1krknuIdavM16VbtFzj5VU9AybenYAQb3dWOfiI
 FuHwqownGNhEk2qkNsA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b034566 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Jl9POzQKuGOmLu04UGMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra CQM EVK board. The
Shikra CQM platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components.

Configure the CQM QAIF TDM speaker backend with DSP_A framing using
per-DAI board data.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ff8ccd3065eb..e1d701a1b1dd 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -727,6 +727,21 @@ static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_link_be_ops = true,
+	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+			.id = AIF_TDM_RX_2,
+			.cpu_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -796,6 +811,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

