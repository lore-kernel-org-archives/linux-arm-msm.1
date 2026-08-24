Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6263B2D1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549718; cv=none; b=dI+lfxw8OllrpDIChqR2lBTqHsrFqyEhCvWbY7QC4+WFG88LLNpmgSMDF5nqraC8YvzGh6k748UHQtojPriu6idSwMMQIfFeJqhQ/F2tc8JNfNWko0nPKpT99J4ctmhV7/aeUIMsrHerXe1QzMHvz3r6KbRoIdA5XfLkHI8Oc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549718; c=relaxed/simple;
	bh=i18DXA1UuvFFxlInAjMEmK2CjnCD979tKCem1E4xy6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EV3NcE4kATo7N4KE1A4ec9YFVahHTdBv93HRw9P7lGZYFZ37nAR0ncm2t3Sv84qwGdRqeIuk258Yj12sCWiB5WOO1xeYkT2cVNMXNuZ5IS3ZmgveKKr/V+Rzu06dU5pdmTThIzzwAY/xp3l6rfz1+1wch7fH/BO4oPZK9/Voje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmIdoIZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT867f8+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmIdoIZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT867f8+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RS061008820
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tsfm3B2VKYEmQm7+WBrIBL7ccJpws7BXCiuSJtGpd8g=; b=DmIdoIZvetS5t4QR
	P9MduT6G7urPR0JuhgcuxNIUuzrRRr8RGhpkqqWMz409U+4T/47HHL4HLhDUy0pC
	3zk26oXRYFrPcFKJljSkx/OS8+6x/7vtL1XlkrrPe9s5RbuVbkzcTYSjB63KHVeY
	diF7uHyku+pSjwxVSb0xgbkivysCrdlejaV5jFxfsxUfwRVT/IuiTfz+mostGBKP
	pYg/ww+GEgTeYoMxJuFYyiZ4zzP9dBpkVVKCK0uCm71o7mQHSvFvOF7EMlcDEqEw
	xkWU6gQhpPFwtI3ZzToqfbwMnguzN0091S4uYpGl84cwAKI6oicJzKp73u8DRNTn
	gDySqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdanu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:35:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso3979976a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 22:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787549712; x=1788154512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsfm3B2VKYEmQm7+WBrIBL7ccJpws7BXCiuSJtGpd8g=;
        b=ZT867f8+skwwLb6AtWZFGdOsAgBctSnDJjoqlzQFN24+HkIuNErFV2PUTii8yyniJr
         jz5lHPV8znMnzVXWmcOtmz/BwjHduw0RHPh0I25nHXWwYGegGaO9nMr5Ii862R2WrjC3
         Qw9uKv9o6SA/DL0cBrvfIQar9btvEEwhoVhjci68GxPUxvicm8VaFGvsQJs15gbn89Sv
         7xhe20+Eaw+7qPmXv3fhyrgOslXH06nKjrlG8hoOEKRAixpNuNfIfpK8BdlJa1vddjN3
         2RtrPUIfg3oaBVWFdyplGbztq2gghUqrtHXsIVUERTNG80mqoFoiGnnTyp4vBd/QbXQX
         TS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549712; x=1788154512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsfm3B2VKYEmQm7+WBrIBL7ccJpws7BXCiuSJtGpd8g=;
        b=cCZRAyTvuoqnBdnTPBSQR4gZefQxPO4FPfGuGXL0sVLhoWXNVJ3VbvXkiU7i19FBMB
         pBMnjyQadoJeWnps1cJ1PLHp5yRh7nuvB/YIj/ZSNCzIgpXeXu7V4+n+ydMc58QYArwm
         2sLO4IT7ePsaZtafgFC8q75Ry7qosYJCXFiNMSUGSQszrH1QBW/vEHheRfPjkQPDZlDw
         8OCwenVF0YU6bn3GImzUbbI6z1CRgaq2tfUUC7i6PO/KFiK0X+0PQLLtq9p0zga+A6oK
         veAaV5W1hBLysg5mKuV+Rq4P2QBfQnMRST2lmffweqR7L3Ze/pW8d6M0MVJPgMuUL6TZ
         lLYw==
X-Forwarded-Encrypted: i=1; AHgh+RrU1FOTrkWAh+R4QFvML33xcrhh43k7l1aNRD3R+t13Crskx+ZHjxb/Xpb0SA8SHZ8zSwCD8Qs9j0/uhxis@vger.kernel.org
X-Gm-Message-State: AFuF++kq5ChSBQmdh0RTVJP/JJiHzycMoTg+A2E6QWbE1/l+vO5EXhJW
	igoqhiKqdu8TaRTBt42FprjY/wggD2mqmDhPYI7YXM0db2cCXLma8gJ7vFVZbeS+EjI1Czg0iTM
	hUBIL+H/mF7XuwpNmJ4QEM+IiRp8+5XwpRWopyER21gW5luuaKcxYvUz11zlNK+abe3r3
