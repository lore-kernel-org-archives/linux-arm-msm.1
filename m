Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297444AA03C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108359; cv=none; b=MoBsCbaOzVeiVQZGUsSpd+tgh7KF/GqtSl/N3TBtcaadxQNGp8u9MjNrzJxZ5WLLKdZAM7OuS4x+VQRKqApDv8lku0EQekdg1z7DaP+rsJ6O1GCkK7mLdkixzIf8XioGvACpP+ufMlX8qv8rP/4S8I6XnNE4npzXCwgDxnn92FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108359; c=relaxed/simple;
	bh=nZv0omdQd7xZAaPLxEICv5XcKhxWVLNSS6XQFdQOA8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gjLSUFM6J1HDMH/EsYiD1v8yt6AHs9YB7p+xUXYNNWVIP26yyBmC+teNKq3QpsmAbG774BJjrVDtn8jKzljmHZx+AyyiAWElEVbx68paMcwZtNo81TffEOMdytwPUlvPrH0vJOOGkUsSfO2ccbi+JAv90wLrLhkB4SXsht8CzKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuGR2w28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQkbtcIN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuGR2w28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQkbtcIN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Qe4900417
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=inb0TTDzgD+s+0QPNuwcXL
	9Q/H4tt2RhIb2hDSuNaVE=; b=WuGR2w28JqLn0d7H9bIcTVmhMnfeKETn3qq+IU
	YRuqDJ5CSpEO1YfTAYerBuv7fQfkb4HNpKpkNaT2HfplRB/zSGQevjdzpK6pSkjJ
	jt6IIL+6/SavoVGPuQZdWYE8ejo85kf9x29nBlSMtPBdm2KTJ1ZGr/BVieA9HwGy
	x23Wz1yopHvDVi6WlgXij7yHsUvrf+vY+N3rd9ZngwKsDIEwa2F9IRyQ7Dej9Rsg
	2hildVSg7JQ41Nyd24uKr12GM7NdEu4b/vMDfqWRB9UnI7uLWJj2M2RrZEBMAIA1
	RILsn800Jiy5Efq5RD6hs5+UBpL81cWqXqQ0khfZMhfXaUng==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyujvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:19:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1431ba79941so217510c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108350; x=1790713150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=inb0TTDzgD+s+0QPNuwcXL9Q/H4tt2RhIb2hDSuNaVE=;
        b=QQkbtcINrALXzLTU+ez/NeGKeO5M8JQDJhF6r4cyCp6WU5YvxQ1oXAP5V2QGCpoBdj
         KmZpq55IZbdzvqOJ1Cki/n0BUwodH0ou2I1Ubsq04DWv1Z0d++fbo6aCNup6FmuwCkMB
         NmGOmr/ht6HHPKuC5cUcbCUytE+ToVAYTitzONqJiHVBK7EGZhSfy/jGl1Hhlik/W1YY
         gzfn3xuxkO0Gs1Koh8sPhFJuoznF6Lj3Xb/gSLnNkJbQWL3fh6A64KkthHqv9AyydtAv
         i6zoMzhpFt7qjUXphWgjeG4AFhtzvfHSwNWoBhzR4brJtN7PDZYeDDml5tpAzMeMZIAm
         fdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108350; x=1790713150;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=inb0TTDzgD+s+0QPNuwcXL9Q/H4tt2RhIb2hDSuNaVE=;
        b=T6PJQN3/KMSlAXBX6aV10owXCMMeKT10ubSJY/8kGzs1qlqZZlhlv9+kpKBBKcSQAm
         8qTCweQ6G0oAqVuobeUFMSal/rCUXHwFm1Err71tJ/UNv5PfMZDcLSX+ewX23cIK1tXW
         XhTPgbjF9KAJAcAQPvIqeXjVk1QCtlojR6iX3mKA/JJDkwPTK2vy5UO6sZkjdYOLOJCF
         6rXBRQOF7W0xmdwLWFTcFd/oBBnZQ9yWN4GO4C3pyBaQ6moNtBVM2Fge5Y3xtxoSaJAB
         m+6yvmOgd5Ml6SLDIrpU6hQ4QZB7TCOHJURCY1Y7PNfGO2fnandAdmJLdxO4PxYLh+zY
         P88A==
