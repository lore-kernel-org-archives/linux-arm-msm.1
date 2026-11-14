Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663213;
	b=09qIb9rtyg3KmpNZ2AkTavG+o3c2bl2act6LTFOItLFFCztOeo47g+cgi6dckBlgy0ah
	 j51Hb7Xz261vkQZ6DJVkGOgKPcwNWOnwUCyS7f9kmZayak/T0fV7WB796YVtCsD4NXqMF
	 1ZBhw9TWDxt2LDW9SYf2Q2E0xsWDBvnVAOZ3GruDIjaWi3MNR8fGTfKPnbL32pKQ+fSQk
	 2X4v3UTGo/KAkZLK+kCnnpvITxrE7Kv/8GwCibTPAgDxxQgbE/xM6rNe2VhchcEBkOUFK
	 Xed1nDz7mu0pgeZTQiTAm16+D21pWnMtTYguoERmecS6P0kiiWypgqciyhicsPY6p3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
	b=O3qZJpyTu48/fcBPDs/TmuIKHOPGD2TIfq3KBlvVOSJ/xUlJ0/RgJZxKa2lvCAOhiT1A
	 k5/UwCRuiETf9pELZiARQrdVN0NCNy++DpaAzxF/EH/0RQys23mWmp5Agt1cH7Z9T3Tj1
	 kPVNdGC6Iw6Nhqol9qw0klsXQJxkr2lflhW6Bs4lnAvR8gZIveHXlSG4DjkMAExw1YftF
	 JSY2z2of8ucLGpwZJ2+kc/nrZqcfCxrDA0/ao1O1cMCqmFZ3BJaSCdPH1ObhpKEKMUg44
	 ljpI68jBbZj87Qmpa0DkVyKtjFNemyqeSin6O5NpxxjFnbqoZ5l+LAyjzC422XPvwmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=El4lRT80;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2xEWrJf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808C606A331
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1808C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=El4lRT80;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2xEWrJf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w80T3716027
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA
	/Y0oEdxM=; b=El4lRT8095Mo5J3La78QG4E3nlPd0YUTMqCKJRdbXljA459Op83
	2U2sQom7Z8g7rFDrVK6rErqzfIpGf8HLVxyaGkqeGOLJMJNov9JPmSIpdV1N2HFK
	INypKZWsWao5G+2zRyVseJeIcSlq9Xelr1ptkY1m80YHxN1qupLsNvLxeXj5GX4Q
	N/zIgMvrlPPntK72Gc15Dod+z7o4g+U4TOiC+c0R4DAsi5RTpaLLrXSZzTOY4kmW
	yJvP17tlScrdccxYWwv6qrEqn8z0xc2zgZ2CEe+ko4I7lca2QZg8CQA9nYZKMiSZ
	4CiiqTee2acs23lBBLunLIJyqciUC9KXGWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20u91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae62796dso17725095ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 05:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663211; x=1795268011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
        b=T2xEWrJfOyCZd2gFHE9W/S6aXLnCiG62Av+8WNyJJRgdI1a/BOP+XTU4QOeMv6j8AW
         1I33cNnv/mNQeQUG0Oi2qIexRqKSQ2Xh7CjxZwQHO9lHYBhgp0x2pvazQ8S5d1rAUT/J
         qxFWhBY0KXskWCg/9M7k9gJmwmo19ft2HBpVnz65apl9HSdmZ9tmrsOMpPnvKIMXZMuS
         P5OsMvRBhtjqPUWs0k2v7Io+RFigfq+OT61s+5OKG/3MhUWuCwPA39t+MPQQbXh4Hss2
         YjVdjfL14IXjLgELqsRaG1cwF25QtxfV13zwIv6ZsHKCtyeBsc1KBY3dDb0AxtSt4Gf3
         /k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663211; x=1795268011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
        b=lB+czhB637x8CWEMeDpX1e9j8ZjdjsYLij6N/cdAZtoq56DdN0UAUd3c8cEjeysjwc
         jgeSGKqVTXWfUxiMvh2trzVcbTPwhH/pca0L0RDiwtB3Ae4SH3h9f7GuRZsCexLVebUw
         DXBDyJk+5xrvc4g1QgsacqLtg+XZqKDd3/siGM3osU2MNip7NjfPnEC/10xG0DQnLkb7
         IYHtI9dd6/sUVJU08fq3dX8oTD1xp/vD4GXHw2Wx+FBIQ3JYz01HpizswXE6W9keraEf
         2T5OgDnhkjxQ1h+ed1U412IWJoh3AIBa2qF46kkog66r5CLn6KwCEY5R4UAS5kL8ne7O
         H01g==
X-Forwarded-Encrypted: i=1; AL+hErHAcIYXLW1vZYN4KfKUoLSFhww8pp3//2KgJxEQH6+uo+wo3RoK+cOa9hBV4NQT50Y1pTCT0NFh0CLMJsnD@vger.kernel.org
X-Gm-Message-State: APuU4Z/KU8Z5ryNmQthCLMXQJdjrLwHavff6lxHdcI8KUYBuMb3umzOn
	5XU/wX+NRKxo06/4261+8dVLxRj3pHWe6rYbxbUmr+VIQ5pBkH7FUgO4fFbM5a1DfGrhTUorplU
	TzX0vCmjt0hZKN8yoS904B7lqHZPehFUKiym71g74iGO9w4cmkP866ePeOkmcWJ55Kj8/im/MSX
	IqBLI=
