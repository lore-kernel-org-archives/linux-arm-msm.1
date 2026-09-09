Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13700499F0C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965853; cv=none; b=AMIFikV8FgS1sRkHVpgqSaUHie5DVgbvaYzqmRfnCUMzZB+4RNbPT8UED78nAjGQvUJ207v+cb6wP85VRM9KB7u6ia7NdvfdkkbUw4coI/RnAaE4gOUnDCdiyUvXdi1pE0n5SoaaZTt56TOWUGRdexSPOZUpdfSMq5GTfpJMk+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965853; c=relaxed/simple;
	bh=q2FLjN/ahXXPm55Kr7aqbcjEevrtwVixt6UpTPTK6VQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XhnGadoEjcjHg51avJ3HvsdmTNrREmT74mf26p5eEqu2XNBGm1+EI6FgcnfG9RHVPBVy+pXcRhLP97NAYU1eDzLLPJtOAMqAYXH1cqSUhKXuInjL/lyPDHfhnEMFIZ4bo5VU1NYNoR1fsP9rku/qHGj9Bu1eBEo8RJqc3HfF3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwaA8gbq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CK6WnYiD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwaA8gbq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CK6WnYiD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU0HS1809804
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=04Wp/MM2NS178iAse0nOqX
	igfG06ilFxLSmhtKCAMYU=; b=jwaA8gbqVmG5h8EwUKUV+z/pKtdunBtFwzGAte
	mvfGzPcHuhXKHpqG8R3NsEmG6Ncn5GvmzfKJ7x0UdP2w68U+tDhbFNcTTiwaqIAp
	MiBwlFc73kaKllzU13Si4kj/Ga/8b1FdaJ6cqyq++TexnszACHd1T1BL42qg7e1x
	gr168uPcJMeqgKQRlee71VGd+ukusPCQPyZWjRhZ5TClINeFmOP1IWt9spZNImjX
	faoTRFU6LcxrqAQmibdaq5NyZ30ZHzS696SWn84/yaBYN6fCZoVKxBpl2ZB2Lq5D
	3QXLmmIRNX9o6oVFX6+Q4kSMXrSlZnGqRpX7WTNP/dKOaCBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj19b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:57:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so7213559a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965850; x=1789570650; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=04Wp/MM2NS178iAse0nOqXigfG06ilFxLSmhtKCAMYU=;
        b=CK6WnYiDaa1alpEPJQG/WqFZwTzhhEyNu3KoxH4C56W7yNcK1ExzO3krenxlr5Dkbo
         clcDOhaAtUvHKFwfKpOXVV8/0B1ZSdyZdneOf1k2KGe5wLBMZoTUenJ1XBV+LoUsvDyb
         /eGPri133omaVijMhDu5NWhDFN4gcvbaQkeOSKfSgXR2XizjNqN+NXEUUi51OGIJdQU3
         aYukrAq5FLEdtptRm1HHhwwFa07GU3e386cfK/di4JbhQDxHdx1aeI2MNZVAGAGlv1De
         81g4DK+4OYOIUNlPjNwqehS2RMzmo6f2OLkPkfh6o3iM3l83RuTaHoHaCaZu1NApQSFO
         Ix8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965850; x=1789570650;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=04Wp/MM2NS178iAse0nOqXigfG06ilFxLSmhtKCAMYU=;
        b=ErmlaElu1RYZbLvlHs+2d1f28y4KGPGtQF33hCW0mmsuYN53hQSx85yRL3XHl3ZggS
         gi0dwpuWAGaJBl4CyViMmljSF8bxhBK5Wg7kQMZG66HTS7Dp0VguTcdc23DXQcF+s5cR
         aIAFsSlonGDLGOx0P5kIhjzFVvLOPeJXvuC22VDowcas857m1C7orM9MXhnS7Ldeg1fS
         C4hdBthyrv+WTaw4pKSCbXUJ7lDJqZWo5zot5nHQ2rICx/Wa/JnK2Lf2s4TDx/0/QOe6
         mINTlMPeLvcNMUxjgd1X27ZXczOHEpkdV1xYdWCIi8LZqwno4VxHbdFqeDFIIFG3nYj1
         3Wlw==
