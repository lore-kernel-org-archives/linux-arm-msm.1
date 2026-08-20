Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D26367B68
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237448; cv=none; b=LR8d1ySig6+NKmUITq1D113hqWVlL5h3iKrE75xDgvbGtkI3Gz8SK6du6ymkcHqDTXqulNGEb1hqemU8hKrCRCa5geTRjHdCcZfUUrME7R+rf3nv3iWt3GvrV9dsZaYkY6ZfkRbwIa58xymKAIQi/IvT100g8gWwpa05vk7w+WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237448; c=relaxed/simple;
	bh=S6cUTVkOjnkG5QgtrHI21qh+KP1x4A77E9/b8qhFb/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QO9GUjHXJ+KYu1OaoQKWBPwfXAWzRQS7oWzyGq30/A2G2zwSGgHiNqbaoqFDYMxzQFtPxwZT6eWaZdDy66RpPDt2GFlpsCgFDjXJ6taG+rgNdCgrqGevIyL0KQdJ5jX7WA03dyfKyUSSbfx0d/Fk1rPa2YUYJ1SPLrEXMPzR1Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA2ONE0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RegOUxkq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA2ONE0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RegOUxkq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7ere3987813
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDcccl
	sF+NZojg=; b=CA2ONE0duTxX4Q85+/itAjDjGLPQulXd6ih/a0pUMcBKFLgzas4
	flmVnvBox3zbX68G9YHQPp2gfjjQ0wQi2aqTiAYkoy045pEZ+gATA5BabxpuxXoa
	YLkDURHjWSiJ4KIeq8hNr4WCUL4RuCYhxXxHTO5NVPaXGkLHa3Syb+972OJ8I7DO
	mYHbaRbTW5pN0nuXNbdK8QdzcQEx1wYZTlQnjyv/K4RBypWuHB0EfUIyp1uLGPFU
	s5uyuC+VTEiAFtQLyKtEeNQhQE66ytP3QYkF7CVwjeDeOjhg62Gy6lWfTp/T7vXy
	uXJclWdB6lY/OLJoEWoLaS6TMUNOF5rTU8Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8951k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:50:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb60cfd476so2992964a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237445; x=1787842245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDccclsF+NZojg=;
        b=RegOUxkqjV3ojtnMlVLmOeGMc/hqGx7ExcEHEc0HcniEZdKU/jl3ZhTlpdd9/LNxs6
         viuo9AWe7s1sQ1vCXLq9IcQFDXkjUZPt6x8Du9CvCgYk7mca3y7CNLdCoK0XPDo2a7Tb
         Z6Wby8D8wvR5ys6ncWHb+QLFJJXsqY1DUHA5aUZcofoZClkZNhOPdKuzVRq/V2aGUBTb
         6MlXSmCmvty8XarbxXHbZM7f3n0Z7hgjQUMtxnaEfILbhLQt3qqpkFgHaX5/NjnGGd1Q
         Ex6c9FplGcrhhu2XAhjT+nv1qUX78HyronczY9mFSjpSqRxVRCO4nY3B6ncCkYyY2FUD
         IF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237445; x=1787842245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDccclsF+NZojg=;
        b=NW/iK3mYCDXJDNrPGB1E9hVby5Ur621wt+vtjoXi2EjJWCEZf+kyNSgxqgDLhw2u6Y
         hN4P/iPTGkN7AXiNGt/WQMIL4kesdeMW97Fm13nvsyHvZtVo3NVOrDLg+iK0NttN6Jg/
         gRiIJUFKHF12eERspQj8QzS9O5ZnzkR6Cyf+tkk8DxI56ai8hWFrxcERl9k1kxbLz1uB
         V0Ct9K55wV3HQ8hY4T8Jk12vFuOLFsQvLiB/OlZisnJSu8HKoeCFc6UDjpGHp2jdEZO2
         Gz7lD5iczDXUGoe98KoupSOW1RC0KNPYI9Msqx2joMiYCFdKQw56noVr7lZTh5lgS0yH
         5HuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbT5xzQMqjeueQDxTNuawsL3NZHS7KvPNM6KgfpGhTSqyA+trPz34WUMk/nroMUl0Bn2MinUJ3nH5Dsq8o@vger.kernel.org
X-Gm-Message-State: AOJu0YwNJ5NADQSnyt+DMoDEyUxORcteVoTFmUzgjzNcUCBe0+cORH0E
	nS3FIsmT4SMXiZb9mkAkb1tVoCRwINGqum9QJxmV40TJS0UhSLR/+ln0M4WI0ILrl6fhtLpPQ+C
	C5EFfeTME12oQ/KTmWloC97WJQWpX+VBbZEGrFcZq5y56ie481SSdsQ3azUOAL0A1Wiqb
