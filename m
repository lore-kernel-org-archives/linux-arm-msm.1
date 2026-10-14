Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E635038EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982984; cv=none; b=ANiT/bGQX1CwEUyUL/dzHK2v4h0EeLMS5Yes9Bggw7s7OLnY7IruZ/IUfvbfFYrQn/ZHHKplJwmPCSGIEEs4/QahiB2adwoQNlvCnVRQjuOhhMnvSB0/+lgzTsKkC8ga8mLADRdtVlGQoiPt40PrXnfmWinYHzfM7Xd8r0ER9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982984; c=relaxed/simple;
	bh=gAIkzzbj+i1WmP6eC8YcuDBzKhsL6Sj8KUpou2Ontc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FMgWqVYLNlBJbjfRO125C94fq88lwUSndJD0jZAcc8UkL9lDbX4Xcdz7/2IUO2rJsZ5YVtlwropMPXVK7CKcB8RCwz7fO9cj6bDtaPA7yxjJdD+xKTnxPZ+z96pCsNhkUBV3df/GLvilEbeCme/Xj1liO1qr8/gQX4TcmkO+pNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjdQ1aBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3I8RPzX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjdQ1aBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3I8RPzX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9RZqL2222258
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ux7RAlOhQfXB+vgOyaQ7Pa
	ZBU7B8R90Yjj4MScRSDv4=; b=MjdQ1aBk5jFMTJ8Q9zDgopnG+1X6urbIQkCsfD
	NU/8nrsPFfSv5ZWPsIynz/thLByYZrTiks22vFPVI8PuQ+lp9GsLqlmwOPsS0tBr
	14DaMWndKiRSRj2uC0y7mqEAVRJaTUL6uE4KMAREY2VBgfaxYeuXBPuNmg+ge5vr
	P4wa20uNROToDVVzctdUF7xgrcwfOLe9iuKxB4QdEHPtQKLBNiIDttBi4aOHLWz3
	pIt10zgm7V5l7sZjPu4HeJ6E+vhbmfpv9Ajk3FR6ik8/HWBGJU/SWXpTuJmWhoUV
	klKV+0MWV8EGHtHBS2weBaui+xm+Ay8//ZADY0dIqcwY7vwg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbqkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:02:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5da613f7588so4627089e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982979; x=1792587779; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=;
        b=E3I8RPzXe9FTzyn7vrXdIBF77JEMhocrWqb60mFpkKVToSILOF8ElJ1fxSDEhSLgRU
         rrLc/wxF8r34JPOLCePblEnFquTs1ZTaI8HZPKkFIXWnFoHLhwjvgMe1v2Nt7FsbWB5Y
         UFre8fLE8NmW6DNHPF8P7rqHBFwnhAnQaFsAFIl2EDfT8JRxNXYGYapou/j4Pm4h8E98
         BmPQIIHSS1tCs4d9ojKplimDAef7A+zyiCpGcjirhbk66Df8ax5pfgaGcWt0gzeskL17
         DWW2W7EgTsthpVI99gd8o72yTk5Rcf6qThAF+/yyvxbrl6ovtHT98JLxZkMinrSBEC7/
         FdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982979; x=1792587779;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=;
        b=SS8EEf4dEuH/cQYDSrGVNZgZ9hkZYCrfOgkopKwEj6fKIUsQSovhpU0pYMpGI90nSJ
         xMxGKYvK4TpBhFB//xBUfG401Ve+7YE9qhMbjbVUWTjqCl1IKTML+iXU18b51i6EZ4Qu
         UDj53AOy591a/zixZskBTLSzrsjB1ZB9jLqQUM86CnpY6IB4HoM5aehmWKjoi991zGqq
         +e12CIFHubRckoVaFkEOW7K7zZaNNRn05m+A7PWPlUgniinH5TvIng1NDhUxFW7yb3eC
         mVwQGmd00HQLaniYCkPyGUHIqHsIi3urjShyHBX+Dd3ftSliUHN+sTI4GJ4bxgeCx4CJ
         wS8A==
