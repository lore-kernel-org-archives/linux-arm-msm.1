Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093056;
	b=5Dc+u2gkl1M0vy4JY+WNNyADOaYpMbCnksMubdelJ5pq1kZobJSDJcNXtXT6RIXaw+Ax
	 7ThuDehX5YwHI0WM4HkfGQEnUFw4cTWLDovtgCJAhGZSWSqQZmFBtwHEB7xcb+aOa39n4
	 t1HdHPEbJ/glwzb2PWSsfYP2SMe2xdofdue7wNaeW85jxiP/plk1MapTjdq9MZzXTTlFt
	 0VvWhFQBtLjVbfT0VY86kYjD/9CC9GqVltkf1QTxAHkf82cLKa+GSaADTmwW7y5pJyOUe
	 6N/ha22ThkhaHynTMevb5VeMR5lKMlbJbvNjdEAwj09HwKwJSFug/bIt28G023XLBAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
	b=sF7YqEWtlAOU6/MqX488zihQh9m6acCbbcP2PrH7TPYjASOytqVPOqyOcYaoaL33SOqq
	 JlPD4OnYcK2yNTl7ZmPNwOb5NThI+vjJkaLRe41h0vwtUa58uWV4niWyj9OnQj11jDz53
	 FFcvqZNbDyfQk9xqPCO9bdgYxedDCToAq3o9Sb8xgsuuNnvBfBjRkgk5yYiLeaDDkyZlv
	 LEi59j/Rk/9R2GRwI5XGzmUhYLF0RSN/o7mhqH4y7bRPUWoomC5T5NwbbJVxY+3x8ut0m
	 cKpgFspUPvYlQjc5UjFo0akm1MV3DA4iCh33pXo3xJvFmqeTdLPS2Lwwqw0zfL3+rsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXjBDK6h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4FD606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF4FD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXjBDK6h
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjsNM705598
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=; b=fnOJOxjcVJhPPc8X
	Tq1g+pIsA0wtmc0yQZgp+hJyTnaAjcvMFOlPWCQmFNS+YvR1W4YMTSSEdKAOjwF5
	vY1dJAWVXzi8WMUovDx3M13R9Xlc6+sUm1eKZYq4NjV0QKGWS0t6uhhZNMi7HXxS
	MecjPt1HkZbkTiJo0JG3sUv5Lxikt8M9mpu+p/KsDr2aKqZLl4wmpKA+Qqd1OzwE
	Sb9DJ0l4qQhtOzLWmOE3KIQs+7daAohIPeiE4nGyPLYImaFfquMhinR8q7JAgQI7
	0H0F+6wYjCna5DBYU+vGbaeNyHtTlrye4ngFKyr16yKtn1Pe7k9pJeEp5m5C1XVK
	EtfqWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x708w4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3235877eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093054; x=1795697854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=AXjBDK6hTUvghTEEQGJrAsk4s/imfT2vW562lvKKx+O4cdcjCiOnxpoPTv56fCjDNE
         9EbdqcXrz15uT1PWRAIjXT8xPKjCvQyc7D9mL/gi69zVJwFrwqunkzagTKDvxAT1OQQg
         f0mCSxWADBMzBiXJmuX7GNgAlNBvblCCr2/yrRo5HLNSnIx6Jw+Fl1DCLKuXl1v0rFzh
         DLO3CiQCsGuLq5sR+nm8hxPLsfnSFx0hNtkpCjW6t1z4ZZL3onziJh8c2qExyB9odiL1
         ftpTMv2EaCKIrU02guKcP0NAdeHH+YWFMgrp4Cn+dhqRlYWctoVXaNq4EdOZ8uqcO40e
         BDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093054; x=1795697854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=SWbAARBqnO5SPTFAky6WkNTMhWEVXrVDCxvlKwXKfkedTW0+b8lpobxelHjxx6yNPV
         MS3fAy+iBRH86BaxbCNHikFIMVtl0IL/NmGO8ulMnUp0pZ1gWVG1x/HHgc9g5xFUFmNS
         rx0YAmhyIsN7goKptzuO57L+68Ca+bSYcUoGx/7ibDkmWcHPBlAdenNQvxE3VEM7K3sD
         cTi3tS0GgwJno96fI+3jCstoEzfciB1jyNIpn0aOzGnQFBII83RLP3D3fEAEAzEWkpNT
         UTGoWlGA/njG0dCkfHS/z+/Tpi//F5E10655IQ/T7OevdNaRPEbbxJEg5CLQdH1loEzc
         tspw==
