Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B554399F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809708; cv=none; b=CKF84KiS51VXXQ4Y91vUxE93/S+s4+Q44eemJDRKVeQlG5BI11EyCNITWx4shRqWp7IWFuQNAxYcwT114JdKgt+H02+jae5ElN8PX1d0CWPv4OMYXQhVxR+l6hULOBrt3q19e/u5X2sdzNkDjh2gQRkGLb8Fo9YhgHJkBweUWxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809708; c=relaxed/simple;
	bh=3DNvQ+5W11ysh7H8w0QPfVVTN+cFqTMCZ6Hi45mMF0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pa9lZIkC4CgiL7bgk8ZVct2NyfjH/SjJE6bHYSL0heO1mUExWgQRr0ggJ+gINhNaawV+F+TLAulmNpx0FlWCvEiJZKsV30JLo/zORsdI74FC8fu93566RWi7zSCc2bkGSKswzi1WnwPpabxXioeWjSeJU/HA5X9S7qGewcGg5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/8rPzM0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdFkI9MA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/8rPzM0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdFkI9MA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0WPq2252640
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V0ukRDCmPB7qomVNkf05fa
	fiLd6aVrYL79dV4P8GC9k=; b=i/8rPzM0l273tkfxF1GIuZg3zphwT61gCOw417
	WS80IosppiV6vThn+b0Ji2ji9Mg/GiCOziB6kh0mh8fk2SHRyvmfWLdIGlEbATHV
	D1h2n8rH8osA0qgu2cDxEFWOl+ddIe0Lkv+v9/ogRrydZZHug3A6V+E7TCuC+42l
	A/FxLt0NZLCsRPFEd5lJTfAoVU9LrSkmICeTmPtrKbY1w3Eb0VUZZO+1jVSXPlg7
	ldpWmevErPJtS8Fpnw1yK8pXAsaxaLAQYYVOMAdKCYXOtXyxnMTr/0icpLW+hP+g
	6oBnoeQI6PlV9rQ3wayPI3N9yKIDfDGV+efRyOoKM1a2k7Eg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7131w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:55:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc359d9easo321195185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791809705; x=1792414505; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V0ukRDCmPB7qomVNkf05fafiLd6aVrYL79dV4P8GC9k=;
        b=KdFkI9MAWFp1XK2+QFA+QspqLKKPAUkNgZBWUVEPxw+uA8ol+iHutwMmiczhRSjKOx
         7rwg1ORxLxpZY3An1taREAd5f4oibB5Lv8PMJMshB4agBrkXUEaSsFAR2YHByzACFqRT
         PJbXafRKeNX+RB0qrWlqm9iqX3OyYxeZ3nwrYMPQHe77WGEoHdVuDhKUxYtdh3C6s5Km
         Xy3sITAKsiEYRdmvgjKe7U4tOBa518KjtzMZSaVbDkjPhsgeT92zLy/GC2HbhT0wdvAv
         BmHfbU0PcitkWzeAEASIxuiz95oN03NCxYae+ISdpsI1M71oOOHybY3TTsnP4AaK12OT
         ZLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809705; x=1792414505;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V0ukRDCmPB7qomVNkf05fafiLd6aVrYL79dV4P8GC9k=;
        b=By2t1sdYUNgwkMXTqVrNNeXqsdddGFbrQH8AXJflvvdnkJjatN9IbX3vviyh/wnb2V
         elRQYTLrou5rNSQgogFJFoqoG7H+hT9lh9pVpqi3hovajYC7r3/Z3Usmzr8OeHB28Jio
         GRVi2kcbv/UVVLPN3nq6QVuvHgDoIisXdWDfjMueasmp4UGiauPz6kWLpAHP7AXMcIUo
         qegDmvq4mebMPInoElDqoIqxAIoP3Yj/NjIjTz/i+4rOGEFJhcCa3Ze0mLuor6YLARBj
         Cz3d0OEsNsrDIEE4tlcNl/SeaLROQGvvjOm5C+gUZwd4ROsQ0aKqrVHBVx8AaRcSUHxj
         MMZw==
X-Forwarded-Encrypted: i=1; AKwUvBypZMiX7tpSN+3Oc9810/jQWHhYEzLIbTPc+XipOm9o7t3GzI+ZxvnH0c4zOJEtqmPuXkRVXwi8AddMNMwI@vger.kernel.org
X-Gm-Message-State: AFq9FYLG7Bf1pqnD83ID98f2jx1B/49LjaJjeu0kYKkWzdOANN/rNyP8
	6mX7G2WH8XHTuto0eBsYtD78pMAFdymKCz3EXaqOwayUE5gD5Im1/SBhNhM2i/eNV/3nB7/9BU/
	Ue58+4YUhhUZpl9LmQ8mRskie6Ec8Dt/0Sm77T050ypAIh5UBqojXnI1yq67ZZ2M7XLD7
