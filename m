Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F64D9F97
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352685; cv=none; b=HEY9aH089FPNmxIQr/C7484Oz/86VP0j6ZOMx4y4+m/Cikal3lyxHsctJ46ijemkmI2giPQ2x7BmadMPXKbHjz2ad+nlebupz0B4Zu5TL5q4Co9mf5StLTgnVX9mqsjRBn9kg222HP4xp8zO51ZL6bnzKkKTjEjfJUaD7fGlqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352685; c=relaxed/simple;
	bh=F/iXP+JEwA9EqSDT0Nx7e8u4H23peONoXgJq6hUIwXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMj65/KCtGEkfst9mv+WwdWIXe3+fdEqGBkJodRC8Vp7U4b+Fa+TQCET2Kkv4ZvDbg1EQqq/trJxfZDFZhY6Kdzwf5aDnzXhswC7w1WUjkWchcGi3zYG0k8QmpsdjbVYfrQdjB0rlfBWaRwUtVhCZy9Imc4Duaq4ouuX+LYwiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6QBTTPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQ34gC6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6QBTTPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQ34gC6y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0Ijq1001989
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomX
	DQkZMf+A=; b=H6QBTTPxTtU7MVj/xJvc1Oe9/O/wJ5RTAKLBbXPlRy0wNKLjDat
	Kk48gFVHpw7Bxj5FMBE8eVFHIoam8bQgNXOLiUjec+6tfaMyLKJNH+vxPOGqbSCe
	e077FnBXVRIR0mgEQqmwnCw00SsfeFsI0cU4k/UGCTSjdrjSgw+sCqpiWILbTPad
	ix0TpAmu+hxRxMWTWxea06y7lctEFASsjmVqfu6uSGUDeRxfvNeHk6o7sZACjtUk
	aNRL8BPRea7S7KUvWQiwMDRYqi1jwOOvpLmlUmbrgSQk2bDS3kkuewfJBooE/NfQ
	yWkQVTiCo4FRI3j8+FhwNvzh0LMGGoWKHBw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e91db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9909eeeaso89010241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352681; x=1790957481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomXDQkZMf+A=;
        b=UQ34gC6yFCzNUvx7UaHLBKXcdnmYSS0z+LRpDDLSByjA/g6skJ4Nye9V8hDiVr61nw
         XDFqDPiAAu7JJfG2/05RSuFYDNWtfspAUJb9SxGKWinZbSRTsOkLzzDJQfeXuREZ80FX
         lO1rV84s9M5NTAg2fQof508a+aRLwOErPF/VMq3Qqordu/yeXzywL4Xa65PkjcKkVHcy
         9VK+YmreDSI5S+3BmJtNUPEVqlVspDsvXz7MCb1OzWVejAq571dG6AWcMYccNCBFw+lp
         5pGVNZ12QntycyO/SAtEJ1XhlkPxU6Bm0ToiY4MaIMnO35IcdQucppnZOnxyxpT7EGLi
         pcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352681; x=1790957481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomXDQkZMf+A=;
        b=GGclup3hdWoGSvWmPqmRo3JeN+h+AexZxazRtF9O3d2ZNe76k1IyqokbUHuFmpCc+A
         U+yiTnAk313P7fSsNNU/tSNRVvO+VGBCqkGqyVx9ccbxQbdUQ8Iezofh543En3X4bXiG
         hVCCR5NJLVwQPTgVNsJrkpNYgVoJu5Gk2zxk8xiqZ76kPmbYkYL4fofRK6R4qqhvyeS0
         R1WGRYBGELQRPM/i564Fceqofy8oNGRsHX6dGqVpaCtZAISIBwLLWRcOVEAOI6tcVfA3
         m/hx1nZ6d4Jy8r98cpCZrn/tFBmnuPrLTfHXD86TBIMufIkVJ8rr+29Slj+ML8afVYDg
         InXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2NsaEuVGKjZIvoT8vOUPcfZaZl3Y5MnnhMLs0DvwdHAXw+aUbFgpZXxIdDq2wznJ8XVkKxMg1wX9C6yE+@vger.kernel.org
X-Gm-Message-State: AFuF++lt1ztO4lFdvHoAR0tPYqb06cclOOfit0FbFFXVLzsstCytuzSC
	gvgqwNbTn9nmKp1zdOuuOMpLzxxV0hqw/J362khMvZdIof5wtF5xwpxxV9HWIUgR4aJO/MiVOux
	YWb4NI4fpDpzJazbxXRmlMwBXdEcaQanlNEmHQbPBLygwyc0pXerQAeKSZYgvGjElHGZk
