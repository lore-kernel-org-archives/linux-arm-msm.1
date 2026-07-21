Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2A63C10AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628893; cv=none; b=qOg4a/q393iwoPtL6X6mPFsa1rxFbUB62PjQ4spVySgm8cyCqcij783BI63KZoFKEoMpIsqyVuNZV8L6SswdVVjRMmWgjUxVCAbLEhB7rL4Zhq/cUpafLXfsP0/GvdzCGKMGN7HuUKPpl5h05YZAPZdDaZ+E0CbH/uZtcC/6kZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628893; c=relaxed/simple;
	bh=cNYnvAx94Lia5gk+slyqR5M+GJxGru37HUBkyjd7bvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C1AYD2jLaRz81rCk5uc+qK0AJclcSgvHVIdk/+CiQhT7wfwmSL/xN94tZIKoUVfhseN0Z9IHRR6xuH1t99sdcs18OGz+2YGrJYp9ITVNRL/otv0y7B8PsUPfBfBPZgTev9ryfGRyB2lnJscrz5fXeFqCYriRWSVQZvaSkgs8biE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GudcbdlO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acyKiL2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GudcbdlO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acyKiL2C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LA7GDM1564222
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sR3EptUrrlf0fNVPKbiBFz
	dko3Is6AFddjZ1rB0K/VA=; b=GudcbdlOu8oDObEBAnkP6pJA0SZqDxbF6h5h2B
	sz9+lnDjrvugL2yYnTALSpSAJiL/rhpesD0ZrTBha3cdnn3iHH35slgOfLMDN8mQ
	UdMkcDKuuP/ujAdnTMd2USa8VYr1AKLzGYmXcbylGVBWh5wvuL+lIJtv/DA5c5iP
	ThBGMHcmfUMyvBCi137o55L4LYyUyZQhDZ/ahO2Eu4WPLlrHnTR5jpJ1lkCVl3gN
	WfVUJ3u87VM53wqaPGEKdOQENsHawlwXrg+MafWTN8uRFrZF+7J5GNRIqDIC/OAW
	vwuwczLTxFeQhHDye2O3LJfnBQisfxhCWpKUO/BmwidX0+ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3g128-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc98d6a88bso37343315ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628890; x=1785233690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sR3EptUrrlf0fNVPKbiBFzdko3Is6AFddjZ1rB0K/VA=;
        b=acyKiL2CCTfUUdOkFKRAzCXpszbgD62L6ntvSgB2Td7ERbxlFab75DcVgxor3bip4a
         enPwtQubBoOZLb40t0VZSlLgj8uqZQE+uy2M7XcWGSkUjoJb/qtTV09BK6U2mPWjo6jP
         stsL1sSx5vvThJFJ002We8dYX7Z8+f//6KkfPHs1nSVHxEUI8Tyf0ZPAWcLviWWFh7VV
         5runmdo7agamDjcz+A9SslRBBWNdOrtnLL9Ys2YXC51dyPz4kdy6LCsvyXNkpKjphIkj
         ZjaL0cGRnM17CuMNMD1+dVOOmxprJMdXX656jQ0qmpPfgl5k5/5j+2zT2Gpis00CLuOU
         qrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628890; x=1785233690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sR3EptUrrlf0fNVPKbiBFzdko3Is6AFddjZ1rB0K/VA=;
        b=gRt3QlBQS5HmivEyDpzNWtBTQwADaH90dGk8ugQK+GhL4Di0m1beiHiihth1gPHADe
         jbUUeEwY8Yp3FUQyz0vdMHLhAYZrxfjdN0MFb3h/DXKWyGorp2PJQFFhfUIsRJJErQ91
         zCHHootGAE6XAEnjFhroiHlxldYGqGQ4uTcyRhcHX0sg2hSMrMiuqhp9NmPasbWf8Gql
         493O8XIsdYnnCQFJUTy4y+H0u8uEsY2KURcGxpngqz9/UiiWDrQAS8K1gXAwt5h0uVVs
         wsy9VEcfvoyWRBoB3d0ES1uDoNH1ZzVHn+Wcr2dfvkX9kjr+CZpfOFe7fwKJd3f3rUtn
         pzoA==
X-Forwarded-Encrypted: i=1; AHgh+RrhdQyvsDuBwWpZEkz60QmT2eNR0SlQn58W3+Dzy7prgvRaGjIaTzsfHPb8rE/xD83Tizfjlt38ze1ipK4P@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EPz5PKN+MhrgsFWi/kSgrP1Mryxcsq5I74M8M5wPa82HVGJY
	AQIbSksvGuDU7JrJOnhUpf4EiMdDrE9by/bGNqqI8oFN/4VBdR1DU5G8LlkVgQ3nq359USiDvOT
	fPTsWzy+vr2XmCMbqE1kz8PyiTwQMBLhrTFdsyhM8IAoiXZ59lQ73pqp1zZHhoB80pNi9
