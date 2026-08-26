Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F43D3D19
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737899; cv=none; b=eBTBUnOEtzTD/zJGpKxIS9JWIXrEIt17bV8BOmEXr+6P3psZVyLhfI2POUgyOB2fNbjsRToYj8jJbYgzlMxM/UZg35ZD3Wu0IMqCgDUfbUt7brF7llYEnyT7eLwscvAuGdIDsWJVqxsAmwjt+IymSg40mUZvzF7Og0xVlcIabis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737899; c=relaxed/simple;
	bh=5pCdhqBVog5lmnEpDifngttIyyUpwkdB9WQKZlEV+9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EtKZAmEDeCaDLgQuIuKWf5QSsiVV6f1MzKu6TD/lWbWLFTBZB1nPBru1L4Nv30hfspIcc/1Ehtf+++PILgrXE7tCNNFaPE13gdGiJWc53Y0+zrlJmMM1YURBVly5csI9LOyuqHFpLEMwNvX0zi/yMExFFlMhPep65IfmCu+wfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0stfBq9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T60P2RpJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0stfBq9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T60P2RpJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cajb1062611
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yPL9gxgfBZ1gr2Z+L2cF5q
	p/4izv0nN+GyUhSS0KxaY=; b=p0stfBq9WBBqFyqV10kSPNNe8YSl3lWXDEHc+6
	yWfTW76eASG3t7yga3H7gh5ooouaGP8raDK1VsGQWSsswhsTPzskA7UxRUwx7fqD
	4oTU1lr1VQ2QtG0hQds9Q8lfuT13YCAX3fFstOywEI2hj+SIvjDcHndsSgfqwLai
	xPWSP3mHqersgY3vgfHv4say8gUpRYJ5EEMo6BR47xD8RYuJHENl9j9V22f6AdiC
	SMhiRETJUUrQnONb/qVpOoqVk9sG8RTWUxVJe6aIJGvZS36cjUkdmvkLbwXzNUaQ
	3gxcSMhT8AfBFmfbJDCoAANjSIXztod+z4oRpk7mkDRaeEbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxk9su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:51:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1440211a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737896; x=1788342696; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yPL9gxgfBZ1gr2Z+L2cF5qp/4izv0nN+GyUhSS0KxaY=;
        b=T60P2RpJtVX/jxshn2tFFS84v138Ba2neVq78EDlETf6yREE/bFCMfMXKqISzmYIEY
         aSnFIe/9kF8B0KybfC7U4IlQ7WN8ewRXLEgpjAfx013l5GSdPYk1+HDE3nKopMyK5+wp
         mPVkbjYcIU5n1w7RVcUcR3hADjkVDB+VRQi/uuxZ+8aPQbeCDo20hYbgFIjYwA7EEZdM
         i78W1AflJD+OVPv4RtrnI8A9lV8PBiG3C0fsnzNrPO9y2Z9ObHWqV7GK2gE2DJ/zAUEo
         2MVzxvvHxDVJVWXpYPZtVKp6zTfo6urk9v02TkQ5Wjc+5anKoOcl6P20m0Ntmz4OFM4y
         ZQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737896; x=1788342696;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yPL9gxgfBZ1gr2Z+L2cF5qp/4izv0nN+GyUhSS0KxaY=;
        b=STcZUQwe+7/yLgjcuwuB33TZppWMhQQWLPi6zUJKoERyTgOkwtbG9pmGjJGliRnwrX
         VU4Ed1TFQ/9+kTSNB8GKGUJ0VDugqnBrishfNIcP5LXoMPti8BGsXReq1GizTD0lDM3/
         dl3upTUbBwICUL7tCimkEMkGdGnaEJC2JHWn/tKbToGhC+AyyLzgsXVLtuMi0CotMcwY
         YX74ymgJdvEIcrkRZyQ3r4oK97YVYqwlFGUo+CXxw7LrEmjuDEXPPVqb5+utuoJExZKc
         slbL8wjga7jj+RV0mzudC+O9LYmrOdu0N8Ka50SrgWJZjVe1sF167HK/ndFLHwKN5Y/8
         kXMg==
X-Gm-Message-State: AFuF++nDeTliuqEH837eoZmGZafhPHNX48ESvvaL1Bdt+CSiTjnkHDxs
	Ttkp+rp5ycp3K1HS+ATEzMtP/SaKeOuzs+x/gjb/WqojQrGcjA4DIm5ZdxkcQ0FchSzIwnc5/q0
	c8WtO9nR2cC2F2QY7kH5t4/NdwcsKNRUHQPF2IHAPp1ckCwP2cN6j/7uK6ALcZYQh6DeBzGJ0+2
	iY
X-Gm-Gg: AR+sD12zKZZ8u1DsncK8ROsi0Xc+QILvvrX/KERkV14KiTom4ke/ICUJxd3/k2ZhWp3
	+f1AlW/mJfrJ7nZO/c5J8BkJL+ueLqUMp8NqDZ09W5FeXIsXmqbVnXlokOgmV5xUPV8PF6Hy0FP
	JkjJu6iFFCjrYIWERuRM/DvcABE5HuW65foNxSZH9N8plrDbbO7sYj7aWgib6SGbwwrTpKUl9al
	zvjXea/ummUGmKQqSGh1auP8uPYxdoo7fGMSBBBNxpdImNcJmi/Pn0/Gf+RUX5uTEv49vaCfhQL
	jQcvL+XuKXrPTOTMWN0RTtqaj24d4AiBW/bIto/gCNSGpN227E5A+GjnSYcgEeTUi2ZJqO3lmdn
	tmvUlh16OO3c/pqErOD1hohvbc4QF94249ZQ=
