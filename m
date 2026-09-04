Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495444FECC8
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536567; cv=none; b=e2l16KYfRXq7ErC3SUcBbczScdC9GQeEPPcDklJKVfj0HMqp/n0mqi6urXEEfzD/58FzFlSU+R7dlzSz+Fv6F/tmy030BwYWBzTMDNbo2cA+upem82TshtBi62YLiUh1DtICY4r/N9y2N4CH6XvhNnLaGv8wqDrEK7QmBV1lPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536567; c=relaxed/simple;
	bh=19QULZ5mc7UMmZUZ7tuvsXXvDMzyVLM7eK1cvidnb+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T145lGoG/r1jNcvREMpAFu6YOAaL03uUFz2GY2XVS7yQ3tucC6ifcshhXFYBbU6buhQVV2H8Md/JGclJUTIY5KA3g9hQrRi7QthmNS090qKbGgRFzRCLh7ON1UhWM8dBiN1Yk3Og2IADSxchq5pSqZznn9ENl/f5XfxWYz13yOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6JoBLVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceNn+G4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6JoBLVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceNn+G4d"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Dh7Eb3891047
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 15:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wu4aU4+aLtX2c9UIKmkxVl2o/Ry3P2/k4p1oqgR901A=; b=Y6JoBLVMuh8timkm
	lujZVPaIYy2/KFW3tvZ1/aNQYBdB14v09wVVReNg58HyMcu7DOI8hnxdIvv1gU/c
	i7tkrFG9XvtohBsTMv/TfzZ/TV+h2NYeYa3pEovn2/HZJNiaSqQz9JQFYEpKfJIC
	aCKfEJPNDMoo//jECWQQbzkCi7adPwP9ukydwwpbLuNhHs0ikfT/wjAQZ6utwR06
	iz6NzM+dF3yhUWqhGeVeDCTRLEj9bGN4tSIFRjea3OTY1cOXeRhP9G1SCAv3oSC8
	F0GOI5H1Nzoat/82tfV7z+9IHZo5gt+PbZTqLSX4f1YXecTkwyeHIxyDczM+gnCJ
	aQBo2Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp7839ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 15:42:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso139151241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536553; x=1789141353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu4aU4+aLtX2c9UIKmkxVl2o/Ry3P2/k4p1oqgR901A=;
        b=ceNn+G4diw6LKsjbtzrtswsFJnzqXZtS/LU454JaA+m1V9iJAMeXttVorowpPMuegB
         XkfM4jPeQN4V8cEfDIuwM7rsjmScHaC/Qe+vMkHwL0k7cCueaNS4XLP02kVPj5jBchwI
         rCfcdzFYcUbyqoswPcBSm6UQfCSq0EosJ8GPgAzyEvvUJhVtyjAtXMfmxcLN9TJZmXaR
         Aws0Q+SKmUbsCydj2N6euqj4tBIcPHaoUeo3Z/UeYcX6Vz3vJdsTqV0l2CbzXJsFaqaD
         KhP4/0iF5NxOvpsydrBiCNIIqBQXra5m56nxaByc1pNIicVe9wYY/DUeSGYJDvH0/7S7
         ewWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536553; x=1789141353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wu4aU4+aLtX2c9UIKmkxVl2o/Ry3P2/k4p1oqgR901A=;
        b=KwfoRfUul5lvq3z1B3uXJbLbc3nR0SL2Tej32Mvcyx3wEY/Eiie0Kd+/REioV/igMN
         rY5COd2221qC96UyxikotRHl6o6p5FNR+46nqRJYdH0pWwihCVKEFQR7LzCcmrEZAMep
         kH94M0THGu0PgnpUVuauDxT7J1JLSdPruWgRbqRuy+9ZlxqDkdDJtBd6RCz0J0e1q9Tp
         8xa3ieB4txohtrFPaAp5fIDHARnpYrOt2HEclwLIfb13jDF7xOhmYfF2fLGd746MhyrW
         Q3hih6Q9HjsJoReWnl/bKkrBGM4mCi2Wn0zp739Z8+GXbHO/lBUx1NtkwbpYP/i3x9Pm
         mn3w==
