Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626542;
	b=zbiP7r8edEKoLz0m0Qv18dXmehIKWoWeUlLdcVtTHL12yaD1ykL/KfKXzJSbuocbpgrz
	 21XhIyTSm9TD4Hm81nIacIZvWAAKtLwpaodVH+ArfCt6/Vi8o/vGSsmUd8efC7s1/Rfsc
	 ZhgRgNuOTs3piQeNBmvH59S+4ujB78dlLgd3x6TvWOV43gho8FDlSXhlRVT6dW52QrRbB
	 0DB4WVH6H0KXnXllWMXZNhoN7cXdKTao1qpUuviqaTmcIypC8cR9dshvtaUWPmBaE88v6
	 HH84WQxKfvKKmFib6bYLB1TXfeDQrRovD+FjsL6+BdwXLByLz6qWQLmhP95kqS7Sgfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9ixnt0d+aE=;
	b=U19GFo+SqanJNA7miPbwhpf7TK88QkCmdEOtDWOS8jlMLEP9O3fNitFCZK61g6+UN3X7
	 NgNE4XaoZTXwDkf9mq13g6ydn282d/LLWBTLOYjBly6S+I8Vv8pWBtrqhNSOSJ3klFCKG
	 ln5eL5M/QC21BtxJijHvIxtKSs5jIZlOItCOPRAF2D3DKTnbBtpeB2uS+n21Srt89oSUf
	 fN8NQMqxbHRGtYeO+jhjsrIO7tY7hRN4fwRBaIe3V4rIKOXVLcHanFiaNVpMyF/3jgM/Y
	 m+3ybUR+bRWy547sfpxc1M8s/U+ka9k5TbTP9pWeAQ6yObChkyUKJzrvMchDE0DoegQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oK8oKKu0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uymdf/T1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B10606A334
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B10606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oK8oKKu0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uymdf/T1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAja83982164
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9i
	xnt0d+aE=; b=oK8oKKu0rFXM2ZFabfeVVZtnlJ7fJTk55hbhrnPPEbaF9O2J7iP
	PGrdBd7YKK+lsjlhRzfEe2gi6b1y7vzEVsK1MKyUZAi2js/ASSANFbwAz95efkdA
	yPeJx/2YU189XU+mYFDfSNcJfIB9FSDOf2r4O7kTvt71rFC+jOaV/6RArBILG33y
	8Y8LrE3Hjz6hZL8zkuIGDfJZRzygyfTYD7z8uEmTU6GMkBLjZRUa6hFdhtEO8wAX
	b5fIPkdiw5O7nP/vT8d7+cvRwTGcQZ1JZ7TqVK9bivON8bpcFXEibs9Ca7NKnprE
	0YUfFxM8HluIEGR2QuAh3iQHPG8l9X/eyIA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5ge3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:35:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98e3ad6dbb5so579287241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626540; x=1794231340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9ixnt0d+aE=;
        b=Uymdf/T1D1Fuw1di9UJVR5b6DMc/khWnw4pWNa3c0ugQuRL4bFCgXyaqho0ojreXBP
         azulPLtUCO/TgXuqfWAIFwIsQOGsioRFC71pn9+fIejyOxYS3K30S11yVw/muDqmhNq3
         Xqcbou1/svdXgiAzcNBLXO7+8SX2gwP6frP13pCQg3Sc5Luz/PfkogZRfYSRoVe9/C0E
         OMHMyoGGonO2NtQqykmL6WCAV3qSH+Knc4ype929bM1EHtFzhxtA7heLGbAHcW5aPSVh
         154FkSnD+xXESdc7L1igdFlHCDZZ8g8Y60OCFWp9lGcyltULDbeEokZXxDMIiFGKBu58
         Pc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626540; x=1794231340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9ixnt0d+aE=;
        b=0e5UkeLvNaCjYMdwWKu7R6umpTAJ7EW8T7qT/0nZkVN+3iUHDImkPQJ9gsR+3eRIDk
         v8UvAvRluAEyrBzTSuL3B1VNL4IEUAJiS3XbEdAzUbEtY5Fn5wB/otE+fKzH8GGGDmEp
         KQkGiv24FnjaK4A0ulq8RyGBdp3iIB94z9pG4AATG243Y7OloOm8/Qtba/J5dQyN+nqJ
         UHSCjLXMqOt5C4kfLIjahMj8uGXLcPTGEXbujncnfyxk/uOMYYBTNpKdW5NO9n/pf5Cf
         NXG11WwCP2r+XitxjlrIsnykPHbKINDFgGONA0FO14XFHmMCvtivuzaMAe9/blZvrqFg
         E3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzgub/TxYUnYdEu7/K8ygYtElwVItVa9yHbkCCL3AXU+dkzAdg5pCLOXegFNZHT5w65JB/IWjFSVqBToRer@vger.kernel.org
