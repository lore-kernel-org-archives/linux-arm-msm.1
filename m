Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4A220F2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144070; cv=none; b=B0k2GXCoVpLy0i59/Lk7Az4Yu/rsDdko/RXajKamDanwoRF57stbgt0gVURMURASiidhWmDHiUcDva+aQkZeC/1fK8Riqdx4kW0gg36d6PkUo7Jnf8dc2fs3cv1QggHHVW6jTlQ6RNDpV8ahnJlafOKrZ47RdmualhmRW0ZX5Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144070; c=relaxed/simple;
	bh=CWUqQ1a2gb6hbuuM64I2hY7ukGRJCQGKjendK5/JXiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LX5oHqH6c8JqiMXveeFm2VrUz9O3iFHIMB9c6oIDegR/MEqg9FZcacjS6ggho4DDBweJped8NkDT3Y9f4pyIFDMrA4DtKyrANub5SSuqaC/RkdoSL1IXZEqihQO4nc+U7yPTlZVLV58qAoAMFOftVMUZgA0FVfrG7a/fs7l0e2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVLOceN0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gP19kFzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVLOceN0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gP19kFzH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClDZp321493
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mKPsanuWE/uy+9lSL1WjIdqDrY0ukplYS9d
	DeqmBTqQ=; b=UVLOceN0OV++JnYVKDSz3WnxtNipTZcJ8yrGqkWuFw1QW4P6USA
	ech/btVdeDvakvxuErvqfCtx7JjgML4ONNivEvJL+L5ZQZ5P9p+RO744rgpFtA9m
	LAmyaVXCR8Prj7x5WzHaQrQ0z2sq8MEO5txlN/oxJtz9zOakpjgapcLqYYxxvcnM
	KZUQSps1zNyfWZN9ckk0W1kEnIEI1UJ9UuUdYklbg4kvlbOyVgId9yZWbRFeYBBp
	chj4GnVnN04hjAb+umwjGRiYmpoGLhp17/Us5m4WVtXzeQY/ZWIu9fPrz1/vSCYk
	TuLeEsFoCCkaKyCSha6iwBtuW2ve4738ksg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftua7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:54:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92efd2ca21aso185681685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144067; x=1787748867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKPsanuWE/uy+9lSL1WjIdqDrY0ukplYS9dDeqmBTqQ=;
        b=gP19kFzHlAeYqpZxoMO3/+QVUMDr5ZwzhMK2bWLovudsSrTs7pom2rkx3lA3sH33B+
         5vndnXLtrCl+7aWzQKSrqjytqfITPbP6d4HLedhzqLranVFEUqmU4qanauuuVac4NIPL
         DY0kaJg59qNQzEWpMqnMiqMHYE7P6tiujNJvDxOng7gZqTuZcDtpdXdlG/iDpXCdlDrw
         qxA9avAgC0SYCj8a+XHG9ERYDTAHpNlFXuQBsDfc/H+4670P29gcvd9CpX325TRGXwCu
         DflnDNf7riWNaNiVWlNmH+7/47v0R494Lw/XYBKyUrfSTHY4jCEql3IQg2zCv4nZoqL5
         QoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144067; x=1787748867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKPsanuWE/uy+9lSL1WjIdqDrY0ukplYS9dDeqmBTqQ=;
        b=bdCH/zeq9d5zg59yxD0ebLpkasLL9jAIAH6u91icxGmB/+WL1nsMizHHT3v9gutXqm
         y7DK+Ni6NK/IfOudsNvdke/bMhAhqt6r8CA9Ec+tPlVYnX0sYbJKy9hxrEfQE67+1VKo
         OxHaR+SEp159AWANmNZYE3L+lg/OU2nzKlj6+jZIMKX6lJZ5E6hZfoBBovULTxcbf0CK
         py/ifEFEWJGfWjybqaQp5ZVh/lj3SeBrsxGTiU3zXOHZIqf9e6UvC/ppsh+kOmsauv3O
         D4HB6AP66iA5nqEoiMsOTfgNPX5DoohIU1llbZGWyb4kejPcfCfl3tXTszJ3USAuiCCg
         VgwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFnRM14zicrN85dEz2oNG7MBbUBCFDR3km2fgDgQ/VivFFCKumgMIKpz6HF2brcylSjlQm/H9sPPYvg5di@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsBzylXlRB/uua2hAcW8uihryXSihgUXCsNbAodjMXKo+chYC
	GVXgYtbrIHV6dsKLZoqGe5DlqWkbeC5GOy+L6Vp2iINYZyaPXCxMQwAt0CkmczkdeiUjenu/Gvv
	3dDCggYFTSuduhCuRvfTZk2CWv8PnX00h7toh8TEbyjXg0IDOAeSJOkaIvCYbpar9Abst
X-Gm-Gg: AR+sD11XRiv15R86QMUITkp4QVVlBvDTbgP1BQtc/ZliCZ8gAX4IhTQJxWhfYRhxFgR
	tF0i2ot4RfQW9TdE4G1eHbj/nxvMGRZs1ybEEI/pRq+Tg/phvomMsysux/7DgvI7ob9pZVi3aFd
	4GiBpkin2DV/cpJtIRgDDYuYYhgloKqJ1wn2l3DOIbivHoY4u1JQk1Tyw8KsXnXRDsIOzj/jvyx
	wu35PFzaj2n6t3exM9QezKsiT1ZEbWqMOHAwcsUdKkHlLjKHR7qCjjoE0niOElmJ1aehHlFdcGz
	uxh6n28Op6hzcWyAwOqvB3iUImPuBfoMDTAHIPVe6lhyGkTxPk9JVbkacqWmiSUELsOGTx2b9f0
	qo2k6cT3YpUUCvmMGdkPltAJWPFUAdCsBQAWq77/k06wzX7HYc6idLXugrb8HsEbym2quRQEBQP
	RupOzWiTDHDoTUADo=