X-Forwarded-Encrypted: i=1; AKwUvBxXnJPy6Ae/kVh1lscRw9dVWQhPSOlnrs1ATgnuSGHugE0QbasagD1rRpWg2bGlHv34GszUGypkNsq2uIXg@vger.kernel.org
X-Gm-Message-State: AFuF++ltr6Kcy9rHkHxL3bbgNwPdbXa6DPV+MQL2WVxb1QtlnugWkp5Y
	uecVOrPqVa7qgRCCwTlGJFX5N2rd3P9rwewfwolIjALp+xVz08CUsgtYx5DcOXzcT2NHX5JVg9w
	BJYmsuc5HE4uFNWjzM098sZztWc0Q4YHZr+YtcHZcvQtCFHyYwTn45LiFwlSGIObLFpxPUTH8AJ
	I6
X-Gm-Gg: AYBFou22NuHguZpbH/iw4wGUxzeaDnGo5ouiVKfyTIzt32BNkbpwBjMivnnFvBgi3mJ
	eAwENsTg16WaguFwtJG9OHRZqk+c80gyS1odpYXR+EAhM9Lp5BpUrrY3zXOSC7GPtY7irg33srK
	iOzE67kuCzbnvEbI1xXgebEbBMESBBZY49rrCRfSj2bPs4IEzZIjoBMm/wE8IClfnFKV1AOk5IL
	JXC2h5bM1rivqSVDl9sMy/QO6sSRkytiLDEbZ/Bg/iNrmiknnTN36ItHQyuFhlWsBkBi6Arvi34
	NtfLfjWG78ZK/4HCgjpFwqo5f+anUdtUseR9FOqC6M5JsomyfJvS1M3Fe4J6QEczQMIjRc1cFA9
	FCx+Ox/ba0DWkoNzKo8Ji4euugQ==
X-Received: by 2002:a05:701b:4209:20b0:143:298e:913b with SMTP id a92af1059eb24-144f9189922mr450329c88.45.1790108349228;
        Tue, 22 Sep 2026 13:19:09 -0700 (PDT)
X-Received: by 2002:a05:701b:4209:20b0:143:298e:913b with SMTP id a92af1059eb24-144f9189922mr449905c88.45.1790108337137;
        Tue, 22 Sep 2026 13:18:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:18:56 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Introduce Qualcomm Hawi platform
 device tree
Date: Wed, 23 Sep 2026 01:48:34 +0530
Message-Id: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvismoC/52NwW7DIBBEf8XiXBAL2AarqvofVVRh2NSkdRwDT
 itF+fdiJ1IP7amX0c5q5s2FJIwBE+mqC4l4DilMx2LgoSJusMc3pMEXTwQXDTdC0MF+BuozPU0
 pUwvO7JXnEnVPSuUUcR++NtzL7ubT0h/Q5ZVxT0Scl7KTb7Gfma66jQCnMbnXiNZT0fpGG5St6
 +vuLFbCiCnZe+Fxa2hegxQgDBMtSGgVBTou75gGNh0G+zylxObFfrhpHFmRp78xBhTXSoJgUoM
 o9/8wGgCKypoJ0+gW2hWzAeYcfgN6m5Cun5C7qnbKK2hMw1VPdtfrN5E4KoOfAQAA
