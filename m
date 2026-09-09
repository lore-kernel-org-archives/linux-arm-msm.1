Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE23C4B64
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938304; cv=none; b=a2CHJYo4in6PmfLQfw71Gtx0Zbo2W7A2KrH9ZxYBuEtshBV+RNf/Mk3vm8GBd4uyydsLVC5dOkp1Nghoys+n+Av59hx9bjaDP0z6t/PJAL/o7NpPCvRT36/4eBPayoyVYBsYKn0OVDvVYkHzUs4lEtD+ZkIrwhiIEDb81YzcXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938304; c=relaxed/simple;
	bh=NxoXOhsAlBrTacAmw9rz9xLwAUv27RzpSZCanhWz/n0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jQgXLPhyEJyWySpg0zKADyFf0wqBO+7xNkjmak8QN0frWqxfMCr0cF1vMEyZ/yUJRtgyU7lhFcKDd22TQQrYMZmrKURlLD7JQPIspXe9KmdRbnqDtRc2+MkN+uXUX6zrfJeWv86NnGBqeUYq9dD0hmSptuJbzttlpqxh1gjyYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg9jXdkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ntu1IHvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg9jXdkc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ntu1IHvJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Roik045470
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 07:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K7y4b6CuxfOc4C6aKFzI+1
	wNmc4LriEaAxcZU2K25Qw=; b=Cg9jXdkctKnI6LTooh54mhps02DwBvLVJF7De/
	1nEhLoD1B4TOkXn3MTMDdegA/jw9JUNxI+VrHmOivcH2SpwJPxwDWpKq85+Sz9Sz
	q1W25oh1A7DK1oEuAwIm1iWsV2I+74xmNNwvIM1Wp+FH+FggUj++6ogK5eaWHhO6
	JNoPtJFoVgs9N5GQlivbXruVEoQGklBCqHY8BdTSnFZ+iTt3HR24CrkNSHbQ9cHd
	7634HvX5DSN6TX2QxYQ/V5d1XgX/Hnb22tkXgLB34KNhjCQKl/CAiXjZLT+kFL64
	CU4IFTH7JA8THvjMv/+v1GLazWPUO8k1zE3hQloi7mbfI3Bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewjq17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:18:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso65353765ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938299; x=1789543099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K7y4b6CuxfOc4C6aKFzI+1wNmc4LriEaAxcZU2K25Qw=;
        b=Ntu1IHvJvTekpw8q9KEUsmbc+V+81KM4G22zh9Nylhv1UqpFGljd9v92iFs77zN6Rn
         SPn+Y+Zdy7hsSU4SPpxVZ743Qk/3D4gr0xHK9qWKIruQ+6Tict2Nqdyp1Lcvf8Ds9kuf
         rrA2yeceXgU8yzh7H5NOg0f/x0cku+etQqINIT/mZwWGh+xLmfi6xoUrEc1tTmkYzTnE
         nhZtQAbjbdHLGIteWK3KpKgWd7tfa57NQ5kY3Bv1ToP0FpiP57gZ55LdrhxZoadyc051
         vX/+MvG2K/hHRpI+y0u6W8QjHBs43+MdkmCSwaPn9fvuk1mNUsWMg0YJaU6JlqK0lnD0
         w0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938299; x=1789543099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K7y4b6CuxfOc4C6aKFzI+1wNmc4LriEaAxcZU2K25Qw=;
        b=I2+FnzM4wKaFzPxhn1XB7lAdbJfUKqBG6+d3Dzled6fsC+a3Dg4yYAgSIFyJlcM0T8
         wQN6HIJWVVOEC/XIViZoy0Ex0ph/6cpd7KRc8xR4tcfH0VGeZOGrETJQ1J+1kLFXvR88
         F9CYT6Ziz1qKDMS13yQRznN1xVP9XIWuNXUesSCr2vzuJx4CcN0fCNTjvUPPD99G3KaV
         Nisng1CgkQyZdq/MOD4h4xqIU3gB5LXzaU3cNPD6BH2Z3zuK0gaOWl3UHzUp5ZRg6Jc1
         tEchYUKYBY5LqN1LdRt8Zxh7o4rfzmi0M0cBn8oACcVFmf3sGtoUr2M2hEI85axuSpI4
         ObFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT2BOlomn7EZ0jUMiKil/FSvZVJVCk30jNCg9niRlh2Ru6Vb5l6G2dHH45ThpTW09EmN8sc/t+2JSPxs+U@vger.kernel.org
X-Gm-Message-State: AFuF++nAgmwjLjx6IaREuiTEFtMKKDb4eq48kA+b+RT9u43MyoSUtuk1
	C4HUSzLBB/zUhN1vOygAFG18rfxd434gccVpLhedz7w7eOHzpOdlKtgux7XHpiQ1Rnztv/JvFxu
	hxNEEYWkohGn+vLyu40I08FyC5ctNZSdjwTg/dUqJI4cO9H4lCTaIGaADoNFNxMCTDSmx