X-Gm-Gg: AR+sD13nn799Kl/cl3KEWqDZ3gWMbJoEqSKNE0Fe488E19qQp4gAL8Oys0DeiZwfCkC
	S7QRkMZti+cjMvSbZzIs1ZqqLrqBi7/1Jo7qe8GDyt4TVHoNAJ6FlnbzUVjbKPVduJ4F4ilJ9ly
	ErHTQ45mzO4w/Y/BJRSST2eOtJsrWE+z07Tb9kpjb9NVrpx9LF/5H225uXMjpqNqq4Q1v4RLe9i
	6Zu7ZDjXpZxyqN00GJcxBk3JswybVl7sbtsc/Jw19/kgyvYEonqXM1bvntbPDdclRuPbCVPw0C6
	u+K/tdn1YxhSw/jjtG4k7a9ILvBkzRfTXJ/8x8QX4KyAn3Gi2tK/gpW4OWXUm1fr19GzDdX+E62
	BCrOgp+uYPUiGfM58iD9ujScz4Mh5
X-Received: by 2002:a05:6830:439e:b0:7f3:ff22:d8 with SMTP id 46e09a7af769-7f43fa82a2amr11733507a34.9.1787237444793;
        Thu, 20 Aug 2026 07:50:44 -0700 (PDT)
X-Received: by 2002:a05:6830:439e:b0:7f3:ff22:d8 with SMTP id 46e09a7af769-7f43fa82a2amr11733451a34.9.1787237444280;
        Thu, 20 Aug 2026 07:50:44 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:43 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add usb-role-switch support for USB Type-C ports on Shikra
Date: Thu, 20 Aug 2026 20:17:35 +0530
Message-ID: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX09zQYkSW8BA7
 DIi47x8PdXx01uWXYC+1VCuPRZbKV6xjm83BWU2NEAz9j7dw3NmADCructHb6JMjAbw7H8M3KA1
 KQ5fPXVmjs6btrlR0XJ8v4nkyxUzw0g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX7uR+Et+SBlYN
 SokdXwea1VE5wftE+G4GZZ4P22ZfGwB6pxAD4mu6tW/ema91983G6skxkoXpCSlLepalJHWZHcz
 2PJQuvzhXOZighHEkRUgOtLcXqtjtp41uilz/Y0TasfNVRLr5L6kypJ+25Jt3FqH7CTXhISiSEl
 E+rXi5jp6so/aAYUgPZutCYKj7inYtxsDmss6DEwv7SWdgXPkis1NAEy+0ylI8zt/tAL93yKeKr
 4ZihyWwq2SzUAlL7cHsoY7LMY7HrBO3Z7H6UPygsj7VJzPYTRnf7H/wGk91avJNPVK3TSE3p4lK
 f5ucb+0kTO1ip4jJAysPXOocG8LyUY72WIaLvdo41uu0NPtN+wiIU3nKnq4r5xlSptZno+VkqKv
 nYZ8ODzOzfuQ7/p93/ua2jhBTth1BHBSXX7qwNXWoWrAOj9tSQrO/LqXO4z6ls1TxOYXu19dJkJ
 gQMMUw1bFYj0w5vaw7g==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a871445 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nkNBJ8IO_oB5ijvGOQsA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: H43NBDxZd0zyaKWVxVe5uKIpPJ9rk_Lm
X-Proofpoint-ORIG-GUID: H43NBDxZd0zyaKWVxVe5uKIpPJ9rk_Lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1011 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

The USB DT support series for Shikra ("Add DT Support for USB on
Shikra") enabled both USB controllers in device mode, since role
switching support was not yet present:

https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/

This series adds that role-switching support. On Shikra CQS/CQM
platforms, usb-role-switch is handled by PM4125 on the primary
Type-C port and Cypress PD controller CYPD6129 on the second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress
PD controller CYPD6129 on both Type-C ports.

Patch 1 adds the device-tree binding for the CYPD6129/CYPD6229 dual
Type-C PD controllers. Patch 2 adds the corresponding compatible
strings to the ucsi_ccg driver's of_device_id table so it binds to
boards describing these controllers. Patch 3 wires up the CYPD6129
typec node on the affected Shikra boards and switches usb_1/usb_2 to
OTG mode so role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

---
Akash Kumar (3):
  dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
  usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
  arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports

 .../bindings/usb/cypress,cypd6129.yaml        |  99 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   |  64 ++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   |  64 ++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 108 +++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c             |   2 +
 5 files changed, 324 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
---
base-commit: 96c901471bf7948b9b9f70d38ea11631a8c33b4c
change-id: 20260820-shikra-usb-role-switch-a3f910b2b2b1
lore link: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
---
2.43.0

