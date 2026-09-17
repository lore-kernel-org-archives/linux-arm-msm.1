Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55224275870
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611375; cv=none; b=dTQepmtgZoNlzLdI0vAReH3QjfB1z6cdpPYctVVmtJTHVRolxQYWwIbEGW5Rnx/8o+Kaajc2RtRmi6qAuW7Gs3gL7pLRZvLJdH71USjO+fmq8GLaZFXrXlEMu5hZtQqHiTg0mxSxk3pmeicktH0kaElBZUT6dx0cpyhA3ZI1x2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611375; c=relaxed/simple;
	bh=dzSHSg0tnYOpMKohtDQniZjREcPmcvX1UrDWM0kbu3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATfsxJ/Rf7osGV/EeKD0XlxXskDVJ+Rjb3PKKjlAhWG56GyW2zrPFQnd3ciooxLTZE0KJTg6xi2R3GvtaZ3QoJ8P3PD1u/rQnsHaYt3R4QDU19GU8OsRBm2QGbwuIFdZMkfJ5khqNt8Qzzp732dp7JhuCDY+wIr03bUl5eSsJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtwHu1lA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2m/J6di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtwHu1lA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2m/J6di"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GN6d0n2602245
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qmBBtsE3gOQe48Sv12+iXY
	x65A6NntNxZLh/Y6z9vBM=; b=mtwHu1lAK0dA0gogAIrj+W7dOfbt9yiAucZeW/
	4AJQKBOk/Fho5rJdsLOn8z/+lEJTQOs7mXcmiP5BM4vWa92CFiS8PnEoEXrVgE/l
	jDR1TyYoqeZouDsGZY2FXtzWAHhzWH+PcOm9+ST0ebrpMM9fmCNeq3zDhuKKeDdi
	pFdPWqbexNtU1HMloqIoz9a3Fe4zstXd4iu/R7YDtmZQDDInPlH4JAvulc2KeKvr
	mCognNM3zdgSXlo0z5WlEXHWGIfQteO3BAI6iEuqjAdphPck6oB1CphgFHYQZeJH
	LGf6u389aNDmk4IPwUrKJBJKFMz7aKLfqSS78NmRsXha3bpw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb31yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:16:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc489e7a701so483344a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 19:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611371; x=1790216171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qmBBtsE3gOQe48Sv12+iXYx65A6NntNxZLh/Y6z9vBM=;
        b=K2m/J6diu9wo5IG7OHXWbGSEyrWC8SfuGH0gNHMJm2buXYbHndcuKHEyYy7d9ePAPa
         dP8oCqIMoGk0giYY/6Gbqmk8YNLxlpBtSgDOgBNjvbUQXPiDxza4f6Pl96e5fh03Wbl0
         MPlzhO4XFUnmVACZMax2249HBYMLYklv0ISnMGiPeZ4j6D14ph2+HA9VGMFT1qFHIQ1G
         j4l6AZ1D+3a2akSs75lfO5TItbiqqxnLjMxwHFl26yaiJ0epx9RBXdo9NNT3cqMc6SVu
         Td3/jTsH4RXj272iwFW8jNTgAiXDCsKqi3HFbgSGElOWnNgD1KQ/L85eQJkIDjUgNsHA
         Vp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611371; x=1790216171;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qmBBtsE3gOQe48Sv12+iXYx65A6NntNxZLh/Y6z9vBM=;
        b=0l/dtGCdTbyXJkmhcKB6Yzh1VmQOqtgdqNPDYGNUGjgo8CiLe0gDzTntWRDKVqlVWI
         EfijWxCBiYoArpr0Gm1+UOYmb7UagkDwspCZ3ZvbrRocFE8EjPnnao0uiDH4mgvSIvE1
         Afwc38dzoxCe8IISXc0Ld21lwfU0c1NkfOdYEOQtNANrs2YuJW7oUeqxI5+1BjsjVUDZ
         Xf2qfIwYNJwCbUwu4UqX1R1kDMh7eRZK2VTDh+3qLXCQliNCy3w7w8KP+gVlf55cGtpz
         tnnUhZglj6lmH0oQkROGGZsLqCISbPjX8/O23QHQxI4XvykneD1NJ/PiHn5jpDWjYyrJ
         9fgw==
X-Forwarded-Encrypted: i=1; AKwUvBxcw0rh6rVS9kDBzzvCRhNTMw6TdOQQ3E64VIXxAluBdhhQSijNQm5h49xynTY+stvowPWyxGmiMsSr2W23@vger.kernel.org
X-Gm-Message-State: AFuF++kvGzjftILZ8JFhfCSEFSNZF5R2k33oEYUXZwsGOxftoPoUfxEA
	wZd4NwLrRUL7xBUfa9LBwoVFf5PgyMbbXQQC0Kycd04xUHt8Ol+uOMvYajc3IwZpYLpgJ2z59CC
	nJUW/s0s3Y2r8n9MqorJibmQd/bjYGamCoJra0UFuzMbOphGxkLnZtOXz31wmkTzNrOC4Cq4wel
	ok
