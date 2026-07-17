Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A7175A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326140; cv=none; b=hgbPbRHFnFu9L800l+puPxakQyRCDVOtGzANC7ivembYiWb8QtOgGTsQD268DbUT4GxEa/ItDY5FkaGjGz3sQ89JqeuVPjT5PjZTKhpH8T7oMcGx0drTSHtrBjMn+9Ya/RzkFhJGmcwx1hQ0uxTuHdrTdbQyucV46F6XTQJZeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326140; c=relaxed/simple;
	bh=8+GouPMF1VDvlAiTeKof0cun9qWLvAKw0z7JbnmEluU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p9qlnWxOORi1xkkhhsIjlREohcSYgGf7ckxsg3IJlsHIFysqyqMqNF8v2k+bcdSqhpgNTHFShCN58Uce1tVzNWz0IuB2fKzyLYudBAJQx/o5eCfjMJFlx0EBmV15SIUbO30q/fiqPa4YKRWqCOOD/p3DoapIk/Dqi4raHfh0HNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oECs7WE6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfCtt+U/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oECs7WE6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfCtt+U/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtTL12887008
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TUcfPg8Tf9XpNRoTHdVDgS
	INxpS92Ay1taGECboM5Ik=; b=oECs7WE6hvbNUsGkWq480sBarF2PxFNlBMURug
	m7tJUUvBDBpoxR48GqFabLK+Zyti4nYEsNjEL47oCITfUW1oU6LsJPRMFZlNUCOy
	Zf2Z41i4ld54va6KSeSyp4PdROyOUjSX3V61UIo4xSHUX8e5NQ1ihy2aVACtyfJG
	35EizBEXWJaGuFgD/O/UZ2fgEpppMN3Zjfmh16sV4yziCPeBHoC0xwMP7OCXtn9c
	78W57Y/6unRJo5b2KX14PvIbmWq/XYreTZqv3fX7METtIkeDckLxgKxlDiCbQE16
	z320r/YGLbtqX0ymg1HKJbuC+CRYtlcJGGrOY0n+zEYHidcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjvc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:08:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce756aa72eso38031915ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784326137; x=1784930937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TUcfPg8Tf9XpNRoTHdVDgSINxpS92Ay1taGECboM5Ik=;
        b=FfCtt+U/1bdYu7r+xgprVC/IDHs8q069z6NR0taHOT0gWvYDwD3BfZl1eSBwAK27Fu
         NdUiFmtEQLN36ljGpWLiRS7YJqtjSq1NkQKycxhp0nXawSkRN5uKH3Mi6VggKII0EB/Z
         sd1mME39hGLWMKL5v44tlTjQiJ1ayF3Im/hGC/ENkJFlNBGsbCcrAZdElfoTeGLMmIsW
         iSOp6u0tTEljcRse08/2VrMvgNDHHaxin2dsQCR0uZS08QL5olwhmdn1S/YRKqJfgk0u
         7yOKujyrJTmYq0F7aGfUdJLhk84O+rRFOz2DdenjdCgUpju1fyj/w5ap9fIcfuWe7RmN
         5SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784326137; x=1784930937;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUcfPg8Tf9XpNRoTHdVDgSINxpS92Ay1taGECboM5Ik=;
        b=NjsyUNQKeFjUePMD+3xd2AFYsfb31YpUkRFn1nB7OXaIzHXiC67MuEc/nVmmnZbRRv
         mQmSTWdc7lIYrUXgncA6O9ey8EWsELc/C1CNSS87Z7F7CWhNDY1K9nTUKFcHTj8DsSHz
         OC//CRmrLb3lewhoJokPNQQ+87B31dckZyoE0kaN2TZw77O0F8FKUt05I3wuMADk9fN+
         56Id1v49bETGqMpvHUKx9PgINuBRetFs9a5xsw0U6WWaiNFacWQsx/29rObjYuMKaDDU
         hMACJgsfm/J3BXF8IGi+LCOOEXWkx/Ria1ezhDHovj1hcnWnYgyFQRa12c00cl3bGKld
         WYCg==
X-Forwarded-Encrypted: i=1; AHgh+RrqmksUyG1MDe5nDBMAOxijzObEEuhQwhb1eDJJl61KLQRs8WRSXgHpQngTizTdfcAowOVF2M5ptpL6B+WF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7RmahfILWQmqvtgsBPBFnAttwIIGkCf3sf9YOiwErOMBNb9UD
	voEbh3rrUTGSh8jy7zoxcfUksXRUPXnlRy76a6kpI9KNDn3r0GQA/PDye0nBdrPA7MpRKYW+sHi
	IbQgwAOwjp382hX0osTn4rvC71WQs0SXrinDBIjDlUYLrupzRPh8fmsbr0L9/L1pWuNfD
