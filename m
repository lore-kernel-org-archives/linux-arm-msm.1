Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52E44F30D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562321; cv=none; b=Dx/wv+rF9xNRG2rFQvw7O7280dM9+fKdEm6lDS9o/lYZaztfIq4s9LwgpRJQoSYyET8oZ53Iw6nFeKtaJB5jyxaBnI2eU68Fp8ZU2X99YEawqn+6y/b+jmwW6dyID08WzUIitKTrwwgqXdHYVQ47OAp5Vemxs7eh97BrZjnBq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562321; c=relaxed/simple;
	bh=ENSLaQYmLKSt2CR91JHHQSxjLlYkRtC5DM1E85fuaJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JxFt/SI+3+dVda1J6OC1pqX4q6Vfkac8PmliN3y1rUnSxGjc9mKiNi2L1A3FKZLkIQQ2cLWk4kK9nK0iMlFGVtx6fBK6ykKl9Ej+GoZ7bJtAXxUZr21iFiDbbmgaBrH0zB07wfosKK0i8U9/rQ4GpExMS8CcAuIwtGBBp14t6uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFopsi6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihGo7ex4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFopsi6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihGo7ex4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYlGE2185770
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tig36/2iNLMxXARCJw580q
	lc05W5id1IhnieCfc12wI=; b=oFopsi6smm7aJXG+TzlcemthzC+W3Dz84nFPc7
	oHW99rQn5CHYRWHg8/V2ryyYT0R+kNKTiRh/3EqBR6Qj1pw1pye2TqC+EH/7ofcc
	qpTUyhNc00jwtpBZkQutH9yCGu/xjxUC2ssrgmRzMDyo3JlBp65nFINMjjurHNYk
	UtVgaVnlmGOYkcfBWdLHNuiNdDfhZzemR1RMW9riBnNDU+EcMWSOuAgvalF25azA
	t+BLIg6hMULe0Ljr4a59F6dZWRXKPYr913GG7AQcaFa+xzWUXDsGd9itrgZkJ9w6
	9sLYx+IEgyXWOqbLmGjBdPdVQZqo7vVY5NNNfjtxAlokKOPQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkuw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:38:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e921f84a2so11553286d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789562318; x=1790167118; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tig36/2iNLMxXARCJw580qlc05W5id1IhnieCfc12wI=;
        b=ihGo7ex4yjpC5eQdBKxti3UZ/Xf+Ch9cbXAXutrJwDPMGYd0BI2FKbI6smupqtOr11
         t+J/3Uk42OFQOG3F9ipZwZRAMo1IdmJi46QBM/cNBCmkDLxdFFJgGsaKoytIxSL9G9w1
         /eYRZajJubhvMpHB4hlcmi5KLGrlTsV1AwiNnzoNKO/od/cVRZ3m4pSysKBkCB1KEwW9
         F1qXqhJUYpw9UZM94EAkZpVns0/me6DUDpMv0gXIREE3FqDUjqM1734GmTzAPXRFSjl0
         kOlexOlCNkTs/xchEEPBOgnDQbgluDpWBsaxKpv8R8uD+upHah5p1CSydKB2Lb4E22UB
         qiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562318; x=1790167118;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tig36/2iNLMxXARCJw580qlc05W5id1IhnieCfc12wI=;
        b=EDHys/KTB1LFBkNAd0XwqFq9H2T4tXzww04eB0DnFdbe4ZLhIJSPXCuNdPHvWBW9Fq
         9giWrwRCkE3ch4YOpotgkTteaO/sr2cCz3QtqcaxOB9HPt48ILomvtcYyXobNNjR9yGg
         JbW21gCjo/EuGR1CWdol6y5++2OuYJ/dTuixVgZ1jMt0wdUMcP4gXSstGbOej0Hs824S
         Nqf0VN9xedtK8deGdOsNL339H8SdyKJLXaj0SOi2WS884RXql57KlhQalHa6zRmqWlvQ
         fug+6NedUos+9RFM92eGWn7n8aXTzsn4itYAHWtw386BRxAI5XpL360lUV27yMfNpwWd
         M2lg==
X-Gm-Message-State: AFuF++lwuWn5rQSvI234tYANd2anFbLs3/INnjdfbtXNcd4XPoTBzVzh
	dBCIRpgEZhfKXBZGDHt8jgQ5PSv2QVHfSfWBg4DqtyJDm7eSsJcxI+/6hYDJeTFLQLLVv0kRDiy
	2fBehke/4TlCKtEXjWtu8N0ie2Bith1TBs1WRrRmdZvNT4NNH4pGSOzDKM8lY1FOGuYmH
