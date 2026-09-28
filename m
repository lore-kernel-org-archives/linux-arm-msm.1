Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A34DDB37
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607102; cv=none; b=SJOCK32bckbh+dJf6mytRCcJ+ab+L0Oy9slCb8/1MA4e/iY6ce5xncDc3LbtaP32L14/V2ICsLR7JZN0MWMYCuND6HLZqI+WCksNOtc6jT+fgZ5WEGwGQAtGfxrDi7x7ZaoXwyncp37d7qhM5SREowISraxQKEqO9L8neYhaKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607102; c=relaxed/simple;
	bh=KTd2cyxGDFb6Ywz/ZP9Ug5LgVHty9vgzA0ysOJgFOFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJBH9gcJTraKfZn15CoXAk/D1tXaZdguO3JfPdmn6Bd0D9pYfuD6Gd2gg3V2QHmrZO5zbSR2aHtAcTMtZyr3REiezNw2E6WgETX/8fZQziUPFfGLpvy5b+tRFZhowFJb+2IakFtYFx4SlSP2SYHqVYVOqZOoGZiajV+6p63uJmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5QNXn8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvHa1aNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5QNXn8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvHa1aNl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe0e62143049
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=53CsVaJzTItyU/Vs3m89Ymy9Gi+nZqgsQuW
	6jskAqkA=; b=V5QNXn8P7gC4V8kohAGiKmwO5tha6jV+bq1gFLu/SIeXa+txmvj
	8oVgFSQKqozpb6zZEULpR6osY0VUFBG9e5yTSRQ4IMDUt6dALG8WGCFbEEUZmqZZ
	cpsFVAJG0TByYAXJhK05jOVLtLgx8OSYMcc5UMee+Yj/JkS5r7PYGYzHVJozL2Oj
	0JvEzAIuXzEImbC1ycn2NeoC2Md0+BKNuLK6HeaxmIU7e8Ow+eVJUWGgKrjT80b9
	X1zw/GHjyoaL2y0i2smo8TfJ1eFAYnQvPCwYa9NR7UFrstMI7nWNzc3Io+dXYV9N
	Fl+oOck2I1TTniMtlrGn6Xls+528CxU2Sbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfks7ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:51:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b4085d29d6so171563137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607099; x=1791211899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=53CsVaJzTItyU/Vs3m89Ymy9Gi+nZqgsQuW6jskAqkA=;
        b=NvHa1aNlwpaX6DjT9I+26zxjDEialyxP4YDSqT8Ua29sAWymsphhZhAfZKR3e/RCd1
         j08McunppD6xkVbY0UmXolbd/QaH1ZpRLnBhyY/wxeDDlSDny9742+EbIvOEPTDMo2GX
         9V5PzEprLq8VMpGFBGKf8wAWzMxotjAHXxELpXHR2hMzSjx6QfFT5gmcxwF7ODMWc5Fb
         cahYWJPSAik6G3/+ccwbEhD9o8NVrREvrDxkXVfOVCdnYVJA9nAxFaESIUlvRgNZzDsV
         OyD9TYtYSK/7MK5qPn8pAHoTKwEXDRV37Xe21uuMnMVxcJfhhUoii+xDNfjkb2wgwgba
         hz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607099; x=1791211899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53CsVaJzTItyU/Vs3m89Ymy9Gi+nZqgsQuW6jskAqkA=;
        b=DwsuYq5IS8PR6o5snHlukBtiby0TpaZcxZr0Wsned7lAMuEutHb1lVj2BI0SNyxUBE
         2VavNNm1slg97Xb5HNdlYiIJHHmjjv5LLBKvJQoKwfHWEvX3nOFOHMHDWnw988oCvcNf
         8zJ3UoMkiWbxhBqOcVewD3Y3EOt+soOSo75N7BMaA2xbxx5cBwCsdaqNvSr+rS7UFGup
         obpQKdAd8neUAL9asIEYy1Ibp+OJhVlWLBSGxF2y7+aOLKujQAuyvbN4Y/3IChC5iu2V
         QvN1p/0rPs6pnRGERX9VH4eI6sE1Tb3J4eTIgFcEQ/H3EldirwSPmlOarDklPu+sYw+k
         nYvg==
X-Forwarded-Encrypted: i=1; AKwUvBwmXrN4ErDdCWyiOxGS2ei1yGUPN3fg8i3axhclv3xByEUHffn7do8h7qeXaTNqOu/ITQ/797jgcM6wFnvg@vger.kernel.org
X-Gm-Message-State: AFq9FYIuBWZm4L0Qi3QUNjU06m0S513WuTpZpKadKER7Rat4k6qDfFoO
	7CX2xGmiFuSglmtrPjZ/ElZuYCw8kbseTubv2Ec91hzoHD1EF+WhAsNDsUJRZa3w2ve/dEYoYTB
	v6Nl0OFFF0qpDxHJQ2CsvMnDuamj9eVqYHbIYUFM18VNHlSXFJzLCiPCUw3v8zN/zt1dC
