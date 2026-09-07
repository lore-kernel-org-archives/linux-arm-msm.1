Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44A3F8ED8
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762851; cv=none; b=MpA7zP7//quZOo6kfa9O9/hOvozndmjaJGI741D+GhXg2KIbt7u8l5889lNmu+a9UyBGamJ5CwLgXwIWfCttRfG8yJqQr9teIxrxJF614ilZzLDeZ7YzczVUrh7TlvCHXAP+WeEPxfQhTtkmkZsWVZELZXH4mHJID8z3XPqQzRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762851; c=relaxed/simple;
	bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=quno45xS7vwYzbVfG7Md/8CLLK1fOzKmLhG+06X+ZoOShZLSYLfQL2VMfbZK2qlNA5RkdizB/PDtmorZCCA9W54yXjLbmVJYZaxg5j2Vc76Zt7EkqdaIr5hI1AZEcUexqfE2Cmj4HfzPDB06qjV+XLW/Ws5xzOiEAlJ5Y15zqJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGjdxOGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLyrGUNo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGjdxOGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLyrGUNo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kpdt2219064
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 06:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTvHz9qoo7lj/uPQcyd9PK
	fnFrlOY5B4lOYc+cWrhM4=; b=DGjdxOGurNmE+bZopB47TB2PJonBJ+xOIJRcdu
	ELSsxV8DHkRNv82HBz99H67Ek+sKdyf18XjhO0D9hKBYJRA8LU1EDVVyK2xdHHyh
	uIeFaG/HVDCTtThOptqNqVBmc1NiOFsQjo7zSTVdo7vuH8JSiSa4oxTBC9xi9mHy
	Q5RwgtHwcUFEF0fJXwmMZvr4c0j8F/OzgYeSlOue8vqmQtNKuRjAC7cZ37NL8vTi
	JsgQ9zGRjEFU2qxtR3tArMOFltbHZ0jO0bgl1ZwTFnTvPYNd1NWiDCCDWcre1mCd
	bQgHmiFEsUtFQTN0lpD2w85/uJHcPDbY9Y4c/GsPAzfHm54Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca56r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:34:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d52734fc41so59108385ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762846; x=1789367646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=SLyrGUNogNZz3g+4j56CFfa1w+DBO8KmIjMEe+hp9XjTDm89YGmnnqZOFId0wwA6U6
         W02ge4HdVkpHB06sUZ7fft1545+RaNek4ktBKerLHqYzuEyivZZ9Em+aOdwhjZsyELIQ
         ltVCpu0O3Rr6F2hRlxLYhk/IzVsQfiEqZNpP5bIwnjxHoD3xwWkjcWXjohp2EC7vaTF3
         1AJza3ZhSa5htkmX+WvSFHy5u1fYdCUzVtR/lp7yEiHRwJ71tYL7x/iODZxwJ8130huF
         3+eSYONauHJbEipWqQx4FUhg5LTHog1ot04vftyhDtX4DgAxnJzyyAfJaIaPMORo1E3A
         rVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762846; x=1789367646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=KHfukWDRyIo1fpnQgvcxOeI2illf6rtIm7w1Jb5joxttPgdHHkYilvI5VjD2JPfhcY
         Ae/1Wkh+nr+xACFCYidAx2FFrPh+ysS4Sz4mQnWNhqkp91UOguN4H8vQVgeFL2mq7wYI
         enwi1fah+EXcKonZ1ca9mlcVlLuwVZ2rnERYNNe1wdd13B/9zkVtRhq6SeRFsqjXmHsd
         Qx7wOqbu6ixiHUhrj3SXDg5NEQzxbqUtU3cCI+Wq9T3SnBHcEQc5Bx03SasK4utkef6g
         VAx4dsQ9Sg23U6cn5soBgOIDP8mBQAuyr1I+iJ0RqIFxg3qjbWkq/REOEFRDlqejrZk6
         +ViQ==
X-Gm-Message-State: AFuF++llQDqcks/SaBWTagtaXJUFFLAt+pGoO1Ko7N9A78k5kj+EwInE
	MqvE4uh3CtcMd4cYvKH9jQKAJSFdWsH0UGu9FB12HRs3zrOTwAZWd7gENkYavKF3iKTq947gRVG
	lIDFNcFuBvivUyh1iESlzJAw95Si8LoitXWi0lz3E0iTzeEDalFTjXvuQQ4XkFzjJHnkk
