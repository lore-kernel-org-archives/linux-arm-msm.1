Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432704EF155
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974000; cv=none; b=r8Tq1scD1HcegskAHg+LgiDVDqAdb2ULHZcBIUSk1sqeoV8ZY7AlVOSexWsL9bmbdRjMaUsNYUcFtOTETNdVMFGoz8NVBRVLC66LsdSVXOiQkjpA9O5Jg6k0atgYzAAX5N4GbMp/L4soN09VzGIRbiSYHL2Oa6MCpWW+Sf7kG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974000; c=relaxed/simple;
	bh=cQdvvOL0HPwR95jC9VzmtLBKVAu5cXVRhXP1lbva3gk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qxOhEi9vkwxp9FCcQgjCM1m5HBzC6ayNcz6kws2e98RR9fnmAwsSCUoJnI+7qeTNFB1CGvzgndkxbkHH9zi1l4RvCcYQngiRCpdSI0t99kkPauXbljm6hwSWWI8CMQks2uMww/d8oyw1iYaC+51Kc9GoSHNkW6/YCstfMmpx7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYjVZY9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQdMYSg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYjVZY9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQdMYSg7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8HYVQ3017842
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rZRV0H3Eo7IaIesmvx47nA
	Ej+mGzXT0oWjI9d7BBs5E=; b=AYjVZY9ctSIot+PTVK7P/rgFWkTUXcqiDrcYRq
	zlTXQu8toOl/+2GR/jYqm2iosyYbfh8plyv1zbKN3ggGCms35osf2XKiLSExH1p0
	IC/RczaabdNyyaUpx6/QAc/C7WFzB9ARjyB00LRc6KpYgH1F6Pi/jYO0iebHngxG
	aCKV108ceKINBPqw72gWtnOex7JBQ9s0Y9xCAzFWK4Cd3YCAhoAFTI5H3M10WcqL
	MVbIVm0iF2KI8cMqfPzOigo7badAVTINbk0exTb+rO+Vzllegesz9IAXSgvGrJIj
	DFjiuB9JYtpSzlAg85ZsCvddl+gkZTV+0tdB/bQUhKQSAzKQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3ud3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5f7fe8ef1so2045534a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791973994; x=1792578794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rZRV0H3Eo7IaIesmvx47nAEj+mGzXT0oWjI9d7BBs5E=;
        b=QQdMYSg7SCLZsYxKvNLZaWLRjpEdG9M4ZOuDqlZ2ZJFhGSL3bHbGDlB6pVivIPuoZh
         0J5+eTKtnHERB3ARMrVVfjASUrJIhtgjpOa8ishUVjNvtqCk7xLt3SvKSwUwpxtOEEya
         ga9oezl75jxy36XNeoHwwtn5jOLcdw7BextiVv8m6loZd+RznsfdmrMHOSa13s9oF+io
         ntCExBWMjnYdjPp3Z5uPmOg+fYl35OpDVRIkZwsdibJx0+4WjeEtjUk2QC6WjxPLJYpP
         D269P8ua0cYPyCL0szmQN5KL7oo0ofAqIyGAneUGH4aFIQEMIlZIZ89snBCREJP59naY
         dRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973994; x=1792578794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rZRV0H3Eo7IaIesmvx47nAEj+mGzXT0oWjI9d7BBs5E=;
        b=c7EuoK2WjgIwOcUc8+MPMC0jg3hvGkk2EEtPYbBe969a46Dj4PduUWTswrUEA8Kcf+
         b9R41QMOKPfURsWKPtOm8+VyJpOvszmJn+SFeWgOEfhp3rQ95Jr/tCiC0S2lrvNySfhC
         c43yeVs9qUVNpY1EYQUlhqi7Z9mrncuiLFoUUr7B1wFTZTJW1ZZ49Mj5KiK40qYYG3SE
         YdUlRnTcmTWMXjz2TNH3gRMlyIDLvC6UF/dUg/VPrl9aQz7uISBBCTXpd7sGy4NIWJRg
         MPCBxztgLtnvldytC74ifQ/ZUCa2FeYw/4CbhLccx0uxW6E9RsrAwXLnj6ZiO7qmXxrX
         ELOg==
X-Gm-Message-State: AFq9FYJ7UOfNFkfN8BL4cllzUcEGiaF5/pUmSZ3Q4OISrGutz2Vp4U05
	j4OfP4x+8sSGZ+WHxfq15/TKZkVjGqzwi2Z/Wn9gZgBFDhBUGV+OtowxTVJMKo8+JBvSTBizvh6
	RjdLF36KxwUrqYfnVukhAzRbkgmvd6FIHZffHPpgZV/a/F9uIrrprVv+MG+pZp3sJn7qITU0s2N
	pI
