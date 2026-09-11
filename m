Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D542D9EDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106861; cv=none; b=OJ9WPVZ0AYq8FyVzcYbIqdbfO4dUUEWyxmvml24iIzRwqTiOK1WjdQwbytpuS0YXZudo4whFPawKkol1MeuPq0gwfBLH9SO2xMxZloYYlRSJOOGEZmlDdWQ0R1R8kDChrJ4KMd9KI8bsKyLb7+adsf9m1Vpc4DCKKvvGqUi6WOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106861; c=relaxed/simple;
	bh=MzHlgPVLQNpKSuJ4w8sKSteQneKAclokvqITX6rQ4Fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XxnUU4RtQd1mBlo/Hj5rmKUXvmxFHq3YwSWoiTvhh9CeBfOFx/VFTpeQI6+RMHxeFOov63v59Fh1dpDiYYn5Wpsl2WM1YjSkTuGcta3rp/lQ/pjl0WOzj8mcV5mq4A/uZY6HrUecyVDvYoY642iqOFaS4D9PjUEBVU47BeCc5PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2VSh3aS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y65/w5MB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2VSh3aS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y65/w5MB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vYt62422376
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xnxDNbWLge0Lr6+dTC49mM
	kxncId8Rw69mBjWgWWmWs=; b=L2VSh3aSs94OpRh1HJ77xLSHwHV7RT/RDIMy/5
	dZvsoHQj+Hgtu7/iVTQSlDERmF8zRa1dkX28HL6n7btnUWnQkVl7Lz7qpl4BMgJE
	ZvU1/HeJa7S6n+vmlWPIdpDyIIBF4slDz91wJeh7AsPIBPtvXJhBQclxq+gO9+0n
	Mb9HF2AOo1+FHEh8aKYCkKOOeckSLXEcxM6QylP/AP4I3/Oonj+q4bQlkG3GmKhH
	bLkshaeEoeBnLuyRTlNWwRPJFCuEnwT7msWXWxXp6fDrZKx3Mw3L2xj3ToOhJYar
	2j9+vFOuCrmKkLJIE/loUVlfrQ+orpVwqndBTFCqXkfBYg1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729h2ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:07:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so887344a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789106859; x=1789711659; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xnxDNbWLge0Lr6+dTC49mMkxncId8Rw69mBjWgWWmWs=;
        b=Y65/w5MBhBBxFP9R9Rb2uJHXt9FGrSi2OiFZkieyAJdkxH+c5hjr19B0sg+6O9K714
         ettnri1du9vRu9eIZFBBNL3Grh8vB9jzOpTet1YwgL3Q26qPy0pSE+hvuSpqNBtEOooX
         aOnb6TXS0yZ3v7ZFLlWqsAk6gsCQgABAwpJXZY2TvjzLxsL0IDVt3C0nASROpke9bfTT
         PZ4EF/ulc26R2KTMVZiTPvyDR3+IeonQ8maIO2J6XFDhSxwv/si8owSSD9Z2N8VGvMfV
         p3xzPpM6c4qdH09xc6YyEFS4OtjvCzQFr8VkIsOO/Q2YlX8AHDpIRJVpBzxOvS0kPU5N
         XxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106859; x=1789711659;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnxDNbWLge0Lr6+dTC49mMkxncId8Rw69mBjWgWWmWs=;
        b=ei3fWiYqo+nsYK2im9WVJXnrCXs6M886+8Cn1HUE0dKO7PhYe+6cr7KaxPncJo4vA+
         oLzKekh1fHqmLOV0sf2g0ywdm+vZHZEaePcK5k1i3y9VBLz1saDHGRKiACSa+SJhBrcP
         ZG5Hu6HZWTHnM6mb1+8fjC0uKkMzMBOiLQOtAODG3AItznT4IliVGU4wFOr+fQXwfSYL
         GXggrNxP5jVOwsTGS2/ii1020TiLwvjUhJeFtygB23cUGlFYTI8oRPli09D7w+E2c9kZ
         jB+pAZ8II98xVIFCrkjlvffmNd4ZjQDh1/jyN4Kwcph0KDTml/7su5yadgvz5cVEsnRP
         McEg==
X-Gm-Message-State: AFuF++myNc1WH0iHPQqtWpWoYIrmUbR415C28GnQ8Tkq5pADi9iv3cRA
	FRB4eZliQIAqau28gD7M95xrJ8biYo4+3jaikutmnFWAtyteaq0ZTerZpvh5UO03TTlmQ72ui/j
	QdxMSaJLxFP6NnbBfhXwa8g1sRvfB/7qASKlQQiXct0avQoNBzj45baf88FZOR6hwP1X+