X-Forwarded-Encrypted: i=1; AKwUvBxFWMCQmK532Zb3DqTkh+C9dA5CI0A9c1BaGTafNgj3PbBcX13uH3sY3zrhY5XZoJuZGmnNP6PAD2vtCzX+@vger.kernel.org
X-Gm-Message-State: AFq9FYLTnYEzhoci+NoHPTXtkJ7j0DS1D3jraHZCshO1TEOA288vWzWZ
	wyIO1g3sdtAeesfTs16l63o7Qnc8Gcf2arEE0cRLfRFfr19J78AU/QO38Htg0OuVFDNuHTBN2m7
	DP/9ek27NuHxuVVYQV8WFfGCagQKpfxv0Rb9pFr2V2P6u3px3FZD39JjEA3ujUvGqDsaZ
X-Gm-Gg: AYBFou1q2wLNi71vMPn7SNT+4zdmJQ3V/vWQh2sQpxeo4xDQYo+fmH+aXMpMOf0AQZu
	TQGvUvZ8WG/CQsA4LpNjQX9USorMxtGhpXfGskXsJYEn0/CE2Lvx0HKj1EJG+6Zsw6uKCk9+OvL
	oD81q43VNXGYw3MKOpbfHv/RNs5nJi9OTsAO/rgmeIi4diD+jLlL6XnMWKPmofo/GHUqvtwC/AY
	Hs9OZwXlYj+6ymudIuTqaQmm9IhivPR1iTegHuvuwl1Cso26Tyu85I9uQYmL1TS4uFyk3ZgVHRR
	QruQtInmgXJfp80WJXEzmnU3sXk9OmieyEPEW7Cq0pW041Kvp5DenYBqBfGWPeA2DLiqGtN+s0w
	+DkEzU9s5bQ==
X-Received: by 2002:a05:6122:32c8:b0:5c9:b444:7afc with SMTP id 71dfb90a1353d-5e91f26d597mr5314162e0c.1.1791982978534;
        Wed, 14 Oct 2026 06:02:58 -0700 (PDT)
X-Received: by 2002:a05:6122:32c8:b0:5c9:b444:7afc with SMTP id 71dfb90a1353d-5e91f26d597mr5314129e0c.1.1791982976482;
        Wed, 14 Oct 2026 06:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
Date: Wed, 14 Oct 2026 16:02:38 +0300
Message-Id: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG59z2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MT3SQT3byy3NRc3dS0zLLEIt201GTj5MQkA1NzU1MloK6CIqBEBdj
 EaKUgN2elWIhgcWlSVmpyCcgspdpaAOHta6h4AAAA
