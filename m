Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746155;
	b=SkLB/zAkUbZrFfZEIAeHq1SthS9w2+hFLT6qyfr1MG6g2kuLF4gWnszRci4PaW27/Pwr
	 wT9bXyZ6LkFNPCuJa7cjfpAT2P9X2NC1emZgBs25wpb846gLjcYHqzk2D2V7ojfdos34A
	 UOeYI6K1EGr8MsPf64UH4wJ5995XxGl00Qg1WiS8jZ64p4u93zq2B5uIG74gpDC+1tReD
	 nrat0fEMcx86Jj3Q1vzTmUTwc7N9aj2klQOAHYdE2SL4oj/AXy0vxBLExD1ExjSxMP0og
	 ETkUxrw/MfbYAdADesfaU1fIgbQgjgkUDuc0rZaJFi/STTWMYTZDpzqWlZ+4AGAi2pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
	b=rkLJ6x5jATi/oTf0hjax6P+pnBh1UBlqJmAm2748gyVncc42zFSQDFg9BQfcncSjaQ7+
	 TKOcO/dYf5hInTpm3VeOYNGjx5tOD4tBdX3O6TyMgSesYcuUv9KbNUepoXxcx0efQ3dLw
	 hnbHJu8nGCTAAbPj+ES7QXZ6meWZsv17Xp8QM8bwNImrMHTsirm3RZhkQG2smBzCEluVV
	 Qdn5P3/xPD9fBbub3Op1CdmyOGC1NZ4RqTB0YUpuWvcMFKfkRbB7w4zcSQZTthxX7Cn93
	 7AD+i9s8GijY76UPEoI9PeXUrpXoBcatmHZ3hr7rj3lhMS3sI5NBSOlpmqeFOpFWa6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzHQAA5c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3TLefwg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A7606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9A7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzHQAA5c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3TLefwg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMeM2572365
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8W2Ztl1Ru6WUtOrWa2GjLb
	kwbA+l5960sGvM7MImZEc=; b=MzHQAA5ceP4GBO1qmggP3nFzB+ZdpamOrGHLT5
	IdbTd5t46Bydl+X8p+ConErVYsa0eP/J74BJ2mJCB+EwqfGoWsaWbn21T27D6hzY
	fuOWMO/IPdzPVdp3rvcRpkC74/GHrvl0h19jiEgOdujiyxPfeEFUfOkE0ZI0HHRP
	we2x861tUwlDh2Zcm3YV1hpoj12xxQMl4dj/O1O6hNAAcDM6n2tDLvWDCTy5QgJQ
	4us5ufaX3trxKes7d00yokwxS8il6NfL6ARqKwnhcqAWFGgcDTTtOZhb9QiZJzOX
	iiVzVsr6XpUWgl8TZBf3lfuFF+o11kYwBd4kv8AzP9tY5pcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0kd5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:02:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bc57d4d11so17352576d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746153; x=1793350953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
        b=P3TLefwgjSXyoWGfRoEAzqsuTwFiYeEzzk6aAWLRRhiya4HbJkiSuXXuAoD0yo32v0
         3AZuSb0ckj9Dhd0L6uEg9zzW2q+mKns8KVIrio6hOsxNuDkw9KIna3s2GGAhBGIdzf4W
         HKILBZl7VfokWLqYGKcE+E6F1GGE6PoILMfc3UxN2GWtPbaJ2KZy/fVFjEIMTge6fGMJ
         geO50sJmFieEhcOYCdbDcNpuuNhCswHEdZGXl9YLTWzwOtlXQUlo4ZoFW50yp4Yz9w9L
         WHzkzOvnoCE7lGR9sGouYOyTkDGb8gUCYo9vMUdBWEn38yHYqQ2wk2V/lD6ULpRsjduh
         Lqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746153; x=1793350953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
        b=v99splIn2kgRWkbRuVcCWRuGY8UPKxES2ILOibI2Qo6T/EtlLwc0Agdk0WhLd6tCYo
         sK0n9n7OsVHO3nJM8wp0qMHlEBtLcfZi6abgW8CFa4DqAReNS5UkIVYrqPLoA7z22+DU
         QZJh29TbNh6OHM1yWbqirM2QytgYurOKWxQOgCYqorjW+/3Q2FmMTrfCtAo3iivGcima
         1eSk4+UePVzG1VC0tQsrYYsUAyikuWv2/CqbUXoxeIZQVlE/4L7PqoSFc1cEXX1kG3aV
         b5gq6J1OFaT5T7kLUBd+8/f2voS1m5p7IVhHl+2e+ZrDAfEKM27nvwCf0Ctv2nv10YBJ
         +PrA==
