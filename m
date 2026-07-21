Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A2347B405
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628897; cv=none; b=bcf95QUQSuzmyiVUv1n2bsWJev2ttfkRTy0K/rXqRDSMisUZXosBV0VsFLXhdnFR8VZquzeIgvEBAsr5u1xN6/NGBl9cka/LkeT8LciQqpZ6zv1HjiSznUjWXZNSDCcNmc2DshplLKJfjlvZx5wVHbz16CC4W1I2HQUvwl9AGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628897; c=relaxed/simple;
	bh=AtofScJ2X8wM4sopKDEEOLqzXEdRIKA+OE6Kub/tWXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZpWk7/TnTmTaDVFPvRTaSvhuBOHhjjdfseuwvZTjEq3Q60ITbBsr0gIFCNnhD+6tegb/EFpPdR8jLOAcXTFThmt55y7f/Mc+aK8cumCqMItvTin8G1BZ0kTl43bjn27ESq2B57xItViLFLfjWelqsqrkvMcsQs7y+iR9SvaRFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bj0zckGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jP47GjE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj0zckGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jP47GjE/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8rcr7527381
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHZqt2fWjXPHPXcHtsaD71amy7pw+6jum6wX0ZmCt1I=; b=bj0zckGNDvjN264q
	dyAcUFf6Z60JE0tmXx3wE7SgRVXT5TMbpCsXSLdlqtc82rZo9Yi8eXPp24pFQkCp
	s4Re3zHYWPXLIGnjNjFMVJ/U5cMkmZ1WTzCij5AFuTUciz42Vk8QZSGRsXzSnFtB
	fYVweziBrkJLA4oaxXYOh1pwUvXOneaOnfIYuQoXC61WCxv/xLLxbAaMmWTEmAHi
	M6BbAnJ/UFE9VvjdtBXtjPxr7R+ty1re+t3zzKLtVcx8GuwKZSLeJHy1Zpon77rF
	CibSn6csXZQbTRHx5sUpHCxdK9CQwBSGseU3YiRPshrB0F+8ooS3Z69TwKYniIe7
	aYOTBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se1hwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbdbeffb9so39440855ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628893; x=1785233693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHZqt2fWjXPHPXcHtsaD71amy7pw+6jum6wX0ZmCt1I=;
        b=jP47GjE/MeMVmZuq4jJdankupNBCUveDpxAICcBUIJXzeNtiodm+FWI8UoqcDihKDV
         x9e/oSOFBDNGqeqpEpJ/1KTz22C2mZ933bhRkAK5KGdFTCi0I+yVwpJzIUSXVlmN1MlX
         bRXu4U2CN4ydT2Nh0VT+5ioTvOm/OQYSgCe2j2KXohSFue6kbjlVkjgPqGwkjCDvf1M8
         JvVHDIFlGXwiXTDDvWZuTmi6Hz3c3fnCsk7WzZnK1ep99fpjS8Cvuqg1x+FRux8pcXnw
         kNBK2fI2gSXGnBxhE1JAgAw2mOe4D9uanjNkQ2dJTBkvHBb5rdB63sKoeW0WO0K5/Ebj
         wJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628893; x=1785233693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHZqt2fWjXPHPXcHtsaD71amy7pw+6jum6wX0ZmCt1I=;
        b=ZOPLqFEaOD9hc72eSdvROuO1JII/1s5VbHWM5/7GDyl3TxEUJCvMQ/I3fD+kiHBNyT
         1f5S9GtKuqEd17Xgs9ZZSIdVtU0hxMXmicaVcMabFsW4fOLv/h9Qa/e8X6YWNhwPWapC
         i/DorRZa25SIeZeY6RdzeEAvrogNMbxN9RBZ19+Hzc7nd/Tltpn/JJ4oOZZ/XsSgCepv
         wpYboz1F6uYNFveE1HsolnccirVJ5i62z0zMuLIQqIrsINin7ZxMuyCIFNIl3GW8Ttbg
         sUqaACvpn5XNgFD1RtstwM1HwCakCDaetbMhFDtsEMP9n2pkKER/JXpW4lyVNmMN2nNz
         t63w==
X-Forwarded-Encrypted: i=1; AHgh+RrLL2e9IQ/vNfXDRgjZPO5CNpO1IMHrVPsR6zDOEtf1bFzvxKXkhAq4j/CwhTXGQI+8BrRsqV7e9jxX1kHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOhKuoB3f8ZsH/HLfBs/QGsfXk30avAPEh2uBQ2z89zbpysgm
	kLLThY3lZKb6smy9sHAx4DwINT4JIteyKRqLA1CZLRmzxYgA7FLCFiLpSddlSQK5BCjrQrHzgvq
	ZEns1CPcDsI4puEVkWFBC3MfB+P8+13iaAB4YW2ITj9tvj+sQ7UzJo6TJpJ5i0RgV1DTP
