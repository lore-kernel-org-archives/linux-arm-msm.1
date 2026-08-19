Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1C3A5E98
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146004; cv=none; b=aVAePqSBpfoJa/QyWMt52c99olVfXMFv+RteXJkzyQ2bn1KHiNMjgpJF8ErUsi21ctdoQIz5DyjPFb1kSCBYyUS/USFg+t/DY0leiaEJvu8C8DcBY3XvmdbrgVQn9iS0JJCHBHQwpkZuYOe4KfQHGzYpuzNvwvw/XfijQWY8OBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146004; c=relaxed/simple;
	bh=gzbJaxCxPVY8JnK4ZtjTaXSHrAoIPOQmaGGP+IIpy80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMStAvow4kKPNrCFS7bZUQwld+4AJpsav75hdE01+IJtWn21L/muvF8nBWuM7kMrmvGdMxz5HOXYB4eGK4835jhH+7UEEvcUu8gm4trk++vNb+QIZY37736SGOTJILUb/hyAOwCiLLUPu6EV1KiL/q/0JH21y4iHMoMHRaxjghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/wHwrFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2RHqk4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/wHwrFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2RHqk4t"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0G6X1404845
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=; b=e/wHwrFYq42rNYiU
	I1hvIeC9ytkAoW6qxsQOgpdSbzt3axbxn9xFlUl+SLna8EukIwer79oGUe/+VIQx
	MP+zC6DOWjvWBw2UavA/HQokpKD3SF9vYuIlUjSeCm51sMW3rA2W64cam7BSWulb
	Zl7BgdaHw6OBlKUb6Ok7RzFfD93cUHxpVH0m1YU7N0BYAcmwXfbht2r0F+4SI9jI
	2/WMIqqQG6itQ+xW+47XGUJ8OquEjrw/+8EYCckbQRJWSDEiviaVOiYRv8r9+jTp
	AOFLh2COC5GxMP/L/vWytpDb9kdYFc3oRQHVPumz/u1PqKIjVvbLmzmItZXi2AcH
	1Wpsbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3da3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:26:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2255084a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145996; x=1787750796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=;
        b=F2RHqk4tH8hpOsiEfQuSw8FOhpfLDKYAcsjDXJYA4IE6mmSAl4bmtB+6O6QwLJWB/5
         fm8ir9O36bePI+CBp7+Lve/+HVErDnez2fXuROJkfLjDxcyUFnLfpvwRDE1FoFcqeQTY
         +NW/XUjKleSNWxrPlJFMf09mxIRQYNizUFLn3UBIXJqEOKrdl08GDMdMzjmHXcGhvhMB
         xilxs8EHL7TdXheaIqntBeQeg2e4e7FVECLTeM5hlQefgZHpHvT7Cn60OjTccMQx+Oe3
         Uvtx0W+m/zGpycmiBt69c/+hZQxaXXqKNQP/wgG9JpsjUBq3ZKKPlMoQVyCsgjhWU4II
         Tbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145996; x=1787750796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=;
        b=Tkog9l3yncW8Gi/RilFJAMtLI4kyLuQEgaLHpRhiYIu5d2nh7ai3T1ZvmDPeBv7NPV
         KkIw78x5jzxnuHn50nq/SavZe7D4gqiabFR4bH0EcBktB+Lrv7dcQnfVdOW5Quj6cbh0
         y7ryh+Ad+NtPry4JEjv9y146Lpl1hVu7PPxpymjZKmezSQSz7BUDE179BO9IjL6/9T9S
         hqsNymIcc0N6L/Ys8KbzgIMiY88EMKXtEI6zPxgOqOamNXBpJUCwDMKNas9zYbRtA4V0
         UEuK1ib7/ra0nN15Q2JOJIVQCz5gzmPjrHjYRTikxu8erlzPmPrjjuctFwO7pxzfv28C
         IHiw==
