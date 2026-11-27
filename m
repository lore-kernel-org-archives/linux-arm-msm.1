Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790474;
	b=h3umhOM2EIyb6NZAo0mV22Hnlju9/8REMmst0pUiW8SN4tjWrhVUGEb6XxyAVaVUdTHY
	 7ZFZBp+fTv/hu00Kk3s5BzRSkloJbIT0TOd16XX9iFgzauPG4HS3x1QFobJXzTBGwtc+q
	 LLxfUo6tWwB7F/0kR+IM6d6tCbpK0THZpmv6R0/xDAb7vMbEIVgdrEtt81+xqyIO6sjYY
	 hXPg/cCz3wv+TPpuzf4BF9khzCYMCnuUQcCwQQj6OluXdmPnaDycZdrsOqRtR8rngE+hv
	 cu3bLcHnfDt2fD2N72Hze9S5qmAVWN9kgOkx9TqZ/zkIci8WzH+hmf4LVjh8DbOKJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lVQeGD9agzy0mh5pcwZtPylSjLuXqaDKZw1i3CUR2Tk=;
	b=R0x/VTQGKM4FUJQmktQYQ425H9hjM93aeXl3HqawNG7TWhj8bBMG1ke6ZNc9efl21I4N
	 eN5AwZuXlB6O1/2V90cPwAtBejDaI93DFiGmrgKDXAEE4bm6L0SzwC0A/n3JOQ/zyfV8y
	 4VRZalWfrxvGbSvF/EQNnZd06/nrtIn4d2i9QaI+jwbUYfRUiUfO6/vhy2GIX4cHqHupH
	 oxFUpi/3taZZCY1hYhamt5ykzc2iKmS+ncBOyb9upOGNF4gZBfeO0+0ozbk2K+yvI2bLv
	 +HgAuHJ4Lgo8kdv1jjg2Ot3u+VjEfpk84rdQhLIXDaOTLHB23AhDz1R2nQUmTAdSEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssso1Gle;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH4i+qHv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D938E606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D938E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssso1Gle;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH4i+qHv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Kjk1790961
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVQeGD9agzy0mh5pcwZtPylSjLuXqaDKZw1i3CUR2Tk=; b=Ssso1GleEDHSTzLM
	sp2sNzcakwartjCQnM5P/CTfPdLeWreJp+TnQUMCfuUd5uFHkbz3w/8UvlJEjcdg
	Wn7blh3ANiIZLPngdjrVmgBgKFBDQJzuA9h5BYc6bk9f1plVNKSF1R9959ZbAOae
	SBooI9zvxysI4jwGmNuJxPmSSrKem8YWvFaKKMe2goff71qDxUYW8KKcT0udk4kh
	l8A4JAY/jwzRy6sig+uQQIL3P98H+jqXm1ROvhgbl03L+sNMwnv+9EqubscZpE62
	h0DMKdRBtnPTEJu99y9w5oPceP+i9k5VAQopRBcr3xu69Fy61SXssxTw5F28rriG
	0Xk9vQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3b044-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so8789252eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790472; x=1796395272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVQeGD9agzy0mh5pcwZtPylSjLuXqaDKZw1i3CUR2Tk=;
        b=cH4i+qHvWtghUOuIDKphBJGjGOWzdm/RrN7ah3U3Acs6u+3y8klNmHghB1dmjxC4EA
         jm3eCjI+CDPUmxOAa3chO6cX6LaL3O5RxQmh6eyXEQj0VDby1X7JvFxLv4CAJ0hvmMjl
         dOKeLd6TFrp4UEjm5e5JX3o3Za0zeQLJpRF4c0DVbVihwMw+8/4nVl2sdXFG5WvJ7Hnl
         SU5hwggF87sPBtyZLEQxfs1F5d2eYneTmq5WZBz4o4WqBPSa3tFRSK3b0+28ZG73PeBw
         Z3eiPqw7hyf3SXPBIWOKRM/Pa+hDyoubyGObe2NTYd+zXr/s0OgAtdZ+WGCGioCNNznp
         dCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790472; x=1796395272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVQeGD9agzy0mh5pcwZtPylSjLuXqaDKZw1i3CUR2Tk=;
        b=rVeXvn9ZK/rYrKuaN61ui/P6LVsyZPQoywwbIF6qFwymPWVnj7iuqKT6qN2Qt1tE+S
         naH03C1AolWwBiz8oa3geMfYePbKddG49CzmcCxNyfIm5EwRGwebvyokTlXuPz/NyrQ3
         eSiTdBmq13RcNacIcTLK+N8vywEsNbMa9v4fEH78jGt4cOZb48tF/NbMCnJlWm21ezTY
         kF0Y3jjLzHdJQYkLloGae72btpRBbjvXK6hXnULm7TZlK4DZGT4KxVcIKqF4DTGYnHxf
         D9k/Z5IxESjMroNOzi0DsgIk96qtyIYyEFVncjNgcB0BEEHVJqojP2GPqetSXZnzdFzI
         fO9Q==
X-Forwarded-Encrypted: i=1; AL+hErEAbfv0jnds4z9iobkesFm3dtcfUhRofurz67Vk2ejdBL5qnbD1PEUXS9woVeKfO4/aczOoiMJ8hAQDmOry@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lek6Go3q4XhlFBzkBzNqQ7Yi+zc8wpDOKVKzQV0FqRU9MwOKt
	4HCAd3HQX/G3XGoVfVIhzuldbZoWdOA5B9uGd7w9RyWDFE3ArY9PpHAb5fMhaFujT/Zvw2ZMSof
	qut8H6fevHeOdRop8xNx027zxHQpJBJFfV+Ga1H9K8u0mSoKNj5Bxsmz5TFTbps35jMDI
