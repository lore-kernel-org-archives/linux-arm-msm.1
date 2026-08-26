Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06C31195B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763827; cv=none; b=tayOD5X+pxisavwsJekZ+Bzluprmw9kNvZ7Dnasn5Eb5EIGmoQqr4jQwlopspIL3ymHwZ59ni5FDBpSxas2E27xYeRgf2ihZ8PMI9CvFMmNF9MRoEysOVU5MHbnF2jb1A1wnM4aZ9JXFgizHcTYPnU8zEGkE2FRaMz8ua0fmzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763827; c=relaxed/simple;
	bh=iRMieqTLpzSimePtFDUM7IYXtNUy6nl19l5tmntBsn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nr6e60I6ptnMgLXfK/hc3fUqtEjaMwFO0DHwKSrRDgmJN6JqCaw6Y0/JmoXylrRZbFbgKIhLBa8RfRAZWydO/eHdxLhcZI+xwbEpXzY1UOCk7uZ+rS8XRMMUSiAD7rzozSHIdYCibB2h/6VT2E0yYm+X8NkpcroU91rWhGGuC/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1rUq9sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSp0i27d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1rUq9sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSp0i27d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuqKw990690
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LmNdSIC3rzSREG9XYk3I/s
	eFKqFe5W7iVUlByjfc2Dw=; b=j1rUq9snaiDIcZ6SEq9t2TXHxtklK1pG8UhQob
	2UhM0tvdZrziTJ5arh3qGxCfH8oSDzYB/NFFF60yBHSlnFk19CwvDSMMD+GilijR
	4xgZXCaYrsvE/lZ9dM9vPDy7fpgxXuyyihjNoXQy5d4s93wcVGLnbw2aJ8v3jMNo
	wsRz9urpM7g7wVUUm3NyEqzixjaEzIDf2O/Y+TNs/os1aNjctsaVvL+Tbup6IQ0N
	x6dylSdEVLj+xNpjNmLJZb9+NXYoI1OHoRWOoRtMGDfp8rnY+8yX4pB7mDoJ92zC
	qxniy484VPWps9AnsimkpmX537ZTnBSVnAbs/X3LTyamMQ4A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9gaw51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so24105365ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763797; x=1788368597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LmNdSIC3rzSREG9XYk3I/seFKqFe5W7iVUlByjfc2Dw=;
        b=FSp0i27dAtnrl1UYb6hVj/O9XcJi9LyzVo8MCtvBLWrhNwDWE2rUiNDEq/KOlT5D92
         wdFqApxNyfZ8MHmUPyDe+gt17WWfzIfRA1zL6q48tT8G6SDulqQAQfJoCHy4SM+LaGvj
         m2vMubk4kQp/89KEppYk6tLfit8+HqWcydTldmN7mp0dbXnWxcMNyeJ9E4tNy+LYSvKI
         9GY1qOCx3hiLMq4rbQIKLgv3qiyuJdW5844gVILDgOwAp7+QBI8TCiTT7/50HwSdu2wa
         /Vgza0YIo8DtYkIGAcwekg7gwtNyh8kEzcG0A7Vik9kSC7vB6/xWl7Xo1c3/GQEMXDf1
         EJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763797; x=1788368597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmNdSIC3rzSREG9XYk3I/seFKqFe5W7iVUlByjfc2Dw=;
        b=l/3IjmQ8ARQ6NhEWBpTEJBXaQNGkOQ9jqHqRpanFBIh8nqFVdW3Lz7GKU2+PmLNQOI
         VRu4bZTdztg/uxODbg4d7kK5Y/fVxeZlxS+gDA9Y7TyOQcrPNm8TQudLaMy2uhsFvQwZ
         snASvHZC+rgnbzkLccJKWP7pLd5S0A4UNs/exyP+jSCq8g/Oiczy/lf1kx+Wn9AvPkYE
         WwtSlukbGn0v1C0jLidf3AnRkNvdfxzjfOgNwEPB5ru8nEthmF42Frb4g2eRHLQBof6n
         Ihb9Hsuge/THyzP4zzd+GuJkypjQKWdTV0tYh/NuQ86G9ajdOdi2A4Uku4khPbBIddDD
         6Eww==
X-Forwarded-Encrypted: i=1; AHgh+RrwlMNdJwzWs72YUBQDc1lqSTJUSSM1/YQcZsQAmGd6NXR5t3n2pk0B2hgZm9350QNfBMMoUnmZBA4VB6Kf@vger.kernel.org
X-Gm-Message-State: AFuF++k1Ym9EvGjYmhU7oq2CmCG+oBD8zvg1CkaHSFQZoOlnWXKG9FBp
	UMXCYv47jX2dNJ534GTu9vrGS0CQvipMWebgc3X2hMHt7BQy/LmMn+pp6HsS6VdlEUP05bebshT
	l6R0aJuAlGbRxxZVkiYjj/aqmzGrpLrFSz8W4u1E8OKiAPkHIFSUHeiI9VsePQMzvDry5