X-Gm-Message-State: AFq9FYJFrbRowFmYSWPAzkxVhJ2BKJ/DwYN5VAok3QZM2Dr/2n0edN5y
	0bPeuuqXdzx3+4em0597m8/phXB00aCtjsggalg+ABNPCo74AKkw4x899TC01m9n0gXEe4DiQ73
	W6DCYsU8I5PBGnAv1lY9sq4ZvehLbC5lp/N+hvydpY0BBp86uQDs6vlzwinYTpimiaLHt
X-Gm-Gg: AYBFou0AhVNeU2+BX6ZCX9eWKqonJoMFe8lBqkDX3a6wp+xhjrB312tS3i0KMXPsz6d
	Jig6E940dAIMuXU2GMNN4maxmdZ+GcZfFL51BVjMwkhhCZ1CBDRSUy7oGWa0tgOx0W53Fg/gaYa
	cWQHlFNjdkyzUEjfbBhtDhyA0Du/BE2w3X69w+UiTOU3EJZoKtMSm1cMf4NaDNyuYtkYwCOU1wF
	dBkxYz8r2xF6dTLoMvq4PCfn/1O8ahwnG/t1OqruOyATmFYs261Gt8ZcahcvmeIIUA/pTdvnu7O
	2v4bMUafUc35eyMBtR84MX/1wREnTIipHjtyL5lFGGIgtzAoWhtZ5pvbfSd6HO7pVtRjj0NAN+J
	MlvoTvy2HeRaImqxA8wOPtyi4WPmt
X-Received: by 2002:a05:620a:450b:b0:93f:115:7338 with SMTP id af79cd13be357-93f6f8796d2mr286961485a.54.1792746153143;
        Fri, 23 Oct 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:93f:115:7338 with SMTP id af79cd13be357-93f6f8796d2mr286957385a.54.1792746152617;
        Fri, 23 Oct 2026 02:02:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Fri, 23 Oct 2026 11:02:21 +0200
