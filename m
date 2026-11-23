Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430910;
	b=JcDrcfseL9gfBSsy25GxS1fz9ONPDtBjJzbWgCgoilUjG+9NNMEO4028TjKyK/RjGj5r
	 jB60Qfzj7h4gFa7/OSvUsyKt4mvLDXV3cFQbMwkoB2JHWc8PJrmQsvF14Pz1xnrG/Ei5P
	 6eyjaQ0+hoO/3Oh/p5d86kBWQFMgxVclvq6wdHyJ6Q1aCpvaXt79cyb9K2gd8TMGHmXSz
	 OB5sN1ExEfVvrqfh5gzOU1EOUtqraYzfYwc5QMlxbCn0X18yBIPLFTmK6xXS9g1CFbE7C
	 sLPtNhw02FJrCT7kfDPgp1CCurdqyKJC7e6PWd5iNPbQGBnEoWAmpSB7sxmopTpsrQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
	b=nu9cUFNCJxinzTZRVpSkbb2RTNYDJz3tT6DTzm3BoL0+mnXfCwo4T8JwhGHhOQiA6u4f
	 /0MTZvlmkKTb4VDHgkn6RNBYoeHFQx7Pq9GZmpyiS01cCwnfsCeIIyAGYn6cP777+6BMj
	 G4dRtaY9J97ix79odOu9ncs9vVRkwNrmul3hQFcI3CS0Z36Ltz0g5HcE12gZTunW0R1G8
	 nd4mqVhQ+ZOLI54ogjjSVI+26Vh8A0gedbWcA3uLh2pgCq0RtQvbo4UK48TJO/Mzpbtx7
	 LDN5Y3MANGSU/zbz+KsGE8GoCjGVVeMAWhTlp+X5bFjXeW58dKLS7WFtLsj8EOIBYhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4CE606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F4CE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G0EH1899049
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AxA3UDwrCLZ
	0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=; b=ng0D3ywKkLAAHR6Aox7XLN7nmk8
	Bu1oLsf6n6N/Wgma9fJOyBWpRo8paRypnY9dTERefkI15/tPzJGOUemNzw63GG9b
	D0bkhnP/qKymg/iej1DeAZYxVfTJsFGJPIvGK0NSugljDjjvLkwvilS+fORTaUSJ
	WdV+7XJtez92Bq5Rn4qJCFGUO3XiJ7ndfuITQVpRalCjV7bn95Cfe1H7Om8i7TUI
	caMg/sHXfG68SPPH4YEdJDNTUzOg1Ouq3VPBkGu9ZiV8dmUVQ3siJa5HADQYiqKK
	5fnE+2ZkPJEsXzHK0nLk3ccIZfzwsMUsN1+eIHO8b1z1eWz3lJHYeBJOEoA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k11ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b60129a46eso3628564b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430908; x=1796035708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=bdFiXyspaspYoUarUwQXLCyZEiW6uuH3wWijc4CfHakGn7mURPUmwykQPArC5U3IUh
         B3iDdX0r8qSwlNd0btSHI2Lmo4O9kfv/7iKvJds8FyYNGl0PRkaRWtzSbcjZk2gH0ioB
         Vm16JqW/W4F4VTQ8f1HOhDrurqDSJ5/ZEmPfvMaATvxUdnoPscBEqon9RH30+RemRRUd
         QQpx/BlXbSEe8WVOp5yCN1XLA8skfKp/N/HIpZMcymFvTpprCUHkM9ziRJPxfJ5r9cpX
         b+LiANTyv6QL1kqVHbFw5MB4il3TKXww1yrCTyPOqsPet5YIGkGZGA10zRRPRHQvlwUf
         rvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430908; x=1796035708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=XEfLyhxOR36cLiOw1CNxB9iFzZ4Xu+SJBmPQPaM7D9tQ1Og69tBiVPyRrENP7rPkPw
         VASjAwoK137QbcC/Fe6luNU/V2ivQ9XXH60BKtP2yjcU2psidwwD53Et6dEnGq0ncBtb
         3QPNk6M+ak7EnXr1GikviJuxc8rbiShjsPOX5yc6iryfEFGmvR2erX9s+shFLkZblM9s
         w3S4MjyR6g6FkwInLG2cmcsPv+HL5XHwICOEu2UvIF3j77RpjCn9GLA5Ak3FVp8jY5nD
         qJvZRti6Be/kXDefbZ1cFcgTyWzy6791MyEbDEkekNsnlwG1LWikPf02EsMToFUopiFK
         QxAA==