X-Gm-Message-State: APuU4Z/g7Kyc7sZvYoSuUywJ6Xhk0J3QRbVVGytKFNljN9iOLl7/LW+u
	Fiw7r4hUv2izZ5s0ym7pbiJfKjrUbd8ISF7iIdWyexnQMeATWyowGyZUrUCS5wZ+ATjyu+TTAMQ
	HFh9r61ZvUpeLLqvzJYnXPEuu2b2MGcP66LFgmcxF7MltTd1FHZppqFWUkzVVulP/rNCD
X-Gm-Gg: AYBFou2B4adGuGS9SjNHd9w+kFayJ/y0RLUTw/q+6Oai+rrcn9V1f5GJx1izUiMieQZ
	YLbGp0nzlTYXXy5F6fZMCwwIfiU1TCCRvBHtjY3az/pIjDUzcmoAWq7CoDEVklYcifRen3AVag9
	4wjU6qbsThheS+/vrUVssNWuxLB7YSmTgVdVvopzXaEg35qjhqA401tANm+vRHjIXnkp5IsLpsd
	i4lEhy32OpCwDOP1i8B3uzO+Q9GLm5ICxRQFAxOsW8cg1qRtr0o+R2mDiYXnE6OYxLCKiSuuYY0
	hodYVNi8GSG6tduHSvyeWDVyPtj8mrLarL7zIhPMK/OTf5QC8EIR4vUM7gKvPOo8QoBN8BDaCAD
	7lAxyeaa5k43oiCysDdxx6hzZEpSVUPvLqhyXD9FbADzA6NOdVxOjUgIrBufz8g==
X-Received: by 2002:a05:6102:3ca6:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7d072770fcfmr2970883137.29.1793626539709;
        Mon, 02 Nov 2026 05:35:39 -0800 (PST)
X-Received: by 2002:a05:6102:3ca6:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7d072770fcfmr2970871137.29.1793626539185;
        Mon, 02 Nov 2026 05:35:39 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm25735864f8f.53.2026.11.02.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on removal
