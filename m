Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829758;
	b=n02qBh5PztTnNKirO+DtUc66wXtUuPl4crTo1phAUR3/ejBa80kQdvMNCMX+ClKvxSq5
	 OLUezxbti1G4P/QtaLPQomEGl2gR+Gljwn0nkOTXdJkl3SziyZKntSWdnOi/px/xCE2j3
	 THYDNypQaicHO2M2p18rv4Su9SmDXwS/n9TE/zNZRgK4NejurobgvjeOj7bJ4Eq4VsF3P
	 fA2orq49rcAsMFZmAgZyI/YH5m25ZwXJdlm1Cl17q+wn8d8yjIheuCJRC2QwTvRlEelG0
	 gvmfMHIeErs0t9RxZ4UojFQvNyfWDTvQXrbiSrS0KGxTnTW1cmr1DrJWhALo6RjXz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
	b=H2LGr2Fey+6jeBHxGBOYmH+p480/E+kxZ+iL4CvTomazzB2y9xhUUyQMyiigqWVIBPu+
	 eULeVcom7lxB1JsmSGCurgQHWh/7xIf6ZJgbOqUQ0408Kdkn/jtg3+xd59ZEO/+wdrYeX
	 k8fCnjufgz+cXLGDEUTMft1gjdWkNaqMzyZIJLjdbmiAhmIK6IHZEtcE2e2/8raNeTwKF
	 RsNlh4VraFsbBtGS86a4v3tq0WxlSErkgQY4fiJ22kPxzgqRFoQVoK+Z8hJZ7ter1deSi
	 t5SmBbkwgtS2dAIuapA8efrgV6dfysc0zcmZU9CthzKRK6URnR6GwNOhbNfJAMSAcCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIstbYq1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DGzQ70hW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC8606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEC8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIstbYq1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DGzQ70hW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLf5V1465938
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY6
	6xikX6Hs=; b=YIstbYq1HSw9wRh/Tz0Yl2FqvHIkjNxVkMX07nq4NXy/tevLxKH
	eT1oBnw5ZoIUaLQxkW79sCo0gDLkP64Zscr0WiramjSk1Ed810LXWRajuiLbomr0
	50ehpcm3tWX48FoP5ixSy0Vr8lWhXfOkEDJDmmM+FtBrdOt3h38Ufw1NWw3ELdJj
	lQXjw4/61yqHJ+p12M6/+og7JkV7ss3QXD/Wtwimmiew6rsFLCQ6AJK4fapkyPuB
	WhgrATi4fuCJoVOcB1m3IUyaWOSWe9lvOQ8qIGpzpH7ZJjGrOr08vdgq3KpOw2Bx
	2AoN/tACnCps03nR11tjjM4/TH01HJ17f7w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gk7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so4353648eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829755; x=1795434555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
        b=DGzQ70hWDOkEcq4Jviv+NHlR7D4V/vObjJcKzwj9YMX//biZ/EKQuElI3nk3O+DSD3
         zu7xP5NMAU+sopbjUiz0VknR4dRBVLp86YRDyUivMobe3zfySlL1LNDIPf1bfkNCzQKR
         tB9IAqg4JBsPZtUuyMHk6qeYivPzRO5gw/Lc/NMWfOgjwIa6CgjGzHJxbSyQzuVWvddO
         LV7ED7hX0Q4dlgPQPU6+087NUYQ+IFEkCbIVbNWgSKZ3WS6zcLlfSSnnISFSNGXnxD09
         MGz3r1mjQrkvWW3U/KbsaXhW01W/bj6h2KG9Sk4fgai9zyO7lEoABVpuanQmPWqlgbV0
         546A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829755; x=1795434555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
        b=Y3KF90Jcov3MS0qVBXNoNqHOj2/2gK02ZlwPG1hzWhyXHz/IUauGzAl6FYSLoI6HN1
         vELPb+2l3KBI/eKq/U4Rhva1yAW6e5pR9jmOjTIzsaKmLxRYVeuGIsBAsfuKJ4Emdklt
         EgBU8tMAf9QiuE27wH/BRML+2CD031IgC6YnIEZRD2GUOZSS+Y+GMNiIzHy9sRir0/ES
         /EYgPXFusmH/E0PHyU85xf8qXEHMd8IABprBvzeMik8Boddwdx3LGnwx8ohmaPAy1++n
         eJS3WHuw9tMTNwEVL0PmuVOK69zDIeDrNRfktJj7EQm5w9yEplSzL6X/QIRhOjOS6cJs
         mM5w==
