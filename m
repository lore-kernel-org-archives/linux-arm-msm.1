Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4523AE6E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523477; cv=none; b=YxxONuldJ/pSDOxZY1znCFXp+x/jFY0TiDHZwf0424f/SeDsFhCw4HMhTHxJFIJUUa8UoGgJXED+WDx8m6KMWxSLOIKrtmEQfu/x1RvSCeymuaz9Px7M8kjIEvUo+BqiWwxBr1T3ZSkwEGkMQK38r1lK0XM2cT3+JQ+W/Q+6WP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523477; c=relaxed/simple;
	bh=B8Mh6BmknBlOEVAgLFsjyKAx9R1jHfonbEXviFE5c24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYRg1gf9KuQwT+FxzjWYkBnNNb+WzQuAEpIumEgmGejEZnDrMW0OcmYfC0+cX3H0ZwnwTnPGGuYniU2Uvorie/+3aaoE4qynQVuoC4FpfEnpy4yjuVMmdWwFrWzEnge79i5KRuyDBNttDCdJ4eKChpbKajvBFGJXN2g0wipgcyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Frrxn268; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwavbAlV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Frrxn268";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwavbAlV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62A1W4090977
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXDvboPebWZ8R+5YyN/r3qjYk6p5EkBVjNTC5QCc0xE=; b=Frrxn268vcNiEs2O
	uawq9yXud3UYWOW3UTJoSP18ohnprgJCUfNCIHUBTLO28dVrecXe1whtX4kgC16+
	xkAdOyOrf6wQLPtXtNwGdq7JDoDtOy1BjoxYNNVFplokO+whlhSq1TZqX1/3GppF
	Mvmvb7gJFldKgn6lurkBoLUXqWsmknaNmU/lGB5hvUb/FwzOIhpmX+0kCzWHqhn+
	yPhwR/CXmzaLzmn51sd+VBsX+/hmtFOraKqePlAuGpvWLbSZKc2pnEezgaz7F3gH
	407DUd2qXW7ktlcxfqjJowCxQzt9+c2RQOAwvI2lGutB+v+c0y11uud/9beDEeYf
	OooccQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049bv9mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:31:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso609411a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523475; x=1787128275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXDvboPebWZ8R+5YyN/r3qjYk6p5EkBVjNTC5QCc0xE=;
        b=BwavbAlVm27x8S1TKH5MXkIKGfFjF0ozTcMnOwPiRNckLgV/eQXSOULtOscEm5IMw0
         YOBYWD/F0zKEuGzEVPFXzwSKhlX3bmuREolTdmkZ7ndQsMCn+CRvr+eEciSPdk2wq5qd
         NLPa+71FWNQQ79oxZhqf358OzoE+HITMliUOoCouamIfbq1vA1OXoBzRN1guKwt6UWEK
         bBpQTkQB+jFS5nSjSqG9yhUBeEIFbtC4/8T2ail2Pe1TGFuxuUXL8ZB9hknUBthHmyuJ
         S0F4o+GzSLLefvis6wmvTFVweXBHiVrCFGGQvXZ933mghklukXAeor9zHfgsKNJfhWG7
         GRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523475; x=1787128275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXDvboPebWZ8R+5YyN/r3qjYk6p5EkBVjNTC5QCc0xE=;
        b=c0Mk80z5Xr/kzdt/rVLufB0CLO3x39AC/oKCUSByIC0aseVdUoXh1TQjUZ+vvjtUb3
         TtiZ37Xk/qDZVAmAOmhF/Jjx7JDLxuZ/2Oh4w8kelKqsu5Jwu1Zx3E2AJ7eC5IEx1nXI
         3VW+j84PkrOmCdHPpYxS+a3pN/1f09aWzXhPbejVH0HJtKcHuhyE/rJ50Dxp1UktEMuq
         zwD+ixc9hpDdthz8I3UEnCjl4jOi7s+ftzMI/GPOVAbYaev3ow+Hzg8tXkvV6481ugNa
         8v8EbU071FnbxuwUyG9orF4aZgwk9OJPw5JLq3/pIfYnBp0mSLw3k0bCM9MaYYo5bq6Y
         pBGA==
X-Forwarded-Encrypted: i=1; AHgh+RoKssCkocESPZbsCALzzcs3A/DdTsdRUH3HvH7w0WY7VkBLKgwDK/6yKBfT2sk3mLTV8+n35Q4MI8ztJW+k@vger.kernel.org
X-Gm-Message-State: AOJu0YyKG80lB5Jy6bwGduph+uF5nVq8VsHG7tS1hoNkuGnk3GNx31rs
	EJPInX/IL+A4s/jltYoQ1BixJH1+wkaf/VGuhBs3X6tVqCs6mPp7vdypynZgoCFfv5TLc2fQDcr
	R8WIQ/4p73MUQQa0MUEs69TCyytjmzxXpYUy3jr5XHP9UAhfcNjp75GPVjHVKY/N83cMj