X-Forwarded-Encrypted: i=1; AKwUvBySUpjLqZj7EonAZUPl7qKC3VT/YDQYqPymZqO7hK5iVivnjxNwG1giLFdAZuR67VOX78blx/ITMSpZ0uzw@vger.kernel.org
X-Gm-Message-State: AFuF++np6ihTV2MjxT5fKjh2KvJVC2J68+2ZX9STyVgVzNzR6LTycI2e
	JK69UwoWPIULwV6t6/xoky38CV5jYikDSFpZeWoMUYFjAkhf8mwUTCeP//t2M5C8GA2qwP9lERH
	qmU1oZSIlevq+oRyn5lLdh2vtz0oYx5twxE+aJtWqWL0iVUXdyxyGkAxmyrQVBr3+XvxmJqvLKi
	om
X-Gm-Gg: AYBFou3uWSazV1TsHIpyMhppnfPBkNEPL2aRxOrzpFIljMwzNLVSckM3F8I9jcgN4Hc
	Jpx/8cALohGvXFYVctRKminDXZnsqZ0FNJNy/Dc4S+fv63LTe6rGGW7NF4pDVZpucN0G3Ckbz0/
	Bz4P89vgc4wszYseSlZc6ycBuh+qUFAkz0pOUkqVre/4N0CK7QDqoyqqATrtomMlmNsg7acD32k
	5YJyVth8bCfDZTuH978aKBg81wiz/169M+KCRQprDAYBxF0yVM/lOlWBt2ZOLyIqij+tMYP83cj
	MjAf3XpNV0rlrTY34Sk8Y2ZpJOao/kO8NcDxWros/XokM04O0CtY83xLFecj5vy+I593N3bvAhF
	LLukpCsUAxqN71jyQkze7HCLZJfh4UZeWQyefa33ouX3QS11TGeZ2ZUrSIYrNvh1kurDMmAwtQK
	mP/DvKwCnfUfJklzzexQmtnNZBC7T7yTXs52AIBjPAaD6LvlzcyGE=
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr2056923137.11.1788536552873;
        Fri, 04 Sep 2026 08:42:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr2056895137.11.1788536552421;
        Fri, 04 Sep 2026 08:42:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:21 +0200
Subject: [PATCH v6 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-6-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfXzPg5xKH5yPVz
 9dokTM+zRRvA5U96LE2DIqtDV3TouUd2ztSuBa01Pz3mjr+0OG6jysoVekwNxIkzG7F/VLUo2cO
 +jb7BDyoDyDXdwbKKjjpLARggGP5SYc=
X-Proofpoint-ORIG-GUID: tgeXzFArz2dvlOztsIYzLCcZh4Mkf2f3
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9ae6e9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8YyhkPy0JF_pzLATneMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: tgeXzFArz2dvlOztsIYzLCcZh4Mkf2f3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfXz5KatkqQYf+f
 uaE0hh896ktR3+epzGC5oRwk5HVBbjNNNHwoFo/57XH5DUEDmfAfQflszZT0oEwf9XJQLkuHkWv
 3B6dz1E99VA/virAGHRr8BOToPEIlapOsNyHAUkczlgjDyD8Ob8IUlUpB5zau8zDMpX5GJ8QV5p
 ieVVmP/gqLmRX5P+/7lqmAnHYTqR5h0Fk9gQle1Aaj06OZ5Hf6FvXXqaZ0mi8KxMNzbQ/PgVebH
 qmPaab8k/MOj4A44PpXXHjwYXkFayW79F1qBfhJYR9wTHmWsATyea5tquV8erBSDS5V5CvsyNaT
 C042CHJY7sa3n66i/iTVJLprnGcY/aTT+sRHmabk/QMXuz8kvottrW74wAvJVzFg9vbN+MMwO0g
 lhyAmQ+hToIYvA/5MiLaIH6a9To6q2o5IHXv36WxWPLCgIEVTM37T70rW/7Em4UnC3IdIApwyyc
 39i9Llo/LYlcoK4L9eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040143

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_is_controllable() helper whenever the BT power
comes from a sequencer, regardless of which provider it is (M2, WCN, ...).
If the power is not controllable, clear 'bt_en_available' so that
HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f7a20138cb742e8f6ea51d565aa8da8751f21f37..9d27cd851b4a685ce42201b0d40ca6ecbeec9cb1 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2551,7 +2551,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 * The descriptor itself is still released by devres,
+			 * so dropping the handle here is not a leak.
+			 */
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

