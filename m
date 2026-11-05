Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877088;
	b=g0oON6BliVgsQyx87tkuoBg2V868+aLZU63wwPUA+JyFaZ28bXeQ/9urE9l+8nJAfRoE
	 vd9vqcftA9gd0NwtRamdyYiTgmWfHLFrQv6gEp3jMnDf1gROsFEFIzOeoYyOWysAMpfLm
	 Ip1hhaN0ns3iCJ5V3XI1lvirXpwUX9TEJ5psdCLNJ+qzxeLyTLsYgUxhVepqtvhZq16Us
	 uQwYsyUNXLAoKgXYudKvER49fZ+y7Zev6iL7pFWCV80PxfPsuta9uvIlkQW5kqvFNZZTN
	 R9AhUifxO9DyVAtP/Dka3FqCkQAD8x6Cy2LdZTdvVa1EsAx8bJeivZIvLC4oVLozufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=;
	b=JeftJAHdTCO1UL3Dhpx38AWZAso8kn2hW63RvVM5T3tsMbMjpA/Y9vqT7REbn4sxOt5a
	 ECovf5bA4GjLt7ErD04xa+AWLanmcFmlukqHRLEgEez1oRwvNFLjWSwg+PhsPCH+VDEC/
	 TJz8rhNAGdN054Vp1V4noLc4flH1R6MWNPt3v3c3d01naNpMRK1J+oAA4Bcb30H2XEBD+
	 PdWmOMKSRueEGW15V7QCjbSFgyrk4JS727GMn4EAECS8zs3SLLjYCmIZH0nnoDYc8Ia7H
	 bYTr0jhNbNgJ4Q/P5E1b77qt3pn2karnrw8OeBnXuNaMoW5UeGxWwN5n+1h1CfLawZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es47JMSM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+VUQ7+c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863E606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C863E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es47JMSM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+VUQ7+c
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tWKU4084644
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=; b=Es47JMSMkm9WQNEF
	GE1tqZUecSswgAAb3bTuUiKpKVqLKqGPF6v0AwuRWH8JvNVLS1XQ8z2g9MWYfQSH
	dSIOWTIAkxDUNGKTTbIG9FYhZoLzLHSvRxdDCAXXWq7A0E0PSP41R8E+l/jSBNdr
	F5W+DGHHNPQTIHiqgWetIvPrS480zfrPQ5r4Ch0W/pEnfDe5vur3HdB+/R/99ljU
	WIagSnk9qsZv9aUs5dspIx7ycveWHJjYumj6iN3m8XpmLI7KIpGNHG7A0iUjDUNQ
	iTdf5eywcOxNNpEH1Sle/6KKRIN0n52t8YZlTxRciWo2j1XSah5SpuJENE+TJhl/
	AxRxow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr9x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:11:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so594407a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877086; x=1794481886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=;
        b=U+VUQ7+cEmFAY5EApVBQWkcAT1+1zj4uu67vGZqsR2gkCvl5+CjPHuueFgGnJyf64Y
         b/rLrwmcGl20cE7mROn4O50wB8Xy2b9/gHycp/NVWfFTdv+axA2A1A8Eif1F+2jFX5by
         tK6qUiB6iAINbA41OojpOizcU6uIqtbFw+d+m+XNfcVvZ1NzQd2Q/moPUtdDmgXJU6m4
         aaQIBpNa7QE4mUVqzTAKozk0iUCcnhFcAdKCQWWd1IlbMbDcTloR67+zTZpCv3lkTY4i
         NPnW13xuzOUWrZLFemq6l/uikGTKDLbk3sHgPKsnmdJy6hU8uG1cmb8kfzmAiM1yweZ6
         eoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877086; x=1794481886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=;
        b=BJ2fiSJduZhrWEcSAaR6ByCMKKTFFVRrpW+R7mtrRRRyCvLx+ovogCxadulW7brvxO
         R/P51SeWW5Ii6MhwT+uK/PGOhjBoMgOv84Hu4SyV4GZT4wj/AvXBIncmfyjQMHmRsG5E
         cPMAVK1ZA3d/i/LJ/Y7h5n4CfuXxgPPq3OxaU0cjqlMtI5wwACN0qpClq+WJ9mqLVi+M
         9pstsweP7MHUzajATVZagM1RZP9zUB7MEevsoPagdUBf9eoAC286dGnBdYE0WPh2pLkS
         7CTXnIPnVqKHU0jmhRVAlti29XpD9aRkc1dp2UboW0cTygvIzZjsxX1DyfOadSiItuVl
         MZdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6J/4lSwrzeOTQrvPBN0QCd9yYJMaa86gcOXxBPDVTPRFPjf0B4Ga+4MZOxofoVsL7uaYHK00OPSmCOm3G@vger.kernel.org