X-Gm-Gg: AR+sD124fsg6xv1e5u/5hT2WNiEzgZN/3GP3Mi+HIt4s/c5P/eLoXR+0wF/YFqwMGNo
	CL9c/jCE8iAPmsWz7XZ75uKWfksrwOadFCfetZqNR2cZ7VG8tGnxMj187XP15PrfXbRTC6rWHwS
	WJ+up+zJNPQJgIVh00Ex2iJLQzGKeG8RP2L1m4ZkAyQQeJA4D8Ijb4ULiWcaNd3FDynGpiulvgS
	cVwKzE1XV5MBrvBAietggcN+wjtSxRLUWc/offFf2zRsFz+MFZ2UVsGiNmn+pMM56hwOo5ae5h0
	Nc3UcHP9wC8fRRJX3/n/dpCKSE2qlPNFoL1Pp+fnCRQj6/vbsM3d0jsDwQaTZxT7K0xyrjFEoc5
	D5uYSK/FF8JK3YGI01SBN9kqtOO+lhCwHxzXR7vdxiI0vhTnD7+S+XXmucxZ3hSoYKQeKjF4ZjY
	2GZlQy8pJ0Csk27R6KqnMIxIvbpsqeO/AhFz0=
X-Received: by 2002:a05:6a20:3282:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cc3f7c5b55mr4165075637.30.1786523474631;
        Wed, 12 Aug 2026 01:31:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cc3f7c5b55mr4165016637.30.1786523474207;
        Wed, 12 Aug 2026 01:31:14 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141245a9f70sm9942865c88.15.2026.08.12.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:31:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:00:56 +0530
Subject: [PATCH v2 2/2] i2c: qcom-geni: add I2C frequency table for 32 MHz
 firmware-based SEs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Edl3WbnLZfFiw_jRWgQ4fP_gN7kUGJeL
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7c2f53 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZgzYBJRxMK-01OSQGPUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Edl3WbnLZfFiw_jRWgQ4fP_gN7kUGJeL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX3ecs7sk2gtJ2
 TgiNUVnyOFSHGSlp/e6UX+3f0sD/OYNlksYN26agtPm6EkTVMGO0DeJV3tjW1xRLLEPXqvXuUch
 C2a+mK/Cb57sKG5btem2Ft/SIXVHMtucDUg9cprfy3xuu4rOxWBhXcEHPDq9Ss/ErRgIbo4g4mT
 EBZvOFduW1dCHQ/G1x4pJYmceKCQxdwidOLl7Np6+KuKmtVvPw7dlttDtJATN1YQkVXaCVVbmRi
 8ZIv6FLRBy4ixk38nQrWOF21KhhJiODy9HyGLyBFnVoiXRQiR4gsDdUMinju4IkqDfh4W6mjRu8
 DmPRnPsbnxKUP+vbnZYVAQA2rMyQprKCBDd+tCTkbuAbrDH7OtUC2bGOB/jx+nKN1/C5s2vhPMM
 bVvS4kPnY8nAiDZzfivNpLCYuuunYpVysWoo4E8pa8vkCKJEZhbgvUfVG+pBBk9l0U2hAw5Zvpf
 V0srnsHjKwV1/WudtBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX8gotKVTs8RGz
 dX1j4ficGRf2HlRtaL7XDAFL+jSRkqjoGi9OpKEhrtFrTpqP9uwsxueYX/l28W5bZjK4+v6XuTf
 N+sh7pf8QWQF0uZrJcu+aUSFiNXjsd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120067

On IPQ5424, the I2C controller can operate on both RTL-hardened SEs
and firmware-based SEs. As documented in commit 506bb2ab0075
("i2c: qcom-geni: Support systems with 32MHz serial engine clock"),
in IPQ5424 SEs use a 32 MHz source clock.

The existing frequency table does not provide the required SCL timing
parameters for firmware-based SEs. Add a dedicated frequency table
using the SCL counter values recommended by the hardware design team
and select it for firmware-based SEs to achieve the target bus
frequencies.

Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
required clocks have been enabled.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 25 ++++++++++++++++++-------
 include/linux/soc/qcom/geni-se.h   |  1 +
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 00013b41a6f5..15835f10b062 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -187,19 +187,28 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 };
 
 /* source_clock = 32 MHz */
-static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz_minicore[] = {
 	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
 	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
 	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };
 
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz_fwcore[] = {
+	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 25 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 18 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 6, 15, 29 },
+	{}
+};
+
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
+	bool is_minicore = FIELD_GET(GEN_USE_MINICORES,
+				     readl_relaxed(gi2c->se.base + SE_HW_PARAM_2));
 
 	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
-		itr = geni_i2c_clk_map_32mhz;
+		itr = is_minicore ? geni_i2c_clk_map_32mhz_minicore : geni_i2c_clk_map_32mhz_fwcore;
 	else
 		itr = geni_i2c_clk_map_19p2mhz;
 
@@ -1046,6 +1055,13 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		return ret;
 	}
 
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret) {
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+		goto err;
+	}
+
 	proto = geni_se_read_proto(&gi2c->se);
 	if (proto == GENI_SE_INVALID_PROTO) {
 		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
@@ -1109,11 +1125,6 @@ static int geni_i2c_resources_init(struct geni_se *se)
 	if (ret)
 		return ret;
 
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
-
 	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
 				  Bps_to_icc(gi2c->clk_freq_out));
 }
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..7e8c0bb6d674 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -331,6 +331,7 @@ struct geni_se {
 #define RX_FIFO_DEPTH_SHFT		16
 
 /* SE_HW_PARAM_2 fields */
+#define GEN_USE_MINICORES		BIT(12)
 #define PROG_RAM_DEPTH_MSK		GENMASK(10, 0)
 
 #define HW_VER_MAJOR_MASK		GENMASK(31, 28)

-- 
2.34.1

