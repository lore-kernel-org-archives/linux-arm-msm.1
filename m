Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093034;
	b=grLx//ppVkLBnMhRnclSrb0T0NHsmavQXBNJ2TyzwtdliakEHsKWSd1IXSVNsFQpFvMD
	 9SeCCdNiUHYupOAwr3e3DL/MRF7eHo4YRJjn+hzOX0ZdqshHGsKZ9WVLiOzfGlRJqP2Lo
	 87gZFT8xlMElkcsZGnmNV526nDuUYgAAB+MPJ1a3KRRJHH48AepmLfnknWITMMILCg19w
	 +f+qCsz0kqCvAfLRAl5FLk5Cvu9tDr7OpH2K2+ld7LGIAEDsPdB/ZffQly7r/geP6zDc9
	 WmjdYqohNO5DG6+a+KgU3w9kmmRTwT7QFFyoK1aqiEeLm2DypRsVLVRdaoTZPKsGZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
	b=1eRx8DYuyFBNX0ATXAEkha7e6tkTvNJNjdhjBy5w92Ba3ENGfAI0gZXoZ8WEUtdLcL0z
	 6Ae9CyxRdG6mDW9wqZUzyqCySoh7COO4akI4wceQ+Lxu0jzJoPFi3EdfLz/4s5IL4sBbr
	 CVJwAHLeZ3xgYR2uUfJe1uAHDfQ9U7hiA6xuI7IVIQ5ECURAT5S8VSB07lHP+OKL+82d9
	 sFyhpjb9klJ7AD8C0Plq5ZUVk5B+0llUqJFphyNjVJ0R6xmpBRREDL+QsizikouOwD36Y
	 52U/09pY0Rhjn9lC2d4jQQJahrlyDCQv+r97J6zzg1oJ+70V20kikdOiPjP4/QKXlsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J96yC7DS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1EE606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1EE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J96yC7DS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkFYh2332122
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=; b=ZRGivuQ1oWWQGCRi
	sCfEA/ppJkCsTOqCJL+s41gZI1kLSsJDxN9jfB8tC2tt3E+l2SBcZbDTRAQ2Nt5v
	ZOPtBlcVekwMteKFgFVUK/aHwbfkqAqOWSJq7J7uXF4eNAEaU6HXNM4pwrmBb46y
	o3lc1NqC2KrfxfSB5wILQ2xVlMZGwgnlzlphznYFAUi35fDj1icARv5quHfbj2cK
	Z8H8HbTsxJGGs6NVR8Evjyrb8lijApNynaAkgQxY4lkm2/R0B63ZOeg8wwXdfSnW
	0RqbJ2GYL2qrvF35pLsEyIjKx4Jf4CyUgfYNZO9JBSsjkQDHVrBFjAfDBk2EBOWs
	yfC7Gg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdctvfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2420068eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093032; x=1795697832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=J96yC7DS//5V6PtICWu1L5GlNCDE9QG10CJHsDdE1OrNjqkAvbJVx2Z9BSoVhBZCuq
         FN4GQQgbURpL88+Ce8rLLhQto0C3gc+w4vRHQZmTZrwMICaOjFTZtZL1o/x6bcTBqT//
         lziqbsWFFUFCuAvCtuoob3PsSA8gHo6025sHf+2/SfenR2qH/qu17xDdEP6aTnF8sfDC
         9iJ2JPpG+cGkOjpUbg6aFYtgI7a3kKpn36puci+bg9EwiluUeGngIJNiMS9PwudFdkGf
         RGADE5V+vY9u7GtcW+RdrkGDblwnNjNeVqT3VmOAdWfRKuneq9Wmmv/dRec3M0WscJsT
         pTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093032; x=1795697832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=j/VbEa4ZTRkiq09JF7qI89HIN+hx0eJt+uIDre5owqGlIl4d94R3NTHO/hE4nBoBoW
         HZe3MaTFke8WxQ68+Xpp6E/zmwZKJ/fWk9DEjjsaY4hH7rGUZOEDw25Bho0VzVFgJj7J
         imDnwAUcaC7JSeqUAqlSmEPX7hBL6Jzyp6+VE50yok6hSvc9RwSxk1BnY12LPc3QihNE
         Ium9RCoMfzpl0banMmBbXtxGUBmXHhpm+J8V5IQvusYY3GntDb+haiWlQiKYxoZ+HPgX
         B80dSwmXiu5Yac2lGzKR4QJvF6alHoskUDeod9QAGYG3Dv9iubpt3aBXmvX0/Yn0PGk4
         L/6g==
