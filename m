Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563359;
	b=naMqCBF9pbfty3/P7JfhXsn7Hvp+yXHLOBqOQDGBkKIlL1RW8L8TcjsTRTmddxqEmRCZ
	 7fkoxl7y66JwfAUvayU3406uLeCV9devp/5k+EwYPWm56vD6MkKASqtY0GWZ5u/AqABae
	 kWDYh1/D3CPa8HSOPMSvnDgK5RaI+bmMVpj8b02yE4FnAJQHq/oMyXdPqEiDkgS9stOeL
	 tKZ2+A4NGaobBzuYFo7dlu3i6oIkfCP4F03ixC2BqReSwUWd2vkpEwf6AtFUZE/sXDgci
	 4h9zuGN9rx9XrrAIgQZVz/QwS+XctwZfz/m6RPUCIDvlWB4SegXzuubq7oyvESx9y8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7P3j+H8hHPpSBQ/nouk3NNH8J4RFZW7ZLOXVVsbRkPo=;
	b=Dzi7zNq3ww1GmniB2lM36067Oq/WsUJaFLI5do45aVcsqwpB4aKt64KRRVFJ72P4b8P3
	 70bRVqlRRr5VAXRx1/te+nq6Ndr+ndRcZnUF0anUeiy4vFMjD/BU1s+UK5606N9ysBgOq
	 vmNdVIowBxVHrXHCQsnY5mFixnOJ3wd6F6Lf1SghBopsuctMyIQ20F7A3mJ9q6tIRH9tZ
	 3dG0fzX9vp60XZ28Flrf42iMT3sBE2lwZP/sVyLOK2XT49u7M4SpSXeL+wVhVYxgWQdjf
	 qE58IIl0EUp+3eepYTBWsU2J+He13ije/C1pORmkomIpluDGfe5+YVnSV119iKclmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QZLv1sw+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI0g6GjO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132C606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 20:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9132C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QZLv1sw+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI0g6GjO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQPuQ1100161
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 20:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7P3j+H8hHPpSBQ/nouk3NN
	H8J4RFZW7ZLOXVVsbRkPo=; b=QZLv1sw+f7eRn5dmViLQOx3AqOcxHnfG3ZC5w2
	CjQTrPsro2FE0U58N1lTiKDHyjh38v+vYta0YBd4nyNr/Mtm1bnZdMMc6KKAnP99
	mmvMSfrgUX/k3X/RsEJHzTRxjSFQeaGkuET9oaAzeJGi+v6HSqx8DWjsJ0KU7MGn
	VQBeSh5dp6MBT7OSL7g7p4mFjK5klu/gl167AtKwZHK/T4BUJC+E4K0nqiu8i2Wz
	5Eei5G3j87Pk0cL75Gw1Ewi/A2Y8LV4wA4eowo6hMGuvlGTOxWy7Xh5vZ60hd/Pn
	HDNHrnG/KAoqHvbMGpuhfPq8xCZniTD5+vpXwOO2ddWUN+qA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfv71r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 20:02:37 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a88d53c7a6so40976097b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 12:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563357; x=1794168157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7P3j+H8hHPpSBQ/nouk3NNH8J4RFZW7ZLOXVVsbRkPo=;
        b=YI0g6GjO4HpHU+Y+kuVyjdhVWGuycCDPbRVdIWEwcUT9qgfw2vqHeA0FvUNPFjp1x2
         bl3BK+sdhD/+kGpER0T4EQNdgWcp0ARo5ItFPDGzVWsG7bD8CZvGMg/MutxScZJWVLw+
         y6LwE57KQgk2etUZUFABLKag0B8DirIj4mjHOz12xSWDz4gueQRvsoIDdIqOrDwvu91W
         exasPnTQSk+jgp/3LLxSwhk6F5MWwqSE8VQLz1PedgC7le7fYrViLjDzkfZp+nwkJkb/
         dd4lgG1MkB1+n5jYf3SIKD5rVJug6ZDh4VTXv+cuHSPHQcopFAf/wU8KRrYkeJDyDATm
         TUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563357; x=1794168157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7P3j+H8hHPpSBQ/nouk3NNH8J4RFZW7ZLOXVVsbRkPo=;
        b=PH8gcDq1WbhGegsoDCWv7dBA5BLIkteJQXc8TmRzT1Qr7ETiwteeokymjZqERM8Pmu
         UccwQlXP7vH2eFdOUQlfWUafql7JUvljrN/W4sAAmCk+TcKwYwp2KNQf+qKRXJLI3RCi
         gOtxD5MvE8wiidJP3OsT6ibOJzBvUdSSHiOSVhbUFOnZwPxOWMikPhZVVWBdUj3Dq3R1
         Bnzt/rHBf9h4in7jk0nLX6JlUIGHYBjMg973N3u/v+AVwFpZexdKRX7cuQdE7SdZTXrc
         dblx7AabNzn/YHfHuasciUKJ5WBYFSe48WIDW2oLh5Pe2JNCFf3TZ++6c4atpQxJjAV9
         1TZg==
