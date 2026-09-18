Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246604FB9BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738317; cv=none; b=R/Xps0jnGgP3xav5awUOUEi+/dLl/Gp9+DQSid730RxH+WpXtpOkNx0vtoXyKV7miN3k/wJvnpgkW5MY6T4B5qRWSGX6b1bPbtgqdL60DjyuRdwab6wus58iVTJlrbyon6W7tP0Gy4ylD2mR1znRjdSIwe83uIGCVkvllOxwneg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738317; c=relaxed/simple;
	bh=9/Ta3M+2cWHSSmmhXMsWsSyNlXd3ZUMPbwttnd3E9bA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpcEzye+0viqU/zc8jfE7+vyo8oxmA3+to+chpJL5JKw5w9UwoHAiCqsEFI0KPt4KCt1e33TEPzTXGdChqm8mwL0hMJbPbWJ4n+A4P8QLg6cH81D5un6bE7+SDAC0f1s81sazY4B7xkAqfORSlMK0srg/4ksli1c9LFrDo6kTW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhtX3WxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJqtdtm7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhtX3WxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJqtdtm7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDObCu882178
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CptbhzlF+w2apAmvvjkw1Ll/JtQE328m9MGf965vOYw=; b=GhtX3WxKE8+lctxH
	ifvsDmHib/i18tlgYcryCRP/NJW4CB0DZkcXfXev5pBcsN+U3MOpgRtj8ooH/X3e
	IxWli6pfMZhC1/UlxFihzkywxpA5xeI2yvjMahGPAjuC8/WNVIzyymB3WBzyWc3x
	gAl668LKJLtFoKq/YhteHEEoozgjWjpfFNm2I0SdwtWo7KEFSlnb1KRsG5WADYkR
	Z3bMsEImMsSSRifpwvwTF3WJoymMv1h7BuX7D2tQymRYmxhTMnSss0UgmxFi319e
	woblh5nj6JKFti49IPToM9O0vvNOV8CLZuw4cDyfu7Ok9ZbGa7E8099JWTvtfcWd
	wBIExw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt4hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86917d18a02so1286184b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738311; x=1790343111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CptbhzlF+w2apAmvvjkw1Ll/JtQE328m9MGf965vOYw=;
        b=JJqtdtm7kMkQ/Ha3LEemSkRsDPm0J4leq+D3Yvg56xpgWcGum90O6VgRcqFrd/Z7Fp
         4Hu9hmG45s3N2xvsSwuO7glsrIRGij+3n5tQlwdgSw9j+mFLj9MoCvwBanWdx1g7b+Mh
         d6azD2leiL9JuImPbx33vC5UEkX2A6suGPgL97bKnrJXDE2ODf6jyQn8WNWUfN6ZP2cV
         RcAfX3Dx3zljAeKZLNgfA2FyIWPB/2DOVB+Xe9lP/C22mnLkBRsq8r+fTjMxKKCZPKRr
         thhrCb7aukwigvemhJk61/606LAUUi+wpDZkmK42DoCdEG1s9QUvzYno43939Qjxy6no
         MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738311; x=1790343111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CptbhzlF+w2apAmvvjkw1Ll/JtQE328m9MGf965vOYw=;
        b=wBNUqdUR2M+NfgJi14mU5BqWxVMIFIBkcrxRgP9PLkAk3I3PleR6r9wE3zy/RzDSN1
         xXqh5i6vs9PBzo6vzN0clMQqH6MTRF6O4dK6QiwtuRfnA/eRxBL2NPjfoAKyEO3SHCR1
         KEJ6Sazo4SLylP7+edvZQo3Ss9VkAWPgnm5v9iMfy9osdIWZAsuF0qq9Z21M2mXjDnvs
         pc7p0zQsbZfU/2nvxlht2dtU0bYkXWe/AtTS15S/NybC+4jagvkkuRENH50udT6hk5zt
         TQBAgg+dfv/0T05kzPVbOivRNBnGvg2Lv0B/D1M/Gky/tYNqWBcO2G7QZMCXXiTlFwwU
         7ylQ==
X-Gm-Message-State: AFuF++nMmnFffGAIoKwlxy1DlsmyHbP9IG0Z/QvRiJwWTRtXsgjjFAX4
	LZ3Rr7B/eEpnW2GAIxtMk50wZRfhcEpRn+8UY2bJz9W4bU4ngrTyjXPwXV4H7INa8awcB3uHB3m
	LZ2QDcENlf0ciYuxvud/bdW5GKX27aaqW0Zx4keymss/cx0Hwc4S8pYBdLkZkPjK4xf51
X-Gm-Gg: AYBFou19hGXVTK7AFnhzMEquu4zShrcWyjiKzrO4IcbFL8CyD/zeoz8FzRjUb1ZuF57
	+R48BdNrJ0gGOT3S67U3y8M5RYyF8/N5x87tBKlM2aZEckTQWej0JVj5115NzzPQCuBJwwQRr8i
	PvwGdPsQi7tjXMZpgxJs77wsDS1qZaBKazlmLu2NKhS8sMxGK8pINWb4t3R4SOXbboSc/Vkknz4
	dTu5UHXm8lNNg/nmMLECvqs1nX1YG4w9qVLZXDLzzudgb9edv2qDbZBGO3wn2LEsKrNubI6/vW5
	ClZdlu/DXeZYumxST9ICkp1jlUeApi29XLCw9Yahnt617PE81P6aiIqismwAa/+r3HMrlih6G19
	YQXshyHMtEfHUfGhWjEsZRrqDa1Edh/MDnkw=