X-Forwarded-Encrypted: i=1; AL+hErFLZFHy4g+4ve35cnCtP8bGac0QoFGpjhX/bkp/3d+m7iy30Ue1W3hZCs70hOcJA/2b4gVOk6jKQW4kuc3C@vger.kernel.org
X-Gm-Message-State: APuU4Z9nGt/2VrOeHvdaNXQP3CJYVm7Y9MbX/XpEFPJcE/y+6UZ9EwHw
	ZJCJ/G8VSXFKzfD0ta3N74dX8G+mREQItcXqrHNm1HFyUk+HMzTAFvTKkFtM89RaFTBY0lRWlHW
	LBoXz5rrxofEr8fmvMxNOEGTkwCKtgcMK5QR1Ntb/wlQEnkGBsamBs3Nf3ucgYC7uKsAg
X-Gm-Gg: AZFdTZcUpXZH6DHMQSa3XeFuTgn58zHCbFMdkxDvV0EgODmgCZzFUwqc5gsGw0z1GUP
	wX1e6L6aWA09LHj6f0B6BpHWy9IZeRDPhlvOfkPFRPxvVH7Zvg4MKwds/KLf92segJyezPTTKe4
	qjnZUR0k/8KIO0uZ3DiLk/h7QThgWydsJoYk9qlV5XKh6aIlSNnw7C/oc/nQ2cqoePiE+6gnHB8
	Sl7RX3QSyB4rxAZvfM5Tced6kj1Tff77uP0zkxDM55WXYMpxloaQROp+IzWChFlrwnvpo+T7+od
	CS3eO5W9kXuXV4aZKuLC9CVUscC1y+d25mJ5ZHSbCVYVu2ufXnsjO15SU+/KBn4uwXtSfTu3oc8
	C+/PxlAz87J3HHSHf9DZROj9F3hZdRyZHmpBsODpjp+zz6s6VtgomoXEFBWe7ml2TiQhEhZd9HG
	Zr
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr8694957eec.30.1794829755166;
        Mon, 16 Nov 2026 03:49:15 -0800 (PST)
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr8694933eec.30.1794829754617;
        Mon, 16 Nov 2026 03:49:14 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:14 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:16:39 +0530
Message-ID: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afaedbc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX29ny06tcYhlP
 d65T4f9etbVOBO8vnNniHUAjafwJAq78d7YaynuhH3fXy78xtlhTE2cTTQ76RmiRlgALBnbJsmS
 AG9VRlUfUqGs2eaHVOh0Zx1JJUVot+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX0gZ3uoci2h9J
 elBudFO+VBQWK3sHjzE0On1gEL/6f68BiGkJr84rwdCatV0I6LA3DdYH8hF9PP/dW9fx9QmyS0t
 AV8MCsjCDseIIOuFHYe4Mii63shFEaXVrhcLBjODkXTVdmPOarnTFLZQJrJEh2kSUUBDJhWpcHv
 8w1EBN1XXNufyGlJE6jSU6yaYK2zJbVagk3AA7wd0pyxo6NNvhH7yP0hozPiR/BvPFJ5TcpO6Mu
 k/KJzNrIvBQ30Q1qe7yKlNyfs7b0htqQsORAKMYcFrAeiK2y3G6sOXzc4Up3hQuenlirvc042ZX
 fwkhha+ymwRSTJtLYwKLP6UX8PC5TqccstpPWnb7/I3HOp9BF+Ezha06e8IGbvyi5jZHHy5DZwR
 pQWKic1u7fEc3UVOpQYeQEezaYDn1Bu1nZSv4aN+kYM2ACyOVH1fpWSXue1xNpIz1IlXn+W5h/p
 DF0gemt876rBlsVd2Jg==
X-Proofpoint-GUID: fTEbOpw3ezsaeJI_FQm8DXR0KQ4qzzJz
X-Proofpoint-ORIG-GUID: fTEbOpw3ezsaeJI_FQm8DXR0KQ4qzzJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

This change wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [1]. This v2 splits the change in
two and addresses review from Dmitry Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

[1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)
---
base-commit: 87d33c3916a82e38eedec53f4afcf2c620add47c
change-id: 20261116-talos-lyra-cypd6129-v2

Best regards,
--
Akash Kumar <akakum@qti.qualcomm.com>
-- 
2.43.0

