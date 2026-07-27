Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58B3B47DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167245; cv=none; b=IWNUREgqc10tixDfzGCQpMCTAd20BzkpOhqQF18ibElbYtXEuFMNFHD7uMasdNkRJi0SSC1CGILX9SQd9VkjFze4TsASbxb+60/LrWGO9MY1pnlw1zk4Yowaw19fe2FfMruruNOTc+tJJTmsPAlnz31ZOgRu5mwv0nR7WXGDfQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167245; c=relaxed/simple;
	bh=PHaqeojzbtDW7X8qznxUaxLfHnsF6kAS/6alseNThEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcdeqKK+NGyOkIb9nofSpw0FE3zAAwJrC2nfGepABbFLJlRRJkNoVffnMGnNjzn+g98+vVqyjw+14wyMEQZNvk3Mz6YzDakJ88ZxHEGIgHBlvDCRnqdktpf+R0Fwuf7YeC31objOA0T/0qCzGju7HanKhgwXhIu7UI+R74dqr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYOANaQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE0kbHbi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYOANaQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE0kbHbi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlpix3787323
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfPLzlHUO9D70MCUlPvSN9kN+1IR3sqo2KujaiXZ7fk=; b=NYOANaQLYN0NdYMH
	Tc9ubcu9gzAdBrgmL4DJiRVL25GMfS2CUlhiUtwXVZukViPW1EQyjdjzPaNq1w7D
	cBBaX5q76E2isw9eoFy08xsxOmIqFiYKZ/XmZ+zqtnTpaSfr+tqzH/7aCZM1sfID
	ZhASD4ykWYmE2KDOsdwpA3Jd6XgwtqULksNfB8ozG31wX/usOJGPu3vzRq3Cpvxg
	9y3ZBDdfkv/ewZNWlnQcgLXPFj/qKhydpHUgI9qHv6xN5qrHQxAk1CsHyepcV2SR
	XJoz9iAitQ+xmq5rLCdr/8GBcFESGqmag7okS5dJSY66lsT/NRlzluT8wePyb8bx
	ZdwR+w==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hrra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:18 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-664c8e55e71so4643568d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167237; x=1785772037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfPLzlHUO9D70MCUlPvSN9kN+1IR3sqo2KujaiXZ7fk=;
        b=YE0kbHbiFIh90RAwBlTceySof2+vJggAg2R/L0tAeK9WhfZy2T9ngmBQcc2aywd/ks
         wNTwVVXy5iOJKZIaDQnU7BbBkG4ofczID7MAQA6HZfqBQsS6nnbs8zEZ1agZixmsscu2
         BVmlQdi4NqTTRZravpnh4RqoFXJr6+JepgapaqDQZMzL28bDo/xFp1bnDSu9WhrH6sVo
         QNu2+izB9/4MEtzqFZv2RfQBT7PkVy1NWPWFCRNfmyozXwOLgQ4Kvj7/yDoD7t4SwHZ+
         fm8G+t7UUDmrsuUmbVBoUjIAC9WV0DH9yXUOWXcnolIENnslMuFNX/npsO30dIZFDnO9
         w9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167237; x=1785772037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfPLzlHUO9D70MCUlPvSN9kN+1IR3sqo2KujaiXZ7fk=;
        b=VGXhO71jhm7jTXlhhzPBG4OPeEBIOgtuJpbwIbNYaV/eRvIsWU5Lsg90uidNeDaSSr
         yz0chRjm+AK8aNa33HpV6Fr9c7HPtQEKstSUmx7nCUwAtUWC0baMPSa/dIBHhLchv7eC
         ooHO89yH3Kh9uHRs8+VITcwGMTBY5LzMHxvJGXlJd984SEJOZJs68m7AThJ43AUcSuQr
         tMUyd3Tsz3xT6MP7KMcJ8fBcSL9IVZmrnuWHiYUHft9DPRdbmBWoJ/FIrlzmt3rqz8bk
         dOQ8fSLn3kuVHLvxmsmAi0RuflrT78BzmnlRyqvsZPwVm5Y5sM5p9HCw6AmcaPM867Jh
         7omA==
