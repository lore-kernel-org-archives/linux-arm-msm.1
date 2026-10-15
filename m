Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579B15158A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058168; cv=none; b=AYIZ6MsDizZ2Hr4N3XqyztolnlgOqfwHU0jy4id55/WH17pdVd8unfhfLRU0Phcb9b2DlKSJ0+WeebLsuqsDyyHLyYqzlp1BlgH9xPbVyQIKlzLioxQp3iArTPDkyjW7jTyoBzGCym0VXVFegMy0S4DgZwxEyW9pnea540Aq5To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058168; c=relaxed/simple;
	bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2LsGDkOi4PcR2S05+oWDv1vP/Dgo0KjpmP7MLv2l9oYg6FQVTgtas9PGzi/4R4BcTLgO3tOKRm2sl/5bCuAG/cUUfW+pR1BGecM4EpgAzKMHgLnyA1Uk1a/vY6RTC2h8u5N960bE4kfLSXlcGWYhr3Q9qbevdqROV0Hans7nUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGHK3e/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6HqYR+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGHK3e/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6HqYR+P"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpVM3408901
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=; b=WGHK3e/oFJJfCbVm
	zR7C0DhEiSBbEr+Edr1kG8xyl8TcmnN2GSZiyFJkn914gZ151JRLlHkLtqdF1i2m
	tmFMoWXKH/VgoAQcNx1rFogXpLF3IOpvuoOcW6MOKbKv1pLtPq1SAcTdYQ8swfT3
	EkU0JFrrr5Fk3t4tiDXn59RkI9n/bGbIO9+6r0oXcAEzhU3GE7fO6utOqr5pRxjV
	DsELKiXj4sCktmVKAzrJ5h3uAU8C8FXGGnhbtPbXWe8hsVHZvAu5uZf8AGUQBNLR
	kyCnSQRvpBjP7bOn8WHFPdEjcGYwsZSINa5vP4JAH6kVcgeAjdm3u38OBMIhClIh
	e+oMVA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn254r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso10507719eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058155; x=1792662955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=N6HqYR+PRutv/4+T2H7eKjJZYVpbR18tKUqDvlZmJULYhpcTNaOiUb8vwAPjWvj4oj
         uE6XBKQdRXfwff+hUjqbAb/dgCxPzGxdo4y2thfalKEnHtP7jAbiGrQntsSVDcvJGc9U
         td9CzXL1dQV6aeAFlsYa3BhK59EkX06P1srq59sPlsyakzY/1l85gKNQdc6V10TzaHL2
         GJ5EoEylD2iqenHA0zVoytMKLXQoaCAJw65tyq0LwzXp4s4wQ8MNHBLP7dMFWr5dLBSl
         WVyVmrAyXKnOTQv6SqSDhsSHPmE9e2CZ3kPPOZyDMdPgo0rt/C7QMsaVaIWuvxLwd2PK
         rqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058155; x=1792662955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=0Ihfti8BKjmHLiqwvrPf6sajrwHHUoc+Y/wW/G3GLuRHDKH+qiSSFahuPcvdY2+JFN
         l8cBSUFa9La2EvWFrMXz7HTL1rZouXzKmDnreXQYqzG5GdDRh2EYqO6sw4dIQloYwAdf
         6W5Mx70q+ZbHkLU9OlaeWgNXqygJY0NlFkyjpYCQ6Vjj3MjLioxzVJcHhZ/It4X+cgoo
         eBYuTekb6Yx9c54idkueFYg7E7H6twEOiU6PSu+R/OC1guamfDedkwiiUhybkhra7BQo
         kN7faBgw8MtxHFpf732YjLKyNUHRa8HWjfUd2JNA7sxZRc0UaHl+AK2RiAmpl6EpAQH8
         Y8gw==
X-Gm-Message-State: AFq9FYLqfYnQvQlQ2Y0r/HWnIE9YmyqReyQZJtHzW+rMNVLtprAM40Ue
	llrmUsEStUIt5X9/kru91iGxGZkjb1zWj/HtiXYsgO5Jj4Ar7BVrFO/56wscAUB1XkgdtSqDvNT
	v99M6xvWxMZAOEfYlAJkLGay7FOXZ/Pt16qCawQN+X4dTcKiX0biu40YIy5o28d7bSr4s
X-Gm-Gg: AYBFou0u1adqHWX4cUpbZwZGzNpW4RdXBojeCKN4CkJEVyE+R/szvFqcrnhCUlyforv
	/JU9i/Crcfb2uT0EUXP7rOwLWfxdJz6XZtoFUXAxnwk10lkOszLL/20dpL5pT9h8pzraucs2Tli
	ZSwzUONYg4nZSKQ/kyI/TcrZ+AACx80bIu2RvMgurcDxXPVCq/ktG7DNc8fsWAaICPfYgD0NfV/
	tIdp8odib6gHzqcxJbqd8Dhqqz7wnS2deFToFA8EwPLCvqdrOAUMw9Tvek+w68PtdnzFVN7LQSW
	5j1VWoJG7pdVXzPGl/DFH/rWEkqjs0dulGp0lkNXw0Xyh6lLvWLxBsPPd1a0sBfl+b6QCSXrguP
	TQe8AYE5tUxvDzWZtfjZTetF+S57w
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935757c88.36.1792058154516;
        Thu, 15 Oct 2026 02:55:54 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935703c88.36.1792058153000;
        Thu, 15 Oct 2026 02:55:53 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:52 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:20 +0530
