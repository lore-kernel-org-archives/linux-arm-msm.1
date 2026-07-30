Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33538E5DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427267; cv=none; b=SWG7lNIBmBY6pdVfDp3CaQmtoK5yNHbIpd/oUkikeMpeDRG7INBjLBl/AnFeo67z/VxwFIxREP6PLYowN6JInJF0rPHodshk7DJudsSErcyQUqMO/cyndlVEZOHoxiC1yDSAS6c7A2ClQvfKudzPo8ZijN/iGxxJT+NogfDWTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427267; c=relaxed/simple;
	bh=uhpDyIoGXajFOzs4zO0R7BhqrSY1CyahIEnZEYC/lAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEqKI7aKJrgK6g34/qkUYmZULDnmBeB0ARHeo4/w/EpoWHOeejV9UdVpTfEi77PE6b8C0BSCHt4Fi/7aMNZ4uns3RhUjvO4v082mI2JBrzq8/iCaB5KatC2BN6sYneY5ta2Ja6uphqVprRR1ySYs0xnsJJ5JgR7Q4MxG3FO7JFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9ZRq7Zc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVPNVeEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9ZRq7Zc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVPNVeEI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQq231223222
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=; b=m9ZRq7Zcpf4SX/0j
	07az4tsNyxygzxx0jGpkEFKXtE69KsY+pvmxU8kru2Soo2PyeV3MyKJgjZkw6jI3
	QPxMl5KWLwrKjtNsJne4Ex9tIUA4p82ohR93tv9ZM6OagZSu2lsaxyL55z/rSODk
	+j3KguZLZff4K9Vm+v/ft5FwigwdlavJMcqt0OZlncKcBxAsqgC+R7R6GDOMYbCQ
	APIRfx+H1oxtBJpUEH8AerqH8BvZon688ty2ZHscFjKSbvWij8bkCS2UUkCBu+At
	oHWu8O+0hyM2d8C0JpaeOdupEnBpHhZIhfboMIPkJENyjrudzNCBJ6nIOW/YNpP/
	kaVyTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmrenb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so584885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427264; x=1786032064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=;
        b=EVPNVeEIY1yXkYZfcCPc81jh5BK0zZJtqTYh2uL03fwDRBkXp9sJRxHsoqWpUaZYJt
         HKEQrNWO9cMoVekvTlJuDLbAnH+xPPVSKdGzPusrnBF0vKmi8gWshfalndqpErajqrEz
         P/6pQXkGc4AaieQQ7abKo1oQwKPySGs7sZjGPWgxo1NXK/lDyGnqwrLA3eD6+SXXfupM
         AO73rbzG2FXDPH34u/9tUBB91jwiNAVU60bFYMyCk4ZOicdinJiEne21pKT+cAr/IdKC
         iplKfM2g0XJV5ix6aOEqUAnxlYwNzsK5XnudP/DNa/z3wY9VKpwMzziPN57pFJm/LZNY
         Pf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427264; x=1786032064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkfAnMQDHbMi2DKEw9B9JDdOl1z4aZR7BlMrHcVf2Tg=;
        b=h9xZUYB+7OycPnP4z+gfVGaXX5wsqO7k8LOIbnmVLoaFL6LpwfNkmqZeUHcCY9zUCx
         TQpl04Q2h/uzR29vAfSxg/LvqTdGiEwzjpfFPbqxwQL7dxP3NkEqDuTIH8sV5GRYl3PW
         V9q/L/LyUWx8UkvbVhyeYKJMpKp1WfUkVSSbUBInQwilYv7h3sBv6j1/dN15W2K4zBOf
         88LU4J6oBoY3LiwcbN/+HES9DbAvNyraFqb455/c0D+uYm1aNomNuztKSfbN4Zuj4fKP
         Kzd/TuqVkKOLX/6A60Iqc7m31xkEUftyDPJI/qCw2V6uSP0o/agyPV4fTlzCOtcYFBeE
         0YZw==
