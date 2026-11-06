Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953646;
	b=CDX3ZcHYcrnB0NccWH6pCKcYUqBA+9ZOFXW7jseMssyaofI3UnQh57B9Gs6B2S/g/SKU
	 nF/UEdjqtfGkyjMBZEGf+QE3NNuCxVTClydU9B/QQuiFyHLBy+bKNRYhsQgzCliR8GqWy
	 Wy+Qzaqv3y5KjErZHLqLGeFE6XwexKlYrGNHOT32SiIADezd4DXG/EWE53WNpkLEu6sTA
	 vL25a7RtroxcDBg5fL4D94VN4SB13D9M06xnVMofLNFMEULrMY1GCs41YNUG6kS9ms/Ub
	 uCj02S0vGkp1VCZ636PKnVF1vkwUFX91dsUqcYndc0WiaJ5iSUklc7S+cF7OIQS6LvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
	b=RJji6nTUPRtGNjTW0MCKg4M12yKCvmCiODT5rv06EwCrIMTFa1tgwoo7QY+/nbg6hcDD
	 Bh7vFOM4QyLtV0IrJO2CRYh9R39EBv7HI485dZvHGpY5fhcz60O/S69D9VqSEE50muhnj
	 KF9zhrXS0MuZBtqWMLkWxJCoUDbnNYbo5d1y36wa9aESlTfVZh6kYaKVnFMe08UKceZub
	 RYxNsGqatUN2mP9I0a2Tzdd+GEx6lWGtWuOK0oJYT5R/UYongTvq6ty/TRfyYswlPBHGi
	 WXtLGfMUakGQ21OWmwsVahdND6/y+0wxwMwzym/34A8sTJnDrdwb7RaNEPYwo+1fu0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VAzK8f/P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cMyszcda;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FCE606D806
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FCE606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAzK8f/P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cMyszcda
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9rB2333863
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwX
	j1Fjk21E=; b=VAzK8f/PU6/PwE6Sv5E6eILvFl//DgpBsZ43k45z4PJsbk3U49m
	Pp5H/fqHTAFEahXIRqhtpm97p6IjB5YyJDyAH2I1HviPoNpRfqRDlllZ3Vunc063
	aoMCJzqpUsdsIMjAHgYEwbNTfAUFOpAK1G27JjbGcsNmok+mj9QXJSTfJ9zaDxKw
	j164fGMhDakTJ5NvgMwhk2ojwklk+DwRoB4Yy/yWVdhcBEUtUfCbdPVMbl0CbAMh
	QgDZ/5tYLYQ9SQn5xw4prsVB/SVlarEsknG+cTyAlha1Kgbgukb3lEop24ztdnyO
	sK3i3aKz6yGaPhFd/t6qKD7HiwsZqYjd2ZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p99xmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:27:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso689730a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953644; x=1794558444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
        b=cMyszcdavbObhSkmu5xcIPuPPkjDQtdpPRwcJ+NORHttlTxWazR+tOFYn9ejafFRxq
         A7b2d4jKGkXrWzfzjOT1fBDGGRW7PhIq2XLCrVDlB7wmeSPqAVMrDQQT57Sfe8g8egNJ
         sAILYGMROKwcLzIwMpjMVgCiET8z/SJVS4MjbziVLWVPx/3jH75QpafrOK+5WfTJbKaY
         AKFWrNgbFUDe5WvExhzAQZ21FHfyiB+IVPaASNfUdRl1W7nWWcUbNhlwjxL4TAq0ff4P
         0QvhcTwvh/VDY3zgWYWXS0RCo6vNzJOFfNqhcz0TQ0byv1LG53sGIQeu40mW9Hg0WXiH
         jqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953644; x=1794558444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fi22M5AWeWKIqAQK7fYG+4+YJmJtfLKtzwXj1Fjk21E=;
        b=YDIqA8UJO8b3RzJfIF2nwrhUOl8gNDA8LehEuCBlZalK7WC49sYqs2SG0Hnq4N5b9Q
         8AUIMR4wLQbnKKZ9ZxSUPC8PiYrkNGWLX2On9uf6y27eowcaw5qiWEMeBHB7NLMb2mvJ
         kqVKkpm70A5q/XoVf0yRlmtNNDD8DV6zLorSvHr1ztcff4TjtVzjCgn2i/RkyK1dqdWe
         5RqbBNGdEnZxtcU06H7wgO8OvWQJ6/qefgFpwV7qpA9xLRrfuiYtzU1TOGtz9bBFf5JK
         texmUkqeUWsiOEHYOx0Prn6si6XNu71EkBYa3tzv3au7Quyd6Ab4cAASog9B9nPFjIZd
         Fpbg==
X-Forwarded-Encrypted: i=1; AL+hErGoY2WcyM6stsTTfA9BgeEzlUW1lbCdFUf8kImwM2Me4Ttmej26cPrauiQw1KlJ3HX/0A+wQUt+jPERSHrA@vger.kernel.org
X-Gm-Message-State: APuU4Z9DqTcws1im/3iA3u2CUAXOje6nWrSr5FnBGEDvDC+MA29+2JFu
	xmPdpsvmAZsSpOKEmL3+hxyovGR3HS61jznOc8tTU5jxuyPug0w0CxBYPToqfRZ2X+spvBtShY/
	dRaQ8jw9/EcR5vohQJKx/SNURx1ZrOjC6A3J6BJXpj4kL126oltBu9OHwOn/l//EO9YZm
