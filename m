Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A963D5C07
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330020; cv=none; b=dhXpNpEE5AgFnj+FgBxAW8Tt0QpfBEdvXK8tRZqjkr/2F09sHR2trJzt8FxE249U0KV3NA+wqI2PF25ZLWR8D9kvQcLCPf6kNMPtAROSn0Kj54ObaeqMLnP3aLvDpVDmfI/SkBKOJP4zmsrCgjy49+4rTrEZVeIF7KMZwLaLvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330020; c=relaxed/simple;
	bh=f+S+lTku3sMWv1vhJi2pQtFh8vgJTbufT0NBxuZfHg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ioapYPYchBu+sNBxmQEM5fBQkQRK9ri9jHpGN7PSrm5ekhBgsgCQCtQIl7690hTloFPIqajHF0JP+ReLv0+KQe8CSNmpUCqFqaX7UFbB8DtEpgtAc0HRYBYvOWP97xL4kDoofmqn4D6oSVxo8KmGYyzjUvjY7bg/eDli64TdcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzO5YQ1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emTOOoNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzO5YQ1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emTOOoNw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtlw82824137
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bvnvMxhIcK/
	+trxvNdj3SRCr8OaLPB5Lxo46Tk1x2T0=; b=FzO5YQ1U51k//B8MnyloRr6QVYm
	IFSmwaOt7YofwJ3DZnO9jH9BvXMWj+ZEk7hFYf+326aKLT41H8Dhgef+wLjGbxlw
	lKfyUP5PiJojboDxVNhw4vq5Nggk9wClNctcejWzWKkhtS4Uxt19QtEdjNMkWyr2
	Tg3h7t0BetNDxZjheIMLgwM1ltL7ZZE6YdeHVRbAEbrPUjzpW6IG+QW2mf07NwQS
	kufRbTGJGORHH/vjpOZA+NeEtzYRF1/asZyqF3+VL6F1mNw2N5n9tkbajj/H4XJX
	zsGf8Tk5NXg7waRszF1HcFB10ZZlW484JGuSp8+iI7wBUA3wzncsx2JB3qw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff813pjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7320041a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330015; x=1784934815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvnvMxhIcK/+trxvNdj3SRCr8OaLPB5Lxo46Tk1x2T0=;
        b=emTOOoNwoLzsg6cCb3ylyaeQwaKUX5evM3h1YBcL22As+VqY7PiCqBQ7ZMdtP2TmDy
         tw/hoaBUZ5EA7fY4VnF3Y8ImQ23uLZnM0wzzsSVJCBwuyZChmElDEw5Et7H4CKpjALoN
         SXFx4aR19p6CgdtbyVbyh8jtizmAuQ1SOFQnl8/2wOnfc08nniqm5q6VFah5czC064uq
         Fn2Iv9Jw2prdwUwaE4H9mL9sK9e5G0K64LhYZkjaXbQ7Y6Sx5NcwRU8Z8F5RZMDETdjk
         Vc6DDJz79tw+WI5PwPl018x0DOXXVLS+Dh9fSJOHH5uowY/iZZEOGPRiiI0q95D7Se88
         yS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330015; x=1784934815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvnvMxhIcK/+trxvNdj3SRCr8OaLPB5Lxo46Tk1x2T0=;
        b=YZckdEWdLB+1xgt6X3Hz5gWk6ndd107fwwkYjy9If3QTw2FwOojtcOAJsQOxxaHoor
         jiZ5692CtODW9P8RZwfUJL0+jxI2G5xWSXCI94lquu5JJiyWEk2TGuOrflIxi+lPhj9M
         BIRs5EoBZxq1FOHxB1hjaQoTtrZ6FAno+P4DoUuN4612Jo4xEb+iLGgWwi/YoB1T72WF
         W7k4wejqE2AAbqZ3ngIcgoI5TROFyl6L1jK6esLiL6G7vicWAXpggJHbo+Gl4uZDtZ6P
         PP1Klrc0D7jkVAgHY5jaJdxcv2kE9IMgiy5lI+cLjhHRsBS7AetuoLj0dQp6KAvuRHjZ
         663g==