X-Gm-Gg: AR+sD13Zu+/vcj9ZMznUKETz6Iywl6xO6XyJleAcAneRqnbsnwvxlLJ+s83cbiyNGej
	kHeLkjHSKuQdSXIG8gYqD6yA2CvD2qRmS/CQq6Q/C17JxmiBvTU5cqOQB3tdyi5MkycGGRpUiw7
	zFw44PPvRlziLen93kHyztqkGIunJdMMEFSJKZu7ULeIGASCrKMDLlydATDtGV5cGQVeFm1xcLI
	lN4vMoieP7vk//oIp7zRrEUtISrls3+4/JYGGdbLSECfP3Rew/lkOgO82q2/buvpy76Z4+YxIbQ
	80H+l+FsQcvd7VIohfcT+ipj6xO+RIuEKby7DrZ1PgqYjlzjPUO2cD55wj0/5P7K7fnOc6atMJ0
	qHQ7wbgwhBocl4xhwK3I7pyAOOUyTVghPyyU=
X-Received: by 2002:a17:90b:3d85:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-395c3573af2mr41879348a91.11.1787549712011;
        Sun, 23 Aug 2026 22:35:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3d85:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-395c3573af2mr41879275a91.11.1787549711613;
        Sun, 23 Aug 2026 22:35:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327ff728ca7sm20166492eec.3.2026.08.23.22.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 22:35:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:04:59 +0530
Subject: [PATCH v3 1/2] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-shutdown-v3-1-81c14bb7a1af@oss.qualcomm.com>
References: <20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com>
In-Reply-To: <20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787549703; l=2654;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=i18DXA1UuvFFxlInAjMEmK2CjnCD979tKCem1E4xy6c=;
 b=IEzzy6r5Nd5xEiu6vni6gbGOnON3InhmtJy1xbHXNRmiOzPlbkPTCbb+WhTd6vAlhqzygWEps
 mNniI/E/eEiD0E76k2Ykcl+cgDcNux+szymd75ur5TnV26IeNikkCyE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: _NZnNB5_WJbYuDQDeFNkaYZBJslPyIGf
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8bd810 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yeOUdISH2rptVKx3L3YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NiBTYWx0ZWRfX6mrsBvVq9O5U
 AIR58B98R/x4/IykygLOtppOrwauSnE/cnO7mn/jvkVJR7AixVUeDrzkkntEVZUkw0PxyJnUp0L
 CnrW6ylHCBya3lnThsLomqjs2vrbmDWmVEQeWNnE/zDXF5M1CByQxcEtb/EAnz/f3WLVCzQio2x
 ZPqrfQ05QBrYXlX37GZ95/YSRbRvei43FTdAStOOZ3CLIA1U+M2CDOxuXlQ/Hvyg5cF7dm1mva9
 ZksmT+feA0ATNY2hG4dAIy5Eg+s2OGmti88hGt8E818AXk/ex5aGLwkhI50pJfvgi8i1L+Sy027
 WGz82glr8hAU3ZHZoy7GNhWFtT9FBthyHKqJmvtNONNW2rIklakzGeRJx0J8jCJktgui5elnRYJ
 t9P/LH5q6TSKBzkaKltp7nF+Tg4hJjv1lrkpPFS+i2eGZUj+RD8FF2HRi4ylr2MgEq2atPzox7m
 tKBCM7/9JHxaA6mkDRA==
X-Proofpoint-GUID: _NZnNB5_WJbYuDQDeFNkaYZBJslPyIGf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NiBTYWx0ZWRfX53spLb5sykyh
 /6xGSLEP913oqhzN3PyiMYfGZhBvnGWzBKxssdvdIRaFCmW6a9A7ppoyQZMpGoIu/5hpBTQSprL
 ygWw89qUgghcxn6mz5ObtF/dFXfrgmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240046

dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
to check whether every downstream endpoint can be put into D3cold before
bothering to move the link to L2. If no endpoint supports it, the
function returns early and leaves the link up.

Querying D3cold support during shutdown is actively harmful, not just
slow: pci_host_common_d3cold_possible() requires every active endpoint
to already be in PCI_D3hot, and returns false otherwise. If any endpoint
is still in D0 -- which is common, since endpoint drivers aren't
guaranteed to have suspended by the time the host's shutdown path runs
the check fails and dw_pcie_suspend_noirq() returns early without ever
moving the link to L2, leaving it up right up to the point where the
system cuts power/clocks to the controller.

Detect the shutdown/reboot case via system_state and skip straight to
forcing the link into L2, the same sequence used for the D3cold-capable
case.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 06722259d2e3..98cd9dd2c7d7 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
+#include <linux/kernel.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -1222,16 +1223,29 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	bool pme_capable = false;
+	bool shutdown = system_state == SYSTEM_HALT ||
+			system_state == SYSTEM_POWER_OFF ||
+			system_state == SYSTEM_RESTART;
+	bool d3cold, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
+	/*
+	 * During reboot/halt/poweroff the link is going away regardless, so
+	 * force L2 entry without checking whether endpoints have transitioned
+	 * to D3hot -- there's no point walking the bus to find out.
+	 */
+	if (shutdown)
+		goto d3cold;
+
+	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold)
 		return 0;
 
+d3cold:
 	if (pci->pp.ops->pme_turn_off) {
 		pci->pp.ops->pme_turn_off(&pci->pp);
 	} else {

-- 
2.34.1

