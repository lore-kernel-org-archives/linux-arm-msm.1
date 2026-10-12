Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AFA3EB0E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807635; cv=none; b=TbfPSxXO588lO903KhbgHCW2ZvgY9McciI9rMwnH8PO5VY8/CPvD5fNwmg0FFGV2lPlw7cOvsT7LuIHVBbYLbWz73X3tW0s0UkNufCa0USy54qutzjrBPNqc/wxPpR5tA7jh/g5+jihtnxm708P3zz2Z9GuUkocFVMwlXpT5NB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807635; c=relaxed/simple;
	bh=+0cwDb9AxHxj3ozcBASMvKd1PUtKKmJ1ROtJdCUN8bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdHtQzSUZZA5wpGn3MKoB9RZdM0Rc3UkdPEdHy/pATnlm1dz/4Dqd9CHu2W9+su8YTq5forVAIwEqQ9uY0+uvYxq1o+kNe0x+w9aCHkKuP0aEuXeYTcHw0/oNaRlRwkFztxTYVcMxTmkCIQ9CrjqsbeI5WOGc0ZAJ4Ns6W4lrvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WE4VHMk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1LjCK4F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WE4VHMk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1LjCK4F"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09023292333
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xSQ8Hop+s47RdDw/qQvt2kfapWwwDpBjw3tYBzfh4o=; b=WE4VHMk6CqM4fizg
	nyRItWpeOLOooHKG39AY09lku3FgiMP3RciMkUD4mdBQd95YKjZ9dmL9GWCuHpWB
	REk+b/sTNX407Nf7E1wjRnuTRqYy3vjA08nRMP23QbIirPQzoIPz97LAyJJ79CUE
	fm5CaeAThW12byM/hdW6rlykM5iWLx3A+KDNXRvs4sGE1+rWE06DDsRCxg01SWNt
	kDyFBt/HVp2iHt2b75MShHmFt/XQOdcE6lsOCvDZAw6/yUfLKXhEMW2cdLKgUPeH
	fYws3U7QykZBWIVgBggPg0yCUV7uZdrFoJ+DXnOi6iYxfulZ56Yi6o+ei8slCLFU
	+RQb8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3h8u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:20:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so1714356a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807633; x=1792412433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xSQ8Hop+s47RdDw/qQvt2kfapWwwDpBjw3tYBzfh4o=;
        b=E1LjCK4FBRmGxXq/dkcRGMGb7OCl+51rznJtuNCmNN+ZfNbyNlmYOeg+G2WxR1rSl9
         MHnM6B531574c4yte5A7HgL2HcqEL9TLTWBBlo4jLa+42qQtyflruiySNdKy6Gdy2aRB
         kY5Wd11LxsLHlGzb1ZDaYfoM8r1K2cXYmPHQXV21v7ntPe5oIeGkE7kdQ8LkdpsA+wBo
         UUBQr38ajIDQlr3L1cXc5DiKw6sAJ/sxGipzbdZ67F5fh6h6eaYw6fNL6iygHi9PIGtG
         i6CiV2idEQP3bVW1KRTa5v5BXU4stL3M2dXHxrb3UOctNtg8cOnfgobRC2PIHE8oUCJ/
         vvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807633; x=1792412433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xSQ8Hop+s47RdDw/qQvt2kfapWwwDpBjw3tYBzfh4o=;
        b=OU1ocbUtbmxDpj5KqLbup+TOJx2tj7BAMmdrvPJhDKJHbDYFn0Ls4DLXEqvJ9GwQwO
         i8MJV8qxyvnry8DekIqPwe28IcYtl0UcmAzlz31QbbEnPQ5IVt9HwhN7gWqYlt+wI7Zf
         2fk3tKiJzJBQVa3Y46cNlke6NrMP4//IMKPYl0AHyzE+6S7v17dEuaHQ8fyg1RKV34UQ
         YaDgxYX72wZzYroRHwLHl0xr/JE5F/+Q4hw9nu+FTLMG2SHudmesj1/CTPe0YrgB1yG9
         lddSP63Av33zBY62XU7ahLzQWmXY2XcTsPveeDZtn/e67iC/5uAz1fY7E/rp4D2hNaJj
         bskQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDd5YeclD3y7zNcnxm4w29Ruqobo0FSTk1CxCziyV0F2fk2NhrtGjarFmKyWE9ZZcPLJ9GfB6BEUWYbHm/@vger.kernel.org
X-Gm-Message-State: AFq9FYKtIeqe7ZIQeJ5MetjhI65jYdAinydl/vG4UppVNLe5IIO1cK4U
	iMz4AU7jWvzz7U+PRqPDbtiNr9nLWUv8348hlJhcyH6GoYKSxDFMIkB4tfTqDmmQmSAXeRtt0Ty
	LiZg4tbS+yKte8vRZGKEJCuGvtEaNsKirJMI3C72T9kKnch0OIbEdcYwnSKeLzVY3fcDZ
