Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4F43BDC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581576; cv=none; b=IyYckGLFtOzwdwufHNDRbks1MOZ+jRqPV7a273GE2qTBUUsBx1MgY3KlbPHghSPGUCA4lBqXzjwzROCt192FkiJDWAQILDpYAnN5r3XA8AN61X6t2m3mZByO+J+VfNMAO0W54V7a8itIhjqZN6VuO5Vc/gzATpb5S5scy0mmihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581576; c=relaxed/simple;
	bh=0ShdK6homdK1I4Ywr5MsXY3zf48ku883tIe9a+2wHr4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NGHxujYGASS2kGi1t3a/jkCtS1pqDPMmfMQUp1NfsMwv5D4S27xxkfNUbT77NN5THhUygfGbCe+ux3mVY4e2SdFCAC5BI5I/2iheiqQRiWzNDSFmeYG3eRgl5dRDOcQi0z0BWMFaqk+VuMJZXBvcVQ62mTYGXFNvDM0TsPOXaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNqfA0oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drTiUr8N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNqfA0oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drTiUr8N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv59e2006635
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WBLWbc7fIPLRFV4iwOUNp6
	Gtzj8ymWvJS14YqGKh6GM=; b=HNqfA0oqJ0O49IeT+BuprgDmxxTlv0V8vwVGQ2
	/pnnK8yF8wD3JIwu/4fwm6WhwpNdAUwwLCCyak2MxLC+ENiK+zymPBmsJ8D0hF0I
	yaTW8xY/VJFuP4FqlFM8jelC7mRW4OuRDwdGgDsup7bvOreHSovuic4G5QNdPPx6
	Q25txM+1c6/n+7cVgcQaoZDOHUXLqK+L8T3LC9JlYhhzHkigKYNwjrZ6yJI5r2Ir
	LKVf1dCmgBe9TZ7oyoKU3ycVF5x3dUfgNPnkA9c7ZCpzTE3kfMqIwtXceYBFqFIp
	0b5Hd4XPIAEWmprItx6lUUnjNFTC6b93JiQJk0Md9LSyR6Hw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv791a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so52232275ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581572; x=1788186372; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WBLWbc7fIPLRFV4iwOUNp6Gtzj8ymWvJS14YqGKh6GM=;
        b=drTiUr8NSvFmO9G064YL8TC6kyOjkaTv9e8GmBy/2vUMGyqvFVgNsNMp1boqld0shy
         Oj+uB++R1HMywE9a2Nvf8bi4Cm6Kofg7HEJEJmpScjTZUm/EB/H0vZctnx8ss94aAkbA
         Cs2gucqYZjcXwD2lw98cghL2fN+65kk5brg+0uUXzoqAzWvrD+5Ul7u6ARKZ6UeM0QYM
         ZCvGHsYspY5o2z+c5R0Ib457Y8tmBbCQneUzLBPM/jlP6Nltk572sgFyZHSPhm0Up7xk
         bAeVDzm2XmKQjRGks6+4vyYw9byU7EYVnUg2fVxOiqw5BK0zV8JKqjgptWfum7xVOz1G
         KN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581572; x=1788186372;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WBLWbc7fIPLRFV4iwOUNp6Gtzj8ymWvJS14YqGKh6GM=;
        b=JFLGb32n0/y0bZ51eEC43t276wyE1YbjSpPDIZk9Ww0gbUTLfZIdQra91oNMMnokM7
         T43y8oD8guETnAlnMrBoGNHQyi8SOKcZZEC8lBrQYVJQXF+Ia2vRJieesUyqTyUe5oWX
         Dt9Y8/v/chwt3lD7XuPKo9fseXqNqonqRYUHIMoAKugnwNQS8SaObmn1zms+V/9gmGDk
         yAVT1erqDEgyIforvLgMghkTeQdR8Mbmr2mcbrCSOiRJA9iRC3OE/xLvHafynELkCBnt
         VGsPVIZ1N9Mc+bcRc5XhpvRDxE+hRnh/fc00UrBI8FG43gehz9QcWqxj++s8/1qZV+t2
         sTvw==
X-Forwarded-Encrypted: i=1; AHgh+RqeyFl0PixDN6it2koQx/OyRczJnsS8OYQLr+LGmyzUqKbeRtv45UnFcmmWCQheRjqyrAMOOwARg5i7Doo+@vger.kernel.org
X-Gm-Message-State: AFuF++mBYqQUo9HTGEMK8lemwfdfzvGh2M2mOP+A3JBCKshF9o8d4xgn
	OAXdiLfRu97XE0R0QChLgCvALnewxPlb3keS+qhkB6danFSNs7rcmRYOxjBSzgwa64p34PeK7xW
	VGEHUFw+HLnkYGz730GpLlry3awJIRU2hx8blrmKXl9MQ5uirEooQ5ukD88orUsj+7bXb