X-Forwarded-Encrypted: i=1; AHgh+RpGnoamIKWybTuMM9A4vAiIgRs4DRxLgWwzINlK/GxjQ7mAGkm5NOY9hB5DSfc0xnZfyiZT3mpVuBcdA+5V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1bSJ89fQFhX+BxfIFmQtbzimdH0fmDNWDdGJhnZENQJxKQou
	5a72WuiAdNGIwRn1ElgwFYjnrt5Ambvc744z8WJlcA2bB9s6RCvzdcy/IW6YUNZLlyTEPjr2Ls0
	urvcpdvonSheTsLCVMAGwLHWw2UjOLoE1EXeoY3/3RSpQimEuoD+UlRoG3Mf5QbL9D1NE
X-Gm-Gg: AfdE7cmTcG5TmYIU30I2Mb7L56+AClK1HGgtRbpfrLzRo0F9fzApDaKOELi2LokybgN
	e8B7wMp4iuQ6t28Iq7j+Vhs/sbjIg2UCMwxzlB0Aq8TgHghQwhMlYlNlhoLG4T8I+x5IKKsaSti
	3VcTyrjadT10eoe7czNUP0+wND/FLgEKbonziXKWm7kN86j3T90q4+Nwc/4c9YYUchL+JW9Zx/L
	R+mU7KcgxOedKsbjVbHKthSm9XvlYRjfaioDSZfqQb5TyCmVRTKVu5TZx3+/Sh3w+oIJ/dNprHj
	xW57IUMvFc1kx/sPP2Qjq3IF+858zhnEdjpyAWpqAHwoF4gJ89DrYV2Ryv39iW+15KW5IG2AcO5
	4id+8MLVZyGLaJcmdv2gjTrBBwsXyUni0XWCKJmKCkq60mN8wOORbqKQ=
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr4923929a91.23.1784330014957;
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr4923900a91.23.1784330014522;
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 2/6] media: qcom: camss: Prepare CSID for C-PHY support in gen3
Date: Fri, 17 Jul 2026 16:13:27 -0700
Message-Id: <20260717231331.1229693-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5ab71f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tNMExdcoUpRSOsAuOLEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 4IOamF0DeGnTRUTtjuUhwAfQUrH-7lfq
X-Proofpoint-ORIG-GUID: 4IOamF0DeGnTRUTtjuUhwAfQUrH-7lfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX/43tR+Fg7iJ8
 7jf/CEWTwNFTv1oMdChNphcewUL7bpRsUaq9UE4Q1+B7WVjQfPQOlgT+ubiYKkkJj2Hl/h6fvcW
 98cnUjJoDlufJuNP/41hxCHqfjUwk03+yRCciE8+Rl1wqa+RnLTyQus1mGd7v9TvKDFcdKXmpGk
 vjwRxhEfy4Sg+ojm0aDs+LPkdlNgp73s2LsXPtbM7jhx0BQa/TVk8yoGhQf1E8NlGbxK6eo7nGp
 YiOFdRZbgp13eBwJYIIqLcN9J70I+Dpoc72cUXGdM6tQuTboiE/blohJfwASEhhRTnhZke3CYng
 WjocgfPlLF6CxQ1KQgIkMwMlon7VxzGZoD+48R0PmAPadupYJ1DVe8zyAav3hV9HJWJl70+U+xP
 zaqi7a724XE9S6VNRy50F35eulUJ/gZIFVE3PEp1xEcQAVyeBQTawvAlr4w3DaNJYffeOVUw4a8
 5nLc+MKftA1j36RPtuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfXyFk5oCKyn8HU
 W8LnBVWpvxWsbHoyNA10t2mGlOBu14o+igfx/DTwqjJGiyduMzeklCYGby3fNhIiML2BqT+un8/
 roMwPGRVkqugwTaxA5K1v90VlEPoe9Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170238

From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>

Program the gen3 CSID CSI2 RX PHY type field from the configured PHY
type. The RX path needs this value to distinguish C-PHY from D-PHY
input, so leaving it at the default makes C-PHY configuration
incomplete.

Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..a9c7934907a8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,7 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
 #define		CSI2_RX_CFG0_TPG_MUX_EN		BIT(27)
 #define		CSI2_RX_CFG0_TPG_MUX_SEL	GENMASK(29, 28)
 
@@ -115,6 +116,7 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 
 	if (camss->tpg && csid->tpg_linked &&
-- 
2.34.1

