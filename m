Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772988;
	b=OO77rqOc2NHaapZVRJYe206b+J42cT7BMa5DIlYRwZq5B2tC76L4TxVQ2QWior/r0321
	 Ndxy7gmcVh6pMUFPXAdGRlohOXrOSwJJolRz48iGnmFNpzja67uU7CjJ3FP2t1FMGBxT/
	 A+pfnK9+oZThd28Oyfiqu7i0CjotF1BnKYJjkVYM6UdHNvWnRcYCttRmVv3/Wqvru94Wi
	 oRHEh9UD5gZoIibBGb5N1tt/4cFTywlcQfchXXhChylGipsLtuEXggYdmzURYaog/xNuU
	 kscvcIUpZET4K5QnAchEqPTqkZOBQV6gQgZtCTi4cIp0X94dzcY4j3yHZMct0XlXZkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g/dVMNRTOWVJS2h58fwl51KhjKkHrbLZafbPNTqM9uc=;
	b=nVd6YOyGYmHLe400nS5SZIpeXfhpmcw3FQZJSnza1+SE5+lr6bJ7tIafADQ4YaqzVpCt
	 pOrxAMEhlwxYMWKWtBSiORGqUXoD3raMeThIdENzrKjcuH78gKOXipdW7dZs9kDdZtbWp
	 UyS6eJNQYJQG176fTUjIYA9kGBolEDA1KW7JzGEj9k2G0ZnqdyFptGvYrJKrPAzlz/uXI
	 5QiQjvlZJKkkIB8HEboiG/tRRlyDC07w+YQn+Pe5K3tfNX9mHbqj/lBgj78ijmigjDRvk
	 K73XOBSOMpNIrOFWHBqwbQG/oQJtOb3mgJd7H77Maq+NqflTTdzeFIOrN9SkoYCjCPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UP1Dhxiy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ch8Y0IM5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC84A606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC84A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UP1Dhxiy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ch8Y0IM5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GKG51779846
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/dVMNRTOWVJS2h58fwl51
	KhjKkHrbLZafbPNTqM9uc=; b=UP1Dhxiye4B2BdT7JAUE00JjbsZ4xmoBOUdQxG
	hzWLQiu9txzZVxf2lpatCtuEaeLzgdzTqQwnnbMMcpUEcaXzpPCi0JVIYLZV34Zi
	eQPjpzyZyFMVc1a+4Es7RL6O2nLgp6ejMHw2IJJtG3xgXShrrfO0ogsJ209NE0LC
	k+cY+RCPcIZ7vDHIvdvG77cl0htHxEsHK9jVne4tNheqxEJB6kSimESMXi5wLuWl
	6h3WljE7NGhsiOR1BOv0DY2gi9z048b3dZ04Ncj/EkxQlBVaGyQrpHmc4m4PrRTA
	zSh8zlOujp1+uqGsx4Z0Ff0qYvMh1009eR3Z9NuLoKRU0aNg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhh0aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so8514848eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772987; x=1796377787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/dVMNRTOWVJS2h58fwl51KhjKkHrbLZafbPNTqM9uc=;
        b=Ch8Y0IM5/BGMEDZxtn8sCYe5uX1DesmA3MXO081mxWyOLuSFYk6jORjYyTf+71aler
         CmtmlMBrMcr8y2/7qa+hWZfyFaWAbkm8VXIhRY9IbXsmzdYTljWxDmL1ZbnFKhhemMcb
         I1rp/GkSV7UuCRm2LKe0NgCt5Y42NsQkcTrA/cPvtqexWAV8AXqk8LvjtJNsSQ9k2IRH
         x3YXmRutsozu4YMCeD4DGyQy3cEtwjQtaWswRdtQQRrMQPu37XsZJjGXN4efgopXi+mq
         o9zTNW5jNJ4hMOxAWaVDWLlGQUE9fLUMpBIRkA3+j+cTvd0B0RxcQC8Qs7CkAxT0Q+kU
         9Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772987; x=1796377787;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g/dVMNRTOWVJS2h58fwl51KhjKkHrbLZafbPNTqM9uc=;
        b=04Sybh/K+IbInjEavJrJxgpY0t24C93omeFbhgISrrtbrI4lN7Qez07y3i2iRcDXtJ
         30hbyUS+3WQ4oXoN0BrD6nFDTpD76fvyQBzldxwm6RAPNDjRFDSpddIjK5HjmVcF1fmv
         ybjXAUFl+AF9igCXtc0RYt5jlWw03N9rRKCCCGd2WB7ZAk9Yt6hlaoDT55nO5H+khy7A
         2o+kvF5ZXq3l7SVuEU7yk5DeKhuNqMIKrPfm9O7Zi/S7gJvB5fKMEcyPKgH3hFpsWVIY
         cwY7nohdEdsV/DDw5Ay4Ps/sXSyI8qtSEL8sxjkKYPLlLzEt3KFqHgxs0xthRNjWmXWC
         JGpg==