X-Gm-Gg: AYBFou2XzY45WACUv/LfoZ3tdl3ZoYZNMFobcCocwfe9BaDtn19TzK6Ozach1gWv2eC
	CQFa9KtBVod3qUQzWD7vINy7NkQ1AAVuxaWwh4vkppdQi5ycPAQSkz7iJQRwmxVyG4wcdsYHo0A
	igquf6iSh4/bUEJj5Zf6bDSOpIkvFpRf7YXxsgqHs2YWNv4UXwUmT1vYEvLlHXCE5wsgzrk0Rys
	Y/40aKH488ET+MoEy94AY88JJGFqmpSj72XIqGDklAg0VyUkiJnbKoCgH4Pz5MJXmHPFj4qOc5D
	zzsyeSVK5UE09GUro8tGHYfwcXfq1HuskVugsXEFrB0p6MrVLqQNh7viIH6sZ/41CY66NgsfW9o
	r6jJNdkIfpYlZZvj7v1Tpg6GkofgYRe/juGun
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6979260a91.0.1791807633100;
        Mon, 12 Oct 2026 05:20:33 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6979241a91.0.1791807632581;
        Mon, 12 Oct 2026 05:20:32 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm15935932a91.3.2026.10.12.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:20:32 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:21 +0530
Subject: [PATCH 1/2] soc: qcom: geni-se: Split IRQ status clearing from
 mode selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-cache-se-mode-v1-1-22945ed0da29@oss.qualcomm.com>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
In-Reply-To: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791807626; l=1430;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=+0cwDb9AxHxj3ozcBASMvKd1PUtKKmJ1ROtJdCUN8bI=;
 b=7yJ5uQ5A/fZFgdklQJixVBGvjPdqlBDq6rBAk3SngjehTv9h/8I9fz9ybLywOhhSs33hQXI3v
 42bSw1Z7cE0DwBRmVCC23P/8oAKeaa/ntzRNwKRcHxptYRpa4O/io/U
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX+8INzvqLT7Zt
 /irMuSfwKiyZ29qSibNIZLe/qeH9eQ1JFG4pqO23JGVRHOJpBIiSy6TuCPbsgA+7rWG6z3RVF45
 Su/2Jw05+BoVET2fU2q2vrOTX1Oxi3qfEdlusklpBwkDP62XPSTHF9NDOqvi8KV/V2MrSPanQnn
 KO+QtTzH+h2Lcl3Uc/KkPBl0Ctk0rkQwi0nR2ka+j3yvqj5fUFTinoixpfWuk1PXWyYl9HJ3juD
 kH34FvyM1dKVhkYsRUMsoiPcbJA6geHmkqloAam4ElJzPA6Xmols4JC46yySrJ/4k7TtxQ8Hj7z
 G+XO0QoPilRCLF/izPGCyuHHKMc/4k+RHijBkEkHlcrtCNgjqTdzXaUVNmHmPfyGcZPXwTv/Np2
 3lyyPhzQqiPMRo2XAj8i6geYDtYUcaDfwuY7+bVjHjYQTE9R0jLjwys1669VO0E2m774CgtvR+f
 V4jFs9OeITNl+idtXEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX5NZ4NOaDKpFC
 EFwM/EVgyfj89icIagjROIiNf2eQugWY//MfShVpAbvjSZVSmIha8ODHkoONN1Ao1U1dd1JBH+6
 AK2iLAQZ9yGcsaQ3yJ2YJyl7i/WykS8=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accd091 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7I5-0i5XgEyiRPbWXUIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 5nAWkrNz2i6B_8ORtSE_94HO6PevVEoD
X-Proofpoint-GUID: 5nAWkrNz2i6B_8ORtSE_94HO6PevVEoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

geni_se_irq_clear() both clears pending interrupt status and updates
mode-dependent event and IRQ enables. Split out the status-only operation
so cached mode selections can discard stale transfer completion status
without disabling GSI event routing.

No functional change.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 074087c592cc..311046544b4c 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -342,13 +342,18 @@ static void geni_se_io_init(void __iomem *base)
 	writel_relaxed(FORCE_DEFAULT, base + GENI_FORCE_DEFAULT_REG);
 }
 
-static void geni_se_irq_clear(struct geni_se *se)
+static void geni_se_clear_irq_status(struct geni_se *se)
 {
-	writel_relaxed(0, se->base + SE_GSI_EVENT_EN);
 	writel_relaxed(0xffffffff, se->base + SE_GENI_M_IRQ_CLEAR);
 	writel_relaxed(0xffffffff, se->base + SE_GENI_S_IRQ_CLEAR);
 	writel_relaxed(0xffffffff, se->base + SE_DMA_TX_IRQ_CLR);
 	writel_relaxed(0xffffffff, se->base + SE_DMA_RX_IRQ_CLR);
+}
+
+static void geni_se_irq_clear(struct geni_se *se)
+{
+	writel_relaxed(0, se->base + SE_GSI_EVENT_EN);
+	geni_se_clear_irq_status(se);
 	writel_relaxed(0xffffffff, se->base + SE_IRQ_EN);
 }
 

-- 
2.34.1

