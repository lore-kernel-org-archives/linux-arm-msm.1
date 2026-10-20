Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477101;
	b=tbLrgTz2FzD45BVAU6iUbZQ0C7+KWK/Qyky1Lb/pNDUlHzG4hWJTAZxkF0i4mjpolzf6
	 /vc5A/9gTm84qCDv3zqKBnr0aTsTpUmhCfG1FjqdUi0vAwA3AJ8mp4GXcOg9bhuRR9bkI
	 lBbb3yp/L+XvtBUByOrFg64c7uj6f30uf6LCKxvR4JqHXn8HRkg86qZ8JhekkyJnBt7QQ
	 ingH2qP56buI1IoHzOikXBY3v3ycv6M9KTv/zHjpQXBctSqYX+rPO8B86gTL+sAKvMS1H
	 aDC7/iDu1rykHWAzZEAGdOEYwWrdE2wfQbduy/gAIJjoiYJlAs72lFMFhYWxkpUlQVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2rQqbDcdDA=;
	b=hpo1T44w13wIz+H3U1BdjsAscZX/7xeHaOs6nHOn27G6nsX3aAmt1TtxvtPSPjm9EpFp
	 B4DkHw12nuPQN0RIy7l3A25G6lpFSoKxLz9IunJm4JtyXxzJMSwMF8pkLb1aq+sOPkKwz
	 mH2nXOoPGtJfZdwFiE4xp4zleGgH2bMxK0q+bjkywGtc9eZWcM8Ou/46QzT+FpL1xCr7z
	 Dht5VAZwv38yEtkgQcthK9UInwV4Iolj/60rkGvxAqt3GFWHidXKJ4SxZ7Kl4JZJgzrvV
	 EVctR/+AmC3jNehwpYqKIQ3sGnYM4mEKhW67wo4xL1hfUtjsyncAWt+cEmeBMiCQr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bv4vtO5h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/xxifIQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC6606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DC6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bv4vtO5h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/xxifIQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIvc4178062
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2r
	QqbDcdDA=; b=Bv4vtO5hJ19j7WBJjuthUVSk1Xab5xkRnWlcGgN5wNNLO2sck/N
	rmmmEodSWVdUvxE+Dm/XuseswlLrCm+Ppbmm6EgiuYVMSg45Cy2gS0zsBfR27zl/
	xtFY0fPxHiJBT11okZIizTxzQvARCyWUz3hwtV+b/aqzLoYzVzKSeZWjVGctBcW7
	6pbtO/1WwdzjDU+W8D5dveTSH9edKtjeD4OiT4V9BMFAa9H53dlzQayu0571rk0y
	u34TwaiWSDzu9h4V1CnHEkviCxKvutgSgNRYQpb3U2aPBPKXRIgjioMImHsqaut4
	wgJN6zE6bEwQ3XijPjdgMcL3TiBVn7Pu84A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n13wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:18:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso8912648eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477099; x=1793081899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2rQqbDcdDA=;
        b=C/xxifIQHmegt9SjgkuvBsKXLrZq2BtyIntAh6DzjNIq/mMoqxmXf/pHwO0okiDzkl
         8OK40aJVKPgag7GPtkIyU/lpIV7bKJt1FmnK6WdXaiF2Ydlj61wSM4mcqr84GXaPAxmD
         i68xaQ+l7vVQuRFEBqaHQlrOiFEfXxbSsKcXNA4X6xrpeDWzscjhXZLy4F4HZLexAHlR
         JkEwwgn1yr2/yuFRn/7ObDy27yr3zB/RdKhy6440jziF73w2T/FTbqK+EC4+8Xl/0Mvy
         9xBRS+QvU1G/hdXcOTxzL60f27xedVC+1yf6TD5MHjFsuIeUDTIVtrmJYv21iuRU1e/x
         KPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477099; x=1793081899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAsGOIGfH/JxbAjnzlFqcJgkwSEZVDVRf2rQqbDcdDA=;
        b=XHErFrknKu2H2Muz6n+JyI48oJd4HfOpYdK9bHqEu5aJe7OeKxfZFhCnrfBBChwxD2
         9nk/23JbWGPaoJZqz4fP4h76DgHwZ4wUqL9jHHhyyjTlYwj7GFicHbfzQ3/ZmvKr/lpG
         wsXdoo1cbKvx8FNpDb4cXQptAWFL9D9f8co3JNgEMTWhI8u52UdTqV6claSIngU5oK2g
         0/VzIs2OWuiqrOfw9sMA3LgvgH9LHElYUa1wksuHC6TMkl/BNg6AlpIWPM2CxsEmqO5g
         dKrOiLwGADHoUsxGCovBwRQ7/BbksfEDxRG8FDnosRJhql+e1t0ms/0Cblwiahp/DNvP
         FYig==
