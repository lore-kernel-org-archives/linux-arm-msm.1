Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0F2E9EC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427245; cv=none; b=TvdADbrsML1ip/1sSu7Tx7OQVSSRQriLFVC7OPF3PWB1nwLcswHIxCKUCpGw+XchLYMM8KOJxAVbobECoj6HRYZS9fOvXSV3UV5og36AdC82MZ4cm43evAIdZvUluRCyZ1xmIgI5JxLUkzJMI2ANI4dEocraz9BdhGjpymeh+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427245; c=relaxed/simple;
	bh=4ezF0rq/B5oz9iEhUrAxzneVFMYGirpP9HkYZfMOtR0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iwLC2dvpjt3s/afGec41Ar83L4fszrk4L1R/Z+N3163YQd1PyqC9DzlYfPsbgXshdL0SZeeF/ESluwKye57IltvDWF8jw1IrlQomxdWnwe1NZ1j99qVH9DimzcZxY1n0J2/GknoI9gYmHix/Pd8Vm6391W1luSlwSGunBWZIAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNdbGaEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dauwmJU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNdbGaEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dauwmJU9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQto61490281
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B4zwD6yt/500H48+4ETnP6
	OGaSwFDNT4rMvE93Qd9n4=; b=kNdbGaExZTGsb0OciycAs2Ibt11TyFMMA/hOfU
	nEwR4Zj7O0NKp3BKDXZgCROzPJ5SeYdpPioCR8/xjyLPEQnK3zLnqojpfwMjKQAy
	wL2UeDPOCHXqF+KmD2kUogWrcpJXb8jyZ5cczDbs3NwmalJJosvTyGnhRuBHRsXq
	HKwD2Mio9kL22DPaCIrK0vxSBsgyUyAuYqMqHOkzcVyHK30z8/rUQqvb0vXtb0dQ
	VnP5Lp5L21e/SRgQ97WrTjEQQmafCMiSs7UVzAe8kQ7TZStU4Ez5MNDOZTAvWNdv
	+8Tajc2N9Y/02ZXVpjEXz9FuHkdAQSIMDxIvWrT/eE1Tw50A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md0dm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ea24a2db9so1796785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427238; x=1786032038; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B4zwD6yt/500H48+4ETnP6OGaSwFDNT4rMvE93Qd9n4=;
        b=dauwmJU9yi58huNGGMooymlT88o6HqxSpwvnrfKw1Pv46mDOgTm6bak7U1GO5gtH5/
         /9eiz+KgPbSIi5Mb7OIf6BrCaoTFlTdFbcq0Fo3U3aKLZke6YYMXGg3jqtnVDQRURbks
         fqoA+1QzxMi0foKQlX+xW2XyPRNUJOvCqUMrhzxOyZeKf2jOwyuEL6y6cxrL0gVUptbT
         c/wi4E5kjvm+xDy2cOHWVNIoU6yuFCsWLXUrSsc8Y8k1/Okz1hybeplOdW9Yvp3/vNKM
         T9HaUmB55ifFGAezIsE0bX/5rVTdyBs5tyO0RScfunwtGyq7O+12nu2AvL9QUEekSe1g
         KaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427238; x=1786032038;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B4zwD6yt/500H48+4ETnP6OGaSwFDNT4rMvE93Qd9n4=;
        b=MY5SoVwxQapExV2B+oroVWVTjs+sERtKU3WXMin8Huo9ngvL8+0wSy4mJeheOQjeY/
         GCGYskfZzBMPEJdJ+pemzeAV+BJ8jAoxOfVsGZ00ouIXkIIRo3MeXCrx7fiYGQHd6z9S
         vObstH2HXjPwzNxO+OEbaFwEuECeTbzFhGOtXPFZPOu2AKcYJjo+eIik8es3dHHe2tw3
         KpmBZzefCYXFxU/twyh/LOJbrO11uV4TDUIpbcG7hJ5U/+SxQw/3U2TnfMdecrinJyAg
         Gx7j7QG4LRIjkWZzDwe40tpEcOa+mYwq/WRqsXysWPH0JWZt8tiZRoj0gqRmJByNRPqZ
         i85g==