X-Gm-Gg: AR+sD11uentWvFhjLiqCTJADk5XefSFlQBflZB7BTh8ZUQcsENtKK/Vmrvha3W5anDp
	eOf2z1C7lltdsG/+NrlFQwJ2bAlpbjIEU7uUnPTCgaDaxUxNVM56Jd5avObvxSc2nPkW9/Jff8T
	lT2uMHFwo9F7EyymGkGB1H4ijwTF+nUZvm/TspYj+UN95YsD32PJfBL3cU/48Cg5olMl4fSuenT
	FgfYevA3hK7BaflWxI90Z7qvMBGPpd3r1lVPUwoJApQ0PMN0ePXMJot6WTIe7+Y9eHvhsia1qAK
	NIFcDT+7ZQFjsZlV/64rf9XULmLZdPd9h+B3B01SQ08M5T4iJ0HSD61wW0moylBmNJJ/lm8ywPo
	lxik8bhAG1T2lxB1FSr/E102Add5HESvaLWpYqt05yk9M+QZUwKAJl1oa3Vd/Gp9Sc4flVA==
X-Received: by 2002:a17:903:32c9:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d7079eb7e9mr147013095ad.4.1787763796675;
        Wed, 26 Aug 2026 10:03:16 -0700 (PDT)
X-Received: by 2002:a17:903:32c9:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d7079eb7e9mr147011215ad.4.1787763795999;
        Wed, 26 Aug 2026 10:03:15 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Wed, 26 Aug 2026 22:32:50 +0530
Message-Id: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADocj2oC/yXMQQ6CQAxG4auQrm0CDUyMVzEuHPzRuhhJO0NIC
 Hd3xOW3eG8jhymcLs1GhkVdP6kinBoaX/f0BOujmqSV0J5lYBSPwpoyzMqceQk8SAT6KH0nHdV
 wNky6HtPr7W8v8Y0x/0607185v8h0dgAAAA==
X-Change-ID: 20260825-eusb2-interrupt-v6-52bee4b24121
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=3052;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=iRMieqTLpzSimePtFDUM7IYXtNUy6nl19l5tmntBsn4=;
 b=8Hi4lnh+nhaU79Mve1F6xuAiE8FRDM3Pl+datid4o4gWdyBZ7IBa2TC2v8D88KUqqgVqCJZ1y
 xkQA4nXpFsPA90gB99x/0WHHlpaKcPLf9VQEBfW0iMvXn4WYU5qehdr
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: D5eTZgvroobCTissJLmnOba-Yje0wCTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfXwcXCZHvhoDjG
 4xGqZSRgqxcrbaH+ItM3xaJ7Jqjg2KC8WKwixo+Z+uq0YcIhcfYhglzZh3HKq9716kWoDb/LkGL
 4eMxswCFsXfaGzMGkVi64/Vhr7ABekG/3j9pNBWmZZ0KGmgBbpM8n2+dDMahh2qJxksDPuFefSr
 +n7ccRLVatmUwcw616a90+B7RKx/HNzxLZovYCkRWBRquQ2X0BDEK4RfasoPKN34rryka00w3Kc
 mOlo/TiyKDsDXompcvE8+1O+Wl/AJQUigGmobifwkVdzWlfIqBcmlSLSK8RRPrISctLyL6ksxPn
 3rB5UJLVq6e3pmp5z6G2ucI1Uhtxp7ndQy9FZSdDdS6om1D/iEzC8lCDKLIXgo9JoUpmBDVrMju
 3qaV1P35hha17Y/Q671miZFUG/Bo06R4t547ybEgh2Mh1IFqCWQVsbx7ZslD5JEDr0lwg9CI04U
 iLkArRn+LEEk9j3m9mA==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8f1c55 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xjCIpWma6R3UThYtaJkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX9YTLblown9p9
 qWXCc2ZUw2Wccnew7G1idsNa56fy5dMu/6erpxImYd35diSX5DKC2wLpc46q+1meoYjaJzXtYQi
 qGbSwdD6RWdACxkxG5lQvOUa3SV1KC0=
X-Proofpoint-ORIG-GUID: D5eTZgvroobCTissJLmnOba-Yje0wCTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Add support for a new phy "type" attribute to be set by eusb2 phy drivers
and be read by consumers (in this case usb controller) and act accordingly

Changes in v6:
- Update commit messages to reflect why new EUSB2 phy type is added
- Update phy reading via index rather than by name
- Remove redundant header files in phy driver changes

Link to v5:
https://lore.kernel.org/all/20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com/

Changes in v5:
- Add support for phy "type" attribute and set it from m31 and snps eusb2
phy probes.
- Removed adding a new binding property

Link to v4:
https://lore.kernel.org/all/20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com/

Changes in v4:
- Moved to using binding approach as suggested by Thinh

Link to v3:
https://lore.kernel.org/all/20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
      include: linux: phy: Add phy attribute "type" and associated helpers
      phy: snps-eusb2: Set phy type to EUSB2
      phy: qcom: m31-eusb2: Set phy type to EUSB2
      usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

 drivers/phy/phy-snps-eusb2.c              |  2 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c |  2 +
 drivers/usb/dwc3/dwc3-qcom.c              | 63 +++++++++++++++++++++++--------
 include/dt-bindings/phy/phy.h             |  1 +
 include/linux/phy/phy.h                   | 27 +++++++++++++
 5 files changed, 80 insertions(+), 15 deletions(-)
---
base-commit: ba8376e8c76c6512c98949dffbf4ded0b782a365
change-id: 20260825-eusb2-interrupt-v6-52bee4b24121

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

