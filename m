Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C263769FE
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 05:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787376879; cv=none; b=Ef4QDEvJKmPlLZIKbrAaU2qtnYN8F60XZ+9l9+yo0ckfra9qWcI6T604qrkLk+tFZoRmhvFscW4bIXOr51izE7JbjE3SPnKd8LjJVh0rVWsVCxkLxHMRCSi0rIb+aJ3GrhNqW+9xP+KwApGUfhpYnlTVpohs5+XqxK6fmPwdr1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787376879; c=relaxed/simple;
	bh=i18DXA1UuvFFxlInAjMEmK2CjnCD979tKCem1E4xy6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2YkIobY0hJUq4Cr78ct/KaX4yOk/3PPecjGvsvRAnoCeiZGe3qLjbMXZPTXILBzVTGjJlNM8VViy45yJhttKKoC5vakxnAcypia+G+fLIDUe13P6MfC+urFHbS1SpxDxoYXGl3jMnoYjVUdUQkvxvtuCep7pYRUJIv1Ml4eDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkMwH/ca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZpOEFQL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkMwH/ca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZpOEFQL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M4g8kv4019648
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 05:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tsfm3B2VKYEmQm7+WBrIBL7ccJpws7BXCiuSJtGpd8g=; b=fkMwH/ca7/yPWKmI
	DYv6YQBqrAGLELgVYfkSzO/n5KPc59UR1PSCSsABtaMwrd6IYX2vpO2W/SmREsaC
	UuLypfU0UbjSImi/kS3Ohh+DuGVjcuemMSpZy39GmmKWH3ELaqn/Wzl9Me3h5qSM
	5ueuXyN9YX+TvjFJPXUqxx89clJbmK6HXXIsJZTeunqeVeFeleHf+qg8kqYaJkrb
	qN5HXfRx1HL4Hf4FEab3Ny0iR38vOitUWACaMFSm4NcgK1EK6RXPvgIXlkkwGBa0
	3LUVwH83sPb+I+IH7gIKO+cPxDcEdZJWrO7xKzDTP4hXw4vmEgLHcqFdXCGiAyAy
	65IH3g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcr477-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 05:34:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso3858727a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 22:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787376876; x=1787981676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsfm3B2VKYEmQm7+WBrIBL7ccJpws7BXCiuSJtGpd8g=;
        b=VZpOEFQL7uXigSsC6OFWQo7pbG6TQvVSwZrEB2Kff3PN855ml/aS6aBixOHXFTqKDo
         PzANhw7mh+hJeHrv8AtnJzsea2MOVOT1tdhZR6AcydBq/HPCS2rJvWZTmCB9uWiVGe6W
         lm8Nwqk5AIrwTwv2Qrx5t8Fnwo1jCSCrcSqATa+eHbkdKgb2s/Ewo40H4YcumDX+2rNB
         Pe0KeTbfMxi9zQjygDfFra0V6UB5bJ9FG5ZIj3NV2OR0HJZzpSAAzr52k3qzCLYu1F1t
         GR7ptNZcepce/aIprRN1L05LY+T4cAitstmrghZD1ZVDGzFGnRnXqRkaDNekuasPgFbd
         wfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787376876; x=1787981676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsfm3B2VKYEmQm7+WBrIBL7ccJpws7BXCiuSJtGpd8g=;
        b=cCawnQM9hQAZYpBxOAgOEqTYTgKGTHwL//bk5qMt4kWx5vbV9mMrcdFVPmZiM8wIwq
         4PaStZLdCuc2/Q5SLUEsXimTy0aDk7da58n+KuGfU1QoxwVRqxrqAmayYdhf3RLXjcaG
         whtfa1U01/WV+W2lzq6ebR0kf8u1uNNZ2A+eAaIsomXV9/oyT3EG6aon2HZd8TJ6tnhp
         cLSuuO6hXBodpKtM21Dhw2w/V5RokkjNiCk+eEK6tJCm40f0uVWZTzDN7fnJjdxTjXy3
         1X8f3SUCvw5Qy5ImcT2byG8DGD/zXGBYFBiBoCcWJ8ONlibQey3e09Gx7L6dx5osBiD+
         l9TA==