X-Gm-Gg: AYBFou1giee+4FK6eDrdU+eBlcCIfUMrtlGfir9fnELRrnDvi4uz5DKtDQdHKGNjcBF
	iy9G1QBnP4sWWozOd4HbPMdAoAuGG0LqGFZ3V5ZgFajs667tkdeBS3Nunxlr0a0p1rL4BrO0T85
	+EvnRi1+a5kyFQtNxlFlNfApsr0wPjv/DDSJsCqgxUpMTiGSwCWraQgp1tY9sBXNznPeYixyvfF
	d4DVo5kZ6Iq5n9CSDAD7dsLXV/2yZ+wo3C4grVOLcMHw8nH4Z1a0s6p/k29F/ipWEC+STbdKAUo
	kjjt5YAGCVD58oIijCuDCFLTqvBzvUxApQI6/q0xvkei8G773ro4F9XzLv+3KVTiYgJVM9QVsc9
	aJgwCUq/noVa8RnTTnsiQoVHr6nNvZwxAZtKnPhjqE5KO/Lb4H4n8Lu9T2hgwtTJLSt0ZX8nmWy
	loO1rOo7xJHzIWvlKVmSowN+NZIzNjev0tBVN5lyqXsmwI4s1SxRU=
X-Received: by 2002:a05:620a:450a:b0:93c:b10:7243 with SMTP id af79cd13be357-93ebd0cbfe0mr1629045785a.5.1791809705127;
        Mon, 12 Oct 2026 05:55:05 -0700 (PDT)
X-Received: by 2002:a05:620a:450a:b0:93c:b10:7243 with SMTP id af79cd13be357-93ebd0cbfe0mr1629042485a.5.1791809704665;
        Mon, 12 Oct 2026 05:55:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acc936sm19187442f8f.44.2026.10.12.05.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:55:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:54:56 +0200
Subject: [PATCH] i2c: qcom-cci: Fix HALT_ACK reset request being dropped
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-cci-fixes-v1-1-8cd4eb1fc5f9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKDYzGoC/x3KMQqAMAxA0auUzAbaiA5eRRxCTTVLlRZEKL27w
 fHxf4MqRaXC4hoUebTqlQ1hcBBPzoeg7mYgT3PwgTBGxaSvVOTEXiYamTiC/XeRP9i+br1/F5y
 BaVsAAAA=
X-Change-ID: 20261012-cci-fixes-afa0e523a2ac
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX3/g7t/AJXMKD
 8io9CxVRoQZr/MUdZnHyFiZ+KbF3HboJtQ2o0UHmcVDuIKJEkqVFs2giFtfIpYThsaQ/6KOP39J
 sc9/QeFIqmf30O8Sbx1vdFdQZ8GUZO8=
X-Proofpoint-GUID: iyC5ZSSYetb0KkZDjPl9M_cvwlKrm_W7
X-Proofpoint-ORIG-GUID: iyC5ZSSYetb0KkZDjPl9M_cvwlKrm_W7
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accd8a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fiHgs4EJ_qdzu2AaPLEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX03wasQb5d8kP
 tvyxs2zfqdZZ5gLvdpp3e6THxbGEuVGXGvvv2pUrkClcSDkRp2gCut9yjkCX1sZ6AVO+dmBWgHU
 5mMZR1XAZVOU76NJofX1/zhuNuJwKhJt26Xzyy0QntNBhxEA59J35Dhz/G6VUPpioPaVmWhDlcV
 BuXsSeTa/MvbD1+gGdT2PrYecXR9HGXyyEgTkOfKPLGYfIqfbknRSVwiUewY8jTCOKK4qRcdmvF
 fND9HYSESVScoSbQa/ARR51TeKkust+bxJuRwIius47A7ZiN6nMlUCs8Mb+/gABCAOtGF8TERfM
 HJr4pyH3mQnOXHy2oZblxwSdOPZzYCNBnk+pD+KIGz+GEEczqrahPwMGtf13l2rLPCyixuoJ6WK
 7sIO5/I3iqcmfLxSfWc6oER4q8YeWlwTqIC16XlvRg/jnbEEfCPCp+wos4xenEsYeuVnUYZp8bJ
 Aas6TEYMHYcL2LzpuSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120051

A HALT_ACK interrupt indicates that the corresponding I2C master has
entered the halted state and must be reset before further operation.

The M0 and M1 HALT_ACK status bits may be asserted simultaneously in a
single interrupt. However, the interrupt handler currently overwrites
the reset mask when processing each HALT_ACK condition, causing the
first reset request to be lost if both events are reported together.

Accumulate reset requests instead of overwriting them so that both
masters are properly reset when M0 and M1 HALT_ACK events occur in the
same interrupt.

Fixes: e517526195de4 ("i2c: Add Qualcomm CCI I2C driver")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 873e901a23d7a2874af5c1e738167247adff1910..bd70c6bae5dc685435bf2ad031cf7a11ec60ab4f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -164,12 +164,12 @@ static irqreturn_t cci_isr(int irq, void *dev)
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
-		reset = CCI_RESET_CMD_M0_MASK;
+		reset |= CCI_RESET_CMD_M0_MASK;
 		ret = IRQ_HANDLED;
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
-		reset = CCI_RESET_CMD_M1_MASK;
+		reset |= CCI_RESET_CMD_M1_MASK;
 		ret = IRQ_HANDLED;
 	}
 

---
base-commit: ae8364085574203e7f4ea961921a1c7493bcb6de
change-id: 20261012-cci-fixes-afa0e523a2ac

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