X-Gm-Message-State: APuU4Z/2FHldjUvqOwBzHi5ppreRjILtuUA3dhz1O5KYmiZxkseafHMl
	c4p8kMxrZ5aFm0BGZZGV5Ohf6uAFRIX5/kxABgKulOXmkOfDf0IYVGzBNwzSR8WHGhJyjRAF+/o
	hTi5ZZSfaPpLS6Rjcjc1MIrDA71bGMdsqj1PADkQpc3ojTlVyO9024bnRfO/7Q2Av7Lie
X-Gm-Gg: AZFdTZetsLNJgTGKDCrYz1yvO4ZLb3KM1eAhzxL/MeitO6wz1Phd8XCAU66u3J1ELLW
	fORWJtDzZy65nBe5hJ8lATITZG/odaFTRrzLbJK9UygusXV2eQk20SJ4Hy1rj9kLgsVTKLVivbk
	lZ6NsquMOnoaKuoKKMFsAlzC7k4VYsX9suQHGIq3k8QvxT0RmgNJTP5mo9P9ZhDBsLMWFd28nht
	+Py2u5zK3LdOgdu+qp6qu0at8iJyhnAUE3+X4zF7iGMljHIDrRh/saFl/rXSSZwdNZ0P3ugswr1
	Vq8iBbOEBo4VoOzk8uzjKs6Vr4VU5NWinV/YQXogcWCAd1XTui3SQCWYQRhgmxsaZguK3h8Tg16
	Oo2r0pMytouvKS2VFGjOBZ6utAjl/c4o3k4XYi7A4WEfhcSqwGY/zdO1Mv403iUnaJdsWwXFw4S
	bETTeov7bpUsb5Ow==
X-Received: by 2002:a05:7301:26:b0:37f:d740:51d7 with SMTP id 5a478bee46e88-38571b1308dmr24670080eec.41.1795772986473;
        Fri, 27 Nov 2026 01:49:46 -0800 (PST)
X-Received: by 2002:a05:7301:26:b0:37f:d740:51d7 with SMTP id 5a478bee46e88-38571b1308dmr24670067eec.41.1795772986018;
        Fri, 27 Nov 2026 01:49:46 -0800 (PST)
Received: from hu-hsreedha-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm65178723eec.29.2026.11.27.01.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:49:45 -0800 (PST)
From: Hariharan Sreedhar <hariharan.sreedhar@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:40 +0530
Subject: [PATCH] phy: qcom: qmp-pcie: Fix missing shared
 vdda-phy-a/vdda-pll-a votes on Nord
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-nord_rc_fix-v1-1-2cddab95b91e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADNSCWsC/x2MQQqAIBAAvyJ7TkgPJn0lQkzX2ovGChGIf086z
 sBMg4pMWGEVDRgfqlTyADUJCJfPJ0qKg0HP2iilF5kLR8fBJXqltdbbdCBGb2AUN+PQ/23be/8
 AaHguuF0AAAA=
X-Change-ID: 20261127-nord_rc_fix-888a8fbeeda6
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Hariharan Sreedhar <hariharan.sreedhar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795772982; l=2578;
 i=hariharan.sreedhar@oss.qualcomm.com; s=20261127; h=from:subject:message-id;
 bh=i3E5sBvhssKdtPLNwWnVHLoAWh3t7XDA7nSsvH84w8M=;
 b=pIYu8N2S6WQWDXwY8iAtxm/TQjS1WZ0sT640DDmji1Ad4y0AFY4BEZ1wyQ+DE2Bdk6oOB0KML
 OvxglYAX6y+D6x3ft9tn3MmXXixiENQiiwvcB2+Zz8AURSvQDDrDVV0
X-Developer-Key: i=hariharan.sreedhar@oss.qualcomm.com; a=ed25519;
 pk=IQIpQ+cgN/94LwyXI6ZP0PWPyUZmrnRMQYkbY4j7yhs=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX8PhHWlYcp6uG
 bR98mm3MuFsS1Fs00VWgHe1wAsrrH3cGmyQveXr9vihVpTnrsEzKEMmgDK+VJ6v/nr9IOn7fXqs
 98SuDaQRqGksMX1Q583WiuLUMNUJ020=
