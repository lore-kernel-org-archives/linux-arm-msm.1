Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014873630BE
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306562; cv=none; b=XqJlzqyH+XbGDt/2BF4wsEyNeNDC856X1tosJGQ70QhrK9jdUFao35/lkiqlBvCbIIPaw4yy6XTWiipZ6bLablIhWuUASH3Cv6/F+OaeMhJkFsRPv24E57sm3hjBBR91/Ql1x2FXvw1QkAIncOCOHO4EGK4pEVeOrYZLQsdZ4cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306562; c=relaxed/simple;
	bh=MyFwP51+yZ/c9HWtYLGPLcbLLtgX59e5z1/cjBJidcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2obfPadyoe12haY3I3nK55R6y9HAb7I9iSeIQnmBhzoKaChDr3WHY8DHDlmVyfb/zwqG8mJYCwob7ks1tWKZDliaKn9lhMLf3DOi+oT2yKlqlw1SuAGc7Kol7DO/0RZOjxMpiE8U9sBc+/KgUfVkvmA0dj+RY0O6d7IWXiGzQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hugp1TU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7x9TzIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hugp1TU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7x9TzIf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679JHw7u3886180
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 20:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=; b=hugp1TU//+Y7E4E+
	+J0TC8uiNW79BzjVj/3E7KOXq2tWwyVHMmKhldTcq3ioaPQW0Mijz82KNAftbuWf
	kfrXLtTMtcxkD1vObp1NBJAzt7RwLppTeYiZ4XNINhj7DcrRUAVDnmJ65Saa+D8L
	LUbkTwkf+o7GM3sJeg5UqMRiFEAi8pcDuOpxW3WhEAW21js9nRAZhQpJSXEt4NTr
	3SOjF7qu32emElhcNClMJ5aTqtQ45DQQjkpx79qJ3vt4D/BNITdtqoQcEEBO/mDi
	CsxKOTF5D3Q+6hD6E44hiJYHo3FoRVqOQiPa7WcI+f3a9gXdMA2PiicJtJeZXngM
	2Pjnzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7bjep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 20:15:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-529ae8e96e8so10897391cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306557; x=1786911357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=;
        b=P7x9TzIfRX0tirM6qXxH2YtMfUkW0139G0Fu4sHZlIW5EnZwswTibV+QwpInoOmbNz
         yNLZYpiyssv7EQxtD9MJFY7CQafjkFlxsiC4cKi0YGc4uIvpY6zkwkCwRCNGlj4+UTT7
         1xLTtf/msY95r26vhvwvRbC4RD5a63gYEKwlujZzUHC8QbuNxf3PKnquLvEFQnc3bb53
         lXZZrFToOaSNnr9AsproBY7VaBz2xIalLP8jqntAECV9Hw+ef/jb1NZFekaYhPhBPgAO
         DhbZKSIiP0RjFpQJJapgEx09/DYcpAV/+khZhwCRoRujxL1YM6lnsJUL27KSyBcPchFu
         9JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306557; x=1786911357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=;
        b=He4U91OG0tFfyCW2ctCA/ME2mxV/EDa+QKmUcTWxnjIuvhv749nC67POxmSiUFILaD
         iKZlAvfVDtOD/S+BnEy5v2RHgJcRMM9ApWFOcxGzw7GwpmGij7/JojjeqHkEZ/dbqCTQ
         9PK91IMclkZ0wZ5cDpXBAwSkv6Uxk6B+0CEP2ERk5T9Jg+YUsJ+IVeNlvpHMsKh5lPMm
         LdNPDc72i9anPFcXukyZ+ydAUir/CnJznYl5loShytlIgEkVWs2SnA6T4DXyAr1fQQSw
         bHx+DCyYfxIpO+/Y6feXE04YGH4bxPcuAKO01Bfs/CkgvP5rJYzAkDkowifz7LJbAKUy
         qJ3w==
X-Gm-Message-State: AOJu0YxyX60MC1MjmTb73S2y2RvKHX2w8XhYzHSfXlG4ffNuCb9gCMHN
	GGzh9n0KAtBRqZ+nwSe5YKeyD1F5r2eQfc9n6D0Zr+mmzC94/04SPjRz0I76dNvZivTQMvO8ynH
	WtO3suUblEli3jQhD3JzTHdPGFKb22ul2jTX3MF7Lc84AsWuJ14+ZOocxJX+3mF7147iN
X-Gm-Gg: AR+sD11HdTFoQCRnKeauPjPXy/N5KxLVx8TPBcx3LqlVT4Ws8LZEjzVIQ/PiVxjpKwQ
	+3rJSMBeN3QCJ3CyqUtGrtENcwLSb57X08rfs8FnpG+jXLuE5W9JzlsckPXOfGZe2qGIwY06YdU
	wjGbaLgyw/9IPRa0i5ReRoMiVDiaioIA75exH9QJY/MU0BzcNCP4NpkAAoq7AfNU9MGkJBMnhfV
	ZENyktstZNbAUVgZ4EEmXDhKz8BBeitpzz4nGu4p525jzEsgmumkfQJFs6KYDMXOUVRGYVtYzbP
	uJASgefz7lSwFxfIrjfzwMIrmf8Ag01VoF2nRrbspTsdMBK39LRUv1xtYyTm/DYnImDKDe3c+dC
	Tc1qZipqn43wR5lcvjWhdDRE3Jj+bAYZ1j93aA5a1GyHY9xJ4iUT8vcV5jrVQr+dLod1rdSuMAA
	sPzFs+LRfd0g6+KQ==
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr458823931cf.23.1786306557139;
        Sun, 09 Aug 2026 13:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr458823271cf.23.1786306556491;
        Sun, 09 Aug 2026 13:15:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:43 +0300
