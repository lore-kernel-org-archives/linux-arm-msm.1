Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385023DC4BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326142; cv=none; b=KlYmqiAORlu4Hamh7sknHGGnnLH8ktpux4SSxPiWgAGi9dO4pjZxPYoH94wRhtVjJ8OANrALZI18eZTfFd5fKKIXVZwB/Gf4+HJYSRFKs2eZhLLoLx79Pc+OKP1zc5yOBtS2SZzqdfefqWNMj68aOFgW0RFxT9n2RocA7Rot0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326142; c=relaxed/simple;
	bh=fHse+rS17xUX5GVYWIfKr2FEbD8HYkVCn39BVdXrWpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwFCUbKt1eCw9PPAG9YRuUfk0oFgB4oWmbmphPw70jp6Z8dHqUByEYEzUUFiAawW4bWzpu1Put3rti7ONamh0AmMX0gBgZO6NEGAxMzgDipxCE0n9mP/3PEfTZc6N6b901TFlDBTnElb2wGWMRuabUIZRWW1mgyjRJ6aS8l8mz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Moa+46XW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkXu5WW9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Moa+46XW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkXu5WW9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtpvY2599010
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdutxu1QSPLRQaJGSv++B9jUfnt05l6Eko2CexsSKaI=; b=Moa+46XWBvNd8yYN
	QAq360Sn4DLbWW+1lLKdJ7S/ix8kPSST4m/7xbrN1jqBNRTQcwAKx/x4X+yp7DfW
	o+r94aRKyfk4s35R6Tdv0h1X6f2ft4IFpR2fVbI9ZNqGhU/cwWAiIXhz7zmeuzD+
	ECUOmQrd2Zn8bZD1Lxu6VMEXhS61eMzi0/21L3USWJ+pjsXAQwUB2CoIj7X/FMYN
	i68FQsPOrWpiPmLiaihdN9W6v8lWJxw24m3yxXa1gpOA78jHs2TPXbcPOisovYxZ
	zmepR3psmNDv3gT+j47ricEeYy6vwghauSugSwU7JulbobTjUJufdLcBpr5LuorY
	clB5tQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8s1e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:09:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca0ed258cso29400175ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784326140; x=1784930940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdutxu1QSPLRQaJGSv++B9jUfnt05l6Eko2CexsSKaI=;
        b=IkXu5WW9HI/C1kuG2JJn+1I4BVdhqoRNUipFt6tUH+kBgUbj0MeHMPG061fs6YnzSD
         vlfrqZUorkKHpKweblDmMeNiTSuvcqdVZoNZE/4tDK6cCOge2FkMs8PdFgRosu0nyW5M
         TMqvx1LBgEbfnSMEspepUv4Lz6X7O80wRFd95ufp+//hOoJUf7QXaZSCS4PT/U6dBOtO
         bdOuXSXTfYZXqG+kUnDVIxz3U4AsuNZaDJ9L7d6BfvvXvdW70y8czxVp0tvjkkqIotNI
         /+oZhjIQkZzYubOQP2FzvkTw1RNxsFTyGO2OmO6SGGES1/hvGYu95caKzMKywwJkqAm1
         R84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784326140; x=1784930940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdutxu1QSPLRQaJGSv++B9jUfnt05l6Eko2CexsSKaI=;
        b=f2VCqQS8BureqYPxg6BQ9BfU91nX9yrIzWIoiGSNIuCwo3E2aSwGC0W/0oBjx9OJTW
         OQlnLB91PaJsI1g4POn+7cVSPsD3LBu2F7gfWLp6wakLQwuBVhcMWp0C82QUT8KOZ3zT
         z4n50NXZsbKpL69oRcrDM9j96cEyvMCehQHFiE3VBXeTKPUY0O/vWGhxNRHvNc09hTgP
         TfzYHL6SIOGI6Qbyh7GVDTzdrCPkLWh2D5vxninv2iRC4hRZYBodpzegsEvMo8/sEqFf
         /ATMtbj24nOxjxk99pF41bvjLNXONX8lt81PI/5Mx4NoMisTrgcHh3EPoCIymlgTJVrR
         gijg==
X-Forwarded-Encrypted: i=1; AHgh+RoUzRGT21Hb7y7eh5px/zajBTR0vvqyf2u6/JtBFfgmTgAXffcpmOyFdwkroFBON266YKrhWAmb1n4zCCbl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61ih21fF4Bj5sveRJ4446bf0e6CkJ/neRoQMQ+1BelyPy7TMV
	uoGRFLcYj+g6n6tLbbaDsaYUpJd/LhUxmZ+IW5yAiaBkou4Bk4snCk8n7OLejIv/zj/jpcoOaNR
	jEDYsMcZ6y+ShLkW0AQHStlq75lMFApcsYQzUge7cY378+aOtt/PjKIXBBjqzbezI9fVC
