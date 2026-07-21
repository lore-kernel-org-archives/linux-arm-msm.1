Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91247798A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628896; cv=none; b=nXn4MIH4LhKY3KjBP3EKnFDbIaMCbVulbXO+UWJ2BHZqPYJYXI7cqpSTeolzfVLHm5rwqVSo9w3GjpIL0u+lPv7xJYeldzA90PAXt3HbcNxOPMgspcHHGcabgzhO+eSiUXtEnwGjmbTqjCC4rkhx4wjI9bKYXqRKsP2XIgb89KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628896; c=relaxed/simple;
	bh=o9EVa6Ayl99uU/W5Td/prtqNZfPm6oKB3CMaxwDUV74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEyLp/KNPhntlPi6yv6c80rYiecnZciqphzcnoKhSpHb/K74IhRu6f9a8QR99GOQUbrKz5j3uJsk4hpE4fDlJ+ADglYRrcwWw9tQfQJkJWx1qW1aGuXM7evvX1NVXyh+F005ubgMBHSCuSmIq3ZWeaRIufizhWkiTuNt/FY3ofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZvdIn/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzaTUW7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZvdIn/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzaTUW7c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8nbuZ535680
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9OKr/yW5NmookCdWgxyMj6JQ3VShNHBjGxnFEyAh0ws=; b=AZvdIn/fAGaDQsjw
	AXJj+XcacJcHuKNAg+dXi+eUMwRQ4BUuz78pUYZgDj2cFXeJ9gYDfDzl8M2u6Oyb
	8eCQMZgNYlLU/HHWcf3XzZt+GxfrK5La1z1U8zo+xjo7IMvhrgLOZGvoSG63/3Gf
	ResvXFnQh2cRnf/frjaLyMItujoFqTOkOc9EpUFxvA5cb80tCwdfTnHb5fQMWsbN
	AnTpEaD95LlVviVyRhr2VTdhUyMBESQ26cx9bNu6aGfio/qwrvQw2q/VjFOg/9KM
	tZsaRnA5NnYS27p+24KNKIzK7ttkzka5AtfRNDkWY3Cy4eAafnm9DvU/lJhGt6jJ
	Ui/xaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duhp29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ced1ed870fso24583215ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628892; x=1785233692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OKr/yW5NmookCdWgxyMj6JQ3VShNHBjGxnFEyAh0ws=;
        b=GzaTUW7cTFNvVySpiWYqWh5jKAy0ywbv2oqiNN0TQ37SoWq7OJ7HIg8XrWeNWh5oEj
         02F/Y8Kl6ulgsC4+sow2wE3OYtFft6NlhkwE3Ci4BX5qkG7ca4tCYB0N/CWWyYWmZK6b
         2sk+3xAnrnuwXgK+mFyWLZZqhKu5Pwe0mRed+HMEfh2p9qvjtHuTImhPmgJ/OSq/NKm+
         9j8RdLBi/w4NXhGqq6jkd1vjQ2VVZiiuIrFWvZXjMQdf2icGNo2BnvEulEZTn6Hik6IB
         qOhzu98IJCN5Mjr09E4wH6F3f3repwWFCGfR2f22CueYz8BFYkDccwJepOLXHFWi3ACp
         Acug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628892; x=1785233692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OKr/yW5NmookCdWgxyMj6JQ3VShNHBjGxnFEyAh0ws=;
        b=io1UZWfc2ITOJV5h0ELhgRAhe4fhelqYz51kHow5M7XyPoaF2ZII0ZQmZm96fVi48F
         iAlNmbcPjUJaZWSy9zdFpC9RxLa8hH8j+q+5BN1Ir7e4B7BIOP8RBPDzEE/tCI73pFmG
         t7VYYxO1DdxXqiuH8O8xywD8IR52KxrNIc3HX6fOUvfLwz2EVwlbtT9t+reUazRf838H
         z3E+Rg/6IgtUuWNV7bSa7E/MIW7aFBh+lat8RvtIQjTMsJg0BfJwAM5oZEcYUr7lsCqZ
         B7jcaQAY7wClLoHtWWgLRL68gCsCv1sV994iHymjQD6lh3pHmQvkB6IOkMMfbacXCr82
         PVpw==
X-Forwarded-Encrypted: i=1; AHgh+RoZ6Cm5i/VN9gXB8DPnjP/TA4leyQvEOL7J1tyE/vmBULGkkOZk9+Gf/uHur0RLJi49kU9pZUjgUAQ4p5qp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Owu2sPo7XD7KD96nJGfP6nOer2hrlCnJYjILSGrbvsqGJVvm
	Fex5hPsoWBWss8+iXjC1uEKn9S2dGsg/K0mdkf1s5HknLQTBWWWtfICxKuLdzdzeuVWXny68cjM
	uNi07HFr+uG9LvXZxHWZ7qSejeoOXAT7k1cxYrNRiU070uPkQE4VZIduv7sGC/y0ad778
