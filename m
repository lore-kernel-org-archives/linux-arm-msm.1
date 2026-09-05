Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA531715F
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 00:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569352; cv=none; b=t0x8FyoYn7fjMoMflkVPCMit/jhF8HqUUgfDYqSV9OulwTLNUtBfkcUpjWjfYW8jtvncnNQbyybj5NGGMKSNNCFmDdXAZXufsfbCURfcRAdxg8GDscb9N9FltjXwf3vX0vVl3iuWFC9D/fBNfPJONq0c798CK9yni0FhHED2CgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569352; c=relaxed/simple;
	bh=Q/hcehAe1T3B2LPGiG5zYS730GO0II5dK3ygD4/Fn28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2Y4A5QoFOlbJTlOUG/AwwTgMMA8FAatiRIHc5+VvvKMZ1KTwiOZvlZ3HikNPOKCbJL2pYGbAi7QuucEGhM2nlrU/ZuZsubO0j+KBbiBKy0XTkg0yC2I656rSH1zI/CqMEFAxKJMOXf37RXHLaNj2mjXIEET7/xaAZwvmEHt0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogHIVktQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ed9tgJ/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogHIVktQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ed9tgJ/F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kb2EQ3939648
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 00:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9v/56p6HJOZu6muIuJLlRunOTV4icdJBQiBGkkZcGg=; b=ogHIVktQ6kUZ08X6
	oK0sS0xRkqtZO3zaG+u7/hEmA9NV1Av9GxHfRxJxRqcwvfHC5KPoJGdXkNb05BGz
	RkY0K6cRACbZ9zHE5bGL5B8rD7/kXGh1BHGw1ULR2ZhqTemyuNmZovTuX/sP0Ma/
	exQwe4v02+YduJ7vryRNs3TJlkdZ9WGhK7z2Xk4BnkubUq2QV/X7exZK151zJyVG
	mj/YM0MgLwURkwM2IQS/BxbtMHS1X32rJwFefRjncy6uv3M7CR52h2yBXawYCbtk
	exEK/K/73KEH/iG4CSERKhjJH31YjfMO/xSwIvw+B8wtwCtovxL1S0oNgAmbVPpR
	j04/wg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg010jeby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 00:49:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6df0a1e18so33951335ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788569348; x=1789174148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9v/56p6HJOZu6muIuJLlRunOTV4icdJBQiBGkkZcGg=;
        b=ed9tgJ/FEN8sGZI781GAV3inCGmDHwfSM3alvUA03VFGwyXg0CMsUn2ozKLANfIVum
         k/JM83JHPEuXgN/62ANGh/jMUkyx+Y9Ah8ukziQ/iQu2QgBJCcevLh8FzKRy91iW2wi2
         xsQ0sY5VOaLJXggxiaNCsj9pDeYp01yOx03EAVP3d8Hv+k7mDTEYD+QjMbLrMo14843m
         UI0hpwkA6ugYGFJp6q4vv1hA0AcZ7H5Xjeslk/4648aV5Oyn2D0L2mcSD6jNQA3ykTv3
         UEkZ96noDjO4m+NEWu9ynzjAy1hXaCpq4F0sHhM6ye/ZcE1t+l+NU0bxSPEuPonI/ctC
         a1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569348; x=1789174148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9v/56p6HJOZu6muIuJLlRunOTV4icdJBQiBGkkZcGg=;
        b=Hg210WW1E/LMX4gGmYAv7aFqmgXSwr52UWhHlY7AV0YqaXly4atSEsdWa5ufmmNBoD
         SiwNakCB7/VcsvORV4B4ZHWK27hvg7M8uBuy/tvY0V5cjNWONGbdPF/IGHCMDnfcEn2r
         IFpTs/vrGt2PYYWCDC22uhnp+VmtUJbarEazAntDQMn47MR2AaKO6uow5ViN6S9TitCm
         sDtJ+5MzREc84lYNdiZ7bt6MsdDngdiCiKLrQnxsm3r7ZLHGQ8560YWzagLTdMQ2Dde0
         chxvHH1D3LAIJB4flyoP0k4Qo2ETvEVL5BBPSYe9NIIuBp/LcPXskakwhYCGNR/q5r8g
         eQ0A==
X-Forwarded-Encrypted: i=1; AKwUvBwRR+nTv6BNUda+db73G1YzJn6Goa9cbHek9IYCuYwzXz5ZbS4wWZcDfyLca8WeyoUSIhXbgoJ15DLGbrH8@vger.kernel.org
X-Gm-Message-State: AFuF++lgSznK12ofBuICOw5tuYtFhZUOG65NnZUX3chDzB1IqhKKoyZe
	7+KarK/is/2MA5+8GrBL6qncgnPGbq3/l3ol73Z3BF3BC7lCtnKWFCl6C09/u3S4Wz5jRatMsYG
	uTRCYG9APgFH+CGJpeKp2eZpgcbEsalhlompKueGhaqY12seCqZ9Eh9r5NzG44d+dhDHJ
