Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6874F4D03
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737573; cv=none; b=cfxMO7bHeZYtqQzJtRi1agKV/uktOL8Zu3/9AnVRnUUKUzeZjRRKGTHum8vbjvJ5xzXM2VxavDs/mQKtjF1O0XY8pdgmo+gYVFaas5aO5K3iva4Xk6DVKCAjItU0lpJuycRWG6oSSJP+8V3lC4gr+7clX2KCQ5TMOkpt6TQwAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737573; c=relaxed/simple;
	bh=E7xSFqkfXWjBwE2qgXNp1xHWqOsbleGRIC95heJTD58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPtLsile3QFFULfSbYg6/uCVapMKL5i4k6+F6l8My7ZUFG2WiKv+GnmIqDNaAOZecmhcu3vO12BMgYogoO5C6tCfpq/TD64Ve667JR3UaGTn6fNA1maMIYPDDysNiQe7DYq9y24FQTwBinlRCwV1kPAunHtkWjzT35TXlBona7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUQsl5bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dI3bG+G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUQsl5bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dI3bG+G7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICu2HS819870
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yicWu9NySxrVOc5shYeVRk0PMByyu7NiHY7
	V2FUnQbM=; b=jUQsl5boAOqle3e6o6Kxc6DkIpY6pF8xbiGD+87w16w9MDebzpp
	uI3wYKiHqiQacOztcAr6e4pBESb4BpfREXIHpfUyGZh1VkniNqCuXUmYi0qxWTeB
	tIzQMJvflm0IBU5aNxS3TP5Mi371Pz+yLMN3uBgGQxZqv97rjboxkW79KSIXfagj
	vwqrOOt0sjP38V0Kg/uyeTAFBN47ysibDj/96uy3pA2hWh2LVLwnhGB9qaQB5nLP
	1Zp1C45L06ufriWWhpDcTvbMCbiFCaYkzhR0P+DKVGV/LpJOYwO7PrtiCF3K1f4g
	ak/Zf5azFiUiAcZjwgFDmb6JAel1vvtY79Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt2vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:19:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so149616385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737569; x=1790342369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yicWu9NySxrVOc5shYeVRk0PMByyu7NiHY7V2FUnQbM=;
        b=dI3bG+G7mcC2f5EpKS8pVEGA12FiD5ghIcqsz/3dgmhhAp8hLHMQwmYaTnDMXBNSW6
         vlqy4CHquQiLZQ0x4z9h+a4ovJ6ql8fLnVlqJosuWXgGS8zVxBtgUySHJ09o7jQaYLbI
         OJDkqkwzxMMgYwEoVjl4Yc7reCu2LUu9I1oJodpVLlkxUcaGFfvpLuWGZW9g90gYqF8s
         DT8Pd8T/q7dUCZ1f/wQ2Uv0Je7payA6PleZ4r79/MQQ94d45IDm1IyaSI36THynkkdCv
         fU5w/n6Nuh+kKya2qhBmvPqSVAZghb5hi6TUe2Q54TCNqJ12YrlHFEUla7XKLIbCRnEn
         CQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737569; x=1790342369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yicWu9NySxrVOc5shYeVRk0PMByyu7NiHY7V2FUnQbM=;
        b=Ew/esF9I26wKyl5Cl9a93YhMfuoNY+MTYUfTTWULJv7ZcyajfQtKsl5UqzJqPHsqt5
         G9527JQfpQfGZnQgL9F+YOYKrXheNe0SwBRnnY4az+sx7B4Nk6uou5lXUrVeEU1rIq+g
         OzQ2Cbd9Zma5zpBsND86Mc0ByX2oPvMnpoxZOAI9OHkcO9mdu3yFUiq3uyk80lzlIQhp
         SZazQbzQ/uZmuSCZ6FSiZu1ovxg4bbhkWMtEIkRGPjAVLtwnongc/Po/sJTvEAlEpfIM
         YiRY6BmQwBtUmUn9wh03e/aGinrheJljQ4d9m4sExD63AnfIBsU4iQ+PBfZtaeg97jPn
         oSbA==
X-Forwarded-Encrypted: i=1; AKwUvBwDlgUPNjQW+Vi/VogMlnsiyxwG2+GjwNAuwgWHKVKwrFmZo1eAIimKBb2Sx6ygYGRvkdgH2EscbzSvtQmG@vger.kernel.org
X-Gm-Message-State: AFuF++nYv5QZtqcK29Kwir0C93hH/q+loQN0ygYVAUqaecmQJmA2/bW6
	ZxtoB12G1kaqcaLjTSZo2NQ8KQlHmbOOFfM29odGF3IeQNLZqaZpnNE8r0mPNIF8AMmHiJhCv+V
	Xny8t1qkgtvr39eqjiZeu8ZZL5PCXruDvYM9TJkV7Tpt7plwEg5x/lSA0ETop6Yrgoqza
