Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4093A3B47D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 15:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786028789; cv=none; b=D0XP7p3TBJnhG0EomBIzCK3bW5oOzoJ8xUvOOxmCpQmtoOQny387A0bBd3nmb8VfBDDKUG+HkwMrFprv08t9PN61QhpU6YAYengMCCw3zkgTcZKV4X+uk5zqhSm4yFG3cnuIfeG2ssc2owVspZdNV4afjZTnPBdC/PQUg8aTtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786028789; c=relaxed/simple;
	bh=WGWmvrT45zM/0ero2BpClLGiAzkJBXOxoWfW+UK5FtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K+d3t74DiUcmmPyeMafNcv13K5+hIIRH5Sw3QaPUJhYCZwikfcZZNxpZAi8EQru2uAbSZS7z22hqdBrbDLKGuBF7hdYo26RAhxC/bL7x30Y4y/61r7Wqf7dKX2VTYTEAWRlJYPYO2Hpb7zrIbtigw+MrS5hp8f2MlDbgNtGBybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiA0Sl31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAtVvl1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiA0Sl31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAtVvl1d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EnoWF2574960
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 15:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VwaaKi7Stqb8oEgq8km7hJ
	BevB+7wFBNM/VlcAQzNT4=; b=FiA0Sl31mUmvg5LO7OuRkkswZXGp1jmr5BhAl8
	m3UK9de2OIl8GCsvbhFJvM+TUjX9ihk1InVwoadj2Q4WM+YJW1k2CPdTcDPYLeOc
	tsKbuU38XIrJWrfo68fEIStX1IKINZJv1DJqaz+/FWKEfp4z2Y3rkdwxxWt1Bth6
	jrxLNOW+wYaik5CToJCm6vruuHsBOeqbKpwIgt6E7z+RHNeDR1XoqsbDujVYGhGz
	6F85s1vMCOzvz4OFehY8FbO66Aa+mkVzrm4rred9tqJonnocCWF/0Kc/ro32gja4
	PbRzA5QpWxReXvvThrdWvTKUwmyKDRhyd4vjzH4VVzwt4wRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucjvp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 15:06:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487eb67173so3742857b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786028784; x=1786633584; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VwaaKi7Stqb8oEgq8km7hJBevB+7wFBNM/VlcAQzNT4=;
        b=dAtVvl1dhtkCbdoN3hF3WtCzyxP+afldFpqwUiWMpcLX+k1XKXwS10SfxVwN/rG9D0
         tvPUFl8NmB/vfsMT3izU2ngD3F98inpECnp//7EcMLtzF6Ot69uZB4QRxF6j7Mg5805g
         wcvlREo3z11kGZoldHKKGmfr1BKY+xzWqe7XDhCKic+dq12oyI/kv6chrE9cUYThZ3fc
         WofgYZvp1We9NN73xSxi74tYxW8+kBgsPykNJKwePGfgJjSpTFKJpavBaX49qnNh+CM2
         HkKzg433t8kpwgNnZxOTdk9UtJws8ptv35StKWPmy++i0Aw6FUMDj0ZbO/1RlUmp4HKn
         TH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786028784; x=1786633584;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VwaaKi7Stqb8oEgq8km7hJBevB+7wFBNM/VlcAQzNT4=;
        b=k8uloiMVTjjaIE8nSZdEIi2Z32EoEhT0sfF2cEwakMlSB6QKokZ50ojw7zv0TgtZ1q
         pwoX5q9AaNHO09h2RxN067+qqXtTRWNo1729KwWtcsGxJNaFzoGq4XhWqAyfeA3QOaJl
         8rZUZf9pijDMK2ZFltqYeg6fRzNEzX72v8ezw5ZmJp+VTev1A78Y1zws4BpSY1RGGk5a
         HtT8rJZ/VYyd4xCu3H9fdiuwcn27kShLW2QKRps1E8NIbS9xqCmWj1/csXIlOo9ywhPU
         GHFCAB5AnUiXn2Q3t5EdNTB96ah1avu8aKFovfCoqGgFJELn2NUP1MqRcMJLpfn6aIVd
         GQ+A==
