Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45938B7D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642411; cv=none; b=tG0bII/3TsKFiUPmhB5t5caLlGKMymZM6379KOWk7LimcT+geKSKDCru+Jh3jGIn827xfHegDF5OuFEv1p2nYJF6jZFNiOwG/Gtc2bH3B8pLf48UQCZ0RhOR38v9h59stEJa7ZTdal7bs5yca9+hg8n6cpa23hAWLs7MM2q9sm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642411; c=relaxed/simple;
	bh=0DvgJe9M5nomijPW4Vv8W2x0taaIpU1qtrUmP5eB6hw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rGJITNeOG/GkwC/RJB98gVI9SV0Z9mUIEbRwrhRobGRKJyMbDCGosz7PNa1aShBwLR6fKJPbAoYZnNCCLDUy1KHuRUoyT6bknPFBkr5CHTJcpgp7fUWN30czSlyhijiXvIOb1QMlBblXJtPFeOd/B9BtziDqNpC9LzeRAGUd/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSqR/1ki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zpmwxf4c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSqR/1ki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zpmwxf4c"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU3U33500618
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 17:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MqGpVnYqXLR5cHWayrBhIW
	b8rehflXSiYS3wKSRlV4k=; b=JSqR/1kiOuXAchQLEmA7oojfY+HVN3tvGpVgfr
	f9n/UUBmrza3YG8D2x0PNCU9k3svNKKKcqa9mEuaPJD3naxlXy1eNfHGruBYVtwc
	Cg1HbuY0qFa2a2ja5wqyA1wqnIbh7XXcGwHRdhD4g734aGyurHRrRhyqV+WBEoOW
	S7sIgjetlsUlmDGqjPeB138MGUR3hRaaDa9SzdvWLP3e8dCv8qVW/T190swB435E
	LLv/Mh6SyQBAzug3QleuVzKQurK5WtDRBPUBojfHqKQqA0YtTBxSNmhMjtblpT9Q
	Dx4b9QF4u0y7Tlwl91jdyBIV5ESQbERQfT3nXTQLM5dJDKJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g181830j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 17:33:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so18392a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642407; x=1787247207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqGpVnYqXLR5cHWayrBhIWb8rehflXSiYS3wKSRlV4k=;
        b=Zpmwxf4cNjDmPkfsQKvD4Je9H7inQD7FdVuIKW39SxbFvK3DWQXZOskZ7u4Nw1Z/z0
         YiTPg7KecR7RJtyQKyaIAgCau4ro463Oi+NX5iXlwpxU9ELkwOXjB9AJR2hst/1euL9v
         kzDwRfnFkdmhjx2+wGTOiUJ4wiNVHDUiK4n2GELsIA320UEs1Pgf7bmaeGA6bnywl7CM
         WdaolmvUdapzOQ4rnW0LD5jj1T3EE2kL8xfJwqva6HhpBOLG7Amk5t5CetSroet7boJP
         g3pxlVlHAhd6u38RZNBFqwoeT+/CwVN6EaPaLmhJjgLaFO/QXNIyZzQinF1x0Ink/Pww
         On+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642407; x=1787247207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqGpVnYqXLR5cHWayrBhIWb8rehflXSiYS3wKSRlV4k=;
        b=sgarumES0XMkV005T8hwIwUlTS33uNc/tmgSpai4wuV3v9GvyttjYwp0LOisBsNUhd
         8c1pa0RP45dHMGNbLBXlU9jmK7GjWDs07I1xcuZ8gsFD5WcN6qM/fZulgeWUtDXaXY67
         D5+nDpOdp0hBwwfe0A7rwhIWEKG1tRaPbqvaQ5S/CEfJDyGKw2fQRm0fxvZrLrQbbgRL
         JxYP2xKJFBBV7wU7VBv92SZb15FX2DWlpaT3NVTlFiu7DDXLtS8oDIwSXM19Ma/j7IKl
         fI8obPD0K5WAB9h1lJX3VpOXp+ftIZyRxc0uQQ7PnWdOw3B3wMo1J6Je5/N0xEqu/GrT
         FYLQ==
