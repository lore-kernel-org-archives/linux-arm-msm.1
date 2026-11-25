Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634737;
	b=W1eLBEEw6UN/mEo0+jAYOt28SXYEd41X6aZHOSEru1vDlk5FkUfRDvRpaYdindguCv+x
	 kOzy6Othg4lQIz6Iv/hJ0OxejSUmJDILniiriDtulyO0C7aTtajS2xNaUIZi1JELoAPfs
	 dZvhFLqSsOVt0XFzM+qaZnCg0Dpe0I027U4caLiStTGFi69Wg6w5E9rQER00opYgQgpTT
	 R8v+vVKGsQQBhOTLgoLDAiMsOtqGS+DCUm5lFkMKgq0jTqzc8dcTv5X3hBcTlet9s4VBR
	 bO2ykGuyq9wOYhSVU4Fzaj6dXHVs9Fl1ZfgTqC66bG5tqoL9FQejaMfyQ2kh37ydUJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
	b=AtjqVwpdWjpbjy/8DfmfdSDoA21ApsJaHa2Torhr8HqZkGY3NvJqhhLRbvKFgcRuVVp6
	 SIKghnt+A7vY+t/Tu3aoVU8q1lvhrCOtRviVEm3MhCxcPhJ8OtFIiscRYvi3J5zrFT5et
	 BW1Wb4CxCCwdeXCpdsMw2tzdXbBSPp9TE0I4Z5gSByc2Xxon3kvO8Z0hUxBGKU6C32blX
	 MVSu7xL/NriIobpQakTlklSCa3J9zsPrgGXfCEqa85pQWzHRQz8MwBkPabjVvn/LDp3Lk
	 485JF/VVSTCsvvdhdZFZ6XM1ST9dqbtMrnEuw+jMw35aaXAkiyz5W6k77lgHcJOgEog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i38nKeuC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE0606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EE0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i38nKeuC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAldB2028087
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPR
	rRtBfFBA=; b=Leh8WXRt5l7hIe7RtKjlc5O4uK+nTw3iOGPprVdaxO9Wigx3D/j
	yseENXSby6OKQIaWjOibcQI4z6ZjpdRZ7tFGzg33to60FU6kTUT8z3afSAgYeWjI
	5FhrOLjTDxITtVOUIsKra7Msfm52YhkkD6Xt/nvqJg1mtroD4J3sNMWJ2jUmbXDJ
	mHsuaEIdJpr5aXCQCWV8Y2rv/qNGTAHeAokCP189kMSKNkmPlY3yWQaMVPzzcqOV
	SDqPwLCepzTVBQujZPAe8worS+Q6CW7b2d5FR3WJceX+47miYTFXBzwYvCuCKdiv
	ePFT52KlwU9/XN39stnSQVwMP2YfpgzR02Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62varsu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:25:34 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37620eb73so7874004b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795634734; x=1796239534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=i38nKeuCZvZrS9PstHZLOonhmz9vURpO0ke/tlEc6M0mjXwYns0r/eV4+Ihlf67xjb
         z4QtwlYLBk6IRg57erg/PErNC9b1/wUQ0N75T/5ARJF9ENiINwZBLlC3qa7q0dWlq23f
         oqiQZedevnvZrErfmj92whzucU2DBb+nh9tXWxnZSOfChp7egrHyRytAfie+WoydcFsk
         LhkKVK9St39xWUbfpE54ljHFfnQaHpOhkvd+xe59HPOgr74Txc6zNFY16BlwSR0Nubx3
         GXHDHk+tw/jSMR6FiOdaMwRr6T+wm8KGsyTdCReTZGlYzlI5dX6MXh0bsqV1fVwVZbSO
         riBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634734; x=1796239534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=VjDbM2Ef+BkJSjZ0iLZCk0lqHjJ1D4KOqpDIPGLDkq2bagWEEClc0c6x31sNGP7LFs
         HkpCPyTWWhyL8mKz8kJTopownp0IWUmfA7xQFmtJ3uGTG329x3iFf83+59dFOAGnZpRJ
         g09HLAWhyxTsvJndEYX6K2DKBqZzxpA/4SlfYJO+JdlUlMh9TJg877R/Sa8vVCsUCdOb
         vyCNLY8TGM99ElWwyyXcTbsR68X6jBO7MqJVJ6AENXZER4T/HTcMUfxjgCQ2tqC70D6M
         aQ0Nl4DnGsHt+UwPvnHG5DikN/M28lNGg/ZbrdqTixXpD0qSGO5Ie6rfFNVRyeSkfYs8
         1GQQ==
X-Forwarded-Encrypted: i=1; AL+hErExL+7nV3ynAv6Y8QvGTv6OwZ4+7AF6bnHR9S3MjE6pKoAn0gKh9TyuCpurfnbA89ikLAC/RME+7tt+MAmV@vger.kernel.org
X-Gm-Message-State: APuU4Z+cHfAoTfzS031udYXPKHbLTRmkMfkHar5vc6rhSRAq6/dpt+5k
	jl78/tGXa+rZfZLBoPdSYeRTS9vqa8oCqoV3KhxamERInZHoZbgAHllitdwuZ/kn3AqGEIxW78y
	oPsnP9aVUOy1pqfQ13Bl9eJIoT0ohgG8DCYK4mBpwSP+5sLwWxXqqMKro5Cewl65btE/A
