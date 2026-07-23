Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1573F6C48
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797748; cv=none; b=rGaFjBZgu7gFZ84uCJ6v55dMpfHtVpalw1GIh78re6NvefOHV5pHH60HPjaZ8DkikyjcbJJpI+0L2NnnxR89M6HDm9co9UlukvjSEj7UzKMnyOqy8tdfXIJG//z79Cj492WdaPxp0CB9SW8tYh2EDQjPsKidrURTjVQgEvgMaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797748; c=relaxed/simple;
	bh=b01C+cALlYI7RrYw5YybzmEoHucSCjWLpt7VPflim3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ti70klPQDq1lq8mW+xLv1VuseJjF7lQjbFv5n7n4B2vjX6yOPXiFKp8Zc9ehXLA+QISoVCmxOuskAabE92WFHbsvgLWwOLeCHtS4LvTpRtF9BaE+FgzN8ux74GAUssfz9NsIN8R9VxQF6VK5cdUNN75EPZ19nH7409G8Jazmb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsiTecnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVMGzbV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsiTecnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVMGzbV4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qc1F3517201
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+aKamOlxYz7AE8Ff5o5Gi
	NcK0ARJPfTyH3Ux2+L8TI=; b=gsiTecndJTGQ8+pMzSqeEUbw2VyQXCHtjFKzql
	twMGxN2dlDCxYWdsqk2eMVgEbUxtg4UwwnixPWYPLyDVYSvfEBCmt6NkLyHz48km
	En4TuNzlqTKvs0EumRh0hX8IH0m2n+sXPzjXsuD7iMcpEWsQuxnmQf9ppUain3yf
	H4PCBpdLMeD+uyhlx9TIi/8J1ZrhiuM9dMRyBG0yL8X9cx3tymPdW2q+hyWyNx6o
	KheI36MV2ppS72CllmyzrMUMlGWlaJXPm2RsOq2kOodmvpFI9DLzXt7k+XtalB5e
	orx/k9CfqeRoewvuB4bQbqbi7l/QXkKaO6Ilpx+BojFr8jng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm14c17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:09:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so298153a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784797744; x=1785402544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E+aKamOlxYz7AE8Ff5o5GiNcK0ARJPfTyH3Ux2+L8TI=;
        b=bVMGzbV4TGQY7251y6xNB4IUx+ajJ89kuqzuY4bCnuloIywrTPTY4afV0z86npC/56
         Wk6K84FgZ28rAwhFGpMOB4b0XYhxq4VsUoPC87AQ/95F7AfkdQkVoMnCL31kUveg+oQ8
         YMzj1hUfaYVNG15eC+t3Jq3RPTl3WG9pa2MRFj8oLbSjopYzGjEfpRojqUFLW8w7W7Ue
         +lGI0Hx2uftWIe/lO54VjNITNGmvBTzs3kdefQE7ziRWOn40HiDPjtaetcd0dafsoLFE
         PyAKnFlPcpd70Fs7sGg3JrB9+gDmggdy3w4pJ0kHe2kS0PcUtElKlXx9T53juCzUx/qg
         AsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797744; x=1785402544;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+aKamOlxYz7AE8Ff5o5GiNcK0ARJPfTyH3Ux2+L8TI=;
        b=JqREjQHtoBtBHZK2G6+72wOxSTiHBNAjxOQwWwz4cLv1WfRbx+qGRwt9nZPW7AbiYu
         FM9NMavRtwcpXt2JDiTGPwfNZzRw/EFNypXcikYXqNU0VxAo0e44Hc+m1JAC6QSiwgHs
         pH/WiElJi3LhxxLZ/hRWDKUXCAOiPkC8IddeZOGR0/m/ZIUp/zfxkI1rAmkJINgTd4oP
         a4y7M/JkYFnD2NLUrT8KLzOFj0O7DaNFmwYR9FqJI1R2rQBz0mz7ExfuDXL8WGmtwxz5
         bqhqxw3PGXPEDzG1cTYUSwt/A+4HP8CP6MoV+YExrekuZ7qXw8Cz5fxtcyav0TSGwCzW
         /axg==
X-Gm-Message-State: AOJu0Yz1jxP42j63zBallAw3MyVcW5BvsCV/XEJzy37jCn+1BJT1l46x
	RC9ZHBv/CU0D9RxRHxQjfoenkC0CyvwUhC43hJT3SO5CUpnjn9lHMkRbDqnodIv1UyDZWQfoGaL
	XT5BmPB15i3Hl2Su98WG1Ofu8qqBuSsz+7dcdIKHfjPG/YIhJQWKUyBHJEU8V3KUCRDc3PKJ469
	Ki
