Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21B3CB8E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437416; cv=none; b=DjXgKOlfESR9XKXu4xvc9PHRveDlbEY6TGaMRFvy1vIrN+ryYtUqyAUmlkwZivhfeeR4it6rPFkKCMEk3IePMoJw6CmgxS2C9X4URhnZ6UJb2FBDJEwGgdmKfpWdSMmGgVBWSY6N0Wz+tz0Yi8lXOeFPYNdMbyVaxRege/ffO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437416; c=relaxed/simple;
	bh=LY+heOSrzYgkNtAo3TL8L07wyA3u8iJn4hbRUUiBQTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPvsSGij8hKtpwq88rYWfwG1UoBAqGKjf2g0EgbpXxVooSZUHcVcystVei41pq9fEkeUxZLrNACjXNBjRxjRCE2rgNEO7a8Jhw03yk0MH125xDditN1Fdg7XL9CuHW/KdHFbdgk4tyY2m3txiQp5hqyo9UkrYhAckk27w6GSqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsOsEL6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1g4/L4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsOsEL6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1g4/L4A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxjYJ1439486
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XsKGzaSEmTviNB6QZAhWmjsjxha6zfVDQce
	LidBhjMw=; b=fsOsEL6hyt0htehjVUCIWQxeZ3s6pv4HC9lFoNZrEe0bEK494iB
	iW7KfGS6jOaDDg2fHQ9PEHtL5B5h1dN/Plj+eD3Bz72wbWnuE6vTiMdBWLjo5x8u
	SsS279OlAbISQtdOTopc6BPH/VCQYlE7KCjSWUnOx78Pboj8duLSROhht8luiohf
	9MPxyi0SgduF+WUEqsJQlsfA5FpgK1+lV3cX8WiX//4erQc54zLede+Cqjxq0vSL
	bWZ9uKgm3SaB3B8DFtrB3qOXSSxwhxW8wPRMthRp2BGFhPXXD+06xPTFdzfSEZWT
	XToAP/rCL5F3vIj5klozb7a8qj1BAfi9TFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqbdj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:56:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9336581a2so75261525ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 18:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437413; x=1790042213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsKGzaSEmTviNB6QZAhWmjsjxha6zfVDQceLidBhjMw=;
        b=L1g4/L4AldLgsHUR6YTe4ABS53iCKyEvVivocDTT5SDwmM/riBbwcaZBYd+ZcIgOjq
         OCG3us5f2xtmJjXoiUDh8pqZQQuggsj+XVLQZEdkRuehA0jTRFPWhZo7fkHUz2a+UZwi
         NM75pNJBFWIJ3V2haTVqJ4M+Kvge7ScYREpeK38vNye+h4yQGdRAZ58QZCNJ3/YI7N5Y
         PgnG917av2A4Bi0uqyRA/ExFf1PkV/mGLqhTiZsVCTmOJ0szYvtmmpZLS4+GAhJLtwZ4
         043URYVwpLBYq06iJt2K5/cudsYAzLPJfEsdSvC7zsB8KsmcWFJDZBt7c88jqLWN/aTE
         BztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437413; x=1790042213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsKGzaSEmTviNB6QZAhWmjsjxha6zfVDQceLidBhjMw=;
        b=JCSDb3ChtC0N5d6xzkQzgZt4cJ3M5ZWug6FNM9qU/2PuDwBhT08e7Ww56R3EhFhZEH
         vDnXteVc+ffP4y0y/2iI+Nx+il03lUvOZ8GtNmXDGpyXP10htfVBEWztg7KYmw6zJuMD
         3Z+rvC8E6YM7I0QltQajLxuS2rwGxl3lvZfq1wAHYEzrTG4pUPOluVF9J2cj6k0g6Yv9
         c8N7ELS+qwJJq0E50elj0pUTBfxQaKd0aZIQ7aalrvAt9Efk15e+70MqGj64QUXt4oGn
         jF6JI0+QW0ep+g5ZvDNWbaXHjOr7wMRmG+55u1Oh+c8a5KhCoahYmNeekVvk8hiAf7fQ
         XjaA==
X-Forwarded-Encrypted: i=1; AKwUvBw7dhBivCJsdolfrUaVCEYBWB8ZcbSYbsWwmdDQsvf4pBVoJwuN8OrmY66YDs3eugTF2+MOL7CEK8xRZHhs@vger.kernel.org
X-Gm-Message-State: AFuF++lAtpuszJx0M+pYk+kS05weXVwApmG/ClAzFmPqBnCsoMMw9HeB
	7aVj3bBOYmxvp4w47tRBQOa4rhitHKQSh/d/zirHqbdewx43TNFG5Qq1Ba+czf0Huud0uEu0X8Z
	7/tpIdiCJTZXfpBnIfrK5jPcZDSXnZCjRCnKMdHUDePqKZrxvw5w+5IaXWSOyBrNOs5YZ
