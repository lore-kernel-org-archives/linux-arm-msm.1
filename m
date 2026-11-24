Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478663;
	b=03rGFTIcRFGnT2WO5wRv3Crswk8rBrxQ3wlUay7ZNqTHXiNAoyKDq7rXMJJ/Fi9926Wt
	 p9r65zEkh2uB+BlwdlsJ56AMJMRpy+dH6SUh2ccd+/Hjg40ldw29qcH3g/x7CsHfaanww
	 C6cSJBTB4/X21Zp9OeekbeeQBj+3qdaV+IWMVR1vOMtQtdaYMNHwKbW+wCIaKtU0ykqL1
	 IDzyTxhqBtUglyowEjJz6NL/H9VJlIOKm/YEYcwPHWcw2twlT0ELH+nbNb0pDRd3/j5s3
	 nRXYTSFBkwlhCaHcPVC3kbomA12qm2ebsLSmresGy4LnaChjwN3HmjfttemvZr1RBDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
	b=y+XmSDqZ9U9HAezFUI2/GDd590JqEhf21BhBw7NjZe/P5EzV2fjbZpqEDDaSu0ex7ZCv
	 1fLGl4Y7Vy/Hq2+fvH2N8KXuHU+hQqHLqqjZm6+snbsjeSb193uqu98ZBioFBm8Rv/i9z
	 2jyY6zW4BPCL726yYP78RqV61YDGAyYZLwNWs7XZYbzOYV6Fmy2ZTRCJvTOMtTMmsXu0m
	 kG115vPaE4DbxPDGoUMfImLWjOBWmiwN9qlCe49vAVhhh0pZ6j0uKOmYbZCg2SXL0FPrb
	 qI+Rpv7TbxD18ThCrtV3by/wD2urbl1nzN42mAZ3EdL9D7KZrW+rXrrfUWOgYtx9jHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWsiGxiM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3B606A682
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA3B606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWsiGxiM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJumXV3963245
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mg80NlqNhIn
	EEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=; b=Isdm3+S6dwSMvWxl6cJiPxQDHYc
	TTBkduGearKIXJFdEyftR2lH0dlFfflobdBqpo6hDwArreDSnh/ZxyTGnIF86bZK
	Q9kMCK/nJ5oH00mm4+4KNjoNnRnn0KNQnekv3uxaxrPDKFSh8SOGl/uUrqQga4wL
	sjy7FvR4lMLkh92tF8ac4Dwv/Qn9DsFoGToNny1oFYm7UHCSGGdND1q7hd5R+5ci
	IhEBWUYXy0qvXqvu3IiqxmktPr9PHnLs5qqHpdO7S/qkecQcvVNeiUa7cU9lAUGB
	p2a2+UDFXTJ/pH5fHscaWQcdkaB3RunPiFJWevgRLwm+gDc2CQgDOOm0Tpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7uny6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so2413970eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478660; x=1796083460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=HWsiGxiMz9W+RZYRRLNR8QXHiOG5WeU7hChT8rUj8Ic6IrX9b1bJu+JSf9q/QwPCPz
         4cWwc+GceZKxY30vvHQZZBQzQiyz8G3AKsY4n5TrojsCL4xhpaznRfZzTMTsydvh7wb5
         cE5FcBGrTQsgNB7Zz7N8El+Ol2k8P4lE2Ef2kTus7liWU9KzWi5+H1GF4K5JdBG4QoE9
         o0HmKcnRTFPpeuP3aE/zO3RJE05dhaXXLf5AVBqswnzp8yJEhOqYEE5ZkCOx6AC2OLGU
         bAETWFH4Dr7dUmyPYGV+X1WDqEJgADpbvlqhnS7hQ4DFD2fhV11UvIjeaiiyIfiTbwrF
         cnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478660; x=1796083460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=O3rxRXqjC9VkhM1M+N3la8uEBQp+47xfE0DaaHtNzujSQbFXlD5mWWJNfWvLDOCrgO
         8RMcNvzljLGOqQnhjBpbiQ7xb1xNaXajHQnB5EfCOTHul7xuK9stkTmBERU2HNenmd2M
         nToLPyFWPsw1LOlXKe7oRTdp8BnFA/3prLayh8Mks7FTEgd1TA1WivkT+I2+Ml4gPjgV
         zr8G7ClYxdc4BvfTvFkDvOr3SoGrBuKN8mCG/Ih7hamkMV+qatbLFlcCINTANlAgvQx3
         8nXVcbEGX0rb4WzfygrT6WZ8Doq8EcLbrEpFw+qJQT/fVA39IY1TRBLOB/RTZM6BABGX
         D8Eg==
X-Forwarded-Encrypted: i=1; AL+hErF/ll10B0aTsuXvU/8WnT+3VvHRLY9mnu1rEkybiulHz9U9oiSanHfaECRUN6PInhAMTS8tTjbBIkOhgekE@vger.kernel.org
X-Gm-Message-State: APuU4Z9pqfZkCR6XVBw4i0fgsrfDGlS4Cl+Zu+uETE8VzMxJattQnMsc
	f+wNr/vuA7KvvONc7tGEwD78I5xOsFaopNtJtUtmAGmWMB1+WrSetWf7fDR+cD8SWFVKmnGxKrT
	NQ/tOjfOrXvu2y00kMBI6EN02z3dT4fz+4PpVUclySFmUmszbv9hfizNhCruq8TSNT7W3