X-Gm-Gg: AYBFou2IkMDSkBfuyrkl8wp+XEKYtJxNCF8M1SyOUSDehs/w1q59knmGRqik8fLEvWJ
	nensa8aewM2PKTWwh1pFnUuL/UfIlOyYbsJ3QaN+ZlfqsJX4AIUtzMgw9/sb3aXAEyEhQyKxlVj
	p0PIYVLOGjBgEHPHt4OfuTf35Qs/RtgUMun79pzoUB9K8Z62ZctGu9icstbYW8P9ykJ4JOEvjb+
	sceOkSLRtbKNbXHdVDc7lF9NSJevptK4g/BMyMyJ4Tl7e6DCd2OPUet85b5ckbalEwlk9sycZrt
	wdAlEs5HszYXOSbCmDXSO4nw53b6zMKkEwXWXh0t+Sye2biuWjp6w0FLByxqK4KEg2Hk2poLQrG
	ozkPsa38eWjLpgunpVZLDjJBU207mu5DyU4oH
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205997375ad.4.1788762846129;
        Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205996705ad.4.1788762845710;
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel overlays
 for Monaco/Lemans EVK
Date: Mon, 07 Sep 2026 12:03:52 +0530
Message-Id: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFanmoC/1WNQQrCMBBFr1KyNhKnbZIWEe8hImM60Yi1mmmLI
 t7dVN24GXjD/+8/BVMMxKLOniLSGDh0lwQwy4Q74uVAMjSJBSjQqlJGxmvYNT3vupHiGR+ytMp
 a7x2pwojUukby4f4xbrZf5mF/ItdPml8i0m1IU/03Jlpixs9UnS3/liId5AhSSeXKClGrJl/4d
 cc8vw14dl3bztNZTdo9MsnpE/o6owZ0YcocEKA0eUVWO+Mh1wiOLBhdkANjQGxfrzdHoQvmBAE
 AAA==
X-Change-ID: 20260907-rpi_dts_overlay-58088ffce047
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=1868;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
 b=9avyaWPPCw4SBnNo2p/iK0EDEjdBweCAtXOU/opfYBJHasAIAmRVD9+i6mgC8y1PDw/tAUviQ
 OYo+WLXjcfVD991FSX6jBhoPb5SSd98xVqa7D2Wl4OM4LpthdrmEn3X
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: F15PgiWqEElSvfVHcR92gLV6BiB-rmaf
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e5ade cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=aaDu5AvUN9vEm-sYl2MA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: F15PgiWqEElSvfVHcR92gLV6BiB-rmaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX5Bz5jYevs9MT
 Trc6rCKNkn8vXweCGLFKuE3Vu/ero9BVmB+hJgCml28CfMWGgyzxwUynr4PnAZ7FPNRbxBNoSAl
 uWg+lSQ98HdMqrM7/Dxl9Re1rmz9dQeXrbfCdC+bZq4BkSP2fGWaq330allOJSQAJ/JyTikQAzO
 jnl1rK2QB+udHxQNNodNG8NSkpsmP80MBUYBnVJ/X/p5kTu8Ajpcm/e6vefyLUSR9v5ZE410J0z
 1vqXNWvRaWYN5/VAlKHU7NplDnuawm1wBo9VSm4F8GzizXndxhV3niR4ZltftYgQ0d1W2MloUSU
 VzyZOps99Krz7uB1ED0qDw4NavhzPbA0SVu1/wZcFzzmyzfc51Fee5qyD5rP3bdOMCp2x0hYqYE
 YbhWRU3sEaavVTLQExcOR4iZBWtNDAhA2vdm6ZGC2r+dOOmz3F0BJ3W+vsjzKMUW+bVZrAXLJ16
 Ys3yrBkeCjwSF64PHFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX2gku+0zLLbr4
 sUcFm3Ss8Xa7TH6KdwyFwlaT/iJ5fu07qsaRoO/3WzXlfX9GlA7FMqzJETYC8lGyz8EfXTv/iXN
 MVMFdPJNxoMYMHuLB/9cxQbXid4WsmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070068

Add device tree overlays to enable support for the Raspberry Pi 7-inch
DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.

The overlays configure the panel on the primary DSI interface using
a 2-lane DSI connection and instantiate the panel MCU on the
corresponding touchscreen I2C bus for each platform. The changes
allow the Raspberry Pi 7-inch display to be used as an external
display option on both EVKs without affecting the default platform
configuration.

---
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
 3 files changed, 169 insertions(+)
---
base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
change-id: 20260907-rpi_dts_overlay-58088ffce047
prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

