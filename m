Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BC3DE43F
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610409; cv=none; b=LM1d71dNr61t5P4pNhaEwQIn2s9ewKpX3M873ttcX8i6CGirlPXmd0uA+bLXgOv58FNjO6yhUAHg1OXFcJD4Wt2ZL8RXYMkIm3cJPjK1srrZm/SZVcudb6MNXBRENMIewJezIEPeHaKpBZzVivBsnkqsgXQ3Uh8lOMqivPRaZA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610409; c=relaxed/simple;
	bh=x0/MmR3U1Qe039ShKl3bSrAj4sEJ+mB5eel+HMTpPok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MWBkZn8gUIdIWjofIfHiMkg3dj/bi+o9DCL/R3aBgzWqcB2NwFT4FJ+1TEYo3OZS3BPHeA6kg+sPntCvsWWp7S3iInTLjWC3mbCg+xvc6IxKRNfnSTHTm7qb/Ux+V7pZW//+DQEBjZZMr4sR/F6PCI8q+jvE7KLInMUm5bXFkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paLoUpNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haFYflKQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paLoUpNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haFYflKQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A4dpMf2402565
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vMX5mTiEmVP
	Eae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=; b=paLoUpNMQX48VlNL4a25zTFLzzQ
	yi6FQkYcsAqA+tFnCW2dzqzxgB80Hop9AafeaB4Pc5JzeERUtkbrQWm2Ri/gcBXZ
	vvMDEjKfXwRbkd8ssSOi5cqZYeMif2dhXoBq85s+HFcuHdvcO2vnBPp9lqCMQzti
	12JtatxoXJN2i30C2KibIMmRThToTSo8avx9uFvFdeXPyT8tr0bk90DW0yYSh+/a
	88GFs7MsWMw52KEb1hypp0Myu7NYFV7YGtgecptGt85mKrrODkz8sWiypxBGfqeV
	Qf4mrm97hv1A0QDA8hc/9Guw/+s2T2OCdnD1ZLlvyy8WHv2ZFHSJaSjDdZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjg3e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:33:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88732460a55so292994b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 22:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610406; x=1792215206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=haFYflKQGivc9vb85l25MfffqbyckW3KWpJCzY9RVrqp4Ac9y1HW6lFKISGWauBP07
         Xw+zz10ZQHcQjdSqmTCWFDjoz00M9vyXOseqWVpZmatbzUPkNVw5xSX+o4P9PgngTUuM
         bdVLVP2suBoDV8ZJ5SXJhyrgc8P1/6ONdOrw44gTrMKPKgCPtQpFlWnMDNMVFrU9uYMw
         lgQP/GSyjPdbEJj3NQ9WCMP9d+ItCOzUuUzq19ewoSBrL7uM7N9JgCMYEFIDdsClmlNe
         WNc9Iz+XLWOBaCeaX7TQAPBea70sMsh1wUvMyvchH9s+Skv8AxBu1J4DxAsO37i9L4q6
         3KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610406; x=1792215206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=pBPtUICms2Tafo29MgyZWrjFuN7cdwJmTDJ3dhhkJiR9yLK57onN45UoY4tiLku3Vp
         ubh6loqPDez8NvOi/49wMZv/kx4K3f1JmTVnJyMZ0/t0xp2ecw8jNa/li76Y3XsSynnt
         iRWsEbyQDHPW52B+c410KeYdbdNyLgr+BwjwWrwG/DyQTAl+ZoSp6q/bUkl9+GERvksf
         uraRvPFiZkX/JhhapTXMeRsZA7PK+/6oQJlBQZHip4J7a13RAG1LJp0dHyi2wtZQChEH
         SLOduzRB66g7QEt83g7oCfWua7KgwXz8mPVSRVdX+iAe5QC4Fc23kavjwuNQlhTUbQh7
         MqdA==