X-Change-ID: 20260922-hawi-dt-post-a1c9f4d03e8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=3516;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=nZv0omdQd7xZAaPLxEICv5XcKhxWVLNSS6XQFdQOA8M=;
 b=ATXWYTdBsF/WDKUEdXK1BNjMqC5pl5BXiDr9u7CTf1GpYaKV7gsFoD+HRHgQcag/ZIrWHoZO6
 zFIl0DauTSCBpMvj29uWUJW+3EYnykCF15keIQgBOm2eWu0STXyQZmc
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: QBr5B9NUNiq8tQY4mkaW8n2WD1TA77qp
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2e2bf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eXJStwgN-W4ek1F5OGsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX/Dez2pOVY40G
 fMh2Dhe2yO1nVX8RY0BoVpK0mFUJD1VOuFSbbObS6do/MLZiXovpKMSatItYPPr3DOW52ZgCPgF
 zo+Y8EBXiv/WONPU/i7ZNjyG4+2MpE4pL0vkKaGi+vU50zI8Xb1ndhfbms++/W+5HVkxoos4/QX
 PnbsUTYVwsN1roEQhB21y6eFrZcv62fhuiBHTAGc1dq5enOooaBC+uLeXPRNxAg3pg3f2Vn4qcz
 6TJSWp3pDAaWLPpAt9qVx8s1Qs+vO92JCVWWsknpgPFAnqQDmwB8J7T0R91rXQudlWtyfypx8IC
 qLgkkr6cmLlbVLJPjZsKldLb08Jb5P2lj2V+SHIMln1VUrk1duw+6DTSehjs/GWtia0DifSn8v+
 aF1NHLrrhISc82c8BOub006DvCslKeBVs0b7URxg43FFCtCv6fh/s2uZW0+MHT8Zy9/bEj41VeV
 rcZaMeXR0bfBBzx85PQ==
X-Proofpoint-ORIG-GUID: QBr5B9NUNiq8tQY4mkaW8n2WD1TA77qp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX++8hLwcuYv37
 efQ+M4qRrDU3m7QYr42HsVbGa3gCa2lFY9JqnIhIkmhYEjjOkF+QZjjV2w2CxfZHt4oPx/JS3xg
 9lth3lI14Yt0E6YgefzCBBwvq0kUBBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

Introduce the Device Tree for the recently announced[1] Snapdragon SoC
from Qualcomm: Hawi

[1]
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-extreme-gen-6-mobile-platform

Series contains patches covering Oryon new CPU variants binding, IPCC header
and base Device Tree for the Hawi SoC, MTP (Mobile Test Platform).

Features added and enabled:

- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/VIDEOCC/GPUCC/CAMCC
- TLMM
- Interconnect with CPU BWMONs
- QuP with UART
- SMMUs
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- CDSP, ADSP with SMP2P, Fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- TSENS
- PCIe

Series dependency:

- Series is based on next-20260921
- USB binding : https://lore.kernel.org/lkml/20260811160835.2968717-1-mojha@qti.qualcomm.com/   (Reviewed)
- CDSP driver data and its binding: https://lore.kernel.org/all/20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com/   (Reviewed)
- For Modem binding - https://lore.kernel.org/lkml/20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com/     (Reviewed)
- Boot up dependency : https://lore.kernel.org/all/20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com/  (In Review)

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Mukesh Ojha (4):
      dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU compatibles
      arm64: dts: qcom: hawi: Add header file for IPCC physical client IDs
      arm64: dts: qcom: Introduce Hawi SoC
      arm64: dts: qcom: hawi: Add base MTP board

 Documentation/devicetree/bindings/arm/cpus.yaml |    3 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/hawi-ipcc.h            |   61 +
 arch/arm64/boot/dts/qcom/hawi-mtp.dts           | 1000 ++++
 arch/arm64/boot/dts/qcom/hawi.dtsi              | 6847 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0104-hawi.dtsi      |  103 +
 6 files changed, 8015 insertions(+)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-hawi-dt-post-a1c9f4d03e8b
prerequisite-change-id: 20260910-rsc_read-27d689e37cb5:v2
prerequisite-patch-id: 76c7708564fe28e2b9bfa7037fede190059efdcd
prerequisite-patch-id: abfa9de0466722476fdd75d14ec75a362d6dbd27
prerequisite-message-id: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
prerequisite-patch-id: 8e93d1f80fb9570d7e77b9a1bed4c66957a9584b
prerequisite-patch-id: 3247ca257cbfefdd381431b6cc957ac1de9535c2
prerequisite-patch-id: d0da917632a377ad57777719217a3a833885e316
prerequisite-message-id: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
prerequisite-patch-id: ccb139f7eee9b87fb8d03720b846a01534960fe2
prerequisite-patch-id: b62a4d66221428ef7a141a9b3ff38fb087d6a092
prerequisite-message-id: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
prerequisite-patch-id: d29faa9849aa39f544b8959a02f1f45e9aeda5e7

Best regards,
--  
-Mukesh Ojha