X-Forwarded-Encrypted: i=1; AHgh+Rre67YOqH8BCYk7Bt+vkLWEP/Jufet+Sm3vAsoMa4udSJ8p5jFDCpVZHjGHfsc2PXUaGZ6pBW2ogxsj9++V@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbKCmN81hl58zzgulH4Tc3fakrkTII1lCrAD4RGc91bfJqnd1
	JRzOIOIS/5JdtpiPR7PHAZo+ib+hlOAUftG+bFQ0+f9bO/1j9Sdssf1J5YYF72kbH/Z3nlGp4aW
	8cqwgu5K314mEgmffgPvUUBpUVRS22K6lpo9dj3Z+Z6TsPVnbc+639mlaezMFyUnoeqmZ
X-Gm-Gg: AR+sD121gJ0Wi/cAD+fQD4NR5EV3S/Le6159dc/0evsOGJLUyvEjOuI4pBNxtG8zm4g
	4SzqN68hfyS6JRvzDrZlhNekOrsFzJWqswzDIzUuPbyLsLxf0uBPltgG1eGAsMTI80jB1SsTUf4
	j16eJ2TZCTg8r513jeVNcQU/TXfbUqrtpMW7yAgGI7Gv3MzA9lf1O003JywYR4hOFVmxNMFCyZF
	0Oa6Yn6K6XBpbLbomZQZNfBe06wi5YMnRo6oz8cNehvi/gc7tcAw5xj9+8sFL58z61BccUkBoIO
	oQZDwCllq9HIIPkM0xFdxHMyLtPTrSDPgnKma80mWstEY0zlhpMQUF96FM6vMC4VQHvEgadQ3ob
	Pyyr/AENKq4UUP5VSxBmDTOXZBUfw4g==
X-Received: by 2002:a05:690c:61ca:b0:81d:5806:ecc7 with SMTP id 00721157ae682-81f69cdcb61mr33296347b3.1.1785167237508;
        Mon, 27 Jul 2026 08:47:17 -0700 (PDT)
X-Received: by 2002:a05:690c:61ca:b0:81d:5806:ecc7 with SMTP id 00721157ae682-81f69cdcb61mr33296137b3.1.1785167236875;
        Mon, 27 Jul 2026 08:47:16 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657c727asm33307617b3.19.2026.07.27.08.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:16 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:15:02 +0530
Subject: [PATCH v2 2/6] Bluetooth: qca: add QCC2072 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXwczvb5X0jY9H
 0aOIcBgqPtfyWRKsO1PpQBpTNpUJ0t02yHW1c61VCbCcGUhIKdDq2dWy471l+OXg6S8UAfcqZvq
 MwEqXKKK5jpF/GynvLf/SJeZHFiXTlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX3NcpryvWZ2u1
 /6cfDsDPaZ3hLA+x7hmNbtqOIwODNcOOy1yingjKwg+C7u4lXuf5B5vARebii9HmL/+cERaSG5g
 ItJOUBHu7HaZLu4grFYvelKnJX46jDO7cIA9Z8noCkJ7LnZDVrgCV8KcadMvTrtaFqjQGBeY75L
 ZRfhXmquSz8b4wdCHvs30bVYVSZsYSj/+Wc5ZD5gv+duchVWwSnRTKA8djN2nPXBeTvi+j/8nx8
 9FrnLxBDIpocj/PJ6fLR0JhaKTag/G/hDPFiPFrcA7wyKNyWJ7SvHSIh4miBGOgEMNTqre3YBdN
 34vUJ50dlRbTsFPQdDxJ3bC1kh0fiyG6KpsxkJ01Edrm7gKseKPLV0ddyviJlEAognmBzqlt9ds
 GkTUBq17fGMk+RnGTLolVw+XzNEJhc3OBNVVq4+fn++hbGQCcRmse4JApTbfYQH2q9gWfifIuXH
 QqNQeB5UZhMONClXe2g==
