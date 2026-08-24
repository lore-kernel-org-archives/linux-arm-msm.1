Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8EA36A356
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553474; cv=none; b=Q+obm0wQqpt7Slpj+iY8kHt6jz7mNZtoA7H9xOe1m2stUY2r4XAyxr4ngslaa2KQr7gROir44F7wQ7+cCZxWDuPjXUR7GG+goSxl7H0753p2WfsI6hsmVbjPSVDOh5X32TVraKjBKiW1J0F7zrKgYetkeXXKu+B5/JT8A/TfQb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553474; c=relaxed/simple;
	bh=8+i+ccLxh6LDcZP5Gh1DQIKzpVOUj9D5y2r+79BWzJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mdtCMV4tWTvh99DytMJABUq543qIKWmP+ZhXp/ht/dg3lBsbVb+DOQpf8jnnV2dQCenPXVUD7Jjx0vPqRptdunkDAlU1b5Tm4HJvN9ptSaerhT9efMIVWOOHw1K85flVQ/6bWgUxKggJxYBFOwsgc9YPXdJ/wdwQvximIjcCNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjOUXjQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYiEMRsx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjOUXjQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYiEMRsx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9ah1937606
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8pOWX7mEcUUo3NdzZeNrT7
	XWoFlnxo1OqZkoMF9fLwU=; b=DjOUXjQauRh5y0Vc1QS0XsKqj6DR7Tw7EwbaKM
	Cpftoxd5/E5c8e5N1gooaogw5sZI7kcvXAUZvNUPWo46CMNFzEa0eOc1Cg9iv1r2
	VEuTehUxqj2SGTTrJFcE/VyIHEjg4iZsw6ACRk41emcWG6fnsMRyi+uZea4VOOF2
	JZbf8yueW/f/eYAFZgFm9QBMCJxhOKs9LvDv5ss01uO8YJ1BGFHg5VM1ZEDDhQdv
	F/4cppqQPQi6UmvF280Xf1gB7NDZnRKUvzasZhI9izF31jInhayS/frxMLzLm13v
	s0tDuoAU6xmOX31tOCP9hpptJzAyq9lVgV460YpschuL2Vcw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwpr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:37:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so4384725a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553470; x=1788158270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8pOWX7mEcUUo3NdzZeNrT7XWoFlnxo1OqZkoMF9fLwU=;
        b=IYiEMRsxhWiE7XRCpAYJhbaPSp0qlb09nc3qKy4GIOK2cg2u/A2OARjT4+IFsXI9Ry
         33rpajNCcrjniAdM9KenllNHZhfn4sJbv/b5MnHhYluN5IhHh8coE6/RX9gNjQWjUh+A
         Dk+iJzTtEFtHv3s9PAw44AjZaMckkOYkCiYZTHo1C/GhdF99kA6ymZZvyYWfBbW9z+4l
         Q74DDA2KR6VqZC8AgFCqt/H/4HuXGQEIJZ8yOHb37Yry685WBTkhoOgdxJSaegdaWt7s
         EM/dDGg7bVDIH6GLVDGBQ4LyCPTGD3AZWXmrZGGgn5j08P9gzlit9SVkqejdVDdNPHJ/
         sNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553470; x=1788158270;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8pOWX7mEcUUo3NdzZeNrT7XWoFlnxo1OqZkoMF9fLwU=;
        b=ZdOVVvO4MqV8KcJNlwa114RhAeW2Bg3AUdmd8T2XOlsndBmcXBT+OgrWNd/kqdULcc
         CFlRUISR4Jj35I2uaEDuTgSvsdA3mWLwnJtPpt9bqPeZ/Gck2r20IgfxW6QUvDBnYS/J
         iWRZjeX+0nXPP0KgoKLj3r0fnviRW0YDAH42u601UWr7zJ86WYORI0JTJtQ1vCO/90Vw
         GIR7JIQqTvm9wyMhV7ZNlkeDmZBuRvnRXdpEUxrtQRmCx37VDp7OHyzw3eweaCqc7JSt
         Ds9nzoXMqDner+4qlWtOkdpr4+rsGk84W2N1B7mhRMiCUrBRXK6zTjGEbDFotyW1hbF7
         Pr7Q==
