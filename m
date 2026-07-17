Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494BA3033E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266328; cv=none; b=teFxRN08ZIHAJMBAp3ofXY5wSc6csk5VulLBkIKkAR+99UQ2TdbdChctiDjaqbVf+vSecSO0ZA8iwd8cEgGgnvuSz5dE0wZnm7ekpdPcCuOjTgHU+qJl+HlyUMZ3Dyrks1z/CwSBb9Jom9DgMeacMsE9FWM+Wtbl9q5Y48FbxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266328; c=relaxed/simple;
	bh=bMi1fwZJqr3CFZUDEqzyx+asObpwsahfGL/FCYaVGGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LFXpZzBQmBCTtOlpDz+b+cmzUf1D5236OI0Ievv7pI7jyAnEO3+J0ySvYd8Xw+sfcCogETlJv8BRhAmTxM9xy42WeS6bLtR7MZ4BnbxfXYxmQ2o7Atgtv+ToTjuDrWX/6UxSfFWn9eQTzs6amQ+W51u8KlHKUX7ILD+tJ5ai/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDrDuHVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rz4SdTq1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDrDuHVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rz4SdTq1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33vBx338293
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i0orPxOgo4sJ62uMX+MWtC
	cWhw0MT6Y5yrOXFylx+3c=; b=IDrDuHVNRfqOPmDfHHbdJ9K4L6MxfieRFatXss
	p6vlsC0aNxwXt9z6HujdB5KJnCRnMpwiKWEZ2emNrMhT1CjZLNSYf1yV4qy+aF8D
	BTr3niPh/3Nlmx+FXgYUT8VQ/8TtBE6fU2GSyJJob2O3ecNDQo4n9tCi6pdg5Bgt
	HZfn/Tkt+OAtQ7FsoHIFZ9C5tXB0pBblsVxB++xvgHgxTLrX4i2LY7Z7gDTZuEEt
	za73vVv9hgQeR3WDQvwRg31OmL2G3T5WXofTyc9ZYvkpa1rgC4KqNMhSOQ0JkHND
	qZN9pavz6hXdqR4fsQNSoSv0dfoFytbfQjoyKH4kjex4o3Cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weas0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso176528675ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 22:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266326; x=1784871126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i0orPxOgo4sJ62uMX+MWtCcWhw0MT6Y5yrOXFylx+3c=;
        b=Rz4SdTq19BN2v3kHYwM2SSNW7fJKAIcYyLtYTV0aJ/3PVrEEjutt6fHe2N/lberbFe
         XBzkTBl6HND+70CyY8sr72AVE7DeNX/pD177ezS9nfEGh790PLRFuWgQ3mXmCL7Oe5D0
         oYK4Bfi91/C6qmqRr6z31TXBazgAkbE+OTo7mNeOIlcHjisbMk3OR9kAooKIsTFhFeu8
         NnpUGEOmZrfGlTut6LEX+Yrow8VE6rJ+8gAMMJwhneKyDZ+AXViFWiPCPx48GTlXyr43
         ieGMXVktHwnhdYkEF52IncRkLD9ECyB/5i6Hy0YJo/YDjO8srj2YduVf5QmscrmxsFtY
         ShRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266326; x=1784871126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i0orPxOgo4sJ62uMX+MWtCcWhw0MT6Y5yrOXFylx+3c=;
        b=JT1JznfUB+1lPukH9szaUPSpaemBRQLUe7pDbs7PXbfZlBiqRovYMBslij8GNbwOvA
         lKIPrEHnHWRMjvPMqAzht6/nWM6aNm95qvWdW6MTuUAwD4EwZoKYF/IYOKbCwG6ZKsZh
         4eJjqymdiMfCTKyyEbdUSU+s7Bn/hJLlLYOuakeMALltthAWTPCNiQGXKVN71OzexN1H
         W4+qnp9xAwZxTIy/fi/y567KtRFfBIHeq6EspyUZCxMDyv22OQ4V7We99YwgaXB37WQC
         /RqxBdupF3qBdIU7HX25j7tZ4RQl+0j53ZOmDgujUHDKNhE3Qc21kz3CxZnTi1TQj19p
         9OVg==
X-Gm-Message-State: AOJu0YxExbGkOfbfiTktKtzEnLN95CQQmdY63s2b5OdwGlOm1+FY55ZM
	Cp65TvekPM4uM1eDyjnn/rn1T1d5gmzrxQ4Mk4DZgQRJUNGiaf+dhc380UAdgq3IdL1AJabMzOS
	N/kU932aUeYZHvDGG5yCsFpvdERW2DXYXwNDmB1gcYN8gKbmm1AA8z/2ATQIW1FZK59o=
