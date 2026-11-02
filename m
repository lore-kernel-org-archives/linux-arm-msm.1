Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636848;
	b=sxSKOj1HlnXoEfdKPPa+ugcpzbmvIAO1Njxx1zAO1dJCBbrUaKRpF6Pf25YW7RGfZ5bC
	 ya9KLHuaR3YIboHgUVVo91U7zg0Ty/Q9mCjNvqzo+BsIbF1yzo6Ncm6XwS1aYgJ+BO0Jh
	 I4Q9xXWmGUll9rDcY3aFr70QxGR9S1CsorWSivEgwPSkjkPrIlkk8JtiXAgb4BXAD10Pp
	 2EM+3j8jTN4PhJP/Ghyp+/OM6SbWBt/WlP5ofZOEs+spTVY4IjnMhCFv3iBMIRUHhxMQX
	 HciXtTjXqzpnp7z6DV+GzYjRvJkqKezpAWIJ5aVFY4eEJhY5mNMvQ2zqcpk/4/Kv2qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
	b=zVHG+FIlqwuWpq3GCtuQ6cXHoOaxDxg30FORNUWO/oAfa8p7SMl36Nc+5X2UdS3QOe9t
	 rct2TOeTUttLEu9jwoq8783rSJU+DKSWEcmTdX7cI5388hGY2xBrDLiHLGg+tM0O3IywE
	 cCWwUX14mrP3AQM1ml1yQWtsRnGEupF1WfD7JTJnuU26vUbKtJwYQ0PHj+/g3aN8Xa77Z
	 q+9rucT3voLXJ6/Muz0S6B4KjozUGlTFSo48LsceUWuBlNb/ZqhvLIfAC+va+Ex1dKBaZ
	 Io3xN1Xq0QVCTNTYAp/rLhGONrHckhhDSwiewGQRysLhRy8wIQ0hAalXapQLf/hjVQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGDhH31Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f591E5Lz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180A6072207
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 16:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5180A6072207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGDhH31Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f591E5Lz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIRk2991827
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 16:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2E5loI5QzOdo4ew1vQKih
	9z8VadZE7soKVzNqeQSpk=; b=EGDhH31ZGDal6o1bjWyNGFzeopWyrBhihaYUAY
	oTrVhVT85GEo3whpJ3kB5IBaxnRwds9Kf1wrHGyXInPzZ09DQbgLBoa52Xxss/+e
	WqQyghA//btJ1wUVP21gU9mlbzvPTKDQkGh2p1oBqN4YC+thbsLk7IeAKRv8zAAf
	pqZc5or66JdQjqN408Ffam+NKwhSdVHaUGmoYIEGwi3whS0qOwMRlmUYxy9bH4iM
	eDe1oFG+rculWjEIIQUqFsfzc779qxItP6k9W6rLsqCfKf/9Fq8LeMiyPY6Ocb39
	sYevgYphTWBXSqP14Vf0v8Mm5VoHXUMzdchc3nrVxLWCjaHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavhcak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:27:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so2306578137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793636846; x=1794241646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
        b=f591E5LzJUT5Thbj/3ZEnOQ/mq+4XhpslppdM05vF7ARIhZuu945F0celsPdKrbnwN
         JT0C/BYxIdF7XlyM0NPeMgejH6x8qj2mkZYt9n86NkXI/sPvk1/nyVlYHqeKdpVEI8SQ
         7KQXUZW4Dmqj7dQ5sZiNrvli65DdCl7bRCZfPPgeu19DAFGWQWeclW9nfJaDmH3xxfgc
         DRF967SScZocehZn5yENh4BF0aX1Zw7gfGLdr2+Wfpq6hJ4xkm8xPhT+VMfvVHhBWPb4
         D7M9LuTNuf6VP+jNCr81MOSMsDjLi32JHww6+SEniGW5OWBzXmSh9rnHfWLIrgRWZpYr
         LvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636846; x=1794241646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
        b=fjoI8QPP7sxH1u3N7buuxSfgTL6hpVkZJFqP5w+NYAf2yrPDcvtrXcrTnOd8YBkVap
         dsmxmfifnhvfxulha0UktuAQBEKDNyj5u1yvecVcaf3ts1K8gSTGE4LhYQK2hUPNvFaq
         eaotZ2mPqwbEItL+jO8+bLMmJLehumZ4xbFooz7uEP2SGo//HTGuwphVyh0M/+/Y7VkQ
         +PA6Bg9liSt1nOUKmR2wDWt2rhRj9HoXmSleBer3rq+ethtuMObwY3tGzfj4pE4ohmVr
         XxLHrbHa2ymmAZA1T3aSYGkHCZxj7RlFaqbmCw1lp5/1XuXlEWff3EfuTLLBevVG66p4
         Hb+A==
X-Forwarded-Encrypted: i=1; AKwUvByn/C6osDBAeZaU+xfCMSkByPXPc1t76SOHxV8aimz/u7JghXraaG5ZMtKuKoBbkULItAAFhK8Ey9wYgAEt@vger.kernel.org
X-Gm-Message-State: APuU4Z/QjBrPQhN7jWWD12Zch7vUA+dzzeRdEGfxiKO7UKjpg9E9fBP/
	lRUI4SPzMd1SqHB+il5N2TcNqEDZfGk5hfjB8Trw23ygMIcD6V6Xmn++P0KLPVw8bn1y/lDtvHH
	6k+Yfc3zIiAEpr/z0oCWqzFKeHJiZvxhnib8V/ogh+ND0Gki3f04yJ9TGGlC8zp0kwDZ/
