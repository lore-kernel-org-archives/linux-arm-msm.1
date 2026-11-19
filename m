Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079858;
	b=Oh6ZWJ48+8+xN01kH0jMV4hoozuBFUJ+uPQUOf3U6+fmEpGgc7qS9Bv1nxU9pol1m88N
	 CovhgKPolb3EvK+vflj8DEaemIRhLAm8OFyX8IzXBzf8rAYlwGUjZf3UL57BfofkVKE0P
	 SAIkLo0dXyabaTCkhle0znZnuif+fAq3yuOmSU3fzeqJwYIoO5CPsc6P6AcpJkMaUlwn0
	 giqPgK7Y93ovRYt08mLHdKiFzqGIQDRzUP2idpaq0FWblCv5Zmd8YPdvMY4BL2xA+SWOV
	 WAfOToEnTLvC2Znb5+UEM2wcEvfMeUtiZyhsegtJBvZhWBhp7hAn+AHC+oAP3jTB/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqGNhNN2NXc=;
	b=MqXdf5w9ShHJKyTUufA0TDLG0KSd9/ms34kMMFtC164gd3kHWNDx+5Ffl3nEUZzrxI7Q
	 Pg22YYm5zamfuW6GZx5JLhRCVADea0avnUsv9H1RDzb6as43U66NrqPw3uWjzaQV9bnFG
	 45sOwptDoSWTqtJRKxZ745CkOPkcug+2MJSfB4W+abhIs5BbP/aKPe/0av/Nit4WajRXc
	 C9ReuE03zboVaj3LQ+lVAqas7H2idGkODgl0QixOxwMtBd5MWXORiaM35sbHHa4HA6ryi
	 gkn+8dVqevA6r6ifmAuekIkzXZNv2INcmUMTuXgtyOxymVRPNTsvW1cH6qVOobtT7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9bOV39p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WpPF8S9+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D7606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9bOV39p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WpPF8S9+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vRaH2671943
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqG
	NhNN2NXc=; b=l9bOV39pK/XM3+0uR75nrnQ2CFoHFxKyNKqf4Qi1dU8PGeF3Ua2
	UgM0HxrunHWckyjvs3IPc5Gxa7QcE3eAxEsfytNgNia+pDrEj1H2VOfuZTISHd4K
	hXII/yMLT9Wd//xL2Aej3YEp1ODw0RVDhDs2S2dkcPUJ+9KAQ0Se1z+uPuRVGZ01
	26DIBZrKYUN+4ih2F1viroU5xVf+bH5iwKqFVTbAOEfpRe6zo2KbrMeFf3IGtas8
	FzNwmXF2hhJfKNNtiX5ggEzIzTYiq7g6HzE/W2mcQgLmZwq8AMmWEZKXaGNuASa2
	Oid7ZD3u7CLejIekslqDftpufUfa0V4rynQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p3qt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:17:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso176396eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795079855; x=1795684655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqGNhNN2NXc=;
        b=WpPF8S9+uHpU34DXlZP5hyU3gYlzj7oD5NRU6SmQSYUSUphS+FZgZW1rcsA6C2l/6I
         T6eHUETD1Gp7tnpQHPC0xkFc08jRQYUY5UyvWjIaOx8DvBUDKQNHQ8Ep/rza3kXs2lca
         pKQ5cQA3yhHFRFpU/O2Po6UcbCbpVPZXOdKytkYLDqGfsrhfgkOj8lTcyvCqioJPNWwX
         sDhVgx4ukc066tC24YY/PDTjS6V3DH5Cym14DFWrzndQqTR2Siph9GBiFmt0bbMfFb4N
         D4fdE8AC3/aWfKNeGhIXMJAgJPJpEKRYyGT97+GbASeK80GfrFIPMiGLfCFLfH3dGoF0
         /xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079855; x=1795684655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqGNhNN2NXc=;
        b=nygkCwX4dNM9eX4qFtRLMOmjFVoBWZNd1vJne3abHzn4i4fi0o3kx9d9YgOxJg+CLr
         um3r9SFQLWezsQhsV8TH1CpnyTp1xNc176h4bk0rpGdU3kjsZAkVmy9WJCXh9ynsMhPw
         CxCRNVimfqGPiYvCHPvueEfXuZuM/9NoYoafGEZFW+WJU6txzHN12zCwrlexsOCnxUVZ
         b0tA3C5UPDIwDCrztZfyPGLekq9ECLibjiknI13cbjitgd4rIxh2nqnZjM0QRZiNmuAq
         tJmzUY1lkRdCgTOXk5AftKuZKgDjGSAg3Jq+Ewi48aOFL/pCFBE4/o4u6X256gjKaf3P
         562A==
X-Forwarded-Encrypted: i=1; AL+hErE1QWKavjLb3+voOtUA9m0HMICBLyO1y0+V/r4BeC0q7iXqFLmgWzMDRAj57y7HsGlVXC3ybUYX8ytksJix@vger.kernel.org
X-Gm-Message-State: APuU4Z+n8a6dAeXWHQuDIfJmT1AE/OPUQCuqWVnif/6okJl2yDEnu8Kf
	2XtlHhTSHJVzjWWGLmYtYlb+VzarCQf88PA2IHGXfpv0svopvRPw5FDBoigrMSFykbtYZIA3zqD
	FfscWzBREBUxnRf9BB0+b99DCRqypOEh3PDSLNNoevYzLLPrCsctR4vufJaStvk+pOeXL
