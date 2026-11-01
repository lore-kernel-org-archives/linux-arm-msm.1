Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520329;
	b=O9lQBywtGNsnWkN5r6+3GlCWlzqRBy6jl112rDt+fwS1E8c5rzhs4sXBd8W+NKQUp3ww
	 svbi1N7FrWoRpXDAFCHVu80GNaIMRzcYR3DuCVjhMeaOsfkRTMODewQbJP3/+MBz1Q1fT
	 AYmAekushTSgs+7sLsJx8KMZbEGkMv/cO+BSgYSZVbvdTWVuYjmE0SXGnKLlRseH1uHmR
	 +btE1A7CTQrkXSpGIjpYgwPRAv3oJ/UaP0BNOpEBB6Hsmj6ySfHWha4GFsNTY3flM8ZcO
	 0k0zNh3ZEJYuBnKy1IbISrmfZHelZx0T1hQ+BgC08C1567m1U4Fy4ClCs4e3PDlgdCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
	b=WdBAAbWsNmLBFLD4sl0oYo7zKPrM57IOoGO3P8olLdsDKSHvOnHuWI9QeUOe+HIh7Y0A
	 5Q6WyQT7yAWCO4GQfLEYX4adMBecEWOn05lfwRtxjb/+v4kMTlb2iuwRZ3szBn+FgKnsy
	 Oz2NQzNdK5n5m1b1lZtq30+41uVKlEYjLgzmGDUFSFn4wDtEmp3M0ttHEaWTy5cHI92CM
	 fFUuY9yJMDhkUfadmPK/uOvtlpajWjm4UTRATV0C0jInOnZLpHFWXgsvzXF7unvWOBkoz
	 r7EimT14FP6xWsAU13/oHdljOGMRqEnYf2g84hZg4Smw0I5AcDtcKTHgVL9aPuU0Xcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trx2vTWZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWV9Syrz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEE606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 08:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DEE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trx2vTWZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWV9Syrz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15KKpI4175077
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3K
	D9ASVyHw=; b=Trx2vTWZH3Uy/rjXBmkJTNLDiInUfe937W9mC+WXttI6kbl6GIN
	4lOA7gc2Itnc6f5Ao9r8tAxn9npwJU7/4VwKTjkQeuQlY7rip4Fc2uXdJ/mVMnJV
	MLlpSEKRJaA02ejyso3o7lZhlbb5+yDMUrszvPuJbvHILRCxAA6hJvoimQ4tdP1D
	TYzYBudjsnMZg4bXpitmc19nFzl0PAHHWfYfOt3vtdqKDVMZRNOwWOPGTKyuogr4
	DAx+Vq73O6yk2UJT6dj9t3d7I0hBhpVIHhGWXyGB9YaOQ1F5E2EJJ0AX/79D7jhX
	MyEtQYlH5Ua2EhEpgBsA39ei0AuMdZdLPQQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duax28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 08:04:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso10286496eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520293; x=1794125093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
        b=bWV9Syrzk7pt+JISPh7dl3luMSa6U//B7c2NvcBApFiknhiocfHdpFV7sLjQY+7Owy
         19AR+vRFDTJlEg84oFJ3JUKTlj2gSzw0iw1ltGqJDlRp3t8kFgN8YYJyhk8HFKF0WinU
         azuAETnkHnCesOCqbujp/wUuuNxlmZoYRGP9ylSO9jv7z4ocK93bNYVLfXg+YcDn+6w4
         ouJRfrBAUqm8h06XNvaljVc6DUsPPZloBXcWOz75ln4PCdDeNz7U5sreILj8OZR6HHyc
         jZsV6EpiGonaXxXox+H6UCOtsJfh1DHErWVNsUCOTNQHwkW/kCEkp/jDE7GyLWu9xzpf
         gPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520293; x=1794125093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
        b=mVywxxCKcLWLhaY6G6NN4YjYjktGnEdx7U4MV5zNfriq8m8HIxhdyco7kiHgUFg2Xn
         wXszoqCo8KQ78uMGOYn0Z/g7jHSo4lO8a42F8BsUjIgBgyGAGPnMjSYnt7+OSJ6KDEkT
         sgJWhjuFaACBhqiO9IB/lQRlTWYO6Hhbii0bn2+0lAwNRSok+HQyvV12q5m+0wt829kS
         nskgio4DToYE32e05puXPFcsF+M737sVOsrdg/ffNP01F/LBFB6atCeKn2fXAy51yTuS
         OvMG56sqFE3Z0F9f3klleBg1mOIzSurjwn2zOaT5YjzlbLQGRAzs0A2l8IKfCaN+aULC
         OPcg==
