Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365B53FD34
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919687; cv=none; b=PX/uwj26KPShJXtMyphGyudKWiMs//fNrrNgOUmk5AqNnM/Z9gV6z4T2mC/ze/0deL/hIRsLo64gclqSy+NdV7iUuKr7JvtH5+PYYBf32Epow6yMaNknl6MSwJ1mnZwWFuIbbosC8b4zk7S9Ko2iLCDpazt/ECTd719U+2+xbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919687; c=relaxed/simple;
	bh=xucrSKdY7RHaRI/nkBngy1nF3VmGw5oHTLPPGDCeYIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mC31kiHm4GY0eAVIp6a1SSEo9qdOp511vFLR8eDNdpJkZrm9Rx9kmm1KbM4MAQE/2HZWLEi5JrZmy8BdhVP3zA9f3IF8nXs6mRCGiXR4v0vsiYNKZJBs4WA3NnEnkNMdLZKPNizYSx7oOGDriIyswP5rLEj4jjIaszHgPDbaZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqi3ZzIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuKjtn4b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqi3ZzIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuKjtn4b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE41qd900252
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc
	8Mj/rlXA=; b=jqi3ZzIAx1kO09gO94XLKJ/BnI0sCk2YdIqPZu74a7GkhcLKnqt
	wVml33XvSLmoqwMCCjtKWT9fIR9mdsVTDRJihJgFsOBU7lAZ8tdFiXh7rNsLx9GU
	G9zEPU+8HprJ4zMNJI+6GP6m86SwdkoW5aLonjTQZJhSIdSWDzeZBoP2Kzmy+lkA
	B4bfjDkvE9YKbbWR5YJbYjQ21bX/KU5gjEl2Jw0ArUzCNb18dfr7jpoe0B9wnVVq
	shqJe42mEGJxwSTMOQGN0vGon/yaakxcie8XmBDNPNy7gOhMIshQOz0rSb0bQGhM
	FmY0fdJpv5FU+h/qK6jqKGpv4mW6Zz/y/jA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uk73x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:28:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so782867eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791919683; x=1792524483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=;
        b=KuKjtn4b8Hr+Y8d5eCh2bO47n3FVpUSeiDuKzqJuB7ZzgDafdXN0eJPn6XLmgQZ5nu
         zBRpCoK+cHZdr5EsqUn2Lt4+7gQCsq4JBjrxMC0k3Yd6+YF5IzUpuFyCEGQp5nRVN5Zy
         +VoHqkzx65xYRE1jj0LJiXxqYOP8ro8W6K64xNncFQA/MSm3OP7eItJRrr03NF1sOKt/
         sMN769PgoHznQ40VmP/MtG2CnIkdkwsPcny8ZR7pccqPKtqaurhxPZEZDCouCfyySnVv
         79Np5Tt47IBYNCfxIJzx0gm2Bm1FqxAVG5j/kABmrVD5GaY7ph06oJIIO1uZpsRJS9f8
         ra+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919683; x=1792524483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=;
        b=RXQgSZrJ5+erix7Tlhd31Fa6G7031JqyMR3puVLszPfLbulPygA8bpExzDvwg2MnaD
         ikW69X6cHxd+y3drqeMswY+ucuIZB6i/8SJ3gsLyLMYponxgDoN1twF0h3DlfLuxOTqa
         qy+0cfCk56Fbb8JprBkC++UNDMoyLNjntOl/ADw2cCNfNZKjcOnCSRRfUdZcLlOJ8c1z
         QOgiUvPB2wFtLR05KwHDryyXfLAEA3bjcAylhN/tiB8p1BOn8TPW17YPOiPWxioT6h3N
         WyMThU40+WXasHM/IwxdIYon6pz7IZMUlyo5MJyDvPd3ZT4NO6paDVMK5XVizzpNYdgv
         Iebg==