X-Forwarded-Encrypted: i=1; AKwUvBzktjtjpdEDOp4PFVDoJTYYiw79mtrJ2VHQWB7bF0J0MRxS+hGkhuwhDf6bB556OsGy5cl3w42bnU2ySSKg@vger.kernel.org
X-Gm-Message-State: AFuF++nFGIR45gA1P+Jt0FZD30LDs7RkabYbrf6sD0bs4Fzrqd3gxf19
	Rhho1BGvRJ5Nn++KfsHwSG7O8xbyQu9JC4PRhuafeJ148E6TxgQKh1lnG93bdeRPLafEfYAaZiR
	wDazfTG1Ub+lvAy/LhQ5fuAubeazA41Ip9WL/IBv1RR3kt4DO7hfoxC7CGb6b+TJJXpWa
X-Gm-Gg: AYBFou0YiyKFJtbKb6MlC9uLqeRPALapXSYjNDs/UapIawUPQTIYghQWatv5sfpnhPa
	A5a5oOuTaezNUTuqMgDzIALzuxdjuvo6LqTFy7i3lnV8BfEtwg1oIShmhJd0V5uefG2klDxYZ+T
	v3md0sacpw0JN1Yk/Cw6aOS634hF3std7u6BoxwqOBTUs80yF/N9klaSdbVFLuSIrIPDtUkANZZ
	QoxHurACvp1s3M32luVRvDTiJeGagQKDj3a1RiTSGyJ0/NjyADmWxedNyrLITEjYCw7NKe3kfKb
	VPIw8oSdUOyGKIYoV4yvqowVJ3xUtE3J/eAPIn+GuymZxyGG1aiSYetDUkb0aOnpIgndnvmbavu
	E0+rDEyZ5HUbKFmSRnX1csmLP+x6y0GkZGl0=
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr52410851a91.25.1788965849446;
        Wed, 09 Sep 2026 07:57:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr52410782a91.25.1788965848918;
        Wed, 09 Sep 2026 07:57:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v3 00/13] media: iris: Migrate iommus to iris sub nodes
Date: Wed, 09 Sep 2026 20:27:07 +0530
Message-Id: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNzoWoC/3WOywqDMBBFf0WybiQZSaxd9T9KkbzUgBqb1NAi/
 nujUOiibi6c4c6ZWVAw3pqALtmCvIk2WDcmKE4ZUp0YW4OtToyAACcloThOc23dMGwZRZ06urd
 jixnjpuKVoA1VKG1P3jT2tZtv98SdDU/n3/uhSLfp11kdOiPFBJcgJQclQTf66kLIH7PoVWrnK
 dCmjvCjK45fjJB0WjCQDOCs5T/duq4fBoaenRQBAAA=
X-Change-ID: 20260701-vpu_iommu_iova_handling-556e969a1f1c
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=6670;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=q2FLjN/ahXXPm55Kr7aqbcjEevrtwVixt6UpTPTK6VQ=;
 b=URaPNyiMy+nVvcVWb0jHxEEURNxU520FcraZ6Eq3a7gVcIkrXbCQFxznKFey9D6DTplaOTypZ
 mM4xUmgg2OTBP7rhNDFIpHjcJ0/6iaYcCLw7kldrTdE917zkUJa6Qtg
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXxoNh8/kpVA0E
 NQuEUM+G9mLWyL2EDJ3Y46GSNdI/t+1suuLbViJ5YHnRwPGhLnjj6uxA9y5hnjYRcWDXWdaDS1+
 0SoWAsD41ILKsB/0N7MNbOGFrl8e1BA=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa173da cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=Mirq-BLilzHILghaBF8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: udiF3Y68gdicHTp41hWxteLmxHImJokq
X-Proofpoint-GUID: udiF3Y68gdicHTp41hWxteLmxHImJokq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXxLULlBUDNqVz
 AmD3l51r2F0saw65BqeCwbIO03t3XZxBNsTGEVB3VrkaWqU1pkNM7TuQqfv+hzctoIZ0L87uidp
 8tU0S5z/LVsR8NgjE6JUXZYsXY0hmFMIMxBify8n1VFv4FamktV+cOhb9xO1BpPkf/FzBtF9VBP
 t3KTdwWfuh/mc42PuzUpuhhMy8eEWIRXUb/JS0AfNyF+LMKDtxKwYfJIEgDQt+1Fd8nBX66vy+y
 B2yRTD0Hh5FlE733dgLX3GM8+pkqkeoKuxFAkpSNHvoc+2HQfGCPTpYCGzoojWR66+7SqElo0sq
 SJTTqDkEg3Gbtfih2tfF+HDl925w5Cfi0q7wOZKSpZJKma9/by0+aWwD5h8z+VLIkbuUhF5dwMU
 TcwP1Elm6JmLHKhId5fxfuvTVbGiutEhwyrEbF5t9Gi7D7aE8cRmXqQycyCdgpnNKtG9Rq85YRT
 jVYL9RDUI5Rrf9E/m1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The VPU issues DMA through several SMMU streams, and the hardware does 