X-Gm-Gg: AZFdTZem2luaq4hiviLMRc1quxwUrel7W3Smo5+lXFZUFc9LTNT2rtru0i3I/T+2eXO
	1JXwM6T92lmr9uIehCWyowzS76ZJa0PTBiCrZqFM0h3GWXu5y6BrM0FBXKxxaP9Gz4z0v92V5i5
	S3gn7jQVareimzfsa3NlIu2RrsBCIk4aOlfGR+hqEJY3V5vbKaOO5QdxeSKNDZBAzn5xVbuztj7
	QzGJSfGUIdOAL/sw6gMpu97LXRNG66xdmxzpXIFzXkQKEhXD97EqKH9oqHnusQqRQ5iRdDbMUWm
	pQEWLjorTE8srT+YFC1CjxRWV4lOGQJeytzIfYbZQzAzQ1lSRpI7UtkPqhXe09+QecoJa62XaKS
	c3P54NIX8nLKVh+0uoQ7UVZGRa50pDZ9DCGPb0uWgc/9g5DSyGwsOsjzkBAu8CmN+n8Yz7SQyC1
	SnU1lt1RLGmSImOsKDpeJlcw==
X-Received: by 2002:a05:7301:6407:b0:36a:270:ce76 with SMTP id 5a478bee46e88-382c39a3142mr4345518eec.33.1795079855069;
        Thu, 19 Nov 2026 01:17:35 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:36a:270:ce76 with SMTP id 5a478bee46e88-382c39a3142mr4345485eec.33.1795079854581;
        Thu, 19 Nov 2026 01:17:34 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm3625057eec.23.2026.11.19.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:17:34 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Christian Cortner <ccortner@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v3] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Thu, 19 Nov 2026 01:17:31 -0800
Message-ID: <20261119091731.301966-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: 5qNa5J0QM_6K5le1cgv7ITAXEDIfp1_O
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afebeb0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=z4GiM80-XcyTzbghJJoA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNiBTYWx0ZWRfX7kHYUacdWQSi
 eZd2Wl9FivmZAg1e8JnJVTikPixL8DwTJsJESvxYjl84peLcbFP6+dJFBqG/nWopYvfcA/TxWPL
 ma1462EJiYNuutH2FbJskrB5rcTRDgUP1U0o58o/yl4ICShSh8qw0Z1azGiAQ8czkqqQPE1nr9+
 UcYcBugs7XbmcvM00N28h3YbrzCLhvvxxCp+2T9stPZzkNxnt7ModKCBy7JSyDwYaej6Srv4ZuM
 sPN34LJ7arsN+kw2VkR94aOPHNh4JxG3w+xrIhQRn2JjZ7rMt/9RZwyUqKxaizNh2JPmc2dt9b8
 fkVWiQL9+tP+bZMzOEXgv0vSxI+MAgE8mtozJ8ZDw4wKsguuQeDxNuNWWsIeS3cSaWVRrAbJmPO
 HRt/0ThKdsLjw28c4gJz+Q+HeuzDwAql9ITrzcDUKyQvh9wRKD4rUuefe8iIoZsNshW2BucerKx
 pzsMHVMvMsCs3qBw2aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNiBTYWx0ZWRfX6HGyDF7xTZRe
 BMZApKsBJbN61yvrPSGYW89t2amz3NpOzR/4Iz/YmJ62t8AvZPfKoc4YMa4BY9bg17lSvkK6GGP
 ihUOEaP5rK8giVihR+u9fOTpTRIpiUM=
X-Proofpoint-GUID: 5qNa5J0QM_6K5le1cgv7ITAXEDIfp1_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190036

From: Elson Serrao <elson.serrao@oss.qualcomm.com>

During PHY initialization, spurious pulses from external devices can
interfere with speed negotiation, potentially leading to abnormal
behavior in host mode. The M31 PHY provides a hardware-based fail-safe
mechanism for this, controlled by bit 159 of the XCFGI register.

When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter monitors
the SE0 state. If SE0 persists for more than 2.5 ms before entering L0
mode, the PHY treats this as bus inactivity and resets its state
machine to the default state. After transitioning to L0, the PHY
resumes normal operation in accordance with the eUSB specification.

Add the XCFGI_159_152 register definition and set XCFG_SE0_TIMEOUT_EN
in the PHY override sequence to enable this SE0 recovery mechanism.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
Changes for v3:
- Rewrite commit message in imperative mood, drop "This patch" (Mani)
- Reflow the code comment to use 80 columns (Mani)
- Add Reviewed-by tags from Krishna, Abel and Mani
- Add Tested-by tag from Christian
- Link to v2: https://lore.kernel.org/all/20261027015545.2758784-1-peter.chen@oss.qualcomm.com/

Changes for v2:
- Add Fixes and Reviewed-by tags
- Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/

 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..70fcfaa8ced4 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -56,6 +56,9 @@
 #define USB_PHY_XCFGI_7_0		(0x15c)
 #define PLL_LOCK_TIME			GENMASK(1, 0)
 
+#define USB_PHY_XCFGI_159_152		(0x1a8)
+#define SE0_TIMEOUT_EN			BIT(7)
+
 #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
 {				\
 	.off = o,		\
@@ -88,6 +91,12 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 };
 
 static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
+	/*
+	 * Set XCFGI[159] to enable the SE0 timeout mechanism in M31. This
+	 * enables a counter which assumes the bus is inactive if SE0 lasts
+	 * more than 2.5ms, and resets the state machine to its default state.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