X-Gm-Message-State: APuU4Z8uwbo2xM8Qb87M9dvHQZklhqDxzXoMAKSRbAM+faIfyVCyKFas
	wFpCTQRavhfI/u6LZI7Jg/uU5acI6uFatkJCEVP/9VCPssz1DMdLulc0pxJVEywCtr1cd/PWcrQ
	XNz0COPh89MyFmDZu8XUbwxyYY1WbGduKN2kAOz5fu12Con+0yGu26VYPhO72GSb8UJ6L
X-Gm-Gg: AYBFou0O+bFSF/u/7L/lVXSQCipMKDKtzHK2ncz2k8zYOmqQFLdAnjJngKTDx33uyzo
	fLag7lVbMVC1r7Et4sh22RHLU47SBvw+U5usxwm0N51Zr/SPfhCiHz1I0lcFImhFnCf5lBx2cvF
	OPABj3lKM49Khwh6fGfW+ZaOFTY8VNuYfSnFHItv7cTdKBVYCjG6Fz0gTTUJktZAlm9I3exvGWR
	GolNg1NM1GyVVZ1qRZcgAQayNupog4ma2yi4Gb905fS2Tltt6gyeYrFilu1j3XV5ccmbakei32F
	283wUlQGQ+aT5njBhvNQvKKkzR6QwpBOMKB4nqKEYto7sQ/ac7Dd5dDeDZzljcvMtdFDzZ46lwH
	ggPR5XaAu+rxa/1TL6WO+tgOFdLt8ORuNVluELseA1tnIVd15koUC65MZ6G8NibjdSA==
X-Received: by 2002:a05:690c:c50d:b0:8b0:e13c:284d with SMTP id 00721157ae682-8b2b671bd3cmr42732147b3.49.1793563356787;
        Sun, 01 Nov 2026 12:02:36 -0800 (PST)
X-Received: by 2002:a05:690c:c50d:b0:8b0:e13c:284d with SMTP id 00721157ae682-8b2b671bd3cmr42732077b3.49.1793563356352;
        Sun, 01 Nov 2026 12:02:36 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:35 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun, 01 Nov 2026 12:02:33 -0800
Message-Id: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANma52oC/yXMQQqDMBBA0avIrB2IQ7ToVcRFjWMzLSaSWCkE7
 96oy7f4P0HkIByhKxIE3iWKdxlUFmDs070YZcoGUtRUimq0K/rFyej9B3fC9qFYU6uM1jXkaA0
 8y+8a9sPt+B3fbLbzAsfxBxcjjGRyAAAA
X-Change-ID: 20261025-hp-omnibook-v2-970e4290c445
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX2VGg8Ak9fR1d
 WMwTx6gqRpECJlx7FKWipov06UxCtZdCsMBbgO6oiWEL0fdjlN+D1ptUfJI5k3WbDYxPKkyz4xV
 EsBLF3825bGHEJmvyVk/D2eOUNnkVvU=
X-Proofpoint-GUID: Y8l1dPY6XLIXnx0rpgBX2-Y1eiTgpOg7
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae79add cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zEFAF26_c48A0c_HBRkA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: Y8l1dPY6XLIXnx0rpgBX2-Y1eiTgpOg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX1hJJ9bg2m5S+
 j1kLdR6FAxfrtcIm1oQ7iFUZUN0CZKdu04bucUw7Sx0H6DI2Ytta2v7pIiE89cITrJ0t1MVGef5
 QyO5j+uPfTMLEkmUA3PpfBYhtXOHVQbqfLyPInj9PQDZOX1xknQ82E8P8nR1KiG0tYSpUSvByGo
 OVb4amanj733fPuOrM8AbDp2a3JGBX1qQUIfbEw3YKsNsuIYb+MZ2CBwj9UJzdx/I538BNUrb2k
 qY/00qKwzsXgkMiJE5twuX331eP/gRO97kA3biYmmlDEpAkym9xwfW4NqZh9DFCXubjIfraH46T
 F1MOiqnC25uLGZwEFyEBgubS92aEj9dsd1RElc/PU7r7FeCjcQQ1tk3OAUDEhweXa28HRbuG9Jx
 vKCNtAjA/FQQXl00WwA9SieyPkBsM4ikxqNr7vMxoHRmfufJAMXr5f9HNZUpNc6UVE+gSXZYcQd
 n+UFl+KhIRBh1MPejwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

This series adds device tree support for the HP OmniBook Ultra 14"
Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2
Elite (Glymur) laptop.

Working on this laptop with this series applied:
  - Internal eDP panel (2880 x 1800)
  - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
  - NVMe SSD on PCIe (pcie3b)
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - ADSP and CDSP
  - 5MP USB RGB Camera + IR Camera

The device tree builds and boots on its own. USB-C DisplayPort output,
including over retimer/HDMI dongles, additionally needs the qmp-combo
DisplayPort PHY update series for glymur (not part of this series):

  https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v2:
  - Rebased onto next-20261030.
  - Addressed comments from reviewers on v1
  - gave sound card its own model name
  - dropped redundant items already enabled in glymur.dtsi
  - annotated gpio-reserved-ranges
  - Link to v1: https://lore.kernel.org/all/20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com/

---
Jason Pettit (3):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx
      arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
      firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx to QSEECOM allowlist

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 986 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 989 insertions(+)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261025-hp-omnibook-v2-970e4290c445

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