X-Gm-Gg: AZFdTZc475Cd1Z1n1ZfX1c9pErU1x9gv6Vi/CELtuP/j7U10uyjOXYX61dsAk3fkPlf
	TI6vpLAP9cR/PIWliYtPo4QgmtB3L7N7STOm2X9XRtG/Eir67Ls3Fbd2KHaodTrlulhM8eejpez
	waaFf4ehgf7N1inW8FnfcwvtXunUqGFnilfRWzKsbAu74vEzq3Zr2LbjQqE4jMESIHr+svXizRb
	4I9yjP+ot/7haP44qMrfA+XZcCETynsS+u9iJEmHGuXF9YYWyFfuwpDJ/El3qrqCkqpM1a4ymFH
	/Xi6pVY03Oyu2BvMTaOKj6WTtIz6DnTLkuXaF4/xwfXYtwwmzZN1bwP9KESY5Fd46ES4VV4EolX
	DGRHPtw2iLUaRATtnoxSlHcy3nVI55JEQ59mCFnkNeYSpZv6xgKWgdUCs6xu6a9kEX5SzOrBhhv
	s7zjk/1G7qpvkwHy/qw9Qe8wzHwJmPQGn+vjY=
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650584eec.15.1795478660276;
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650534eec.15.1795478659631;
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 2/3] net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
Date: Mon, 23 Nov 2026 16:04:14 -0800
Message-Id: <20261124000415.4067701-3-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04d485 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=Hi6WPrPG3QlE4bLLXg4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfXzJs0tlS2eQJ0
 6sa4pksAQQoWsq4EqgQWdSeDd0AaC7ffxSkpGQcg5orry9UkdpQumtj/lVO/P6V6hwbNsqHT2CM
 +bm+Fx4SJ31b7Mg+lhzPRRAEjSxb1P+jngN2h/A4cgOGFRzC5MMKFJIFN1emIs25jMiTXlasVsO
 XyBpIrEgq4B72XwlrW7QQ5/a0Ib1DNupJh9/Q+i5GikbEEbHWSBxWajsEfGNgsMrBbxtViS1+OC
 ZojYR2ZQrjm3iXAZridpGCn07dcKpzox8xMiRDOLLTXL3OSyKBs/BnMEc/sLCcuB62KeWUqAeuO
 d1Txaq9fj4UlwR3KeFGhVHLWrdaDkQIoStWfyk89hnRDL4QUN4lfAHP+/xYGXm1v7CqadqqBcC9
 M2IWrbqtPC72Wx6d6iBwLi1wDIOgPIdhDSiBIgMHgxRR/Zw09SUq6o4JibSXVBNW7AwunL6IEsO
 9W726sDmNBXzZ57quAg==
X-Proofpoint-GUID: AW9V4VebRIISsGykQlIvzGa9TQQTbmDK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX5Hsj2BGaLCsI
 uCGW4hsDSlgLioV8lbLZXeIpV2ulIF0gq6iUVN471AxJvyk1Zu0omsFTyZO96zOl5u5uYeWpRV8
 L2vpYT8tqxmofpZJDhBnKi4QRkeJYVU=
X-Proofpoint-ORIG-GUID: AW9V4VebRIISsGykQlIvzGa9TQQTbmDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230095

From: Jakub Raczynski <j.raczynski@samsung.com>

New datasheets for XGMAC (3.20a and 3.40a, depending on product)
support up to 16 MTL/DMA queues. Before we increase max amount
through macro, prepare dwxgmac functions to handle that.

The only caller, stmmac_rx_queue_dma_chan_map(), walks the queues
below rx_queues_to_use, which the devicetree parser limits to
MTL_MAX_RX_QUEUES. A queue above 15 is therefore a driver bug, not
bad input. v2 reported it with netdev_err() through hw->priv_data,
but that back-pointer was only added by v2 1/3, which this series
replaces, and a log line from a void callback does not stop the
caller from carrying on. Use WARN_ON() instead: it needs no
net_device and its backtrace points at the caller.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 21 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 77a54792893b..5b83fe07c1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -257,6 +257,8 @@
 #define XGMAC_MTL_INT_STATUS		0x00001020
 #define XGMAC_MTL_RXQ_DMA_MAP0		0x00001030
 #define XGMAC_MTL_RXQ_DMA_MAP1		0x00001034
+#define XGMAC_MTL_RXQ_DMA_MAP2		0x00001038
+#define XGMAC_MTL_RXQ_DMA_MAP3		0x0000103c
 #define XGMAC_QxMDMACH(x)		GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_QxMDMACH_SHIFT(x)		((x) * 8)
 #define XGMAC_QDDMACH			BIT(7)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index e50c0f4c482d..8aa69647a207 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -259,9 +259,26 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value, reg;
 
-	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
-	if (queue >= 4)
+	switch (queue) {
+	case 0 ... 3:
+		reg = XGMAC_MTL_RXQ_DMA_MAP0;
+		break;
+	case 4 ... 7:
+		reg = XGMAC_MTL_RXQ_DMA_MAP1;
 		queue -= 4;
+		break;
+	case 8 ... 11:
+		reg = XGMAC_MTL_RXQ_DMA_MAP2;
+		queue -= 8;
+		break;
+	case 12 ... 15:
+		reg = XGMAC_MTL_RXQ_DMA_MAP3;
+		queue -= 12;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
 
 	value = readl(ioaddr + reg);
 	value &= ~XGMAC_QxMDMACH(queue);
-- 
2.34.1

