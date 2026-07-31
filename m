Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE073B6BE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521255; cv=none; b=ExtdizYC/JLvmamTaulfnNQKzxlaUXPiuv1B8dj2/KaYluuCmie2dTkRN6SqNo07MBXcFCIm/KG7qPEkn6kXvlTVCd1e6AIx+Y0t2AJKW7xTlUEtXlmTrMEmTUqInBhL0/u/SY4dYFQCMZPtUAggwoU1cgalJhEnofhpiVFr9yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521255; c=relaxed/simple;
	bh=TvwLYVfSP/I25cwjK7mSZoCeb4ayWQzCh+Noex+a+q8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DGyS6sa9tBPYNDmGjZuGyPG7i71z6oR5XBr5ZBx1vx7ZHl2JXN1oZk/UfyfqXQGAdIaRjOFyhzt0awydVFjKWetdR8c8wFw34UhOVg3nE7qDqT0RqLz4MD8yd9KGpXd03jsXMLx16+F92ihVXsu0q4T8mE1n+Rnshn8SCHxOkj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKefcG2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=km0LLnbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKefcG2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="km0LLnbL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFNvwX105912
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ifmahfVjpMgOLth5IowDND
	zQ/5SrSxDfdfJHN0gzlC4=; b=VKefcG2RQSCtZT17iA4xOErEkhSOMvxHpMI+jU
	h8lbgdfFG9K6SmBRfxbHPcu5yMzP7WU5RapwkikQWUd3lT7Mb0VtRwCZW8Msa1TV
	HrFqJah/meDjrPDt0jMTBnO+Caj8nBs7KAP46sGsOblG7e0xTfnvzEj0iNmfI7Il
	o4RTq7xyfU8co67biz6EDmbNgcsOd4VXS0jRehaNhs81vISzvuYnhIX2mvn4hAZV
	B+53XS4eM1SkTZSiB96rC2IRB+FP+DELtc+KMEcP55EkdR240Z+HD2MIL63VWKXY
	2LwQAccIZntTjHS2AWNYveiKUb1INOysApSrueUAuxRjvSqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u1rc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:07:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso805459a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785521252; x=1786126052; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ifmahfVjpMgOLth5IowDNDzQ/5SrSxDfdfJHN0gzlC4=;
        b=km0LLnbLyC0vuYQMAOCBFeDez3+sZdEkRMNtIM6HQSUKfwnQrvC9gnI02Nq3rWVm01
         HM87u0tzYe7Qrntb8WH/RUi8fg0Qfp1t32grCQB+2vDdqH6J1RXXEPyf75qXcM1DMwKW
         0I3f/q2owtSE7f1T+juCH56g4U2yM1cAr6mLab3fDTfJ4yTCUWUCq35bE8WG+Y74um7q
         HHdOh0OSEV6lI2bX54ruw9ro6ApJEuKIezsfba6LnFbgjN3I5GO/YZZIC9zTpIAdKDWP
         Rdih6wbu13FpGMpIV1gpDMOYvx1QhcgnxOi763JynQNkwyuHtiZoRsrPYuwp0OjBPhc0
         Lpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521252; x=1786126052;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ifmahfVjpMgOLth5IowDNDzQ/5SrSxDfdfJHN0gzlC4=;
        b=cti2jFzGVS7eyVH5La32h9wfUxlMX0vUSmD4J6o9+ak8EVHCDCveYP4qxkDf4b7NNa
         28XmRloLzg7Qyl6VHw3GftWaphiEn7/Oa9ciegOOQfMnEcaSfWuTvnNvvE/wrlEQLEIx
         szTbElqFumAtwrA6/W1CdkIxRvYTa4fH5TjT8h5/tIq3CuIg1hhA/I462+7qrGS7Jc1K
         32pX53i/151BvXuKkikOgwO3vwqd0pGaJxoYZcCxYhjteQtCm+WVqPcOHCy6cdzWo4iL
         PSrKinGMBfJ3JxdL9vvWvMkBJH8hfmo8K9/pc60uQGtwfowd8+bgOt+x1OnXOghgqigA
         VY0g==