X-Gm-Gg: AYBFou32jUalrvcQqF1kPAsFo1iaLbdHRry7JgIeKLjpCl5ZI3L+xY/Y87hHG/f+iZd
	gDbM9oizVab1VphlSEY7t7W7QIOP4ja94KWyLRVTs0zZ1Cmy2puspGkvhc7S7I2MGryJtvtfmb3
	a5jw997M+/zKg0QGbUrxy6JrTtcTQPKaY8nhj4k8nr1yGfA+HBG8PFIVvWyU6Ba5rzx8AA1zKKK
	lt5BosIMPmLEdyCOGhLhNy9KvGHIi6P97wNkVBNElAETjf5cijI9cpDmJ0p924H6hNUkNAmVoQp
	cNJc/67Rwvmst8qrAuqn01/zulIKbhrFj5oICKdwi4Ru91rISLeHrmoYPvbfoTfzL8dB2swya+j
	tiz0w1pUHu8XX
X-Received: by 2002:a05:6102:5613:b0:7a1:f9df:e35a with SMTP id ada2fe7eead31-7af1e0f0518mr4040599137.33.1790607098877;
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5613:b0:7a1:f9df:e35a with SMTP id ada2fe7eead31-7af1e0f0518mr4040575137.33.1790607098030;
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm42777315e9.0.2026.09.28.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:51:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Mon, 28 Sep 2026 15:51:19 +0100
Message-ID: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfXywPWPnJRmANP
 yNDu1UvjFSFi053IJaAgX+o9VSvGSOEbPSU+nUNyXHYmMwGzmw8NGEaR7Mw764ESVxPA5xcKDwZ
 jCY4eJPOvFwhZvi23H+QDxXtGRGAtnmi+ek47j6+8FjugoddilbjSEio3GY3ySPR0Hn20WWP0ip
 UeHPrI0F7H/YnMtBjhJudSNJwa605gq1wnO2OKmMDZzeZRmlbksVWpm04r3HUa+u5s/f7F2xfZR
 fO2zzBt91iFP5BNJ8Epa7uy/8p50N6xSQxH3R6BnH9J6vqNhydqpL/+ZA2dv5pYw4uuBQRBgUrz
 l8lgRQMjgv/pQBxdD0N1Q3mV5qO8ndL4Q3nO3vLyKQlYvhjHKlRXqM1NdBJckJgGAWTEMq9uat1
 4g7wKrfDMwsByOA+Y6KHJI1jKgGe/e9kyzoU3+QUmc3NzyCD6OK4cvNGF+HnRywx3mnvkNxMP9b
 oL2/oX3o0FoBq+VZkyg==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba7efb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ON70hpHyYZ8ZvJF-ZIgA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: cZ4Z0IAWksmlsFpwvBtHyEYh49aDK9eP
X-Proofpoint-ORIG-GUID: cZ4Z0IAWksmlsFpwvBtHyEYh49aDK9eP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfXzzNswIVSMHt5
 ctXA78n23qX+V78r/M3aJK6xq/ruV1yGAY0CFKX7glnkONxCN1JgdD2QzVtnacQdZOq6YXuSjFB
 TgNGjUiHQnVeeI5LsXB/4IxUlVNfN94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280059

Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
Elite laptop.  Patch 1 adds the board compatible under qcom,mahua and
follows the Gen 6 T14s pattern with distinct -lcd / -oled variants.
Patch 2 is the T14s Gen 7 (LCD) device tree itself; it follows the
Qualcomm Glymur reference design used by mahua-crd.  Patch 3 adds the
board to the QSEECOM allowlist, matching the pattern used for the Yoga
Slim 7x Gen 11, HP EliteBook X G2q 14 AI and Zenbook A14.

Currently working on the board: internal eDP display, WSA8845 speaker
playback and DMIC capture, DisplayPort audio on the two USB-C DP
outputs (DP0/DP1), USB-C (host + charging on both ports), WCN7850
Wi-Fi and Bluetooth, NVMe, HID-over-I2C touchpad / keyboard /
TrackPoint, lid switch, internal USB2 camera on usb_hs (via PTN3222
redriver) and Goodix fingerprint reader on usb_2.  WWAN wiring is
included but untested (no such SKU on hand).

Changes since v2 [1]:
 - Drop the panel-edp patch; the CSOT MNE007QB1-1 entry has landed
 - Enable internal USB2 camera on usb_hs (via PTN3222 redriver)
 - Enable Goodix fingerprint reader on usb_2
 - Picked up Reviewed-by: Konrad Dybcio on the DTS
 - Re-add the QSEECOM allowlist patch that was sent as 4/4 in v1 [2]
   and inadvertently dropped from v2

[1] https://lore.kernel.org/all/20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (3):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1272 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1281 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts


base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
--
2.53.0