X-Gm-Gg: AYBFou2uVMgmXRoJmIf5WLxI+cyOaB2DVZNJKTjdIv93PdXzZDE9jJ+ODXeEM4hFdZt
	s5KZvV/iSf784hOM/t4donvQawAzY+j5zrMpcMd3/XyRdq94LChlvOYx/bO5US8N2TsRN3Nt+ng
	UDkTyq7DEGZDO4DhtafPEYXh4YvDZokyvL7L0jJcczjyTvbIchv0PVFMTYFqvGyxScDbyTuW55+
	urwe4pWnWmRGwdOWRANVvkiZio4qLS0I74F1/Fu/4ZWz5uoO42dYmHnIPcWG6vfWqni02nZAG6O
	QxhCZfcGS0lSGrna81s8JKzYuiI5xZaWQaQO7i2HN0/Gq3NtBsA1a0pwfwcapW9elN/4D/EprZ4
	9aTF47Hq07rAyErV/a+Ej7KVtKD7F367zTu4=
X-Received: by 2002:a05:6a21:3382:b0:3d0:a555:c823 with SMTP id adf61e73a8af0-3da39feab06mr15571107637.14.1788569348186;
        Fri, 04 Sep 2026 17:49:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:3382:b0:3d0:a555:c823 with SMTP id adf61e73a8af0-3da39feab06mr15571067637.14.1788569347807;
        Fri, 04 Sep 2026 17:49:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm10843907c88.15.2026.09.04.17.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:49:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 06:18:49 +0530
Subject: [PATCH v5 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788569335; l=2715;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Q/hcehAe1T3B2LPGiG5zYS730GO0II5dK3ygD4/Fn28=;
 b=xw6hvdlwQIOeHMGQ0aR+jQB4XQy5tEtnGc9orZJBPpaqf8ZjKwi7G0ddFs2bD5ZbE+gjzB/pt
 4Jco2f/VBt4BJAPXAnc56ZTa+SvToe9texAys8jT4C3p92WJ/lP6BzX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfXxbEjI6/3OmLz
 KXh8/lgidvZsZFN/gNVsaoBdwbSbIZq8J3+DdqjdG8ZQBnNwAGJu4abpXhvaDLeFw9z70HC6ovT
 YCGWX8tJEZsfdp7dIl0lAbk6+NZZ86Q029JhAv9av2Ms5Ruxzw3X6pRjD5pVkMS0Xv+lynx2f/1
 v5e9GVl6XRsVs3Z5GLqH6vi7VVx74406WHRMyTu3k1nxLjHoWxle9Jnfu0SrTaUkqbRHW+WgqIo
 nihjLOt23bqffOHykZ3Knp2/Zd8IwxLBehcXvdIdCEAywKsWQJVg2Vh8zEyq6Nc2KMiBV4DB8Sy
 1Q0N/oa11zL396gooUhXgSox/3VVtbm6XEfLrbn2/99DRJ61Dj+8Ayr3niOe2bhzOuwtv56Fmsm
 eWAlQWd+2aXdNBUEkU9f6/om3WqFy+Uga3+OM6gbtPayWBz2Buw5na1MXq1ixgQz9i6HTD8nZSK
 Gjkk6rBMw1gn/I/Godg==
X-Authority-Analysis: v=2.4 cv=YNavDxGx c=1 sm=1 tr=0 ts=6a9b6704 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yeOUdISH2rptVKx3L3YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AfWxF5I9J8rZ5zWeYEtfhZykmgZQCA3I
X-Proofpoint-GUID: AfWxF5I9J8rZ5zWeYEtfhZykmgZQCA3I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfX97XrTHQCFO5K
 lya1WbZT3o26uObALvtBiMHUzJrxZ+CFFjVjdRUcr47la9963ZcvcGdJE4NlTbtUBafl9ecPRsE
 SfhG04A93Y558SPDL8okb4bl0vyX8/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050004

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

Add a "force_d3cold" flag to struct dw_pcie_rp that callers set
explicitly to force this behavior, rather than having
dw_pcie_suspend_noirq() infer the shutdown/reboot case itself from
system_state. Still call pci_host_common_d3cold_possible()
unconditionally, since it's also how "pme_capable" gets set, but ignore
its return value when force_d3cold is set and force L2 entry regardless.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index f5a38e6fd8d7..a8a3861c2956 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1224,14 +1224,15 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	bool pme_capable = false;
+	bool d3cold, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
+	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold && !pci->pp.force_d3cold)
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index a53ac27cd244..8becf4e62703 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -471,6 +471,7 @@ struct dw_pcie_rp {
 	bool			native_ecam;
 	bool                    skip_l23_ready;
 	bool			skip_pwrctrl_off;
+	bool			force_d3cold;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1

