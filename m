Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A60437124
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973392; cv=none; b=IL190GrkQjHaYMruAaYsLMOmgZQIEUbS6q6LgNXi/rjIatszxDd0P/vFBhZtSdDq7LVwoaTFMjH7SjvRotTuiIvmLUwN/R98Bgn53iG5aplgVmYDIXuNQ5TSuK1zLpu//+0drAzj1CeTg8tOhtuaI9sx+sFIsGs3AlrT0uw/ay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973392; c=relaxed/simple;
	bh=neTAHLrSHDfYA+Vu1uLDzSTqTnY3Hl+tLcVyjBYGvDc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aGAYOoeAWDesSEWZvw9NJe4JHY7iUy+IHv21GSBYY+PcjImG0PFuXgYOPhPonnk+bbRQ34Y9q8eAb08PT36aq+7S/i5YoS6qF3062I/2YXyVUTzcUogj/jrRdc5japJvAWtVPGP1PW2XCs4vVhUIyLr8aSlBRKc0bqPndY/2MRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7UjH0ql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7UjH0ql"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5rIC2008354
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZGeP0XSU+DQLJYsRAy1Uqc
	2JgIgXoQ9sifsfx2a0VrU=; b=f7UjH0qlDjcleH/amKF8Cj0IGWiFsU7pRye4Vk
	PcEZ5gfVkWsWRl9upoGrEE28EqGEk5xTAjKEY5elnTeAGgFTl2HtItlcx/G4+bzK
	Pejl3Km59eD5HXS67mToXukHZc/x3hZUMMGqhSLgwpd0/Amg8WPqPgyzAJ9WVCe2
	7T65V3dfQxtr42Yib+2ONQCy2amZhRMDn2MzdRTvWAAK7xCP+O7w/77LkLyl9Osy
	RuE0GG2B2Chg/EAja7NHo/WCnGSC3FibPcnK6KRsYhpmCAjn9vu8ejP9Yoeq0+uL
	jxS1IfNhsSCMnVZ85buXPpljTpSCf5KB43I5sSnFsmxUkHWA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h3ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HDTlbl000799;
	Mon, 17 Aug 2026 13:29:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g2h6jamdd-1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HDTl2j000796;
	Mon, 17 Aug 2026 13:29:47 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67HDTkmQ000795;
	Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH 0/4] power: reset: add NVMEM recorder provider for PSCRR
Date: Mon, 17 Aug 2026 18:59:40 +0530
Message-Id: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQMg2oC/yWMQQ6CMBBFr0JmbbFFW6gr72FYKB1wEm3LFAgJ4
 e42kr96P3lvg4RMmOBWbMC4UKLgM6hTAd376QcU5DJDJSsjG2lETB2ziBwWcsjiZfumv2pVS4W
 QpcjY0/oPPtqDGcc5d6fjPEr1RUmr88rKGqmNUCKUjN+In3tEP8wTB09r6fAM7b7/AIpjXr2nA
 AAA
X-Change-ID: 20260806-pscrr-provider-b9f8f451701e
To: kernel@oss.qualcomm.com
Cc: avaneesh.dwivedi@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 2XEg5SOkVGbLXnWuoun_vIpVQgz6a9Du
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX6ydyJIAyYqk9
 6jXOpnUe8xFOFZ9ai81V0gYhX4wqG69ZNhWJeL9bD4DenL3vopSp8RqqryYeSlfi4w5ra7aUXM0
 yrhXyPCWC8lK29qZIu/I8WYBnnZuBkk=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a830cce cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=r1BHivp58Tu9S8vXgyAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2XEg5SOkVGbLXnWuoun_vIpVQgz6a9Du
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX5Oh7p8tH21WX
 swifh//p0nj4mrxBIzR1glLyt0YQ67Uz0Eqia/OEhj128Es+8kkZ+JvAnHscHFbIvVt4RYnYQaH
 PPIytI6i1gDoR7C6wcNkV0uIFBDujs9DOjSG0Xi+URq4jqqbG8w2BsES/xfP/6FwQvIzgT1A33k
 NBBGCNJn5o9jiqOSVbQ8krPVM+kLOaARfxibMdedoQYzOLpbwxe6RkMALM33faNggk+cIZigj0b
 Q6fxvrYrtnCl/JzZFzGkWzSaSHKy4QCAaqSHKnaJzmi76Q09bW0TxH2kAIiIpZ4TGvxVTj7SirX
 TV9OgbVPkzex7z8bPjX/g8gZNRn+2vcXS+yA5IxKbac7j5aToXiAe7uJ6wHpT1UF505xBifod6X
 Ap+qCZcvKHPD+fBZ5qfr4druz8Z3JgoJAgG0N56mgWw6u8MvuM4MA0meqfq1wUNkGM0MOCiMcii
 lkYfGKOQKdpaV09bz0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170103

The PSCRR framework[1] currently does not provide a recorder provider
capable of persisting power state change reasons across power cycles.

This series extends the PSCRR framework[1] with support for an
NVMEM-cell recorder provider, integrating PSCRR-recorded power state
change reasons with the NVMEM subsystem.

The recorder writes the power state change reason into a small NVMEM cell
(e.g. a PMIC SDAM byte or RTC scratch register) before shutdown or reset,
so the cause survives a power cycle and is available via
/sys/kernel/pscrr/ on the next boot.

Only the NVMEM-cell provider is included here. The PMIC hardware-register
provider will be submitted as a separate series.

[1] https://lore.kernel.org/lkml/20260731095959.296056-1-o.rempel@pengutronix.de/

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
Faruque Ansari (4):
      dt-bindings: power: reset: add PSCRR NVMEM recorder binding
      power: reset: add PSCRR NVMEM recorder
      nvmem: provide consumer access to cell size metrics
      arm64: dts: qcom: lemans: add PSCRR NVMEM recorder node

 .../bindings/power/reset/pscrr-nvmem.yaml          |  62 +++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |   9 ++
 drivers/nvmem/core.c                               |  29 ++++
 drivers/power/reset/pscrr/Kconfig                  |  14 ++
 drivers/power/reset/pscrr/Makefile                 |   1 +
 drivers/power/reset/pscrr/pscrr-nvmem.c            | 155 +++++++++++++++++++++
 include/linux/nvmem-consumer.h                     |   7 +
 8 files changed, 278 insertions(+)
---
base-commit: be461b2185ea3ff6d9c92deedcee0a62a57e1332
change-id: 20260806-pscrr-provider-b9f8f451701e

Best regards,
--  
Faruque Ansari <faruque.ansari@oss.qualcomm.com>