X-Gm-Gg: AYBFou2frA7nSexpFbidPFgKx8pcN4rIxJzxZsaoZLF/MLy0a394mrB9A+gr33HU4fb
	u2t3vqex6rplKcJogt04Qr98jfvAXRgOgcvQNjAaSgnzcloM5PREQxVWq0JgiykWmAcNrVd6OEf
	Z8UA8liLT8j23t2bXdfLdMsV2YqX2GtH57T0ulKRR/8aGoKd4R/sF6FIq7DkudzjdvkESPN/6Gz
	UgdCG6CppHJrBKjoJyuZRiT+0f6hzcg30Ji6LGv8W0D1SKe4MOCZijs2EeQTbMxjDVexBayMgOH
	D9ggsLc63cdcoHoD3aGB/fnZXcXA6bhIBJzd3FBdpYqEKLycHWLCz4RhhDMAwoUHdDN/jJz6NV1
	RGkMAZ0rQuYDbZxlw4DmZHxXGwa0fHCffd7UA1iUiAcNEsC9y975rbNUAtBz8kuqIkFYa2jd3Zw
	HcxQ==
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr1738387a91.25.1793953644460;
        Fri, 06 Nov 2026 00:27:24 -0800 (PST)
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr1738351a91.25.1793953643921;
        Fri, 06 Nov 2026 00:27:23 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:23 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 0/3] phy: qcom: carry live SS-link state without growing enum phy_mode
Date: Fri,  6 Nov 2026 13:57:13 +0530
Message-ID: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WjSsW_yICYcQxp4XeuZzKjPZWtW33wW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+JrFQPRWbVjt
 O7FCckPDGMYBxQICp9p85qdqAvQISmKh3B0wfXVkIlWY7lI0BTZghdbsYhkWpTdidS/7BchUaTH
 VBYbxW4Be7q3Eq8d5s4n+8UB/U+CExeLwL+5HaK3gHNENG5WBZwVf2eJDJdESEoDdYzsmUXXLgb
 OQKDt8KxQc4t5eQCjuNuNbaZjfEoXqxeXfSX7Zu+gBP2RY0CYugwhz6EzvamNFqYqzhrkHXq4Ib
 VJ7e/ocxBxkGPtHAD+1/LWwcxyYLRwyCFN/vIdijgJL2ef4gBFAu+0oWqhxWtKM68cjOgR/BklO
 nVVkDmzfXETx0LtDCfig/nEPixPJOM4WZAjdMsQrVghmDOUCaY9xmdY8WzjqiOX8AWHvN1xUKpF
 VrKqBB2Iem8TSvfM4bgZvmHfPoq0k/Vo8cWknNbhQPy73Wf2ChBg9FMUazWuNFqNZC6nAjEkoGj
 j39Ntk35zvsLCihuBCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXxJ7lhjdYwdY3
 ZCqEwwIQ/kgDjUsoeVdAVVd0zOBb6BRGnKw0gdMcs5JRKNdQ9a2qefppcmv170DScCJdHDj1RRP
 qcftuXLGQLSUM2LYJKw45ZMtps1vE/k=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed8f6d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=rQF6O0ERi8bj5yKtaRIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: WjSsW_yICYcQxp4XeuZzKjPZWtW33wW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
when a SuperSpeed link is present; otherwise they fall back to
receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
made by comparing phy_mode against
PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
calls phy_set_mode()/phy_set_mode_ext() with the base
PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
submodes. As a result, the comparison is always false and the PHY
always falls back to ARCVR_DTCT_EVENT_SEL, the legacy USB2
receiver-detect path, regardless of actual link state.

Add a dedicated qcom_usb_ss_state submode and carry it through the
generic submode argument phy_set_mode_ext() already defines for this
purpose, instead of adding more values to the already-overloaded
phy_mode USB host/device submode list.

Patch 1 adds the shared enum qcom_usb_ss_state (UNKNOWN/PRESENT/
ABSENT) as the submode contract. Patch 2 makes
phy-qcom-qmp-combo.c switch on it instead of on phy_mode. Patch 3
makes dwc3-qcom.c sample live SuperSpeed child-device presence at
suspend entry and pass it down.

The contract is intentionally generic so phy-qcom-qmp-usb.c can adopt
it the same way for the gadget-side case in a follow-up series,
without a second mechanism.

Tested on an x1e80100 CRD. On a host port with a SuperSpeed hub
attached, suspended the system and then connected a SuperSpeed USB
pendrive to the hub; confirmed ALFPS_DTCT_EN is set instead of the
legacy ARCVR_DTCT_EVENT_SEL mask. Repeated the same sequence on the
USB-OTG capable port with the same result. As a cross-check, repeated
both suspend scenarios with a High-Speed-only pendrive attached, and
again with nothing attached, and confirmed the PHY falls back to
ARCVR_DTCT_EVENT_SEL in both cases, as expected when no SuperSpeed
device is present.

This series spans both the generic PHY framework tree and the USB/DWC3
tree: patch 1 adds a new header, patch 2 depends on patch 1 and touches
drivers/phy/qualcomm/, patch 3 depends on patches 1-2 and touches
drivers/usb/dwc3/. All three should be merged in order and ideally
through the same tree (or with an immutable branch) to avoid a window
where dwc3-qcom.c references a submode phy-qcom-qmp-combo.c doesn't
yet switch on. ARM/QUALCOMM MAILING LIST (linux-arm-msm@vger.kernel.org)
is Cc'd on all three patches since it covers both directories.

Tapas Rana (3):
  phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
  phy: qcom: qmp-combo: Select LFPS detect only when SS link is
    confirmed present
  usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 +++++++++++++++--
 drivers/usb/dwc3/dwc3-qcom.c              | 36 ++++++++++++++++++++++-
 include/linux/phy/phy-qcom-qmp-usb-ss.h   | 17 +++++++++++
 3 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h

-- 
2.43.0