X-Received: by 2002:a05:620a:46a0:b0:930:db8a:c608 with SMTP id af79cd13be357-9371e1f65e0mr387097685a.7.1787144067149;
        Wed, 19 Aug 2026 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:930:db8a:c608 with SMTP id af79cd13be357-9371e1f65e0mr387093485a.7.1787144066723;
        Wed, 19 Aug 2026 05:54:26 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff156811sm748577a12.19.2026.08.19.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:54:25 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: Do not write to the serial port after it is closed
Date: Wed, 19 Aug 2026 14:54:25 +0200
Message-ID: <20260819125425.192316-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a85a784 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dlFzzRy74kIF9YYi:21 a=xqWC_Br6kY4A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=J0bGeDfF202-RPBtlhQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6i6GMiM8GMGR
 FI+5fCkHLGM5X6MfCqNZTNCi/fNv9L32/gUx5PKEFbVVW1DJ4JhagVROT0BxqjCEk/yM9dvGYP+
 bjlp9U47yG4L/rnvCPpTTtRkoYA/O4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXyLKziOSVK0dO
 QkAWlWb/Ukc4AYVGYmgRInYVY5ziKEupW6sdttxgmvq4vYJh9xSxKnPmZm11Z4yclNj3eTkLe+O
 0/k6/8dnfzFTFqkmiKaB8ogMoq3e/+mLd0NhKw1SAX8C7cVWHaRnvXF96mZOxWlZEtuOZNSJw/d
 KKqpnzQm4SEa9QXU0L9SpOSmojAu4blrjeJDWBJvz5j+fbtf0a/yUKEwODfXw+5A9tsjrlvfchv
 KfXCWRfuNhiV7K1XOfFC5ufgT/5tlAD6Q23ZPsgcJ1mUW74DKjtpw1O6iQIQL21AcYdUek80+hR
 HdK/J1efdjZBC5l8VApy3slifN35FUxl06SJLVVu9ZOD2W8zq6fNLssE2DxRVsWsGoIVKcfjB7/
 o8qDqQgHnzpdEisKxYET22BEloYk8QisqyjPGj4cQJxSKhOUczqThWdkpMCbqLeJGj88vU1EboV
 IdqZfSZ+L8GkZcWDADQ==
X-Proofpoint-GUID: aseTQOOYRijtNJzan4beQ4mvTZIstcYU
X-Proofpoint-ORIG-GUID: aseTQOOYRijtNJzan4beQ4mvTZIstcYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>

hci_uart_close() closes the serdev port if HCI_QUIRK_NON_PERSISTENT_SETUP
is set (for example, for the WCN399x family). A failed hci_dev_open_sync()
following a successful qca_setup() calls hdev->close() but not
hdev->shutdown(), so the port is closed while power->vregs_on is left true.
qca_serdev_remove() then passes its power->vregs_on test and calls
qca_power_off(), which writes to the closed port unconditionally.

Seen on a WCN3988 by unbinding the driver after a controller failure. The
trace below is from a 7.0.0 based kernel, where qca_power_off() was still
named qca_power_shutdown():

  Unable to handle kernel NULL pointer dereference at virtual address
  0000000000000038
  Call trace:
   tty_set_termios+0x50/0x238 (P)
   ttyport_set_baudrate+0x84/0xc0
   serdev_device_set_baudrate+0x24/0x40
   qca_power_shutdown+0x158/0x1fc [hci_uart]
   qca_serdev_remove+0x54/0x68 [hci_uart]
   serdev_drv_remove+0x1c/0x2c
   device_remove+0x4c/0x80
   device_release_driver_internal+0x1cc/0x224
   device_driver_detach+0x18/0x24
   unbind_store+0xb4/0xc0

Check HCI_UART_PROTO_READY, which hci_uart_close() clears in the same place
it closes the port, before writing to it. The regulator disable is left
unconditional so the controller is still powered down.

The dangling serport->tty that turns this into a use-after-free is
addressed in a separate patch.

Fixes: fa9ad876b8e0 ("Bluetooth: hci_qca: Add support for Qualcomm Bluetooth chip wcn3990")
Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c4575036483a..0cee54949221 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2229,8 +2229,8 @@ static void qca_power_off(struct hci_uart *hu)
 	bool sw_ctrl_state;
 	struct qca_power *power;
 
-	/* From this point we go into power off state. But serial port is
-	 * still open, stop queueing the IBS data and flush all the buffered
+	/* From this point we go into power off state. But serial port may
+	 * still be open, stop queueing the IBS data and flush all the buffered
 	 * data in skb's.
 	 */
 	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
@@ -2252,8 +2252,14 @@ static void qca_power_off(struct hci_uart *hu)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-		host_set_baudrate(hu, 2400);
-		qca_send_power_pulse(hu, false);
+		/* Both of these write to the serial port which may have
+		 * already been closed by hci_uart_close(), which closes
+		 * the port if HCI_QUIRK_NON_PERSISTENT_SETUP is set.
+		 */
+		if (test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
+			host_set_baudrate(hu, 2400);
+			qca_send_power_pulse(hu, false);
+		}
 		break;
 	default:
 		break;
-- 
2.55.0

