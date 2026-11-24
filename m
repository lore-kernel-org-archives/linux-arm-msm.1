Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530568;
	b=cu+6swTR9V14K7u1TBuLwmMXqIUaz0ImKFVPEAv6fJ96Y7l4NCMVdqqh/WVLlqpg4xu3
	 ex39sZyyZXqR9+6Ypa1tjYqRQ3RVkO7Pdvnztfl+gsxiX6zsNVyKROyQII7W8Rm5zliQJ
	 aLEJulmt4+VFU4RKreI9PslS7YK62nT1GH9ubFlLVG6JRmZ+xoZhiG3xOl4wWkykUGfQX
	 xMvRNuJSnPJPjAz4J/ThQoNf2OLPl57wcuuMDUiAZ0bY4bUAqC+9Z0MtIJPTETr79O9H0
	 QpMM1+QoKD9tQtAzPvMOXs7pYawZekxArJjChiZSXzCwQGoHX4lpQYuBiuE8skSLPGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yiy/WaDs3gz6eQtQh9hA4jXuq8WgE5G3P8UWvfIjP6k=;
	b=H/VmcYJlezwDMbWTxRU+nZ1andyJiKb45ao9Le7kqaE/PRzcIqhk/HW5yQCKtVgRQUZD
	 G8dXN2W1Fx8VlpU8iJa0uxhknEap14NXypSQbXxzcp07PZXeve945vetaobzCQWntmo65
	 psnTfO8VIoByOZRBPO6kzcueeAcGbx0cngTqYJbYM+yv0ZSXfyqJGHYiUx3FJW1FSdYLS
	 JabbrqrcEmR/sEMYTOmO22iwKAGTXIwKH8jBLTq5X6mNpSyIbavC78IeUFSTBGSFM/Za0
	 ar3/DiyfYP6kxtMmK24V9KW8CJoF9HYxCPL2uZIKYYvZ1nKLtBzjE1ggK6M66Uc+dXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxerPgiU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K+O/7zrj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE8606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AE8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxerPgiU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+O/7zrj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuXpR1736802
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yiy/WaDs3gz6eQtQh9hA4j
	Xuq8WgE5G3P8UWvfIjP6k=; b=MxerPgiUv2vJcfnPV6RpzERzpVAFOeKcBg4+vH
	zy+BLJK3RgFGfo0DetwTd1/37cBIcvaE7JzLwNpJvg39aMs5MFZI/Jj5BwKcD2+/
	16D2n9cR4d4NhldUtV/5p1xSwJqjbOscS6uAiEx/Ceutqwo9qni38E0tuwsr57YR
	Ogg7fIKLefjqc3pyeU0WpYlHzDuU/uJzcKZUMeAzvJrwovcHp+IPItWGWfDGYUbb
	jLNBpSMpGjC2dliirz4POOG4PaxZBb5YQbqM5Kf9XNbaxNFM+uaNMLkQ+xoaPhIp
	MV5RULv3SO4jAMuXRiTnvDpSgPacML5GsmzG0DQY8kzuM7hA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd39hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:26 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67bec5d62ebso6790885d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530566; x=1796135366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiy/WaDs3gz6eQtQh9hA4jXuq8WgE5G3P8UWvfIjP6k=;
        b=K+O/7zrj+Z6Av4/outce0xba5nFbpTqVBzckCkV8zjuouM+oCJaFUHvE6WQqt4D+Lv
         t+Ep2tBGxQ7PJww87F/LBbNvyDYuOXpvWGky+EwruHMLIt2QigitdXoTMVFTOlnxUvK1
         3WvSHDtrvmvrVrf/fz1Oj4tRp+a2RpTB6aUDWNLFbmG2KjMhtUM8DRyxlFAwMm1WD2K+
         s9L7H9VRCZMInhKNyx6+ym792Fpj/aKDhWOeD1WW/GWtolhncdbzW4F+9obj7S3jX+BO
         NiJwsUByC67zV+f52SHiRFzXecmVz7j/r9LvEJn6Iy7V7S7P6tA75JlJXn7rwVb4WH1m
         WeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530566; x=1796135366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yiy/WaDs3gz6eQtQh9hA4jXuq8WgE5G3P8UWvfIjP6k=;
        b=CiQUFb8MTKoPj85BI3lpTb2VVAup0eCtJx0RULx3w7sxNyG4DuQrWyx1v5WL7BwG1j
         G2s9XORX1y/5juZpo3mQQoCG9/1EUQTO2ETufw1K9sIIhgNnN5unOnXmxaIYC/JFydhb
         exO3Yp5RHbJ9ffPsRVLJU9V6gQT1IvF+e+CivlTo6PGn7BWcLJMwrPKIxsULR4fjphGA
         xGKykijndVMIOMSf9A7li53MWN73LbezEpo/07GcBSQ2Q26l9OzqPMKnZinsqvIOhwFo
         BpUibld6jSqSvQT53k0AZrBqkoiQLj7ReIna7mIAuZNtelWfI+JUUqHZ11Gim2BVidxM
         hSgg==
