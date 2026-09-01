Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F94CCDE8
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242676; cv=none; b=CObhzb7mt7VfUAGjOVYmQZgSjXoPSmVvnlgCGrfmKJoT9O/Er6BT0oeNL8Tao6gWo8wCSyZLxl6Q53ENd0YtuN9nYhJaOpNK89t5nIclVD4D/8/zAKY6e17tK8z0tRR/C1X3NsHm30FmEWfJW0waUhICqOYEeQVnTgaLwYpGMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242676; c=relaxed/simple;
	bh=sdAD9UnwXQYZoYPI30j40I5aeiFnombqJ59n0J+3aU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fPtnkyr68roLXhTQMR9NDDMMd0sR48mb7/1oEHDCiZu9GGHYT6WeCyoylBpOjQ2++sFs6MHvNWC3TVZ9u7R9k2lZsXZVXRTUV2wCMRkOCLvRYDzRDZsOlow7A+fXzhpJYYtdUC377IBInC9EKDhRJ3+8vh0gnAahoWrgASDNBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfMzcn60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCe0MdKx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfMzcn60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCe0MdKx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812l0PX1390967
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 06:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kp/nji48OQnOcUeMn8Jqrf
	83t8bcwfGSAcwU6h8CLw4=; b=DfMzcn60Mz8fHAz2tGfx9jhsvVNy2oJ5GAczvS
	uoORFzNEjoR8h5EYmZ+U7XeSewKXMLkGRyrYZAq41E7w4tRQf/Xjuz8/+M8s98c1
	Wewct8hCBjmT5o0zYOkF5x9Ask5f/mjy8FZnbg9sa992Oh6PnLUZXHydww87AQfG
	bZW5l/es2CV7rB8+OCguMESqnCDCgKk1voEYuv58DRFwwKEC/w+utqh+GO5kakmZ
	xfVet1hTij3+jCb9M/lqfxE5a/EelBJYhGbDDx2G3PFI6rBzwFJudW3A8dBvKqpk
	JM/6y3dGcegbEsd5UWhr9ivP5b+QcLdlkUiF3j/d2P5ovOqg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r0nne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:04:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso53684385ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242673; x=1788847473; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kp/nji48OQnOcUeMn8Jqrf83t8bcwfGSAcwU6h8CLw4=;
        b=eCe0MdKxQMD9pEzDKdpHi/oJlBZbsFuR93KhTl0lK8Quy7Me6JY2KXTu9GLxv38SG3
         xDQJJLi7SzctT8iauxJlFxkkAYs693cMWRAzBNWpJ27uC2Q+zztXfQhF5icNKk60DkOX
         4EfwVOaUpfwPG/JlO+fdaQDKLYsem6bbTfrirql0cR9hD10ME3fPOxPVJrbxHr2AwPl6
         2QTJ0GFC5A5uzFN4bQcqHkQv6pEDcoKZk2FKzaLfZ3busbcwSGt/jFkjp2GVF0p0A6oL
         j+ogwafAH+oTQw7NoAOn4kamEBLWD1ZIyLXH0fZt2EQmr1SVs/tA1sLDjmhvK88ELPWJ
         I4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242673; x=1788847473;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kp/nji48OQnOcUeMn8Jqrf83t8bcwfGSAcwU6h8CLw4=;
        b=I+/8Ic4M/213BV0iYBW6+hgPccCVwBkS77Psln0W9Q/ImiM/iun4WAOLvLcZEyv2gN
         vL2Yzq+/FFGQ0xpVMYFGv9y0pkqPHSSqZNKnMKqV/I2JU9brsRZuwRl6sov0KABnzu/o
         bwHzj9uUou+chuqc8gGZA0IYyycPH3afBgyJ5V/R8uic9ighMOz4xsh8Z9hOWqWJUI9k
         lj7MU8FW8vdlWrMg8Pf7YnCqd7+j4K3mk8oZxOLhZ3EgKkdDJrnuSXl7k30D7AMv9lhf
         zHdPunC5A3qrmEXU9j3ZOuHB9FlCqbstczDGEdWzlJ22O1R2tGhq2MRNxNyLmclqIlkh
         gdhg==
X-Gm-Message-State: AFuF++ntvWwB8pjrewERfV609e/0Y7pTH4rX/nTW2151GHM90Csaj2qr
	zBilS4EKl6NssgElJgpZ+CpnQSt0ivltZYtdeDaySNe09KCBvY5jGt2jbYgOSu7k/q0PMPL3Do6
	bfXdvib2v3sy2ZewLULq7IqizBg4oQGhyzMFlOgTKQMoARONHr9Owv6T4d8VSw7TInIVR
