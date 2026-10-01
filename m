Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121D34388E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840804; cv=none; b=OHwxOpW6RDIwvuGmsPHc6PXOeuvDEJmurBOnILowqWQnKSzf756NlbDpCo3AOIOJfwv5o2ExJX9Qk7gWfztiuKnGUtDuCmTgHuXpna+2T+NfdBBtSOiBTQM5LL062fzWGqe8L3wlPXsBsxp0UlpvzsAT20/fdSy+Cm2otD4wydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840804; c=relaxed/simple;
	bh=/PBjhODp4FauEwXtFO3WUy/JrxaP4yrhFxuvV1ViljA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j7Nf9ab8w/FKvJegonp3qVJ1vxvJnZwIzabSBRy9rfWWomZWV41nin6NjkyEOJRDv+kNdGVHIf2qvPq90CKcPMtIESZOwhBOtEwVR1kYvg4015cbGFgF8vEFP4gN8wJzO/dXaUr4QqBm8ChYCgeQgTWLSddSpaNV0qATx5YFNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxvJ86rA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbJS/jSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxvJ86rA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbJS/jSS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xbMo962496
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 07:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=03jFD9Ri+WK0GS6qcD3CH1
	sAGysxpXHnSn+4rqMos/k=; b=DxvJ86rAR3vrQ02j9womCmf1dN75wSb+NKhalq
	0k9hNRCd8fPSMkb+ZpHlbs5zSGkD+mlYx8Y2bbTW05lvw7+eiaL+hMUByRKd5Rww
	oqa1aVyi7J+X8MLC6KWQxuj9r5qwTebO1rYtDA/hiRO2BqQNa6EIe1F4egU2lxNu
	49bJGFky1/GM0SFZ79sc1CC+ZSW7WWx2GTFxbCvTKdfhY0heZl42R4MUp4OnBIcF
	eVI5m3F8zwpDrNZE6W6u+usPdZ+FRR4CLBiTbGxPKNv8HZjhw97nvDL+cFocvY7Y
	KktHDRrW1ZQ7lpi3HNjVNlK4wEBcVr3QJkM5Fm/2upGJF7nA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wctvhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:46:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1e564fd5so1129716685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790840801; x=1791445601; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=03jFD9Ri+WK0GS6qcD3CH1sAGysxpXHnSn+4rqMos/k=;
        b=dbJS/jSSif8isLtdyrVrAbNVNSrbwDFIh0o3k7OnsUnlSeyhdsvudFH4SUhGuA3eEW
         QcRif91/FHJz4owVRnMlFJjzG/hlH9qdCNLYLq6BF9yZPx4JPB/qm/19v+Tq62vmKVny
         3sXBxsuupwekZQLbkiLz1LaunHbzcy2eIRZvjxg7d2MmG1XSzZ4ko13vVwDpiknINFlR
         b9srFxp0c9kktm57bncF591+Fi+V36v8HLDO5ECypqy+BMhSYCrOWBiw7G3+hHN0W2fh
         wIhUj6hZA9nKq79mW/h19wdI+T6r6V1gzQJcsKxazmPKp16Srpvyv7sJZqBVIl/bJEor
         F/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840801; x=1791445601;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=03jFD9Ri+WK0GS6qcD3CH1sAGysxpXHnSn+4rqMos/k=;
        b=EIx68xZ9HoVD7Xpd1oDwN4TcfUG/bhZm9fEuTd9QXW0+/nKW4nwFdYjPwlD1QnYAdd
         t9Eof45KZsOkQRkYV6w/NAMk9ioQjW1RX7Yb1gBPAodmdx7aGE4nf3FsEnuCn2wgLjoB
         K/2v+rfkm3ej6uud7KIacEOXm9P75OE22YRS1m9XN79Ya+6W/II18yTbOr5bdXlOsg6M
         3oW01/voIJSLVKpaRM+bdblpr84pZ8cc8Tgv0tcPoHVbyjec2z2xaGgqu/Wjvoa1oJxL
         7Kj/NL3FDm6R5BoFODXBjgw3taYnBqPg54hc9U08fO7/IPZVXMsQC+fpO1/mLg05Eohu
         GVYA==
X-Forwarded-Encrypted: i=1; AKwUvBwtu5Fr3IezyymJf9+S3hVs3TQzNUBN/pEcmdx1J81L87rhMQhzwGTuxoR3qUulHkDHbN+neHk7x3b68kA3@vger.kernel.org
X-Gm-Message-State: AFuF++nPt642e+IXSf7heTwwABkUc6sH4tqfm873hsoHIFgWmP1RJ6Gs
	Aiec2UM12YP6oBFjtHzN27pp3EzT84Zt1qDbhqOHC+Wx0rkWPArEZ6t2F9Iokc/pRbRGpZ6nEOG
	0eievXcu6lcGIkI0n/uEEhuqyghE2a3vSa0yuLmevqFSJYEM5jJonepxXWW+TOekicOlp
X-Gm-Gg: AYBFou3dMiWB21JVsto8Op9I/6jHVfq+Cbvcw52/Lr8o+Gt4Vv/LyleyrTOiGT+Xkwx
	k5qfbajQMyhzIRdacyRk5I/qgdCVc2sIhJetVSr7fx0Tqr8Z6A1VR70tpKfsizO8HI9ep7omcS0
	4Uq9kethYDt2rnIa4hTLm6bjTNkBmAqMKuJsJrNChgmRv6of8yPmvuso+/G6FEVQyKNObCkV0MV
	bVVyiImC3bAF2lDEXPJsBB61CwTFJZAD31ganKzc/EuAQYZrfdVhUPN7CqE2YzLqOOQwucC35K4
	vtDWXdJbdfzYLcfW/qRjbALN4TuF2W/EngdHjpQXSaRX9mAQRmT1WeqDVm1WyiWYTiwe4WlZu5H
	RTvMPyj2r
