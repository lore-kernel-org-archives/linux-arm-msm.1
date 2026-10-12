Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CFD477293
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807640; cv=none; b=e7pMbPpKrkjAqBuxzmdCBxNp36ZkliOCMizJ2Pns61yzshRr8dabPFuOJpFv4XIXImaSPBimWwFiLF77D7G7TWcGZlUIubMa1LIBLTEWHKK9FIJY1WWsC5majWRNsb3SmyH34GEqRXwjILsyFD1gnzv6un9g27WiGotdROXhiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807640; c=relaxed/simple;
	bh=U64K2poQMp6VQd8aVBCl3XL7cfxJ0PNw1WCfEd9FTIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDfUgXX6yw0Q5DM8v1cDHiwB2uLEniHto3ISQmDoWPqXOb14orGesiXiXIMDeKsgU1HVgdqxZXjVLUgtctKaWf1l1PWWmUgBLMtfaWooGXu90qnOekgJXC89O6sf3PZS0T+Whmm3o2VWmOllu63pHEbqhmzWOWcOKY9mk4bMxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hb9SCpvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgQDy6uE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hb9SCpvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgQDy6uE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxvZd800778
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLztm++Njhd4pXPyAbFeeqcu95PDUfVugeFnjo+4eAk=; b=Hb9SCpvcaHPhInbL
	eFtl0Af/8vprbIOEAeM3n/9QnCacgHC45wDU6krcv0XJIuehd1mwAeH7T8xkpiDc
	poGBVXWKynHV82ujI/kOEm3FrM6tBtzGsLfMJBc2apMxLWu4qWaqlKUDHUhnp5Ln
	PTpaurUOO9BLaWQ0dyvfZTqgyxpDI4W/vcgQVyylMgVOy1jv/rVqfUGUkcBy9Ejr
	zeRzbjWVWaAQLfRbavh4hiStEcQwPKR6SWkAlTRfg8DfB7gQI1Yv1y8o5CP3GqFT
	B2UYzwmfn5yd5GZr4x6ZQ+uGL7sWeQgfO9T4blGWYvPvn0b9Hbx53dhiSQy4+7jS
	oAfm7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrmdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:20:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso4123412a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807636; x=1792412436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLztm++Njhd4pXPyAbFeeqcu95PDUfVugeFnjo+4eAk=;
        b=QgQDy6uEh/b9P2mK/2NVel9ex65Bvf3gjH/OrGrCLPcSRpnt1hWWLjo0V2V8PCe5Dr
         UixwoYrwKgCscmlZwzjrfYICHCwES/q6F576m+0CUDgcrxCVCq/kvU/oUslie37A2Sbq
         OJPC5cMMAme6oojgZC7R1GlrlgrsUUIlpwFFTiqGNoWtzkI94AR9nQDKzQ05vE0gzley
         vvBAhC+KegeCwEayph4+h2JkUO6rGgLVf7m1wUkXkajI0SV0msuBBjs7PbBTjoHmfg0v
         jjXOpTnmorDJ4VkXiU7/yJoId9NN+rTuigp5mE3DmX8D2IfFhZX8w2fAw3VULOM9s4rW
         KcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807636; x=1792412436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLztm++Njhd4pXPyAbFeeqcu95PDUfVugeFnjo+4eAk=;
        b=VMYO2WOAf/VZEIE8DNk7j2UX4swDDzA8dCuEk3YtFjRzcuR81z6JljWV4nU2jyTeF/
         r8TczsntQ6oH08PChkABF+z+Yn/Qtz+NA2g1hvaCLe1DuEOlfzY5HIDCCVXU+24A6CLv
         4im9Jy70U4Zw9ogApwfxMU56YnGQGIUfgTHoHxVUK1tbDn/V6jPR2GC4mjxG3KqWilIZ
         RBqeK/DgcT/x146BZ6uceiAR3dR5jD5Fg0ux3YnGNau+flLGSIovGY9TcHPuO/jYQMVc
         bttlKI3FvIIuqSVxPFjISWmYuge2D5U3LtZVFEPGTXSP/z6zHZ2pnLaNi3FYcgsPdFBU
         4HbA==
X-Forwarded-Encrypted: i=1; AKwUvBwiGiRgzbs1+lyFM96KIx2i3brcjZc6gLQSwEwjIKPCdKvTabFnJm+fS3LKJCkVANFTd004Xx/ziw/pZxCv@vger.kernel.org
X-Gm-Message-State: AFq9FYJrJ9LA1yB6HUJEhf+YQE+aolVkoJYS5+Iz7uheHUu9aMI2H1z8
	smLkmjLTRc5eYA4c4HHQXdsBUyybBpZwpuDOEHQM0BzGDvIvZM60BRpxAmgTU7XJEofr0M8o35F
	pribvq47lFix/h5hfGxZbE26lDV/RoSLKR6fGW+ipfWUQDbZvOOikCN/EvPqefbbHL7gi