X-Gm-Gg: AfdE7clHgh1oIdti7d8OGTaitA4G7Icp6IV7tEcEDk12Yl6x0K5PGxjlf9Y9tKsHvQQ
	MMFw3H115pB03R2r+OwdcxMODHzQefSsOCjR691FOzZ5gCrzPqZ1KuSxqmrUv8jVdvVRC4qo3i1
	vJqQjqXB770ddHNsn3dViJLLPzluyBvdfrbInOQ6SD9EPbtxrlmxkdZZ234DTVPUCBrsyJLzULm
	ByWJSe/F5lqCJBDtUthTOYIPzCV7uZZ9QPeuQY8Uo0AU2n4R4xO9jR5MP448R2t4y7VMA4kUugB
	Bz/Ufh1LxYK2icycbEZDD6U5QfEtMQwJapErC+B1vsBhoJCwRajh3RTKXXM1MuE57frD0y1gytk
	6Lq6MKZXhFVkELY/2N+XQ/JNwlN2yrQ==
X-Received: by 2002:a17:903:2f8e:b0:2ca:c79f:75b5 with SMTP id d9443c01a7336-2cf34964e69mr11800705ad.28.1784266325891;
        Thu, 16 Jul 2026 22:32:05 -0700 (PDT)
X-Received: by 2002:a17:903:2f8e:b0:2ca:c79f:75b5 with SMTP id d9443c01a7336-2cf34964e69mr11800365ad.28.1784266325475;
        Thu, 16 Jul 2026 22:32:05 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:05 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Date: Fri, 17 Jul 2026 11:01:58 +0530
Message-Id: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6+WWoC/x2MWw5AMBAAryL7bZO2ocJVxIfHYhNq0yJE3F3jc
 5KZeSCQZwpQJQ94Ojnw5iLoNIF+bt1EyENkMMpYVegMZTUmVzjyheEQWW6U1pPbsSt1R4Mebd5
 biLl4itK/rpv3/QBWEYFGagAAAA==
X-Change-ID: 20260714-pm2250-fix-supply-parent-b91bed1f65c6
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=1313;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=bMi1fwZJqr3CFZUDEqzyx+asObpwsahfGL/FCYaVGGw=;
 b=pMnxghExo9KG3zSbmy/hkwvDREW7Tjq78yA5xA0OuqaOlGuX/QjWuo/Vxh+pDdgYAgrd0Javx
 HykJsiZ2gnmDPAQqqi8YXCkAGRWUQGKN2ZN3RJ/dca6OoCrSnrlYJqh
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX+YpfMaHqDHWR
 mW8PTaEl/yBdj5Vwm+rXG4trA5NCPrftegxdxTJk7QVm0HauRfbby5jQLx3gs8uhtVZJd3B/Yaj
 YwLrAGuWrmHwH35iay1FD9imTx5dOBBzAt3nEHVk/RVaJNROoLWJiQeh75e0bkxWnqveDEj+18p
 gG+S/NSGpk8AfAn+XFiG+hJqho1Zj6ClPqLFkeBVinlfer60adhnJ5yrAqgPR+FHogMsnPXtaIN
 ot7u8B7cfsYaprPiudAhyVDPn5LKkrGNeON+15ncluPtVwz5hqbos7OoYQ6XEyXIUnOGn8tr2CR
 LIODuI8CY2/XDVairnvHoUvHT4keNAYIwYeuqeW0EplxU6dNZ7KnOtPsOWvpe9wPuAvynMUVZR9
 5BvE/v0xZk0+mjHrWowuoP/zv9X9ZiK0piS1tU2p4koUFip5H8AZOMma/ukFPcUNs6n97SpBLkS
 s7j7uYkEgNybqSHHrEQ==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a59be56 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W-yECum41WkdzmXz4YoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX04wXrnib99zV
 4FhNbykTolXxukDU/Fewlpvtls0gkbMBJGiBdx4xipTmXjQixcPoc528CAXB5aVwn38WHAH5TKp
 tia5YUVHGdDWo5cr0GmvNLMvslWRbkw=
X-Proofpoint-ORIG-GUID: O1svHT_VSOS7n2V3H1fFJxnRTpunflkJ
X-Proofpoint-GUID: O1svHT_VSOS7n2V3H1fFJxnRTpunflkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170051

The rpm_pm2250_regulators table hardcodes supply parent name strings
in the regulator descriptor, causing the Linux regulator framework to
vote on parent supplies from APPS unnecessarily. On RPM-based platforms,
parent-child supply relationships are managed entirely by RPM firmware.

Fix this by setting supply names to NULL in the driver descriptor, and
correct the supply parent mappings in the qrb2210 and Shikra DTS files
to match the actual PM4125 pin connections.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (3):
      regulator: qcom_smd-regulator: fix PM2250 supply parent mappings
      arm64: dts: qcom: qrb2210: fix PM4125 regulator supply parent mappings
      arm64: dts: qcom: shikra: add vph_pwr and fix supply parent mappings

 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++--
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       | 31 +++++++++++++
 drivers/regulator/qcom_smd-regulator.c             | 52 +++++++++++-----------
 4 files changed, 77 insertions(+), 32 deletions(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260714-pm2250-fix-supply-parent-b91bed1f65c6

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