X-Forwarded-Encrypted: i=1; AKwUvByE2mFMXiShWNR10/Ia8a3BTZnKmckCxmtCcsRpT0rsv/qwpEDfnbxs4HgVmdbfDom/0uj2lLCFeZGyBRBo@vger.kernel.org
X-Gm-Message-State: AFq9FYIirhKzjcbHNWxW/TUu1AsjDaqy/SeBEN23dimp5u6ohigxBbzu
	vKfZioIBEtuaBD/RYKoIq7KsMopcfD7Yh4fC2VdKvH1r4qNFr8OlPW3x4YChH2Io091mLI9TtyG
	f/CbkmTXHqO8A63kPoVdQ0iMwWHh+GNema3h/M4qOgzFXL4o4Ar5psgTUIVt0uWV3yQou
X-Gm-Gg: AYBFou0EvIPOnW+pPetdKJoyo69siYuJEskPxFjDM8gWVAiZD+mpv86eRygZ4H5cZEX
	/IlvZIZssm+lQ/7Zx1ByHxaytRL5/5eU6MSg8wK8agzzrrOeYfxcJZwiSOP4pkaFVZswuezRRxU
	dnzKT1AAIg92HkgFy13AtYkgn///m4DHgffWOZdWRSVgkJGWQkMgIYndorWjhQfSzwZooW5EK5i
	iqS1cf8CrkA0Kr9SKSVIeQ6ZAnmJdKzBnZiVTn4SuOGNAjT1vAyA+dSObNagVsm5tXVNek3vzXS
	uMgBwNko5CMQa2K4hR9H9y+xY6ju06Z3VioKwVX3IvK+tpOgkGTI3sshop01qxVgQ6sm3fK833Z
	k8aMoJ+CDMEpXKb6CRWfTA4ELYCyu5N1UR5HovTChZAAtJUQZ+D1zXw4S8caTIw==
X-Received: by 2002:a05:7300:da15:b0:359:6382:5e52 with SMTP id 5a478bee46e88-359638267cfmr13096929eec.17.1791919682860;
        Tue, 13 Oct 2026 12:28:02 -0700 (PDT)
X-Received: by 2002:a05:7300:da15:b0:359:6382:5e52 with SMTP id 5a478bee46e88-359638267cfmr13096776eec.17.1791919680365;
        Tue, 13 Oct 2026 12:28:00 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm60000008eec.9.2026.10.13.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:27:59 -0700 (PDT)
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
Subject: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split header support
Date: Tue, 13 Oct 2026 12:27:59 -0700
Message-Id: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX+d2+lBNC9zd2
 hZ6H0f5nkkldaOWn7kKDFGqyKS10iVGoFGrFfS3alhLbsNEaaqLCW25UeElu6x0SFNiHNMYG0iG
 V/uh6gFFZjokZ31EK0MtN6moTOvCNCfnFHq7mqjGAQFelNd+b/NrkF1/iVqS8cpDdauHJU2rh37
 N9Vs7BgjK2BLM1QpLx23eKo1RVTzchQGSKZhy+C2YGNTBjPW8RuL60FKj4iZcjWHr6ysklB7w6L
 erG0Dv9QQFc2UO3/Aupu0vMuyBzk+BSYdHMFEFwX8ar7TGDBJUcYjdJr8LfZBGyLPlu+FFPIc7g
 2awPwpdhshL/QsBWCyCVoXv5jr2n/ybJg5rXsdgGUmmsqq0/DyFqQGvAJAqhf4CXabuVEwGQBB6
 5igkLVUkKteSIVHmudxZIVjQq+8VGrLAUxcoBzaI3HH0ElVqxEKRi0KjPGXCctr68XeYqJdtHUG
 ulbOcRdxVgiReuHOuPw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace8643 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: EcToZCStK_2LxTsYN4p_E-yBEk6ELfoe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX984YyjWjw565
 B9YozE4Gp6xoQqmnIa7GqtwgSf5cdav8W5bsKl3G+SilHnvjSiPq1d092AjD9dxrNudd0GjjBrT
 hQGio1wrkEWBZ75kHMNWaM/QGNbKRdA=
X-Proofpoint-GUID: EcToZCStK_2LxTsYN4p_E-yBEk6ELfoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130077

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
v3:
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7d1a7802a131 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,12 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x00000140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,6 +440,7 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
@@ -441,6 +448,7 @@
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