Date: Mon,  2 Nov 2026 14:35:32 +0100
Message-ID: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5139; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JF+5cokNPr5yQXFxct6hhCQ9bMPf+O512f96kwbqAjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6JGjhvMrZJT+ifBSgQEojLNXwpKUM7rKhDeHh
 hFF00NaHZqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiRowAKCRDBN2bmhouD
 1/mTD/9neLvJVok4DhpGhxjjVyEZ0WSqKavteJD7MtXK/XgdlbsKBR2U0Rvm4Jg7L09nNYFGV+V
 gMZD5w6EOLmk31+49/3ZmEGrlEQAwT+GR1gOeKc/zNEWbqPyi6hZ9TI4g/PliUCXLSUgvY839ZD
 Z4Uy3BCdJLrQ4sFCTC+0xpBjtABo6h5cQwupLJgFSM9/0fTPku69FCVrH5g11gMi7OrTUhUm3fy
 MESp8Umze7UjSrmCH1UcVxDgTXfQk3CPNCrjX/eL3vxUX/ywtG+n6bcJ8FglbYNkLXbgdHouuTS
 Zmin0Qvcly/oTEMfNnJD214H6EbTneF96ttPZq1QwSQ+6JDZhCas9S0uX2cpoSCNe1uMLfNKkYO
 aSpyNXOgqNSr/mzsApCVXtk1p93q9YXx1Z6pStN1VFVrTkMF2JYzo0EDXtCekFOIDxhaLmPzeCv
 gdC+9I5OA4kcwUBcefo5pX5AOfDPwFKWPoZNori+TYDfZtBRvHPqUcgiEQP4wkun9V+4Nt4n619
 blpQXcIKK3r9psGAbBWcS40yrDNiA/Y4zJntW2A1PA02O5jjoA7SiAM4u+tCi+L+h++k7mhHpi3
 iSX5xy5b/qrp8MpyflcpCZtu8aV1KvAsD2fs/VO/Hel4mmurmWqYDQxdk524uFXULogYUUW+Mxk TFvyYeMr0X5Zfgw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae891ac cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BUgfXIRX-Kcuu7gNGJ8A:9
 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: sTsXUFAI_kTLjmxuxeOp_DL9hV50DsWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXwln1EzBPAOw5
 Z4Iyl6eyJ7Bi0WsJkkh0Pl0CJxSE974X3va8c7ROJejoqgewP9IcJSkkSlPQ+Kh6DEA8d304GI7
 Rohg3XRSqphrqgLUe+IHqIRpTps9U4H98FoKPemzbJDqkz5PmQqbt7cr5sJZDnF8+dcXoj+CbTh
 dv62nUmP9szGpw4M51lAdlopOtg346gwb5MOKrHTMyGTJhT4Va2eyOSKFvkqw6dU1+lpzo1rOsN
 DaVj+V9907uicDt/MXGIIIVcrHTU/YlR8rPx+ZzRV8d1kQH3NsaUReVg7a5Uame6SNUiB/gcpbd
 GW3Xu8lg5N4bMCasD9J4W5iyCjO/orN7XMUiAORkHg+k70LuPEhQPu85AwaM1yvNO3tkvLOe6Xs
 U/sF2FyYMVsJ9bHqyF+2R1QbS/6gKWke96yF0K7EpUBswWn1T4o3etypjzj//tvz8sehhoGPQoy
 7rPqjeK2iBeULuH+BQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXwNRpqt+N77Ek
 IsLPCqHOcNyZxvQdMB2m15LpfeNwRhgdXMl/5Ge6WL5XuibVeAifGRfgz3+sb4AQjVIf0bo7L47
 S+7+KHerNY8pw8l5MyAcK9ZpAoIzsEU=
X-Proofpoint-GUID: sTsXUFAI_kTLjmxuxeOp_DL9hV50DsWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
is freed only after qcom_smp2p_remove() returns or, in the probe error
path, after probe returns.   Both paths, however, explicitly remove the
inbound irq domains, unregister outbound SMEM states and free the
mailbox channel before that.

If the interrupt is triggered in this window, the interrupt handler
would use previously freed data.  Mixing manual probe() cleanup
and resource-managed devm leads to such races, thus just convert
as much as possible to devm to fix the issue and make code simpler.

Note that for_each_available_child_of_node_scoped() loop, before
registering qcom_smp2p_unwind_interfaces_action() cleanup action, still
uses manual unwind, because it allocates the "entry" memory which is
used by the action itself.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-02cea59a-8c4a-460c-aeed-69002ab3e72d
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Register devm_add_action_or_reset() action for unwinding interfaces
   later, to fix use-after-free
---
 drivers/soc/qcom/smp2p.c | 79 ++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 01b8580c9f27..9b6e0627ed0f 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -619,6 +619,31 @@ static int smp2p_parse_ipc(struct qcom_smp2p *smp2p)
 	return 0;
 }
 