X-Forwarded-Encrypted: i=1; AHgh+RoKHrl1Dd5eX+rjjMZQdpk5B+ckY4lB+IHKib8+2/+U1xSzgwczPUvmin4+PvC0VO4qEJBsj5ecMtuIjuVu@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+9E+WZqBuA9Irxg1ZLdmKOh8TWyqo42XmRRClSKmmHZ63FCJ
	QMOlujjpBe4eGM8dxY9l8LQrXHURWxJiErgFUP8ktdcvt9lzRKFmoIBODwhXd1+3gPHOSQGuqLc
	uvbA7tBJyl6bs1x17dZXTH+yuc0yvDr4OfMSebtMSTgR0MLI3oWYCl1LyZX+TPOnafj5CKUsfDn
	6c
X-Gm-Gg: AR+sD11iAVWOt1UBM9urjdNKu0Gv4xjJ7NKOgnjPbZ0StzhLeM9pBCOdtxwj4ulalTM
	bpElPb9R9OOjizSsCXkAaC4y6wgcWOky8LGHDz6NtlwYbeD7+IMyb5HfdGNGlkw73DKdazNOZ9X
	fvG8+QbUN8ETOuYF+o6uczxP6Ierrp9lP+/HzL24kk5N8OMC5KnWi9qWd3yJEEzgu5FhhbbBnjJ
	bvijqizYRzoXgmvpm13I8FoQ5YfhtGtKcysDX1Y8gF4AyqUfRWrMt8UeOVxk+VRrIeoUTEVtLDi
	ztN4LhjJjaRNc1S63UkW4TdXed9DNHs9v8Qd/B/V0yiurqI8mvAMdjPg2wbK2wkYw1DJ99wm3S8
	UrlQV1QY3+PPxJxvFV9+mRom7VPEnlcTpyfFNBomqLTBLVtcQEmAR2bYX0MVJeyBUD1tltN5wg4
	X80OX3VHFmfAvPqZwoPgyISY6aR+vH5YIvyZEnFZEKiv7hlHa5ncuM
X-Received: by 2002:a05:622a:4b17:b0:51c:7b12:5fda with SMTP id d75a77b69052e-52b38711458mr31942831cf.86.1785427262224;
        Thu, 30 Jul 2026 09:01:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4b17:b0:51c:7b12:5fda with SMTP id d75a77b69052e-52b38711458mr31941961cf.86.1785427261386;
        Thu, 30 Jul 2026 09:01:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:38 +0200
Subject: [PATCH v9 08/10] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-8-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b7540 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=ZruV3ba3MPUC-7CJ7xEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Y-f6ZSUM31dLbTIbq6RHv6KjShujWxiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXx20zJqJgaTNP
 3rJt97o6DxZ/6UzCfdIzqMRC70eWvc+cYbOJKJrfoIC04QgSYTgQrkgudo/a4jL9JjBbUhPuKW8
 AwWPnwupvtKKnk4+trY2eiyrM4EdqdfiH6Tpd8H1nMaKAZonJk7aPICFmfPgvzfz3mfmLRE1lOy
 +cEhkDOXdF1pnjbZVoNncsKU93hvwMqMMZDnuLk8FdzmOAuK90iDYYnWSTDi3B2LbWr4HlFPex5
 9OwF5rHCvLqn0IFB4BqSgfFlgtEjVbf7PKt41SPs0Z1E7XZLpU5LA89a+hUsftDlGQVLfZggfSN
 wt3gX4p8peI5pO/zELieyT5ubV+VWgxWsmrwiFgGr1m5seC1kGhkSLBfnvfxayGFe7tn0VUWlb+
 peHfMsngD0tDY+HFlrcRAH7GFzPbKDwmtdN0gHApjxJ1Udb5dLAr2MsTfX0pCuGHmgjDGc+8W0y
 +NbrLgKCekgURdL4zMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX1G2ZQmJ0siTh
 B2KRimi8c8Nr7Ntmdg1rIQuXm1GZfiyrnI/c1ohJTMf7RDrTMm/n947eo+vrQWITkClLDU97eZF
 /e4tUdu9iPv2NXovZ39pJ1seBHg9XLY=
X-Proofpoint-ORIG-GUID: Y-f6ZSUM31dLbTIbq6RHv6KjShujWxiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

Some devices store the Bluetooth BD address in non-volatile
memory, which can be accessed through the NVMEM framework.
Similar to Ethernet or WiFi MAC addresses, add support for
reading the BD address from a 'local-bd-address' NVMEM cell.