X-Forwarded-Encrypted: i=1; AKwUvBy0D0DHqHh0xPz3wfNWKAZHNbduOc/hdLzzP8qVL4hU1yazxcL7RbOG8WCtX0pI9vIUkP+9kt6V3M6Q/EEh@vger.kernel.org
X-Gm-Message-State: AFq9FYIMaYJy+Uiq2U+9BO2ljKTvvo2JjpISlrjdhb4pxExv0/dYnJCU
	+jrwQCln+KomzTkx9uh1Anxhh/hco/N7DEaV8qSVSthKom0zQGeh5RzNZb/YRF2deAcLB8YBmGD
	cBiN7zXy4PMUwOv3kktJIvCqJ9cYoaTRE3eLxu9/G0cHVFWEF8YGslYVqKHoelsE1UnQ6
X-Gm-Gg: AYBFou1X1Opo0OK3yRfiU6RiBNvIzmjm26kJbbLLmF06Q3Uh/9WGMrfuxZyB/qU+4pH
	Df6np7elzlP+YA+qQ0GI6Hr7d8fxGGxgGapQ6bpt1RKILorB/R4Z1c3rbhebGVSBWA4Z8DCpZJ7
	XKQUy5n37r6odQCpw4H+WILq8+j7bgImIuPuaUCRb8MQhEKwBO4XQ7TEoohSxiRGkjDBYOJGfSm
	SVzEObLuuZddzT8GCQkze6mFBJYiX81i6gO/ygst3r07K6EDtHpEs4KVlyp8nf6ehP8DKR+uYZf
	HNg+HcoWERtIg/zlHbnTM7/KQnijeCxuqo5QsYNg+3fNa9VN0FG3JPmOMVsqG3lbb+G7+FtzF6G
	glNuId5VQCxPSZZ2m4P43zZq3TR/fvF8=
X-Received: by 2002:a05:6a00:3006:b0:874:705d:f653 with SMTP id d2e1a72fcca58-897c6931e70mr3242251b3a.33.1791610406343;
        Fri, 09 Oct 2026 22:33:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3006:b0:874:705d:f653 with SMTP id d2e1a72fcca58-897c6931e70mr3242231b3a.33.1791610405915;
        Fri, 09 Oct 2026 22:33:25 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:25 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Sat, 10 Oct 2026 11:02:43 +0530
Message-Id: <20261010053246.2991984-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX37bSuy2Hw1QZ
 Yah8APVjcqbx73TzBwETuQzpjCv/0kCYSZJTW7n9DIRfkTLYzOwGuP50qtjKpyfZJCsxCXtiXAF
 WrXWJjOgWStPQyFQGsNKeT4H4DNxXtC2Fu/8XZ3nmge2B5fHDfAIdbqpKtDeZfp4Gjy+0O1ys1/
 HXKd2+XIypZ5QPFoiK4OGauF1H7t0CdbHf1aSlePkE045G1RYNBljZQXO3CFNY4FiHMHsHqx7BF
 /XqqXnlQnYKWz3P0evOSzNmjG7LXGU4+Pv0ZV8rEPzs4YsiC63G7rodApYuj+OOHanF1ar2veu0
 qcYIE3qP90lQxtLP1ox9AMYkK3x9UxWOkxxM3CtB9UbfN0H6TZxTYK0trC3wxJ/Ozj9wmyqFrVe
 KFv6/2Ww/r/tIZphNhJU7tmNXh7+8DbbSC4i8VPXVJSElFT3EUaI3zXn6qLt8yLHySbqguGdte4
 QzGF3oo8rBQU1ocQMMg==
X-Proofpoint-ORIG-GUID: K_cqflv44VO2pxHc08Yl0IZJWAopzkNm
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6ac9ce27 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: K_cqflv44VO2pxHc08Yl0IZJWAopzkNm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX3rWcv7cQH0BT
 QJBcQHIgufgoqiUs1fLavUSnXCrOqvhElTgcfGbV8GajwoDdRR1yfHZFT5v5yWP8jDWT1FYXeLC
 po/kHOImbqUimkvXIR7SjzWn6cc2P90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100021

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

