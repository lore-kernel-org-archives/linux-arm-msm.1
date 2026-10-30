Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341269;
	b=sZ/Yxmpfh32WH5Mol8pdFJ7TihhBdMm1HUh4bLgUFmaCdqqJ77vvABxdq1Dcp95YYCgd
	 43LH+SfaLg8AhChBm4KGEv5gDgsdceQBlEWqh0TMqjCsuSbngbnKbF6lawK6jvmtbEoGu
	 tul9qm245SsWV77Iq0wOmoAfXvHJhEsfMacl/o8QwjEks7FrhFuWd48fOI78ctY3Zy2bf
	 OSNSmYWDPeIE53We78spIR6UQYG2LNdbBa2zIRzCEil4Mxq6g4ozHq1k6n1MI7lafI7qD
	 NwvRDVxtQOIJfkUU83XkF08Oh0n4ZBaSjG/nIlrG0/eVul28BIqzgKoinEaFKeOs5TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
	b=4ZwQCHeaAisUp24xPqc2SgTe5aB9YnjTG/BiyzEZmc/G/zGfWJT9vAU60pK15+ire/Uy
	 e3oClul40QBgtxtlEGDHeqx329BC2GTnNdkxkvcXLhnWBtbJtCqVWo1f3bctWU999e0uk
	 0tQfkunfsNE9FAem3R6tJnK0JVl+8J547h1zsAndXk0rBdiuZT3zDZOZPZzkLxsYoBUam
	 U9a3sRzTdTqkTkdlYURhddxqxAvUUuX6Qof2G34uGNk6dgD4nGbuPaohAjmxhx4dc2lPV
	 FY3TrOIb2D/uNWRPRRpi4pHMo5sfC4zZ9SLof6apaNo6AqOQ7P9XdHYxMREHlC8SnZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGeEzkxv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98B5606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGeEzkxv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7dB725407
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2jPH5IEEnZfHp4FyLuqzT4
	LyHDZSoEvCM0gwfPSo7F8=; b=hJwbNfE4B0B72oAOUG6oyM61n++VLVW3g0Qp4A
	efHXAzMBrqyzJb9Ob/thuaxdVqZTvDGp/inImzHf+PBAubupkCjLz9JrELnF6xT8
	0CvlMEsl+rMrvUhz7TTvzvUBst8fSEGQtKokv2kiGgeuE/79JyjR/+2ptBx2xaZO
	PNedvc3YVuC9nTbbPY3RquQ7oMhMmKBWO7uSq4Vx4T0+wyv6r0/ekAUxSxa9Q4ig
	+0kgr9kIrYtRC4oO/hS7wiUkdgcSdQU9dOpQIOHdqHYnm6vtFCKWUIze8WZpY5jz
	BX32Nyy/G7QbYEzPIfVmLsl5zp4pHs+Y2tlgZIYuOVpGg78w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phg4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so426854b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341267; x=1793946067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=YGeEzkxvVm2682m1fGOvPyt6ojufEnovBypYMWlrFzRjscYQ4xoseW0iQ3Hbdc6mqH
         qMBGs9JNHeaJIgtKvkjqMWXHxld0RSMqoTWx7ez7zrj0+ednQTULwMKRZ1/96AHixUfT
         R9jI35ePsjgmgwbGqmgrvpUD4H80JOLpHw+CWfNfKKYAMW5mQ5s4UT1PHitw9N1M9lyN
         BXP0WQRBwDuQ9arhG891oAoJnTsAZMxle9jQ3kKz5XtqGiexWk6Fjkni8EsCRBs7V93d
         ntDA859JORhUFic6/5mIkD94q6ld+65eA/LKMnURZsluZbdLs1kFIf/CS6j/uuMq/Tiq
         dpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341267; x=1793946067;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=XRhBn9reS/XS8p69cIUJwi0AN5IQn6yQl+UWCykAgdx6BEz/KhyQENFhT9AC73+n26
         INnZJVieG+PB6CPlCJxACdAfU6fA+0kYeEgxq3b6I1gmRekr9UI849x3eX5NDYcm7k+6
         WAhhfCz46syt3ljuE7rFH/D8FKdsMI/sWbI9y45p0x3BebBqYK0mbypyZnExAV8Agr5B
         l9dcQ32//iAqQzSqrgrB228UZjQZ5+ZSIiKSWyxIyIEHaiFJ9fRPy8sPsdOdzsLhyJlC
         buuW03qZDDSPrPJVBZVZZcMSGu9S1QbQDqCv1pwNpEuGLUljZ0SLmsBfKSd6Gfvz8GM3
         6PAg==
X-Gm-Message-State: AFq9FYLcJIedPVbfwhWq2CPfgApzt4rXBKDgL8c5GGzakSLb1OJskY5i
	ntQyANGxsBbskvUhDojCjGi/jLnWKxc6C0GA2yjl+c2gKDVzdxkuFSA8rqI+G09vqtE4avF8wiG
	ABDp4wVq1jd9I4CPhOV6+xjeTTD3TwiFTYY+Ed0Vy5sOVqCvPg3f5DM0pOteUfAvYZQSq