X-Gm-Message-State: AOJu0Yy2NCFgpzLPKwfm9mkJjopnEo3vgTZMV6F6qUhTvgg916WjbJjp
	Ce9JeRycIcWrXK3xpjm+ZTe6KmkGb6OpWRaGtvqIYlhID5dVJT6yWQIg+1bEjZUxEVrI8oEHhbG
	N0IGpAzR6kEtVjt6kVudFI5p3KaUZvZ0/ut2xdzX2eOgkiJFo63PCuxRWH3Ond25JBfC1
X-Gm-Gg: AR+sD10C4RpL6v6WpziGJlGXJRY2K103uaAxC06g7rM6IW9spNELNQyzdjAfBwu/hBW
	CphGEOy/qJqVRYACG/IRMAupZ+ZIorYzzCVuhbGSIGE1E1SBGvRrZ6VzrjWXl40qBkTBLgaqNSK
	vCYAvV8ef+1IL4uYGPQ9ayRzEJRNIPZyU9peZ8Y4mAuzmickz+LNtnp0kqmkmaBg4krKX+GbBdo
	v8nSpz2o9XSjl7aPBK/KKc6WkNfQlo/ruxWG0NEzf4MAQX5l2p/nsviJEk9DW+QrsEUWBHiGPCn
	4yDOvfCVsOHS+MW2VYYrZRUzftzXy6+v9pRNKrjayVA7I1WQ9zbzvnQ79fQBiFWRozSea7mSBxT
	1KmxooPllHGStqLO5otxvTYpM20zpNQ==
X-Received: by 2002:a05:6a00:23c5:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84f2e12ca00mr15546765b3a.34.1786028783444;
        Thu, 06 Aug 2026 08:06:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c5:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84f2e12ca00mr15546639b3a.34.1786028782740;
        Thu, 06 Aug 2026 08:06:22 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc4c29sm1543341b3a.52.2026.08.06.08.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:06:22 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 20:36:11 +0530
Subject: [PATCH v2] power: supply: qcom_battmgr: Add multi-port USB-C power
 supply support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOKidGoC/42NQQ6CMBREr0K69pOWYC2uvIdhQeEDNdRif0s0h
 Ltb8AJuJnnJzLyVEXqDxK7Zyjwuhox7JihOGWvH5jkgmC4xK3ghueICdAm6CcEOHmycgpmdDxB
 JQylR80ulpFQ9S/PZY2/ex/W9/jFF/cA27H97YzQUnP8c7kXsvT80iwABquoqrvtzh6K/OaL8F
 ZupddbmKVi9bdsXfAeJJtkAAAA=
X-Change-ID: 20260801-b4-battmgr-multiport-usb-46eb0798668f
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786028780; l=24003;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=WGWmvrT45zM/0ero2BpClLGiAzkJBXOxoWfW+UK5FtY=;
 b=kAgB7KRsBdaxlJwgFbkUuGfCi+tqWoh5gybjcLppYg7UUMuHjbZNawRZMpN/R3YXmoTsCMUGN
 qCi5K7Joz5YBAqcDZUpnc/3+EXe4iZyxnTnexwE2EydfKv4Yq6tJI/J
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNyBTYWx0ZWRfX8+SnO5POXBiW
 3ymNnGdnJLaqG3PzYNP/mmBX7PaJcd2aHsgjgolPxdRvIMaQ407IsJi/MKvFq9FLuw9D+sUV/Mo
 2NJR9HRBVyN8bzJkJdnd1lXbZiiSwEM=
X-Proofpoint-GUID: 6WWiuaZHlH8_IDr6KikMrLuv4_jalOH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNyBTYWx0ZWRfX71fZXNYmVRG6
 v9M78mgQn2GeVnrKhJ2lSkiFs5gCcb4dtduq4ISu6FwQIbR6rgjKuSzHBcuvaulntxDGQVV6LlM
 3UL0otGMtXQL7iLbdh1f7ibYE6+wrDErBWjZniCs7AIkH8GjIlXAn5U0j7i0FAwO+T+xL/YnT/P
 rHe3geOsRQuKGFP0VyyVN1ulfCqhY68Un7UFW/R3CaHm9WFVRSXu1InHPsMlsdCy7NoM4c34UOp
 0N6MvuM7+Y98A5p2Xj4n0l4Kwmrqxe+kYNu64uEn+bePNTsb7d1zY3hjchQ/gx8k9p2viavt6CB
 aP/fIPURTVjmnuMhE5FrzMm0hzxWo/qG+0jt4Kr/no/SG+OK0W5gJQ96QS7dOfgWaWCvjO0aD26
 j4+2Z5Yc8MfOZYJHWTO4I+SJ5nFqh1r1rvsmHlccJZCArZhk7k5RWOe+nV0ycYGr4/cyU9kLhBi
 v5IBrqwLj398q59r6pw==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a74a2f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=kRNwVXITc2dd579CeugA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 6WWiuaZHlH8_IDr6KikMrLuv4_jalOH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060117

