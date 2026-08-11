Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E042A144
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440227; cv=none; b=KaV5NBCTCFxYIGirrFwuUDWSPHq8k8bd3Szli/GKcoRvaXm0PWwdZOqgX3LAv6FlJ6hPnfWjwPz2W22bzBQlPNFEru7X9tdCnvi4gDnGqI5H5s+kkE4/Lb5hvcsFDscQL7MqayP97jy7eXawyRNsU+F5Punp0M873BbVqry9KxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440227; c=relaxed/simple;
	bh=E1LSd0tr6EPYyyBJVCc5E7JVFZv4xNwNT/Cb31enh8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwxkC7IG913u4FblUwW3xlmrNcWI0pUSqXAySNhBYY7hnf13pLIuTMKrwSA9ZO39xpdKwJ9flElxUsm5GKhN4nLmBOME0sQ2beK0VfCMah8rWQuNbjvaZMJN8cFOpyu2BIRVZ3K8yeO6Spd3iQI0RzGJW0RdUDteCbdVBq9jlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBYFzT+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzXt1VHm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBYFzT+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzXt1VHm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7AFVn3315113
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3nl5AHXy/u6s86SN0NEqXaZsV1/Dw8g1zz/Exu7ZvM=; b=PBYFzT+skc0bsFsB
	SIrAiCcMvbO/1s+wGrVYtaymw46uURmhbaNGO/uSAh+dRkUpI/4tyedb3MibSo4N
	gs1v5RE3uxfAY1Av7wSncp6XAr++l7e+Ut+7x2IC7khkeoyrE9+MzIPFmiROzDob
	5PWEIENWYFB8sjhLVTiHxBR5kuDZpPPbc8iVtBbyzSOPOxpVG0wR2nNA22oSKpSn
	+c77OyXmVFjq4+avEnxQR9P7RYl99qaxPOJltVrikiUkWrGiFqGM3kSmPIdehyHk
	FWXB8yperc/MPf9CsO53NdbVc440RCfmPJn5b7j1GkoqpbPuJLw54ASbbp3i0c7F
	QB8kmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfubcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e6d253330so931944a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786440222; x=1787045022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3nl5AHXy/u6s86SN0NEqXaZsV1/Dw8g1zz/Exu7ZvM=;
        b=UzXt1VHmf6ZEgA7kU58Veblgkm9K2knZxnXCKfAUMXb/7n8087CTLLbpscdpFG5nua
         wL0HYooayMWKCrTPwFG772dlCbMDpQLAuQMxHFOxx69OFcGC6+ZqZngCyACNZ8lHFaj4
         X8BJCq4gakut6BeEtq5JOjF9x7Uoa31i6O7JfagRmuAu62Lyana8Z19jWE1CUmrnle8i
         f43QBQtu/z+tDPiLiorFI/eNQIvUXSYgM99HTiDCsyoArJwO/c1K9USKhbSEjA6aubrr
         VrJg/kAWLN7iBjXuLdeeBXhzIO4Vp6YlzOlD/RyzPvEP+ddFpKkA/v8Pmwt6iPYIuHdp
         hnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440222; x=1787045022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3nl5AHXy/u6s86SN0NEqXaZsV1/Dw8g1zz/Exu7ZvM=;
        b=di1Zzr6vAlqisipb5yVxYOPNV6V1mWLHSi3Ogj1UFYmTZGRe4X3gS636cvmL+oIu77
         DKpunNjg+Q5Z5q+fZLA9jxwe2fWQTGM6zz+qJUqaj2ppD2zdBrlv13aJmbF/TaEsc3Rr
         NwQ7USYb5wmcVxSKGhIKkOQTS8/vD4UCfF/wJ4v7FHSNj95kQtIf07hWohs2/C+N0P5v
         SYRs8HRYJA0ElRrBKN6f98FiID5EJqqy5nLIt4KbTYlncwGktvrszzV/zPVB/+Q23DJF
         oQNfk3EM6sekgmPfVn7B/q9F67jU6+r+K8KJx23fW+IyxuSgZYRKu3TTz3LxrbX/0p5c
         k1Fw==
X-Forwarded-Encrypted: i=1; AHgh+RqZqWxD6xzp+8yNvqM2n9wSw/6LcR6bzrdtuyv5XGFvlx8UePn2d1Nw3pQTviesiAUNYp74QSA0yxcUQ7sM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMjKPCol+dYOv76KzeoMGlHoxhpYA5xLYSkoGT4AFyBP12W3s
	yA66iFNLeoaT0CWR8cGu8IYKZ2L9qEEqpxl4BvOcHj+FjcMWrKDBlECCPXYJiE+IlycttAQvHIq
	K1U+RIloNaw+brh/2Ilkx/O8S80dtsTIuqCim8CZqr3xVVerogrJ5W6XdfYz4eGrscFwj
