Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078E3E44F9
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049862; cv=none; b=XNCshidHSqJmybuqojQB1Mw3wQKW+wiR9oFsFtGmOAQLhIZMHuVJOpavxAzMncrk5oI5/vRhEg0yot38uWHELL9LgMF59BIg+/nqZ1grWE6U658sj4wr1prT4lV7PFoqNXIQPadVYpBesYz3rNSQYVcjN9XnTm/xzqPM6PgthNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049862; c=relaxed/simple;
	bh=zwg1PWhkT+s66AP87LA1pYO8qx4GSQurd1KZURCWRGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E7ftgygSlsV8mc6TIE48nh1n+sSpsY88HxZJlNeR7fr2ytYb5+OgsXFBb1eCrMIxPkqanPAztQ6BERt89JDLMrXo2CsLdEciptsWCttPIRl0UFGCHqBTh4iE+H+jxDHM6v2d6WVvxVPwKB7RFyOiiP6SeWpZIla8BeRB0CHKaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmKF7GTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P148HOT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmKF7GTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P148HOT3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHgWp3045788
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 20:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TNn8dvyR8MKVhHoEzNadcA
	7+HBIVRs71on16l2k2cZM=; b=ZmKF7GTFTJVCKcPaFOTa0ojgxZ2gi2CyGffcWV
	Sy2iG2Ts3cWCELR0UdqZH2XtNRU5w8fJaoD7VLkUPrdk2pDgzxgC99x7hIBgFl3d
	BgrhM6WtsXgnzv8Ih+Og6dqGJ1nYiR8ip/TO1i2xA1zcDFNFUclo8o63UAjWvunt
	XCgmmSg5DBUZ+QA/6tYkCRLvS1RDY6Q28pcAN2XTx3rxenu2CcGqccqwhu54AE9r
	o8t2ABmZYEMGRYoOycLmy+g1L0dw0K7xiAsjyrQhpd6saRbZoErlUtjlwdTsBoHn
	nrLlBD/5sNYgA1ucSdAYLckHs0zCwemlDTgXLOAeGxalWOdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6grr4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 20:57:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2121681a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786049828; x=1786654628; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TNn8dvyR8MKVhHoEzNadcA7+HBIVRs71on16l2k2cZM=;
        b=P148HOT3S8OCoVg23IxLd/C2lw5iangpIElIuEGGDQxuujddhOlSe9EyMkUwxdrhyX
         SPd+TBHFYC7z/He+vZNUAjtzzihU/5x/lFQBEh7lhEGNXJ+SmVqcD4JIn2VLcjhSVC47
         9ORLqOut8LEGVF/w4MorN0lxeCXACcIXHjRkIKKYxU+C97X3xfE/CQKluNJAuTLGHqUF
         OjGbDlDX9Zt70P43eNGBgKn9Qy2MUn1B8Ic/cq427qbeTSdeKO/hkH0n/vWokmRDhzN1
         iRusJcax5dNA8bLN6ivk950jvaTLFkZ74NPbhasFQWnIdYqXPZpMTNJIkfu/z0rXGebq
         k0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786049828; x=1786654628;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNn8dvyR8MKVhHoEzNadcA7+HBIVRs71on16l2k2cZM=;
        b=KAqsqx0gWKhcbT1BGCBs7tgFLwJs0J2aRMqd1KFxsgb1nHz5iZlGaMDCpPaX9tzBWl
         7aZaqz8lSFt+pO5eXWJf6zNe7JtQNc+zwKf1QnEZMtZE+gVbs7acm+9+yYRd9XGV5pow
         9ewgiFZj6cY83PMe4yTi4yzLHtb+DKNGt1LXbBtNdW31ADtNqB0bzAPU+PDg4bMWZrw2
         dVaoBIEYQWrZburYv0AqYt48JcSiHtG0EIHriezWntsNTr8fZoUU4BiS3PdfmULV4KB0
         QmG7SjPOAPvz4aA0GvuQRro8tTGLhZR+VguIMT19nxdSdvWpZGd25LcW+4HWxz/OzQuY
         dtJw==
X-Forwarded-Encrypted: i=1; AHgh+RqfQqZTY9o+X5i80wNfcu8X2570d7S6iRoyhlTywGgOg9Fpke4wkIQcGLdl3m2c1xnHqQBXIYPKx0tsImCG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2X36iVgrqh3Fcg8lW6R3L7nH1gAwGHUM+Prp/OaBVZOdvmcc
	+lpsi5Um+qKc5Qgawic3xDeX7W8jkNgX2OhQ0/59RsMtDqaQRDqISAbCNJUM2sksgxDsOpEiyfB
	yP4AfDydT3Q0fnzU8YSv6/O9unIDmZy1LVtvSlklyHgBsflnMsx0EncAopcce8GGlJWVytsHtVT
	6g