As with the device-tree provided BD address, add a quirk to
indicate whether a device or platform should attempt to read
the address from NVMEM when no valid in-chip address is present.
Also add a quirk to indicate if the address is stored in
big-endian byte order.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/net/bluetooth/hci.h | 18 ++++++++++++++++++
 net/bluetooth/hci_sync.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
 net/bluetooth/mgmt.c        |  6 ++++--
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 38186a245f14dbd2a26cbc331e7f1b3e72f1a607..145ab94e51482f903f4c9133d8c97561ac1c1e00 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -161,6 +161,24 @@ enum {
 	 */
 	HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
 
+	/* When this quirk is set, the public Bluetooth address
+	 * initially reported by HCI Read BD Address command
+	 * is considered invalid. The public BD Address can be
+	 * retrieved via a 'local-bd-address' NVMEM cell.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_USE_BDADDR_NVMEM,
+
+	/* When this quirk is set, the Bluetooth Device Address provided by
+	 * the 'local-bd-address' NVMEM is stored in big-endian order.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_BDADDR_NVMEM_BE,
+
 	/* When this quirk is set, the duplicate filtering during
 	 * scanning is based on Bluetooth devices addresses. To allow
 	 * RSSI based updates, restart scanning if needed.
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 3be8c3581c6caadeeea56e14e09d4123deb4ec03..c0ed7fb14d19bd79429a6892ec1c7cc89bc7ab3a 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/property.h>
+#include <linux/of_net.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -3593,6 +3594,39 @@ int hci_powered_update_sync(struct hci_dev *hdev)
 	return 0;
 }
 
+/**
+ * hci_dev_get_bd_addr_from_nvmem - Get the Bluetooth Device Address
+ *				    (BD_ADDR) for a HCI device from
+ *				    an NVMEM cell.
+ * @hdev:	The HCI device
+ *
+ * Search for 'local-bd-address' NVMEM cell in the device firmware node.
+ *
+ * All-zero BD addresses are rejected (unprovisioned).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int hci_dev_get_bd_addr_from_nvmem(struct hci_dev *hdev)
+{
+	struct device_node *np = dev_of_node(hdev->dev.parent);
+	u8 ba[sizeof(bdaddr_t)];
+	int err;
+
+	if (!np)
+		return -ENODEV;
+
+	err = of_get_nvmem_eui48(np, "local-bd-address", ba);
+	if (err)
+		return err;
+
+	if (hci_test_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE))
+		baswap(&hdev->public_addr, (bdaddr_t *)ba);
+	else
+		bacpy(&hdev->public_addr, (bdaddr_t *)ba);
+
+	return 0;
+}
+
 /**
  * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
  *				       (BD_ADDR) for a HCI device from
@@ -5072,12 +5106,17 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
 	 * its setup callback.
 	 */
 	invalid_bdaddr = hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+			 hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
 	if (!ret) {
 		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) &&
 		    !bacmp(&hdev->public_addr, BDADDR_ANY))
 			hci_dev_get_bd_addr_from_property(hdev);
 
+		if (hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM) &&
+		    !bacmp(&hdev->public_addr, BDADDR_ANY))
+			hci_dev_get_bd_addr_from_nvmem(hdev);
+
 		if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
 		    hdev->set_bdaddr) {
 			ret = hdev->set_bdaddr(hdev, &hdev->public_addr);
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index d23ca1dd089365fe4606600c68475dceb561e5ee..42b6866f96a4c81850d98041b34b7fcb0f9d0e47 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -614,7 +614,8 @@ static bool is_configured(struct hci_dev *hdev)
 		return false;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		return false;
 
@@ -630,7 +631,8 @@ static __le32 get_missing_options(struct hci_dev *hdev)
 		options |= MGMT_OPTION_EXTERNAL_CONFIG;
 
 	if ((hci_test_quirk(hdev, HCI_QUIRK_INVALID_BDADDR) ||
-	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY)) &&
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY) ||
+	     hci_test_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM)) &&
 	    !bacmp(&hdev->public_addr, BDADDR_ANY))
 		options |= MGMT_OPTION_PUBLIC_ADDRESS;
 

-- 
2.34.1