X-Gm-Gg: AYBFou17R+q6KuJD8+40bYZhvBKc8j85A+K35K9/dkPQxFfiUVg1hdia0jTIFReyRIL
	S+yfDn9VyR9T0KYYP2Um6wvvw2wJZbLcx77OQJm3wu7VcfZB/IvCzuSwCShbE2kLaGKLqiYwRr/
	0+Qq42FhsIgIifXAEsB19PeADiISklMeS6VXwTDeVLLEcz/RkFjYLsADGB7yf1MrIjJXNlmCTvf
	fx5OJZNheuGQ2aCQ2ZVyr1pbBDRd8rVhx6LxRrDFPvpWCI9MupPQVgIFhti71llyJkw2j0PcGzY
	uus8P07CX+ZsJ9X4gEaqgzvFqGxRub13DZcNveeDcPInaDyHkVjaLmwVldOfZq3zeQWcohe69jO
	lUa9XCzyJPBm+HKlxTCEURULUe6NZb33IBv/KGxY+FZjQ7pGN+zv+1pHY5nN7
X-Received: by 2002:a17:903:f86:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd6c5cc385mr102248165ad.2.1789437412806;
        Mon, 14 Sep 2026 18:56:52 -0700 (PDT)
X-Received: by 2002:a17:903:f86:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd6c5cc385mr102247465ad.2.1789437412193;
        Mon, 14 Sep 2026 18:56:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:56:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN support
Date: Tue, 15 Sep 2026 09:56:27 +0800
Message-ID: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX9aD9JKQ/KbzW
 VjnF/iL3K/ei+0No5GrH506+0AD9nzScf421nbS/O1zmvK1Esbi5KngRYfTKydlHlpqFmtl8wln
 +BdELRfkv99qH+cUMEuBCmMdwbPgrbhdcmN2XyC9do98uODmzUWkeCeAGQC5K1lFCUBtmLVK9Oz
 WXoIRmFanducsKhDM2ZjVbEfRSUfQIBXwj7clo6Nka0gj+2JnoeeFh74v3CSY/AToWNTSxyesrj
 V5HKeYwIqaQB5R9PyZp4YnJYn1N5jbFvQKFO34bjUySijHmB7PJWLiDW1hRFlJgefJ4O6qxtnh+
 0N0LYyYIMfPAvV0L+SnXbcwS9R01QcHFcYvkvnk8D256MviIrc1/amW5XaBDR++P0JohAOulWAB
 St2W+ecsku/Vasnfhn4hGUmQIRYwRNyuk5GU1qh8PwVo9ickjG4mFKMmL79lpb0EGX47XVENmED
 bEGGtvADKddW5WVEkZA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8a5e5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-CvtibuEYNIfTV4diQsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: sYQqKci6DaPdKCFdx52QyNJ2W9YPsoZC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX7EInphMnR9dd
 kDvcXKzt1EI9kzgwXWZ4UlBO9JUDxhm4qMCEL0LrGC6E2/HewbYYlL2LQUP0sKK+CiG4brnWWr5
 sZEC92uxZcvI1zJ3BiChEAPc7ChUwhA=
X-Proofpoint-GUID: sYQqKci6DaPdKCFdx52QyNJ2W9YPsoZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

This series enables PCIe on the Qualcomm Nord SoC and brings up the WLAN
modules on the two reference boards.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY.  The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.  Patch 1 adds the PHY, the four controllers and the PCIe
SMMU; patches 2 and 3 enable them on the IQ10 Robotics Reference Design
and the Ride Embedded board respectively, along with the per-port PERST#
and WAKE# lines.

Patches 4 and 5 add the WCN7850 WLAN module sitting on PCIe2 on both
boards.  The two boards power the module differently: the Ride Embedded
connectivity adapter card derives the core rails from the module DBUs
gated by PWR_CORE and PWR_CTRL1, whereas the RRD generates them with
discrete on-board bucks behind a single core power enable.  Both are
described as they are wired.

This depends on the Nord Gen5x16 multi-PHY driver support [1], without
which the PHY does not probe.

Dependencies:
- PCIe and PHY: https://lore.kernel.org/all/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com/
- DTS prerequisite: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

Yu Zhang(Yuriy) (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 151 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 158 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1528 insertions(+), 4 deletions(-)

-- 
2.43.0