X-Gm-Gg: AR+sD11ZsRqBOYeWoo2fmM9qZipJHVawLex/SllK8fRE4Ejj8rI7R4wFMxLSHyDxKlV
	9+YqA0nAJU/N5rzXd/jGgQXB25bnziHIZxEH6gPDBDpI5Zix9HBRpQDhQIVgTi3z4b0gksja5jw
	lgdJPaUKV5lsw14tDp6uEFx+CYkzsIOKN4dLP1LVZz3GUkPJjv1uQCz6B+c0ftLIYcdhNGbyXvG
	KayE5QyESP1cTtodLNoa5MYoXOinaVC9B9BLQtRSEr9+9WUWBn/mKR5UCNIrOqLPJ5ZUCtjOc2N
	Umc5LCFjGXmYFqHvzR1khJjSUF/L+OIZ2V8rY5tvjiB2/j1dioRCjyU7eAhKSdOE4DWI9tC3ZtT
	f//ZcqjIZHUDvh0zBLf3S/TJ/33p5isA4vZGgrvOfFeM8bDA=
X-Received: by 2002:a17:903:910:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2cf802b31e1mr23684515ad.1.1784628892770;
        Tue, 21 Jul 2026 03:14:52 -0700 (PDT)
X-Received: by 2002:a17:903:910:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2cf802b31e1mr23684375ad.1.1784628892356;
        Tue, 21 Jul 2026 03:14:52 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf342e3a8esm73812555ad.0.2026.07.21.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:14:51 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 03:14:42 -0700
Subject: [PATCH v2 3/3] Bluetooth: btusb: Realtek: Replace HCI_VENDOR_PKT
 usage with HCI_EV_VENDOR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-fix_vendor-v2-3-1977a8c39708@oss.qualcomm.com>
References: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
In-Reply-To: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: imij5ZxLtOgS9qgXNUlQr8PW2jxh52MV
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f469d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=x96CrpYRk5hthMOPTrkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfXxNvtSebYfZyy
 Dr0mldceH7Ow/TGSM0CT0gGqTKhbje7uSHjqwtDWQFi4MYMaW/O5AZ7G60dezzaKk3qDAXiAPal
 yI7A49YoegBQW7XVmiMmfJjDSihUGPY=
X-Proofpoint-GUID: imij5ZxLtOgS9qgXNUlQr8PW2jxh52MV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfX1U7AlDHDPl/Y
 Zb8L+UVIs+LUmYnpFUPSHLW7Lzs9DNaTFwDBFKTANaOnIg1Bz8zS+JhR6aqamkiqNRp6UCfPuqb
 vvYlfd4Ze0q5Bq39Mz56IwyKKsLAylHech5ysNmuXRC0Es/ceZSLd2pYDYVQ9xKkxZ23g5HHLB0
 a6gTT7R3KXwzUoPnc6TA2Rw6fT1cyiLMittATYDtk0awREVhYCyuPpCQrbYlmrZ4DU+1DgUYudl
 tFjc93fW6nQPgQIa8GG9TG8gEnBihJqIIbIuC82T5JTzJlZrb0wHCe787BwwOlig5tBbhEp2FV5
 P1OdY6RJ980LyKutMTYkNwbpF8yZyIe6yFgRl4H5XXkPDM6OU9ACpnuLm7gdrdCx23cU3Tf0Oif
 KehN9wKZ28FkEupJrYDz1uF24Pe/PgPfBYDFwHYQtYxrDaUgHjd7IDMZFWrjtKE0OWbzpnFc6Lk
 wL4bq1ybwBRh7MfcEGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210108

The macros below have different meanings even though they share the
same value 0xff:

  HCI_VENDOR_PKT: HCI packet indicator or type
  HCI_EV_VENDOR:  event code of a VSE

This usage of HCI_VENDOR_PKT is wrongly checking an event code.

Fix by using HCI_EV_VENDOR for event code.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 3847a0f6d096..4d59b28ab30f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2800,7 +2800,7 @@ static int btusb_setup_realtek(struct hci_dev *hdev)
 static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	if (skb->len >= HCI_EVENT_HDR_SIZE + 1 &&
-	    skb->data[0] == HCI_VENDOR_PKT &&
+	    skb->data[0] == HCI_EV_VENDOR &&
 	    skb->data[2] == RTK_SUB_EVENT_CODE_COREDUMP) {
 		struct rtk_dev_coredump_hdr hdr = {
 			.code = RTK_DEVCOREDUMP_CODE_MEMDUMP,

-- 
2.34.1