X-Gm-Gg: AYBFou2iCUvWs2QLGc4Ab/FM0RoYhpwBxQIK6m50eKVFGsT+yvPucm+dGx74dS5HqRB
	KGBQvJIyrM+Zpmnwpiep52mI/ar21ajliEm4lvB5EDj57b7EryCf9AzjZg2TrNa93LqZzv52jL/
	tXSnvB/eQEsJYYNa912G6yC4G1Mso3khSCs8Ao6E0K4eLy10k6CMGo9qEw651MpAcjI1ReezNxZ
	UCdRbPhv9SdXGoef9utvjWuHjF61s58BBxoqZpuk86WWW5lsPrPmwQwEfSIFZz2/rPC4fIYdEEP
	5vGLe71OeaTPcFDa0ITxjJ9OuTUZgXRSAP8OBl2qKzCJVqGM44fWspPRdIaE0qKezJ5lhSpY8jW
	pMBmnH4CBtR8Crw==
X-Received: by 2002:a05:620a:6886:b0:93b:d79b:9a6b with SMTP id af79cd13be357-93bdcad865bmr320851885a.76.1789737568871;
        Fri, 18 Sep 2026 06:19:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:93b:d79b:9a6b with SMTP id af79cd13be357-93bdcad865bmr320844485a.76.1789737568132;
        Fri, 18 Sep 2026 06:19:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/8] ASoC: Qualcomm Tambora (WCD9378) SDCA codec
Date: Fri, 18 Sep 2026 14:19:05 +0100
Message-ID: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad3a61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eAt5nrnh09IFEUH19A4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfXwolzKwh0eDMc
 2mo2YDRAI2Q2Jg8Kh6k5U+eTUu7GX8bA8linl033SefgR16LJ4fWoM4N19e4rV0HcKEgEJyuBtA
 tXXYeEZ3EqVZf2OGjSS2JRPmMHmaG18zR6RlQ4mUDX23MeNkzwSYQ1RKrNh1iS/itbrOTqF+7/p
 qfx06O+SJd5aRaHpW2avBEs0tjgOrEDHWkrxxNVhBnVp7Io/r0Yb1n0SdJtNCrSUUzV3KoO0/YM
 dsIL9S5PuC911TDXk/gucUVq+udlnWbehV6APEmY9SCeGn8DRhkS88a1jq+yyOuIBzqvINNYiKU
 qACXG45P/UPB3upfjp/G4s/Zo8fl3u3eHRk9syE//iwoMz2pnqAe3VabyjoDSLjRCvtGt/lKS5X
 YruIH88wqqZ7iS6qWHPbUJdNpNP2VJozu8k/OTbZf8uKs3CnePB3gRIMzjSK941Qf2f0Io6hrpc
 FJbjQoHU7eOlHMDHy1w==
X-Proofpoint-GUID: DCg4m0BfW9CRplQb4VsvNBilqCV2U3hr
X-Proofpoint-ORIG-GUID: DCg4m0BfW9CRplQb4VsvNBilqCV2U3hr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfX6YCHjYdOEiuU
 n9UDnLmsADJcqNaEnrXhWyS4NpiJjcTrIYfBVO56NTGXEXwI2Ic35DJ8PTmVmE6OFR3YH7a8VAc
 e3DBKXMtr3YyOJbp9NccfZcpwH3F4Z0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180187

Add support for the Qualcomm Tambora (WCD9378) headset codec in
SDCA-compliant mode over SoundWire. On ARM/DT platforms without
ACPI/DisCo firmware, the SDCA topology and SoundWire port properties
are supplied as static data through the codec driver.

Patches 1-6 extend the ASoC SDCA class framework so that a
class-based codec driver can be built on ARM/DT: allow builds
without ACPI, expose the SoundWire probe/remove library entry
points, add class_ops with a populate_function hook, translate
sound-dai cells by entity index, and add a
sdca_apply_default_control_classifiers() helper.

Patches 7-8 add the WCD9378 dt-binding and driver. The same
silicon can be fused for a mobile (non-SDCA) or an SDCA-compliant
mode; the two share the SoundWire class-ID compatible
(sdw20217011000) and are selected apart by the new
qcom,sdca-compliant boolean property.

Testing: HPH playback and headset-mic capture tested on the
Snapdragon X2 Elite Glymur CRD and Lenovo T14s Gen7.

Jack detection is not wired up in this series.

Changes since v3 [1]:
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- drop the
   qcom,wcd9378c front compatible so the schema plays nicely with
   the SoundWire class-ID compatible; introduce a
   qcom,sdca-compliant boolean flag to select the SDCA fuse; drop
   the fake top-level wrapper node so the slave sits directly
   under the SoundWire controller; drop '|' from qcom,port-mapping
   description (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: gate probe on qcom,sdca-compliant.
 - set SDCA_NO_INTERRUPT correctly on controls, (Mark)

[1] https://lore.kernel.org/all/20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (8):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  102 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 include/sound/sdca_function.h                 |    2 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1058 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   51 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |   31 +
 15 files changed, 1537 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h

-- 
2.53.0