X-Proofpoint-GUID: zc8KGZrcU7r7IXPfvBakgnKaRWgo7y7M
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a677d86 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-a8tec4L23EK6eFu2usA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: zc8KGZrcU7r7IXPfvBakgnKaRWgo7y7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>

QCC2072 uses the ORN firmware and NVM naming scheme. The tested RB3 Gen 2
Industrial BT-over-UART setup also needs the BCS calibration TLV to be
combined with the selected NVM before download.

Keep the BCS/NVM combination in a helper so missing calibration data or
allocation failures can fall back to downloading the NVM alone without a
local skip label.

Select the NVM file and BCS calibration file using the controller board ID
when available, with fallback to the default files. Initialize the BCS
calibration filename independently of the NVM filename source so custom NVM
firmware-name paths do not leave it unset.

Register the QCC2072 compatible with hci_qca and route it through the same
UART setup, speed switching and power-control paths as recent Qualcomm
Bluetooth controllers.

This continues the QCC2072 enablement work previously posted by Vivek Sahu
and later extended by Yepuri Siddu for the RB3 Gen 2 Industrial
BT-over-UART use case.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Co-developed-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c   | 72 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btqca.h   |  2 ++
 drivers/bluetooth/hci_qca.c | 24 +++++++++++++++
 3 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 10c496eaea2c..34bc0684cf1b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -569,6 +569,54 @@ static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
 	return hci_recv_frame(hdev, skb);
 }
 
+static void qca_combine_nvm_calib(struct hci_dev *hdev, u8 **data,
+				  int *size, char *calib_name,
+				  size_t max_size)
+{
+	const struct firmware *calib_fw;
+	struct tlv_type_hdr *outer_hdr;
+	size_t inner_len, combined_size;
+	u8 *combined_data;
+	int err;
+
+	err = request_firmware(&calib_fw, calib_name, &hdev->dev);
+	if (err) {
+		if (qca_get_alt_nvm_file(calib_name, max_size))
+			err = request_firmware(&calib_fw, calib_name, &hdev->dev);
+
+		if (err) {
+			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+				   calib_name, err);
+			return;
+		}
+	}
+
+	bt_dev_info(hdev, "QCA Downloading %s", calib_name);
+
+	inner_len = *size + calib_fw->size;
+	combined_size = sizeof(*outer_hdr) + inner_len;
+	combined_data = vmalloc(combined_size);
+	if (!combined_data) {
+		bt_dev_warn(hdev,
+			    "QCA Failed to allocate memory for file: %s",
+			    calib_name);
+		release_firmware(calib_fw);
+		return;
+	}
+
+	outer_hdr = (struct tlv_type_hdr *)combined_data;
+	/* high 24 bits = payload length, low 8 bits = type */
+	outer_hdr->type_len = cpu_to_le32((inner_len << 8) | 4);
+	memcpy(combined_data + sizeof(*outer_hdr), *data, *size);
+	memcpy(combined_data + sizeof(*outer_hdr) + *size,
+	       calib_fw->data, calib_fw->size);
+	release_firmware(calib_fw);
+
+	vfree(*data);
+	*data = combined_data;
+	*size = combined_size;
+}
+
 static int qca_download_firmware(struct hci_dev *hdev,
 				 struct qca_fw_config *config,
 				 enum qca_btsoc_type soc_type,
@@ -614,6 +662,11 @@ static int qca_download_firmware(struct hci_dev *hdev,
 	memcpy(data, fw->data, size);
 	release_firmware(fw);
 
+	if (soc_type == QCA_QCC2072 && config->type == TLV_TYPE_NVM)
+		qca_combine_nvm_calib(hdev, &data, &size,
+				      config->calib_name,
+				      sizeof(config->calib_name));
+
 	ret = qca_tlv_check_data(hdev, config, data, size, soc_type);
 	if (ret)
 		goto out;
@@ -845,6 +898,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/hmtbtfw%02x.tlv", rom_ver);
 			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornbtfw%02x.tlv", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/rampatch_%08x.bin", soc_ver);
@@ -878,7 +935,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Give the controller some time to get ready to receive the NVM */
 	msleep(10);
 
-	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
+	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850 ||
+	    soc_type == QCA_QCC2072)
 		qca_read_fw_board_id(hdev, &boardid);
 
 	/* Download NVM configuration */