+static void qcom_smp2p_release_mbox(void *data)
+{
+	struct qcom_smp2p *smp2p = data;
+
+	mbox_free_channel(smp2p->mbox_chan);
+}
+
+static void qcom_smp2p_unwind_interfaces(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_entry *entry;
+
+	list_for_each_entry(entry, &smp2p->inbound, node)
+		irq_domain_remove(entry->domain);
+
+	list_for_each_entry(entry, &smp2p->outbound, node)
+		qcom_smem_state_unregister(entry->state);
+
+	smp2p->out->valid_entries = 0;
+}
+
+static void qcom_smp2p_unwind_interfaces_action(void *data)
+{
+	qcom_smp2p_unwind_interfaces(data);
+}
+
 static int qcom_smp2p_probe(struct platform_device *pdev)
 {
 	struct smp2p_entry *entry;
@@ -671,9 +696,13 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, qcom_smp2p_release_mbox, smp2p);
+	if (ret)
+		return ret;
+
 	ret = qcom_smp2p_alloc_outbound_item(smp2p);
 	if (ret < 0)
-		goto release_mbox;
+		return ret;
 
 	for_each_available_child_of_node_scoped(pdev->dev.of_node, node) {
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
@@ -704,6 +733,12 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       qcom_smp2p_unwind_interfaces_action,
+				       smp2p);
+	if (ret)
+		return ret;
+
 	/* Check inbound entries in the case of early boot processor */
 	qcom_smp2p_start_in(smp2p);
 
@@ -715,7 +750,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 					IRQF_ONESHOT,
 					NULL, (void *)smp2p);
 	if (ret)
-		goto unwind_interfaces;
+		return ret;
 
 	/*
 	 * Treat smp2p interrupt as wakeup source, but keep it disabled
@@ -728,27 +763,10 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	 */
 	device_set_wakeup_capable(&pdev->dev, true);
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
-	if (ret)
-		goto set_wake_irq_fail;
-
-	return 0;
-
-set_wake_irq_fail:
-	dev_pm_clear_wake_irq(&pdev->dev);
+	return devm_pm_set_wake_irq(&pdev->dev, irq);
 
 unwind_interfaces:
-	list_for_each_entry(entry, &smp2p->inbound, node)
-		irq_domain_remove(entry->domain);
-
-	list_for_each_entry(entry, &smp2p->outbound, node)
-		qcom_smem_state_unregister(entry->state);
-
-	smp2p->out->valid_entries = 0;
-
-release_mbox:
-	mbox_free_channel(smp2p->mbox_chan);
-
+	qcom_smp2p_unwind_interfaces(smp2p);
 	return ret;
 
 report_read_failure:
@@ -756,24 +774,6 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	return -EINVAL;
 }
 
-static void qcom_smp2p_remove(struct platform_device *pdev)
-{
-	struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
-	struct smp2p_entry *entry;
-
-	dev_pm_clear_wake_irq(&pdev->dev);
-
-	list_for_each_entry(entry, &smp2p->inbound, node)
-		irq_domain_remove(entry->domain);
-
-	list_for_each_entry(entry, &smp2p->outbound, node)
-		qcom_smem_state_unregister(entry->state);
-
-	mbox_free_channel(smp2p->mbox_chan);
-
-	smp2p->out->valid_entries = 0;
-}
-
 static const struct of_device_id qcom_smp2p_of_match[] = {
 	{ .compatible = "qcom,smp2p" },
 	{}
@@ -782,7 +782,6 @@ MODULE_DEVICE_TABLE(of, qcom_smp2p_of_match);
 
 static struct platform_driver qcom_smp2p_driver = {
 	.probe = qcom_smp2p_probe,
-	.remove = qcom_smp2p_remove,
 	.driver  = {
 		.name  = "qcom_smp2p",
 		.of_match_table = qcom_smp2p_of_match,
-- 
2.53.0