X-Gm-Message-State: AFuF++kTNmnIRzAu+YL9CO3UVUGc2sHkCe7EiNYI0iRdOyx5Wvf5KUBj
	W3MTLa6IhikkG51E3oycEW8yGFi9aFss8XzSteWWutFQYcRRH4rPtr3lIXTB61yAaKgH3HM8tlh
	wbekanJZyCBv+5x73ep+fC3ogZhQ3TI5UYQba1lzt6eIpku0kUUK5sWOI7jhnkIm/WNGB
X-Gm-Gg: AR+sD12vxIXAFAl3zYeDC28qiZErbGO/g2iMzGQaq4TdhM8jWJbgBKnKuYRKKOzbuHk
	Xnsf3kNh2jfkjsk2InwR363tqf5YNmpfdCiT7Yg0IIgn0optHlPG6AbSQWX1CCZMxMCSav1D9NA
	hySE8leSf3jV7Q0hi+45WS360i1QYu4IqiO3JB8Uo0wIPjH43VCHHi22lVtG0BRIiAqR/pi4y6F
	MBcPX4kyiVkZnZVYH6dCM7bwR756lELDvdA1EJSMZvgKCHnFGz7TyTI1wqifQUNtK05SrxI3rr2
	fMAfDQ8jH/WEqpnO6UYPEEIE2SCWlSIPxhrj0t51jlY+HGFnKuR9tzoVJmEiQ8GIVql76VIl9bw
	BwpZM1TjzEZXliFattyUZ4Z5cvus7OHSB6m33hGWH49UegomuNlEscQev8kTw3C7ti5Zq8bG/AJ
	vykuC65dbHnN2QYR4w0HsS8O3JVGMyIQ==
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr37328303a91.1.1787553470436;
        Sun, 23 Aug 2026 23:37:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr37328255a91.1.1787553469952;
        Sun, 23 Aug 2026 23:37:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:37:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/5] Add support for USB phys in IPQ9650
Date: Mon, 24 Aug 2026 12:07:40 +0530
Message-Id: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTmi2oC/y3MwQ6CMBCE4Vdp9uwmZaON8iqGA5ZB9kDBthoM4
 d1thOM/mXwrJURFotqsFPHRpFMoUZ0M+aENT7B2pUmsOHsVy/PwZefO6C7wVm5C5TlH9Lr8lXu
 zd8TrXbC8j/RoE9hP46i5NgFL5gOsqNm2HwooH0GGAAAA
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX50p8XxuFB42k
 c9achkonN2bdEm6PMfG2POKuGahdX63dzuHZyXTs4tXdOeYGxSvO608DdxcyFyF3bmiWCyRnsQK
 Y1fI0wYfzQ+KjNCu4IZ5YCa4T1Ck8Q+EsFjSR1OFKJuG6T95pzBMwRQoVnnAqSiHo3+zAB7JzRi
 3vXMym97opcrk5fM5wc6o5n2VwCNPNv2sghNafIfNwhKofpyKAahf7I73CE+aMD1tY8vrWoUdwj
 4lh231c6POkCUrc4a+uiiWup9j2iyk3IbXXUWj8nNGKgAvMeu5w97GrtyTbgYe5vovb+fbsb+Yk
 yFeLBap1P/3hDqglhY+6FzrpKbFbQD6g1WZMy2F1VQURyoZvqLYI0V0CcZJ/9y8yZ5jusOQ22aJ
 vkYYIBZI5cQ7F9NvS3o+dEhjpjnReOjIZfvlyZdERbdEaF2m6r+MpAB28mX2jsaBPPA9wPqJ36G
 WlT46p+zDFvqCR7l3aQ==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8be6bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QVgSJ0PFQKcnxtkCEG0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lOh0R0HMZjJGAGuk3QnYT3sPwMOYiTNV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX1vCM61ryEQYX
 2Tnf57NdHdPM3zU4OZJw27gFOSm44SRfuVMSo07SmWm3HjWb2mmFprjINk5yfxAfrEe/d2dG5WH
 7Vlvu6rC+12RXHfTqTrEv3wK8+hsxzI=
X-Proofpoint-GUID: lOh0R0HMZjJGAGuk3QnYT3sPwMOYiTNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   4 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 182 +++++++++++++++------
 4 files changed, 260 insertions(+), 46 deletions(-)
---
base-commit: 862ff50ac20d5e0899a5907ebc5ceee73ed4b099
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

