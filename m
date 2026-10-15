Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD58499F2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102341; cv=none; b=SshDthgTURyd9ir0xjHnkEY/1+sVMdgFYNYc/Vp4VP/H6dgYlrj4vbLVhCO438ssIZbb7VHs+SgBjmLhgXSmt5kZx0ZOg4cQY7OAtnruMzmuVMd+J+k45bvl21WuT+EPOeAiyfAnXUa4wck0iWP1cDVoJlSn6rHkztLif2Lb9AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102341; c=relaxed/simple;
	bh=DvMqCe52Q1uypV32+mlM7klXZcT+Fok14dEqD0/lBBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X7p7rq40T8jd8Bvye7AU6Tu5si/goPvLIHaeKUbOJsOLMNyFWZHsvkQHzGSQbCL1pL70kkSmdNlfw9SZOyhO3PvN7hghWdgXmD8d8jvc1IFiWqk5buVGvEtm4TJMPRdLP7rSGBxH/auhppiO+efcjRtWYXjR9cqgFsbGDytFRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6I/SeBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEZuQSKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6I/SeBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEZuQSKS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FG5ZUY3493025
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 22:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi
	6mYstLnU=; b=G6I/SeBLHeLwIHth7W092RYE7L1QUYlqEuJmyHtVKHMqbL/00ia
	esdHU7vX1BUoDW5ejTzl/ouqW1ce9bCYI91Tb/ja4PWECTxbn4tncSjGaP/SrkqD
	J7ymX6gzRbTEPpyBoKteUVarrJo8P9m1jcOGd8E5BCw/XNR9tkDmAgjBKw2S36MG
	pVUBeSwCbqYbeoW1AtCrFggHlxfJJcuIHXZWRytT2RK2NbmB744donNB2pE5CZPk
	oZKR+CxbLKzvCJOsETdTpCwICawJy9D5dWSYAh38eZHEJbPHCdnMTF3wc/XmLSdV
	VwspqVRAVMcjalQkE9IQJOzEKf4ATpVfgbw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wsdhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 22:12:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2091873eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792102338; x=1792707138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=;
        b=XEZuQSKSsazYFPERbMnluG1T4WAlPoN0mx0N2COCoeJFhQ3NJhdsZV6EJ1xIBnnZyk
         KobB9WSiIY/u/RHcoy85TX3fzrXG0bN+4GgeJAgkFVSkW9CZ6ot3UkS2uGqMKtZfKp6C
         xyTkKqwSINOU0GvKZm16Sv9HL2lRKLfhYRF9PSm8oGRIoYhARGUaUulx25SXj/j39Q2l
         vGd52MWX6azh6C+X4YAUuteVCPScVR6azAbDjF80590iitXADGpI0FMmxH8obw4EtSqF
         L1+W16klFCB8Zz4DoPQU+hYVXDjarXWqhDzN+D6bNiZKe0Py31eGTJW0qmD3MsxwjP/+
         lXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102338; x=1792707138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=;
        b=DLNS49hrWwmvV4o+FzzZ29DjNFTmizoRji1FSBsI26jD3p3GQaD8/jAI/XNMo2Hl9W
         Hio3kZwZbPQQCyOp0b4KqdBM9/yWbNPOYUHZQGi+qykJnWvZd8iy6iB2eXuWxPhs06z7
         X07q/cBgDqfQY9bYX0Q7yD9GQYtYrs9oq2STlDtX78eVK2Y9LKSHmNzk7Rc40rfFc5TG
         G9GugnkexdPPK8gLMW4gcFTbACXJfJp/s6K9S6yCFt+q8WLI4B2nA0K8qYo2f9n8Cnmm
         Egq7ne7EuBue4xErUxAVmMgSRGVxUkJIWB2hnK+ypzLcbu7MB3bWs+WbuWqK8xfSvMOb
         ka7A==
X-Forwarded-Encrypted: i=1; AKwUvBzaEDJUm/hZDNuNS+/Ej4vA+mh198qLjcambN5Gj7NfnfYr1uFTbRaZxLs6gRcPSZ4VQe/A6y5EahBK3T6z@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ0vtlrWNkQmjZ3kPvuhHnYSVN5kGXpCqgmfF1rwIrsGltOdrT
	3eHIfuEmMsWfaum7Sq6ELGHYG19eGd5OFW+OFsEA+79gMh6NMRU64WRusgAe6ncer+P2bLte0My
	SnX4COjVN6yPHfiUPi0xGxcSXmlKkRp26m9D2zCAmjnd59Br4i1jWBgscur3jLDAWYWvj6G7poP
	/C