X-Gm-Gg: AYBFou1rdhzAU9TVY9gB+NaSIjExQ8i+vOfDE5dyKriKJGNoe4qBNkKVTLF28sB4Z1V
	TRaVcCSINe7CYc5+5a9Gdnqydm7OcbRJodbbShgu6V7WbkAXyLT6v3FpWDhM1O9+5n6xQctL2M0
	ay0lF1nVQsNcl7cE/DCEsnIijhyKOTO1g1NtnRAp1RxPi5DKEd60hsI/ojUKIaIptYFJxS3Safn
	9EjZa2Vuh601zpI5taWGS/9xeHJtdbyDK5y8qMwOolgOOd2AzopPmJofxaQeY/758dm+HnVpTyS
	9deT9QCKpcGDZvdV5ND5RL1CJy9txKYimeHhwrtyYfmMRAFJdAy9ZIhsou6KD3GQ7iEijM1pPzC
	XzOHnncnEQIqgONZks0pdzHaKwsdNDiNrMkmB
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10500900a91.20.1789611371081;
        Wed, 16 Sep 2026 19:16:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8d:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e1e48a200mr10500846a91.20.1789611370615;
        Wed, 16 Sep 2026 19:16:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:10 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Thu, 17 Sep 2026 07:45:31 +0530
Message-Id: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENNq2oC/22NQQ6DIBREr2L+uhjABENXvUdjDAJW2irKV9LGe
 Pei7bKbSWYyM28FtMFZhHO2QrDRofNDMsUpA92p4WaJM8kDp1xQyUqijKmxc4+galzG0YeZcMp
 KwRolW6YgDcdgW/c6Tq8QC6i+GS7N3ep5f9tbncPZh/dBjuzo/iD0HyRyQklrDGdcaiGFvnjEf
 FrUU/u+z5NAtW3bB46M74zRAAAA
X-Change-ID: 20260917-add_shikra_support-201761ba9f1a
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2967;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dzSHSg0tnYOpMKohtDQniZjREcPmcvX1UrDWM0kbu3c=;
 b=AxnchDvZFo/t9BYXU7cVxFtxJK51uFZ3lCpjZnnicjxOZXdZeq+30HIJbXfJ8PHGrKzVY09fd
 M9UmTwFlo3LCyOiIULdQS7ayhFXPGJwV/NJOpOKrA2r4RSeLcy2xihK
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aab4d6b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=doChDUTQ96gpDzZ_M_AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: -J4l3CK0TM8Z96A1NrBBBDDYpqPu7tRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX3Aygb2hcz2Ov
 rzc0hVauL92dwlFVCPMP4m1cnyS9Qxg3OQV4pVrUcCBIXjvMQnabKbFm9X4zYJ9XGTagVJuIIyX
 /6JXFHsx6aNcXOO0Dv2wyIWfGVaLZF2MbNgxWgW9qPzBEfF3240uZMNggXswHUm2EHzfBfQa9Fb
 reLhirM7qgsydbC4VePWz34vYenh+5U/t2CPj2K6Suhgw54aGcWEoibscae9MEF+gr+BojHs/ra
 uNzjB4sigJbxbQ/7r6h/VHar9EUnqSp0HwKaYBEtVGpCyE1Z0Usb6eHsR+T944tF1CinGoJiJbf
 939Wp4Exn84wADpxU/BohQ0MV82+cgJvpvl+Qm0BKLSlpkXt5TjHbDEsE+2u3ISdH2i6ncWchu7
 KigHs6D+Fo/SuaYf17C0EPtO7jDq68o2Pd0IrKzzfIrThjiOWGwCC8HpgnK+hD9P9mzDmiNpl5g
 3uNu4mh+zf+QJSBggPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX+1mJFzJVjfht
 aZXdW/NR/8dYqZ/bcEUnXgDKh+pZe/gQ0iQbYzUYTfCGnIG1uehSKkUZZPnCWxYTmAMsWCzZjfJ
 s6xMJDDdfTAAszwKA9UUBxNc+ZiFf3A=
X-Proofpoint-ORIG-GUID: -J4l3CK0TM8Z96A1NrBBBDDYpqPu7tRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

This series adds support for the Qualcomm Shikra audio platform and
extends VA macro functionality to support SoundWire microphone inputs.

The first part of the series introduces new DT bindings and driver
updates required for LPASS codec version 4.1 used on Shikra, including
RX and VA macro support, version detection enhancements, and associated
register programming changes.

The final patch adds support for routing VA decimators from SoundWire
microphone (SMIC) inputs in addition to existing DMIC sources, allowing
audio capture through SoundWire-connected microphones.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone mux support

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  17 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  17 +
 sound/soc/codecs/lpass-macro-common.h              |   5 +
 sound/soc/codecs/lpass-rx-macro.c                  |  14 +
 sound/soc/codecs/lpass-va-macro.c                  | 366 ++++++++++++++++++++-
 5 files changed, 403 insertions(+), 16 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-add_shikra_support-201761ba9f1a

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

