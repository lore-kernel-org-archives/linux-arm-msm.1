Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7847B455608
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119282; cv=none; b=UprctyQYUjZppsibvEvfkVucr8EDRjHyMo6mfA2pl34kUYLOD6ODtzXO0NU5JFEBFcI0vAe3TPWcjW5S9wS4zQbtLdwcoL6AOdnll5EJJ9w/1RvqkI0620NPLdjy2SimCoaQ7rYIL/ur/aCj8UkX0VkOtJ5cvUOYzZOGGuoyAo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119282; c=relaxed/simple;
	bh=vzN5qPK0jh9oC1yOXE6jWapsnLnsrVL6dc8xtHXtOfY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fp2S4L/HVhHc5aGRiAKdNJ2muG7blTxAO7UZetTFfIeP4Q/XUo4nnMy0/Wyp5aBGstedyd3LJVJ9LFABLR5rx3B8w1RIno/hJ+PKdTjxEwdoik8bEUDGQJzjgiYke0z3ByhCbooBXrAI8o+B3cBGp9QYiTetR3c2ojC1uXVeOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJvRXpf1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fn17T6Ru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJvRXpf1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fn17T6Ru"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6uPA2033224
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cA
	Yxd1I2pI=; b=IJvRXpf1WNoAkaZX5n1A6aY0t73YP9dAGq/Mhf99BKMATayiJrJ
	zzeXNMDEHxKDXCFVJxj71TujtMcbtVXYNyqBbYYsPYPixcE0yXWV57dBopo+YsPL
	wBUM1fBmoC5+M+To7bgbELKW9mSSym23RdaPs5a5/xNXkiljRr0zTXLCFoWL0Ftv
	zAn/8hXFtYSVuK1xQ1vySdDnTbuMWg7WQz1tpXhE9yCVlzFpIdgkk8mXL0OIDSSC
	EyQ4g/CqrOZRWyBXmXVyWpdHOBd1++23eCXYvnztlOdszlS7/wWAtJQZmJs2HWgJ
	bURuPFnjuUQVDT5aUBGifDJoURp0tM43qhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c1g47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:21:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-331b2ec616fso1207479eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119279; x=1790724079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cAYxd1I2pI=;
        b=Fn17T6RuS2FV2C8+QH40ZIIy8BAhBUOOtYVeC/K4X7nOg7Xmq5Hl+XPp2O/oe0Xlo/
         m4EpfjZjdszK0UEotZoWEWzaW/x7X+vYnLbt4oL8pltAGwOLBuodBpvu4Q07wCFOdTZ/
         MRcc4DZ7120K+Czv3w0kyjZSi+gk0UqXizSj15PgC7lR0RVKuSUqZsOHQQjp388fa2KQ
         6vV5ozkLHCe+qYrjrvVrTOPh4yXX11EFjM74hrc1NzB9rv/G9E/NDAFbBQ71lLrdFwsi
         vugIYxR20uDjOGAWX1E1mELeCTklOfEJ7h7ExJS5IMjanDj92VhFoZskUflzS/wFTf0h
         Xe3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119279; x=1790724079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtcrGr7QFfAuzbwfIUY9IDBuJPZMtK5x9cAYxd1I2pI=;
        b=A0N7jACcqcbtZvhb9RcrXbXdk4OPxPXCd0AshgQoCFeREObLikDY3FjxmG8ICHuFc4
         WcZR096lVLQdmA2xcLqx+4TGQV+avvPngE2IVms0klxDZ9Xc3bSc+1sgmFw5rnfrAT9g
         R0mpmx2Gwkx3TRyC85TPdH7mQOd1GJWRw5HhFxMsZBSwSICRdfgLWHxPKZ1hgIraIdX0
         KYnUDLO3EWPjftsNBr39G7sp82w9CazaSTuE875PtOOXcJemETvWsAWN4F+8rX9dKqFE
         CywmAW7+UPZpRrsAK8VrKh9nm69IpABA/PfXDHMG3ElZYsYJz0PcQEXju3EK8HYMepUT
         LP+A==
X-Forwarded-Encrypted: i=1; AKwUvBxVdhSsjkJvytv5z7BTwYmOXI0B6Py10CORv7y7C2aRJGUwk4jGJm3et13Vqir5Q+Ss7ud+b+yujAolZIcD@vger.kernel.org
X-Gm-Message-State: AFuF++lXP5kn2kNiuAs85dl8PTtK33m7nqbz3kXAaNGqMGepG6UyAFnx
	BjguGbDquidYonvcaCqR3E1CXJjF5WWnLDH0dslUBwuEQqa0hLscyDgnemWNbvLPlbI5ZjSvtYr
	Ru1hn5gk6wVRG5+gv9VtDlDvPYRNskqSaLpEu55MihYf5VGvy18Q/VFCZhdvu9mdN5Gsg