Subject: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2879;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
 b=kUj4K8H+/812w8y6hk9u6q85CN/ahAHrvTJngEOXl+UOJ9VSCJDKg0/Hx4noIeGANDsRbNLYs
 riFLI3fhEWVC3QMd2zS16g5/S6w7OE8Bk4tO+5zTwdrK8UW3yAsgOde
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9iiVAvIY/SZW
 7AbZ6WkC8XiiLy0vfC9Y1a8E6iRZHJj1sy+h7YNsAjsvT9lE9VCzGabPBR3ojDBphEVy4NG4sBm
 ptjL6KB2d4l0tXvuAWfEP6avxQhNWMcr96HgwC/x9hvW4v1D0i1N6GoYSTPKynX39UCTHUr5VCu
 0z7bKX5+TPnuBemZLyz0iESpyx4CD6oUgHcuele5KyXx/7+7iLLgyEFTdwK9uyzT9FXGYxr5ugu
 1ivBge14hBwaGRDVjv8Puk4yCHJ4aC6Tqt01q0aKRk3b/X/l9tIO1PCi54prXXKxCUEu9WGf+gi
 8FBkmYY8EsJ6UO3iZdCF/7nAM5yPdPJC3dqh7aeVB2dXb3YE8f+bX4VtpEk5yZGMhb3vRhnaPUY
 mtZXlfT/63alKioDhZYjPrXvJ0xdrdGgc6O31PcloC14xj/LuOFX5CUlca/1CEnq/IIhTec3A4y
 EJH8oU2MhGjUhFGk5HQ==
X-Proofpoint-GUID: h3Jacr5pjy1-YvKmOBJ9uTBjq0AqOCxX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX7sgD2TbBr8Zj
 vkRsXOlJAFIg5zh3J+oQ6IRgDXjHDl5JfZseWF3Yst3wJulrjk/iI+pPM1eqgD/H0uumEsjU1rh
 rUmDtY4wX55Fj80pDwzsJWKEtd8S11o=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a32b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lTbGvRf64-BgIYWFXWcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: h3Jacr5pjy1-YvKmOBJ9uTBjq0AqOCxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

The vMPM layout starts with two timer registers followed by pin register
banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
number of entries.

Use qcom_mpm_offset() as the common addressing helper for both timer and
pin register accesses based on that layout.

vMPM has MPM_REG_* values represented as contiguous register IDs,
hence replace the macros with enum qcom_mpm_reg and modify the accessor
helpers accordingly.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index a37c20a20bed34d4f55fbcc950ba39ab9799b7b5..0de6ce818a506efc07913b16c479b5d5efb15108 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -64,11 +64,16 @@
  *
  */
 
-#define MPM_REG_ENABLE		0
-#define MPM_REG_FALLING_EDGE	1
-#define MPM_REG_RISING_EDGE	2
-#define MPM_REG_POLARITY	3
-#define MPM_REG_STATUS		4
+#define MPM_TIMER_REGS	2
+
+enum qcom_mpm_reg {
+	MPM_REG_TIMER = 0,
+	MPM_REG_ENABLE,
+	MPM_REG_FALLING_EDGE,
+	MPM_REG_RISING_EDGE,
+	MPM_REG_POLARITY,
+	MPM_REG_STATUS,
+};
 
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
@@ -90,18 +95,30 @@ struct qcom_mpm_priv {
 	atomic_t cpus_in_pm;
 };
 
-static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
-			 unsigned int index)
+static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
+				    unsigned int index)
+{
+	unsigned int reg_offset = 0;
+
+	if (reg != MPM_REG_TIMER) {
+		reg_offset += MPM_TIMER_REGS;
+		reg_offset += (reg - MPM_REG_ENABLE) * priv->reg_stride;
+	}
+
+	return (reg_offset + index) * sizeof(u32);
+}
+
+static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg, unsigned int index)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	return readl_relaxed(priv->base + offset);
 }
 
-static void qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+static void qcom_mpm_write(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
 			   unsigned int index, u32 val)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	writel_relaxed(val, priv->base + offset);
 
@@ -142,7 +159,7 @@ static void qcom_mpm_unmask(struct irq_data *d)
 		irq_chip_unmask_parent(d);
 }
 
-static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, enum qcom_mpm_reg reg,
 			 unsigned int index, unsigned int shift)
 {
 	unsigned long flags, val;

-- 
2.34.1