Subject: [PATCH 04/12] iommu: qcom_iommu: support the short-descriptor
 pagetable format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-4-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MyFwP51+yZ/c9HWtYLGPLcbLLtgX59e5z1/cjBJidcU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uxbRFsDXIdIPxjyJX5z4BPN+Bao/YMpv3M
 /rtWeCXf4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1ZmDB/wLpAF5I4ooO0aH/Ttyxv6B7kwIdY7FJlzh/jVhEqu7WGpxIjwqBPSn/IwhalxN6KIsw2m
 weEaL02pDPZy+sckhBNY/F17ukcL0NfQLd8T99WbxSbkuJj0LXW2u5tQE6D02tgTpmH1DhpUNXc
 ivHOOVGrJ8vX47fH4yzAjAfTkl91QQRYwNctqyZQNBgKgMSWeklmY2ywG4tPL+2ueckypB7UjaR
 8r93l7jf1ka2KqlhJYSUlAdSEA6/PZv4Cvo4TxtnLm5XWC7T5/fe3EcGZm582npaPaz2p591qdo
 71N1zJP+3f0W3lrbjBGgGJIqrkbk4g1wVkgtkOz7hwwPa8Ze
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX7zXx2x1mKAKf
 QnrrPI6LTmhTFT2UKPvFaSdcw6pClEdIB6rs55cJMHDcZBtXPLYhbz2E7WRvclFd0KR7PKUn1ul
 7C9AI2xhOSKlC2p2BZ1FzRlGpoQCYxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX4vA+6SKkVcYP
 j5c2Tgh5SMsQoeR8U31bHuS6LPBSUs+LgecvDzfHOwyycDRDt9iCohjZ55BG3I/C0CN5cw6se1h
 TNZUyP30XzYXfN82DASlIyNM+y2fiSVLPmc7R3yh1pXvM9mb34TPCAK1Js+ixgU2ehNiojJMpwe
 Ykz9Z+CqZdt4bvBEAk82OeKXuEpPDYFIO1yKAi7Svs5GIPLd43I78RqQpDhAqNuNBUZTdMqpRMM
 Dgi+rbUC9/ohTRzpP4vfCD7JsM8tvj+NacHy7zF5g9gAWQ0LjwO9LeTII8uacyxukeo8ktxkorS
 eenFRV3T0YHGxvu3VvvXDr6kerCE6EiYWrgTn8Qu86ZZWwdbFVdP9n9S2yZTQ8/v4RMT8KqU9if
 Zw9HYT0a76ENIDvQv3AhRY8j8XQQtn9xs9FtGHQiG3A7aiPoezDivSllJEk4aku+xuFMdtX8T38
 ebR0YFDvsALPwUVi6pw==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a78dffd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aiaqajgxMVtR3Km9lW4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: C5baR6WUZFaEE9YwV_U_TZ46V8MaG3YA
X-Proofpoint-GUID: C5baR6WUZFaEE9YwV_U_TZ46V8MaG3YA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

The MSM8974-generation QSMMU does not walk the LPAE tables this
driver hardcodes: every access faults with an access flag fault
despite AF being set in the descriptors, and with SCTLR.AFE cleared
the walks still return garbage translations (observed on the APQ8074
dragonboard GPU, which locks up on its first ringbuffer fetch). The
downstream kernel only ever used the short-descriptor format on
MSM8974; its LPAE support was reserved for the newer APQ8084 IP / TZ
revision.