X-Forwarded-Encrypted: i=1; AL+hErHDUsBv/XKR1Uppc9DadEgSerYfLDlNc3a/IVIv0EP37EEK7CKti6f05uPmM6eRfdCUqA/joOI9I4MYgR+c@vger.kernel.org
X-Gm-Message-State: APuU4Z/X8Qn9ejRvgRueLMZSqGqdWIn6E9dEA5EbXIGQTsdDcxEFt7+a
	2yJfEt/fbsHa9fRViQ3YpA8PZuMQSVxDI3d+wnQUHeDU8lWywwTQPX2Vgn76bc670Rjonllap/8
	AxQDBKzNHXbuUym5Dfqg1Fh4VXz/VnSsTp+IAqolLLnXNNf7Dke9yvtfY1GxQ+0cmrZ96
X-Gm-Gg: AZFdTZehsrMHq74KHPo7KwigCVFUyv9vbBN8aU7fBOBA3gyNqX0w1Wf/Afq+Ij9Q4he
	izRfmg3TYJ1W9GPqknB2V2oDeazIR06+Saf286fYsKTnkXc7NuHvZJ01Vrf7CJDMtMyQ78E2sY6
	k2B3FxEvqulx/1WZK1xOqYwTditJ2FTO4kmsH3C5yIZnbHlSQ0IiyIwHTg58MvYV03AWDMUkbUA
	epV/9ofueKznsxQwapWUfLMXulHCJtlcPcpwTdemaHcm8Bf/+xakH3G+se0HKfBUgNY/qjuPXRx
	mW6iUgOYpk7KngkV2AzCZT8lxyvFjvHd6bToQOHT+A48SjN/lpu4l41Y4RQFnlaC3G2m9QR+htT
	IlUJRhybj2iIPBbPJ21APIMuz/NvPAj43yvX90ivXSOy8oQwMopNwcC6sYaEhDrkmRcHMmbzApX
	S+qg6ALdRl
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987979eec.2.1795093053767;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987957eec.2.1795093053264;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:39 +0530
Subject: [PATCH v6 7/7] PCI: qcom: Enable ASPM disabling during link
 retraining
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
Message-Id: <20261119-bwscale-v6-7-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1086;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dixWhgN1FcwflBXIi0Se/61aBMCRn0NVL4pFbQ5pD1M=;
 b=PUZk3GeenFpAL675pkSjVwlCW6zpIzwS6Gmvb7s0aa9docOEiXMtvktcnV9mru6evKsNiDilX
 wUhqKH8Hy86C6QnFabVSxqG6C4LbGY+SWRnz4vitzqM5gfjezA/UxS4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 36w5NedtrduQMXus13ngTL_0_HtuLGiY
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afef23e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R7JsESPv6PNixK4vMH8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXyoj08BTjSsCf
 DXfmGoH8xRXUES04wrcO62dQz9rfHrvnIA/o2SADQTPeGSWZYMuHWL2Y+NB9h2EPGrG3tr6960R
 nORdtJcqt/vht1F/Q/sWE/9fcYsX6o8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXzd60hejighC2
 vdh7eFk2VUZknzVfCSO67TFaSHmG0cPrfHZTRkKEgP1OgW/QDeKultRQMQF1KunWyXnzxO6cOxf
 V+z9dpJM84LnldUxQPqpnHyAqgBSPhhLXbZ1DoXpSwN8lEruI9bDn7ae3pHQtEL3+pQyLqOgW56
 f6YBQqc641v7C0ZWsqaSXGe71vbuyFvOSWALv32mSmIPYyfT/b7M/MhscYtoN2iwjqFP9x48Dea
 1K5xx+CFLfagR8FeCOQq7puDPLYt8PYWAIVognQ/tPTQnvNvS+BRmwvZ0frUZ8kkfXe6TBrfGre
 aV1vzwOn975V2Xrp3mE4tqOYyjrdAMtxPpQvwrJ/yTH4QmC2uxJUU76Jf66JMmTqNOAsrxE6hgN
 SPEmt7hMLGIshlWtl3cIKxVet5laTaEDwhW8NlKE+iPdyYrJndFSLvQBNp3rXyM2WDAZsTcnabp
 nTuxt/ZwCPU6qEa8r9A==
X-Proofpoint-GUID: 36w5NedtrduQMXus13ngTL_0_HtuLGiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

Some Qualcomm PCIe controllers require ASPM to be disabled while the link
is being retrained, otherwise the link state transitions during bandwidth
scaling can fail. This is a controller requirement, not a device quirk.

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() so that
the PCI core disables ASPM around link retraining. Future targets fix
this in hardware and will not set the flag.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9b113536a82b..473f2fce258a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1514,6 +1514,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1