X-Gm-Gg: AYBFou3pfXopR3hyCLroopevVfOP0wnCHlPD7EuV84EmOCJd4dps32sapzwZhpox3lW
	LvV6u5z2lOn1DJ82efWk7y76OVVFQYtXbVkFf6DIoHGRocpLRy3FpCtF8PYClg7jPPAuTClsr2+
	Y9ELaY45/7vBtmL2J4d5aLwMYbKkXn08FtphHKfUmYR/JfKC2K3md3NP9a9NrrFZJbYHlqXxn+g
	ZgFyOta0Zf85NSSsd2aFcPw+KOxl6jFf9Y/XiPPCKWpIAf7aF1qtflNaYic8rG9Gl0E3AW7AeYR
	Vf2/3j/wmmGYGpMD6qusOC5ryxcnnW3hwKIU4o7vezF96wrQX/sPgsgqTeOPD/rqnSAqFWnsjvB
	awxo4jdAYjutV1bnPGz34T0lZ748xFYQL6Hi6oX9eNxMPj+f8taWv42LpIujBlg==
X-Received: by 2002:a05:7300:4715:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-33e8c53b8a7mr892286eec.16.1790119278486;
        Tue, 22 Sep 2026 16:21:18 -0700 (PDT)
X-Received: by 2002:a05:7300:4715:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-33e8c53b8a7mr892254eec.16.1790119277903;
        Tue, 22 Sep 2026 16:21:17 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm1289746eec.10.2026.09.22.16.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:21:17 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH] net: stmmac: dwxgmac2: enable L2 split header support
Date: Tue, 22 Sep 2026 16:21:16 -0700
Message-Id: <20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX/9gvrqKgBFZM
 fwr+9C7UK2qng7ifYgydniTCJCkSN9mXIV58TzZ0L8/CM3vF/uwJOOTy0N9fANtOY1TTudAJ3cO
 mP7vW2brWlKRaoiqqJECzcUn4pHCmGPU6ib66Qd69MXgYAmdNdk0kJljd8rdPK1Y68iuQnnZtrX
 tRyc6KyW1Rk/L4oukS0QJQl5zLhloIJvsMqjhxiRMfSYClWNZaDf+bT+fZ+ZgkXL1aNzbakF6vs
 Z+CI+oMmxE4DG9ZVmOmmffUVsceOKLa/5nNJQGpX3f377q9f/iCmj1iZ0rCGRBmtbgvbOc/TRrw
 aT1skOGoDsf24H986yBV/skteGuwbHGckAu341bEv0RSpyVtwwmhrMylG2xfzxzlwEJFDCWJ4tt
 zXfBu7qICJY/RvQA/mzpRsj1Os0B6hiESrEyu/S2fqu/q7WRTbXkzvxzPx8norOYCx7nACacW1I
 lShwcWzyqMQn0lcKvCg==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab30d6f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oyhHvXrwYuR4Cusx70sA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: OZwryfnSEAZf6XnD1bPMj04jXwes5R8x
X-Proofpoint-GUID: OZwryfnSEAZf6XnD1bPMj04jXwes5R8x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfXz5Ifjy0qkult
 g/e4fQHISgpTPwg+DdA4PMNc5gM3qhNiCplqPByRj3Kt+q2kgvgNyfQfVyhVi2xW6qIeYiQRLhO
 Aix1UKX0MDa0l6f0HuhO4d/YYiazaAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

XGMAC2 doesn't program the MAC extended configuration registers
needed for L2 header splitting when split-header mode is enabled,
so tagged AV packets can't use the split-header path. Configure
split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
stmmac: Programming sequence for VLAN packets with split header")
to XGMAC2.

Also fix the RX header-length calculation for split-header
descriptors. Per the XGMAC2 descriptor format, RDES3's L34T and
L2T fields are only valid on the last descriptor (LD set); on a
non-last descriptor they can hold stale write-back data from a
previous packet. Read the header length from RDES2[9:0] directly
for non-last descriptors, and only consult L34T/L2T on the last
descriptor: RDES2[9:0] for IP packets (L34T set) and RDES2[9:2]
for non-IP packets (L2T set).

Finally, disable the variable-length preamble when L2 splitting
is enabled. A variable-length preamble shifts the position of the
Ethernet header, making the L2 split offset non-deterministic.

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  7 +++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..3ccd29ea7ab0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,11 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(GENMASK(9, 8), v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,6 +439,7 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
@@ -441,6 +447,7 @@
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..65ac5403ec58 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* when FD=1 and LD=0, HL is RDES2[9:0] */
+	if (!(rdes3 & XGMAC_RDES3_LD)) {
+		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+		return;
+	}
+
+	if (rdes3 & XGMAC_RDES3_L34T)
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+	else if (rdes3 & XGMAC_RDES3_L2T)
+		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
 }
 
 static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, bool is_valid)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc1f..0a9c787305a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -561,6 +561,16 @@ static void dwxgmac2_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value |= XGMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
 	writel(value, ioaddr + XGMAC_RX_CONFIG);
 
+	value = readl(ioaddr + XGMAC_EXT_CFG1);
+	value |= XGMAC_CONFIG1_SPLM(1);
+	value |= XGMAC_CONFIG1_SAVE_EN;
+	writel(value, ioaddr + XGMAC_EXT_CFG1);
+
+	/* Disable variable preambles to keep the L2 split offset deterministic. */
+	value = readl(ioaddr + XGMAC_EXT_CFG0);
+	value &= ~XGMAC_EXT_CFG0_VPRE;
+	writel(value, ioaddr + XGMAC_EXT_CFG0);
+
 	value = readl(ioaddr + XGMAC_DMA_CH_CONTROL(chan));
 	if (en)
 		value |= XGMAC_SPH;
-- 
2.34.1

