Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2DF433049
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905241; cv=none; b=toZvn4tKxwlqGlljCuJHfAWddEJ1sBO4nBZry98dJuyDAvJajZ7+74TOjGq4sfF+KZZJIwWLqdrz4hiGQgtek/htMpaxsQ+nyzxG7s+RcbZIeWpqNAAndNWVihZ8AJM17xjm+tQfOw+TVnr5b7Adgs48ZwanOdDlK7awnBpIKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905241; c=relaxed/simple;
	bh=KJR+wN2GxxX47mMq0L5v9qiUYbR7CJ2cgzDyV7M/EXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQhiD2PdDnxfTgGeufUBb3Z0m88ldMvyvDlBYHBVwsTCnBMIzR/6NQ3IOhT+Y3uErGSVusWY9WtSo6Nnp9GE+bRSCULNST4K4mbHPlJMCJlLjJM2foOaiwldz5WpLXDUSA5XfwpglCXlv2QTsHInvxazZdNhvHzCo5hGwmkgPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hApBTm6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9hPUSGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hApBTm6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9hPUSGy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbOuM3335800
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=; b=hApBTm6NRVZ5bonL
	t0SelTEWld3+JBuSN7edbMk4LzTdiIKKP9gEAdAE3zJWBDHLpqNVaWIz9Mcec9Hf
	OUSEYb7PIN0cWGPymrM4E5WQsYo+necrHAEJ6btHwAMgR7W6nUv2X6y+RZQUSL6t
	+eKaDw4M5MNwap5fBvX1tPqe5ZtnP6/aTsOArNNNTm4E7EZSokeNyRVUtv/lFX4C
	dPFyJV9+Qqp3g7i+mXESUxfun/awAac5d3t8d4sPi639P0leVRxkqmmsOGVGLPRD
	LzpsABYmDdxs/ahRfKhibYnIif5+BgCrM4G2iQj2Eg8DaLStqJ7HFZh6H1S9Hzzq
	jYHqtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5bys87a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso16660395ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905235; x=1785510035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=;
        b=R9hPUSGytyK3kXT/JE+5DdNWDPWNAltpnMORtwvXHfUDfE9sTEBI8g2lagDN2+nbmN
         r9Pu56TUkxlUmuCsjYxPVI1RC/LyFcUAzTZfJ2yxhhl/bVTKje7QMRtULekmXrTZcSoB
         hXUa/yrz3UpaK5Jj/TKGCN7YTO0F7Kx/BdavtXPiXM5YCb+gAKlCoK15E1l53p6QAUzZ
         yu2FO1/J525cPk9kc4pfxq9j/0r9el9tEvq8Nqc02b8EHfds8dunsGrLshgw+yjZHewy
         CVIjYaziDyZq4KOv8svFAzbt7yRP9kDt3m93yWIIFc4MHFDNY8vMIk15fIKqs+vCrEG8
         O2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905235; x=1785510035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=;
        b=SsSt+eN0cbODVCLyvFngpVYvREpTkTSSWxz51P3ooP4dlnvcHyOA69R1x1hid1JGEj
         l55hJLGm2hk3Zp7apV8iL/Ohx6CTrcyLrUfPdFjoaOaEPt1ybBkUryc3yOh1EpVC5ipY
         D7jL7ufG8JxaAfy7bjrxbR7QqdjNPVukldtR232wrvPDvN/J0dIObn05Ph4vwAVsPPWa
         v8Of3N3uBtavC2u2Zv1Pml24QF8Q6zPNxUeyLv3ikxn7BkXPfNatdOLrl/zjGESW8sla
         5/LFLoaciC/NBIOW0ajyl+M2ETgfcylspNU3xUeZBK+ww4ES+b6qqNE3p9TAupvrRQ8h
         kCQA==
X-Gm-Message-State: AOJu0YyUyx0XnaNGzGk+zs/SK8AzxmM9tWMdgOPhh/RBhWyTC7Pig0B+
	fH8aVsuTo+QYd5uxYl7uRjFUhD980n6L+xgzwVSjGqYTuCEf5HuwmxPdACpcq529cG0TnXuCqO9
	Gxa9aa1ESyEiiHvyK2nOhsZNg+/l4cKYwQGF7SB8VPXmDa9/GIPzIRkfQk3EfUXlCMjEo