X-Forwarded-Encrypted: i=1; AHgh+RooFh2eLedaBwvf9z+KEzVTeYQBPWiStBYY+W2Is6rtf8mKvWU4s+V0tTw8cnbwDGNYyDb9Ie7bF8SFtciw@vger.kernel.org
X-Gm-Message-State: AFuF++kVuL/uhocQpCo7EHLtKO5qv1ZhsdGNSisxgLQeb/qnyfdKFFgO
	1YvdwYu38mx9+b5Ylh3Ek5bMCgcXfMOjQ/hfNSZqn4EVRtYsHGT91A0hnJ/whxWOmaW+Bv2CRco
	zcwE7h2UXnJjaiGz4w/wlLVEDg8I4vvT7FER+Hu0tMsky1eAK6EMQRnFzRnEimIxWZlQf
X-Gm-Gg: AR+sD11NxCzw4BFvT7O/IzAZEOkTXQaf6bO6l/a8alS8lCOUKdnbuZKz6HnWssYuaPS
	DTO7VTC1UEH9jTWYYciOoYckeGzircugReefZGIP5aSO8/3/v/27P2n2A3yTbuvx8H9iInFt+nC
	mHx4DgQlaBwqmjBcr3zN6T2rxcOskMK36QzqWbCtwTYaThxH16L0nFE9q0BIr4aKenfU/megSEG
	/I1+JzJOiwFzp+dvLtXmmC4cYCydGgQWe55AgCKzIhPUBbSaJ2SF6QVcHUiidYtyIZGqxSVi01G
	NcsE8tL5zqBehMMXMuGnQ1EkXwrcauKo9shf2G6f4SXzhhLVTyZkmKmoTqT3rw3s8rL67DxpBeD
	VofJU/ySrYemRXpb+HuZ4CBRevfrcngjsIek=
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr221217665ad.0.1787376876576;
        Fri, 21 Aug 2026 22:34:36 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr221217025ad.0.1787376876180;
        Fri, 21 Aug 2026 22:34:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923490bsm3533807eec.26.2026.08.21.22.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 22:34:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 11:04:17 +0530
Subject: [PATCH v2 1/2] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-shutdown-v2-1-520a68f1b4a5@oss.qualcomm.com>
References: <20260822-shutdown-v2-0-520a68f1b4a5@oss.qualcomm.com>
In-Reply-To: <20260822-shutdown-v2-0-520a68f1b4a5@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787376868; l=2654;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=i18DXA1UuvFFxlInAjMEmK2CjnCD979tKCem1E4xy6c=;
 b=DukzBw5g7ch9R3vzyvFkPEfgcNx8yv0tHvfS6U61JTIoRZarZ54n40eM31Auj2YIeyWMiRMzm
 wlMrulKUwSaBzM4ozoNUEaSUmdrYx+ey9aPt2qKmEELetG1lSLCXSWo
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: nTIRsdy2KyK7H4QVgfCTg4pNDpOOOUC4
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8934ed cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yeOUdISH2rptVKx3L3YA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: nTIRsdy2KyK7H4QVgfCTg4pNDpOOOUC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA0MSBTYWx0ZWRfX+wHzkxk8dJvg
 /aGYJ4P/5ORKh1GfXxBUZ00/yOKIafkiwLkE+3c4e4Kz9FsuWiBkbnMTVfeGTg7LQ7QIPc9kFXL
 YM8I7vkKdLfEzx4NaK63kycV0u6V8JrLCICASTTuQrvEPyR1e6QN/GNVHR8VqMf0xM/cno/zbJD
 j5hKKAkfrvoPhhOjDdbCpEXMK1r5e8MREbPhRea6NVdZJdbnT3p+aHidxCHhxWq3GR/NLu8q+sY
 nrpq6AR0HMYXQfIBTukn0M3/UOqq54L+NbVCCZiytFOCYsN6PkM1YP3agm1fhc0fp5dNKaeQyzf
 8R0On9DlzOM1gQ91EfEdfBl5DqV9vR/7G+CqRVMkyPfpO0GJhivWFPXlpPsuGQ+9Lx1Q9CtwZoJ
 1EybvT13lGVKplN83meztMQ5uC7JDJEgXvee8EXglWG8wODD7UnLDsdWCk6ieoZIKLU0xYhItIX
 ghOiANgmZDiPlA4kyvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA0MSBTYWx0ZWRfX6BfOmbHcYeLt
 anf/wAgZ28/qHwx0+A9mGKWqM28p2IhtCDXXuU6FF1EZ06MpLCCfKSvJBh5+M6E08jE8bBB+d36
 zEyMHUSsC0s7nvrHpowW0w/7kAdtajk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220041

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