X-Gm-Message-State: AOJu0Ywhth0KBvtca3Yr0dqfpD8vzNMVejs2ahxh7ukqXIJM+0gA3ltc
	49VI2Z763+LX5C7bogptqxCtQlm2g4KaJYIifjvV68ZZiRWQziVdSx+VtrYNTyueiD3xA1Oq2Qo
	3J1IhY6muXUS2yNmUaX0gyplEBxzB8gOBmL2xngLkFC7tBKnBxk9eV2QPDzZnCGZluOzKA3U6Hd
	FD
X-Gm-Gg: AR+sD101zbXG6tkXYBZdcXp6J39ioett/9+FR6Z9qM+ngXL+h3lwTP/1qQL6jkO0MoW
	sFUZtGfggrl23d1SijPkFjWCXMYyktBbJcEvcsbiYDGz4ERULAxX+/ORpn8VP9WMlrkm682dJVC
	wa7O1aGJXjJG8JMybBZYDeXbd+F1CbUCOYh7xvvD3FJDMoCO8j9VUYPRnu3xHdtQpESVcL6B6p5
	P3hWEn+ngj7RVnC7KnxeWspuYURx4Bi5KeyCfHr+0YdBZfGmZ6cXDi+E+mTqj5SumtqSVGqvNB9
	TAx40RMiT9vtNzH7n6Cvt/JgJlDSCwt/JNvEx5rI8RYWQNEpOJBGsfNGkvJM00BQCVzA3BPndq5
	RrFjDaekJnBw2ogPAFfRKHcew+zh3ie7ytnDTPH2QruK2lQ9LDTbCv8bFgmysEGJgUsBnAPZ+cz
	ZmjPdYsWBe5dJwUx3HtMKA
X-Received: by 2002:a17:90b:1d4e:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3931e282b77mr6160254a91.2.1786642407416;
        Thu, 13 Aug 2026 10:33:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4e:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3931e282b77mr6160224a91.2.1786642406966;
        Thu, 13 Aug 2026 10:33:26 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46309sm4300696a91.5.2026.08.13.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:33:26 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Date: Thu, 13 Aug 2026 23:03:19 +0530
Message-Id: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN//fWoC/22Q3WrEIBBGXyV43VnURKOhlL5H2QujY1fI32oSW
 pa8e00ChdK9ET7RM9+ZB0kYAybSFA8ScQ0pjEMO/KUg9maGT4TgciaccklrqqBbXYK0TNMYZ+C
 uok5SKSrPSP4yRfTh68B9XM8c8b5k6nxektYkBDv2fZibwisp6hKlQiFN7XztRIWtUIwyYytWt
 qYumdZyR/eYkjnqNMXr2YZpMM5BN2vOmIU2BpcfrBIoZKDjnAkulHwfU7rcF9PtYy/5eHvOy2O
 hrU7ByQzYgRstrDzjPLfcY0m1VvoJble9hTSP8ftY5MoO19+Wf3a2sgxkPhuaku+O/4Dkum3bD
 4TDDCuaAQAA
X-Change-ID: 20260708-lvds-support-2d40d60654f1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642402; l=2925;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=0DvgJe9M5nomijPW4Vv8W2x0taaIpU1qtrUmP5eB6hw=;
 b=KeznUSG+LRUVVULhqe7UaFKnqL/DbRn5ekGqEEUJjm0ziBVtFTABN7pSW7mmEXDKoSB7lxj1O
 /Sf+ULou9BbCBNNZ7zEUGYUpbaHU/6tLFPY6YAinGlMKO9V0jY8K5xD
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfXxn9b1RWU2OEs
 UHVg+aSRtxGpeEGpsPTTCqqkGYN4yZWIgPfhQCFj9u7FUibWMCesLg7Ffs08oAJzzVzOoRYjsek
 2OcfuSRs/ZbIoLzYYOtPfsnWmjp07oo=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7dffe8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z2I1jc64i5zuNuQ5A4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tsxihryHqKNOrLOY51Dfo08OTn_9bxC8