X-Gm-Gg: AYBFou0wblWO2N49NgVZ6puiqxnhXQMDmyjl6pbAN8h26cgQc/CcaB0gzHWZEu7JoyX
	J60p2aYUVAxn9KiyS1WzVoVq78JRE8oHS8lMRZoKh8pb+rQAH519aKWedhYANwbkHcjQNUsY0K8
	qoE0Rs4h8HRTg001K0eFgfC2bvae10B0JS2HlxoF9W4JqHHBQOYw8D4Y9PK/NZpj8RsVPySGbcS
	GghBD+xBoJkM88SP+v1ZQUZ8TDdPYXjlXGfWNp44n/6ExgL4TK4RsDHLAowj1nk4oZ61z5FTv1Q
	P6Q1Mfu96AteNevkZeOWUU6wUKaWI7O55EY1iPPwmsxxa6pxGMx+oLGb8xyv5C+BPJS4Sy5inbi
	yOHZxYiKEFyyPzjyqTOGWpPXWjpyEeMIY4bv8
X-Received: by 2002:a17:90b:4fd0:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3ab3a778837mr8216190a91.30.1791807636208;
        Mon, 12 Oct 2026 05:20:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3ab3a778837mr8216156a91.30.1791807635718;
        Mon, 12 Oct 2026 05:20:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm15935932a91.3.2026.10.12.05.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:20:35 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:22 +0530
Subject: [PATCH 2/2] soc: qcom: geni-se: Avoid redundant transfer mode
 selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-cache-se-mode-v1-2-22945ed0da29@oss.qualcomm.com>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
In-Reply-To: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791807626; l=2203;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=U64K2poQMp6VQd8aVBCl3XL7cfxJ0PNw1WCfEd9FTIM=;
 b=O+wuJLVkixUvOT3tBpNJtQIV0xtyyKQPyjL4PIKixVBqYLU4OIvktP19ebESQhpFHewjlmuyF
 sh2Q8PF9yeLC5na4j1MNv7VC9aGGEX3tqtq8h3Grxz84nInLgoexCe/
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: bkEs-v_MI2nCNuaoXyn9z4looF_4D5gD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX+Lymp0FSQo/b
 e9OasLbSPfw6qnd7QfQ1yuCcNkU4U1xO4qR+caXeZ8hr1xmlapCTx8wquk0ATnIGvO31t5XI2l9
 dbLG2RgetVpfZj74VuYRDSt7ZdLMqJ0=
X-Proofpoint-ORIG-GUID: bkEs-v_MI2nCNuaoXyn9z4looF_4D5gD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX5zpBD1aC2YRn
 6bw8nOH0zKiTZGfg/DHfLkg/Oxzo5uoiT2g+9ngeTgbGjPgwxXGvf4mp8FeTIQ4k7n/VPUXVV2E
 6SF9X6mB+xvylxU1xCulxZQ2GNT2nw8tS6z9CeMocLEFEHNQU+hPuI+xqb4H9bPI7Efsd7vaC23
 VeIz8bK98IGSfapT48nrlRYl+b6FypEb2e8ujS46C2GdDT+MlbjjIvOdVtsQv7ujE9TNyyAFeek
 UDFHWHuJQbaeTeiYAy/QkuG6OkJ36hkMTUMkJEJApaqhF7Nz29DSiDmEWDSC7DVRCqFWvSxpCLJ
 GPLBNSnCUB5F3gLcCq9mR+BEgVPvzOnxlqxR6hVVVAoUa+oaK+EOtVEp7b7cuE3dFcmX6IcTXdm
 5XEWnQAYb3xeD5y9lzbVZ0zvCF+ZlvvbHiYsixcljiPSou+vH1xbtnnKL/pIm11DYnF71fl+IOD
 tGfNLUAG0/fCC5sGFTQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accd095 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J0WuJNJ1EvBZ_6ANFisA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

geni_se_select_mode() is called for every FIFO and SE-DMA transfer, even
when the serial engine is already configured for the requested mode. Each
call clears interrupt status and accesses mode-related registers, causing
unnecessary MMIO operations on the transfer path.

Cache the previously selected mode and skip only redundant mode
programming. Preserve pending interrupt status cleanup and GPI event
routing. Invalidate the cache from geni_se_init(). Update it only after a
valid mode selection.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 11 ++++++++++-
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 311046544b4c..ce4de4917a83 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -370,6 +370,8 @@ void geni_se_init(struct geni_se *se, u32 rx_wm, u32 rx_rfr)
 {
 	u32 val;
 
+	se->prev_xfer_mode = GENI_SE_INVALID;
+
 	geni_se_irq_clear(se);
 	geni_se_io_init(se->base);
 	geni_se_io_set_mode(se->base);
@@ -462,6 +464,11 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 {
 	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA && mode != GENI_GPI_DMA);
 
+	if (likely(se->prev_xfer_mode == mode)) {
+		geni_se_clear_irq_status(se);
+		return;
+	}
+
 	switch (mode) {
 	case GENI_SE_FIFO:
 		geni_se_select_fifo_mode(se);
@@ -474,8 +481,10 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 		break;
 	case GENI_SE_INVALID:
 	default:
-		break;
+		return;
 	}
+
+	se->prev_xfer_mode = mode;
 }
 EXPORT_SYMBOL_GPL(geni_se_select_mode);
 
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index b3372a3147a0..f77c3a47c3d0 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -78,6 +78,7 @@ struct geni_se {
 	struct geni_icc_path icc_paths[3];
 	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
+	enum geni_se_xfer_mode prev_xfer_mode;
 };
 
 /* Common SE registers */

-- 
2.34.1