X-Forwarded-Encrypted: i=1; AHgh+RoTO8zFhGnfd+tt2gb/vyV7p4SMzv4GMHJeuCQSS9WSZ06ub5k9RVhOlq1L8uLB77rsA20aBY5p3xMkGMam@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9C342uagXwwb5Fw+EYZiyQLMczBnzGRLvkhOs6H9mX7f0DfYE
	X1lxskUFnqDuYpyLc/ISOCXGAUiDuqNn8ATSgqPVyM6YB7s9YV1okhKs7b+4QwEqG7FrP3nMrkq
	rq+L+CQJiQgHUNfvgNEEFZvCiQGQdQ+kUTZh8cCf27QMAv26CeV4Jmm4RTYPtI/aPPVoh
X-Gm-Gg: AR+sD11FJ/V82I6u26O8D51jTRJPFWBZROBguy/UvurMBqe0IinlBpmSoaF+5qb7XzF
	NXhA4rnAT8LVriqAw0sl5dbbfKa6yrdKji5CRsUvvgcJHGzOrPQluyWK3Yw5u/B2ADIEHFRytyu
	wJ8nP2Wwsks3wD51wzT7Y9C3xM58bPle82JnWOLo7+Sm1uXlDM0bT+mYdLYRlAY+izWqDJCNCK5
	XEOKRI+pk4/LXEvu1nqjTSNn74LH1lwZ4x8f3+/R7NKHWkUrXLVGNafsmLRH1tOCx7uZ0Z2+yM4
	RGU1rEsO4ffduHixBqkBHtke8mMmSA6t7grpUQaYw1oYutwQBCxn3bxU9Jnbs5k0Q9HxWkarTFq
	U8VnF/13otM8vKKJ4psQ=
X-Received: by 2002:a05:6a21:e58d:b0:3c3:a804:8eed with SMTP id adf61e73a8af0-3c92a8b7943mr760334637.56.1785521252415;
        Fri, 31 Jul 2026 11:07:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:e58d:b0:3c3:a804:8eed with SMTP id adf61e73a8af0-3c92a8b7943mr760289637.56.1785521251936;
        Fri, 31 Jul 2026 11:07:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fe9fsm7069923eec.25.2026.07.31.11.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:07:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/7] Add support for QCOM SPMI PMIC5 Gen4 ADC
Date: Fri, 31 Jul 2026 23:36:13 +0530
Message-Id: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbkbGoC/y2N7YrCMBBFX6Xkt5F8NElbZNn3ECnJZKIR02rTi
 iC++6Z2/wyc4d573iTjFDGTrnqTCZ8xx3EowHcVgYsdzkijL0wEE5oZyeg9RVD9GYe6tx5okNI
 bpZ2zCkgp3ScM8fUdPJ42zou7Iszryn9iwsdSTPMWIwlztl9TVx02kRC0KOSq6OdEnzVllHHeN
 jwUGzS/Y877x2JvMKa0L+dnnXY2I10/ce6qoFjbOO0sGs1R1hod+NZbE1qlhQBWGykhBHL6fP4
 A+pEWfAcBAAA=
X-Change-ID: 20260730-pmic5_gen4_adc-f33d756bba5c
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785521244; l=3216;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=TvwLYVfSP/I25cwjK7mSZoCeb4ayWQzCh+Noex+a+q8=;
 b=uhmUbiWgEP6WpSeawanJtED/WGKEis4wMGT9Vl2z2d4Dckgg2H5ZfV2GXM23RI5T9dXjap1vR
 OqID+Bf8lZ/C28FmUYlQevCJz8gARzvCRpYQOe/Cep/Q7+H/s1ravVZ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: A2l2fbryeF7XNGLSwcuNt1gXS4Mj6IIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX/LcGu+QIUGbt
 rd6Pg2bKlFlzs48Zf66ceShzVS+UHpjvRfeWUNe/1YxhqXEv69Yk3q0oErK0Bgibl11cKVZSf6V
 W1RK9fciCP5mjg1+adJWHAIAsSjdUEkSXXpsw02Bgar9gB0ZBxFWO+IMkwaNxLH5Xr8ahC0SQkh
 3z8PvyO9miVz8lVrAf/4BGMF3UIDQncLOIvfj53oHRpEdw4aBdgby3XfwZf3qMOH+pFxiOkVBbO
 9ujRKuM3aruNBJMBWRUMhsgLvHMifANuTOtmD390/pKu4FrjoHq46Fxv5jMjOBhf61/N68uWgjS
 61jVtIktQ4FVob5RODCKjExisqOp3qyU6qkUhdHfy/o+OLa3qE/lSgZDm6yb/DjQfYyeSuxVYJw
 +0eBboO4KyWkTSC5Tnbw2hcfw5ZTH51pVkRYOakCGTOf6aufPvBwy5cQQDCJWleWWr9XrYCDe3h
 WUWXfb4qSOWPA9JXkAA==