X-Proofpoint-ORIG-GUID: tsxihryHqKNOrLOY51Dfo08OTn_9bxC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX7JWkwe2Ykmwh
 adEpg+Z1p2DDPvLd/j+98I7HKz9LLKeF3ZOjV3MiPFo760QkmR6M2HFBl5boHTXNMyh8QBNC3On
 RyGd1eiHcHUCfCiCHbQnWSHLxlG3XKu92kcWWeq8wKD9BM/QMarKc/mP/0QHdY2Q7mpMkc4c5v3
 7XAZv0ytAJp9wCmnWiXiVX0HzuyIfFvr8qSyBncBmFKv35BhpT8eSRtV3gJ3aSx/uq5CY+nvgB6
 d6Ew4bIVQE5eZqF4gcuRNqPDQ9aeamu7k4QOluHzFtR3Rn5YmN4lzgUQK0FlhZOED4o/2UvTaG8
 yjxPCKxA42fMqKiVbMNNN3uIbynRL/7liwadJ2rzibrMEBLqqVelsdyymiyprGbjghrwyuVidWz
 yv0Vz6pWbip7YLn06l3zb3PdSGYYTNQsUPILnZU+CMSONU8ghDS1XkAFd8iQKdzuWLcxuxaOwzS
 fbz8M6l/n+7Is27KCTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130126

This series adds LVDS display support via device tree overlays for three
Qualcomm platforms: SA8775P Lemans EVK, SA8295P/QCS8300 Monaco EVK, and
QCS6490 RB3 Gen2 industrial mezzanine.

All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
The overlays follow the established composite-DTB pattern already in use
on these platforms (IFP mezzanine, camera, el2) and are structured to be
applied on top of the existing IFP mezzanine overlay.

Each overlay:
  - Wires the LT9211C bridge to the DSI output via an I2C node
  - Defines a generic dual-channel panel-lvds node with VESA-24 mapping
    targeting a 1920x1080 (476x268mm) panel at 148.5 MHz pixel clock
  - Provides an LCD bias regulator through the GPIO expander

This series depends on:
  [PATCH v6 0/2] This series adds LT9211C bridge driver by extending LT9211
  https://lore.kernel.org/all/20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com/

which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
and extends the binding YAML accordingly, and:

  [PATCH v2 0/2] This series adds BOE DV215FHM-R01 LVDS panel support
  https://lore.kernel.org/all/20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com/

which documents the boe,dv215fhm-r01 panel and add timings used by these overlays.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Updated overlays to make them compatable with panel-simple-lvds-dual-ports.yaml [Rob (in panel series)]
- Added Empty lines before the status property  [Dmitry]
- Link to v1: https://lore.kernel.org/r/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com

---
Vishnu Saini (3):
      arm64: dts: qcom: lemans-evk: Add LVDS display overlay
      arm64: dts: qcom: monaco-evk: Add LVDS display overlay
      arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  14 +++
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 116 ++++++++++++++++++++
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 117 +++++++++++++++++++++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 105 ++++++++++++++++++
 4 files changed, 352 insertions(+)
---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-lvds-support-2d40d60654f1
prerequisite-message-id: <20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com>
prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
prerequisite-patch-id: 7729b9c67a7c274b25fea08635dfede3fc604ae9
prerequisite-message-id: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
prerequisite-patch-id: bd3612ce053552e2ae7401a1217c4884413563f4
prerequisite-patch-id: 1d3e40bbefcb2550afd81c5cced812a1d3b943a2

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