X-Gm-Gg: AR+sD10PZ/IAjmtWtwWgPpNZJX7M1QiObeMywUaYz3k3LOqcx0pbVX7hlUD3DZ8cqUy
	9z79jykpSxrYrfN+mr0iwSaZvKNkyaukaXSkP7JXi2toCg9+eKtY/HzfRxHclvePdJFMZ1VHWA/
	RuECVwVMie3NoETuLJMavn6BPLe5+SeEGb0OyYRvWZVkzngoOvQUxG1LsxDn11EppVYHMDgYIqU
	pCmoW2q0/XbWThwxzHshYVzGdhatzTGejqGA/E/Z4OIrAnIjSpQKCepeNilcs8Mt08WTmtrbLmG
	PHdzNE4r3xsEaYIvI4Kn6s4Ep5MwKAX9zx5Yl5eLfWi4mGYW3eJ/RhJN60RmGFXU6cPt89c+7EM
	NcWMyhH+4BBx9494SgqV8y2LvFSfoHQ==
X-Received: by 2002:a05:6a21:6089:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cbadd74818mr5812855637.36.1786049827583;
        Thu, 06 Aug 2026 13:57:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6089:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cbadd74818mr5812802637.36.1786049827036;
        Thu, 06 Aug 2026 13:57:07 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bc667f1csm116641eec.12.2026.08.06.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 13:57:06 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/2] rtc: Add Qualcomm PMIC RTC-GLINK support for Glymur
Date: Fri, 07 Aug 2026 02:26:29 +0530
Message-Id: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP30dGoC/yXMzQ5FMBBA4VeRWZtk/DVyX0UsqgbjSkmLSMS7K
 5bf4pwTPDthD7/oBMe7eJltQBJHYAZte0ZpgyGlVFFJCt1qsJ/E/tFMrO22IGVlojLKC921ELr
 FcSfH+6zqz35rRjbrM4LrugHE0cPndQAAAA==
X-Change-ID: 20260806-rtc-glink-cleanup-038163045afd
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786049822; l=1734;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=zwg1PWhkT+s66AP87LA1pYO8qx4GSQurd1KZURCWRGg=;
 b=LOKErvm6JLx4BuX86tRV0YI6PShIU9b1NqyPmRAFS6Wr8SXiByIjjxaNmc0ZnE13+V7aLqMz4
 XXt9YJMfoJvBqA4UI8BauPAzEyN5F4rPIu9TCJ52wymtjmJI6xLP7sK
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a74f53f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WiWho93J9qY7Nhnkw_wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 8zHFCGXLu10dJL5iePJU5KWCZrY9t65G
X-Proofpoint-GUID: 8zHFCGXLu10dJL5iePJU5KWCZrY9t65G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfXy7yz5dPaBJCZ
 EuBwLhrkHULtYGGVjMqz42CFliF85kGO+QezcqRbHYA/Olo0YJpYTNzqSr4lEOA7xd+o2uYtql9
 /jKhijL3RItBedPDZghxS9aosu/t6wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX28WrmnL6i3Hm
 Q7cMfkTj+rehbJ/4u1DkKgm7KZlvsRg8q6pPMJ4Tn09K5rxr5hh/bDHai3NcsPyRIbAjgyd1xw0
 WUZJmpsIQbAiw/axD87htIggfTFMWJCI6C9T5Hfp6WHyOftUtj4iOGKi6kO4sSg5+8NCWSDsI0m
 2ErzHb3e9amE0CiO7R5ZyvykYrRy4GdLINWPAbyRg6q++obQSqg8So+ac9t4AAW+Fwn0JhAaRNO
 nk5ML2Km/ooDyfWT51QgCKK4hLBDKpC0EqV4Tj3B/nN9bPtw7DQdBjNKZc06+l/WghzIJoNBFWP
 VPWHwhNhicLOmTncholNNOVgQ1ab7HN1VMJ/6zvCRDfHh4gideK4gii6sdL+g54ZaqpprqEjJBb
 loDzNWKNKVLzLBtc0Wmrb82Nozzu60G8kJaB9OrCNVAzj3RrAPMVgvPayJ/v34QWZKYA/due8R5
 rLS0l6/3e53BcvO8qrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060163

On some targets like Glymur, the permission for receving the RTC
alarms is routed to charger firmware running on remote subsystem.

This is because Glymur boards have to  support MSFT's `TAD feature`
on the windows OS devices.

So rtc-pm8xxx.c driver cannot recieve RTC alarm IRQs via SPMI on
Glymur. So in order to make the IRQ available on the Linux kernel,
the PMIC RTC Alarm IRQ must be routed to APPS via remote subsystem.

To implement this, add support for a New Qualcomm PMIC GLINK RTC
client, which will request for RTC set/get calls for time/alarm IRQ
 via the existing pmic_glink interface to the charger firmware.

Also, add a DT property to explicily support enabling the RTC
writes, keep RTC writes disabled by default to align behaviour
with the existing rtc-pm8xxx.c driver.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Kamal Wadhwa (2):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document RTC client properties
      rtc: qcom: rtc-glink: Add PMIC GLINK RTC driver and extend pmic_glink

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   5 +
 MAINTAINERS                                        |   7 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-qcom-glink.c                       | 690 +++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c                      |  22 +-
 include/linux/soc/qcom/pmic_glink.h                |   1 +
 7 files changed, 735 insertions(+), 1 deletion(-)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-rtc-glink-cleanup-038163045afd

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

