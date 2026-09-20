Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45863CD8D7
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912769; cv=none; b=mikAZ1zXw/Lxb6kXq0/2xjlQtC+D23r50RagowIPrR+dV3V4qJft0DMNy7UTfgMBf59etIwIUlTNSs0HKTfoJ1UGvX2/w3Zq5H3xGfswY2NFx0ECm/FKczOpGvzaUax6PdlvnmcGJDiaBqX00s3p+9qYAGNJANbTCpKOA99feJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912769; c=relaxed/simple;
	bh=tDITmfjnTcDQuM/CcuS9NmrD8cjJcov96HMKbqv/qSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMjYpsLtheyOJjN1hD1VoJnumYsgwIZW/W+J3enwgttQB6z2MUuDYwjVSRTEzBZTVJwbUjJ8jO8vYsJfSg5iZjLqco1xOM8YDvkP0UbgC5p+t8lKPKWWMmRMY0HdDHvEjpr73dp2D2FrZGhGJQ++w6DrAbLUo6pOyJffDR9uYIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hg0idlaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I77mqirL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg0idlaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I77mqirL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoALi2287874
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpaEUk4ouLSDddqj0xeVFcwk3yNTz1uMr5TrFDwAj9U=; b=hg0idlaQR3FU94Kz
	p+TKB46Kbvvt3QrcMWHycY3LI8OdpfY3BRk2El85kJb4E5mKPbUtwePODux3iwmN
	i4wPtYqV8ltwuGNNvW36HM/EwKanysPfWtm0fQ9XTnfHdqRAVVmmYF46jYAaGyT9
	xICFx7ddId1ZIORz8tSu9vjMnZgeqVJxV7sM7Z8EP4ClR5WNFOf4pCTBtGVYeag3
	N58tQ7OP03MRqwtG8XZPliNwBwTVFTgjygOFlOKPItuB56o2TmwNtVk4eLrJtEZs
	btkMuj8lAGxLSK33ovNj5SH2KdBHH+D1BYOq76w3nyb3uR75CuD/xaNHmneWk4wH
	9E0NgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnuevw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:59:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso343269785a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789912765; x=1790517565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpaEUk4ouLSDddqj0xeVFcwk3yNTz1uMr5TrFDwAj9U=;
        b=I77mqirL9Er15i1MlCxFSaING07skhB0t5iR5H9Qjl07KbBmKzSofpQXUz4+zM3ldG
         pqPPNfRzywq7zdYmV/9bzbulpisXn3aMypckqfwqHliCddZnFWZx8Kok6inE7eXYtzKk
         2tDPZVG4PoDW7c+dneR0GNY39SrNZAQU2qkHwVvdJspV+4lZKdAg+fzrcSUQahAtonK1
         8q67gOXhLzOQrfFwoUkgteCIZWHUeWRk/2VM9EtzLIrmKGGD2hSKoIa+Skemr23tABai
         /riRYVOfyCVIIdIu5QSezrt3VzWKCEDVOOb82ZGooWgjEwwdl4PdEWpf+nhkiXRfu9L3
         lMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912765; x=1790517565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpaEUk4ouLSDddqj0xeVFcwk3yNTz1uMr5TrFDwAj9U=;
        b=mfxU+eAYux2QuCgApxDwZqPo5ytz19/vTmvHYDnMOULFd1dFv2tiDUL6SC2GiThSIt
         jK9pGIBOoZ4nwpojjOoC4NtFVN/LcRn8MMDc99vNDqWStzqKFxPMvYGAcLTJYpWGXKpO
         AMfLOeXX6Xb1HwYUks6+19AIx9lNhyki3ECeqqxYZcroUCOlUThDTnbwqpY3DYRx3CxZ
         rqrRaZ6MUamXmqKxLbXKlU25xAZURIjnslSWH07cDHPIeUmigYeGpE2w7cDWIqi6yrag
         9Em7Ca2j00lFMisaRssnrn3yuEhQDqbbCVq/5FtkvutRxqe6UhPkrGeOSakmEO8zk14U
         4hCA==