X-Forwarded-Encrypted: i=1; AHgh+RolEi2FqEtzVs3RcTJLAc0aY744z683MLV0APTAF1fhaSbSPi+AoSJBy/K/xv57/8MyNxmq4rEM8Gu63OgX@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpsbKoZy2WzOoM0BNodXLNUXt0AMDjp5g3U+AnPqubGBEcGN3
	vuZXuojmZfO4gynRoYtJTqxRCuxfNVTGWO6+CK7Vk74AlaI7XF20InQbMQ+RVTd8eOH4avCOod/
	PAclvHvAemaddSAo8MkzXBF5EPYilrHYJugPSaMNOsOxzLeAAqN2yh9x3xRiY1nRnYxk1
X-Gm-Gg: AR+sD12UJd16f8+evnPZpzfjhcHQmPM9by7l5MbJZUtgkU9hY94fBQOD1YRfQ1zFQ0p
	dQUA8lB6ljXXHYAiVVCBA08bkIyi7MqZnYz5kEvEwsMeHfdXAEvkHvnUK73jpdd6RXrxMGAYLm4
	KnkaN2Pyfe/9xguEViw1VkIpDoCIRbDiMwdInTiM+J2faHbwbhhLVKH38uHareiGcLUmgKl+Myz
	dtxXHjkAIH3IKLSVlOktnrbveTI9tBYajgh4XqfcFjIZ8mjgE92PsbJVRqXZU/7b9ON8/KvSSTZ
	0aJI1e71+MGQcSJmIhNjSBVtCK5x4CcjiAaKK+vFAnVFCFZSc+VcF8x4D1jzKVu1cDFxfpC/mfM
	UXDOAyV/jiMczwF939MYpC4c+iZ+fpI+M31OacNspg3/wT/kP3aBFiJ3MUMN5m/+HtUoueUdi0P
	B5SD6giFFtU42njOUH/kd92TCDjSeMPkZDfqdotQ==
X-Received: by 2002:a05:622a:111:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-52b386c3e76mr34024291cf.65.1785427236334;
        Thu, 30 Jul 2026 09:00:36 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-52b386c3e76mr34022661cf.65.1785427235260;
        Thu, 30 Jul 2026 09:00:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v9 00/10] Support for block device NVMEM providers
Date: Thu, 30 Jul 2026 18:00:30 +0200
Message-Id: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB51a2oC/3XRS07DMBAG4KtUXuNqPH53xT0QCyce04imgRgiU
 NW743STSMYbS7+l+TSPG8s0D5TZ6XBjMy1DHqZrCf7pwPpzuL4RH2LJDAENKHS8u0z9Ow+ZX5e
 RRq46CY5cF4MPrBR9zJSGnwf48lryechf0/z78Bex/japRXDgJkSUZLXwEJ6nnI+f3+HST+N4L
 A9bxQU3RYOtFCxKl4SlGLWQihqK3BQDdS+yKA6NE0lDCFI3FLVXfKWooihtBZLpEHvTUPROEVg
 puiheE5RVp5Q8NBSzU7DuxRQlAZadxD4qExuK3RQLolJsUWQih6ApQXANxe0VWSluncgFktilX
 vn/Ln2/3/8APLF6V50CAAA=
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b7526 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=B2QLtKVpp-MixIsELHEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: s4WwP6l8LIeJvZmvTQXHQdpEKvzeUbQa
X-Proofpoint-GUID: s4WwP6l8LIeJvZmvTQXHQdpEKvzeUbQa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX2hNk0/A5FCtk
 B07eBoNVllgx6s4nZ5UVmiiOusMmHbkmN10JQYj3lxlY0xEeN5onhGgOk8/WiwICdL/Bxbvt4gM
 S37a1kgr8utw94+9WLkei7qL4F+7oc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX9oGIZ6O88bLQ
 jncLKzeq3osUCPbT3L7ZcAz0cXWDwuu0vsdKaVBTmyWY5DaAHJOm8jg1/o/LUO0TR8CzbWPSSwr
 U/YV0zVxp4+vKWGuYlpgfg7kcbU4U3jURhHTkV1vD2H0qEtF34TjLBOJENFe7UjfJAulx5tT88V
 gh4FSM7vGcLRCUL2OCX3bzczBIKpmIxoWyq8u4Gidis8cpazuxOXsq1oXMimo+LxMbAs9GqEmhE
 LmlxfOsbFJzgqF6yBuGfEWW81TYe39M4Vi2Rp56j83PE+QdtRP3z/UHst98ey0BRa12wy0PGDfL
 I/KJXAN94R6s0LwXcfat4Kz1fd9CE0tAOFbZiWeKlx3BhM4cTfW3viEKrC96iVH7yq7cI7jiKW3
 zQUrT3KYXSbeEdK7xmyWIWIXZXTuGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300120

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v9:
- Add nvmem support for partition blocks, not only disk (Christoph)
- Prevent concurrent exclusive access to the block device on read (Christoph)
- Add comment about nvmem being a side channel for block device access (Christoph)
- Link to v8: https://lore.kernel.org/r/20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com