X-Received: by 2002:a05:620a:269f:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ca97c6111mr768900485a.36.1790840800982;
        Thu, 01 Oct 2026 00:46:40 -0700 (PDT)
X-Received: by 2002:a05:620a:269f:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ca97c6111mr768897085a.36.1790840800398;
        Thu, 01 Oct 2026 00:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f923320sm52034455e9.7.2026.10.01.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:46:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 10:46:36 +0300
Subject: [PATCH v2] platform: arm64: qcom-hamoa-ec: Disable the SCI IRQ
 during suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom-hamoa-ec-suspend-irq-v2-1-ec71a7cdec79@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANsPvmoC/42NQQ6CMBBFr0K6dkinEERX3MOwKO0oNUKhA0RDu
 LsFL+DmJy/57/9VMAVHLK7JKgItjp3vI6hTIkyr+weBs5GFkqqQl0zCaHwHre68BjLAMw/UW3B
 hhLzIlUSjbVMYEf0h0N29j+1b/WOemyeZaR/cG63jyYfPcb7g3vvnZ0FA0LZUZ8xMaRErz5yOs
 35FpUtjiHrbti/MLxaV2wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/PBjhODp4FauEwXtFO3WUy/JrxaP4yrhFxuvV1ViljA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqvg/eTkvkEBziWCnubcDUDp0JUzkIX3T5lAy0g
 rIX+dIG5RGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCar4P3gAKCRAbX0TJAJUV
 VhGuEACk7j/6DGYiUlsVCwE0OkeDQxuvsL6BCa7Z6Ijsj7PyPxvnWKjALhlW+UV/jmm7/i73QLk
 xI+TGh82ax9MnTffBPNIxc0NtbgptuwQ9gRnDA8WpcejUJZhD6eKall8KHMfmD3xjlZPCM+LqeZ
 XhwrO5QpAQLb8vfI8cMdGyCy7/5c1dzfOqfSmztwiRF08vqrLRaSu7gl8L6U8Ur+g4WSOLtQ4Y4
 X9UJn8Bl3K0yORT70yspRukAmGVGnRctMYyYYHIMpQWlUt/9Yi1zQtbPSsZ1JLf/0PLXA+9oYOj
 rwHv8YGH8FOA0nqV4CrOvvlisP629vAtGeiitGaJs/OhY1Ucb/WCjH76lSYIjHGJyyZXuxyvH5k
 ltvNny3SO9FJjiGBrs/6RtvPg6IoMZyuznOMeirQuon/0BL2S2IBPOXHBDWpDnqcdZaip9HRErs
 /NCYtTzj+JtMu2ifvm0AWpFPAxqX6nuQ86upaZ9YKdU2LjoPwvSOTzVeO/0D2iCyMAjF+zzvQZ6
 ij9yYt2gQDMcj/n152ssnNOtLX9Y4/6CmDYxOGz2ZoVukcZZevGPEB9ozVnCkoQRkq6vd1uuMX4
 jJVr8DhRS7vZ4FPYbrb3VbWYaLFyT0H1sYxPVhsQoTsmLzy2OvstlaWPD+jtAkJOboCRSNoCIhG
 T91JQycRK4ZRkuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMCBTYWx0ZWRfXzO3hjKK86Xub
 RL53/RLOoMID63qLTJYOTVtstff7qkTNgPN08IzfTrM1xdQ2xNfi7B76Rhmk187O1yvkBQeSdQK
 o6BadzcAeHfG755ciRLIIBkn1n5mcQrScnoU38uq8aV8lmmOq39m4KUmuNlU38O0cyKBvESDHm8
 iifoWzOc5XZKNqr0NDSpf0pUIhnzEjxBwYiMGIgJNkDPp2FD7EYpRUxvERRIyFFfRHp9DqeR88t
 oviOzLxTJlkbQC0ffZQnRjvrqj9tbz+9gwd+1n7RQ7wNg+ScJGEEAfkkjeooDakGUQmASfF+0nF
 hn4t9AwkVncHBzHiTzmNmSIH4XkGmo3nZ1zc00WyjFI5f+jdwr3mrO8oHgh12xjOnN7Zh7aCJKH
 BoDNvLmH1NVJBL11GUplXuMGTBWuM8eGm3kGBD+ZA2n4FaxWHWnmZgiibD1ouEHapYp6y6Mwt31
 ezc4T+e88yMQ+LRgTeQ==
X-Proofpoint-GUID: xbtpIgBaHxlyCM0ZYBDKwofWitkULxAK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMCBTYWx0ZWRfX0EjUVea9QhEo
 yWPjHI/cNRhJL7qnX8qaimLafoak8vrpU5eKXEXgL532ShA843gL58iNoLkI02n5Aa3pg8vwvsF
 6d7qT+Zmq3kNMW2iWrZj7K3dbh4bqbA=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe0fe1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qH2p2g-4CMqcrQuKSa8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: xbtpIgBaHxlyCM0ZYBDKwofWitkULxAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010030

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
Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Picked up Anvesh's R-b tag.
- Fixed the Subject line: "platform/arm64" replaced with
  "platform: arm64"
- Link to v1: https://patch.msgid.link/20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com
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