X-Gm-Gg: AYBFou1khCi6b1xlstvJfltEQFlciS16fyszOwYuQBklA+K3lAK8X8b1Ye2yClC6s8f
	SbF/P3nHeQUECgOuGEVXJps+hJ5JgqRmFNrArB00XjV0sd1QtBPXSD5lmitB1EQeMxAclF7TlZu
	B8K+x69Xxs+vmaAeMFcJ9C7NisCuMaoUvB7/Gj/vAQLYwo1zzrPe4ck/gGG8KWrskfpa67QQlC7
	+UmHh0C9WGDi+dbcUAj9onMuLMRMU6WAVA2Vo2DOeQjpX3RRAS+BfuSc1iukDo2xWLLyCS+S+Vj
	OJ0OIWqjARmhYRgHiRm7kT4fW7twY1Rw3oFH+epES/kEHGQcmAgzXitX8FjDZa1xIgova8Cypd9
	t8+WY6SwJyjeDp9/hJWXFHYhDeXXed3RKOPk3kvz2p90htvFJRjhx22KgxXL5+pPdLWh4Ju0haJ
	7BjmMohIUVdMQCBzYnUqWte+kF0qXkU/H0+1mOJ1V+2gO4tVuY0kwdpMQcRJ88jgA32EVbshhMc
	h62yJOtG+SVlQWZYDQc46e7RwCu
X-Received: by 2002:a05:6102:512c:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d072bc74c1mr4164601137.9.1793636845466;
        Mon, 02 Nov 2026 08:27:25 -0800 (PST)
X-Received: by 2002:a05:6102:512c:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d072bc74c1mr4164585137.9.1793636844939;
        Mon, 02 Nov 2026 08:27:24 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm20490695f8f.45.2026.11.02.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v12 0/2] Support for block device NVMEM providers
Date: Mon, 02 Nov 2026 17:27:19 +0100
Message-Id: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOe56GoC/3XSzU7DMAwH8FeZeqaT43zvxHsgDknjsIp1hRYq0
 LR3x92llUIukWIpvzjO/9bMNPU0N6fDrZlo6ed+vPJG4NOh6c7h+kZtn7jQIKABha6Nl7F7b8P
 cXpeBhlZFCY5cTMGHhg99TJT7n4f48sr7cz9/jdPv44JFrNUqtYgWWhMSSrJaeAjP4zwfP7/Dp
 RuH4chLs4oLbooGWyjISszCUkpaSEUVRW6KgbIXyYpD40TWEILUFUXtFV8oihWlrUAyEbEzFUX
 vFIGFolnxmoBHnXP2UFHMTsGyF8NKBuSZpC4pkyqK3RQLolAsKzKTQ9CUIbiK4vaKLBS3vsgFk
 hhzp3ztp/1OkVAofn2RRS+1EzbFXFEEbIwDU8YO1sSQ9i5i0Dy8mrPFV4DQpbPmNzsObmdVdva
 /Cd/v9z833sFUdAMAAA==
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX2URK1B69pk3q
 elF+RO5EmFzPQOIbIBGW/L3MpmubzPXCjupVDXBKnCQBAAfYZRB6yYaTnlcVCFSqx9NZwdBtvJp
 bbsNroND077/PSmeVUkA7yCwl22nk8Tf3dd/IFqwcsSkxEd2C4/z90PRYow6OGIftwXdLMME7HZ
 YXsivvvQ+xoTuBKcPTsptIOtv8rCI+ayhsNRL7dusGhbjjVMCVOVU+xZRsaeaa2/TyFYAnkBHPN
 nRD3GYGC4sr5TaBJ7IshDghZEnw9/uFBmyGMDuU1/b4gRxqdD/Mfcznfpbmf9fC9D09NNruza4v
 CztNzqJ4WuJBMEJ6JJvxBq0RFOGLLT9RpTlSq98P8fS0/dX+xK96q7mb4qILnPJEr1/ULFFhRUW
 9q6AN9xVWQO9NsoAzEM2+92STKOmZ5FFerWzrZbyCOmmYi3GjisqTtrKXC7eJT5jLeYWHLesiCS
 4QDeQujeOG/NwvkuW3g==
X-Proofpoint-GUID: izNgEzcb1oplMyk2py8EVAwYPzTZos7E
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8b9ef cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=rVis_EDdIu0y_XEmomoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX0HmXMGT2aAdC
 sc86qdh/+8ks9Rc39UoZy3hprGlhhEM1LTepxoE0GrJwGuTTJLcktOOoS4IHkyehj8Gk2wenrAe
 lDtw0cC7qe+mXE5BVI3KWctJm1g9ToY=
X-Proofpoint-ORIG-GUID: izNgEzcb1oplMyk2py8EVAwYPzTZos7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020065

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

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v12:
- Simplify the series and remove consumer changes (BT/Net) that will be
  submitted separately.
- Link to v11: https://lore.kernel.org/r/20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com

Changes in v11:
- Rebase on linux-next + resend
- Link to v10: https://lore.kernel.org/r/20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com

Changes in v10:
- block/blk-nvmem: simplify read error handling (Christoph)
- block/blk-nvmem: verify dev_t wasn't reassigned before reading (sashiko)
- block/blk-nvmem: drop __free() cleanup for explicit of_node_put() (Christoph)
- block/blk-nvmem: init static nvmem_config fields at declaration (Christoph)
- block/partitions/of: fix fwnode ref leak on skip/abort/error paths (sashiko)
- Link to v9: https://lore.kernel.org/r/20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com

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
Loic Poulain (2):
      block: partitions: of: Attach partition fwnode to the block device
      block: implement NVMEM provider

 block/Kconfig             |  11 +++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 112 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 block/partitions/check.h  |   1 +
 block/partitions/core.c   |  25 +++++++++--
 block/partitions/of.c     |   3 ++
 include/linux/blk_types.h |   4 ++
 9 files changed, 166 insertions(+), 3 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