X-Gm-Message-State: AFuF++n1kUz62+UbOa918l1VOkiUq5ywzfxI0uzToAwo55DaEUdz7tMY
	jJs9Ud/CrNiEwKaVuqvZrJogfbX+KgaIwq7eLq4PU7fKUtDHHD8Gy1tSZJmX5nZZ9atNdGbhNu8
	hGQW0P1Juf6TdF5GKXM+cYUe36pTZMvRpE7UjNDjd0Eds2k0UaOYrjvmSUZQJz9CNuDdC
X-Gm-Gg: AYBFou0J7hVJATLfbY1l6HTYmWfHoUh4HqU8MnOvacyh7NMdQMIfBWJzH4w9Zotm1EX
	qsCoFHK7H8+bUU8V4iR3wonAnMsiBjeFY2bUTaaKLpHyoreVo3HoPhzx4WrkesTylwyHsBA90fd
	ftoFDH4ij1nt3232mUCtfrjIGYvv5RzcR7RbC0CnhcCMFiy8Td5kgT5HdERSivhT0nt8SRVyO67
	vY8HWAY6AhVtsisUnQLSEvv7IBC0xCMDi1TOAq60oSGFP2Y/yQ0oeYMYn6CJXX64TvP7nG7pKrK
	0UEuFx+QkVRZC3oKFO6ZRfhcr8p/g2PLGcIvZi4qlQzzFQzEQyYa3rLcKm+RkKaDmdSrwrnkUPq
	DNkSHV3AYti3R8XYVQWJD3nruWCdngLRFoRmrHC3zGkr1xFN7qVTLB9EvufylSrHunkgbiP9XHD
	EkE0n+GBMbP7b5
X-Received: by 2002:a05:620a:319a:b0:93b:f083:b268 with SMTP id af79cd13be357-93bf57e17b1mr529284285a.69.1789912765171;
        Sun, 20 Sep 2026 06:59:25 -0700 (PDT)
X-Received: by 2002:a05:620a:319a:b0:93b:f083:b268 with SMTP id af79cd13be357-93bf57e17b1mr529281585a.69.1789912764708;
        Sun, 20 Sep 2026 06:59:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607678223sm13620541fa.39.2026.09.20.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:59:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 16:59:15 +0300
Subject: [PATCH v3 3/3] phy: qcom-qusb2: describe autoresume bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
In-Reply-To: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6855;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tDITmfjnTcDQuM/CcuS9NmrD8cjJcov96HMKbqv/qSs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+aypTX6Lpyhx0cyOV8bYXKD2oglL3uQVx7BG
 BLvRJjk4DGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/msgAKCRCLPIo+Aiko
 1U7YB/48gIetc5GBviJ1BLrmcMsVaKxHRchOVP8+cO29KmHFr1B2/jLMdIATkiTq7peQZYLFDEi
 AwVubVt3cStqpSyO/5rD0NMSBde9HT9QZMTuaeO6fXo+i0b/5ecSTqMuwXFckbyZTzG3Ux+KnXZ
 RPLUTF9kSA7FdUFDR03C2H3+Vd3jkL34Ib2q9HdOsoB11JLm2whLX00vXdgNzJvIvDuIx8xBdc3
 xBtjaF5E/fH7QOXktFPhjIYrnA2hrfba+h4jVNhS++ts29XW27JbTHZie6M7C2kChOsmmarB9s8
 ESOXg9bpTESa/CWdLLhTA8odYc0h4s32R4DbKgdgFSDBc4Qp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aafe6bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RF7xEcOzHiF0mxsXtxEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfXwr1UhwZZhvEf
 XfRW/4QbkJOThszNjs2nGK2wN1VN6H34cvb/MbgtRLHdISTs3qHP2sbwmQkChajGZtMG+Qj8Qjp
 VR4Hia6XcVVYJUj5wrQ0u6GlfDVtO9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIwNCBTYWx0ZWRfX+Zovi6IBwGhp
 uziuJ4Dx0qoM91Spx1FaV6J8xHKj8B3LV18+smB6atIDwiQRkwuYX6QaWxLP/1b/fKlG8GhBFyu
 sxzAo7LWmh9p1YpQamTadlYEhkb4MF312FXYPuaBF005OVDi8gjRjdEy8qtD7yNX7k6N25HQYOS
 MqPwvqxHe3xxb0yqjKCOsc+a2HKhDDaDdT89c+Bmu9uBPP2Tddk7i1y/M/tkxKucslyfl34ITIR
 N3nQykWT/CVSVyRu1L4oKejcLV90LHtskKwcPiEQiNla+3kUqnTKLOpllCM/ZeqiBqRJCVkWE8A
 /VpzCg9l/E6yxElhsCsAoPFtabvYl7euDoh9b5ovC/zf/0g6wZ6ete3RzRsdNqb3N+OU0JfjmTz
 P3hQx9yqdZqayaH1SrTyNoLAPYfFuQonZtamC+J01f+N6HZ7K7+eH/2LdoKKdRgYZuUQ8oRjwB5
 t32rTiIvsdsXhcMSnSQ==
