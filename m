Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541554;
	b=varjBHAgawOG9j+73AOThvmP/GX8zkpAZZPn9TxQ+NqkVSn2nwTCFVn65CgJiK2DI3PI
	 hRIWfmKOY5/UvP0MwIT21nB104VdBara7qpkydOPEy5bMXMOcaMiGf033pTHWq2XTZEM6
	 J+0/5wh4MNLk+8wmKJueqsMsi/TQ4xVrt1x7poiDT3i5qOgKtwMf5WI2aOAYcALf6Vkh/
	 ItE7++LsXFOqObpn0ND9otllmTrHlyUULgNgiR0hH2BLgf8TAqPsjHhgwUeyS+oe8MbHk
	 2U4uTSfjVFMvTGTE55BzclMTqmR3chs+NV2mxrrjCP/dizA5lO/WNRS3nvJJq6Bajdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
	b=LtV3kG+V0OHYjN57UMYd/bF88edyK13mZuq5IdHpOvFZzq/VXiWaDmja2rVCdYexpGpk
	 CmTmUdydiu4ktusL8gVX/LMyt7yvuKamLKmsZBUDYSyEJ+9WXpsdFZWPvepHZjazuaH5m
	 nYrtw9osNggIAlnWtI64f6arwtJcHPBSFiTxXEQXb9OkN3wgJc8tkwyO3j1Z4XIHLzEEj
	 Hnxc/HJK3LBJwAlLpMD7rF77gNPyBBKfBublIhI3l/RdhscdBBdk4G3I5Uhy0RUyX2/Fh
	 ltbm7n80Xv047LiuN28XhMpfkHgbCiV12DrE51turKKjenbYP2PL8s7PZ3A7IVqi3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hw84uXTW;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5F60A6F56
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A5F60A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hw84uXTW
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so2864190f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541553; x=1796146353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
        b=Hw84uXTW5QzwYORsvT3bCENub/kymeSn9FubY6WW3pY+KTXS95TEVXvk3aMmWV7/T5
         L/E0jCVfH35jtcYFGIiCwMe2GBrxexE22wBj7RotWUGXn9Ih8ZpOrCSwxhgXTEWYzASk
         NNNe3l2CYhMkgELGoRZtRjk+fShw6yq4VosL0RTw6mCVUR6tHXrdlfhlRfvRfZEFxv2r
         /QgBzaTjmLHaY/+9c1xbtpbrL4Biojgz4y1gZ2OeQTm5IHi+wGnRyr4gdEUdE7yHPU3N
         73DKZ+DxDCGOZdqFkVcFSRyin/ozBRcgWVm6vPQVnONT0QngTz69fb/9UZ2wH+qsoJ2E
         HtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541553; x=1796146353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
        b=uOj+7k+NONSFuZWwHL/K+FAsKIm+hcxA9gwnrIz68ErhOMyJOsrG2+FcDiFW/lxe0b
         gPwfbvm1ew35KLluwtwIJBds5TwRC43MZMjVByZt9qgo/bIscN0C0EeX+P8wZ9FVk9/o
         b+6XTE4P4ZBitEBd0u9Tpn/0NmyP5yMK3wDYgA7gaq38ECuPUTOy2jNmdK5b+xgD0l6G
         GA8mew9KxH2tvSAjFhAEXh4Rj5cgGWu+42Ms1nFsB2sllykXOu2GMhxqKsMR7ReJDIpg
         q7awUVmrPUpo32q8HVf0QIfFRiO6kji+podsak4JCwEdy1+Nrhu3xPAp0/DVD1Hv13ic
         2Aow==
X-Forwarded-Encrypted: i=1; AL+hErGWh4CTn5tKOQfDPTMLBnzX4WjdSjY4Iym2Ad7pgYtVbl6GGIR3G+5roAm80d+zjTshuSnt+OCFY/XpgNy3@vger.kernel.org
X-Gm-Message-State: APuU4Z9fSj8d7Zoha9bPZoFV4Y6Auqbx2crriaN/LpM9WTTltydiK6i0
	BuS15g1zafs6utjB6qkRL0Ko/tvWN+om7TgWiDH3Uu/+Ox3w18HcjhANB+05GOwyM0Y=
X-Gm-Gg: AZFdTZcNicGUstPsFXV8ive/xk2w9HVXvlJr3HMRTJlEWucy9Vos64GvIV+TLcom4b5
	4hLU4ZK7XqB2jE5e+Kb+clhRsUed34Nt/lG7lYYVnGflCLKcjMOpN3FTKojP03nusSi/QlxSbpf
	yB9z6Q0AcXQx15InSyyYwiYZ2dips7Ws9tBBwTKgr0leBlNtc8nVLBIpe3ROcdqRsyjerqQblkt
	aGQqBTd3Rwiw3puF8m7dqCi3bfBZCYhoHbiKN2WZoy+60UlHMfYYA2yuu3FFI7eHkI+hE/ouaUn
	X9DPJh/v1sDOnnltea0nDkiEiBADPvJjAkH24N8t9sOUaGIxaZGfF9wKCBeCKbXAYPpfaYU3Rzu
	oBBnkVtFs92kTdgc8inPkFw5JqMQCtjkk0JUslrYG7DXCIOR+NcR8tONhaBerUt/wCSyiiAWX2D
	348l5EiHcKrfRuGlQYUT5VPhNfEBFKLFwU83OKqRJk2PRoBRa1Xwtpe/RIbouAVIgFhIum4jePq
	zsWeg9dDbiAgAneADWof6m7hZzU2RHU2lfIKFXRJs4EzrPNHcugtONFTxP+2KO4pXlh6yMq2cUA
	m+WAkfVi0niyexvrwC+wRIkGwyjetxQMxPTjjB8/pBhcLNtIMWIxkHniNCMlV6jJio8w1c73