X-Gm-Gg: AZFdTZe+OQj8nlwCQArND/5RzB9K9EZNJ6H9C8WhCkNf4fka2jbSQ5zLTdF4Z35UL25
	E0vBHiuUKPz+BQGXEMRaZ8F2DgT2CUaQ6VOpuAy67cqR7XCLeWfQVSucRIUw08bvHH2UPhtviu7
	PodtTTMWKnLBJxRLzbsQ+FLHkl+pCpPcKYwi+tQoWPGtZMY9cniINvdV0SNq6fWpf0tKNGbUBD8
	vTLbA0KV5Nyi3owdhefdTk/hcT5kep1ghI9M22xq8b5agNXM2UHBY1WaBzLQzFv/e2SyrQUkmQM
	TTLWHyPmdJ42ZEns3tp4Q3wzFTnGwmN0pkDb0pK+wY1s6+ACxkMGvCm7Jr9CCAXFnGEgSbyJufO
	tockBMY31MbLj/fCTxxtbpSpc9kocp7nVKmDG6eApYsht6/bjZUsT5VlpnvEyH0wW5KjwRs6TDD
	4mC6ozow==
X-Received: by 2002:a05:7301:650c:b0:386:cca5:3626 with SMTP id 5a478bee46e88-386cca53bd1mr12721521eec.31.1795790472095;
        Fri, 27 Nov 2026 06:41:12 -0800 (PST)
X-Received: by 2002:a05:7301:650c:b0:386:cca5:3626 with SMTP id 5a478bee46e88-386cca53bd1mr12721485eec.31.1795790471557;
        Fri, 27 Nov 2026 06:41:11 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm82970809eec.26.2026.11.27.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:41:11 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:10:50 +0530
Subject: [PATCH v2 2/2] PCI: qcom: Reinitialize MSI on resume for
 firmware-managed controllers
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
Message-Id: <20261127-pcie-controller-reset-v2-2-17467b64f5f5@oss.qualcomm.com>
References: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
In-Reply-To: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795790457; l=1624;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=WX7R2eiTg1XRmSTdE1ID9a+HknD/KT/w9md6BbR8JFY=;
 b=iB9pAwj2cwwXHXvZfP2boU6JGBIx0XChK8Hj92BtJ0pmCggskWkOwT81GsjYJTl7rTs4Eji3a
 IUxOtyCrudQAn/CvKuCLsB1UiqrxsW1OAws/yLPfFKlGfbNK2TLNYVw
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b099689 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VdY5-eERFFFFdNr3g4sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xXLwXSCjhvDnvVtDGwsJghZuq6273PD-
X-Proofpoint-ORIG-GUID: xXLwXSCjhvDnvVtDGwsJghZuq6273PD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX2kpW+T3SEI9l
 h0AH2QudwJxJXFB/E0oeCG1EmQ52gnQ47wcHRCAkMvZ4GqSqfAufStN65y1/KqyjyVaZi+BP+5E
 T7KX8XVqSuv75oTYp99F1TOReeDoksJgGhKIFWtDH2JhIuHbahFaW5fLWupD2KmWya15+WahVT8
 Y5l6iHR4rWTwg/Q9potk2HOUcA7RNiC5G+wwuLsKa7AtVcDtCq9HrOu127ntlQUKsjPliD4IrOk
 w1b6yVaEjqwp2KQTikcz5xYpf4gslKr1s9L/ci7GV26Lpk7JexELDG5Nrw3z0mspBcQ/zR9Qd8q
 5/JxJjssd7zB+FNYrrQ+aR+dBUvg21p0HHZl3bHZglB0/5PSugiNN2kiSeYfVpZIBcbYbbg3Yz4
 kUqkei7JvJJoD3OtRQlDo+RCqU+BMPBHb5H3rUwu3NNLeB5WE9lpFeXflVM2XYYFLuI8rfmDIjw
 AKfd3iSDPTcbBVvp+EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXybEFZTWOBgbz
 3LpP7Tone7bPKVUpT+/5EEpnT4mA5jEk2amlbslRtwH38e9BHy5B3g5ooLKQ4zZcmBHZ1K380mI
 E90oRj3T/ky6NeAYZn6XLQxMJVbr+K4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

On firmware-managed PCIe controllers, hardware context is lost across
system suspend. While firmware reinitializes the controller through
the power domain framework during resume, the DesignWare MSI registers
are not preserved across the power cycle and must be reprogrammed by
the driver.

Reinitialize the DesignWare MSI configuration during resume for
firmware-managed controllers to restore MSI functionality after
the controller is power-cycled.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index fe86b8fbc895..51299dfd574c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2325,6 +2325,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->msi_domain = true;
 		if (IS_ENABLED(CONFIG_PM_SLEEP))
 			bridge->reset_root_port = qcom_pcie_fw_reset_root_port;
+		dev_set_drvdata(dev, cfg);
 
 		ret = pci_host_probe(bridge);
 		if (ret)
@@ -2552,8 +2553,14 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	int ret;
 	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(dev);
 
-	if (pcie_cfg && pcie_cfg->firmware_managed)
+	if (pcie_cfg && pcie_cfg->firmware_managed) {
+		struct pci_config_window *cfg = dev_get_drvdata(dev);
+
+		if (cfg && cfg->priv)
+			dw_pcie_msi_init(cfg->priv);
+
 		return 0;
+	}
 
 	pcie = dev_get_drvdata(dev);
 	if (!pcie)

-- 
2.43.0

