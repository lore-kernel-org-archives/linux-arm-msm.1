Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3B31F983
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161521; cv=none; b=QCH4531/enZd5k8IaxNZM178dh/NfRF4gnDY9GJsZX+4lYuutPAlcFrKqlZ+sRyZ5FYDgHaTaFI1gR0Rrj1OHFCwXf3rgDOoKtPyP3DStJQ3NskhC4gdcX7QQvV2ffZNZsnDJKQDHDovWyfBM09BTMqLtqifF9gJn1qxy+3YLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161521; c=relaxed/simple;
	bh=4fE+kGG3N/RA+Ce/ty6vMxuhAEdV9M6t/lbkBtjaOGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIHiM8PJGmlmX6mNJJSK8cxgZGk8H6hgH+MZ/BYAkls4J4N5h+sz4iovI4fQUKLf0vVYjqHd0uBJnlb9NHkvJHTxWRWv049mW0JSTdMvwY7TQ6UsCnS1QCDWh0cPzrQE5W/QekipDitBW++pp/cos1C0ECOZrGEItMjOnFxZLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaKapqXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InCUr5r3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaKapqXy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InCUr5r3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZAr4115060
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTtLj7QjciNPUf874u1R/w2+bPCmmaisZvtfkyOxRDA=; b=JaKapqXyiTuZHg3f
	boMd6Uvuz+cp9hH6NB0EOp0pESVgps4PBzaWadV2JYw83B9VUor8PCSB2AXIOC+X
	r9GlBiRiMd295EZjAgOh+/pdcCHmMaOGpSbMcBCCjE+Fnooqw1BVC0jWs5dLFm24
	YaOHxYhqATeAslLXxAtDJPnAumWCPhLbnlppKL54fy6f5tk4QNsMXrA1Bmw3QLGv
	PmbLbvYfl2z2AB3DtxU9VTxncajRwM6F+p986CYktIKXuHCzLMophuWLXhakOHza
	EC3gmXcekJeS40RsFjxeRgk+AT9mRVkavfC7TDvHl9RI/mO++d+8mkYyrG92+hac
	6SY5lw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrs3e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6809827a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161518; x=1785766318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTtLj7QjciNPUf874u1R/w2+bPCmmaisZvtfkyOxRDA=;
        b=InCUr5r3j9lJ326jEKgyCHF2qeC5PmTmRfmuYqlM/Af57+3BP48FDqP0pT4gI45wSm
         Tya6QOpX9/DWdxB+okWCOPjjQsTEvdDLAUQpe8/q23x12k7nqkAjg0NuomWsjLhMBHkK
         4IMNosYbYF3AQgUQOxc/kw6TiU7Wvqx6uvabU0XoEHP0gcgAh9F8hg3IBieAZ5bRZyin
         a5nJbAwJzf9MwenMCofENCkxMTJEZifmyCgxum55SNK8Y2nUBOG4xKMw1i7YVeVB4tja
         v/i6LNxba5Bl3ye0z9LyZmTwW7axofkFtcSUqFqhuPJ8jZpIa1WpgeESo3hTdQTKwz5F
         kTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161518; x=1785766318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTtLj7QjciNPUf874u1R/w2+bPCmmaisZvtfkyOxRDA=;
        b=h2NB9rRUiSYLrrtJlWTlsFh7oTVHe+EtUkzOEz6dYerMzLK+WtI9uvaCOjRwLRXolF
         SKnKeyeKugnOweiYDJEW7ASxJ/qBf3v5vKYFLHxfzrDXLuXCtj3bltecxYg4IBaeENe4
         5ERCqRLtF217VK7YRB83q21jVtLZAVzAE35bZF7szYd1aeafsOiPNAFK4T0E8OBGgAG4
         HE8EB/oOVJLXccSdFjKshJiglRnpqabJVecE7M9y6yFkLlkpKC+m0/xv+15GvlrZ7xUv
         TIcd9F4e8H38AO7gh/zZsmvCYX12tCwaf+ux/lu0tSGZdb7CNriYEGTFJTQTFYlnd4uE
         jNyA==