X-Proofpoint-GUID: A2l2fbryeF7XNGLSwcuNt1gXS4Mj6IIC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX91VA0CTVg5kH
 uq00Q1j4Bwo0hbxVn1N3MZ9PzO7nQBzBYL0W/tgyioqZdERkoTcwecAF6nlt1WohG08qsd0coGo
 sIobYJLXxIdKISkk/pWH7/Nc8fLYCBw=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6ce465 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JsIwp8TvIpfYpZRrz7MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310139

PMIC5 Gen4 ADC is the next generation following PMIC5 Gen3 ADC, with
several hardware changes for improved performance. In software
implementation, it is mostly similar to Gen3 ADC with the following
key differences:

- Increased ratiometric conversion resolution from 14 bits to 16 bits.
- Extended SID field from 4 to 5 bits and addition of a 2-bit bus index
  field in the SID register, to support communication with up to 32 PMICs
  per bus across up to 4 buses under the latest PMIC arbiter (v8).

This series adds support for the PMIC5 Gen4 ADC:

Patches 1-3 add the dt-bindings, IIO ADC driver, and thermal ADC-TM
driver support respectively, within the existing files.

Patch 4 adds a DT header file with macro definitions for Gen4 virtual
channel numbers, used in the "reg" property of ADC channel nodes.

Patch 5 adds the DT node for the Gen4 ADC peripheral under PMK8850.

Patches 6 and 7 add ADC support for Glymur and Kaanapali boards.
This includes ADC channels for die temperature, VPH power and
system thermistors, thermal zone nodes for thermistors and temp_alarm
node configurations to use ADC die_temp channels for temperature reads.

This series is dependent on the following series, which adds thermal
monitoring support for Gen3 ADC: 
https://lore.kernel.org/all/20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com/.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Jishnu Prakash (7):
      dt-bindings: iio: adc: Add support for QCOM PMIC5 Gen4 ADC
      iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM PMIC5 Gen4 ADC
      thermal: qcom: qcom-spmi-adc-tm5-gen3: Add support for QCOM PMIC5 Gen4 ADC
      arm64: dts: qcom: Add header file for ADC5 Gen4 channel macros
      arm64: dts: qcom: pmk8850: Add ADC5 Gen4 peripheral
      arm64: dts: qcom: glymur: Add ADC support for Glymur CRD
      arm64: dts: qcom: kaanapali: Add ADC support for Kaanapali boards

 .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      |  47 +++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 143 ++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         | 312 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         | 312 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmk8850.dtsi              |  25 ++
 arch/arm64/boot/dts/qcom/qcom-adc5-gen4.h          |  96 +++++++
 drivers/iio/adc/qcom-spmi-adc5-gen3.c              | 165 ++++++++---
 drivers/iio/adc/qcom-vadc-common.c                 |  43 +++
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c      |  19 +-
 include/linux/iio/adc/qcom-adc5-gen3-common.h      |  44 ++-
 include/linux/iio/adc/qcom-vadc-common.h           |   6 +
 11 files changed, 1156 insertions(+), 56 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260730-pmic5_gen4_adc-f33d756bba5c
prerequisite-message-id: <20260722-gen3_adc_tm-v4-0-011981f756c8@oss.qualcomm.com>
prerequisite-patch-id: a11759e2d93f71e1512222baf904ced88a7b5262
prerequisite-patch-id: 3170107e11602d8c212f8a554db85860383b1e52
prerequisite-patch-id: 6b719c6c28e9572b9fef186a53c2c5fa6fbdf001

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