Changes in v8:
- block: Fix bdev->bd_nvmem on registering failure (sashiko)
- net: of_net: of_get_nvmem_eui48() now also rejects all-ones cells (sashiko)
- Bluetooth: mgmt: account for HCI_QUIRK_USE_BDADDR_NVMEM in
  is_configured() and get_missing_options() (sashiko)
- Reword blk-nvmem KCONFIG help text to satisfy checkpatch
- Link to v7: https://lore.kernel.org/r/20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com

Changes in v7:
- Rework bindings/dts so that the eMMC boot partition can be a nvmem fixed-layout
  and not a child of fixed-partition. (Rob)
- Add Support for fixed-layout as the nvmem device node itself
- Remove "block: partitions: of: Skip child nodes without reg property"
  This is no more required in this series and will be submitted separately (Rob)
- Add missing linux/cleanup.h and linux/device.h includes (Bartosz)
- simplify nvmem_register() error path using dev_err_probe() (Bartosz)
- nvmem_device forward declaration to blk_types.h (Bartosz)
- Add hci_dev_get_bd_addr_from_nvmem() kernel-doc for return value (Piotr)
- Link to v6: https://lore.kernel.org/r/20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com

Changes in v6:
- blk_nvmem_add() returns int, error properly propagated (Bartosz)
- Redundant if (bdev->bd_nvmem) guard removed in blk_nvmem_del() (Bartosz)
- Size guard changed from UINT_MAX → INT_MAX to avoid signed overflow in config.size (sashiko)
- BLK_OPEN_RESTRICT_WRITES removed from blk_nvmem_reg_read() (sashiko)
- Link to v5: https://lore.kernel.org/r/20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com

Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Loic Poulain (10):
      dt-bindings: mmc: Document fixed-layout NVMEM provider support
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      nvmem: layouts: Support fixed-layout as the nvmem device node itself
      block: partitions: of: Attach partition fwnode to the block device
      block: implement NVMEM provider
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  23 ++++-
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 ++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  32 +++++++
 block/Kconfig                                      |  11 +++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 104 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 block/partitions/check.h                           |   1 +
 block/partitions/core.c                            |  15 ++-
 block/partitions/of.c                              |   3 +
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/layouts.c                            |  13 ++-
 include/linux/blk_types.h                          |   4 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  41 +++++++-
 net/bluetooth/mgmt.c                               |   6 +-
 net/core/of_net.c                                  |  52 ++++++++---
 20 files changed, 352 insertions(+), 21 deletions(-)
---
base-commit: 5174c725cd98c717af2a4fabb7615a11b3ab4b9f
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