X-Forwarded-Encrypted: i=1; AHgh+RpiKBED8Oi/I+V2CXiB056YfQm6nAGX4S/uUKXi1mioxEM5tRcFjiaKTUXIBHlMA4SBdQ7zQYwI2Y9R5WWU@vger.kernel.org
X-Gm-Message-State: AFuF++mjBPiZpHdBsMZpp+XuYcTi2eg/JbfFOYH6l/Ip07VxnP/8xC2X
	vcZj2QQ6350pyzG3KRjTySzaybxFOISn/4K+qc3XEtKpyxoraKtgmm8Mdl3JUQxVkP3qOMJqkRE
	xPIwCeadxWpxyC0oUF5Yqyki6Ud3SDVJaeHxk4igTD/3jDQqppIj9U0G7H3utbKSNNHNb
X-Gm-Gg: AR+sD13zOff+qh5QlHthC3tWXOGUg0h5151VwLf0gp89og20296fi3cVFqhLA1nqSm1
	NZGhcbFv6cGcNcAd+pxoqLwTJcP3pGj7IqrpmhV8MizdNHnXN4brfhopev9owMSYJcJyvnvqfo4
	/gSC2lGnXn8K6YgMH/NIDkFZFflkkmI3sjIWlufqs6lpiR//aghQe2not9/GbiaRIVPgkIqt3ID
	m3yhOuGHqdqT5Z4msjQyihXMK0tT8spOBsM/uByDBEvnwqSHhafkUkLsv/TTDrqD1UIRiTZKWQa
	UncJXtF/vXwl1W7MwZajI8A0ogEk11EWua5fiaJbzgq4Ktdinl8o2Bs3B03pquadiUw/G+ZzZ2C
	eHBr+S6Ntpex2fvJwsNHMNNCRe3x+Whr332Y=
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr9783587a91.10.1787145995944;
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr9783480a91.10.1787145995520;
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:54 +0530
Subject: [PATCH v5 3/6] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-3-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=1763;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gzbJaxCxPVY8JnK4ZtjTaXSHrAoIPOQmaGGP+IIpy80=;
 b=loA59unnBaRnNZxvG/WUrecr0BJunX0WpPSWWcivrQvZy9B0XTfHfNyaXVEQX9wEluKQnYWPM
 L8B/TkvKplZDph1FExIucdFvjt33wTNOLQlKQDL/w7YzJYt5HKKSivy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX1eONR5aWpUYo
 7j8aAm381bXnGDi03h0Mc2+QH7PQ5+nkOFcKe3nGQTDbKk8R2hoyJQrEgXYi/WRef5s9EBnRYUB
 n4gMihl18Bdx6Q1+C88QgbFTHE6wqL4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXxwSLZUELv2/y
 RvMq5Wihd6rHTpxWqMfnHEsbZFYw7yeW3eGPoYpa9zzEyIEGLCwgYoA/tZ609CyRx+jBgql36YZ
 akeWqsW0WP4QUWkjrRee0Yem4VxcKpDQhsgj7Vp6FXWuOK6AV+C/bQzUaevozAg0XiQPppbJoWk
 rpiU5ZDJj7dkwWCdDm7/QRJe94xf/N/IRNFqHhkv1PBApC83MYQzK2vPjO4Ln/0ky4f0gvrlO8V
 a9vYOs9NOwqCLzjkiFC2LqMmvJcUCYhnAg+XhgdqJEpRQHo/+SU8799ezEJfuDouHZ/xGRYCUVu
 KTuIx4aI13HfZvyhUPRguUQR296clF6X94EUoGr16WmYFHAZUtQM626ouHLn7M7DPCKBIVlq9BT
 oZgma0mhsp7QiIWB5OL2F7LUpKQokGfJyBUjUENzFFf0LigNO8kBcB1MrWXsPo3jPySm5/rO9l1
 L7xZ/bTlSPBR7rSkEgA==
X-Proofpoint-ORIG-GUID: GCUkV3LpkRJB7XfU0DVYL87Z9SIZJ7LD
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85af0d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GCUkV3LpkRJB7XfU0DVYL87Z9SIZJ7LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 77b17b13ee61..cda7d210ddbf 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5939,6 +5939,21 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for Gen1-Gen5)
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
index d1f2d382189d..244c145af04f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1727,6 +1727,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