X-Gm-Gg: AR+sD10KoQaeMf+MviNeFwluTyL7ZayDvW+X5CC3nR7taC7VOfHhM2xWpMa+t7iAzk0
	IsVMwDeij13Pc9S81syqRsz1mWWLfBNjK99fMkmInd3D46uN0w/2Fty+3D+VxOyi6XzWnsjVtpP
	2SGKBUaEcVgVFz2WRjENE98MNzn3v/+drwANLQX1ZYT+j1YGDdaI28BTNKe1lskC4iRXhmEtRFd
	vLR+k69Eqx2Xoc39Hd0nwRAwqop050ArtTtBCOJvEMW18q1Vi5uQxLmdyxoa8LaW4Rp7HUCCVvc
	FHJtnUn5lcA/8yb5OX/SJnbUtTfj6UQBwHiUQ+NPHx7cUhm3nl/Za+QKUe9b2SQ7mlYMAu3Y7QM
	fhTEz3OyZ4x3FPBVzWiD+LC0CEAuIUtlLVgmKFw70xJZOAEg3Lalp52Y/63PjAjgK6S7uFdRExn
	+Hbin4wVNBy9O/sHh9mL5x/U5/TeijpQ==
X-Received: by 2002:a17:90b:4407:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38ec8398549mr1968662a91.4.1784797744141;
        Thu, 23 Jul 2026 02:09:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4407:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38ec8398549mr1968611a91.4.1784797743591;
        Thu, 23 Jul 2026 02:09:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15191485c88.14.2026.07.23.02.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:09:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Enable mutliple peripherals in IPQ5210
Date: Thu, 23 Jul 2026 14:38:55 +0530
Message-Id: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfaYWoC/42Ry27DIBBFf8Vi3bF4Q6Kq6n9UXQAeN7TxI8axE
 kX592LSVpWaRReALnDPDNwLSThFTGRbXciES0xx6LMQDxUJO9e/IcQma8Ip19RQDdRCMydAK6j
 33ATDPcmXxwnbeCqgl9ebnvBwzLz5tkm8Swhh6Lo4b6seTzPcmJyv/g5TcqXatnosB4pJiCFAH
 A+KMwoLAwpe5Saa1qPU9HlIqT4c3X6F1nl6ug/STFGbEbZmkjMhDTBY3OSaPN5dX/d5Pbve9f8
 FGsqgc3HvhxMsPNMUavTBGokS/w8R4MaUIOw/YBH5bdJYhXbjNkHZ+5TRzWFXGEIhtcJ7q6SQT
 sjGaqkNKuE36JDJ1tjGMa7ImsUupnmYziXjhZUwvlow33GWz20DWp7NoWHNnwYKaeG/3Ez9uPk
 aDdXUa4uUK33Hfb1ePwHgd4SRbQIAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX1CBeNoxKjnlr
 NQy3KPx8rjcjXcXrR2s5Xza/JHlcTHbYXzc7mc4kPi6WJqQsrqhRb7X0eDQJ8CMM/ZYyFSU2f8P
 RCjXMmCN5m1GOt3UB/oTkQxdFKeMAc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfXxekxU+b9p3yT
 348dvssxJL1okPBg43Lwg8uXDoarZM61gxB2DgzF6ZNrymPJVmr2bOnLPPT/Z3qlY0NcliX7w6E
 Ww9eSSPETvLL5ZFRFly7IONXQnDQNAyQ3lwUlDg121s5aXZ3B1XTFreN3T+ldgWb/Ztq+QXqdVV
 WqTEZgvBNl/pSRq0/qhQh7KkiDfoXhtBV5UdeqmTmHGJ+wh3sFe5xm8DCgSvSc56A614YyEPoPO
 cMhO3q7oTGtDunnBNpbAQFdPlYcCAsmjWAs8HhvvD+wyCz3HsuXSuNWhpk7+ko3vn6jKuHocpD4
 SZuoeF/uUqnTZKUFQIK3KWB6+DatSNlQB32loHI93sOsXuPBrfhHbTkzowE3ySVyx7FAGNFR3X3
 3zAGEgx97wsudQL8RzPGENy8zsSOvzU/UVKmI90/1IEHY4NqxgeNbOQ2B11GXdPHT6XhVWyQv7q
 WZj9wCafAxB6JGeiuZg==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a61da31 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qypwj0kMYNkJ_6xT184A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7diACvELHgL6ToPXj9nNo3op32SoPrKb
X-Proofpoint-ORIG-GUID: 7diACvELHgL6ToPXj9nNo3op32SoPrKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230090

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (3):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 variant specific DT file

 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  64 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 604 ++++++++++++++++++++-
 4 files changed, 825 insertions(+), 69 deletions(-)
---
base-commit: 06a508eb73747a8a71bed89f5766226e433594c5
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
prerequisite-patch-id: 956b405a71f384354b5c35a44b97a0a2dcf65eb3
prerequisite-message-id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: 36cf721e00f3f5bbc3ccdc0d39503c5899771085
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

