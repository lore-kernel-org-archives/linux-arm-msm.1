Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA64E323C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777938; cv=none; b=mLrlCeaOZ4GMsADIrNfbFejz+opONKV7Rh250H2eNeclPWUPzbcCLmd5mvUCgdpdKpt8rzH/obXvoBcRHvZOZ3lTB7nMEMWcBSL5Z3CTbcNYX1y2CS3ddL4xvax+WW6wQaMA8c7NPgjXTQTJBk35pxkrl62/vfN1lD+Ct2W8Kx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777938; c=relaxed/simple;
	bh=Zm8g3oz3CixIaRv7oE5kxbGfu8YwCAXLueO/nrs5VlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZOd68u4R++vkhg/KiHCrmiB2klEp+AINtN4F1tW4mtYzogTr7qWDrVi963z3rSfYIkdJYP9JjkquXPPY0WfADTHpxgGakpmUnIbdyy9OscUzPjmbaAD3uhMEciGYVXS4n4arqgmU3qwu6xGwr+89Tiu593nnoRENjg/o8ECt9a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVof+tCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yub9wDrk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVof+tCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yub9wDrk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxtDN145076
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7bpTUMb3ODR4fZWLx9HiLu
	8A5gFtV2lcsTUwtO9Pqao=; b=nVof+tCLqQBe7mXow4oTRma/zpt2zBN+ytou5j
	d8R2DOwcoTGwIHvYAG39TDHTTV+8k3ocZ3041Wvr7NmCyVz+xwLHwbrZW2C0LCti
	iUwMJS52KtrY3vzYoa5kTtDJBDQD9G2y25ofDpgCzshs8V028dHWPcSAbD0nVBhC
	jdpmjQhfYJScAWlglHma3pdCP7YC5ydlTvf8ceaq9bGaIAjWsqvSLjjtr9fry0zs
	r5h/Hx+J88DPQyiKbzGR6SiKZSO/ZkW2L/r6AACAXeGDr/mY2597J/ovcigEZT6Z
	kc7/9fwF2bccNiY5no0WavLdFvKv5Fw3x8V1XcxPcUmDm/1Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vr8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:18:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so152898137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777920; x=1791382720; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7bpTUMb3ODR4fZWLx9HiLu8A5gFtV2lcsTUwtO9Pqao=;
        b=Yub9wDrk6l4srXeqWmXJTQ73x/J372FbdhyeMUY2oF+DHlb7iSkQ7Vac00MTw+1DLS
         qPZ3VIVJQ3D+zDtEcL6KgHaah2+QIXDRMTKydCZ0hyzPthhtB5cEYEW5HwoFFy99SCtB
         tw7Fff3t6Y0AIsjmT8eigteM+hNCGrpa5lEJmn3sRFpWeWkfmsdkjHxsKg9tNEqKxD7+
         ugGogAnKum/PsT8u5neiGZb2jpmf+5dv2HRpkHEZH9IbA8lEh6mDX+dVhb6q8Cldi8hR
         TALup3+n4xWBOcqqwUpHz4C0V18lu+jUmYeLBeV44n5AcW1zMsn5qmLAPtfrQ5oyTDAE
         HZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777920; x=1791382720;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7bpTUMb3ODR4fZWLx9HiLu8A5gFtV2lcsTUwtO9Pqao=;
        b=lbCGUOLvGfRubpUt0f6S9O5bmODaVBq7abU7Xm8EAMhhyQv49yfdoG4P4tPTuavYdY
         1iXwmVEvkSa/fnvotwoup7Y9UJ7L8MULXrtorM3T1UHdV5VAgzxUOcTp+QdVhARBNEoB
         NoavTXwBYVltEUwrVf3ivyn64/rjxoG9Io+1mls12DSumXSDdzDC5G9aLp3sZD6CNuyh
         kcJY6p0w0QWehQheVaxCBr6AeYX+ExhNF/spI69MT847bkpkiYDWxDEDPSdqLWSC8Lbd
         1BQgW18BcINjvIuV+aTqRNO0F/Q46GOOD6+woPgsRicS5Zwfbthq9K/8CHYLJDBdPoFO
         mR8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWZjkpXtXvBlA5kPG26jkgAFyW3LEqs/sfDDMbk0Gn3DW3iTfoV4y7EN2Lv28U/5GpoGmagyF3aZM0D7Kp@vger.kernel.org
X-Gm-Message-State: AFq9FYI+bE6E3KQ9IZ3NoY7Rlj/7JdaGMYtZkGMJx3B+2f4q/3QA9wuj
	QosKNr4KA2guYTRXN3DOa24F2iNDHUkg4KcG14Z7VhQwMprw277tmej/dzboydbLqA1e05e15JP
	o0InDgJdC65ZuV4G+WoWmqHhCnO944a75MisN81jYETGUOU87roLJ9McnIT+XTRMjVRhor/nEsi
	aa
X-Gm-Gg: AYBFou34k94Xui0oMFSv/0MpQkB/g0aaYzOMsadDg5LBTRxDsMSiDgommH8vbChTTmy
	zg8ZBwjlUx2Eyt9bFh3aSOYSpLcQ5rg/uD+gYdmzuKdVNZUAdqnIn2ObEVvk9YRTLWzHf1qfJz9
	4pr1AByehAok+t3J4pqP28kPI3Q3XPLSKrGji/XbxdedbSN/TM8zR9TURj24hUufODn2hLVI0rY
	oZ86SPPfSV1uAkQW7JBvqyaMh3jrRWJFQAz74QtiXO24MVk/L604kp/wEI9JLvkwbU9cI06583n
	sGu04gwom/+AW0reUvSWUGdSpx9OzIWLAYy1j+ldFWjPKmtsPc043+LOiHoLZ3kSqYboxu3hnW/
	hLdFvXLrC