X-Received: by 2002:a05:6000:2f81:b0:4aa:ba0f:c1a with SMTP id ffacd0b85a97d-4abb683bca6mr29226251f8f.40.1795541552768;
        Tue, 24 Nov 2026 09:32:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:21 +0100
Subject: [PATCH v2 14/19] ASoC: qcom: lpass: support LPM memory type for
 I2S LPAIFs
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
Message-Id: <20261124-topic-sm8650-el2-v2-14-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UX1Tne2tKvwx98oB7eZ/uqM9X8LAabEMp74ho5pRl64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcohpXLNvWL3V+lBQmfD676YMbuAgG9ra+C6YI+m
 1L9KO0uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIQAKCRB33NvayMhJ0ZHtD/
 40aEIUN4VVreY09hOgfTQLQtRL4HgwM2k2llV8ULvXQYQhAqogNznOG5E1HvO23H/kH/xaCnvtVxNs
 VYWpxQO4La+MX5pWteY6lC7QrHundZl1dsU1+ayFc/0hILypl39hnl/Bq2rvnTc1lpsrE87PuGraEB
 UXazbn23+Kz7JOzLDepF86k9LlswPnZ+rnYeA15UdblMxSRI0KuNY7npHWaRp9vbwT1QC0kIV7X/EE
 rs6Gqcn+pZoom7DMjoJERoclsbIuRRt8zeiRoD0MaY5pIB3Gpbq3WJaRTzM4JX/j/AbE+vikxH3MRK
 yl775Nd1btB2582Xki/EvtHBldRbuBSfZvUavTp/ML37dSIP5lnACOLm/qDmfO+cTeAZ5CIj/2YVSe
 POhWhHk+iNTj8ELQFxWPpsHXhK0t+DFwAASC/OdvOiwCMb2RDbFu0d/IG4uKeyzea7IeQZ2G5U5EW8
 Hh1svmNDhVj02IvL4KSjkekGPv188k0YKrZlIpsyj+w8leu7JSxvMaJVRgaWzA6/O4riKsGTUrJxsL
 GOkrfzqK1T8cxeCBDiWX88juu/06zybtZb3LMqsbaEG1Pn0ZYieAc5OMHGuioDIj6y7TFhqmwMBZKi
 vJOv9KA3WbNqpomO3TiWD5/33pmZX1wNCfWPmZ45iR8/zoFGAj2KdTYREvlQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When using MI2S on non-core LPAIFs, the hardware can only
fetch data from the LPM buffers and not from DDR memory,
like the RXTX/VA/WSA codec handlers, so add a way to describe
which LPM memory is used for each LPAIF in the MI2S
descriptor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c |  1 +
 sound/soc/qcom/lpass.h     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 902ad6554510..a83507c2cd55 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1437,6 +1437,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						&drvdata->lpaif[lpaif_idx];
 					drvdata->mi2s_intf[port_id] =
 						desc->port_desc[lpaif_port].intf;
+					drvdata->mi2s_lpm[port_id] = desc->lpm_type;
 				}
 			}
 		} else {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 70d64bf3f073..71f1274dfa89 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -153,10 +153,17 @@ struct mi2s_port_desc {
 	unsigned int id;	/* DAI ID */
 };
 
+enum lpass_lpm {
+	LPASS_LPM_NONE = 0,	/* DMA buffer in DDR */
+	LPASS_RXTX_CDC_LPM,	/* CODEC LPM */
+	LPASS_VA_CDC_LPM,	/* VA LPM */
+};
+
 /* Extended LPAIF MI2S layout */
 struct lpaif_mi2s_desc {
 	const char *reg_name;
 	const char *irq_name;
+	enum lpass_lpm lpm_type;
 	struct mi2s_port_desc *port_desc;
 	unsigned int port_desc_count;
 };
@@ -197,6 +204,7 @@ struct lpass_data {
 	/* LPAIF instance and interface index of each MI2S port */
 	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+	enum lpass_lpm mi2s_lpm[LPASS_MAX_MI2S_PORTS];
 	unsigned long lpaif_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
@@ -261,6 +269,19 @@ struct lpass_data {
 	struct lpass_sstream_ctl *sstream_ctl;
 };
 
+static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai_id)
+{
+	unsigned int port_id;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		return drvdata->mi2s_lpm[port_id] != LPASS_LPM_NONE;
+	}
+	return false;
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