X-Forwarded-Encrypted: i=1; AL+hErGVVrsoGc5tZ5Ef338bDIQHePfAn4yJE7d07ZAiI6li+kjrhJqx7ZL6HD+nV44WNU7CMI3f2ld9Fom5Z0ip@vger.kernel.org
X-Gm-Message-State: APuU4Z/fXsWv37OQxIkE5YBy9V7C+I2nwat7iQnDOI/wujuq8/6dcnJt
	VAfyZpeRHs5fT8Ab0aMipl0+CJUnySOKwIaUBXMVX1g6jBmTVjl5DYAEDJ1m3qkal2hkbKIAYid
	zMuWByvWwbChAzIL9YBj41yevSEM5CNURtt+fCQJNhgAXwiYrz9fn84Ao3ZeFb71UyK5p
X-Gm-Gg: AZFdTZcf5SGdo6qsFsX6UuL6GGVEmUtRutPca99X63eNLZ/ZZBrRFp9dPtRhDB599Qi
	ltD/xzX3Vxg+eBXFi6t4KGZ8Qd+cNluSZBdAYqDKUqUumCdsCVLuwVGMMdBkbTw/f084I+5gmNK
	ykyHCKeJ/cXQkt7vFy4NUpHtasS8XAKG/A1s/oGK007GOyQc7kw2nQ3rsDRhZ85rZmBz6CEuUAL
	Sh270AAcU/MK725BOZeDtjfRAgkVVC5B/yr2UFVNce9aVnxw/jLM8Ce9BikNuiN9j4RkDcVtl6p
	dgvtRjb8EwsKzykGbsGqgTfQn52TDUN9q/7z0xH5UaFF2rAiKqpBuCSPZLvmuUEFgOm0SvyicQB
	qOZDfXBu2DMHgKR3jLqZe7p/3Dq3ORSya6EwUbIow8bD18Oh4+gr4bN3iQd0pRKvrbEXaUT2KYN
	cwjqz4Z2Ip
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032281eec.13.1795093031798;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032235eec.13.1795093031084;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:10 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:35 +0530
Subject: [PATCH v6 3/7] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
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
Message-Id: <20261119-bwscale-v6-3-9a9a715fcb46@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1780;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0zEUl2S9sKA63T0Lpy4WWFHatcVllvfZJQrn5ZSlMz0=;
 b=QiPOhPdWYBohHyIwt2tF1rwyCA1O/3J19GBbfxfpRGsrmthwLR54jYh7vJieyTmuzer/m6ZUK
 +J7M4UBSalZDTdbAAM9bOcqLpdX402IQeObndCBqPYoPYTjrhrq7CX5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: hlJGosDb2zcq5IRnFt5KkPudH5Krdexn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX7lbbjzCPV4bm
 O+2HRJfCbhYXOMZkjt3fRWCAX33g9K9e6cuX+sQFlZMbJAgIIpClk6VYjExhVrNUaXIBYkWH3/u
 cyMta5mBM25rnWw9mre2wvfptlRcM34=
X-Proofpoint-GUID: hlJGosDb2zcq5IRnFt5KkPudH5Krdexn
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afef228 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXxXS0/8SDN3yV
 7ZY5EycDXqOsU25QnaF3Pow9Sf0AGMA2kHOrWp9bxI1BXJDH5bGqrPDrxAbIWWTf6k4DnIjb6h4
 W9yGkKy461Z9jtiFcK3UCJI9HvkT5j5WmnurP5ZUl1xPpR8fsZMuiISQsCdJOayxN6a3FaX5Ikh
 VfGn3g4ngknWQov9rOOiHSiSfQ7fVcVpqUcmvLFhDUN4zgay4ashEvXkTkKwXTMyTJpSXq52zUc
 PaExpFOa2lnWXfCV9dBNlmTI0XH1zLqM74JT9ePbOj4HSIXJMdu1CY/jf/Nw3RxpbrjU1OcPTAW
 tOo4Lst2ytT/NR0WvO73Bbyi4lmRVjzr+Qr7Y8aaHaKt7yiPiJOKMdBgr2+n6qWjtRvTOnGi5mT
 mjlUygESfAl1xU71qPOyd6HP45iYdBvwwKo7Nk96pcD8CZJ8C/BhF26g0bB4ZXDDrv7ePrEBrAU
 aMrrX9azg6kwIWDCBCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..a89955617bec 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6056,6 +6056,21 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_bandwidth_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for 2.5 GT/s - 32 GT/s)
+ *
+ * Convert the Target Link Speed (TLS) field value from the Link Control 2 register
+ * to the corresponding enum pci_bus_speed.
+ *
+ * Return: pci_bus_speed corresponding to the TLS value
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 352079393edb..d12875c95491 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1739,6 +1739,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