X-Gm-Gg: AR+sD13i/o+c2/3xZmS0rkhE3m9ZHY3k9kQ9VBb9rUiWiew4oKSZoCwVBirlNi3UaSI
	0GxLLCzc7nq1gfUydJwTTNHCZQNP+qdJ3y8gEP/MKxUIePIze5j0si60eHSM9MP8IfGXOpKRxMv
	iAkII/2eBIMwy1WsI5NYvlL3ltHcXOVDMZHZCq2bEffRCskIBvUQKCa/X4/P0PpeRLz27ER+t+T
	9/4drT6gMFXRuHwUrTeqz8i4OtOphGHtxF/9YhL+IRSyjRKqTTVFSI3F0UAFlZmKhGQWl/H3fyL
	QWS2JUA7HfCPNub1PZJlAui/ojZNGPY/qjUXE5t22ZefJNsOdJcHn+oe8NLeqzf1/Mx2wp0bz26
	FCPdwHE52mIN4IhaKNbfuiW+l/M/D2ppCY30NML5BhCSAQ3OqWas2VWPXR3cs3qo7oFOe+fwkvG
	4rORz9PoDYDrLN19VA+EWfISHoTxBY1g==
X-Received: by 2002:a17:902:ce91:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d94a8e0e50mr65327495ad.13.1788242673153;
        Mon, 31 Aug 2026 23:04:33 -0700 (PDT)
X-Received: by 2002:a17:902:ce91:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d94a8e0e50mr65326855ad.13.1788242672692;
        Mon, 31 Aug 2026 23:04:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support for USB phys in IPQ9650
Date: Tue, 01 Sep 2026 11:34:18 +0530
Message-Id: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJqlmoC/y2OQQ6DMAwEv4J8blAwkFJO/UfFIYBbIhUCSUAgx
 N8bQi+WxvLOegdLRpGFMtrB0KKs0oMHvEXQdHL4EFOtZ0COghfI2dhtTIiM2pwajg8Efzkaeqs
 1WF7VxYam2cvctYRaWmKN7nvlymig1bFLmCZwBjplnTZb+GJJQuJfmIXCJWGcYX5vRSFTTHj91
 NbG0yy/pzP2A6rjOH4QiWfBzgAAAA==
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a966af2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QVgSJ0PFQKcnxtkCEG0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX8BbdsJ+OAs1t
 s26FQlYqT7gHFpa5CmQfQsMR4Zq8/0wf2nxLFD7758uqU0a/Dg6JFor8yfpXZU0Dbip5b24nO/Y
 IevQ5Ou/xWZQftZOdRZ06siJjvcduppe9Y4txlzJty9uBg+830iJLYsq7g4/tGEEa9jkRX5NkWX
 E4/zukqK85ZMk7MP1lfiuZbhhHFIPGv6JOIKvhz1S4B4+fp8wgX2v/qFnKSsGhkiWa8HNVjh8DQ
 3ZO3ishCh7OV0BDVZO34mdOlPVQcVKpBc4xwVq78E3VJp0z3cL5tuhTPvTQVajcPggfeaS+HMla
 zInUIxysBHrDy62DN9Ut3LsTFVifxh2G8EvBr7pdjuJnSfSY0RhfxqdgQl8qrrq8WUEfMlzjT9G
 ogerpJgRQyZ9fBLY//xg5l3BDMljc0d8Q649j+1pEjXH/xc2M/bch4vxMcrrMQ0j1a+0Y8zwk48
 KY+Qd2C1wjxQ/o16wug==
X-Proofpoint-GUID: nkA-D9lzS9AOeKroWtP_7-uDygITBcKS
X-Proofpoint-ORIG-GUID: nkA-D9lzS9AOeKroWtP_7-uDygITBcKS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX3Qp2y4uAg4Wp
 OE8j296jhmrVVPbkyfGTr+jvqm+6G8or83ovwZcyB84NqXG1/K2DW3rgiyhfh4/Q0UFMVosHp8s
 TadHkAL+oN1YzO3/jBreKclWCE+PYU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010052

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 188 +++++++++++++++------
 4 files changed, 263 insertions(+), 47 deletions(-)
---
base-commit: c7507e07687010738e5f16926078f78ac0d6509d
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