X-Gm-Gg: AYBFou3qyJptobNjQP3M5gwfgTtG8OPGhDyiqeR+HT0NBw0qtQZxvG+rLsPsGaDiEGk
	I6Or2udkHrm2G2HYmsK8YsqetSvwiQPhDZmnW1la14Uw+mUnKn2AYN2QwMFWPOH1dyPnjHtnl9A
	1DESPiFN4xlJ6mfVy4tDcDZkTUkof+rlC9pxiUMYORh4f2eIgKzhwhPx6bpUcNwgBUz9OMI33nR
	BnRh8JspLYrO3J07FpmmqRRhReaXb3+S7XIIPUaxCsfA3wzLDHMaiF/D7XuMW+w/f6waJL6XQtG
	mkkYJcCMw9YWR59ymMkWHpCSUcuJGw7qsgjPDR9bfrp7p+6G8FwddYuKf5suF18rJichnIZvYg/
	AZQ4CUTRh7IZL4/HiR1reIuCKGRTt2p6EImXSoTzWVdPSjL2UKxzcxIQZ/nnf2bQD
X-Received: by 2002:a17:903:b07:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2dafb0b28b5mr350440555ad.13.1788938298930;
        Wed, 09 Sep 2026 00:18:18 -0700 (PDT)
X-Received: by 2002:a17:903:b07:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2dafb0b28b5mr350440025ad.13.1788938298355;
        Wed, 09 Sep 2026 00:18:18 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:17 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Wed, 09 Sep 2026 00:18:13 -0700
Message-Id: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADUIoWoC/3XQ20rEMBAG4FdZcm2WzORYr3wP8WJyqBvcbrTRo
 ix9d9MFsVh7M/APzMfPXFlNY06V3R+ubExTrrlcWrB3BxZOdHlOPMeWGQo0woLmXvEXOtPgCw9
 j5M50gCSk9xFZO3odU58/b+DjU8unXN/L+HXzJ1i2P5T7S03ABScQpvOa0Gr7UGo9vn3QOZRhO
 LbBFnHClYK4UbApEqOiGANQ6HYUuVbsRpFNQY1O9BRSCmlHUStFio2impKUdr3zwgGoHUX/Kk7
 ARtFLFwQjyFPoZdxRzEqBbRfTFKtUchQhUvrvL/M8fwPyUivEEQIAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=3074;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NxoXOhsAlBrTacAmw9rz9xLwAUv27RzpSZCanhWz/n0=;
 b=NTVnDENo/8lPnzFJWhThFAsVlKh1Eg30XiYV9iX95PSF+NjYrYbyE9QFAmm98pK/Xk8GemEwL
 20MGdQOmtaKCf91bhiuMIFTFpaM+/s3p2wnQo1KA7hprdPdmAZL3zJL
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa1083c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=RhKn1PrUZtK7cijwC_YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 2qBslexC6wgyvIqNXkV0cznWVmUkImDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfXwqF+y0EcF1WO
 nmNWS/uFL9ECl611WqjZ+1cFHoRBo7a4EokRv7VBvGnMJeTeYuzBB00pyNGGG2DARBNWr/wMX6w
 GEF3EP88liXA4zXOU4+7pmDP0CPJ6si9bIV+AFS444F011vL6MkvBhbrefCjIljfH2bfKucyqJB
 zyF1zr8Ummk+x6KDSiLCarBpQjmJT0pWjXjWtv+bwgHbwfpC7va8cPM+pdDeq8hyRxcdtXXCzXg
 evLEK7OJf2D5XyYzwXnuJLtWoPEKZ8w3uSrto/iYFzTaHy9x3L22uvVIWjtzx63m8ZtAdKp91P8
 fQrUlUW7W8SUIVqzEnzPUAl7PgCWljWt583/PkmsdpM23Ql+OVVMnaAfYnxowJHQ9a348brlpZe
 wJ+CoZpPkRPbF6ZThTqPWnVFDGyLj5LioEDEw+2w5IF8sAjqJeJQZzFCoaa9ZD1Br3YnQttTRJR
 bLWBynmLZJWaIvzDu1A==
X-Proofpoint-ORIG-GUID: 2qBslexC6wgyvIqNXkV0cznWVmUkImDl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX+QLbuxvzoHQ5
 042WriFshC2tqvwxo6dknd/KpC8xZDeXWywBDU5qcfbOjrKiOV5EvT8ILkvNPn8gJL3JTQjqq2m
 CE6Wl1YFkVxuOZcd3tMEuqhd6IGnrwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
removed,leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v7: 
- Picked up R-b tags.
- Rebased on next-20260908.
- Link to v6: https://patch.msgid.link/20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com

Changes in v6:
- Add the QREF and refgen regulator supplies to the Kalambo CRD TCSR node.
- Drop Konrad Dybcio's Reviewed-by tag because the patch has changed.
- Rebased on next-20260807.
- Link to v5: https://patch.msgid.link/20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com

Changes in v5:
- Split PDC ranges at 130, 147 and 171 to skip pins 134, 138, 156, 158,
  172, 181 and 202, which carry gp_irq_hvm inputs with nothing wired to
  them on Kalambo. Reported by Konrad.
- Reword the commit message to describe the PDC difference.
- Picked up R-b tags.
- Link to v4: https://patch.msgid.link/20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com

Changes in v4:
- Split PDC range <108 619 22> into <108 619 1> and <111 622 19> to skip
  unconnected pins 109 and 110 on Kalambo. All other PDC ranges match Glymur.
- Rebased on next-20260729.
- Link to v3: https://patch.msgid.link/20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com

Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |   4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        |  37 ++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 119 ++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 drivers/soc/qcom/ubwc_config.c                  |   1 +
 7 files changed, 166 insertions(+), 2 deletions(-)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