X-Gm-Gg: AYBFou2HNs+bImfOOu1R9VFujhgLYgVy7maAseiJFHVv8+Run7a9DnP2uE+3ZTVCtmT
	h5phIkWgoRuOAs7gUrbYpGWgSfwBQu1pS2g2k04sjM9rhm2pMj11b7H2Yx/mOI1q1RuuASFTa6s
	XcuPwfXmkJOipr9ymolcdJMXelyW3Pd6rFH1sTEO0nqAEMRh+NfYd6TOlzSK9LBBTlVQCVhqYrY
	7chFzFlBgIo9y1nl2B+lOVjX4cgwHw39H4zeT8bye1W9UktJ7ygtQfT76DwR9NotFgK4T3iFDeK
	SjIFM8qnQN6XFZEPzs8e89OuniNzlNpp+0vGcdrOEdFO7NbZA4xNqatVkNO8OTXXwGW3sYJE6Lk
	shE9Nu9igoCmNMH217KM=
X-Received: by 2002:a05:6a20:eec4:20b0:3e1:bb25:126b with SMTP id adf61e73a8af0-3e1bb2515f5mr3612539637.36.1791973993437;
        Wed, 14 Oct 2026 03:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:eec4:20b0:3e1:bb25:126b with SMTP id adf61e73a8af0-3e1bb2515f5mr3612517637.36.1791973992923;
        Wed, 14 Oct 2026 03:33:12 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:10 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Wed, 14 Oct 2026 16:01:57 +0530
Message-Id: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1az2oC/22Nyw6CMBREf8V0bUl7qzxc+R+GEGyLXCO09gLRE
 P7dgnHnZpKTzMyZGdmAlthpN7NgJyR0fQTY75hu6/5mOZrIDASkopBH7rtcSFEh6IpG710YuBI
 pHECqDLRiceiDbfC1nV7KL9N4vVs9rE9ro0UaXHhv1kmuvZ8g/yeYJBfcWKVMlje1KczZESXPs
 X5o13VJDFYuy/IBu07R3c0AAAA=
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=2699;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=cQdvvOL0HPwR95jC9VzmtLBKVAu5cXVRhXP1lbva3gk=;
 b=gMSEL65jLFuH27jgq75H4O+ARk/gSz01YO/rdffbNmGQGLRSxlLP2Z+2HxrWJLnpvZIlLrswd
 Fxa+2OXGgqvD9K+NF+I1j703v8B9MdBbRRROWj8JwvSm57L/meoXYYM
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf5a6a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pFWVvVhNtIjcWoVgkSgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: rsgd2LqSfLHS7HOqPnARblSM7MUvTKga
X-Proofpoint-ORIG-GUID: rsgd2LqSfLHS7HOqPnARblSM7MUvTKga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX3Y8RgcBjapyr
 RtY9r/ggX3D9n01EEnNRT20kwgQdLdesBZNZvMIY6ngoTdPgFNAbokgYdTO2kQ5wIvCTODNe2PH
 vGKB23R2DOkQXmY6/oHHTcOzyIWXHOimyErhAsySE8FoT7eBkYrySGKITyCp8IO3e0+2T8NMB1K
 RglfJFg1W14D2gwOEDePwSPDz8GoOw00VcauX0Halw7XvBa+1fIx9Q0GvoKZwI452MhJB8fx8E2
 Y6YYVSR7fAf2sjRuR0n0vfF9KnsZMKQZlXlkZTis7FCMRPZN0oru3TWlwxJp65xoQ09xRsNtRCi
 uM6vJLg7k1hYu7mfkYD5n5mfcHDvNwPUh96Q6FfcejWtUKXMHxGov7KakXvycaaLfybWs1cW9aA
 MPdBfDwZWyQVx/lz1u/JXsGferTMHHdPvGgr4zik9X+mOxtIrEq0SXVig9qwvYmbO0Eso4pjSEW
 dRBtBjAQakVREqJkJ/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX2EpE5z2XRBtB
 he8ISGDul7kv0imci8GD2Joqqk5UgFbV1ryQ+GdilBZYWTJb5dsuAeqLGIgXdBnqqUX8LycK6T6
 4AVLFoBqm2W1b9g/BwuSYHmD/9Quu/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 drops GPIO support from the MFD driver, as the GPIOs have fixed
functions and don't need SW configurations

Patch 5 adds PM8010 support in the MFD driver

Patch 6 updates documentation to make interrupt configuration optional

Patch 7 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Simplified of_device_is_compatible() call in mode support patch as
  suggested by sashiko.
- Added a change to drop GPIO support in MFD driver as suggested by Konrad.
- Replaced match_data parsing in probe in PM8010 MFD support patch with enum
  identifier and switch() statement as suggested by Lee.
- Moved interrupt configuration from probe into separate function in missing
  interrupt support patch as suggested by Lee.
- Added MFD cells for no-IRQ variants of PM8008/PM8010 and updated probe to
  use them in missing interrupt support patch as suggested by sashiko.
- Collected Rob's Acked-by tags on binding changes and Oleg's Tested-by tags
  on regulator driver changes (not on MFD changes since some significant
  changes are made in them now).
- Link to v1: https://patch.msgid.link/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com

---
Dhruvin Rajpura (1):
      regulator: qcom-pm8008: Add PM8010 mode support

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 165 +++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 184 ++++++++++++++++++---
 3 files changed, 289 insertions(+), 70 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