X-Gm-Gg: AZFdTZeMFSRNa8Nz7HLBJjTTd7Abssb3vl9Dl6nSY1T656v8d4ecdPI1Li4oyay0VuA
	G5gVlLpPsH18YKKcjfGH1aTyX7CfFD3NibVk/m62AZJxSqGP1U0/QT23znDkRTiY0oO9Z17isOI
	xV0MfAzGo1V0CjlfttCZCwMPcTrNPLX1Mc8NN1b1iXI3f2j+N9l/ndh7ePJvIZej6JAVM7LSUu7
	cme55EjsBq6AwiwtcNYhehmNY3MBtGwZJd6A1f4vVegQ6zOA21n3srlJIF3xR7Y+bTA6HOKTOG1
	Y2r+gKVRj6QStnX7ZV8mxlH7en0TJ0ha79VkjHKk/aPD5pmoUubJ3hNht7jcJJvh7duB0FBzDUk
	q5Ge3SzGERTU3RqccCQra+SrdUTLcXcIsCtcfQTINKtclvWfM8wq0wvF316u/F6Zgbh/u1syd0y
	k0r+lmFGWAhKM751GXcUe6wq9MCEAZPXGAhkwq
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422927b6e.68.1795634734055;
        Wed, 25 Nov 2026 11:25:34 -0800 (PST)
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422896b6e.68.1795634733588;
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm18125768fac.16.2026.11.25.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        Jose.Abreu@synopsys.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net] net: stmmac: xgmac: fix RX split header length on multi-descriptor frames
Date: Wed, 25 Nov 2026 11:25:31 -0800
Message-Id: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX6ibTR5CExrVF
 0oV0iTlJHsDPMvxfcSoYU8/M5P88Ppex2D28m8YoaGjaT1XLCXhWBX7mTRgcd+MM4HM2gfL/Rzv
 5T7CA1dDtlg7Fg9kSRB6wq14DJlpX1w=
X-Proofpoint-ORIG-GUID: 8UFsZ3AzeienMWK2fpCGvE683Khl9S2S
X-Proofpoint-GUID: 8UFsZ3AzeienMWK2fpCGvE683Khl9S2S
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07362f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ojtf-fZehEoJ8Fw7nBAA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX0G5vK4B/aeDT
 Rm/HWdmX/I+k6AyGIxo+RXcj5rZYEGwTv2ktTWRw35CIMOESBy59q8NlF6AhCc9jFdmkHLSEdek
 kjKoPKs7IPU531dZKDt/JtMQrZy+OBnXdRppq4VqYTwHl1fqal6UbFv96gJYdtx1IbhOtyialpo
 yxnEjiZumlzjgsIQAySJ1L0Gp/h647CH9KnSxzZ7dJ9cQJbHRZleLoiVJ9g9/cNha+nIHLXmQrs
 ET4kZmPpW2niLxG0BkdoK4Kqsvkj7H1iP7twPwVD60a2Tv55WuH9L1K/qRg29fqkHKkwAbhlyGL
 MsNOFstuFZOqbgnL/T8pcJtA8J87c9HaUMAT4gQ89wbLVgRxXEfRfd5irHKxc9UV5qJDDxPvLaf
 ouXb/sIIqPiWds8BQHmwKgfEVguDKy6Nb35DFqk1hyFvSrQ8yLOGfM4hfTmR0qdEcR1fPKv9/7L
 LeudLNjSwWlxLtdjEjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250077

dwxgmac2_get_rx_header_len() only reads the split header length (HL)
from RDES2 when RDES3.L34T is non-zero. L34T, like all RDES3 status
fields other than bits [31:28], is only valid on the last descriptor
(LD set). HL, on the other hand, is only valid on the first descriptor
(FD set), and the databook's "Header Length Availability in RDES2"
table states that HL is available in RDES2[9:0] when FD=1 and LD=0,
without any dependency on L34T.

A frame spans multiple descriptors when it is larger than the RX buffer
size. This can happen at any MTU, as XGMAC_CORE_INIT_RX sets GPSLCE and
WD with GPSL = XGMAC_JUMBO_LEN (16368), so the MAC accepts frames up to
16368 bytes while dma_buf_sz is only 1536 at an MTU of 1500.

For such a frame, the first descriptor has FD set and LD clear, and
L34T is not valid there. When it reads as zero, hlen stays 0 and
stmmac_rx_buf1_len() falls through to the rx_not_ls path, which counts
buffer 1 as a full dma_buf_sz although it only holds the split header.
The frame length accounting is then wrong and the skb is built with
the wrong data.

Read HL whenever the first descriptor is not also the last one, and
keep the L34T check for single-descriptor frames. Also return early
when FD is not set, as HL is not defined there. The caller already
ignores the header length for non-first descriptors, so this part
does not change the current behaviour.

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
This fix was split out of the net-next L2 split header series after
review of v5, where the multi-descriptor case was pointed out to be
reachable with the current GPSL setting and to need a separate fix.
The net-next patch will be reposted on top of this once it is in
net-next.

v5 of the net-next patch:
https://lore.kernel.org/netdev/20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com/
Review comment:
https://lore.kernel.org/netdev/179548403438.3135.1804854034587814346@kernel.org/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..0cdc0bc695c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -437,6 +437,7 @@
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..ed38aa358642 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,7 +292,14 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
+
+	/* L34T is only valid on the last descriptor */
+	if (!(rdes3 & XGMAC_RDES3_LD) || (rdes3 & XGMAC_RDES3_L34T))
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
 }
 
-- 
2.34.1