X-Gm-Message-State: APuU4Z+UtLl/NvK8yA/gnRMhbpmwwpJIDbl8bP1YU4LFv2Sn6CewgifB
	N6MYcUimjCGqJVQErgPUGzTMNCBTcruQ3EOnc4Y0RacsEJniu8Y8jVtVFpazMmgNvu71TU7WSHy
	mCAyn/TBLWDq7Xg4FYz3AX0v9JXTyqsmu1qBkutpS9zmX57DSAGAtG7ELtJHaFZDAxJ+c
X-Gm-Gg: AZFdTZdP+sK9c7AHFKaphYjWjNircooJ3QJqjlMYdRGEIeDjbbmpnSvJINbSEfjs2zD
	IeAujR8diOSAaEL5ICJAHrdaxRCPkTYeHEY/ycM+g2SSeWy10S4Ic3nXU0bArCqbqF3IQ3p+7sy
	NGJ4S5kDiXlLmhXdRtcbTM9RQx3jT/2if1XAsAlljTfQUvtx9sSJ/L1nGBTpxmrG5TbOMZ3HiVg
	fQHQT8vywpvOLs9afIQKaK1hQYfu77InNKrSYGGDF8i5Milisg8MQgVDLqnRL1ajxsx9rmiFp5C
	H/BP3yzpsnlCJ7DHtgQmcnd6qGX1QuqMBgHXjVjJqVzPqR5MPswYqgjK4XZN3MHmhRxqjhFzxxg
	uygC4+P8ueAzlMS2zzvAC24EFkuMBNUygSL3iEknYV3E4LAfe29TYptgbvj5usuvnTTx8c9dPMG
	SGTwRFfiAip+6hmGX1a9fddAZgPdHjrkW5LdXFNG1JcegwIDd1dY8t6ZziQUxSvG8=
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr5624852d50.53.1795530566201;
        Tue, 24 Nov 2026 06:29:26 -0800 (PST)
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr5624839d50.53.1795530565786;
        Tue, 24 Nov 2026 06:29:25 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/11] pinctrl: qcom: fix and extend egpio support
Date: Tue, 24 Nov 2026 15:29:17 +0100
Message-Id: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAD2fBWsC/x3MTQ5AMBBA4avIrE2i4zeuIhbUYBLaakUk4u4ay
 2/x3gOBvXCANnnA8yVBrIlQaQJ6HczCKFM0UEaVUlTgoe2OTow+/Ya8OLFI+UT10Iz5WDLE0Hm
 e5f6nXf++HxZvebhkAAAA
