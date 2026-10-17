Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A013D79FB
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210661; cv=none; b=d1r9gKKiQL1Y8xGuyh96ihF0gnnbEOCmFrwZBc/02Ak4dpyvZjrb3b9jB64IBcLZbiyTgo70aQbWb1YZ7kQ2u4IKaerv2xbrRTonY1CZe7rjJGDwkxyHV+kKJ11a7w/hziVstJIwD9b+6heVoZwKWO4/4B7StyB3qHJzmOcmurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210661; c=relaxed/simple;
	bh=Zz8H7LWd8X7zK4/404T4PQqLh7JqrFJUhH4vjYg7WPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YbEZzBi7lSMACXlgGXNPzTSwISwzW7xvqZFwAjvoVWfQd7hNnC09B3YECOjBZOFlUISigRewotKZ2A8NSAJbOpOaUNQGD/enfL87FYofDXyCXR6ZDY9lAatOzsbO6+s0W2a63XAoKMXb1XCmQXGIqv2X4s0RuAf6GIsJ/UgRkJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjQbIuQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTQXbqHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjQbIuQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTQXbqHL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30xjo2625446
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5
	Vc88bYSc=; b=HjQbIuQmwXQHOpymfxOtwCVbLj+EHY7y++oS6fnAF5hQBZyfkZe
	v8gAWRcl6EXtDLxWbiEL0wv4wX9IR58OPqLVVpMG/GX8BQyL8JdaGar7LyEdM7eS
	A+PkS8wqlBneFKxARiJdThObsm/05yRlNS6U+Ps+kKGxXM6eabg3MrGSpCZIVFBn
	qNvXOn72oAjMDFPd4EHKEl1mc/pSs1av5rUUHVmqXe1WvKcLtP14r20IetCa4or6
	MVBit35MhYvOCfaKTxzS4JXe6PWyP7y90pRQUJ79JsqTXlhc8lGpQ+lqhWgCenB+
	esxXCCIaT6BTaUBnhzPoTfn1HHVnyI4eu/w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtcnx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so622688eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210656; x=1792815456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=hTQXbqHL2K9yyeSD9IPSgUxWmKYhV4eHRYafdiCOlKr5v5l7IDLdQ6g/tHbNS2NHrp
         ExQ1Z9bTbS/GLMM9qebYoMhCaUwek3FaqfioHnIcof3UgVLwZFYjTfaOOUEEFw69tb4v
         yC4yDCJd8Bqf8IHNXUm5DAzF307sT/vSm3W5VYyc8NwkOmYJQ/3Tfj07dTia4C+OOYjm
         euYg3WbwfzooQggaHmERCkzoukWDbyJFk7lLv0i06nSRTYNKCBBvjBATbz2qFJ5i+7iM
         9m7aP8L9pD6qXkyG60X/5Hj1lK7m1nmNRbn1zuOkkDjYNxlb0SrWsFm2iMc8KCHKU4xN
         uWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210656; x=1792815456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=nt3N6++8VNN7gNWtw3+d36oCSl+0BdMr454/r9/GJkv858hJ5S9ARoWhBSFYxfuN3d
         zA360igsReHevwy6S1oZ9GZeaINF0MSNG3vGoyTaD+FBa+Go39zik4fDIYSmrTt6BCpf
         2qAgPTAYQ8rKzL73nyx+QiEADg95GS3JemPlWNeKXFvT/iES+7u5ej+XlvEjtnthmliq
         PoXFDxW25xEp7ZR4c1IZJmBsHqNZoXbBArGrP0X94YkXQu2r/aYZjCNejNeseNWAkecU
         kjeI+T+dZw/p9Ihj0nkvncSeU/Jn6D/af89cQ8HQbcPKsKAQkioxYi19nCDjqTz0ao14
         GHKA==
X-Gm-Message-State: AFq9FYKi2kt+d/j6WgLAWzBi2N/bTu620A0JAH8r7wKcDXIe6OR9zdh+
	6oIiDpjdWXUQ9E6ZRn1mExiyqBL5E9DVlG0tF1vLFOo1DbuVIt5jsvVhevI1+6m6+47yUdiQl0u
	c4MXQkiYV+KvfrRNvJxfI0CtZ0CZga2JDA69HQwe+wHjJugibfPPFlrJcP9ZV8OeSboHc