X-Gm-Gg: AfdE7cnBF3L5D/vu58MW2/ddm2T1KTzJEuQ0AW6eFqiG/16JQYDwbXSMKqHDq97zO3S
	RdBIlPHhkN5FW07InHnzZVWDWecmpAOUYMYsSuaG6f0xQ8dRSS6fK7Y/najy6otFQQKc1Re7LBA
	rSmJIitrJDKYA34g/h329lHSz5kwde3KaLH9mEpUCK8/NcLgD2bHln5AQyRAKJfh6fZFEGxDLsV
	1LzPkoBF1n6houyybNuoyPdBVGdciJIiVvAv4E/ZOcuJjceFRIazpfqL+I9E0NfttkO4pX/OfLU
	CTeSaLGVGOpIFtwY7/cHA5mccFox+WGShiyZC6tMI8mN48XWQENLE6Gef6sVNv//B0x7rB0PCPP
	LHs/6JlDPRf7osIpdnR0+FXyxTeBe1mBHtpxBAMj151Bhp1Q=
X-Received: by 2002:a17:902:d58a:b0:2ca:d344:7752 with SMTP id d9443c01a7336-2cf34a8e0f8mr43219865ad.8.1784326137104;
        Fri, 17 Jul 2026 15:08:57 -0700 (PDT)
X-Received: by 2002:a17:902:d58a:b0:2ca:d344:7752 with SMTP id d9443c01a7336-2cf34a8e0f8mr43219665ad.8.1784326136659;
        Fri, 17 Jul 2026 15:08:56 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7668667c88.1.2026.07.17.15.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 15:08:56 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH 0/3] Bluetooth: Replace HCI_VENDOR_PKT usages with
 HCI_EV_VENDOR
Date: Fri, 17 Jul 2026 15:08:52 -0700
Message-Id: <20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPSnWmoC/x2MQQqAIBAAvxJ7TlARpb4SEaZr7UVDQQLx70nHY
 ZhpUDATFlinBhkrFUpxgJgncLeNFzLyg0FyqbkRhgV6j4rRp8x0UNwGdQq3CBjBk3HYf7btvX8
 Bsu0UXAAAAA==
X-Change-ID: 20260717-fix_vendor-6f40af4b1c91
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyOSBTYWx0ZWRfX6Pe2IzZB7+eh
 RxiK31cG0yZtYNSpSueu3ZCpxk6eZbeBvZZRaLAWnJgxLCJZZRR5TKiai5Yj/txZxQCTSvAxzIm
 dXzgOVM2unh2Gp8HqonKkYEwZDDSikl1PKjp2myt06QCeXk734MAv6W6hcDr2AuVegNeLXdS+fp
 luhSEN5qEbojhvyZS7TXzqFoD6dkPxxImHD7/cgmEgk6vlvScUpt4ZgM7W2auGcGUo8SSmdy/se
 7s5TuiEbSzWPriQPJJEpTPZm45jwhgE+HUhsG1NbhKN7FVmlJMlV0htuTFeJt2Q4KSilG2gyZJF
 VubhTRKZ8mn3uqrcYe2Gn0HR79SJn5LvaYzTlSmWNGtGlXX7v0XotLipuadIsLfpF3mdXV0JO8/
 i+Q270dLONrcAnREBI5Z+ZptLnr/1Hxh8Lbug+mugzZJ98YpF5NC0x5uPR2jyU7jtjkIfPos8n/
 /PmYNbuK3N5kH0AhyQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyOSBTYWx0ZWRfX+Othe64a4VpW
 1PCE219mW8y7rNQuroZd+kzLpTRInKrN0qKNJTfJ1KsnzJlmMk2+7EEuGiY8A08ShJk3u939WWZ
 Uaq0Loc6zGNkCFUnnT/fhL/5KrEeLes=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5aa7fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CZ8YEtngXVOhdemIcwQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: H9KjqsSdJSnTc3c9w5admxXJxOAW_pcH
X-Proofpoint-ORIG-GUID: H9KjqsSdJSnTc3c9w5admxXJxOAW_pcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170229

The macros below have different meanings even though they share the
same value 0xff:

 HCI_VENDOR_PKT: HCI packet indicator or type
 HCI_EV_VENDOR:  event code of a VSE

several usage of HCI_VENDOR_PKT is wrongly checking an event code.

Fix by using HCI_EV_VENDOR for event code.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Zijun Hu (3):
      Bluetooth: hci_qca: Replace HCI_VENDOR_PKT usage with HCI_EV_VENDOR
      Bluetooth: btusb: QCA: Replace HCI_VENDOR_PKT usages with HCI_EV_VENDOR
      Bluetooth: btusb: Realtek: Replace HCI_VENDOR_PKT usage with HCI_EV_VENDOR

 drivers/bluetooth/btusb.c   | 6 +++---
 drivers/bluetooth/hci_qca.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: bd8bee79e1fa8db2d587733f8b6fd9597b04d6e3
change-id: 20260717-fix_vendor-6f40af4b1c91

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>