X-Gm-Gg: AR+sD122tRoXdMz1dmSm/2QrgE6D9wBsivW5kOvfWsbGV7lcvbKyay39hoAkYHwPD0z
	Kg2KVz0IIZ2cELCdJbWbXjWOClKi2QdLzZn1dpSMI752hFdn7/f8RwksLEmSphozjLeAEClHKCd
	/mlCeUaLn/CNGNfBWi5d7A/VN5x9jUoplX9lFqEiTp6pJRQWRjmVRpXPnZu8LezCdGBWAeNHkEt
	l/FlTx7sr+kinUNlqH14JdNO/VXqyGhuFwPrWxsp2Niq1kNB4yTIppUdG1NLPSyarsIN6T7oxwF
	l6kYnqyc/KiEI08l3u9RnLjTeOBs9HWHLsu9sUapc6D61SuP90KgJIOZvkisk8TiFAcuaRYzNzO
	SYaUbxM91ZhUXFWLcxwohJ8y3DJWGyjSKaeyMXCnXCByE+lnylz+UPZzDw4RMZjsAGMQHFnllkV
	ZCSjYmf99xME5IUIwcKH0cCEn3YaW2r5ePDI0=
X-Received: by 2002:a17:90b:390c:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-392ed1ec024mr982917a91.19.1786440222306;
        Tue, 11 Aug 2026 02:23:42 -0700 (PDT)
X-Received: by 2002:a17:90b:390c:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-392ed1ec024mr982878a91.19.1786440221838;
        Tue, 11 Aug 2026 02:23:41 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14120447d8esm3385004c88.14.2026.08.11.02.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:23:41 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 14:53:17 +0530
Subject: [PATCH 2/2] i2c: qcom-geni: Add I2C frequency table for
 firmware-based SEs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq5424_i2c_scl_updates-v1-2-bddcb2ceebda@oss.qualcomm.com>
References: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
In-Reply-To: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RkX65_8bwwqsECtrwdRJeIBDotwUmdxp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NyBTYWx0ZWRfX/pGvqIKUZwNA
 dqocmFWQehWfmNJtEMUFjp/QVVrM3UwG3fD3exlNhOlTepcGxUv5Lm71v3GDz0Ogb+h9DF6Yl64
 yxc+2eaQo4AY4Wvn5/sdK9yNvGVvLIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NyBTYWx0ZWRfX6SQmzjn9G0pF
 mm9mR57M0rz9DWONL1TZ/NM2iPf3M0pdZe7H/a4Novf012ek6aZ5aRpHBtQMyiTEmWApdUY7bmJ
 Ek5/+xJLwcY8iXXa/MniTBhXbrszmupK/dG3RgSvC3Ce+mKknaLRxTB6DSFo3vJhy5CuXfbABe+
 SjdLESITcTIKabl1/GAYTUHhCO8k0AUDa7M9Rod/cvUtoVQ40Ugw7wE4/fVwMKylzFAdEmDpkrF
 pkbX708HTMHSA9i/BQf2a5S8sTYq++pQYKVJqrA+vHyNjCNkVGzbp3Zk73BQv5Yokxhd9S09xPU
 vLeJr342ls/itfP3zWsk2/IB46njdOfYgkj2fH/vMChZmhlxSBPhtwrVFgDyDE0inPTGYUFrLtP
 XTzs2cvi+xUZiQPlikG120ePEPmNk9IAoSUEm6coO6P/PYLZ2PUSchZ4T+SzlTaklzjGJDh2lGw
 XSHvOK0Z+St2iirAK9Q==
X-Proofpoint-GUID: RkX65_8bwwqsECtrwdRJeIBDotwUmdxp
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7aea1f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gRDuyahOx82SaJh1DHAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110077

On IPQ5424, RTL-based I2C can be supported by both minicore and firmware
based SEs. For firmware-based SEs, use different SCL settings as
recommended by the design team. Introduce a separate table for the same.

Identify whether the SE is minicore or firmware-based and select the
appropriate frequency table to achieve the desired bus frequencies.

Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
required clocks have been enabled.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++++++------
 include/linux/soc/qcom/geni-se.h   |  1 +
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 00013b41a6f5..2f3026602c0c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -194,12 +194,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
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
+		itr = is_minicore ? geni_i2c_clk_map_32mhz : geni_i2c_clk_map_32mhz_fwcore;
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