X-Gm-Gg: AYBFou06CHo80Xc4r9PITn2Tl5I27Hc/k4eK1u1cwOEcK/CkJPHpfyDOLA7HKls87UY
	0iwekCfOO9QFZ2k+CRyxKFqHfJxFBpTp7x2baFAkeiVVVdOnxymhLUR+8bQdRYaF1aw3+vbWbt/
	y7zFz9BjuiwmxZRQZiSnRfizDZ1fc3tZLk442UY2HTvAKk7V278nCixLGyEOeFM2V491SpfmVJt
	3b5OnL4hTQFygQPZK/57gTBnW8fy2QKgj1hLrCc9EQVukIdFNPmOkZxwMZy3Fjme1TXMj9ea3uR
	eqRPf9kSTCnjYbP1qLTXZVTnjzwBFqdI1K7sWuwwvFLQEa1YFxpXN0cKheQ5JA/hrMfzMi8pA/i
	bw19Cz+5zLYIOn8s=
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr9365939a91.29.1789106858913;
        Thu, 10 Sep 2026 23:07:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr9365891a91.29.1789106858397;
        Thu, 10 Sep 2026 23:07:38 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2989933eec.30.2026.09.10.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:07:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v8 0/3] Add DT Support for USB on Shikra
Date: Fri, 11 Sep 2026 11:37:17 +0530
Message-Id: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWao2oC/yXMQQ5AMBBA0avIrE1SJYiriEW1gyFBOohE3F2xf
 Iv/LxDyTAJVdIGng4WXOaCMI7CDmXtCdsGglc5VmSS4S4sy8OQNHgVqZ5VLTWdTl0FoVk8dn9+
 vbn7L3o5kt3cC9/0AgC0qE3EAAAA=
X-Change-ID: 20260811-usb-shikra-v7-2dc0d3afc3d4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789106853; l=3664;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MzHlgPVLQNpKSuJ4w8sKSteQneKAclokvqITX6rQ4Fk=;
 b=FSgN/J3wBXz7NuEMOWyxn4Q7Kf771EMK3QnK4PR+phidxx9rF3Jlc/bJbjM8RdkylkwoJY+t5
 O31lAiYdMurCiz9LrZsSIcCbQrKAjZ8mCowiJRldumlnSAFP3p4BCR7
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfXyPIv6F/ivZtU
 buTiDqJI+cTMJopQx8w50K95C1jy5tOv8zO1cZHBMmmPgNK1X1pa8iH/VXaN1hAedIZfLrDhONK
 wtyLRoZokz3AQLJxN1cBs7DYnEjYAf4=
X-Proofpoint-GUID: ftl_4ewrb65sd_YvcFVCFuSyTIfgDRkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX9D4Bo29lydV/
 LG+CN9IBWfs3jtRLX+rr6Tm1YCUZMkW1xbhhkCc3uL5PaYLM0scsK6IbO2dQwmhoJuznLlmyZvi
 GPgd/u9Cr854hN88bjmCJbeHIPgdiXFVma5mCfl09hWN4WN5G6EjFNE4NOAyShAlHdFqcgjmrJH
 v3eq7Jd2GButb5w/qqzzQc3lrveIVFHUl2MgCD7tzxncpmCFANoyCHjt5sfTgsyc+I4kigRZJWo
 z3+VxdBecKCqEuX1+hqt9KOYDr7NjTFi/LVb+A1UXldZ4YEKftwGJWAWsT7ZOsxSp2Vn3NwTmXn
 8sGhA8t0zO035Olw2ZOzvMBhFtabYAaz4WqgZb/HeBrjlxRxa2hBjheOIgTLOkThduyN0gx67Kb
 WzzwxVo8TtlS6Den+znZMZnANlANZXNcOEpsfz7jzdl+4uAfOD0D3qyOUlQKJeizqncNPSnCB91
 PuMvmhYD6XPR0oubJ3A==
X-Proofpoint-ORIG-GUID: ftl_4ewrb65sd_YvcFVCFuSyTIfgDRkl
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa39aab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=zhzIyXmelIZ1II_mkIMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110083

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series. Also squashing Type-C enablement on
CQS/CQM platforms [1] into base USB enablement changes on these
platforms [2] based on feedback to squash related subsystem changes.

While at it, also sorting subnodes under soc@0 for consistency.

[1]: https://lore.kernel.org/all/20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/

Changes in v8:
 - Rebase on top of latest linux-next branch
 - Sort /soc@0 subnodes in ascending order of unit address 
 - Squashed with Type-C support change
 - Individual patches were previously reviewed by Abel, Dmitry, Konrad and
   Mani; however, those reviews do not apply to the squashed commit and
   are therefore being dropped

 Link to v7:
 https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/

Changes in v7:
- Rebased on top of latest for-next branch
- Added Mani's tag from cover letter to both the induvidual patches.

Link to v6:
https://lore.kernel.org/all/20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com/

Changes in v6:
- Moved dr_mode property to shikra-evk.dtsi
- Merged platform specific changes into one patch

Link to v5:
https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (1):
      arm64: dts: qcom: shikra: sort /soc@0 nodes by unit address

Krishna Kurapati (2):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: shikra: Enable USB controllers and primary Type-C support

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  43 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  41 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  43 +++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     |  12 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |  23 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 515 +++++++++++++++++++--------
 6 files changed, 536 insertions(+), 141 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260811-usb-shikra-v7-2dc0d3afc3d4

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