X-Gm-Gg: AYBFou1RYg5J06othv15id2ospfhy1zV5zBHjcFps9Te6uyVG1b+XqL/01UZEWxE2dm
	3gEe8YNBR6KcjKWMyEvPxAxBft5MyTeD/DxyPwUDUT9F38/uB9v+lAxxXmtX2rhHQqEtFjvIemK
	bP65a9zc9hXzXXUI3lByXL3ITog/X8JG6zC2UbrXrzEHc4snEXilyoHCZUG0xSVB/PjsX1xJKJT
	5s1zv/DIa9KsP1022uRReyGjtOg1CB4YOMvZmJUQzs9tutPcPxtF+PJQvEjRudt+r756VQHsr0C
	V7EZS8JvQLlrJ5v6Oq0DiF9UwrFGaGdmDl4WSH+wiy6uvz8N0guWwmtmDE8dFcca6HfSAHOyJp4
	xNmd8J/9YtdtJ
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr2742524137.13.1790352681250;
        Fri, 25 Sep 2026 09:11:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr2742498137.13.1790352680681;
        Fri, 25 Sep 2026 09:11:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 0/7] ASoC: Qualcomm Tambora (WCD9378) SDCA codec
Date: Fri, 25 Sep 2026 17:10:41 +0100
Message-ID: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX3NaZPkDC0xqX
 s/Hq1mpMGI1d9YlLm1xFS3p+BPBsd/9rjUCyde1aQCnkDZFwgZXbvRCBHC0l5GkblmlKz5Vynn+
 r+q2ZijTCMAiLuPZpHgw0gzQzo+HD5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX2yETnZmgLPWR
 g6rTS2WyqpHCadFvGGdUHej+3hlRH5IUNPGen8uYpmrEPDDzTCKwSjOepwfZOXcizV1lf1FmaAF
 Tpr9rPgWRDnM6fmCRYOp71NroFasJmQwc0+8Z3GFGtwje/asLNoJl1dfVtNHWOzCH3+Kxt41bjg
 FOswmVPcr3Jdl3vBlSCJ3ulkmjMt/9/1v/JrjNmc44YpNT93CT3z8eFuoUj3JGgVaddEQOlpzhs
 /65HS0PhM+OhdGsI5HNiRZkSvCYOrFBsk09V1Vpx7280zeU62NrYSKm9qlopUxJekL9xM6RAmz3
 oqhEcNWe0qUcw3MR25FbKEPj1hDarFpYK3TElcnGP9W5NqrqKQXoybfSQlr0mmfgpjAPhLU/fZe
 SoHU9o42NfGBgVmQOUZosZYNJPj13qKqYV90WFF0ZBp6VI1nOqI8b7tL6IYEmFBIGnEMz2AZDD+
 Vgs6pOCJS8Ph3Z9OKaw==
X-Proofpoint-GUID: Eg5-VjHe7n5uI1PoOQHY9Sxr0w7iPVNX
X-Proofpoint-ORIG-GUID: Eg5-VjHe7n5uI1PoOQHY9Sxr0w7iPVNX
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69d2a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hYdbEgFD419NYT9lHAoA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

Add support for the Qualcomm Tambora (WCD9378) headset codec in
SDCA-compliant mode over SoundWire. On ARM/DT platforms without
ACPI/DisCo firmware, the SDCA topology and SoundWire port properties
are supplied as static data through the codec driver.

Patches 1-5 extend the ASoC SDCA class framework so that a
class-based codec driver can be built on ARM/DT: allow builds
without ACPI, expose the SoundWire probe/remove library entry
points, add class_ops with a populate_function hook, and translate
sound-dai cells by entity index.

Patches 6-7 add the WCD9378 dt-binding and driver. The same
silicon can be fused for a mobile (non-SDCA) or an SDCA-compliant
mode; the two share the SoundWire class-ID compatible
(sdw20217011000) and are selected apart by the qcom,sdca-compliant
boolean property.

Tested with HPH playback and headset-mic capture on the Snapdragon
X2 Elite Glymur CRD and Lenovo T14s Gen7.

Jack detection is not wired up in this series.

Changes since v4 [1]:
 - ASoC: SDCA: add class_ops with populate_function -- callback
   now takes the SDCA function device instead of the parent
   sdw_slave (Charles).
 - Drop the v4 sdca_apply_default_control_classifiers() helper
   and set is_volatile / has_reset directly in the WCD9378 static
   control tables (Charles).
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- $ref
   dai-common.yaml# and switch to unevaluatedProperties
   (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: fix SU 35 Selector mode RO -> RW
   so the class-layer DAPM mux can drive it; keep SU 43/45
   cached; reduce reset_max_delay to 25ms; drop the
   sdw_slave_read_prop() call (Charles); lower-case hex literals.
 - Commit body / Kconfig help corrections across 1/7, 2/7 and
   7/7 (Mark, Sashiko).

Changes since v3 [2]:
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- drop the
   qcom,wcd9378c front compatible so the schema plays nicely with
   the SoundWire class-ID compatible; introduce a
   qcom,sdca-compliant boolean flag to select the SDCA fuse; drop
   the fake top-level wrapper node so the slave sits directly
   under the SoundWire controller; drop '|' from qcom,port-mapping
   description (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: gate probe on qcom,sdca-compliant.
 - set SDCA_NO_INTERRUPT correctly on controls, (Mark).

[1] https://lore.kernel.org/all/20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (7):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  105 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1080 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   51 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |    2 +
 14 files changed, 1531 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h


base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.53.0