Message-Id: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ4i22oC/3WP0YqDQAxFf0XmeSOT6KhIKfsfSx+mmurA6qgZS
 0vx3zutLPuy+xK4Cffk3ocSXhyLqpOHWvjqxPkxCvxIVNPbsWNwbdSKNBWoiUBsRcZMwINtoA0
 C7bkxhDkhlYWKtmnhi7u9kV+nXS88r5Ec9qU6W2Fo/DC4UCcj3wL80F/+gUXs+2+dHPYDGk1Zi
 ZiWhFVWAoL0PHYxoE+71X96kXRe7feLmcZx/I+T/8YPPUz9Ha5YgIYiQ32xsQdX5g/aadueBKn
 lCSkBAAA=
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RCKtRuKFrR7tGXSvR+VOJ0TS+wAcLe2hylKIV4cNKmM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKjD+FzEB0z7TSHAVjvTmQXHm2qerhgN6dXd
 AbTbbAZ5U6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsiowAKCRAFnS7L/zaE
 w8d2D/wNDEtZzRy7jn6lzojLtaiBXzd5mY3y1IqsxfoY+aadKSLVvBgphSOaPhb80fkLhOXTz2T
 lHehHjK2hkHa0QW9uz+H43bvogsUBwmCnV+NCwNYOKHUxkcsdGrhoDgeuO1mGdCAIiIFLB0BShF
 y//KtdPrHndS3Qk2sO0ZoFIe2r5JM+iwUIoTaOD0JdMV1H59v72lB1p53xGVP3+kUz+gfhmBdpA
 3p4ZN98H79GldtdbTFP211uA8NhWS4MnjXftDuyJVf013TeoQ65WIWMgXo8tO852cw3iO1PgfA4
 yFWVTWAEvOHFFEy88DQKWyFDkkwf2j7elXx//bHcFZ/zhXqozNY7ZXVJL/d/2FLZ3nLIxhjjcuy
 jWnAIV11UWdtBtyZtVLAO8j10eD+blQOQku0+NZBwIYW/UoiJunenREBCOwd68yoD39GU2CgMIu
 cbUq13y13O+aL1Znt8bdUfq7tqPX5UtiS/ykHmyXbv53ViRvm8iAlzLBI5Pvzg2ZQfBEumNGq62
 BWQiP5ClSsS2+atiNE4PO4zG1HqIHCoIf1/n/iUQHT5L7Xz38DkhCL+Msm4b8ts414cFFUb6BMz
 CUtPzW0MPBkKrsqyVhioh9JACmliAjXpVqFyiiinBogccPOHyXvOr5lDfTj0FzX5etvoHJsOiqW
 vUKZM8efPUgOsmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9qshxXRbOU6FcaR51h9whoij6saykuXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX8syNuj3Q0weM
 PQMYtqTLqzk7lfHrqbsP719wqUe387bY83YCHFCc9L1tl76EJtMWAFrQgR8BEvXWDm7ag7YCQU0
 /s++TWt3Teo7zIcy+6kJcPmXlqzH4xF2eKbcxGBebBq0CbhqIFN79HWx7oaORbfgCl/vbTN51im
 jYjSfrNofC+GX18+iEY07Mlsavj3Kkvv57JI3PiKSGnSbmp5HcL6kFqzDBU8qp0No4zpQDfE058
 LH+yMVprizocMkY7dc4AoO5/+kM8o37GBryJlRXPMJDeIll2T0LPMJlEUVpwdRQQ+/wcfy7wOqx
 6G2XXJbD2UzQXckES5QPozmQhOmK+tSiLOU2eQTVBuRYnd3jezDfttg3WchcWHabgWFxRUlhok0
 uLE9VGM8OCkjt1SUjQxoOgZXfUjt1ZRiVBgJC2MIpqzZjCzIwBxjEIjfSIAY6SZUqa3w88nqTGn
 vIQNa1X1Lkoh/hsuYaQ==
X-Proofpoint-GUID: 9qshxXRbOU6FcaR51h9whoij6saykuXF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX2C+RBHgvj94M
 PVKp2XzbojeCtTVYxOGC6FIsOBun2iPdRYice5a9Haupl47yl3eq0zNMdIxNFaBWpJoEs6rNlkS
 JB9Y6fQL2c+nkMDW1CjhKW7ghSCmquM=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb22a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fcLLu9nwmMbFcDYE2AgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches. The second patch should be
squashed with Shaun's series. The third adds the ethernet nodes.

This series is rebased on top of linux-next with the necessary EMAC
changes already queued for upstream. It depends on the series adding
base support for sa8255p[1] and the SGMII PHY series that's pending on
the list but has been positively reviewed[2].

[1] https://lore.kernel.org/all/20261015023711.721837-1-shengchao.guo@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans: make the emac compatible specific to the embedded variant
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi    |   2 +
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   6 +-
 4 files changed, 245 insertions(+), 4 deletions(-)
---
base-commit: db4ba5d3b1ed0db55a16ce32764f8c9855013db8
change-id: 20261022-sa8255p-emac-dts-dbc521421276
prerequisite-message-id: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: dc952656b431f0bf8e2411ee14f50e7884cabfa1
prerequisite-patch-id: 27868f2a4c4ab6fcc455b250f3cda1cf1c7801c9
prerequisite-patch-id: 341b5a589bd5eb68854ad203e1facd93e1b74192
prerequisite-patch-id: 18b6ae4d5a6da83554473326a956fd03c7571b7b
prerequisite-patch-id: 5293d5db8a1231f0c1d4ebc0e9aad6862e8c06d0
prerequisite-patch-id: 7391f02c4b57ae6afb088fae3150ea215bfa594c
prerequisite-patch-id: 5666ecb900181a3877c902983bb1c3ec3c3058a2
prerequisite-message-id: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
prerequisite-patch-id: 16cabeddf5ca2469ab9eddf6acfe1b86c625d11f
prerequisite-patch-id: 0a76ec6a2e4431d679f4918b3d469c9644dd660f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