X-Gm-Message-State: APuU4Z/fTTHzeX6E/efDzZ1Kjg/HDIHNukFwqL/S3Rb9TMcDnHuyfGcL
	nv4fSBsqcRO4SKqnnNTCltD7Hr6M4xW0d1xpwBMKDWTrAIgNojCuNK2zK/0o4ZuYjwQyTJwwlu8
	GcC//iM5b2UTOS4BfcVRxQrmt+NIXwezAhYMLGzyYj+RekUWfz3wlHOBybKkOcfVsNvJK
X-Gm-Gg: AYBFou1moTN5G8/unBhlUk9MR6v3TWYCwRGw1hqO2S4o5VQWMOLT8Vssr1lRyMIOMZN
	fHKC7+9twl+RiqwvNWDpIfa/bdt/MEbeVIXGQ8qNo8Hk1MGb7feLy+TInAvXAD/o4ipZnwFgbVJ
	+D6W7wxkC2IBox/gH0R6sQ0eaAyoVf7LW4eSsBigwrdHUjhSSk2S1u5qNKO9yanOLG4HjJfhRVQ
	EC/H+Iik9OjNjT1z5OFywFIUfifCKF0/ebGCm2dzSlDRSfqNQPrDnLJGZR3DP7JTAGtk6sNzv66
	307U32ypayw4A6weNrgbOTKX34CF+xqdrVk1+O8WwgUy+dO4zk0wrUC7PKywXKq8OSo5/m9LVtj
	157N5LpnvPfGLjYtc/nc2Wzw8nBEnJrz8d+ykVib7SJ5vIcOKLEPMvzXoOOP4QeaCG5n2vsPi6R
	dMApSKj0mx
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1287718a91.43.1793877085948;
        Thu, 05 Nov 2026 03:11:25 -0800 (PST)
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1287696a91.43.1793877085433;
        Thu, 05 Nov 2026 03:11:25 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm3384737a91.9.2026.11.05.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:24 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:40:43 +0530
Subject: [PATCH v2 v2 2/2] soundwire: qcom: Add set_channel_map support to
 SWR master DAI
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
Message-Id: <20261105-soundwire_channel_map-v2-2-5efe2021552a@oss.qualcomm.com>
References: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
In-Reply-To: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877069; l=4177;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=tew798NPD3BPCPOd+vJoOsosugK60akzmp3jBtzKFiE=;
 b=finD1DqF7yDMGzDAmEeqDbk9Wque4jtTqe0pjAqtoDjc/8oi7vzICpPknTaMUlJMCUekkwcBF
 S+FznDf9pSkAvp9N4s7HgJn9OktYajzuJBzKNm0lrHS6/XSJYGrSvSr
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX4cKp4AqSRUMv
 2ppZ2lu0BB3J/2Q7RUBA1VPDQD6qrP0+BlzQSsUlrRtc4h8gWsitJbFgQTFkwYuRcYkSLYXiPHz
 mxy05Z6GRHYBeWu4n9o+Rfra09woJeKI9GEUzdXaRaKrA4qrQpglzjizNdSl1Epq5IyEx2EJWtT
 21LtiBQmB/hFAVNDZl7JgQssmewFfrLyj52IXUrvnkmGC/V6IwMNkaKsbPPjejFfKRZvKK5NTSW
 ZwwD2btW3ZKB6RRb+RFhfVL9l+6VvOV8ilyn4T5cwtJKdy7BuCrLrbzM170xKmXVwHt7ci/TOMV
 zGUORBw4t2Av5YxiQamfsRVxjRtoC4QAwpm8U6QBbQgj1FFN/IR+XffrpGIzM0VrHqERl9GLfhE
 D7brEf9t0Au/rdfO/PYz1G/8fcomqhwMaP7I9lIQn39va3921s0sP2Rg8L8MwqCiKz/BJ8SK81E
 z2sYL+xyTSKNZtcC96A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX0MwlnMeMShPc
 COXOecxKJ2JMfJgqyxD4FxvMNX+oEHUxjOGWpBTddGv68g4/XtJGTiw6sjp4WdUKsTJ5d/YhpCz
 rMP6uaonfZscZPKeJ1/Ga25p0X9Kuc8=