X-Received: by 2002:a17:90b:560c:b0:396:67ed:da2d with SMTP id 98e67ed59e1d1-3966d4931a0mr11869721a91.15.1787737896065;
        Wed, 26 Aug 2026 02:51:36 -0700 (PDT)
X-Received: by 2002:a17:90b:560c:b0:396:67ed:da2d with SMTP id 98e67ed59e1d1-3966d4931a0mr11869645a91.15.1787737895607;
        Wed, 26 Aug 2026 02:51:35 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm7249738eec.23.2026.08.26.02.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:51:35 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH 0/3] i2c: qcom-geni: Add I2C bus recovery support
Date: Wed, 26 Aug 2026 15:21:21 +0530
Message-Id: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABm3jmoC/yWNywqDMBBFf0Vm3UCM4KO/UorUcdTpwpQZDRXJv
 5u0y/s69wQlYVK4FycIBVb2axLlrQBcXutMhsekwVlX28bWhh32w669EPpAcph2spjSthq7DtL
 sIzTx94d8QCjh+fd0H96EW2bl1sK6eTnyb4zxAgzgmweHAAAA
X-Change-ID: 20260706-i2c_bus_recovery-8f0c20283d99
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787737891; l=1718;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=5pCdhqBVog5lmnEpDifngttIyyUpwkdB9WQKZlEV+9E=;
 b=C2ZxEr7tlgDy8WEUGiTyyvp8nAe0qA8t7VEGsf3WqAvt0qKf5kgwNK5PcDpET0j6R38L/n5lz
 oEVTZ5acDtwAdLMGq0INO7+9HRqSLJeyeeLmJzyXDAoYyb7EneckkeI
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8eb728 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5oILYQuN4UfxayToDyAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: BQPvkPUxrMiJ1L6XWcfE4CXg5ozB9ODL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX0R37d+NR7Q/p
 pm5viSTGZa+Vv0LEEGQx4hGi+G6irZvREDdvnle0V4ZecSrD129vrY1q4nXs8Shksjr3ctySonM
 CY9beSuIOyGcLadDt6RxyyHRBMKvMR6brtpyKMquaeV5IVqNWaLBWHCjBgNbukD6aAe+OhzdwQn
 paPp13x77K7NVbN8XtKrUJRDLdPjdplmxVctxJ7G0P4KogZzBjG5zhZ2w+DurHxMcYmDZiQ70hf
 vbbXVIB3doxbwa3724uH2cXRb2qb0F4SP0cgOPZREv+28Y0kfp0cJvCXi+t8SMMMPQUQ/XCBcr9
 IgJLqXN91Ug7WpgMWyXejpkO1OtqcJnRfBBT2Ier8Kd/A+Ao01NptGuBN0rF1Bz6SFKIjfTgS+i
 Ivam2QBPm2twAwquwkWcEh//nynMEMxlLrA6YfzeM7I/IFiIgZQgJPyVzrqZLhQNYXyP5n7/ENI
 GPs76HY8zFEzV++x42Q==
X-Proofpoint-GUID: BQPvkPUxrMiJ1L6XWcfE4CXg5ozB9ODL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXyVjezOGOfZMS
 KwVytYfpD5h4CqMCTk4o0mNlr7u4NigAVTsx/WwXhma+rhpJU5bFI5CICqQqGDJMPpHccwxFkKz
 BOYVWuSqYCw65Lhl4vag6/ZltluYlAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

An I2C target that gets interrupted during a transaction can hold SDA low,
leaving the bus stuck and preventing further transfers.

This series adds bus recovery support to the Qualcomm GENI I2C driver using
the hardware native I2C_BUS_CLEAR and I2C_STOP_ON_BUS M_CMD opcodes. These
commands generate up to nine SCL pulses, which is the standard I2C bus
recovery sequence, and then issue a STOP condition to release the bus
without requiring GPIO based recovery.

Recovery is triggered automatically from geni_i2c_xfer() when a transfer
fails and the SE_GENI_IOS register indicates that SDA remains low. The
recovery callback is also registered through i2c_bus_recovery_info, allowing
recovery to be initiated through the I2C core i2c_recover_bus() API.

The patches are organized as follows:

  [1/3] dmaengine: qcom: gpi: Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS opcodes
  [2/3] i2c: qcom-geni: Add bus recovery support for FIFO mode
  [3/3] i2c: qcom-geni: Add bus recovery support for GPI DMA mode

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
Aniket Randive (3):
      dmaengine: qcom: gpi: Add I2C bus recovery opcode support
      i2c: qcom-geni: Add bus recovery support for FIFO mode
      i2c: qcom-geni: Add bus recovery support for GPI DMA mode

 drivers/dma/qcom/gpi.c             |  30 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 185 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 215 insertions(+), 2 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260706-i2c_bus_recovery-8f0c20283d99

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

