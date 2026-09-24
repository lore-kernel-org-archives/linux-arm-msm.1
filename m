Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6AC485CEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251819; cv=none; b=t6QwCkA56hk26gplkXkmwj2oMcai7KRfPguup1TrqErjm70xknccVLVzoHXXm3fUjDZMOyqC4JzV1ne7j+zuLmhdV5NehYPOSB6FxcyIXm9YuyL7ntBZbe/A0MPX3g7swOsdU5oRlGBu1cWGjPXxUsqkHFvcPjhCkJBti7gMiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251819; c=relaxed/simple;
	bh=iIIEDnd8L5j9eUvRBEHucj351THNpXBMe1ZnNfcjFm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5/r/qpUi1B52ls5T3p0DaJ8PmGOrv+rQ3BpYbpT3ipw2/Amokl9OsmofI3Ra7sWixUmgtfWnwPMVctGatFp/7yCyFaVY5p2YPP5KaqosmAPPnhGEc2OM+gkW5JVD6vvatWd5hpFWMQDXeuSlTao5Iq0vzn1A6o7EFXm/q64/hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6+zEnS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNKDgYW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6+zEnS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNKDgYW3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ghF2749329
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mP3H31CU9hZmyEbDtNk4np
	JlDMlvqn7SuVatvtWrV28=; b=D6+zEnS8/bhE7Wwk5oIWPxCZQcfXDMlFAqlESC
	9Bxd6IlaZg3fiX1AcjBrN8DULhmY14ivtg5jbxCohtNXhwlIS5ozKV94Ccy6j7Oq
	1oSw3whe4ImUDZV5UTody9Az/NC1Y6aifEX3Vx8NfeL7x2MZ5qd+1SEjtrOA5Obr
	upKLCLePrSd7yf/ZdZ3sCoIRF15hUJMRAW5H8Bj6BWTw+0QfIOoE0yF3UQEn+3B1
	6/GPPlxF2WbXO+jjIr2ZrKSEW3ML+1JzKCsJQ/caU/JyU1DatzlBg882BGBzpIld
	chWAauYd1tLmbofLvaDPUd1DezftE148L14AimpVgCynPugg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90eym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:10:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a77961b860so496339137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251815; x=1790856615; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mP3H31CU9hZmyEbDtNk4npJlDMlvqn7SuVatvtWrV28=;
        b=fNKDgYW3hpOWVHbecFdR5pmCYT0Ugxd1vfCjG240VYBE5/Lonsfo4dsqsjEr5cusOa
         lEQ9VPuNdajxh4yR2BYs2eLk4NzWARjV/+cucEhxgP7MKJTwg8jWTL7n9S2ua/Vf9cKL
         qQwkJdmKKwx39rfSudHHhkv/1uA3xwnQlzmx7joFvrSofomJ3Oz62GVEemV4SgXcIW1a
         umINl1Q9rxwlh4M7yaaZqLBTAm6GJ84XjTRdgOT0kt8DdK1vxtR1BLzoqrh3x21ZuZYh
         5JAgcG5E3FnWkZmkHJgYfZspk5I1YVcfupZIS9pNcRAjzz9QNehcsezP5Bm6RcQ8WilX
         lbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251815; x=1790856615;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mP3H31CU9hZmyEbDtNk4npJlDMlvqn7SuVatvtWrV28=;
        b=lObYFOe2NVDlhj1mWdRyRuLJbFZ3z516VYNm402i/5dsvvtNhEjB/xv7+ovt0wLwts
         cJWjAaM05xYQMUEzbe9ip+b3nqMN9AdPz4WoiegqoO2jNHYnrLqa6wvTzgL1VL/Mt6qV
         RnXOzGV5aXVIIWHPHGawFniHbJop69UCnZmN/WA8Wx/yxY7c66yedUWkCesWgYM81DHU
         nNbdRPyqWP1B0izz/xFYwakUvHTx8qrKp2UdBaa2HyIr3JAxtjK1MeaoRklwBeehJeRD
         9LKC27eEDFMzBHRX2hVTvjbMM9/Tc8oQ4nX6dG3tp/ZXjL7e+cZQagZY30VhDrnfWVsN
         Ky3g==
X-Gm-Message-State: AFuF++k+/WaGgGJoDfdZocF0OOWrfzVL+kb5c9CZxVjTmWOmRlQbo5P4
	OqD44Bgr0a1V6GFSR9/XVh5EFHjx5K7rpwQx8vGJAyx1dTid8GVm6jROS+cy2dqp5mWO+kGBkXF
	KjMuL4diyRjAGCevzInm+BgNWp2brZudXlMNhgvQWukotR+05ZctUv/MZIWmdB2zIARfC
X-Gm-Gg: AYBFou26yPrn1TNinNYEvbZd5KLXHfCjfL3w/weHPi/2GZbeimQXLlaZDJb0GBWsBb2
	gqpJMWy4fzGUOwyw+xF+Smy8Vy9Zg0hpMQe3kzb8QI+NVBEsaPdT4DWAOzqkQvhrdTFITw5oXjj
	+youyvoIsJckdKPzG3kAicfzekmp2SgoU2DBwQODTRrlrtgJ/iI+tWIJFIYtP1Al4HzcWkZh6/n
	m5aCDWXBrih1TWvrfqowRsu6xE9H/esy0+5wlBigTLS+cNHoCT6ZeOuw/yszc1R9cr/wr7sbSVD
	1CY5b/h1ebq0KYrIJqNZ/V9niaPxYyBwdhgNQ/quAGfVRGeBDmyC0tRhPlQZFhDmHeOzzeyfeja
	3XgBVHoTQxiO8j1xLlEqMgODkzOxc