X-Proofpoint-ORIG-GUID: n4r3lmw9rK-96nmD59nuqZxRhZ4tAGwc
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec645e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=CYKTsl9jDGlcAgKpjQMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: n4r3lmw9rK-96nmD59nuqZxRhZ4tAGwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

Add .set_channel_map support to the SWR master DAI so the ASoC
layer can program per-port channel masks used by port_enable().

Fix several issues in channel map handling: clip programming to
available ports to avoid out-of-bounds access, use 1-based port
indexing, and store TX/RX masks separately. Also track per-direction
validity and select the effective mask based on port role to avoid
incorrect precedence and ensure full-width masks are preserved.
Fall back to the SDW stream-provided channel mask when no mapping is
configured, preserving existing behaviour.

Fixes: 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Closes: https://lore.kernel.org/all/4ddd6855-3817-4dc4-81c4-d8ddaa039865@oss.qualcomm.com/
Reported-by: Jie Gan <jie.gan@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/CAMSo37U1kJq_gK8jiW9iMbhHXtn=Chr7NawiK4fPUPj4kyqH2w@mail.gmail.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/33fe8fe7-719a-405a-9ed2-d9f816ce1d57@sabinyo.mountain/
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 147e55b7a600..c411c3628dee 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -162,6 +162,10 @@ struct qcom_swrm_port_config {
 	u8 word_length;
 	u8 blk_group_count;
 	u8 lane_control;
+	u8 tx_ch_mask;
+	u8 rx_ch_mask;
+	bool tx_ch_map_valid;
+	bool rx_ch_map_valid;
 };
 
 /*
@@ -1188,12 +1192,28 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 {
 	u32 reg;
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct qcom_swrm_port_config *pcfg;
 	u32 val;
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
 
 	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
 	ctrl->reg_read(ctrl, reg, &val);
+	pcfg = &ctrl->pconfig[enable_ch->port_num];
+
+	mutex_lock(&ctrl->port_lock);
+	if (enable_ch->port_num <= ctrl->num_dout_ports) {
+		if (pcfg->rx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->rx_ch_mask;
+		else if (pcfg->tx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->tx_ch_mask;
+	} else {
+		if (pcfg->tx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->tx_ch_mask;
+		else if (pcfg->rx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->rx_ch_mask;
+	}
+	mutex_unlock(&ctrl->port_lock);
 
 	if (enable_ch->enable)
 		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
@@ -1413,6 +1433,39 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 	return ctrl->sruntime[dai->id];
 }
 
+static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
+				     unsigned int tx_num, const unsigned int *tx_slot,
+				     unsigned int rx_num, const unsigned int *rx_slot)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	unsigned int max_ports = ctrl->nports;
+	unsigned int i;
+
+	if ((tx_num && !tx_slot) || (rx_num && !rx_slot))
+		return -EINVAL;
+
+	mutex_lock(&ctrl->port_lock);
+	for (i = 1; i <= max_ports; i++) {
+		ctrl->pconfig[i].tx_ch_map_valid = false;
+		ctrl->pconfig[i].rx_ch_map_valid = false;
+
+		/* TX setup */
+		if (tx_slot && i < tx_num) {
+			ctrl->pconfig[i].tx_ch_mask = tx_slot[i];
+			ctrl->pconfig[i].tx_ch_map_valid = true;
+		}
+
+		/* RX setup */
+		if (rx_slot && i < rx_num) {
+			ctrl->pconfig[i].rx_ch_mask = rx_slot[i];
+			ctrl->pconfig[i].rx_ch_map_valid = true;
+		}
+	}
+	mutex_unlock(&ctrl->port_lock);
+
+	return 0;
+}
+
 static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
@@ -1449,6 +1502,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.shutdown = qcom_swrm_shutdown,
 	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
+	.set_channel_map = qcom_swrm_set_channel_map,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {

-- 
2.34.1