X-Proofpoint-ORIG-GUID: RXv5_Oqyb8bgZTkY14B9rOLDyjmgX5nF
X-Proofpoint-GUID: RXv5_Oqyb8bgZTkY14B9rOLDyjmgX5nF
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09523b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=N3CJI4e0y6JgIT0HOQYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXyxTLLC+qWenF
 yzkgNByBDKMITFhxvNnkujZmoCyRAH8wqkMrQnKX9l3upq55YAuppeK2gOobz4Nb9hSyvzoMH5M
 lRVpMHsv23zCZv8ch6HOD0oN1zZNuc8bj1x27V2icn5B9NoJnphOBl5JQ7u0SVlJiIvMWJD+X14
 7waWBO4njoFxM9W0pVlGIm+dLRNQJ7SEcwxBh2zZ3QJKG3JxrrykYVr/pFmAtLY38Uje40OWXOT
 50Qgafj0J0Txt6LXt0a+fGmtwsfeP3o5xBipz2e6xCMGltwa1qeLkQC0Swb9VJ8CS5zVu7dWQpf
 ECCcOw6pbtSqd1xD0RcAvrl6TYZAdLSjm+oCJDfmbnCPkOUAS7SRtEXbm8XG1CY7uUp97J8RbGV
 HxUPqyEegwh8RIhjqlgB/gmSgOgjorc5F8AOukTW5ADfnrUZQAp+UeKsS8PkbxCKpkd5IDSmwJj
 rc8QptdKWt8Z2mjI6ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

The regulator lists for port B, C, D, CD and BCD only contained the
per-lane vdda-phy-x/vdda-pll-x supplies and never included the shared
vdda-phy-a/vdda-pll-a rails that back the common PCS/common block.

When a board enables only ports B, C or D (or a combination that does
not include port A), the shared vdda-phy-a/vdda-pll-a regulators are
never voted. The PHY common block, which backs the DBI register
space, is therefore left improperly powered. Accessing the DBI
registers from that under-voted rail during suspend/resume crashes.

Add vdda-phy-a and vdda-pll-a to the port B/C/D/CD/BCD regulator
lists so the shared supply is always voted whenever any of these
ports is active.

Fixes: e397c8507e36 ("phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support")
Signed-off-by: Hariharan Sreedhar <hariharan.sreedhar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index ccdb7748a9e1..90ff12faad0d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -280,24 +280,25 @@ static const char * const nord_pciephy_port_a_vreg_l[] = {
 };
 
 static const char * const nord_pciephy_port_b_vreg_l[] = {
-	"vdda-phy-b", "vdda-pll-b",
+	"vdda-phy-a", "vdda-pll-a", "vdda-phy-b", "vdda-pll-b",
 };
 
 static const char * const nord_pciephy_port_c_vreg_l[] = {
-	"vdda-phy-c", "vdda-pll-c",
+	"vdda-phy-a", "vdda-pll-a", "vdda-phy-c", "vdda-pll-c",
 };
 
 static const char * const nord_pciephy_port_d_vreg_l[] = {
-	"vdda-phy-d", "vdda-pll-d",
+	"vdda-phy-a", "vdda-pll-a", "vdda-phy-d", "vdda-pll-d",
 };
 
 static const char * const nord_pciephy_port_cd_vreg_l[] = {
-	"vdda-phy-c", "vdda-pll-c", "vdda-phy-d", "vdda-pll-d",
+	"vdda-phy-a", "vdda-pll-a", "vdda-phy-c", "vdda-pll-c",
+	"vdda-phy-d", "vdda-pll-d",
 };
 
 static const char * const nord_pciephy_port_bcd_vreg_l[] = {
-	"vdda-phy-b", "vdda-pll-b", "vdda-phy-c", "vdda-pll-c",
-	"vdda-phy-d", "vdda-pll-d",
+	"vdda-phy-a", "vdda-pll-a", "vdda-phy-b", "vdda-pll-b",
+	"vdda-phy-c", "vdda-pll-c", "vdda-phy-d", "vdda-pll-d",
 };
 
 static const char * const nord_pciephy_port_abcd_vreg_l[] = {

---
base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
change-id: 20261127-nord_rc_fix-888a8fbeeda6

Best regards,
-- 
Hariharan Sreedhar <hariharan.sreedhar@oss.qualcomm.com>