X-Forwarded-Encrypted: i=1; AL+hErFIZLnP2FfnlFdsB7DWNyg0ZwOyZnJqPPEajpUVGaY7l5HhoLThyD3GzlRP7Fy5/ro/t30Bg96BvKhACIDj@vger.kernel.org
X-Gm-Message-State: APuU4Z9p9p8AQZiZcGnr+s4DIYPcM2YrSBQPjJVo4PwJOcVvRXdWn+6D
	GTDjb95vlqSynUwtG6SlXf0oxpwhDJhs9GCJ2AtO3R5USvGdhZBNr82gRWf81BqRk5uiXiJHEvP
	FByPMJ97b6j8Nb8Cy4HB/j7/huVtiQM95WCeIs7C0y7yX/rI45ycQDvse5au6bJdJbIzz
X-Gm-Gg: AZFdTZeJQNH6SSXYCC1qGLOr+NTRPnnz1BkXLsgdBYxkcyHlBsC6sHvvpn58misI+M5
	IWfS2m3m1bIfibUbKEysPrSaiaswdpwg+Dp7PRzc7Gyzz+PLX4Ww1BXIXuRcbIx6e4i/DK2kBdK
	BpUU0oxK8378hKn91/IhriZzQULeMCGvtvyk/odasjq62nrhCiAAGxdx7Keu1x3IW5JPKTXmok1
	2FLVKBQNUtqg5ieDWaLxjwTlCOmZixXpsc1dT/4uXEmT/32JRjHXiJ/hROKdDMOOUpS1fFGeNtt
	muDKNLD9NpbiZYbGsrJ8DqYCL2obCUM8XqphFO+fH7Zu8LsRDqBt42kl0ziVSGA/BNBsq2MsS8X
	MntNGFL87tsXktZqIOL+Dvn/nVZ2/dL4h/bnKJ7OScP2YCw5LZbjp6QWwnu/f2hbsEuiuyo2aeM
	/Zt+GY/Q==
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890478b3a.31.1795430907643;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890454b3a.31.1795430907176;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:26 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on remove and probe failure
Date: Mon, 23 Nov 2026 16:17:24 +0530
Message-Id: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX3jT+dDOQTdTd
 aBk4aNFVZZ6umpke269Nxc4UwsasrnlYj/HpHJ8o91813o7ahh/r0DjxpHl6fYQlVdpyAMLMHhc
 8Te4R+vQ2qTRU08j3gujqkVO716TXmI=
X-Proofpoint-GUID: umAM8qnUueoQzgY94E6fxdG4mhGhIQIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX/eC+k8f78F3v
 VBDFL2O0u9SEKG7+hiZ5JoTjvM9r0jb/KUqPClh+5AkrCLRO8VNfv05buJtzMpDliqT5KLc2p/b
 LzZYzYgHvTNWjtVxuqXC1DpiLtQOIzr5CFRtFvUTbWtiXQAD+jPOlPYNYBkRL7DHA/ryiLgAuEk
 mM8pY2FfBK+XJWCb8JLBOCsJaK+wq5NvUcdDFmKKzpnqlj4SCq6XCzi7v5MlNEUv+d2NfTIbebK
 eX/QuAOLzCUV+1Q8ihToAdNlwrLH2vitxfgfyQZvTjZWAbXf2yWANZ2uLHNSRomEMmCQNMNlrUB
 Ma2zZ6kt5r6k76IrJRzRpfD2UkAkcy9LuIHc99p2zOKvX63GU4knJU2kfq3TeKPT8e03z5kH5h2
 iJRx/1WZSpi1osla8ixzkPVFlUv/IhM+aGBU1sXF/JKyK5GPQbyH4vx/Tk0Fp/VW/I52+aSjPqa
 rEbyQ7WhJHeKdYN5RNw==
X-Proofpoint-ORIG-GUID: umAM8qnUueoQzgY94E6fxdG4mhGhIQIY
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0419fc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SipdNjeEsZ0rhQ0KXr4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The controller is taken out of reset at probe, but nothing puts it back
into reset when the driver is removed or when probe fails after that
point. The controller is left running when its clocks are gated, and a
later bind starts from whatever state it was left in.

Assert the reset before disabling the clocks on remove and on the probe
error path, so the controller is held in reset while unused.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 50fca06c83d4..61a3e3c38f59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	return ret;
@@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 		return;
 
 	dwc3_core_remove(&qcom->dwc);
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
 
-- 
2.34.1