X-Gm-Gg: AYBFou32uLUXgn4ix80ldLv4V4KC8oDP7pkIYE8d/vlhftj6IAdBqFxhZTibEaAnSj7
	jHZpzD/f07iZPZIAYT6ioaHjPKGxaWba+wnyBFtM1XTXc+quq0cKzl1bR2d0DgzAmvuE1qfK1BS
	BdsTR2Df5jUlaOl8Q9BTJkEM5x0F9i3VUgAQHiRfTk3OjmxHUG7/Qba4koOgjQlklvN0Aj7aqNu
	/AMT+9I4uslADZuOIXmpAcwMpNtq/Z3I+dQkuIQSZLmmKplzaqcH8Ht5C12WtM8IfKfSCOGe5K2
	v2k1GRPWIzXqJ+3KVfo81P27SyQYU5q4C0XqEuvb0F2skCYKdgV3K1NCvE98XywF8RM1zirDE8p
	jravUq2BBWJhAEcQGGi30dGDFVPMJ7tzBGVZfE0Oj4m22B9mJ7/w3GlUVziUweQ==
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr31113762eec.27.1792102337865;
        Thu, 15 Oct 2026 15:12:17 -0700 (PDT)
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr31113711eec.27.1792102337152;
        Thu, 15 Oct 2026 15:12:17 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm810987eec.14.2026.10.15.15.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:12:16 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header support
Date: Thu, 15 Oct 2026 15:12:15 -0700
Message-Id: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SyDUwGDqGwowHlnxzIU61JE0iZlI3Fq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4OCBTYWx0ZWRfX5G+nio6DEqrS
 RgXwe/et3aruMEaUTjeGNy42TByQ7uI2Nm8ZV1xPkxsJFEN2+0Dv50tIAviAdOnR+0KZGl6dcbb
 eI8wWzdTO8o4d+6jbkTzEzx0NwItzABp3FgBBExTojIyLQEjTU+42c5i5DDK8WDoKVCKGJIKk8h
 MytM7oYZWLG8b+eVTqbQ9LsD5pGA7FnwWWi5XEpYZ/QOhi0CRkVjDnUsKeM8/F3KUGqbl5XBXA4
 9YVO+xSDdNFN61JnTeSbgAtgpKVs788RKEyavhbGPXCxfScEbQBHBT+dqGSoY08SY+kWzoYTLxO
 sMC5tgnLl7anpR7FaN0nBIJy413HRBcPIE8I6w6rCL0+c83fw/ewHvNWn13Z20r6uaM75T+NuSU
 uy4I/NqUAUsscpkOA7i0VolBfc2bZv4189aoOjCMH/xQkMr9hm4yyCfqqXclC922JKVYN0QTj4v
 +mnJX/kKP0cczZTZGpQ==
X-Proofpoint-GUID: SyDUwGDqGwowHlnxzIU61JE0iZlI3Fq-
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad14fc3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4OCBTYWx0ZWRfX6j7pRt22eJPT
 cpqz08L5AVpx772B4+BpLhudznmGPv4nl5YslYUSMS+T7VvvTKYnUjQDNr4M/zSTgo26dC192iw
 sJbFHzMHs4L7ifPIhSDeSX9FFxea5As=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150088

XGMAC2 doesn't program the MAC extended configuration registers
needed for L2 header splitting when split-header mode is enabled,
so tagged AV packets can't use the split-header path. Configure
split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
stmmac: Programming sequence for VLAN packets with split header")
to XGMAC2.

Also fix the RX header-length calculation for split-header
descriptors. Per the XGMAC2 descriptor format, the header
length is only defined on the first descriptor (FD set), and RDES3's
L34T and L2T fields are only valid on the last descriptor (LD set);
on a non-last descriptor they can hold stale write-back data from a
previous packet. Read the header length only on the first descriptor:
from RDES2[9:0] directly for non-last descriptors, and via L34T/L2T
on the last descriptor: RDES2[9:0] for IP packets (L34T set) and
RDES2[9:2] for non-IP packets (L2T set).

Finally, disable the variable-length preamble when L2 splitting
is enabled. A variable-length preamble shifts the position of the
Ethernet header, making the L2 split offset non-deterministic.

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
v4:
  - Only read the header length on the first descriptor (FD=1)
v3: https://lore.kernel.org/netdev/20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   |  9 +++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 16 +++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7f43a0b17083 100644
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
@@ -434,13 +440,16 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..b28aa39f9947 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,22 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
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