X-Received: by 2002:a05:6102:5801:b0:7a8:10eb:96cc with SMTP id ada2fe7eead31-7af1c79fad0mr907374137.8.1790251814174;
        Thu, 24 Sep 2026 05:10:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:7a8:10eb:96cc with SMTP id ada2fe7eead31-7af1c79fad0mr907358137.8.1790251813612;
        Thu, 24 Sep 2026 05:10:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7d0e:af24:d3c0:9a86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm15227876f8f.26.2026.09.24.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Thu, 24 Sep 2026 14:10:02 +0200
Message-Id: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABoTtWoC/3XMTQ6CMBCG4auQrh0y/QGsK+9hXEBboIlQbLHRE
 O5uYWWMbiZ5J/mehQTjrQnklC3Em2iDdWMKfsiI6uuxM2B1asKQlShpCaPzGrrJgp4DCBRFWSA
 2VUNJmkzetPa5c5dr6t6G2fnXrke6ff9AkQICVtzwVioqNZ5dCPn9Ud+UG4Y8HbJ5kX0YjH4ZL
 BmiZbJS8sgbKX4Y67q+AepHZqfzAAAA
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iIIEDnd8L5j9eUvRBEHucj351THNpXBMe1ZnNfcjFm8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtRMd3axmK0cqsyW18Ryz3lowPgsB3s+NMvZV9
 8fZi5UkY2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarUTHQAKCRAFnS7L/zaE
 w60HD/42psOGHuTZvBtbC1M4VaUgY0WsSYRydGKltoCJu/UZNrHUcLllcibmVPlXbGycb6u+ShR
 BCTqDeyal2TzhDs74qgHhrmVxDMVE88ApJfIGG7mRRJ+a8cepF2WtMhOkcc8FlZuT1BUFDpmC6a
 mL4Hzb7L9JqA54F7z7Y9zwBBptL2ByJ6YonMEWMUhdgnMAEa4SpgKZEHFDR7rhw5PN7pGbBn0Xa
 16Xa6/B8oE2711+o0eji0q0sV4c/U0c7wd7sRyxj10TfPGe+cHwk7klsSbVtoS4XFQQnUX9EvAX
 IQEUxYZEiTCaZJOyoaAwIxDI/5PWr7HYgPnqsKcTobozA7ISsOf46X8In8FOMFnUxNpeytQl5RS
 fwMqfcJXMbD8x827tjd6kzs0AbiXPCByBn1NFiZyH2GkPe479cAffP7ezUMQ/9nPEkCPCqtrUFO
 8Yq+nxKbFlBeKkd/CJkudVKtnRMxhW//b88I82gm4E6VBty2+ia+b/4CCI8lbhSWJSTdCSz0K1n
 0mw5Pf357vQn/bLjLQ9+zd3VfUNfR2pC0Kf9WUU8xzgFF4R4dz8JUzXp6DcZuWaaLeOG7aZFAaT
 WfNqI5G5+GReQFzlCUHU1ofEJh/jS3oByMrUFZyMpIQIAaOqYur/NSRqiydjMZGxjXdRQDdSGAW
 8LlrZqmnY+liH0Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXwVWXiAd0isml
 dv/dK/yNcbdKM5fprTfXdKD1rD52p+WMjEJJGUnIHlnRwqCHzGSR1B9fAMMJz5KLQ9JzQvUhvCg
 vYT6FIPoINBhyJmdTBayXZPvjCnSrQjL4xO5kYaW/bIvlTtMHnnursGosGb3hl+pXo36HwFAoeZ
 D20EMGh3FMS7eN0mvE/Pe2GPzETXh6T9ZSPfCUH9j2BJiJFGdOWqMQtSJqhPnaRkOOHuxDaQXCS
 dFh3YPBe/1SIf1dA+XRkpIO/sPLByRPggiiuxgao9qKGvWd7bRKS+IOaVi2cu4vb4dS1Xl5SGjL
 cWE8JmrDuNrILynMGqvlWojSdGCcsnwz5zp9yw2ux1Bl/NjtpUE8S3VxBmPeoiVq1HA2K4NYZ1t
 an/m/7dR6pxZ1qBo4Ptv/Xb/sEKk+LLQHAeaRYR2u43I2vsXggu+GIpZkQn51vAJAJA2Yw19hsv
 S0E9m4e8Dzl/GYcdp2w==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab51328 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=7_0sH2yJl7oUNOsIvscA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0kwIo1tpKdlr
 FS3Zq5oY101nnsvA7c7MH1KfGMpIj95Imsg2VIs99PKOgRqJpvACIJgY6MQePFsq/KEn9TSnMed
 c6zJFC6HvBNhYSgZC0pYzgCN7uB9Axo=
X-Proofpoint-ORIG-GUID: jdT2vRi9f1BOUrashlXEFBkGn2JzJb-4
X-Proofpoint-GUID: jdT2vRi9f1BOUrashlXEFBkGn2JzJb-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

The DT bindings patch was sent separately[1].

This series is rebased on top of current linux-next.

[1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Enable GPI nodes by default
- Link to v2: https://patch.msgid.link/20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com

Changes in v2:
- Remove dmas and dma-names from uart nodes
- Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 188 +++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
---
base-commit: eee2e6e6000eb169f39f69c8b84999790317509c
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

