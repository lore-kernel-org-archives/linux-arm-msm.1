Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E3484256
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451159; cv=none; b=czjKdy8HJc18WTE/T+Xx64e5lt1XmJKw/VXZbAiaKT0bpNnu2ExKfAjUPfBBnNl7TBlO568r2BTyd2pWx8dEc3RISaQfShCLfRyYNLVQlWx0W+bAAFkXGFw9O1dCYUmZu63Z35wjTXANImOyIvqBzXkIpjwMd9US1mDBnLmXEFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451159; c=relaxed/simple;
	bh=tWZRu+UI2ZPuSpNn7BQgJfq8N/cVLqgDMRLvdJQv9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpHBE8l0GPmASdwZLVYhogAj0dY5ep/rkTWXtcLPNrQV31L14P+YPRgsa0x6nn79t93YB95nAmfOMkbswY8j7EufpSz5HRM1p3Ls66k8U7Es35zW67zY8H9djpA6yHpRW7jaJNKeSK1hwJmPNyzUesQ9nFlBbqJhIBdlwSAF4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gi52uEHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQ8Aw5QG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi52uEHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQ8Aw5QG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L3xR2068014
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k9oP5vnc7jHHYq8BmRPTcIkCBqaniiol+R2
	Q22c9X1o=; b=gi52uEHFBzWt79i2PfVboxj9Fz67CLvxfPGwLT1oIrWe47Da0AM
	zJoI9KtwFY6lyTpy5Q92HAKXLYWcnj7hWhuDMHPkNAH8VsPHfT19oQDPZv7sq4Yd
	FiUJoPuc6digpZgWJwNfX+Afmp+xB5UOMroYqQhQrzCKEpmApOvmEmmCQJYEeOYb
	yPcUO/AduRHF+DPKBoHe9uK9Rr/BLcje1ogUbr3Lc2XhlVdR+g39M0x0IEuXDRcn
	g1k+v32ZGYisJH9hjn7tCbrDFPnSKLpOMhvfSQsXsmS475PDg++1icpjuHlZ3W1I
	clPtZtiMt4SmuJMXvtBnQenF1eCWWknKOlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j48p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:19:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104eedb5b0so145756256d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451144; x=1792055944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9oP5vnc7jHHYq8BmRPTcIkCBqaniiol+R2Q22c9X1o=;
        b=eQ8Aw5QGcfGnByQvLzG8DxrOC7ocvHfYjCqPEoklO+o2fmtPkJQg/VYI89UNB2C2W0
         MEtHpBQdLmwcUUb6A1h3oNrojS1AGm8BM0dlyJ7o5LGFCqtPnirycJrwHVd+60IzdaPh
         uYzb2zqwO1eqLnqrJxvtu309GL4GMaK69YDHh48Lk4rXuriB8kHnB0Gur/WbAPIFUYEB
         zXqRq2ZvkB66X6NTtnLMf4ubX5kv3x7QB6U6bemMvTKUG4zVYanyftvz5lJtQ3sLFBF5
         2Bhy3SdL+F2lS1yX4q6RfGt7ZHXtZp47Alh62dGv54hXAdIgUyg14N//im4x8cDgb4Dk
         rjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451144; x=1792055944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9oP5vnc7jHHYq8BmRPTcIkCBqaniiol+R2Q22c9X1o=;
        b=1w41mSkkrq6FWWeTpyZgvjTPEP9rqy6xS55xySyaWOFPSXvglKesBFd1tnYb5Hyr1P
         nqFbCBq+MTJ8hscNbbgtUT8Qc6TBBz+/DY9Jqk3jGpKu6WcgTjy042kdK+Bk5QzzvqHJ
         IdE/wEHkIsAz3d/jrbZ2/oNE7e9+TQ5BkeTfMtY4l+1Chs11WNPx6qHP3vBafL6Evdzb
         rIKf2IjUpew01Vrb7DzeAHmDJfXmWq7Gug9QPEdtJWExiTonhS57NCsqDRjhfsXKZdf/
         lEjMIAdCqObLSocZSfEGOlBc4q1mn4ReoNV/MMSOrwYx0e9OG/3fjSBjiOORNucU8fj+
         vutQ==
X-Gm-Message-State: AFuF++l/m3II2rLYN7ZiO413cwXRmx7w6PB1EYDxE/tR4bXUKtOORWbc
	aqTkroE6Wz4cDy5IsvsP8c0I2CliBMGl4Z81O0NqftUn200Fq+UEEjIMZQJhTxb+Tb434HbADBg
	qxi+hHBq2yNCrB+2QPov6kled5dCqy36uq0GA7iMkJV/GRaxvFwwhWUaF2NVR8UkbyEWE