X-Gm-Gg: AYBFou0zMDMNrRjc265IuYIE18lXZR0Uf17HrPMKLty2zXMOG4MxCTIVf77q1+LBQiR
	qk587MFe9eavKPsLs7BwuP97nC+sl4h25m/t6aEPFwzHyZYF9e77G/EfC2hDnsjbzNy79wFQPp3
	1GVuIWlVzDbvHvofkomOUxu4wbMJKnTGPTL1HbyveO/CuMrQNab6kVhLVV0tt9DW2e6iyHYo/FW
	wSB678kQ7M7CIEBVlhHVz2LDNrw4ii7wpGTPI/rQaoPqtsIVpTEsLUet5Azi57sSmwI0bC+gK6y
	rUTdoxgwPkgq2zHlnQ3a579beeAJujSJM4uiJayAH+5BGsFxVczn3tuvLJh5JAE9kdYdhonLcjG
	gnu6SYG7/8MEJw9gNgNoNCyL5PC/Nw0A=
X-Received: by 2002:a05:620a:3181:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93bb76a0dcfmr309314285a.1.1789562317752;
        Wed, 16 Sep 2026 05:38:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93bb76a0dcfmr309266785a.1.1789562312365;
        Wed, 16 Sep 2026 05:38:32 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cf66150sm1721927a12.0.2026.09.16.05.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:38:31 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:37:49 +0200
Subject: [PATCH] PCI: qcom: Ignore -ENODEV after Root Port reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-topic-pcie_portrec_enodev-v1-1-5dc7bde39552@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJyNqmoC/x3MQQqAIBBG4avErBNKyLCrRERMfzUblTEiiO6et
 PwW7z2UoYJMQ/WQ4pIsMRS0dUV8LGGHkbWYbGNd41tnzpiETWLBnKKeCp4R4orLMHe9w+Jtv3k
 qfVJscv/vcXrfD6kzVq5rAAAA
X-Change-ID: 20260916-topic-pcie_portrec_enodev-cc576ea927f9
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789562310; l=1358;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=ENSLaQYmLKSt2CR91JHHQSxjLlYkRtC5DM1E85fuaJY=;
 b=6hGGHRk483be4L9I30WqoeL5rfwSDR++wPTM33RJN/wRcpaMBAyhNhzfqZjfkqG1792lAEydk
 rtCEHw/KdycC0Ho2Tj0n6iprYZP3CVpqgJJrU+AQ0U2X5eueuN2numt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa8dce cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ESyKS8onHQUTpFuCZioA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NyBTYWx0ZWRfX9f5P9GApqTm3
 W7KL6Khp4plNaLbaSLeEKct0Xfe5AEO8/uA6pGzCNv2GNhhpL5SryUuKu9N4z7vrrTtPYScCfc4
 DW05f0FqzCVqsqoqeXH3wuXnZ+AhovqtNsFANKkbiOq8P/EVoANnth6uhULbKHIKMuCYxMW9BZL
 yFi4MpvUK95uQWuv/22EA9fhodQTKkGa6ETtwJ9souzb9K3xvsRdREEe9qZTAn13jCL94GMgGr3
 BnJ1dELK0WSsmFVtrTVNZM16KtOQm3Ukll0YWMfsS6maBoPoJxYOUr2/V0xRfR/ez882j4p1e37
 PPX4cj3nK3HCTWf18QQMzf/oamonmjPDTJYjN1tr+/t/Recc9wrKe+mUtrusQS/AlcL1L3FXKNe
 SpoC0hb7fduc8WjRI+vTQpxNNuhEi15e7fuGAS42C4dIDkjhiL4kIDImyuEGyiQCGDLRnOcwq9t
 4xsxOgYILTdJIcSiDEw==
X-Proofpoint-GUID: 7P9HjMw1cDcR-LoPbmws7bzQrXTQXZWB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NyBTYWx0ZWRfXzRg7PmLC4yjr
 yimzQQs9tJNRVYzT3a/hEYDUp7VVbIgk/7j/hK77akAMenCBnB1IB1ceuRFvdX0nfmFVFexsbpy
 ZYOj8jwk6/IkK/HRLXggrntbxrjMfCk=
X-Proofpoint-ORIG-GUID: 7P9HjMw1cDcR-LoPbmws7bzQrXTQXZWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160167

Root Port recovery may race with a device hot-unplug. In that case,
dw_pcie_wait_for_link() returns -ENODEV because no device is detected
after the controller has been successfully reset.

This is a valid outcome and should not cause Root Port recovery to
fail. Ignore -ENODEV while continuing to propagate other link-training
errors.

Assisted-by: LLM
Fixes: 4d88cb82a6d9 ("PCI: qcom: Implement .reset_root_port() and use for link down")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ee63a6ec99de4d07c16b8d6cb68df0d92f822cd8..3d3be9bf798b7c247d69969d6570385b8648123f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1880,6 +1880,9 @@ static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
 	qcom_pcie_start_link(pci);
 
 	ret = dw_pcie_wait_for_link(pci);
+	/* This linkdown might have been a hot-unplug */
+	if (ret == -ENODEV)
+		ret = 0;
 	if (ret)
 		return ret;
 

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-topic-pcie_portrec_enodev-cc576ea927f9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