X-Change-ID: 20261014-b4-nvmem-efivar-fec3cab05755
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2683;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gAIkzzbj+i1WmP6eC8YcuDBzKhsL6Sj8KUpou2Ontc8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz310HD0lY/yh7SQXr+ouDyDiI+jw0Q581NH+F
 JEam2z2hIyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99dAAKCRAbX0TJAJUV
 Vq15D/0QVlTJir+agRbJm7HC5e0xE3vUhkeQLvsNriJkdZ1tqKjcyQ+n0YkwbN9hLa0QYWFZZyY
 OqYitq5DGIO0suxwwX/XOw2o+Ow+l3k28aLpit/w0QPwOjKzvRjHk83542VZAuhjxyFqJLKLUx+
 K9dMFA12PjhKgsuntHrs1uYt/Inj7Jkl3DQJ3j9twBTgHg09NHJtwzIWGXwbkeh6tbQDVLp8HES
 KaOrAs4GriNIjx+vz9xdpcX4Hb4/RcDSDcD4ByaJ8zXZy4TT5Q6y4SlqEkHTKE3FS9jpIt8VuxW
 fDMly3YtPOJRiL5/FyVez4F/rivUHkGfWeaQECiUUt5lYvqP8e5u9i+Yjglvac6bybOEvn6mFFl
 ILYkJH1xyrcIQ/xDMwzeEYU/QEaYnGA567CBIEN3YRuMHG6g1NdI3Jnb2K36TFdyJcaoWFeiiVj
 oDM1bLYAN2ZxwRykR3gouXB7AMcsVK+7JPYtie1nI5ktBkEvTHUqRWeQmKw0gPdFbk2rXh+mLDc
 wYISR4d9Hkwgoc6C9C/T1UZbM1MpYLDMFB2rczHTTmBXlHrvi1hLGQ52IbHDKQmgEyV/RSJzUfG
 PIlLey0I27FkXIMhY1T/nLodKHy0vr6oS6ELYmznE91cSCPq0WkwdeTZwnx0brjBoGrgLDeChzA
 O+eeON62CtBFnDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX1BAxPjEUrPoS
 9yRQSjiryMQAnkRKsEpiEXWqUFzOp0Ja4w7S8JZMPkdGvKJalOjZpqXXbHOVFufc0895Hx0T4+S
 tRlU5mVN5swcbc9ohynKVlAAAel6qTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX0P7ecwye1cNy
 SJg7qQGDBOnF88lccOCFkjskHrrVpcq+nZATaebwGUyERi9by5I9VSolBnDLWNcJFg81XEMFWLs
 QMp3B4MzZDBdP6SUck7FDRruQa1H8FoAe3N58aFItG4NptKvR6Iih+Qqvc0kkkNd8UPJjNROPKI
 3qldyyCRrdEr6wbYYUDs4O4oCgJrJsl+5MJHzm1FP3lQjD+MNqt4NNZ2OQdRXmIUgEMM/5J+bzc
 NmwangPu9XCnjsWvqMQk3yd8huKL8fT2NdqctEZyGtKqpAF4Gj29uy3Se9FAYiNvrxzfmsHiRfJ
 3NbR5ZsZwN7vQHC0gD1jtpbbwiuSc/0KYQHUzXUKOVAtQ/5xGaNPy+tUDqkgP0dHxxvE4qYv1DX
 xp7K1yr6h0wytYW0BRdDJF3LY3sJKQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf7d83 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5qUZDwqhos4Me9Bi-QgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 9pFl_tl2cvlqIJBjYlnsU_CNm5d1ZJna
X-Proofpoint-GUID: 9pFl_tl2cvlqIJBjYlnsU_CNm5d1ZJna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610140051

This is an RFC: I do not expect it to be merged as-is, it is sent to get
feedback on the approach.

Some values a platform needs (for example the WLAN and Bluetooth MAC
addresses on the Qualcomm laptops) are not always available to the kernel
in a convenient form. They may live in firmware-owned SPI-NOR storage
(e.g. a DPP partition) for which there is no straightforward, universally
working way to read them from the non-secure world.

As an alternative, this series allows such values to be provisioned once
into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
provider that exposes the contents of a UEFI variable as an NVMEM device,
so the data can be consumed through the standard nvmem-cells bindings.
MAC addresses are just the motivating use case; the provider itself is
generic.

The first two patches are the actual proposal:

  - dt-bindings: nvmem: Add UEFI variable NVMEM provider
  - nvmem: Add UEFI variable NVMEM provider

The remaining three patches are included only to illustrate how a
consumer would use the provider; they are not meant for merging as part
of this series:

  - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
  - wifi: ath12k: consume a "mac-address" cell
  - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable

glymur-crd is used here only as a convenient example for the consumer
patches.

Feedback on the provider, and on whether sourcing such values from a UEFI
variable is a reasonable approach when they cannot be read from the
SPI-NOR directly, is very welcome.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: nvmem: Add UEFI variable NVMEM provider
      nvmem: Add UEFI variable NVMEM provider
      Bluetooth: hci_qca: Support BD address from an nvmem cell
      wifi: ath12k: Support MAC address from the firmware node
      arm64: dts: qcom: glymur-crd: Source MAC addresses from a UEFI variable

 .../devicetree/bindings/nvmem/nvmem-efivar.yaml    |  73 ++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  22 ++
 drivers/bluetooth/hci_qca.c                        |  48 ++++
 drivers/net/wireless/ath/ath12k/mac.c              |  14 +-
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/efivar.c                             | 273 +++++++++++++++++++++
 7 files changed, 443 insertions(+), 1 deletion(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-b4-nvmem-efivar-fec3cab05755

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