X-Proofpoint-ORIG-GUID: jnWzifRQwZ4SQkZZzz3XYTPqvg0yq42X
X-Proofpoint-GUID: jnWzifRQwZ4SQkZZzz3XYTPqvg0yq42X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200204

There is a confusion regarding the autoresume bit. Some verions of the
QUSB2 PHY have it in the TEST1 register, while on the others it is a
part of the TEST_CTRL register. When adding support for autoresume bit,
the code attempted to simplify the handling of those registers, putting
both registers to the TEST1 layout entry. In the end,
ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
(because platforms using that layout didn't use autoresume), while
msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
layout entry.

Update the platform data to specify the register to be used for
autoresume handling, define both TEST1 and TEST_CTRL registers and merge
ipq6018_regs_layout and msm8996_regs_layout which become identical
afterwards.

Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 48 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index a1de05a83128..101c0820023d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -131,8 +131,13 @@ enum qusb2phy_reg_layout {
 	QUSB2PHY_PORT_TUNE5,
 	QUSB2PHY_PORT_TEST1,
 	QUSB2PHY_PORT_TEST2,
+	QUSB2PHY_PORT_TEST_CTRL,
 	QUSB2PHY_PORT_POWERDOWN,
 	QUSB2PHY_INTR_CTRL,
+
+	/* layout of the autoresume bit */
+	QUSB2PHY_AUTORESUME_REG,
+	QUSB2PHY_AUTORESUME_BIT,
 };
 
 static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
@@ -164,19 +169,6 @@ static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
 };
 