Extend the qcom_battmgr driver to report up to MAX_USB_PORTS (3)
USB-C power supply ports on the X1E80100 & Glymur platform, which
exposes more than one charger port to firmware.

At firmware-enable time, query USB_NUM_PORTS over the existing
BATTMGR_USB_PROPERTY_GET opcode to discover how many ports the
firmware actually reports, and register the additional
"qcom-battmgr-usb2"/"qcom-battmgr-usb3" power supplies only when the
firmware confirms a second/third port. Each additional port is polled
independently via new BATTMGR_USB2_PROPERTY_GET/SET (0xC0/0xC1) and
BATTMGR_USB3_PROPERTY_GET/SET (0xC2/0xC3) opcodes so its properties
are not aliased to the primary port's state.

X1E80100 ports report their USB-C adapter type on USB_ADAP_TYPE
rather than the SM8350/SC8280XP USB_TYPE property, so add a dedicated
x1e80100_usb_prop_map[] mapping POWER_SUPPLY_PROP_USB_TYPE to
USB_ADAP_TYPE, and use it for all three X1E80100 USB ports.

Give the primary X1E80100 USB port its own update/get_property
callback (qcom_battmgr_usb_x1e80100_update()/
qcom_battmgr_usb_x1e80100_get_property()) instead of routing it
through the SC8280XP battery-status update path, mirroring the
pattern already used for the usb2/usb3 ports.

Also add the POWER_SUPPLY_PROP_CAPACITY entry to x1e80100_bat_props[].

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Extend the qcom_battmgr driver to report additional USB-C power
supply ports on X1E80100/Glymur platforms that expose more than one
charger port to firmware, and give the X1E80100 primary USB port its
own dedicated update/get_property path instead of aliasing it to the
SC8280XP battery-status path.
---
Changes in v2:
- Give the primary X1E80100 USB port its own
  qcom_battmgr_usb_x1e80100_update()/_get_property() callback pair
  instead of routing it through the SC8280XP battery-status update
  path, mirroring the pattern used for the usb2/usb3 ports.
- Add a dedicated x1e80100_usb_prop_map[] so X1E80100 ports read
  their adapter type from USB_ADAP_TYPE instead of USB_TYPE, and use
  it for the primary, usb2, and usb3 ports.
- Add POWER_SUPPLY_PROP_CAPACITY to x1e80100_bat_props[].
- Fix checkpatch line-length warnings on the newly added
  devm_power_supply_register() call sites.
- Link to v1: https://patch.msgid.link/20260801-b4-battmgr-multiport-usb-v1-1-89d90bf5de1f@oss.qualcomm.com

To: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/power/supply/qcom_battmgr.c | 483 +++++++++++++++++++++++++++++++++++-
 1 file changed, 471 insertions(+), 12 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 490137a23d00..dfcfb646ad87 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -26,6 +26,8 @@ enum qcom_battmgr_variant {
 	QCOM_BATTMGR_X1E80100,
 };
 
+#define MAX_USB_PORTS                   3
+
 #define BATTMGR_BAT_STATUS		0x1
 
 #define BATTMGR_REQUEST_NOTIFICATION	0x4