X-Forwarded-Encrypted: i=1; AKwUvBysdpZ+VaAQ3Lyl7B77BURyFobfMf16ri8XylZg/Igi0ipw08ihaUb6Ec9E5xvLg3hs1pHlt/9+ewwZkuzU@vger.kernel.org
X-Gm-Message-State: AFq9FYJQPiDM7P8ekAJ4Fb9Que1xUUb8CYNReZQ962vPxE49X65ssDpi
	nn91qvIVvrBIyrf3mowPHNa4lE0BsT8+yuiMQorPZM03JpNj3UFEmv3s0G+vBCu/492M0+gb0ZI
	H2ZGqlNgkbRiGyeHJ9Z5rFmoSH5zKe4GE58dQk0NBnUZ4CBhr/oy34YBRJZ+7W3meMY85
X-Gm-Gg: AYBFou06nOhbzbeODZ88qhsUHkNlj62HjbgT4GtNPzOtMJpu95U+Un3fnZ4XUNcJxe5
	9hIhdk8Lc8bT1zHDLJUXFyePpSQlctSLGn7kr0F4n7TE43yxKkldW5u0wcYiJhN4Yj/9qxgjR3d
	PYmK+6zoqVpl4XaUbfzU9CoHKOfOGdBbxS/p8j0M8US04jEScYr1JUyLDM+Wt8K1hLkHq6ZazU2
	mKcBZKQZq30faTrCR075KgsJUmEvxRd6GBZq240NZ/NHWNSWAgII6vhlBaJE/8ESJUV3FI5TBwy
	sl3N0cumwdmzcpe4eVUiv+hhqNFMi4Xp68sfTXON1KeDR3ulDv0zje5juPGL0hBV2Qcb8H1yfJV
	oqhX6nEn9jttBUNtJoD06et/+U4BkF95HT10ZAdNEYG3EdqOX
X-Received: by 2002:a05:701b:4518:20b0:163:d97f:96f3 with SMTP id a92af1059eb24-1850ce9e858mr13860669c88.4.1792477098594;
        Mon, 19 Oct 2026 23:18:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4518:20b0:163:d97f:96f3 with SMTP id a92af1059eb24-1850ce9e858mr13860632c88.4.1792477097963;
        Mon, 19 Oct 2026 23:18:17 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm33197858c88.23.2026.10.19.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:18:17 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Mon, 19 Oct 2026 23:18:11 -0700
Message-ID: <20261020061811.3127511-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-GUID: QfkYn34WDPJ9eRJe9yhVUE_nZUVg19FP
X-Proofpoint-ORIG-GUID: QfkYn34WDPJ9eRJe9yhVUE_nZUVg19FP
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad707ab cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fkmqLtjFOitS6APqvyEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX9WWMmOezPZz+
 Q62HJ0tf6kYhRdGaah2ojnXZIQQsj0EIeHijvPZ1Sg/cvt7kezwho7ThCeBmULBtpY9Jos7UhtN
 5QA2W2c89aQpYhkJwYQrtqwRw86WApliCZenO223oz2Hrb+Bh7MXwo6ehGEVXoZehyrEJoqsmdO
 dY9Tx4O43rbmtalg4j5Ir4uUobQAuRqKgxq7MDHFoQtlZv235wrZwXUAbS4+Lu6pzBX9x15jZvR
 wWu5MazI58MUL7GbPShyivZGLY55D1PbPSbjyGomzQrioYL0gIMyIiSdA9iO/SqCqFjRHAWVPKo
 Dwc6Jjq4mIL0BkO9GeIdTr59iGvnZF0aaxXgAiFNg/hzMvjkdLAhqQh+j0TsU0RJ2tXzJn2nYec
 L2qPwG4CFsB7hav06D4OI0SkZByEUgubnMkSoVthoJ644XOnrqDKoR+/gNReQjUGsfeuKPgsIEE
 rAzI8pdSy9eiVbt6xbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX5nily/aT62uE
 2SHhnAGt/wfwMLNpizmxILBiodw74rwkZm8BdFKUUiTMf82gwWveXLl7bzEmca7H/jmxrUIuq/2
 EubOqwz2pMNfNX1HZFzi+lrJd0MNl6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200024

From: Elson Serrao <elson.serrao@oss.qualcomm.com>

This patch introduces support for the XCFGI_159_152 register to enable a
hardware-based SE0 recovery mechanism in the M31 PHY when operating in
host mode.

During PHY initialization, spurious pulses from external devices can
interfere with speed negotiation, potentially leading to abnormal
behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
controlled by bit 159 of the XCFGI register.

When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
before entering L0 mode, the PHY interprets this as bus inactivity and
resets the state machine to its default state. After transitioning to
L0, the PHY resumes normal operation in accordance with the eUSB
specification.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..8d954e772585 100644
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
@@ -88,6 +91,13 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 };
 
 static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
+	/*
+	 * Set XCFGI[159] to enable SE0 timeout mechanism in M31.
+	 * This enables a counter which will assume bus inactive if
+	 * SE0 is more than 2.5ms and reset the state machine to default
+	 * state.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),
-- 
2.43.0