@@ -939,12 +997,23 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
 				 "hmtnv", soc_type, ver, rom_ver, boardid);
 			break;
+		case QCA_QCC2072:
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+						  "ornnv", soc_type, ver,
+						  rom_ver, boardid);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/nvm_%08x.bin", soc_ver);
 		}
 	}
 
+	if (soc_type == QCA_QCC2072)
+		qca_get_nvm_name_by_board(config.calib_name,
+					  sizeof(config.calib_name),
+					  "ornbcscal", soc_type, ver,
+					  rom_ver, boardid);
+
 	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
 	if (err < 0 && !firmware_name && soc_type == QCA_WCN6855) {
 		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
@@ -1001,6 +1070,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 8f3c1b1c77b3..425133096eda 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -94,6 +94,7 @@ enum qca_tlv_type {
 struct qca_fw_config {
 	u8 type;
 	char fwname[64];
+	char calib_name[64];
 	uint8_t user_baud_rate;
 	enum qca_tlv_dnld_mode dnld_mode;
 	enum qca_tlv_dnld_mode dnld_type;
@@ -158,6 +159,7 @@ enum qca_btsoc_type {
 	QCA_WCN6750,
 	QCA_WCN6855,
 	QCA_WCN7850,
+	QCA_QCC2072,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1222f97800f4..449f0896bdac 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1375,6 +1375,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 
 	/* Give the controller time to process the request */
 	switch (qca_soc_type(hu)) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1462,6 +1463,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 static int qca_check_speeds(struct hci_uart *hu)
 {
 	switch (qca_soc_type(hu)) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1513,6 +1515,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, true);
 			break;
 
@@ -1548,6 +1551,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, false);
 			break;
 
@@ -1864,6 +1868,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -1963,6 +1968,10 @@ static int qca_setup(struct hci_uart *hu)
 		soc_name = "wcn7850";
 		break;
 
+	case QCA_QCC2072:
+		soc_name = "qcc2072";
+		break;
+
 	default:
 		soc_name = "ROME/QCA6390";
 	}
@@ -1986,6 +1995,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		if (qcadev && qcadev->bdaddr_property_broken)
 			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
 
@@ -2019,6 +2029,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		break;
 
 	default:
@@ -2172,6 +2183,12 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 	.num_vregs = 4,
 };
 
+static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
+	.soc_type = QCA_QCC2072,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2274,6 +2291,7 @@ static void qca_power_off(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCC2072:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2429,6 +2447,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2448,6 +2467,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the
@@ -2490,6 +2510,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (!qcadev->bt_en &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCC2072 ||
 		     data->soc_type == QCA_WCN7850))
 			power_ctrl_enabled = false;
 
@@ -2498,6 +2519,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (IS_ERR(qcadev->sw_ctrl) &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCC2072 ||
 		     data->soc_type == QCA_WCN7850)) {
 			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
 			return PTR_ERR(qcadev->sw_ctrl);
@@ -2576,6 +2598,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	struct qca_power *power = qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_QCC2072:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2785,6 +2808,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
 	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
 	{ .compatible = "qcom,wcn7850-bt", .data = &qca_soc_data_wcn7850},
+	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);

-- 
2.34.1