X-Change-ID: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sc8AxEUwP42CPiyObhCzg/LCQo6jQ+Cd9/fbROhui8Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9B83O7N0tAOu9ZkxXiA3qKPtDSnB4efI6Wy
 o5/gBxXCAqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQQAKCRAFnS7L/zaE
 wxQmD/4sYcb01RGN1WZDk5r2BTjUnKMseHbpMtERyEbeb3Icx5ZvS9B4J1QHqkQO75GmKf5e5pU
 XSf5ZVrqoYpn/752kQUM5IsbWN7VWVODc0WqroMc2wG6OTeWDKN6SMa0OingMgZBKHQa91BecHF
 dyPWHYoOQ35SGDxwYD8pq/LmY+EGzE8aOmjXgXE+eq1l8VteCE4a+M5A/Zmgq/nkZRx/vGELEwj
 bJpY4kvs716q/riCS2X+8Ndd6S1TFouQyvGNjZtlXnfa5Kgtd/RGru86GrtBREr2f//f6AKXbgS
 gc2q9utuQtnqJqUnwUibMj1QBdLfEd1l+W+FxjFZ52HlZmKwBc1BSNXSirnxOGzN7tgsNGDrWTR
 yiLIYRSLal0W1JyjDQ5BR5oYU1n/2tUsfg9jc/3cvb7YRJ5LZf2mPiuSCjXoKe0g6qa/HOB1E4X
 l3HOsGqJNNSSyvKEe0tM+bZC6hUhoomBf8rDJCFXwHt6W9TxfWgSwngZgDcA/HXiiBPr71f0M4S
 O9sV8O8YqOu5X1Cuz6a0lSNJSI3DnSPhy4eFj5FCLhwUZ9uIYrMc87QfLu7FlS4ut+H0WIc2ZkI
 WnlNWuEp37Y3F7tqX7CqQ4MWSbFvXZtjDRg8/fmPJt+dd4oXUtsIeX74lEKLsytzNktQmVRmQBA
 bfaC/4CB/jMfkyA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b059f46 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Q4R59cM0UI1Gu6HzFF0A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX4Q+RwFn00/zh
 VU8LJcAPuPleOL3nje8n3NciUfimS2SnBUEMHhOqEu8ysDohJk0CxcckIk0rShNMYbvP9UMO3O8
 +i/DSvuqJcvR/guKnJnAL3A/ucboAW/o+qLu4sNS0OMNXFJ3ipPDLEd4ES/mj/ks+6GSGx19v2I
 WvDbDab3iyTAKWJ6EkX0GQpAIal5ZDaNqsA1GvmXHFF2A2eWASjNN837yNv2U+MXccECWG9eAhm
 RTmy4luuRsIYfQokR3lrARiqjkwC/n5Z4k6GrEHH2A4BbsjyKjN4DTKEIcYuOTd/r4XL6Ojo1/9
 ohCYyPoln+W5q5lW+VDzf2rZH8YPq7oavgbIA70d1lCGkiHRpa8eADy2P7b2eyFgplwsTpXB5Iq
 WgduM08XYaRSLLaNYVlsHPG/duxDQTjHAewBNLIT4B7qPF9h7eHJCy3oOYaNEEPMvhGfMC5oDSO
 D46RcrGCJzJnIFeFQcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX1aRMA1KwSWsR
 qsQjEiuLGJlMgeoxCoQv+T75QOLNN0u7lam8FxIirHIDk/NEp8aKAeOfsmVqWsxg7d24ON0CrH3
 Fahd3Uk9o2Fk/ECm6GGupDEJ8aRUCPo=
X-Proofpoint-ORIG-GUID: oKG9MR7hNxlKDavW5YUtKGgUeadSmCxx
X-Proofpoint-GUID: oKG9MR7hNxlKDavW5YUtKGgUeadSmCxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

Several Qualcomm TLMM drivers still register egpio as a strict function.
On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
series converts them to using MSM_GPIO_PIN_FUNCTION().

While at it: document egpio in the sm8250 and sm6115 bindings, and add
the missing egpio function to sm8550 together with its binding.

Patches 1-7 are fixes and should be backported. The rest is targeting
v7.5.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (11):
      pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
      pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
      pinctrl: qcom: milos: mark egpio as a GPIO pin function
      pinctrl: qcom: eliza: mark egpio as a GPIO pin function
      pinctrl: qcom: hawi: mark egpio as a GPIO pin function
      pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
      pinctrl: qcom: maili: mark egpio as a GPIO pin function
      dt-bindings: pinctrl: qcom,sm8250: add the egpio function
      dt-bindings: pinctrl: qcom,sm6115-tlmm: add the egpio function
      dt-bindings: pinctrl: qcom,sm8550-tlmm: add the egpio function
      pinctrl: qcom: sm8550: add the egpio function

 .../bindings/pinctrl/qcom,sm6115-tlmm.yaml         |   4 +-
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml      |   4 +-
 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml         |   2 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c                |   2 +-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-maili.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              | 105 ++++++++++++---------
 11 files changed, 71 insertions(+), 58 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

