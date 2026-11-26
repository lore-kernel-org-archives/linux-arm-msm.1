Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719644;
	b=n2J2wjV13qpSykbQu7bwYr8Nx2S6K4jj19SHu5JVR0JcM97xUXujdIiB01Zkt3rrD9Rf
	 01cq4GHovEpylHbX8daxDcfD1874FsYVN4+nlfSQ8KKjCcdFeQnc3slLLOC8oKnmJPba/
	 VsMkP36D2ikoYoNEInHYWZPkc0Hol+HCPPnDOw5xqUirQn9Ax/VJHCVDn4QcdZcHGMY2N
	 rg7fMh7Im2/rG+PscePIiydmVkB5V7xVlK7MNVe6H6Fv0TJeUhlq0Y2KCpynN4WtEpadq
	 1ksHT5Uo89f9mTuFs9sHlQN/yiW39HRfWJM58ZJiunJW/35Iko30oBiMV6fJrMN1IQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
	b=wzKE5MTmi7ZH+XsUKXBSVw24+hA2beP48blJ5iHVY+undkgOcXC7zxpYjDENTT1U22Oi
	 jeWaHQJUa18TBacsXoURUZjkB77d/CfZSOEOI9j2AJbJBmXnzfSr1RYxVlvZoB2hxy/w9
	 GgYIekah9H6cJoXAF2KqxiOVB5UAEzyGAkI0QbMoVdWTZvoTJD3amEjeVCUhQCgAk8Vp3
	 DKw76Qomb4YtUyL0yxMLKQLaqYwqL6W4c5pcH2t1AnxRfrdoUGacmLbIuNjOa1KvXUxVS
	 xN8qZWOg3gX2iAP94TK4LjPUGljOJ+upd0mvbOtXQGvG1Hbr9ustBJuq1xk8zdPpxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KckpE27P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+obZYRx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACAB606A33E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ACAB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KckpE27P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+obZYRx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGc3ni596445
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=; b=KckpE27Pnc7JARjp
	MzLs6mLmrBzDyxPH+8dr0RK9QQrlA5YHJ4hihocS4UJbIu36aKKeYt8A6OTwSQdC
	3KyxHR7ds9lYXsZFHBi/OYlf2lrFtkRT9VXywuQHjxV0bFd6J1xvpF7hJhB3Pz4Z
	ucygLQrTkRlN03NBrKunYg+1PRvwVOAtxEtyY3bLhtThVcWOZoGWqVC3Je+0y3YJ
	RdtrwOkiqgwG2Zv96p8a3E6uyuLW/qqiDAudAcTXX2qT92Wwq6FnBuZ9+CdDjSPu
	CPtxnrembLe2oCmgkn2iz0YACPJqp7PhDlQYN3Y+2wL3seP70law+vgCg2UW7Ja4
	HkFS2w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90dgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so18284317eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719639; x=1796324439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
        b=K+obZYRxwYumv6ZiG+MSWMmB08Z0yH+xcgtgjqpZ+XKG8/IZTGJ1qJZN/VXfVXAzwb
         NKJpQ9Q/L+40R4zWuoAcH7/pBLH4//qyXGJqLLWdtEY0zMu1BGATX1TJedKq3k7CR7yY
         6h0zcn6vKtadxxTh1tybGvYHVmesaat1kwXSMv79SeWY/gY0ipnh20LhKJDeT2K+rSjx
         zqrpbyWwoC2vUD5EGv4kaLiFNeGE4Zb7xUQfJhW5RHf5ZU8F1pR3F9K+p+1sawhWS1ea
         w2gWwWGPg4kDZUcAIbHLghoS2fGtcHZwnUAu36yzbbwMWjXjLSHnQPutBfmniQha1fRT
         skag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719639; x=1796324439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ql1s6Wqvff45G+O9tfHzNyc2plPbkIqdZSJOZHvJEO8=;
        b=igkSSAouiJ+6SWInEQLUMune/DED8nhLm/KuDWFlrsTVvYEtBr2bJShyGcNAOhJvx6
         a+JYfLL3SQpq1sUJEjPdnxVna8pAVnuEmTPxdin620jLVj82leLtSTzNkCMJSo+g1uqf
         uFOA7dc0ZlhD3rRyZUKV68G7EebKN05+R7DhvBTXUuogeaMBdz+Y917UivnPGi2PIUMi
         FZWioOkC4sE1nokBHWiYE/g5qoGzxUvuJDsDqn9IZa2luBdaFTtOtJzW5W7L2JdmS18s
         vRsQV+RsD3caiAqM8b55+emvb9xL3mOuEfPiOTKuBjhLQEMkUgV2IniiPoEZAVIQCc7Y
         DpKg==