X-Received: by 2002:a05:6102:26c2:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7be749844damr395645137.36.1790777920133;
        Wed, 30 Sep 2026 07:18:40 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7be749844damr395629137.36.1790777919567;
        Wed, 30 Sep 2026 07:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e6607f4sm2469335e9.11.2026.09.30.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:18:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:18:36 +0300
Subject: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ during
 suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADsavWoC/yXMQQqDMBBA0avIrB2IqQTaq4iLOJnqFEw0U0tBv
 HtTXb7F/zsoZ2GFR7VD5o+opFjQ1BXQ5OPIKKEYrLHO3G8GV0ozTn5OHplQN104BpS8Yutaaxr
 yYXAEpV8yP+V7vrv+sm7Di+n9H8Jx/ACFJCDpfQAAAA==
X-Change-ID: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zm8g3oz3CixIaRv7oE5kxbGfu8YwCAXLueO/nrs5VlU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqvRo9FA4yIVKJXL+Kzp0rMyPHbfKar6YpEERZP
 szziYSGNCKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCar0aPQAKCRAbX0TJAJUV
 VjzOEACy4OimnPkZlHgRrvsZT8P4bvWbQmur/vPBuYj3aU3aG4Fqm/xtVP4T2qqWmNloud6hAGY
 0Z0RnZKny+IUQxeJRAYwm3lbX1cdsE7DScC/k0jfv2npAu0YCQE0WWE8DXpY8zSWa4VN/0bj6BY
 xm6eCHa4VHy+OCmerHb61cltJu6QSG8wBGoqcCxOpTWMwP9Zh1xtYqglHPtXGgYLA6Iy/KWU0NE
 tGhoisF95+75SnuR60QoyPlZ6a7Nps9211QMQpvof5rOhvj/bvvwUdqJ/33WTB+3YQVChAjBtfo
 8sAR2lrhNDD8k3MHtVXgr+HELIZ25+Xm1cQ+eNecwL78jTQCgbBkdUM9K01pmLmm89d5UsuheVf
 BvhXl9z1Ntvi+jK9KYeoDAY7coMM5shguT5eVOHaHcV9YigSt8RLaFhBlXUE9Hvo1fD4p9jy1dh
 NUl0w7aXHC+KBjPCaGU3552mLCrbNjZLXjrwPEpzbqIgaF4hHMveXlCpNdY/vDEM03sBNV1gAoL
 Bj0n9nlDNdr1B46jTwtzujI8OZBHXhabWVIAKBv5CkprWnZtk76rOVRxETmcHN58YsTM4DwY89Y
 +roMQasY4nWOMCpzjHMPZwKxPzNQCm6vDGaCcItisGBnYizivGwXZz7YSUSFr7/f9JIabt32DBJ
 3+GZcHfQP44IsWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9Kn31L6fXy__d3RmtYHlNfrFDJOgt_Be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfXw9ewryqZEghW
 RUTVozYy7N2ONoE7ncKoMmGK+z63Hqmpe4UlMuzX5fbU6IdTEBYvzQ05JGYHGZgsFA4x2fIjwED
 CgC7bpnKeQXHhagw+AFnYEw/ncbDjXbWDkwZ0U3fURg5QbZDgjVJqCc3dabKFufXdt9Q/V5f91V
 3Gi50VwJHgOQZ2eOFLidalkcTuhIq5LM7aEUsKoJZkJBXda8/GvpL2zDMFFbsNCIbTuXamGBja0
 oN6o2SZZms702+XK2pBOkESpyq27qJsmVDuoGqJOX5w5r0A/ReyDUy9RsYkA7ml9MA2yRj7ydxI
 cQ0p7KOJjOqajum3Y41Wyu32AIGouoWeJac54T5bI+4eFvfEHxMTL85afeKtcNPqhZKQw86QALX
 Zwfd8xQwYCqfrq8a+kn4FnbvVazPzIzrGRMV3aNI83Moqo5pc0sFbK/75rmnjNpQJGXkb52T4N9
 FnW/Rm5qlIYFA7ioreA==
X-Proofpoint-ORIG-GUID: 9Kn31L6fXy__d3RmtYHlNfrFDJOgt_Be
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd1a41 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qH2p2g-4CMqcrQuKSa8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX/x8yC7BNaWNM
 zVztK9Z0YI/URsN1odrXB4r6djzMC/poEMbYovYbrShD/qwfBJjhpplBrgmrUiUBsbIz572BaB+
 djfYIGcRBd6PQyc8rkJaIyBSzMtZOYQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

EC SCI events require I2C transfers to retrieve the event information.
During system resume, an SCI interrupt can be delivered before the I2C
controller is ready to handle transfers, resulting in failed event reads:

  geni_i2c a84000.i2c: error turning SE resources:-13
  qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13

Keep SCI interrupt handling disabled across system sleep so that EC
events are processed only while the I2C controller is available. This
prevents event reads from racing with the controller's suspend and
resume transitions.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4d2ad042a7f8..d34afd901324 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -331,17 +331,28 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
 static int qcom_ec_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_EXIT);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_EXIT);
+	enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_ENTER);
+	/* Keep SCI reads from racing the I2C controller's system sleep. */
+	disable_irq(client->irq);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_ENTER);
+	if (ret)
+		enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_probe(struct i2c_client *client)

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

