Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F3A3B6367
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031889; cv=none; b=a/nlzuPoEyp5JzBMVwpCn84nBOUm5KJ5Zsh2imVMeu/9R/XamQ2txL4lDCQgjg7+zBbqIWQjxtcPz5Z37JEs/he89YEFMnu+vjTFTmzN9V9zOICZA8YA0yTKw/Xru+YWEn8/iTgh8K9T8MqaVATvjujKaejwRWSsg/ZxGx+oW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031889; c=relaxed/simple;
	bh=oMsTPVxD3adyYqXrZsEmwysubsy2RQPrnblfLqNinT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9c45Q4y+hXcMq9/rWJXIyFND9otr2ewgYqouHNxWRnJ9AHifq3ajFjt13VRQl6QRxFFTt546+h8QDZcjOED60v6/ONr5agrbr0RzCLQ2zPvDjV+RLyEMCs0t3SF+HIoB4LuwEpZwv4W31dEQ3xDtjOKDqibkPk818AXlygpGNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcL+gMAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDUhJJu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcL+gMAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDUhJJu0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pjY43967745
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiG
	flj4Zs4k=; b=mcL+gMAEqYPl4aemhJWYDtTHCKbeNWmqxp7JRl+KojLCtxEZbW9
	w7IEfNqNK+QPt6I64B0Mdr7RLMnAVlj5FwoBTdUFvQD9dtSi8kz9AGsLJqijJ8wI
	buH53sKQEkkWgdLRrG+JfgMKpFMoRw1HSFfXjQM27LYLv7u2iYK2sJuKHJDGEY+a
	D84vEW6sYSGAjWR0BtLozQQWlC0pykonftxWR/eere2xWzbc4XiBgPdtdNkyL4Ma
	zq+DBqrGaHIaoEesBNWAIw/OTx2J1YVCT0p1DNoPCnydcvSL1egok2kDlCK5mBQI
	5UowIlzifqsTi3PZNkxxVCVBuHK7dr0/lNg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn8c1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:18:02 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb6a8c61deso6093953a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031882; x=1789636682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=CDUhJJu0A0t0PAViPO23rPcJw0h2ePXgGVdm4bKp/KM29Z0gZUtMJn3M1V9nOOgzft
         pNO6UkBwMEhaM8KeHfoU+gs31wvmMyxC9ZqVj9dH/OHtBRBNGPxrcDLOMmi8YG98hD3F
         lIJeStukNlcdY6qXUTJRuPtSsEwULFiEX6cAPd3JJEnkAWU/oX/ByH7rMDf+esafTy4c
         3JZas9toWAC8stLZlbEABFVTp/TM5DpW4wumOrN5nVGhxbzi4sot2tr5lOa4nfX9OYTo
         6AWStW0Uf6fudOx94nvUD7m+gA8BTAPYctSea7H8zAtWqkBTkqtmGMvORBMHZjozD/O2
         LWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031882; x=1789636682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=LW5PhqUwaUBHLTpB5utpZrA4cSZgWtM9mGcYzHgvEshZXj7zGHEsjYz2IyRCFz/wH6
         VG5Vcy6r9k7PiEHdvp+ENvMutN7hirXRdA7hE6+J7YdTWzzMzTzI48qhb+fpTjDBldwK
         e0SvNvwhAIq7vT5RBL4FxL1T39eCgyePxMuWGtvHEOm1zluFen725nabzIzTunhg7pzl
         zh5E8gGXWhzdxmYRG4yabI8kcQxrr6zbd9hADWtR8dT0/gunHBXh50KKdtacDnUAfrmg
         LnrVlKrROeNRQsPBuGKv7rZPlonbemQfEo9HmlacQL6n8XJSxuG7Z/vsRF+896oVc+Np
         vOlA==
X-Forwarded-Encrypted: i=1; AKwUvBzlax6zfyRiRft/v6rXh4Di1XdFvfor818+Bpwz9RnAAwazfCpmSGGmwgo6bMljpKAXnwD82fuYuLyT23zJ@vger.kernel.org
X-Gm-Message-State: AFuF++maRfHs2ddpi6c7lN2ASUvodNAK4DbEViTrs/O3lnvVp1kfLQsU
	hAZyyhrPwbNXbi8fV+Oy8bli99wDo3gWYtaFWCH3/dd9JeZsHeSz2HO1NMin/sWt/1VQ44miFei
	ACKuiN6kl0y2IuFF9wNYYWwE4H18WBVdOM83rgFOS1rTKX+AvfLQtevR86sGA286/C2gC
X-Gm-Gg: AYBFou1GNA85yYJDJOqqs9AqkiaaJtyqIq4e414awK9wfjmcP36dn93CcAi4D3XR+CU
	w2Jx41q0jCCO8pdgzn0FuOlMjGSjwcanPVlgkRINEk7z5KZ/cN12d0LuUw6OXN4FuXwDrRcwBEI
	NCCnMrUGBuSMCcmrX9jjy2TAnxP0lTn1VMRZkmnLcH8djBd1uPcXaT/xV2Bf+FIE0pC9NVeqW0n
	V2knuGbpOWZUPCPiXZ90YGX9LDU6yzoR+fvYcX+5rrJ9EX6LhCUxocOX1TzeVBJnTXSRpX1R9Pk
	mhOCt0asyPxRARFzVmwfTvkDw1qVPnfVygFWI6a2fNITaO4f8GwszJbbOhc4mC6+uCkCz0B2zFH
	q9nU5VKQ8jMlo+QNK96QW2Oyu5d5KMWo4qTGbO+Y4abk6y+ZeS3WxzeR30Mb9
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858901eaf.54.1789031879243;
        Thu, 10 Sep 2026 02:17:59 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858879eaf.54.1789031878830;
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm57395988c88.12.2026.09.10.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Thu, 10 Sep 2026 17:17:49 +0800
Message-ID: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX760yQ34ERUnu
 rjUHj0Kdze65ZX65I81OloYAcZU65YqehvBbkT80aC3WpG8fbmLpRXiJdg9cLkWBfH5rIwLbFjH
 eziOjZNm13+lRfs+vCu9sg1CgnomY59Z3uBd8X52m/nSkTCh0BDs0bafZ+lkKYE3jcCt1I+YNih
 gfcLzAZswqoLzO43ozBDTUVZVuhIGaEyVEdIf11wXT0ieP/JPFfgEPESFb0DWvurmV35zEU0Fri
 0GxGdk3H8+I1Bm+6WzVJnuwL4jXIvEwEaNB+OiCJt0LR2YrsN0GOySrwRT5OqaDK6QGMbXGxxiD
 hEmmV8LibVib93BV0j85WgR7PoQsEUXXCEs1xJV5EKIYKyUG1ZWRCLmZxktwHNtsI+1xJe3q0S5
 2QQFMa3c3BjvSbTIQfgLoZMMjYd2VxzSeOkCMee/ChIcf5UKHjTsr6uQsSwWJK+acUdg3fx9BjF
 Xcy+Qypwcd1ntLD9UVQ==
X-Proofpoint-GUID: 1Gac73i7PQgdIb6wlVEZh6scnPQ6NZrh
X-Proofpoint-ORIG-GUID: 1Gac73i7PQgdIb6wlVEZh6scnPQ6NZrh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX+dIFN6as1NkR
 LkS1gMLqewH452Y3NXliOKOsusQj0Ur0ry3YkcMKFZ3oH3UXwDo8H/9cuWac8WH/lrcWkoKim9N
 kSCLeCI9TticQxzLLVbXwTakAFKaqe0=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa275ca cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100104

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