X-Forwarded-Encrypted: i=1; AL+hErFFAjtdYdDsByuJeGuQ7rmBkvz6cWk5emEE5wPHga9bkcrhTlkZchzHv3uq8TbxyBp14bbeJ8pNbUzvCfW7@vger.kernel.org
X-Gm-Message-State: APuU4Z+NGTXVhpmkgvH+jiHeIJctGa+VPkBzDC1WwY3gsumChz5IGoe3
	/fVpJobcCPstlhAVpfhH9D5yvTJZkaUWO7fcvh+tMFRgKN2QdNBtjlmRXyIcnKi8OHrSut3WsE6
	G9cjmYMSH11nB7pQhh12Np6LLhb05X0spEGC5UzSKvvBXvDi7Y2JNMZFLxgTrpRtANpPp
X-Gm-Gg: AZFdTZf5Oy7nzFpRi0AULH59+SY2Hykbs90pUcMwpB2hAmT2/9R0OT6PWGlHdl6s5Z3
	sshUu8Q4XLCjHuQyhVqEFfMM2pSBMzlObpPT87UGh0Gyf5Fib4UyX6keAOstpOxOnUgetJUT2oi
	YSJZL09gjtgLc/dQQiEO45lxSPiZxMmthcAyus2zRSOTLXLmeOVKXhTabqw5HvOumSX0gkUotOD
	vCGHpIYmdX1r37qMAZIT/Q+3fzh1okRClpemObGbRlLxLgEryZeTH7v95AbdMh4zzLwDHDUCWrO
	Jp8eI5hLdJOVrPSUN5mvwHL7kabhR8AsKFJCPYSH2qcMXDkv5//bHT/bQkN97dPRcA9KcuvUYTf
	bzhl1BSgTj1mhd/ZHNlj2bON2uaae0AcbIwkJpKfdr2HlJzLOJjRynCQGjlxYN+KmyZw1R5G3fU
	0nDCEK
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr22317824c88.38.1795719638634;
        Thu, 26 Nov 2026 11:00:38 -0800 (PST)
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr22317792c88.38.1795719638043;
        Thu, 26 Nov 2026 11:00:38 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:37 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:16 +0530
Subject: [PATCH 8/8] PCI: qcom: Keep GDSC enabled during non-D3cold suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-8-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 9SFRKJC4tlbdIRANfW0OMrO3WhS_DO3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX40atdDVmefBJ
 IfvtH8YKk5tYOm1XhYnQibyRn5lDQDx2N5L5/JP93bbladBMLbgekhn6c+PByXMWKbGPBV1ds+T
 oYiCMfPNkpZDHcfIirff2UyFKQ1AAHPAv4KPiGOe49MiR/2lmftHksIyEJO363UIsQJe8DPxDNK
 y1LorZsXai9NnRWpfFPDj7cIEhpI5OdZ5uPpJXo1Nm1IofUfwF6yb4Tgj1TfIoniFu0vWkJ5H3Z
 NSjYmY3HLhreAjKxupwCTyeQFzCmPmT40UItTWb1m/xXQzLyZKpfAnZLyNbo+Zgw0J8W+10RUKc
 owrPEWBQVxL/G4tXUHHuWbvxRjDq/6bDWVxMz3GX2v4Q3BDBu/CTcf1iG/hRHPXFDRpGxW9qGcT
 l++Pv5wdR+PImWi+0MqES5mpmaM3Hoo6/cEtP2K4HBxoADwQzgxhvyMdLswV7+3ivWkvR1Fsigj
 yHK+/JzYvgf5iwrE4/A==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0881d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qWrkvF7FP1bAQ4F7tlgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX/WLK03Msl+QV
 X5y+Jl65XFyjPY8kFKzNtUsielNMkzKYdS4Da0LV1/PZe179gXCq4XEmCAyJ84+VtAMdnw0zcFY
 rQ0b+SCRORCmQY+xhm8zmDFekLjNGoE=
X-Proofpoint-GUID: 9SFRKJC4tlbdIRANfW0OMrO3WhS_DO3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The PCIe controller powers down the link during D3cold suspend but the
GDSC is required to be kept ON for non-D3 cold usecases.

Set the GDSC hwmode to true for non-D3cold suspend paths to keep the
GDSC ON during suspend since the link remains operational and the
controller resources are still required and set it to false for the D3cold
link shutdown sequence to disable the GDSC.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0a22b22a40aaf2ec75cafc12b054b..a4cbd7dc896e5472dd2cfda3846c6ff38cf34ef3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/pci-pwrctrl.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -2495,7 +2496,12 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+
+		dev_pm_genpd_set_hwmode(dev, false);
 	} else {
+		/* Keep the GDSC ON in non-D3 cold usecase. */
+		dev_pm_genpd_set_hwmode(dev, true);
+
 		/*
 		 * Set minimum bandwidth required to keep data path
 		 * functional during suspend.

-- 
2.56.0