X-Gm-Gg: AR+sD122KFrNLwjFcDKxIojS0vPReTG8ltajnqbpP13X4rHGht2JwtK+uLppsEztc7X
	PMBhFAt5pZkKBpp18PCfWalP2Q0/H+FQQzeYILbSb5yPKrHDoeBBebJeKB1J75Pz4ceVNxO6X08
	JBEDq1eXsz3uyKQ3uNxlA05WjIO6hhENiUG7Bz8TwslpzqjRiAwggfeZAb6qZF2FVDVQ7fHBayO
	M6Y/pnf3UPnAc1XgnlVhftAyUOkM2LqHrYn8rUnQK5g5FDXAmvji6TMal2x1OfJJ27kr46EZ3kt
	jrUhQA+iP2Px68BWENiUUZg//vBXXILAeHpZf/GBY0Zj8G54a9ihddVTPkPpg7p30D5CSmtweYK
	Libeepv9eUMY8ZJVQ9TU50cPz9Q9mQJheTME/b54JbvY=
X-Received: by 2002:a17:902:e884:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2cfd70c0993mr8093395ad.4.1784905235337;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2cfd70c0993mr8091595ad.4.1784905233416;
        Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:30 -0700
Subject: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=749;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=KJR+wN2GxxX47mMq0L5v9qiUYbR7CJ2cgzDyV7M/EXA=;
 b=DRoCiALCPxHYfgApbZY8XM2JEu7UnvsJshHqGT5Wzcb0/ZfKVMybazdkOpoktKJK3sfTwIBlt
 mczsdlNRSK5AAwf6i0VJOS+7oLLv7ES55kGeFe8h4FmX0gyrKoKu10u
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: 8Ahx2_29npTmWin3EPuJpOxQqkpcH1nh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXzusVebmMqgXT
 RCzjCRTt07PJ+LtK56t84JqLHPZY4N5F6Vv/mmn3gW7w7YnapBK+AXMVi0S+pgWxZP+823xmNOQ
 Exkq6OFfiBFUzQTqig6CL/q4YTaT0R4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX74hVRIc18KYo
 7OJINs66VGkmwdAjR3XBZcZ1ya4Xcn4LDyu2JuocfLWdnzJlYMh6CwO2FlRs1zB3O9h2Jd6+0VT
 UduwRarLx8+kGkODeNaIJNv3KQiabMTNjhQg52ji4km/x+v8Qw0IjTKXnrKdkYt4mvxoMH1Hb79
 859A4tR0B+ldQ8y+CCg2yQzjGrmbsbUPSi9jkv5CiJfMltC6Ql5LliUqZJRweiiVzY9iIfxNrx0
 rCZf1MyIwMKQpsJ++Sie5eVqf0mHIJYv628zdIvzPEQl6tmzGQUXxwt+iVWBF3OKuqAt8hFHMSe
 WQghyB4lfqgXXHZMuCJ0x3144ewqvsQb8MQ3jIMvlBhjqgZ3ru1nONjiCY+1F9HrzaGJAVRE13Z
 jfzB0UKMpyWOokOTDQ3cw1WKg8Sj+Poz/cZNlIqsqLmaKRECEEiWnq38hC0uydSAs2lnFXhiX01
 n/9Myfo12XQ0RSCQiEw==
X-Proofpoint-GUID: 8Ahx2_29npTmWin3EPuJpOxQqkpcH1nh
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a637e14 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Lly5wiSg1jk5MYLGpuEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

devm_clk_hw_register_composite_pdata() is defined but not exported,
preventing its use from loadable modules. Add EXPORT_SYMBOL_GPL() so
that out-of-tree and built-as-module clock drivers can call it.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 835b1e4e5869..11842bce5918 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -462,3 +462,4 @@ struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
 						rate_hw, rate_ops, gate_hw,
 						gate_ops, flags);
 }
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_composite_pdata);

-- 
2.43.0