X-Gm-Gg: AR+sD11biiyZbPQFQWez6G4h3K1Cizu4UZSJPPMyNBu9PNVKthCzIH0MV6cufC7/7Xb
	EIoyb7QXGxFzhuDZ8ZKr7ARct2WQggyKskqOKIK4S68ZAIIjqjtmJdgytoVeagbz43177Beu1Cn
	mQgdUW4cgW+KXcTxOQZCaT4O/QGD/G6StVXQDSHYfNQakiY7TQ9QBFWsc8Jyyw9ey0Ku/cIJmDc
	ISKpGYz25AXE4SUVejfuIQcJy6qHjPg7iRfh6UxUBSzujDDoIXLJ36equw/BtpFREkP+2/E+t9j
	ZHz77Bu4DzRWYd/MwFmtUVtghx/o4n2KBjTkGjHIrRBXDtnkTaj9wZolM45cS7FtvA7/BUyv3c1
	jJYr2QkIGTM93WCoSkvLAGtS2s/+5pv+gaA==
X-Received: by 2002:a17:902:ec8c:b0:2d3:b109:bd7c with SMTP id d9443c01a7336-2d61a064bdemr393425415ad.4.1787581572246;
        Mon, 24 Aug 2026 07:26:12 -0700 (PDT)
X-Received: by 2002:a17:902:ec8c:b0:2d3:b109:bd7c with SMTP id d9443c01a7336-2d61a064bdemr393424625ad.4.1787581571695;
        Mon, 24 Aug 2026 07:26:11 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761fbcsm18523275ad.4.2026.08.24.07.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:26:11 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Date: Mon, 24 Aug 2026 19:55:58 +0530
Message-Id: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZUjGoC/53OTW6DMBAF4KtEXpfIP2BwVr1HFFnGjMlUBVPbo
 KKIu9ckmyzaRbMZ6UlP870biRAQIjkdbiTAghH9mEP5diD2asYeCuxyJpxySWuuijmC7if0Onk
 9+oRu1YOJCYL2TscJdTKhh6SNTbhgWovKSW4UsLKpK5LfTgEcft/J8+WR49x+gE27szeuGJMP6
 33Twvbeg2+o/D+/sIIWVkhhVFt1Tqp3H+Pxazaf1g/DMR+yr1j4k8PqFxyeHVV2DJwTrK7cH45
 4dpoXHJEdYFYB7UzbduYXZ9u2H6sZbmnZAQAA
X-Change-ID: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787581567; l=2479;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=0ShdK6homdK1I4Ywr5MsXY3zf48ku883tIe9a+2wHr4=;
 b=vClp/Vnl3qxxU6XUxaggYIocXx5KsFznab0WvxYNbzLNYsnzX96SfSCWijywuhyNhcvSr6CgI
 87RRfxRXGpZCYMGHJya7tMO1nhCtwZ0vsHqGGAxoditVW5yRdCquisr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c5484 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Qt6qZxy4Ex0I4-ZmshwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX4i4v65p19tjg
 gb9Wmw/8d0eJUNEdjyIFXsYfZCDN/rO3K2wIkIZ90kcdASN98qhmExUZgBxngFAFVAGJGAoN/IE
 PEtjjJavBZMe4RmxaJzI8Ym5LQeLBv8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfXzJGsGn5Vtze7
 HvcH4Rl4gLSkOp/Ol8QtAQDxKrXWQ5lm75Mx5LVb5uvue7yHyz3xDCh9w+Yfqlr8HVG57xM8msz
 f7mwv6pQGEU9pUbfc1hE8sF7O2BYk1v8qZD+aoVkJtWeit2mkQyeeHmHMXW7a+JHOe9wF+IK5Jt
 Eblm8Z8zPwI56i48JhyrZBjfYivfbui40dy7y0Vhiwjzeg+H0BzV8X3ILy8apr/Z9ygzh9OUUQG
 fLcBjB+4zltTJFUHXV+yrCAFtCLX6L+3wdxBupCdWGyI14PIIkCGCx4XZv0zQuGe9Wj1zPPEyeO
 J7+flrj6SX9+73XEIQmpX2sWKt/Nb84gNRBUiegDSBocjRSeR9d4pqaoYsHLarlE132CBCXdjuk
 vTz1bR9POVkH7mSQirBv3v+m7bHdK+aRKHoVGK78AZlk9vMxj2iEssG96k7BgMb68VSOvqabWv7
 4Kf27+Vx7k9l/LqqmMA==
X-Proofpoint-ORIG-GUID: MoKCXZUAZjruQou2keA8rY1rr9GFD1k4
X-Proofpoint-GUID: MoKCXZUAZjruQou2keA8rY1rr9GFD1k4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240121

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v4:
- Used devm_gpiod_get_optional() instead of
  devm_gpiod_get_index_optional(), since a single GPIO is requested.
- Dropped the redundant mas->ready_gpio NULL checks before
  gpiod_set_value(), since it already handles a NULL descriptor.
- Renamed target_gpio to ready_gpio to match the property name.
- Link to v3: https://patch.msgid.link/20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com

Changes in v3:
- Rebased on linux-next tip.
- Link to v2: https://patch.msgid.link/20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com

Changes in v2:
- Used ready-gpio instead of target-gpio.
- Updated commit text.
- Link to v1: https://patch.msgid.link/20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com

---
Praveen Talari (2):
      spi: dt-bindings: Document ready-gpios property
      spi: qcom-geni: Use GPIO to notify master of SPI target activity

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        |  9 ++++++++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  9 ++++++++
 drivers/spi/spi-geni-qcom.c                        | 25 ++++++++++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