X-Received: by 2002:a05:6a00:928b:b0:874:705d:f65f with SMTP id d2e1a72fcca58-874df8f888amr4056814b3a.45.1789738310973;
        Fri, 18 Sep 2026 06:31:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:928b:b0:874:705d:f65f with SMTP id d2e1a72fcca58-874df8f888amr4056776b3a.45.1789738310528;
        Fri, 18 Sep 2026 06:31:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:01:13 +0530
Subject: [PATCH v1 2/3] ASoC: qcom: qdsp6: lpass-ports: add support for
 QAIF AIF MI2S and TDM dais
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=5424;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=9/Ta3M+2cWHSSmmhXMsWsSyNlXd3ZUMPbwttnd3E9bA=;
 b=XbTgUQnLgmptwqOM7gVpRFjxwZzWea/dscC/3bjZwzF36H0B3ZBhELesVLHcK1w3VXunbYqny
 ZJ4IPg0z7arCFr1wEc7U1NMXhNHEfr1vra+YU6dWGUhEXaXhOY3Btja
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad3d47 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7ryQxCqle0YhxczeOuoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX+rQdF5ZeaWvY
 33qES2a0SVBTCfbVuODiVQy+9moBoLjxga1KuSz2xNx5CCGPOzMZfGDY3K0ubMa46XQXdgPeaWh
 L1xYcFgMJQndQqXo7aCL4Hcx4xTI1x4Npbw0lgSUdvKk0tvMeGpLZHj7LugLFy+Jt3eVLIW4nDq
 sXC6BR8b4MF9bS3NgnvSO75ZiZzwCRsBUbJNeO90D3aCKpdImq9vhGIAIK+nhBSpkbrG64gZi/+
 lsYVb1lniGbLsFzqCkR17f/GyHHJr8wbP0VsvqxrCU8Vfk4hurrQy0YSOw9zqqfg6Fu8uk0dNtC
 TAmAMPeiYC86JICF1Okw7H5zEdoM7zf00pW7dM+GI84mtu5G5zO7kgRbz5fZ7Nw1KSec6JVpbWt
 ozrydQbP8vMi5tMhhMCST9e8bFo/v04RwGv7KHAoU091FmpN8yZHubkl7aIdywzrMA5gVRZyvRC
 lDiDhTCd3I45VoyUQQA==