X-Forwarded-Encrypted: i=1; AKwUvBwdljHGTWg7QbNZNa4+m2fT6gmR1glO1pCIMfb2GbisnjQLGtozJSwX2fHscLB71LDUC4FcQILwsSK9Qd45@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZPbAFipCqXffT6D4qO4KWOjmXmFsu1IZPASz0OaydEM0medyv
	qeyYAvWs7VpdqEDaITy4KyvLeSt9RqXrE57Yjh/EKZAvZAPs1pX4gKK6F+ZQF+lz0DuFAKKuvxC
	10S7+3FEWYsDVW3IzW1cQZseunXVW2UALw72fE2tlvgYOPN2xReO0DyNfMLBu3gZg4iDx
X-Gm-Gg: AYBFou1smYzgAJBV8MG++LtUaxNpHgGPoLZTHfTXkDKSbdUuMTayuRKcHaQCsFke1/T
	zWT3iK0PgCOWx3QTmBlCBHeuVbh1sYHzWJK6LVTVH13852WPOALd219w4MnV3LuEASW1O7ovWdw
	OoUPp54x6+mqZOUkIxGSZZPb4lU5fZbbNsKvBMo7c/ueqTuNwZ8LvfHu6fTZi9++1tmTuBLhne2
	k4Qx2IugJaXsGoYz0rkkBnCAgz6Zi0Gu0prozL4xpqWD73MhtcLd0bWhVnCwRq3fJxYaxPP2cll
	xo4nfXPV+pZzkcdd2Wt2vGNFxNGhendTgJWLfHP2ulpm/eqS4rita/gFWepukgZhljX9JudrTii
	6T1qRdsRDA7ARQWEd8NkQqR50x9PXUbaIMp9m2ApKQ/w5K5buc0qSJ7PhOrqrLm8rmjLG1fVaH7
	RG/JiO/elKH3+4aC/wqjubDSilmaUwkBik
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15966775eec.22.1793520292998;
        Sun, 01 Nov 2026 01:04:52 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15966725eec.22.1793520292406;
        Sun, 01 Nov 2026 01:04:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: Add Ethernet support for Nord
Date: Sun,  1 Nov 2026 16:04:10 +0800
Message-ID: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae6f2a6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c5OIkBcGCNzrVHuk8D0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: y-GUNuZ6n0ZSN9krPghiDl3gRFoT2fwB
X-Proofpoint-GUID: y-GUNuZ6n0ZSN9krPghiDl3gRFoT2fwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXz4Ys4iotq2Sh
 Zuzy+GWHHisFhJs/kUbvgObEpDUuVxdhJG353h7+SVGQeQRuwmb+9ika9+OfDlh4qJEnHLHC6cl
 zXjVTPHGXHs+Fro1XkIdE0Wkb9oSfg6r5NgGmLMVM1YQdTEkNgmqh9KAHT7WADqdhYQlEE5mRNf
 pqQiaa5RSEaBOMZVjvkBeZFUQuS3POp0GCGehOHhdAKzCnHgb+B2QLS4gvOIyGopZa5PTswvc0S
 mclHICrZmOUs9huk0sTkKT5vOFpEKlNcOM6g479IJijd6N1DWStEZuFZve2ovo9bQGHDlKVXjRf
 vs6tC83ItihG5BRzVOzkaBZklAVjPyhEt6YVTNS/+8XXnZ8tjoMpPL5nNUWcCFDw3U8pIuqGQxB
 4I31EHdthZS1qO8uc7LUvKFJzAPdrAf1U3a11fdKbxmn0VUtYR35aZVRY6CC3zDPt7x26FSHobi
 x1VsxWJS7LW90UcATnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX6Rr3wP2uAXLA
 FOScQN1tLQCliQ00Czh4p0dKFIVpATeVK4fhTSrnrH5s08SYyOxS6TFoiqBTysmitnMXCMfipvw
 Ag7+TPkS4lE6GAARGw697o80WuNHEQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

Describe both 10-Gbps Ethernet controllers on Nord and enable them on the
RRD and Ride embedded boards.

The SoC description adds the two EMAC instances (qcom,nord-ethqos) and
their XPCS blocks, plus the SGMII/USXGMII SerDes PHYs they use. Each
controller gets its clocks, reset, power domain, interconnect paths,
SMMU stream IDs and DMA queue configuration.

Patch 2 enables both ports on Nord Ride in fixed-link USXGMII 10 Gbps mode,
for the onboard firmware-driven Ethernet switch. Patch 3 enables both ports
on Nord RRD, each connected over USXGMII to an Aquantia AQR113C PHY on the
controller's MDIO bus, with PHY interrupt and reset GPIOs.

Dependencies:
- [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
  https://lore.kernel.org/all/20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com/
- [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing
  https://lore.kernel.org/all/20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com/
- [PATCH 0/3] Nord ethernet followup
  https://lore.kernel.org/all/20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Mohd Ayaan Anwar (2):
  arm64: dts: qcom: nord: Add Ethernet support
  arm64: dts: qcom: nord-ride-embedded: Enable Ethernet

Zhangfei Gao (1):
  arm64: dts: qcom: nord-rrd: Enable Ethernet

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 124 ++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      |  44 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  88 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 282 ++++++++++++++++++
 4 files changed, 538 insertions(+)

-- 
2.43.0