X-Gm-Gg: AYBFou19ItFdSGiKstVq29wdHbBX107Ti5VKmRWh2pNFhtJHp8lTa4mbUyJbOP008Cq
	/oqkCU13AzhvJDwvKxAWqevP37y+iiClzkp4D1HBatewltXpPe7fGokizu7aXDXyispRNIZLEKC
	+9D5mwz3ZmUeXZg2zkvvZWNLaO0wbynLOsskZfrBQDdLjx7AUDWlE/VroLCtWddT982+Vqi/2Sw
	XD9F13/rGNlfjVARy6dnHLpj9T9dieURRpQhEeoO1Cf/5nHd1fOpKuVHj6CM/IAUuPQo5/BOJAs
	Xhmqxa+aMDSL7H1gRS1CCZOgC2ZzB8SO/7SqmKLrOt3qzLGasuDXuBVVhtlf5BOCkJRtgjYgLDR
	oLfC4Gya8n4RyOqgxi0yk/I/DpXAwK8AcLL3O3+nE+4YvYQFpKEgoow==
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385552eec.3.1792210656383;
        Fri, 16 Oct 2026 21:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385521eec.3.1792210655817;
        Fri, 16 Oct 2026 21:17:35 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:34 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 0/3] phy: core, qcom-mipi-csi2: add generic MIPI C-PHY support
Date: Fri, 16 Oct 2026 21:17:30 -0700
Message-Id: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX2DsYm4emxjWI
 NmiFUw5/1w9XbTbx6TFJ3eyY40q9G18vyJ12g0Ts3Op1XB6DPNefmWBXKAf5oyTPG5np4nAcG33
 ETgAwfyR6R4fZpXoLAVi8cYsBHgxvQVt5J2BtYe5s/tznCH5If80WJAb7HKgd8+0DmhvpCalQ+T
 kdZEtY8sI16ClgQcU4wCO+GVVKh4/kfLDKUpNh9299BnVhZwFSttF046gFRGt2+zFLxELzWdTWl
 v29rvoXXXa77dkgVnX52Ddc40V+V+cZukNosXwl+pXdUkqoP1Db9I8zUt0oKg6kOnluyypXHzLN
 g1UDMy4S74m+5eG96WnHK67VtI/uCFdcpTh1AD7r3ao1ZvUYyBObAKlweqNOPQ+0Gof+Fjn+ZYK
 65O9kgtYd9k0/yBHMluYdqUgsZpk0K2VdnSdIPyF6wqIwYWYKpHKTRNyea/y1GwsLFMeLvBMB60
 680JiWViRgCNaKhMqeA==
X-Proofpoint-ORIG-GUID: Q3f8D6nWjcqNRYlOxAOugwPth2S-NPkT
X-Proofpoint-GUID: Q3f8D6nWjcqNRYlOxAOugwPth2S-NPkT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfXyHgJ9/o/pkcv
 f/WPaclEn99kMSSFDHyTpNMKyhcTRDVHgEJy1TTi4Ed0zHo5pMUmPs8dEaa+zldlh3eeYbbwl8F
 8Tf1k1xtxLjXAfiE+/wJ52ESOXMJCI4=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2f6e1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UyFj12KqJ2bFa5q0Gy0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

This series adds C-PHY (3-phase) support to the generic PHY framework
and to the Qualcomm MIPI CSI2 PHY driver, mirroring the existing MIPI
D-PHY generic configuration API.

Patch 1 adds the core API: PHY_MODE_MIPI_CPHY, struct
phy_configure_opts_mipi_cphy, and the
phy_mipi_cphy_get_default_config()/_for_hsclk()/config_validate()
helpers, following the MIPI Alliance C-PHY v1.0 timing spec. It has
no functional effect on its own, since no provider selects
GENERIC_PHY_MIPI_CPHY yet.

Patch 2 wires C-PHY mode into the qcom-mipi-csi2 driver for SA8775P:
the PHY mode is now derived from the devicetree endpoint's bus-type
property at probe time (D-PHY by default, C-PHY if
MEDIA_BUS_TYPE_CSI2_CPHY), phy_qcom_mipi_csi2_set_mode() validates a
consumer's phy_set_mode() call against that DT-derived mode, and the
configure/power_on/power_off/lanes_enable/lanes_disable paths dispatch
to the new C-PHY 3-phase hw ops accordingly.

Patch 3 extends the same C-PHY mode selection to SC7280, porting the
legacy in-tree driver's SM8250/SC7280 C-PHY lane-register sequence.

No dt-bindings changes are needed for either SoC: the existing
qcom,sa8775p-csi2-phy / qcom,sc7280-csi2-phy schemas already document
both D-PHY and C-PHY bus-type values.

Depends-on: https://lore.kernel.org/all/20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com/

Jigarkumar Zala (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support
  
Anusha Arun Nandi (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support

 drivers/phy/Kconfig                           |   9 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-core-mipi-cphy.c              | 129 ++++
 drivers/phy/qualcomm/Kconfig                  |   1 +
 drivers/phy/qualcomm/Makefile                 |   3 +-
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 561 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   8 +-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 133 ++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  31 +
 include/linux/phy/phy-mipi-cphy.h             | 177 ++++++
 include/linux/phy/phy.h                       |   5 +
 11 files changed, 1029 insertions(+), 29 deletions(-)
 create mode 100644 drivers/phy/phy-core-mipi-cphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
 create mode 100644 include/linux/phy/phy-mipi-cphy.h

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

-- 
2.34.1