X-Forwarded-Encrypted: i=1; AHgh+RoNaKxTqDzfERZ1VPo30kc/7UjYQSp6+3m5GQE8yniXi3Y1wNJFn8YEGNhMY7SUjJopnMGpkPJ7bXTKe6t3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsw5+7jOjxE3pPXguUqXxb4/92R4wJZGYl5HMjUXH3IQRI1iFH
	3v9WJ94V03iVnnr2fJMQpVjUcvlfHFsVd0JJXxq1AKEWhoNwBFFcB29WUrPs/2EWInxB6Fk0SlN
	6KamxvEBgbRByarghRh/iWM00ImW01Gfl7BxOZqTmPsO+hZIMjKMzoHrWPgqyGtHoldcEOPVl71
	+s
X-Gm-Gg: AR+sD10uVYV4fZMOXe29Bdq0TF24u0Aa8U0kWtXVvg65Nw5TOotPXWf4XV/bPRDOiAY
	4equ0jKOtvWDqr+7F4bAvSKRzbB3KKNmDzII4sB4NzuyJb2cwyZMQXZkdL5uwBYV0I4OyDcUx5B
	VG85ihLH6njBiBP2I7Y9j7bnPGf4NRjVsLro17P0z5ePWPOdpBBo8rnt80QEHolmIumz9JuXuH/
	I7ivtnyKH6kOveJpBK4ahinKOPR0H1qbZzzmVNipDbIoOJquiJNWboSLzlDAS49hR72pabP4WdU
	ARaj2RHhGLMopgRxNkymPxb2NxpMlfsSyth/oMUykBZI4TQk0KH6LQhZQK0JGbx4Zh6xHdyfpo5
	Qez7LcwHOprG6gv858TxmSSW/CzdS27g=
X-Received: by 2002:a17:90a:d00f:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-38f293cd207mr7740934a91.6.1785161517705;
        Mon, 27 Jul 2026 07:11:57 -0700 (PDT)
X-Received: by 2002:a17:90a:d00f:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-38f293cd207mr7740894a91.6.1785161517160;
        Mon, 27 Jul 2026 07:11:57 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:11:56 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:41:00 +0530
Subject: [PATCH 4/6] arm64: defconfig: Enable Qualcomm TSC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-4-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX8bsmymQzRiFR
 LlLUdYl9paoqa9ZKv+SKnBU4WzoQyPyQCVGpgxH+RioN2Kr2i2OJBr5cj9OO+WoU++mnfZrtD8F
 Aoy6C/j3hxACBbKRF45KkR2EzzSntKE=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67672f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwNPhHur-d9dQeroUnUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7TDKVEp8iM97R71k_LYcoUiPggOReBY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX5UdaCxZTyrgX
 5a3HSN197e3xO8AnBVA/S6VqPuszenYOxguuMwqLDov5rmXKkWJRqm1F3RCEDJPc/ENTDzH8SgQ
 nDhP2N2tMVkR6yMgP5ti2iqxX7hHuZbEvn/e7JmyItVTCmpttNIxQQ23jYIoHmzsbsY/w9xem5I
 2bX/mJOgvCCMsUpnKPjuOlVz55z0gz1ddrzx0grsv2zqio9h2hduSGbo5UGetfu3BzuBrlFWU10
 KD5fuGDgIIwLaswkCMMGDdH3sm/LHYNhVit4flHtG3w5+6x4YuhWF/tDHPi2W+ztgBdf1blVzzD
 919UqxCGPPdNCe4u0W4XgWHYW/rbx/5tpWsvBNtKeTvdHUl51G8dZG9rz631U6RFyOrYDqMiII5
 mnS3sZbdJBqa0vnPhz/gNKlxo4++h0K1EMXxZaPp9SYR5dE7PKBCznesyEi1D3GYv7sOJluf9zh
 YE6S05HNuas4LBoW3sQ==
X-Proofpoint-ORIG-GUID: 7TDKVEp8iM97R71k_LYcoUiPggOReBY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Enable PTP_QCOM_TSC as a module to support the Timestamp Counter (TSC)
synchronization functionality on Qualcomm Lemans, Monaco and QDU1000
platforms.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..73435e5f8877d2356ae1f2520c7c87a72d503a2b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -683,6 +683,7 @@ CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_APPLE=m
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PTP_QCOM_TSC=m
 CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y

-- 
2.34.1