X-Gm-Gg: AYBFou12IWiRqwIW6lfvDPrSQ8u61MzzGGfdrHMpYaXFGJ9lgiDb1oFhZOvdvHAEF5C
	hrCPjvsK+/bTmg0VLYUhrgYK7l7X3hgeXUWu6JqX6L/tSkQDTwG6SFNJG3hjDcu8hM1hD0eVWxp
	OtAU3Q93Z+MqUYRS7rPSd1lKWoELdvGEUQNliYl0aVVUhwUwVl6obUtCcJg68TGb1sAvWGJ6SS2
	aWjvKCfUORoXYsR2ShMdoD2KGVd79OeWzJe5FRNitfbLGCORQgR/90FgtJOXDx73gRHy4srvYm7
	7f5CMpaaSUs3UBOCxYMfXSQuMdohj1+JlUjzJBmNVYJgEkftH+062u/84yv1eijRaHRCmvaAj+I
	Y8AWSE6hIRp9HkfNCrXOukNpAYlIVB3fYuwqnTah1J6KeN5naG3Fvxlf/RdRDKrwzuFo=
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373597637.20.1793341267123;
        Thu, 29 Oct 2026 23:21:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373539637.20.1793341265757;
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 30 Oct 2026 11:50:48 +0530
Message-Id: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEA35GoC/22NXw+CIBRHv0rjORxc/IM99T1acwqYtBQDZTXnd
 w9s9eTL3c72u+csyCmrlUOnw4Ks8tppMwRgxwMSXT3cFNYyMAICOSlphseeE0oqDaJy8zgaO2F
 GckiBsgIEQ+FxtKrVr016uX7Zzc1diSma4qLTbjL2vVU9jbtfgO8FPMUES8WYLHhby1KejXPJc
 64fwvR9Eg6KHQ9/EyU03TVBMDWszCQ0rM1zvmNa1/UDu3uswhcBAAA=
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=3226;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3NpmJ00rnG8DyBULcr5JZZHRbARR1VK7xLOxGL+7IFA=;
 b=/vJGQOS5qpLtuieD0HdMKPT5yZCZYaakmgVb/mxMetHXtqSQInFlAwSct2xAEuf++Cl+6XLKP
 Sikm8WVVrv3B5IynI3PwMLOI/0dI2fR+vsdoAno4MVqoAFyk46bQP4B
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXwF5LYbszsJS8
 8athkBVmhoaA1EzB1gUSleTtQsuD9MO32PBo1zuRNPeLKMvSCqNRgF4pcnT6TnaBHPk73GFCJ1O
 srLw7JSxDZ9hF+gqeztnxDZkPl+nQkEUI0cJvI9D/7J7WG6EerZ15N5bFKiK5XSA7FZNelbwgox
 +09bOqbLNlAqNBfHDuNzXj7zms1adXq3jMCEWoREHy9R3Z1c9lqn/RZm343eIY79vH7dqIhz2HG
 zJJQFvqFD4L5aayrWs1aGHKDyv6IGlfEFLbXqiR/64su1YOMx7VW2NiDosd1V61ym1AiZnmYE/q
 mrt843RIHBvW+imul2J4ZEF4esVSjCn+B4Ua+Xlw4IdhN/byPeJYT6U7VVckGxuJGlTqa0oyjoA
 Ee0coLGia9JU+puUE35nih7jfh5VcOtNsNpfDFxNt15V4/sxoqcsM18tkhbq5ZzweSOTCd9gFz8
 YUs8Z32z0OVgwyn99pA==
X-Proofpoint-ORIG-GUID: V-zslFRUQZQFwNI7vsyKXIkcB8a-_MbF
X-Proofpoint-GUID: V-zslFRUQZQFwNI7vsyKXIkcB8a-_MbF
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae43753 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jA20YhC1vE42qShcUG8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX/YqHtqygWC+K
 XgKmAmoLkt7XN23DrU8RaM8GvrZphFd543PfKvwsMx0T/L6npY0bSAx5ty+jmC0Gj11Up0Tv9Z8
 tmmKdpiSxDwCvwG5DEn05p6YqBSYyY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

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
Changes in v3:
- Updated commit message of mode support patch and added regulator ops in match
  data as suggested by Guru.
- Updated pm8010_regulator_get_mode() to read LDO_MODE_CTL1_REG instead of
  LDO_STATUS1_REG as suggested by Sashiko.
- Added NULL check for of_device_get_match_data() as suggested by Sashiko and
  updated TYPE_PM8008 from 0 to 1 to avoid confusion with this function
  returning 0.
- Link to v2: https://patch.msgid.link/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com

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
      regulator: pm8008: Add mode voting support for PM8010

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 172 ++++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 183 ++++++++++++++++++---
 3 files changed, 295 insertions(+), 70 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