X-Gm-Gg: AYBFou16PO3pLkhSgF8GS2ibPHW2Qp1uPfT5D5ZjM8e1jqWY2Kqph9tMmgpX5gyFsCD
	zEPbbFLuXH8wlDm2JfGPuBM3C8HzgGgYDBf0IM3sBF6/uy+DZyoK5HQCErxXK3ZQbgVoFrU+3Er
	fBUmaAGph1D9gZXEHvMFYMSjswt9F2obIcFEqF32k/4dxyYQCI9hGG3ESpaWK/v0ukgQn2tJAP2
	4OCW0a75eE3vuYCYZB0yb01Sm0cEVectdBcnpiNMdpnyUg/sguRUAQVe+appn7WwUdT0k0vbzIl
	DW6gSqOn8Ndtb/mYkkmZ3yDt7dyrkH0TB8nUA5hLu+/sauPyZbNraSvy9NT//kE/QjqMhpg13Zw
	MBkbv9Ri6z/7JEexU/6DDz2ZtFOBSbBKTAWy6eowGGygQd2nvBYZvziyg2GVK+ucN2EmmBFfW1x
	6XVrnEB8zWULDfHcUfZ/dZReJL9/7dKFaaSWzx
X-Received: by 2002:a17:902:d4c2:b0:2ed:ff4a:6d07 with SMTP id d9443c01a7336-2ee0de075cfmr50771095ad.70.1794663210869;
        Sat, 14 Nov 2026 05:33:30 -0800 (PST)
X-Received: by 2002:a17:902:d4c2:b0:2ed:ff4a:6d07 with SMTP id d9443c01a7336-2ee0de075cfmr50770825ad.70.1794663210383;
        Sat, 14 Nov 2026 05:33:30 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:29 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: socinfo: Fix SA8797P and add IQ10800MD SoC IDs
Date: Sat, 14 Nov 2026 21:33:00 +0800
Message-ID: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Pu7dfRWJ-v4iv96Vg3gIh7fIidToze97
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8632b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=i9xxBTrTDdKVDmfy5nMA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX4l9PT4ncMWcc
 wHtxd+RyyuwAfMYXZWQCkeEOa5QgVu8V3q7p7Tsrhv50gr+yRbhwPnGU4WdZt0LDcGmcQDWT0EG
 LgRZOGPP1HASy98AdXNoKOScEXVRiTtS1OqiYM/maWeFdZDt5HMrWc20WRDcUXtiq8kAHVu0nyJ
 6QOpyigV+KWv4umaSRADsSD1xEHqH+PNNTKDNBgB5uI7Y6b5eRdV/wjZN/ka325xN0g7Gw8zkQz
 4Hl+/JWCGmvyNgO/IjlQZF7NjXVkL3XD4YQTKQS30uEU8HpuFmKdTsRJgQ02C38irp8/2v3F3C4
 G4724XW9MOc4785VlB4oSyvS1/2V4dAP6cLk8oIEv8VSw1WwmRWJk0ktyFsVvIbKg4lZCDk8hxS
 6gXFmAYK2UUZGCDMvnxc6ZwhYYyu9fxKAw0erIpz8VycbTbpx9i0jNa2oyZ3J4yMmzHhE08fkep
 Gj8lKRGt2xvTMVe11tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX6X9l6aVboD0e
 qaELDpFYqnoNKnX/kKcuiUxAankspHONIS+a+nj/8jQroTzwMUAIfzM6DY00/miBl0a9hgtvCtV
 fznD3eBdaQGbGt0PPLAgW5Rje3EQJ4Y=
X-Proofpoint-GUID: Pu7dfRWJ-v4iv96Vg3gIh7fIidToze97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

The Qualcomm Nord (NordAU) SoC ships in several SKUs, each reporting
its own SoC ID through SMEM:

  - SA8797P    648  default chip info variant of the family
  - QAM8x97P   690  Snapdragon Ride modules (QAM8797P/QAM8397P)
  - IQ10800MD  798  Dragonwing Robotics module, e.g. on IQ10 RRD

SoC ID 690 was added as SA8797P, but that ID actually belongs to the
QAM8797P/QAM8397P modules, while SA8797P is 648. As a result, boards
with these modules report a misleading "SA8797P" as machine in
/sys/devices/soc0.

Patches 1-2 correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P
for 690. As 690 is shared by QAM8797P and QAM8397P, socinfo names it
"QAM8x97P" to cover both. Note this changes the value of an existing
dt-bindings define; the socinfo driver is its only in-tree user.

Patches 3-4 add SoC ID for IQ10800MD.

Shawn Guo (4):
  dt-bindings: arm: qcom,ids: Correct SoC ID for Nord SA8797P
  soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
  dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
  soc: qcom: socinfo: Add SoC ID for IQ10800MD

 drivers/soc/qcom/socinfo.c         | 4 +++-
 include/dt-bindings/arm/qcom,ids.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0