X-Proofpoint-GUID: LyhRPFNOSCPwKis4GFTJpXEsGCnGzA3r
X-Proofpoint-ORIG-GUID: LyhRPFNOSCPwKis4GFTJpXEsGCnGzA3r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX56/UDilZcnGX
 A6Jni7yyKQ6gr8FQTYQx8TBgJxn4Gy7A77KeocM6cOJlbGyHwxN62tdj3YmP/j8a6M8h6O6x3Ja
 eA+V4AGlipGgyULUrHBE5Fb6+0d8Xn4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180191

Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM dais in
the dai-driver, these dais are used in Shikra, Hawi and Nord based
Qualcomm platform devices.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c  |  2 ++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 54 ++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index e204fd59e512..83f2711bceea 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -386,6 +386,7 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
 
 	switch (dai->id) {
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
 		if (slot_mask & ~cap_mask) {
 			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
@@ -474,6 +475,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		case AIF_MI2S_RX_0 ... AIF_TDM_TX_12:
 			priv = &data->priv[id];
 			priv->mclk = of_clk_get_by_name(node, "mclk");
 			if (IS_ERR(priv->mclk)) {
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index c3d8116ad503..f422346a50c6 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -548,6 +548,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.id = SENARY_MI2S_TX,
 		.name = "SEN_MI2S_TX",
 	},
+	Q6AFE_MI2S_RX_DAI("AIF RX0", AIF_MI2S_RX_0),
+	Q6AFE_MI2S_RX_DAI("AIF RX1", AIF_MI2S_RX_1),
+	Q6AFE_MI2S_RX_DAI("AIF RX2", AIF_MI2S_RX_2),
+	Q6AFE_MI2S_RX_DAI("AIF RX3", AIF_MI2S_RX_3),
+	Q6AFE_MI2S_RX_DAI("AIF RX4", AIF_MI2S_RX_4),
+	Q6AFE_MI2S_RX_DAI("AIF RX5", AIF_MI2S_RX_5),
+	Q6AFE_MI2S_RX_DAI("AIF RX6", AIF_MI2S_RX_6),
+	Q6AFE_MI2S_RX_DAI("AIF RX7", AIF_MI2S_RX_7),
+	Q6AFE_MI2S_RX_DAI("AIF RX8", AIF_MI2S_RX_8),
+	Q6AFE_MI2S_RX_DAI("AIF RX9", AIF_MI2S_RX_9),
+	Q6AFE_MI2S_RX_DAI("AIF RX10", AIF_MI2S_RX_10),
+	Q6AFE_MI2S_RX_DAI("AIF RX11", AIF_MI2S_RX_11),
+	Q6AFE_MI2S_RX_DAI("AIF RX12", AIF_MI2S_RX_12),
+	Q6AFE_MI2S_TX_DAI("AIF TX0", AIF_MI2S_TX_0),
+	Q6AFE_MI2S_TX_DAI("AIF TX1", AIF_MI2S_TX_1),
+	Q6AFE_MI2S_TX_DAI("AIF TX2", AIF_MI2S_TX_2),
+	Q6AFE_MI2S_TX_DAI("AIF TX3", AIF_MI2S_TX_3),
+	Q6AFE_MI2S_TX_DAI("AIF TX4", AIF_MI2S_TX_4),
+	Q6AFE_MI2S_TX_DAI("AIF TX5", AIF_MI2S_TX_5),
+	Q6AFE_MI2S_TX_DAI("AIF TX6", AIF_MI2S_TX_6),
+	Q6AFE_MI2S_TX_DAI("AIF TX7", AIF_MI2S_TX_7),
+	Q6AFE_MI2S_TX_DAI("AIF TX8", AIF_MI2S_TX_8),
+	Q6AFE_MI2S_TX_DAI("AIF TX9", AIF_MI2S_TX_9),
+	Q6AFE_MI2S_TX_DAI("AIF TX10", AIF_MI2S_TX_10),
+	Q6AFE_MI2S_TX_DAI("AIF TX11", AIF_MI2S_TX_11),
+	Q6AFE_MI2S_TX_DAI("AIF TX12", AIF_MI2S_TX_12),
 	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
 	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
 	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
@@ -562,6 +588,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
 	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
 	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
+	Q6AFE_TDM_PB_DAI("AIF RX0",  0,  AIF_TDM_RX_0),
+	Q6AFE_TDM_PB_DAI("AIF RX1",  1,  AIF_TDM_RX_1),
+	Q6AFE_TDM_PB_DAI("AIF RX2",  2,  AIF_TDM_RX_2),
+	Q6AFE_TDM_PB_DAI("AIF RX3",  3,  AIF_TDM_RX_3),
+	Q6AFE_TDM_PB_DAI("AIF RX4",  4,  AIF_TDM_RX_4),
+	Q6AFE_TDM_PB_DAI("AIF RX5",  5,  AIF_TDM_RX_5),
+	Q6AFE_TDM_PB_DAI("AIF RX6",  6,  AIF_TDM_RX_6),
+	Q6AFE_TDM_PB_DAI("AIF RX7",  7,  AIF_TDM_RX_7),
+	Q6AFE_TDM_PB_DAI("AIF RX8",  8,  AIF_TDM_RX_8),
+	Q6AFE_TDM_PB_DAI("AIF RX9",  9,  AIF_TDM_RX_9),
+	Q6AFE_TDM_PB_DAI("AIF RX10", 10, AIF_TDM_RX_10),
+	Q6AFE_TDM_PB_DAI("AIF RX11", 11, AIF_TDM_RX_11),
+	Q6AFE_TDM_PB_DAI("AIF RX12", 12, AIF_TDM_RX_12),
+	Q6AFE_TDM_CAP_DAI("AIF TX0",  0,  AIF_TDM_TX_0),
+	Q6AFE_TDM_CAP_DAI("AIF TX1",  1,  AIF_TDM_TX_1),
+	Q6AFE_TDM_CAP_DAI("AIF TX2",  2,  AIF_TDM_TX_2),
+	Q6AFE_TDM_CAP_DAI("AIF TX3",  3,  AIF_TDM_TX_3),
+	Q6AFE_TDM_CAP_DAI("AIF TX4",  4,  AIF_TDM_TX_4),
+	Q6AFE_TDM_CAP_DAI("AIF TX5",  5,  AIF_TDM_TX_5),
+	Q6AFE_TDM_CAP_DAI("AIF TX6",  6,  AIF_TDM_TX_6),
+	Q6AFE_TDM_CAP_DAI("AIF TX7",  7,  AIF_TDM_TX_7),
+	Q6AFE_TDM_CAP_DAI("AIF TX8",  8,  AIF_TDM_TX_8),
+	Q6AFE_TDM_CAP_DAI("AIF TX9",  9,  AIF_TDM_TX_9),
+	Q6AFE_TDM_CAP_DAI("AIF TX10", 10, AIF_TDM_TX_10),
+	Q6AFE_TDM_CAP_DAI("AIF TX11", 11, AIF_TDM_TX_11),
+	Q6AFE_TDM_CAP_DAI("AIF TX12", 12, AIF_TDM_TX_12),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -717,9 +769,11 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
+		case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6tdm_ops;
 			break;
 		case WSA_CODEC_DMA_RX_0 ... RX_CODEC_DMA_RX_7:

-- 
2.34.1