X-Gm-Gg: AYBFou1L2UdYWb4E/YQsD7VlRRThapEBjWxv7wio0Tg3J1pNxrUaK+eGtOks8a9iNHx
	L2nAB/ZeuhyxNm+G89V7/cTFXu3yF9f/c91g8iYM88CaarJloZk9etLqgRl2/PG8RTB64SlT6cI
	LbzopDNQKpJ3fUZ84IKUPP72MXswFLFYkEIlC+cHiHHdf4+rz4FEDxb+n6DB4vWTSdVbUy+sI1Y
	MpA/uLNVTfxiZeBeHfhREK83Lm82Pb4Cp9qvYSOvLKSuJqSYLC7PWqSMrjiCqpBpvv61jR8ozdH
	Z4K/7avoMJ2GacIxu+4Ij31+x9aCjKom7ffrE458P7T20qxyr/kKw2W6vOchP0nkmn/fmfwIFXE
	KppBk05VUsktmA1IFhiGYL4OMLs2zg0UTs6WY6r3ncIPX/A==
X-Received: by 2002:a05:620a:2604:b0:93e:9898:c102 with SMTP id af79cd13be357-93e9b76ca27mr944191785a.20.1791451143547;
        Thu, 08 Oct 2026 02:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2604:b0:93e:9898:c102 with SMTP id af79cd13be357-93e9b76ca27mr944188085a.20.1791451143010;
        Thu, 08 Oct 2026 02:19:03 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843b2eadsm59975825e9.10.2026.10.08.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:19:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control updates for v7.4-rc1
Date: Thu,  8 Oct 2026 11:18:57 +0200
Message-ID: <20261008091857.5751-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac76008 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=s8qG-SC38XHMLUlfDbAA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX7hjaSs/XJcsf
 SCmBZNCAGyYsRcWQcugMJwYBmkedxW6pDsdZuyc9s8rCNY+CFWERor+QmtirbjyTjsrgeHI0TLu
 SpdWLGwcLin9ErTTZ5UP+0PB4SNzLrg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2axJbxgavlQC
 tsgyxbXpNsX8NRDu7jIJG5JKsaGwtYDp3MFjGJ+rWyblGaljzuq9ZksgCJkA3ge6uiF9Jhb0ntU
 Bh6fxpljKAfbJjLrjH9OWya/Vmz4GmXSinbxs9cfNa35CgF40dEowLXHfSgQHFsGh4DD06KkFvi
 dKtgjY4ZDQOvfQY4Cwrz6vdNFCnySGDqrkOKiWXZRvxy4EeaUormJW7MszW0yalIQ1QyjOk2izT
 b0qJu3WDuYrT4ADitOM/8eQUMr4kFYFvsHuG1UGFVr8dNVvcDZBAcDpcNqOQLW/y6QKDxYt6v2c
 tXljPjJ6Pe9AgAaJIINFOClqwhSW2ISvY3Ku97+tpXIUocun2buSzFERmpxEpeAJulNlrdOu2YE
 vvuRke/v4pK3mbM2WMf/uh606SboWV6/D5MNOHDlT1yWs0daoW5rQBYYJkjhfw7CNm1qT6NAPDJ
 Falu0J6qGpKgMyAN48Q==
X-Proofpoint-ORIG-GUID: cXv98Uyyic9I3k6TY12Yvfr4BmRpgOpQ
X-Proofpoint-GUID: cXv98Uyyic9I3k6TY12Yvfr4BmRpgOpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Linus,

Please pull the following set of updates to Qualcomm pin control drivers for
the upcoming v7.4 merge window. There are three new drivers, support for a new
SPMI PMIC and some minor driver improvements along with necessary DT bindings
changes. Details are in the signed tag.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-updates-for-v7.4-rc1

for you to fetch changes up to 4d7c9430a26aea6a69521af3aa2d78dd5bc8d3ed:

  pinctrl: qcom: tlmm-test: Add const to reg_names allocation type (2026-09-21 11:38:58 +0200)

----------------------------------------------------------------
Qualcomm pin control updates for v7.4-rc1

New drivers:
- add the TLMM drivers for Kuno and MSM8952
- add the LPASS LPI driver for Hawi

New model support:
- support PMAU0102 GPIO in pinctrl-spmi-gpio

Driver improvements:
- fix/unify naming convention in defines specific to Qualcomm pinctrl
  drivers
- extend debugfs verbosity for pinctrl-lpass-lpi
- make the return type from kcalloc() const in tlmm-test

Devicetree bindings:
- add binding documents for new drivers
- document compatibles for new models
- document the gpio-line-names property for qcom,sc8280xp-tlmm

----------------------------------------------------------------
Bjorn Andersson (1):
      pinctrl: qcom: lpass-lpi: Include value in debugfs output

Dhruvin Rajpura (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support

Hardeep Sharma (2):
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver

Kees Cook (1):
      pinctrl: qcom: tlmm-test: Add const to reg_names allocation type

Konrad Dybcio (1):
      pinctrl: qcom: Drop marketing name-prefixed duplicate defines

Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

Prasad Kumpatla (2):
      dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
      pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

Xilin Wu (1):
      dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names

 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml       |  109 ++
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  146 +++
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 .../bindings/pinctrl/qcom,sc8280xp-tlmm.yaml       |    3 +
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   19 +
 drivers/pinctrl/qcom/Makefile                      |    3 +
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |  188 +--
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |  502 ++++----
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c      |  244 ++++
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |  208 ++--
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |  208 ++--
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   17 +
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   25 -
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1257 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/tlmm-test.c                   |    2 +-
 20 files changed, 3282 insertions(+), 580 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-kuno.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8952.c