X-Gm-Gg: AR+sD10vFOR6vCB1S5Yv4ZybOi4Zne8oPuKbme3jhZdAHRwtpaiK744ZPV4paj9TrQi
	2ret+C72e9way8QLkRtX1FAgLkA4eD/cgTHYMIn67U/3j6AX9L7pdArr1bItK7cWhWhd9CJP3c4
	XmuQxjJ00cmiwinxTM1Hq6RMwV9iw1D3WfAalcNglpstMYSFuvgiaz45d8D/Xtq08JIuFh6xM0s
	CJONJErfKuGLUk/SQ1+bLfift7OTZjOPVgwvGN3aEBIrrhRFoy4aTO7yRzzIMAafKs/8pwfQUCI
	sDRjXEoLBxXT4yPiUjbOjKNRir7GyFuxfAs7AtxGKs5RTW6x4pUPUdhYh4useyQhuXkvXVX73x4
	9PyfDPben02dzldkOeN2maLDdv6PmptyoR/t3aypYaGyp3bU=
X-Received: by 2002:a17:903:324d:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2cf802b7fcamr18691685ad.2.1784628891823;
        Tue, 21 Jul 2026 03:14:51 -0700 (PDT)
X-Received: by 2002:a17:903:324d:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2cf802b7fcamr18691465ad.2.1784628891414;
        Tue, 21 Jul 2026 03:14:51 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf342e3a8esm73812555ad.0.2026.07.21.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:14:50 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 03:14:41 -0700
Subject: [PATCH v2 2/3] Bluetooth: btusb: QCA: Replace HCI_VENDOR_PKT
 usages with HCI_EV_VENDOR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-fix_vendor-v2-2-1977a8c39708@oss.qualcomm.com>
References: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
In-Reply-To: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: c4lMbka8uBQLKLSUc3A_jKPXYXBGnees
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfX+Au6avyB/RW9
 v/CBsr4/FBjuL3WweFernHl9+oDKZfKvaV9vOmidOIANCscoPeC8Tfy4fB3qQjlmQLgV8ae9Cgh
 YVRKMhEdRp3U+mPE7wLW6Gh38JYPH3hGPmKFO8klsp8fDl6xzwJavuW531jh8lNcIH1Py2iRfHi
 IY/PtNK4X2Yh+bEmc+b8X9Mxtm+0HlWdT34snOO6nJTSzvGC0Pt/6jPkBcU5RVFcfeN7PD/DguZ
 FIKP4AaXxyru/bJZiZ870IRLfgHwNybtYMCWtbcId3gQLyBBkCyTe4I7OpNZY6YqxgoVQ/SfGwT
 28jBoLIyDXzDQf7r5eQ2Md+nEnuGIz7YiUBKWuGokDmH1cFk5Px5BuFJoTKbtrpjccJ9M/FtUu6
 lUbHdLEd4M4dMgyLPBh89nkc0hPU8FwOPnb9Zhs89tKBWN7pGLmbzj1wB7fG9O7YCTkPUBjCb8a
 Ji8wOaM1apHkIg1Ngow==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f469c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_0CnrhXH5lyLv-Mul2kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: c4lMbka8uBQLKLSUc3A_jKPXYXBGnees
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfXwv9cPsA55PGh
 TgeCysMHvG+UfvvRYUYMBvV0tTexhiejYwugdm8BSIhYOXx0+RpWA9kAR0nlBuK5+625fOkDPK9
 fAWdNp+OqEcNui+GaF9qQsQoa/e65Fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210108

The macros below have different meanings even though they share the
same value 0xff:

  HCI_VENDOR_PKT: HCI packet indicator or type
  HCI_EV_VENDOR:  event code of a VSE

These usages of HCI_VENDOR_PKT are wrongly checking an event code.

Fix by using HCI_EV_VENDOR for event code.
Also fix warning "CHECK: Unnecessary parentheses around comparison"
given by checkpatch.pl.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index f7cce0cf472e..3847a0f6d096 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3278,7 +3278,7 @@ static bool acl_pkt_is_dump_qca(struct hci_dev *hdev, struct sk_buff *skb)
 		goto out;
 
 	event_hdr = skb_pull_data(clone, sizeof(*event_hdr));
-	if (!event_hdr || (event_hdr->evt != HCI_VENDOR_PKT))
+	if (!event_hdr || event_hdr->evt != HCI_EV_VENDOR)
 		goto out;
 
 	dump_hdr = skb_pull_data(clone, sizeof(*dump_hdr));
@@ -3304,7 +3304,7 @@ static bool evt_pkt_is_dump_qca(struct hci_dev *hdev, struct sk_buff *skb)
 		return false;
 
 	event_hdr = skb_pull_data(clone, sizeof(*event_hdr));
-	if (!event_hdr || (event_hdr->evt != HCI_VENDOR_PKT))
+	if (!event_hdr || event_hdr->evt != HCI_EV_VENDOR)
 		goto out;
 
 	dump_hdr = skb_pull_data(clone, sizeof(*dump_hdr));

-- 
2.34.1