X-Gm-Gg: AfdE7cmo7AjJheY2CCl3oKp93IPaPpIflwydBgvU8toUr9LhvRJRDsMivQv5NFrP6n4
	EU568qFPG7JEcTAL0HHTmMPt3rCNKnSYixcFxXHHcBXGuAadDmUx8uuNHxpbbIHeajtxtZYz2gq
	8Ur8pIQHZSJYfJGkz0HjXra8cXWrSjUt148/oR8SHbrzVJ7zbMvrEJj3GdaMwOMcwECUnwHv+y+
	72nnpicZpsrBTDbV/e9NIMfOrcMx6/tpl/HektX7p0r4KkYoG2WEdR47uHkRIGiQs7EbMGuteMh
	Ykj4MW1K5rDSn+3x+M+X8jbyePUwMgdFaLfQz7zPPuISsUPPy8HIvd2ab07Kr+UqGYYG/dvShC/
	ARpcahddiU34K4SX1mtzSnaXo0x8NWAW4AA+cIDoopMckQTs=
X-Received: by 2002:a17:902:f684:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cf34652e9emr39186385ad.0.1784326139965;
        Fri, 17 Jul 2026 15:08:59 -0700 (PDT)
X-Received: by 2002:a17:902:f684:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cf34652e9emr39186175ad.0.1784326139601;
        Fri, 17 Jul 2026 15:08:59 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7668667c88.1.2026.07.17.15.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 15:08:58 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:08:55 -0700
Subject: [PATCH 3/3] Bluetooth: btusb: Realtek: Replace HCI_VENDOR_PKT
 usage with HCI_EV_VENDOR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-fix_vendor-v1-3-f22263c1175b@oss.qualcomm.com>
References: <20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com>
In-Reply-To: <20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyOSBTYWx0ZWRfX/+9BPwsEDzdR
 cgNzuV3rhBqsgfT54Rp9picfbd0V9hpxsv4WNmKV5B4a75aV7Bkz/nRNuF/ZDJfwR/fW8Jel5Yk
 1wQUMKT5b59XXvT23Ns1V2KZdaD8ZOc=
X-Proofpoint-ORIG-GUID: VchQhSkPM76K8yWKzkFViZKrpuEFqwI_
X-Proofpoint-GUID: VchQhSkPM76K8yWKzkFViZKrpuEFqwI_
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5aa7fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x96CrpYRk5hthMOPTrkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyOSBTYWx0ZWRfXz5/ltlmAli54
 VPLNXhdpm859IvSnKfeP5ayKbaPNj3yvx9eHUh2bieYzxPPVaZV4jU5lw8BGHZL4qOGdbH8TQLZ
 KhjU+nAOKStLi6pfSMVCBbssb7lOG5jgw9dSCxV6YW0fqSkjPEw3Y8ZEf/tWaWWkMxzff5yUw9z
 vQIndpsHGYFjZxLIpMoCaeCI53Lwxp707rHL+wn6aYuAxcNgdIVER1oSIOet2q7YDeMf+NGzNGx
 pGNG7wtPAdGl3RA2knGZ8DQ6NgZP5c1+khegm41GRm9VZ/LZZgZNXJbTgZCaClf3SDmBTEMb6Hh
 bXUGyEFIRDAHeW5RBV1c7y8XQ3bv26RCVheSZ57GkgtbFqZKSnysaJFppTvj3MX2nBjPvMoCM+p
 f+qYZtD+F8UynLP5xwPOScq1fOwxDxUdL3/j16UEXvhOkUEKNo+7P+eQ84tcU3mr5iPbs6fm/g8
 Yka6IFzsHtISdyKUC9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170229

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
index d69eec8b2911..6973daab91ec 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2799,7 +2799,7 @@ static int btusb_setup_realtek(struct hci_dev *hdev)
 
 static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	if (skb->data[0] == HCI_VENDOR_PKT && skb->data[2] == RTK_SUB_EVENT_CODE_COREDUMP) {
+	if (skb->data[0] == HCI_EV_VENDOR && skb->data[2] == RTK_SUB_EVENT_CODE_COREDUMP) {
 		struct rtk_dev_coredump_hdr hdr = {
 			.code = RTK_DEVCOREDUMP_CODE_MEMDUMP,
 		};

-- 
2.34.1