-static const unsigned int ipq6018_regs_layout[] = {
-	[QUSB2PHY_PLL_STATUS]              = 0x38,
-	[QUSB2PHY_PORT_TUNE1]              = 0x80,
-	[QUSB2PHY_PORT_TUNE2]              = 0x84,
-	[QUSB2PHY_PORT_TUNE3]              = 0x88,
-	[QUSB2PHY_PORT_TUNE4]              = 0x8C,
-	[QUSB2PHY_PORT_TUNE5]              = 0x90,
-	[QUSB2PHY_PORT_TEST1]              = 0x98,
-	[QUSB2PHY_PORT_TEST2]              = 0x9C,
-	[QUSB2PHY_PORT_POWERDOWN]          = 0xB4,
-	[QUSB2PHY_INTR_CTRL]               = 0xBC,
-};
-
 static const unsigned int msm8996_regs_layout[] = {
 	[QUSB2PHY_PLL_STATUS]		= 0x38,
 	[QUSB2PHY_PORT_TUNE1]		= 0x80,
@@ -184,10 +176,14 @@ static const unsigned int msm8996_regs_layout[] = {
 	[QUSB2PHY_PORT_TUNE3]		= 0x88,
 	[QUSB2PHY_PORT_TUNE4]		= 0x8c,
 	[QUSB2PHY_PORT_TUNE5]		= 0x90,
-	[QUSB2PHY_PORT_TEST1]		= 0xb8,
+	[QUSB2PHY_PORT_TEST1]		= 0x98,
 	[QUSB2PHY_PORT_TEST2]		= 0x9c,
+	[QUSB2PHY_PORT_TEST_CTRL]	= 0xb8,
 	[QUSB2PHY_PORT_POWERDOWN]	= 0xb4,
 	[QUSB2PHY_INTR_CTRL]		= 0xbc,
+
+	[QUSB2PHY_AUTORESUME_REG]	= 0xb8, /* TEST_CTRL */
+	[QUSB2PHY_AUTORESUME_BIT]	= BIT(3),
 };
 
 static const struct qusb2_phy_init_tbl msm8996_init_tbl[] = {
@@ -217,6 +213,9 @@ static const unsigned int msm8998_regs_layout[] = {
 	[QUSB2PHY_PORT_TEST2]              = 0x250,
 	[QUSB2PHY_PORT_POWERDOWN]          = 0x210,
 	[QUSB2PHY_INTR_CTRL]               = 0x22c,
+
+	[QUSB2PHY_AUTORESUME_REG]          = 0x24c, /* TEST1 */
+	[QUSB2PHY_AUTORESUME_BIT]          = BIT(0),
 };
 
 static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
@@ -259,6 +258,9 @@ static const unsigned int qusb2_v2_regs_layout[] = {
 	[QUSB2PHY_PORT_TEST2]		= 0x258,
 	[QUSB2PHY_PORT_POWERDOWN]	= 0x210,
 	[QUSB2PHY_INTR_CTRL]		= 0x230,
+
+	[QUSB2PHY_AUTORESUME_REG]	= 0x254, /* TEST1 */
+	[QUSB2PHY_AUTORESUME_BIT]	= BIT(0),
 };
 
 static const struct qusb2_phy_init_tbl qusb2_v2_init_tbl[] = {
@@ -293,7 +295,6 @@ struct qusb2_phy_cfg {
 	const unsigned int *regs;
 	unsigned int mask_core_ready;
 	unsigned int disable_ctrl;
-	unsigned int autoresume_en;
 	bool autoresume_disable;
 
 	/* true if PHY has PLL_TEST register to select clk_scheme */
@@ -318,7 +319,6 @@ static const struct qusb2_phy_cfg msm8996_phy_cfg = {
 	.se_clk_scheme_default = true,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en	 = BIT(3),
 };
 
 static const struct qusb2_phy_cfg msm8998_phy_cfg = {
@@ -330,20 +330,18 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 	.mask_core_ready = CORE_READY_STATUS,
 	.has_pll_override = true,
 	.se_clk_scheme_default = true,
-	.autoresume_en   = BIT(0),
 	.update_tune1_with_efuse = true,
 };
 
 static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.tbl            = ipq6018_init_tbl,
 	.tbl_num        = ARRAY_SIZE(ipq6018_init_tbl),
-	.regs           = ipq6018_regs_layout,
+	.regs           = msm8996_regs_layout,
 
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
 	.autoresume_disable = true,
-	.autoresume_en   = BIT(0),
 };
 
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
@@ -353,7 +351,6 @@ static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 
 	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en   = BIT(3),
 };
 
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
@@ -366,7 +363,6 @@ static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
 	.mask_core_ready = CORE_READY_STATUS,
 	.has_pll_override = true,
 	.se_clk_scheme_default = true,
-	.autoresume_en	  = BIT(0),
 	.update_tune1_with_efuse = true,
 };
 
@@ -379,7 +375,6 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.se_clk_scheme_default = false,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en	 = BIT(3),
 };
 
 static const struct qusb2_phy_cfg shikra_phy_cfg = {
@@ -402,7 +397,6 @@ static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.se_clk_scheme_default = true,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en	 = BIT(3),
 };
 
 static const char * const qusb2_phy_vreg_names[] = {
@@ -690,11 +684,11 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 
 	/* enable phy auto-resume only if device is connected on bus */
 	if (qphy->mode != PHY_MODE_INVALID && !cfg->autoresume_disable) {
-		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
-			      cfg->autoresume_en);
+		unsigned int reg = cfg->regs[QUSB2PHY_AUTORESUME_REG];
+
+		qusb2_setbits(qphy->base, reg, cfg->regs[QUSB2PHY_AUTORESUME_BIT]);
 		/* Autoresume bit has to be toggled in order to enable it */
-		qusb2_clrbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
-			      cfg->autoresume_en);
+		qusb2_clrbits(qphy->base, reg, cfg->regs[QUSB2PHY_AUTORESUME_BIT]);
 	}
 
 	if (!qphy->has_se_clk_scheme)

-- 
2.47.3