@@ -76,6 +78,10 @@ enum qcom_battmgr_variant {
 
 #define BATTMGR_USB_PROPERTY_GET	0x32
 #define BATTMGR_USB_PROPERTY_SET	0x33
+#define BATTMGR_USB2_PROPERTY_GET	0xC0
+#define BATTMGR_USB2_PROPERTY_SET	0xC1
+#define BATTMGR_USB3_PROPERTY_GET	0xC2
+#define BATTMGR_USB3_PROPERTY_SET	0xC3
 #define USB_ONLINE			0
 #define USB_VOLT_NOW			1
 #define USB_VOLT_MAX			2
@@ -86,6 +92,13 @@ enum qcom_battmgr_variant {
 #define USB_ADAP_TYPE			7
 #define USB_MOISTURE_DET_EN		8
 #define USB_MOISTURE_DET_STS		9
+#define USB_CONNECTOR_TEMP		10
+#define USB_REAL_TYPE			11
+#define USB_TYPEC_COMPLIANT		12
+#define USB_SCOPE			13
+#define USB_CONNECTOR_TYPE		14
+#define USB_F_ACTIVE			15
+#define USB_NUM_PORTS			16
 
 #define BATTMGR_WLS_PROPERTY_GET	0x34
 #define BATTMGR_WLS_PROPERTY_SET	0x35
@@ -297,6 +310,7 @@ struct qcom_battmgr_usb {
 	unsigned int current_max;
 	unsigned int current_limit;
 	unsigned int usb_type;
+	unsigned int num_ports;
 };
 
 struct qcom_battmgr_wireless {
@@ -316,6 +330,8 @@ struct qcom_battmgr {
 	struct power_supply *ac_psy;
 	struct power_supply *bat_psy;
 	struct power_supply *usb_psy;
+	struct power_supply *usb2_psy;
+	struct power_supply *usb3_psy;
 	struct power_supply *wls_psy;
 
 	enum qcom_battmgr_unit unit;
@@ -329,8 +345,12 @@ struct qcom_battmgr {
 	struct qcom_battmgr_status status;
 	struct qcom_battmgr_ac ac;
 	struct qcom_battmgr_usb usb;
+	struct qcom_battmgr_usb usb2;
+	struct qcom_battmgr_usb usb3;
 	struct qcom_battmgr_wireless wireless;
 
+	struct power_supply_config usb_psy_cfg;
+
 	struct work_struct enable_work;
 
 	/*
@@ -829,6 +849,7 @@ static const enum power_supply_property x1e80100_bat_props[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_TECHNOLOGY,
+	POWER_SUPPLY_PROP_CAPACITY,
 	POWER_SUPPLY_PROP_CYCLE_COUNT,
 	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
@@ -977,6 +998,16 @@ static const u8 sm8350_usb_prop_map[] = {
 	[POWER_SUPPLY_PROP_USB_TYPE] = USB_TYPE,
 };
 
+static const u8 x1e80100_usb_prop_map[] = {
+	[POWER_SUPPLY_PROP_ONLINE] = USB_ONLINE,
+	[POWER_SUPPLY_PROP_VOLTAGE_NOW] = USB_VOLT_NOW,
+	[POWER_SUPPLY_PROP_VOLTAGE_MAX] = USB_VOLT_MAX,
+	[POWER_SUPPLY_PROP_CURRENT_NOW] = USB_CURR_NOW,
+	[POWER_SUPPLY_PROP_CURRENT_MAX] = USB_CURR_MAX,
+	[POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT] = USB_INPUT_CURR_LIMIT,
+	[POWER_SUPPLY_PROP_USB_TYPE] = USB_ADAP_TYPE,
+};
+
 static int qcom_battmgr_usb_sm8350_update(struct qcom_battmgr *battmgr,
 					  enum power_supply_property psp)
 {
@@ -995,6 +1026,24 @@ static int qcom_battmgr_usb_sm8350_update(struct qcom_battmgr *battmgr,
 	return ret;
 }
 
+static int qcom_battmgr_usb_x1e80100_update(struct qcom_battmgr *battmgr,
+					    enum power_supply_property psp)
+{
+	unsigned int prop;
+	int ret;
+
+	if (psp >= ARRAY_SIZE(x1e80100_usb_prop_map))
+		return -EINVAL;
+
+	prop = x1e80100_usb_prop_map[psp];
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB_PROPERTY_GET, prop, 0);
+	mutex_unlock(&battmgr->lock);
+
+	return ret;
+}
+
 static int qcom_battmgr_usb_get_property(struct power_supply *psy,
 					 enum power_supply_property psp,
 					 union power_supply_propval *val)
@@ -1005,8 +1054,7 @@ static int qcom_battmgr_usb_get_property(struct power_supply *psy,
 	if (!battmgr->service_up)
 		return -EAGAIN;
 
-	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
-	    battmgr->variant == QCOM_BATTMGR_X1E80100)
+	if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
 		ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
 	else
 		ret = qcom_battmgr_usb_sm8350_update(battmgr, psp);
@@ -1042,8 +1090,179 @@ static int qcom_battmgr_usb_get_property(struct power_supply *psy,
 	return 0;
 }
 
+static int qcom_battmgr_usb_x1e80100_get_property(struct power_supply *psy,
+						   enum power_supply_property psp,
+						   union power_supply_propval *val)
+{
+	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
+	int ret;
+
+	if (!battmgr->service_up)
+		return -EAGAIN;
+
+	ret = qcom_battmgr_usb_x1e80100_update(battmgr, psp);
+	if (ret)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = battmgr->usb.online;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = battmgr->usb.voltage_now;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+		val->intval = battmgr->usb.voltage_max;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		val->intval = battmgr->usb.current_now;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_MAX:
+		val->intval = battmgr->usb.current_max;
+		break;
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		val->intval = battmgr->usb.current_limit;
+		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = battmgr->usb.usb_type;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qcom_battmgr_usb2_x1e80100_update(struct qcom_battmgr *battmgr,
+					     enum power_supply_property psp)
+{
+	unsigned int prop;
+	int ret;
+
+	if (psp >= ARRAY_SIZE(x1e80100_usb_prop_map))
+		return -EINVAL;
+
+	prop = x1e80100_usb_prop_map[psp];
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB2_PROPERTY_GET, prop, 0);
+	mutex_unlock(&battmgr->lock);
+
+	return ret;
+}
+
+static int qcom_battmgr_usb3_x1e80100_update(struct qcom_battmgr *battmgr,
+					     enum power_supply_property psp)
+{
+	unsigned int prop;
+	int ret;
+
+	if (psp >= ARRAY_SIZE(x1e80100_usb_prop_map))
+		return -EINVAL;
+
+	prop = x1e80100_usb_prop_map[psp];
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB3_PROPERTY_GET, prop, 0);
+	mutex_unlock(&battmgr->lock);
+
+	return ret;
+}
+
+static int qcom_battmgr_usb2_get_property(struct power_supply *psy,
+					  enum power_supply_property psp,
+					  union power_supply_propval *val)
+{
+	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
+	int ret;
+
+	if (!battmgr->service_up)
+		return -EAGAIN;
+
+	ret = qcom_battmgr_usb2_x1e80100_update(battmgr, psp);
+	if (ret)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = battmgr->usb2.online;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = battmgr->usb2.voltage_now;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+		val->intval = battmgr->usb2.voltage_max;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		val->intval = battmgr->usb2.current_now;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_MAX:
+		val->intval = battmgr->usb2.current_max;
+		break;
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		val->intval = battmgr->usb2.current_limit;
+		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = battmgr->usb2.usb_type;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qcom_battmgr_usb3_get_property(struct power_supply *psy,
+					  enum power_supply_property psp,
+					  union power_supply_propval *val)
+{
+	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
+	int ret;
+
+	if (!battmgr->service_up)
+		return -EAGAIN;
+
+	ret = qcom_battmgr_usb3_x1e80100_update(battmgr, psp);
+	if (ret)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = battmgr->usb3.online;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = battmgr->usb3.voltage_now;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+		val->intval = battmgr->usb3.voltage_max;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		val->intval = battmgr->usb3.current_now;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_MAX:
+		val->intval = battmgr->usb3.current_max;
+		break;
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		val->intval = battmgr->usb3.current_limit;
+		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = battmgr->usb3.usb_type;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const enum power_supply_property sc8280xp_usb_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CURRENT_MAX,
+	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+	POWER_SUPPLY_PROP_USB_TYPE,
 };
 
 static const struct power_supply_desc sc8280xp_usb_psy_desc = {
@@ -1064,6 +1283,60 @@ static const struct power_supply_desc sc8280xp_usb_psy_desc = {
 		     BIT(POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID),
 };
 
+static const struct power_supply_desc x1e80100_usb_psy_desc = {
+	.name = "qcom-battmgr-usb",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = sc8280xp_usb_props,
+	.num_properties = ARRAY_SIZE(sc8280xp_usb_props),
+	.get_property = qcom_battmgr_usb_x1e80100_get_property,
+	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
+		     BIT(POWER_SUPPLY_USB_TYPE_SDP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_DCP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_CDP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_ACA)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_C)       |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD)      |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD_DRP)  |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD_PPS)  |
+		     BIT(POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID),
+};
+
+static const struct power_supply_desc x1e80100_usb2_psy_desc = {
+	.name = "qcom-battmgr-usb2",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = sc8280xp_usb_props,
+	.num_properties = ARRAY_SIZE(sc8280xp_usb_props),
+	.get_property = qcom_battmgr_usb2_get_property,
+	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
+		     BIT(POWER_SUPPLY_USB_TYPE_SDP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_DCP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_CDP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_ACA)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_C)       |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD)      |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD_DRP)  |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD_PPS)  |
+		     BIT(POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID),
+};
+
+static const struct power_supply_desc x1e80100_usb3_psy_desc = {
+	.name = "qcom-battmgr-usb3",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = sc8280xp_usb_props,
+	.num_properties = ARRAY_SIZE(sc8280xp_usb_props),
+	.get_property = qcom_battmgr_usb3_get_property,
+	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
+		     BIT(POWER_SUPPLY_USB_TYPE_SDP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_DCP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_CDP)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_ACA)     |
+		     BIT(POWER_SUPPLY_USB_TYPE_C)       |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD)      |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD_DRP)  |
+		     BIT(POWER_SUPPLY_USB_TYPE_PD_PPS)  |
+		     BIT(POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID),
+};
+
 static const enum power_supply_property sm8350_usb_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
@@ -1212,6 +1485,10 @@ static void qcom_battmgr_notification(struct qcom_battmgr *battmgr,
 		break;
 	case NOTIF_USB_PROPERTY:
 		power_supply_changed(battmgr->usb_psy);
+		if (battmgr->usb2_psy)
+			power_supply_changed(battmgr->usb2_psy);
+		if (battmgr->usb3_psy)
+			power_supply_changed(battmgr->usb3_psy);
 		break;
 	case NOTIF_WLS_PROPERTY:
 		power_supply_changed(battmgr->wls_psy);
@@ -1260,6 +1537,7 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
 	unsigned int opcode = le32_to_cpu(resp->hdr.opcode);
 	unsigned int source;
 	unsigned int state;
+	unsigned int property;
 	size_t payload_len = len - sizeof(struct pmic_glink_hdr);
 
 	if (payload_len < sizeof(__le32)) {
@@ -1355,6 +1633,124 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
 	case BATTMGR_CHG_CTRL_LIMIT_EN:
 		battmgr->error = 0;
 		break;
+	case BATTMGR_USB_PROPERTY_GET:
+		property = le32_to_cpu(resp->intval.property);
+		if (payload_len != sizeof(resp->intval)) {
+			dev_warn(battmgr->dev,
+				 "invalid payload length for %#x request: %zd\n",
+				 property, payload_len);
+			battmgr->error = -ENODATA;
+			return;
+		}
+
+		switch (property) {
+		case USB_ONLINE:
+			battmgr->usb.online = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_VOLT_NOW:
+			battmgr->usb.voltage_now = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_VOLT_MAX:
+			battmgr->usb.voltage_max = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_CURR_NOW:
+			battmgr->usb.current_now = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_CURR_MAX:
+			battmgr->usb.current_max = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_INPUT_CURR_LIMIT:
+			battmgr->usb.current_limit = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_TYPE:
+		case USB_ADAP_TYPE:
+			battmgr->usb.usb_type = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_NUM_PORTS:
+			battmgr->usb.num_ports = le32_to_cpu(resp->intval.value);
+			break;
+		default:
+			dev_warn(battmgr->dev, "unknown property %#x\n", property);
+			break;
+		}
+		break;
+
+	case BATTMGR_USB2_PROPERTY_GET:
+		property = le32_to_cpu(resp->intval.property);
+		if (payload_len != sizeof(resp->intval)) {
+			dev_warn(battmgr->dev,
+				 "invalid payload length for %#x request: %zd\n",
+				 property, payload_len);
+			battmgr->error = -ENODATA;
+			return;
+		}
+
+		switch (property) {
+		case USB_ONLINE:
+			battmgr->usb2.online = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_VOLT_NOW:
+			battmgr->usb2.voltage_now = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_VOLT_MAX:
+			battmgr->usb2.voltage_max = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_CURR_NOW:
+			battmgr->usb2.current_now = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_CURR_MAX:
+			battmgr->usb2.current_max = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_INPUT_CURR_LIMIT:
+			battmgr->usb2.current_limit = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_TYPE:
+		case USB_ADAP_TYPE:
+			battmgr->usb2.usb_type = le32_to_cpu(resp->intval.value);
+			break;
+		default:
+			dev_warn(battmgr->dev, "unknown property %#x\n", property);
+			break;
+		}
+		break;
+	case BATTMGR_USB3_PROPERTY_GET:
+		property = le32_to_cpu(resp->intval.property);
+		if (payload_len != sizeof(resp->intval)) {
+			dev_warn(battmgr->dev,
+				 "invalid payload length for %#x request: %zd\n",
+				 property, payload_len);
+			battmgr->error = -ENODATA;
+			return;
+		}
+
+		switch (property) {
+		case USB_ONLINE:
+			battmgr->usb3.online = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_VOLT_NOW:
+			battmgr->usb3.voltage_now = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_VOLT_MAX:
+			battmgr->usb3.voltage_max = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_CURR_NOW:
+			battmgr->usb3.current_now = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_CURR_MAX:
+			battmgr->usb3.current_max = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_INPUT_CURR_LIMIT:
+			battmgr->usb3.current_limit = le32_to_cpu(resp->intval.value);
+			break;
+		case USB_TYPE:
+		case USB_ADAP_TYPE:
+			battmgr->usb3.usb_type = le32_to_cpu(resp->intval.value);
+			break;
+		default:
+			dev_warn(battmgr->dev, "unknown property %#x\n", property);
+			break;
+		}
+		break;
 	default:
 		dev_warn(battmgr->dev, "unknown message %#x\n", opcode);
 		break;
@@ -1583,6 +1979,8 @@ static void qcom_battmgr_callback(const void *data, size_t len, void *priv)
 		qcom_battmgr_sm8350_callback(battmgr, data, len);
 }
 
+static char *qcom_battmgr_battery[] = { "battery" };
+
 static void qcom_battmgr_enable_worker(struct work_struct *work)
 {
 	struct qcom_battmgr *battmgr = container_of(work, struct qcom_battmgr, enable_work);
@@ -1591,11 +1989,53 @@ static void qcom_battmgr_enable_worker(struct work_struct *work)
 		.hdr.type = cpu_to_le32(PMIC_GLINK_NOTIFY),
 		.hdr.opcode = cpu_to_le32(BATTMGR_REQUEST_NOTIFICATION),
 	};
+	struct power_supply *psy;
 	int ret;
+	int num_ports_fw = 0;
 
 	ret = qcom_battmgr_request(battmgr, &req, sizeof(req));
 	if (ret)
 		dev_err(battmgr->dev, "failed to request power notifications\n");
+
+	if (battmgr->variant == QCOM_BATTMGR_X1E80100) {
+		mutex_lock(&battmgr->lock);
+		ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB_PROPERTY_GET,
+						     USB_NUM_PORTS, 0);
+		mutex_unlock(&battmgr->lock);
+		if (ret < 0) {
+			dev_dbg(battmgr->dev, "Failed to read USB_NUM_PORTS from SoCCP, rc=%d\n",
+				ret);
+		} else {
+			num_ports_fw = battmgr->usb.num_ports;
+			if (num_ports_fw > MAX_USB_PORTS) {
+				dev_err(battmgr->dev, "USB ports reported by SoCCP: %d exceeds max %d\n",
+					num_ports_fw, MAX_USB_PORTS);
+				num_ports_fw = MAX_USB_PORTS;
+			}
+		}
+
+		if (num_ports_fw >= 2 && !battmgr->usb2_psy) {
+			psy = devm_power_supply_register(battmgr->dev, &x1e80100_usb2_psy_desc,
+							  &battmgr->usb_psy_cfg);
+			if (IS_ERR(psy)) {
+				dev_err(battmgr->dev, "failed to register USB port-1 power supply: %ld\n",
+					PTR_ERR(psy));
+			} else {
+				battmgr->usb2_psy = psy;
+			}
+		}
+
+		if (num_ports_fw >= 3 && !battmgr->usb3_psy) {
+			psy = devm_power_supply_register(battmgr->dev, &x1e80100_usb3_psy_desc,
+							  &battmgr->usb_psy_cfg);
+			if (IS_ERR(psy)) {
+				dev_err(battmgr->dev, "failed to register USB port-2 power supply: %ld\n",
+					PTR_ERR(psy));
+			} else {
+				battmgr->usb3_psy = psy;
+			}
+		}
+	}
 }
 
 static void qcom_battmgr_pdr_notify(void *priv, int state)
@@ -1621,8 +2061,6 @@ static const struct of_device_id qcom_battmgr_of_variants[] = {
 	{}
 };
 
-static char *qcom_battmgr_battery[] = { "battery" };
-
 static int qcom_battmgr_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1648,6 +2086,8 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	psy_cfg_supply.supplied_to = qcom_battmgr_battery;
 	psy_cfg_supply.num_supplicants = 1;
 
+	battmgr->usb_psy_cfg = psy_cfg_supply;
+
 	INIT_WORK(&battmgr->enable_work, qcom_battmgr_enable_worker);
 	mutex_init(&battmgr->lock);
 	init_completion(&battmgr->ack);
@@ -1663,14 +2103,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 		return dev_err_probe(dev, ret,
 				     "failed to init battery charge control thresholds\n");
 
-	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
-	    battmgr->variant == QCOM_BATTMGR_X1E80100) {
-		if (battmgr->variant == QCOM_BATTMGR_X1E80100)
-			psy_desc = &x1e80100_bat_psy_desc;
-		else
-			psy_desc = &sc8280xp_bat_psy_desc;
-
-		battmgr->bat_psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
+	if (battmgr->variant == QCOM_BATTMGR_SC8280XP) {
+		battmgr->bat_psy = devm_power_supply_register(dev, &sc8280xp_bat_psy_desc,
+								&psy_cfg);
 		if (IS_ERR(battmgr->bat_psy))
 			return dev_err_probe(dev, PTR_ERR(battmgr->bat_psy),
 					     "failed to register battery power supply\n");
@@ -1685,6 +2120,30 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 			return dev_err_probe(dev, PTR_ERR(battmgr->usb_psy),
 					     "failed to register USB power supply\n");
 
+		battmgr->wls_psy = devm_power_supply_register(dev, &sc8280xp_wls_psy_desc,
+								&psy_cfg_supply);
+		if (IS_ERR(battmgr->wls_psy))
+			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
+					     "failed to register wireless charing power supply\n");
+	} else if (battmgr->variant == QCOM_BATTMGR_X1E80100) {
+		battmgr->bat_psy = devm_power_supply_register(dev, &x1e80100_bat_psy_desc,
+								&psy_cfg);
+		if (IS_ERR(battmgr->bat_psy))
+			return dev_err_probe(dev, PTR_ERR(battmgr->bat_psy),
+					     "failed to register battery power supply\n");
+
+		battmgr->ac_psy = devm_power_supply_register(dev, &sc8280xp_ac_psy_desc,
+								&psy_cfg_supply);
+		if (IS_ERR(battmgr->ac_psy))
+			return dev_err_probe(dev, PTR_ERR(battmgr->ac_psy),
+					     "failed to register AC power supply\n");
+
+		battmgr->usb_psy = devm_power_supply_register(dev, &x1e80100_usb_psy_desc,
+								&psy_cfg_supply);
+		if (IS_ERR(battmgr->usb_psy))
+			return dev_err_probe(dev, PTR_ERR(battmgr->usb_psy),
+					     "failed to register USB power supply\n");
+
 		battmgr->wls_psy = devm_power_supply_register(dev, &sc8280xp_wls_psy_desc, &psy_cfg_supply);
 		if (IS_ERR(battmgr->wls_psy))
 			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260801-b4-battmgr-multiport-usb-46eb0798668f

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