not restricts specific streams with specific addressable range. The 
non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
pixel stream can address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+

A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer inside the low 600 MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix was made in iris/venus driver to reserve the 0-600MB range and 
thereby prevent iova allocation from that range. 
https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com

Given that the address range restriction is for specific VPU stream, it 
should be ideally moved to that stream. To achieve the same, a subset 
of streams is now represented as subnodes, so that each can be 
associated with its respective addressable range.

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The maintainers agreed to proceed with the subnode approach to address
the VPU hardware limitation.

Reserving the iova address using "iommu-addresses" requires it to be 
placed in the reserved-memory node. But when "iommu-addresses" is the 
*only* property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong to 
reserved-memory node. A device IOVA range is very much specific to the 
way device own address space is mapped, and not a description of memory
shared across the system. Given this, "iommu-addresses" backed by a 
"reg", should be placed inside reserved-memory, otherwise, it should be 
defined within the device node. More info on this discussion can be 
found at
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

"iommu-addresses" property expects a phandle, which does not make sense 
when the same is defined within individual device node itself. 
Introduced a new property, "iommu-ranges", for the IOVA ranges required 
for DMA memory mapping to that device node and when there is no physical 
memory reservation.

"iommu-ranges" is defined with the schema PR
https://github.com/devicetree-org/dt-schema/pull/207

This series migrate vpu3x platforms to subnodes. All new SOC having 
iris3x or onwards(4x 5x..) should follow the subnode approach.
For VPU2x and AR50Lite SOCs, which are being migrated to iris, the 
subnode support would be added once the SOC is migrated away from venus 
to iris. There is no plan to upgrade venus enabled SOC to subnodes.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v3:
- Drop iommu-addresses from reserved memory (Rob)
- Defined a new property iommu-ranges (Krzysztof, Dmitry)
- Moved the vpu specific context bank handling to common(Dmitry)
- Dropped fixes tag.
- Link to v2: https://lore.kernel.org/r/20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com

Changes in v2:
- Fixed sashiko issues.
- Moved subnodes into common schema (Dmitry)
- Kept the firmware name as the one defained earlier (Dmitry)
- Added dma-ranges to specify parent-child address translation
- Moved context bank hooks to VPU ops (Dmitry)
- Updated commit description.
- Link to v1: https://lore.kernel.org/r/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com

---
Vikash Garodia (13):
      dt-bindings: media: qcom,venus: Add context bank subnodes to common schema
      dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
      dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes
      iommu: of_iommu: Add support for "iommu-ranges" on a device node
      media: iris: Add non-pixel and pixel context bank devices
      media: iris: Route buffers to the matching context bank device
      media: iris: Skip DMA mask setup when the core device has no IOMMU
      arm64: dts: qcom: hamoa: Add Iris context bank subnodes
      arm64: dts: qcom: sm8550: Add Iris context bank subnodes
      arm64: dts: qcom: lemans: Add Iris context bank subnodes
      arm64: dts: qcom: monaco: Add Iris context bank subnodes
      arm64: dts: qcom: sm8650: Add Iris context bank subnodes
      arm64: dts: qcom: sm8750: Add Iris context bank subnodes

 .../bindings/media/qcom,sc7180-venus.yaml          |  15 --
 .../bindings/media/qcom,sm8550-iris.yaml           | 118 +++++++------
 .../bindings/media/qcom,sm8750-iris.yaml           | 187 +++++++++++----------
 .../bindings/media/qcom,venus-common.yaml          |  97 +++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  15 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  15 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  15 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  15 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  15 +-
 drivers/iommu/of_iommu.c                           | 107 +++++++++++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  79 ++++++++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  41 +++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   4 +-
 18 files changed, 579 insertions(+), 189 deletions(-)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260701-vpu_iommu_iova_handling-556e969a1f1c

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