Introduce a per-instance configuration structure, selected through
the of_device_id match data, carrying a pagetable format field and an
AFE quirk flag. For the ARM_V7S format, program the ASID through
CONTEXTIDR instead of the TTBR0 ASID field, reuse the MAIR register
offsets for PRRR/NMRR, restrict the output address size to 32 bits
and keep SCTLR.AFE disabled like the downstream driver does when the
no_afe flag is set. No instance sets a configuration yet.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/Kconfig               |  1 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 54 +++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index 5fac08b89dee..596e643961c3 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -138,6 +138,7 @@ config QCOM_IOMMU
 	select QCOM_SCM
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
+	select IOMMU_IO_PGTABLE_ARMV7S
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 5bbb51d9bd65..77c01f217d7e 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -43,10 +43,18 @@ enum qcom_iommu_clk {
 
 struct qcom_iommu_ctx;
 
+/* Per-instance configuration, absent on msm8916-style instances */
+struct qcom_iommu_cfg {
+	enum io_pgtable_fmt		 fmt;
+	/* the walker faults on the AF bit despite it being set */
+	bool				 no_afe;
+};
+
 struct qcom_iommu_dev {
 	/* IOMMU core code handle */
 	struct iommu_device	 iommu;
 	struct device		*dev;
+	const struct qcom_iommu_cfg *cfg;
 	struct clk_bulk_data clks[CLK_NUM];
 	void __iomem		*local_base;
 	u32			 sec_id;
@@ -54,6 +62,11 @@ struct qcom_iommu_dev {
 	struct qcom_iommu_ctx	*ctxs[];   /* indexed by asid */
 };
 
+static enum io_pgtable_fmt qcom_iommu_pgtbl_fmt(struct qcom_iommu_dev *qcom_iommu)
+{
+	return qcom_iommu->cfg ? qcom_iommu->cfg->fmt : ARM_32_LPAE_S1;
+}
+
 struct qcom_iommu_ctx {
 	struct device		*dev;
 	void __iomem		*base;
@@ -65,6 +78,7 @@ struct qcom_iommu_ctx {
 	u64			 ttbr0;
 	u32			 tcr[2];
 	u32			 mair[2];
+	u32			 contextidr;
 	u32			 sctlr;
 };
 
@@ -232,8 +246,11 @@ static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, ctx->ttbr0);
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
 
-	/* TCR */
-	iommu_writel(ctx, ARM_SMMU_CB_TCR2, ctx->tcr[1]);
+	/* TCR; the v7s ASID lives in CONTEXTIDR instead of TTBR0 */
+	if (qcom_iommu_pgtbl_fmt(qcom_iommu) == ARM_V7S)
+		iommu_writel(ctx, ARM_SMMU_CB_CONTEXTIDR, ctx->contextidr);
+	else
+		iommu_writel(ctx, ARM_SMMU_CB_TCR2, ctx->tcr[1]);
 	iommu_writel(ctx, ARM_SMMU_CB_TCR, ctx->tcr[0]);
 
 	/* MAIRs (stage-1 only) */
@@ -252,6 +269,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct io_pgtable_ops *pgtbl_ops;
 	struct io_pgtable_cfg pgtbl_cfg;
+	enum io_pgtable_fmt fmt;
 	int i, ret = 0;
 	u32 reg;
 
@@ -259,10 +277,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	if (qcom_domain->iommu)
 		goto out_unlock;
 
+	fmt = qcom_iommu_pgtbl_fmt(qcom_iommu);
+
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= domain->pgsize_bitmap,
 		.ias		= 32,
-		.oas		= 40,
+		.oas		= fmt == ARM_V7S ? 32 : 40,
 		.tlb		= &qcom_flush_ops,
 		.iommu_dev	= qcom_iommu->dev,
 	};
@@ -270,7 +290,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	qcom_domain->iommu = qcom_iommu;
 	qcom_domain->fwspec = fwspec;
 
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, qcom_domain);
+	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, qcom_domain);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -298,12 +318,22 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			continue;
 		}
 
-		ctx->ttbr0 = pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
-			     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
-		ctx->tcr[0] = arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
-		ctx->tcr[1] = arm_smmu_lpae_tcr2(&pgtbl_cfg);
-		ctx->mair[0] = pgtbl_cfg.arm_lpae_s1_cfg.mair;
-		ctx->mair[1] = pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
+		if (fmt == ARM_V7S) {
+			ctx->ttbr0 = pgtbl_cfg.arm_v7s_cfg.ttbr;
+			ctx->tcr[0] = pgtbl_cfg.arm_v7s_cfg.tcr;
+			ctx->tcr[1] = 0;
+			/* PRRR/NMRR share the MAIR0/MAIR1 offsets */
+			ctx->mair[0] = pgtbl_cfg.arm_v7s_cfg.prrr;
+			ctx->mair[1] = pgtbl_cfg.arm_v7s_cfg.nmrr;
+			ctx->contextidr = ctx->asid;
+		} else {
+			ctx->ttbr0 = pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
+				     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
+			ctx->tcr[0] = arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
+			ctx->tcr[1] = arm_smmu_lpae_tcr2(&pgtbl_cfg);
+			ctx->mair[0] = pgtbl_cfg.arm_lpae_s1_cfg.mair;
+			ctx->mair[1] = pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
+		}
 
 		reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE |
 		      ARM_SMMU_SCTLR_AFE | ARM_SMMU_SCTLR_TRE |
@@ -313,6 +343,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 			reg |= ARM_SMMU_SCTLR_E;
 
+		if (qcom_iommu->cfg && qcom_iommu->cfg->no_afe)
+			reg &= ~ARM_SMMU_SCTLR_AFE;
+
 		ctx->sctlr = reg;
 
 		qcom_iommu_program_ctx(qcom_iommu, ctx);
@@ -808,6 +841,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	qcom_iommu->max_asid = max_asid;
 	qcom_iommu->dev = dev;
+	qcom_iommu->cfg = of_device_get_match_data(dev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res) {

-- 
2.47.3