X-Gm-Gg: AR+sD12qsb+moZj0osUy6Wpm9B/Yks1XS2UNbgZ6c4x0nIJXB4XpS4mDMJ6Oc1fTCRY
	9ki7brZTpcv/ZkpZ1TKelBmORMSUaPGIfmo7kr4h+1xMMjYhVzx21lBQmZTiXN0lU3If1HCp69O
	6/RaFWyBXHtnDo4BRBg4XPIQ3E/QoHxWITBwPjconXWrAk6TObmj6I3n8tXZCJzU4DyfcKCzwJk
	TEi8qIXH2N4KIWRAmq0xAN/ia4lMXqYd0n1UfTURPXa/lknwA5MVjzUHvbXTO+077+g00XE548U
	mIZzk6DE1EqXri6abBQ8KAh30RKg7txozMPlkVSQGjF+gon7Cae10mjWLKB/Pf7+J9dgjucUXcp
	Ih5bu5hVqWDmBcytZFbieT9OLQFrGHBlZMhF267oiBlrKKUs=
X-Received: by 2002:a17:902:ce11:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2cf804364c4mr20572765ad.6.1784628889828;
        Tue, 21 Jul 2026 03:14:49 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2cf804364c4mr20572495ad.6.1784628889411;
        Tue, 21 Jul 2026 03:14:49 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf342e3a8esm73812555ad.0.2026.07.21.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:14:48 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Bluetooth: Replace HCI_VENDOR_PKT usages with
 HCI_EV_VENDOR
Date: Tue, 21 Jul 2026 03:14:39 -0700
Message-Id: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9GX2oC/22MQQ7CIBREr9L8tTR8rBBdeQ/TGErBkliofCWah
 ruLXbuZ5M1k3gpkk7cEp2aFZLMnH0MFsWvATDrcLPNjZRBcSK5QMeff12zDGBOTruPadQOaI0I
 9LMnWdZNd+sqTp2dMn82d8df+1WRknDkhhNwbRHUYzpGofbz03cR5bmtAX0r5Al/P3lerAAAA
X-Change-ID: 20260717-fix_vendor-6f40af4b1c91
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfX29/qOrTZooV1
 yp93wgEBgD6A8qkKeDdVe21ssBRZq4e0OEEz4uY2gLEwfbG0BBfb5Q+Wo+LyesgIiqwu+SVWm8m
 hV7wA+GU2ENKQPGE8pcWAABZyM11whU6vB2ZcpsktaQBhDhKINhXQPj4DG4Jcc0iVOJciuqdLWC
 SvmiAV9/wOJsplFJcghTKodsUJsfWWuDoqpTac8p5ulncfZI7TTALrtoPzK6gn8u6v2/+7UlZRV
 YAcH9+7ypkwxdwGRH3lVMJ7IZS4gui24Y9KPO6PqYtuWGXIGacl5E0VTIc7DVPStR5+EQDG5u/d
 cM6kmIm5CNZLD3ozway+DzzfcZdcszcm8KxzBsAMYK7eu+wNZ65FzRt5RzsogbOP9Oda8oFk9mw
 xTAGDRXloHUVPEDfLal7y7nFKdP13GAewXyaNui06x5XgZxDp6cNauLPNx9M4DuffJ2Y/zanoXL
 IEcnZPaFt67meg+vIsw==
X-Proofpoint-ORIG-GUID: hu_3rZRE746YNUxFeZ851HrHz7CuprlB
X-Proofpoint-GUID: hu_3rZRE746YNUxFeZ851HrHz7CuprlB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfXy3kmz35PsBbR
 HKVidUAFCxaMsy5Lu0a9lnGlsw+JyDaOu/pFNkZ0SBngEo6bv2anzv71CKopLMhNtbJJs3brzKC
 f09vOfKLlSmAsUeLsKUdkME/utKVOfg=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f469a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dei6p5SHAAAA:8 a=pGLkceISAAAA:8
 a=v3ZZPjhaAAAA:8 a=KFUITBosX_vVOeKc6roA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210108

The macros below have different meanings even though they share the
same value 0xff:

 HCI_VENDOR_PKT: HCI packet indicator or type
 HCI_EV_VENDOR:  event code of a VSE

several usage of HCI_VENDOR_PKT is wrongly checking an event code.

Fix by using HCI_EV_VENDOR for event code.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Changes in v2:
- Rebase and fix conflict for the last commit
- Link to v1: https://lore.kernel.org/r/20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Zijun Hu (3):
      Bluetooth: hci_qca: Replace HCI_VENDOR_PKT usage with HCI_EV_VENDOR
      Bluetooth: btusb: QCA: Replace HCI_VENDOR_PKT usages with HCI_EV_VENDOR
      Bluetooth: btusb: Realtek: Replace HCI_VENDOR_PKT usage with HCI_EV_VENDOR

 drivers/bluetooth/btusb.c   | 6 +++---
 drivers/bluetooth/hci_qca.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 891916abe16fc409d6e600ddd41b86ecd8f5a9df
change-id: 20260717-fix_vendor-6f40af4b1c91

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

