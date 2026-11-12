Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458190;
	b=IgNpT9DrDyys60orR3ZVI+EkHEq341yphiRltcHjDg5dibyLjrnpvegqiYUrR0NbBg37
	 dPdpUXVfa8DzdG2gWI43iR+WEfNBiiHt5CZffC9HzM1SEESJAmFBSEix49NQZjncjSlKs
	 zg77bq0pwzeQBN6TdxhFridWiyxKrQo9j9NoMD1LJVcI3IpGuBRC9nkisbfzqu8YjPZHB
	 ILeyNKNqPi2FB4DPD3inHHE/VAlVYVext0mmPjtc4elHc0fUa9wjv5u6XeuhD9JsamsBE
	 RT1/pIPb/cgdQOLtNwSnGg/xPVfeLI2LCGePlF1yQoOJC4A2lqKUOivMutYqUFsVSaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
	b=mScRSq+Ble/cBqNsAlzmbmQAZC/EF084rNkUshTKYA4kK4K0FWXMxyTXV4KUdR727G43
	 rHmq3mNv0PnAXYBl3cc56mo5oaGHTlp6XVUwKsT10J9tuxTRL6Pun4ry5DzUtfDeo12z8
	 FMoH7EctgaHBLgDIbAdqIi1YJFwK/7ogjYQCQat8OzlJ6BYnob/yGBoKyEUVrAKpMAiO6
	 OFZAcHuejx+S4C+P3gYfm60IvcvxZ4RsPkZfQ9RFXECc+xYjxku2t/y4rklt0WGxHWU8z
	 CcSgWQ420MhLY7yALn/w8I3zlw0//P63a0bP5FilK7NPkYEV1MC3GIQCxBZIGa0IxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns+d5HWL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P74aSqQc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6AC606A334
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6AC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns+d5HWL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P74aSqQc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZZk3022565
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lyC5qj4Ry53YUg++hgJJ/B
	hVmj+JSw6oRJbx5/GvGnQ=; b=ns+d5HWLXtp1kuxb4QbwAYmVXKAzLeXlKBB2Cd
	b49/K3RSx2v2/RodiYVAfrXSS5fXrncu+KnUNVpy94fsKw9UGqyWD2qrbYXWueXX
	u/5ImCYAXWZe70Izjd+LpOSpvpjdhL9FZCBsmqF7HplxtL1jWJpVMqLjcdwch4a9
	wX0x8MpkU9wFhkJmxM2tY2vETOWVSTlxF2jceZoM2cgN5fEGXuoYDk1s6ED5tfaI
	aqdCKSuKPSQD7CP1xAtxOgl4nU43yMpcgIs1oo/DuV8ttoYq5RpT5P6W9YauplAB
	st851Be2ck+T8YyCBNx16VlH05XBqcrYEux1NDONIwvPyB2Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdn9wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so391153eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458188; x=1795062988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
        b=P74aSqQcJcrIy/etpHrTn1Pez41gErW7sTU/PjXFz/GUIS9WIKgY/UW7ezvge32nwi
         O4Hxz1SkSP5fjYQsnEWNyVFMQMwepDl7hfDvi0teSmeRiovSB2wtCm8AOEFJSEYvf0rH
         uxBIRXRD/0F3ZtssWtknzwjibEGz9pbl9Zf9hCB1bACU9T9fDzlNDOgR+VKm/RUnztX4
         vIdqLzxvOhhtPEexadRTDWo1CKEiddZ/GCsEdV/uDGiwlYVP9Xnc/k2rMNydGZJ8JuUI
         lNYWToZFoi+mQV5vg8LO+APmKeFl0lAEe4meMds/ax2IrNMkk3wGtABsuzUQM7VeyKgc
         kaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458188; x=1795062988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
        b=toeYiQf4XpUFWTqDUCF1J3Hd3/evSNWoLW9EozwVkMf55JPg9DcOT3mRyAjjJlzbCI
         +36h8cxbymaDwxBD7KlIxosdKjC30sgDloxUY6YEfn7XUns0ZLke7Z3I/m0Id4Wt7iLa
         B/Hvw2tfzSVlBubWAUTSA07wKCULHWcyaOyLAYxFb9YExc0jOq8GM3/79gFutD5K9fsr
         ePLbN+kAbVlNFeh8c+gr7pxgROd2JUikKQYA8ZI2pnPbnYIdc4OuplDQOVpWbsQIjFMT
         oMQNc7vzM+OQVN5E1pdG2GRJS7lsXSXL9gjcBZSX5bJjlsY5rHdQShEB6td+QRaIDDsN
         MttA==
X-Gm-Message-State: APuU4Z/gRxsuPjNXHgHbsEJ6zJaLn1jzqdBH0896gh1rAoQMQksNcgxk
	EzQ0X1kHj0obIF+Dvu6vGyJ5mA+ow8Ezho8x/QW2Ic2EJH5dpIwH5EUDBNTmk4LxbHG46olgRag
	pU5qqwW9bZhGDR1zklJzSMxBk4vTUvtTH9nmQUqxAnX9ET3OS45v4wATXfmkKoVi0/inetsQz5k
	1S
X-Gm-Gg: AYBFou0YJMB3BK+Q4yuVqFtrb8ByN9YqZCLNxsmnqz9XYS9EFIvqSL2TnyRelIQAQoQ
	bfU1ihyf/KsSFPGQ7TQRiamI6oBsxepv5nU00yHS41rkoMcmNceymKxJK+DS+dU5hzeH34jCMai
	PkAbOlPgBGb+ofVlyARD+1K0rIFMElDxkWcLpzgWzcmLrx7teWLKIppH5X6N/eu4H5lLymf5ZYP
	YP0sDwk7K0NBjVyMPz4Cg1pb/sQj7W6v2FCAgQJkV2FTQfS9X1QSucnA+sJ5ZVmz9TNA2P9bM5S
	HEyprayUqL8JOIhiVKSgUCLsL4wAd+Ac6Og8zleENBzVG5Ulfy038zv+ihwxxmi02PKSG7Ee+1q
	xYrfjqSdcx001S6FPp6wpLVFAb5h3TNDXCyeX6N+uj0R9qh+QhlyqaMNd5BOPQy9AnOMi4iM7n5
	RPq5uNC/Qimdr8PCK4MceeyQUV2DaqXpxPgJmd/506EcEGthrjwNc3jVIQcs1PG04TqYCuJxBsQ
	QVYOa4=
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr1291794eec.3.1794458187963;
        Wed, 11 Nov 2026 20:36:27 -0800 (PST)
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr1291758eec.3.1794458187208;
        Wed, 11 Nov 2026 20:36:27 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:26 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 00/11] Enable mutliple peripherals in IPQ5210
Date: Thu, 12 Nov 2026 10:06:19 +0530
Message-Id: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAENC9WoC/42T226bQBCGX8XiuoNm9oxVVX2PKBd7IqGOoWEJj
 R353buQBiPVSL4AdoHv25n94aNIsW9iKva7j6KPY5Oars2T6tuu8M+2fYrQhDwvGDKFGhWggTA
 kiIajc0x7zVyRX/7dx7p5n0UPj5/zPr6+Zd/webNwNkXw3fHYDPtdG98HmJxEhBN/jCnZebX97
 vv8AIlD4z2MDBCoUo5RFZn09LNLqXx9sy+TrMynHzcFqEiikYxMSYIRFxoIRtvbkI9fti3bfD3
 Z1rZ3Cglz7337BCNlkzZSGrTGCVPfKyCUVIlcWak140IBg0N/PqXz0NXloTu/dH/Sobm7HEZ5g
 +K0QQQ81NbUXHAf3Q3BFMlzk4auP81RjzRn8i9V/ZVq7gyh9tGwSMIHCv+pZtPIVjTJhZ6Scqj
 QKRORSbVB8xXN+ELnEaAW0RGnmhu2QYs1LRY6j0DJqMhSTr7GDVpe6WrVd+4BpBFRWifRiS1aL
 fT8MXzRatq1yovojVIimA1ar2hiC52rAK1d4EGZYOTW2uZK0/U/HHMVECoSSJWUyKsb9OVy+Qu
 AkZhK6AMAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af5424c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RaWcFzTeoJQvQ5yBV20A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: zwyUSd7YKWgikpS_KRThqaJF6E-kSrkF
X-Proofpoint-GUID: zwyUSd7YKWgikpS_KRThqaJF6E-kSrkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX4CGfEzUh5RBs
 TR9upJKwzXn5ClvQCx4gq3vid2+sXbD9uwWb8JqTD3jemDusshHSQuc4T7j6ywGFPxorWLn8fha
 XLOam1KpSz1F+QNfXlXZ+sOhnIurK4mcE3z4MdcpyoVkElPpxaUcLSKakauIWBzmwVoh/h+WV5r
 DZNrxggW+EYyUDk0ifa5sGVWkydU6/HTSz9sjvboABZqnPphTjCKKo+uHGBe8MDIHN+kzDJ1gT5
 1lMNUBQIexeffnghW6y87ku4ArTN0IhI1lomPmeCaPpDbuRlyvYFDZrMWF2aBZo4ogHkON3mY7G
 +hgMzfqOuPTSeJtwiTroQfugyjxDllu6I7/b0c9Mldw6VBsTVnH7cLQINDCVi8mForEHY4YAt/c
 2RwkjL+1H9+d4KbqHirzmXETKe0Emw0yNgpJTuJbcKz2k61ea1V2gxao2rnQsyj8648al/aQl8f
 Zb1IhNQJ4jK9mahEr1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX3yR62oNETcmB
 HSEqerKpOJD5933pUS+EqGfAU5bBzDIml2flg8x5OCqFnp8mAdqzEnRXHM0S0b+yhTLbNy5XnVi
 wHjqCgH5nqxJG2d9LduQUzyCnIlf6qI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

This set of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v9:
- Rebase to next-20261110 and include merged changes from [1]
- Add qcom,ice = <&sdhc_ice>; to mmc@7804000 node
- Add qcom,ipq5210-inline-crypto-engine change to dependencies to avoid
  dtb validation failure from sashiko
- Link to v8: https://lore.kernel.org/r/20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com
  1 - https://lore.kernel.org/all/20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com/

Changes in v8:
- Fix pcie0 & pcie1 nodes' ranges property
- s/wps/WPS/
- s/cpu-sleep-c3/cpu-sleep-0/
- Moved ICE out from sdhci to a separate node
- Keep pwm@1941010 enabled
- Combine i2c pin defines into one node
- Add opp tables fro spi and i2c
- Pick R-b
- Link to v7: https://lore.kernel.org/r/20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com

Changes in v7:
- In 'Add nodes for multiple peripherals' patch (it has R-B Konrad)
	* Reduce critical temperature by about five degrees per recent
	  calibration updates
	* Fix placement of 'efuse@a4000' node
- Move 'spi-{rx,tx}-bus-width = 4' to rdp504-common.dtsi instead of
  rdp504-nand.dts
- Change 'reg' details in spi@1a80000 from 32 to 64 bit
- Add #address-cells = <1>; and #size-cells = <0>; to spi0 & spi1 nodes
- Fix incorrect placement of rng@4c3000 node
- Link to v6: https://lore.kernel.org/r/20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com

Changes in v6:
- Didn't touch the existing patch as it has R-b
- Add DT changes to enable more devices. Not sure if these can be squashed
  into a single patch. Please let me know, will squash if that is
  preferrable. Following were added
	Random number generator
	SPI node definitions
	I2C definitions
	PWM block
	Download mode support
	ICE support for sdhci
	C3 CPU idle state
	Support for WPS button
- New compatibles used are documented in
	https://lore.kernel.org/linux-arm-msm/20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com/
	https://lore.kernel.org/linux-arm-msm/20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com/
- Link to v5: https://lore.kernel.org/r/20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com

Changes in v5:
- Pick one R-b Konrad
- Do not remove ipq5210-rdp504.dtb from arch/arm64/boot/dts/qcom/Makefile
  and add it in a subsequent patch. Instead, move the ipq5210-rdp504.dts
  nodes to ipq5210-rdp504.dtb-common.dtsi and include common dtsi in rdp504
  dts file and introduce rdp504-nand dts in the 3rd patch
- No code changes
- Link to v4: https://lore.kernel.org/r/20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com

Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (11):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file
      arm64: dts: qcom: ipq5210: Add support for WPS button
      arm64: dts: qcom: ipq5210: Add C3 CPU idle state
      arm64: dts: qcom: ipq5210: Add ICE support to SDHCI
      arm64: dts: qcom: ipq5210: Enable download mode support
      arm64: dts: qcom: ipq5210: Enable the PWM block
      arm64: dts: qcom: ipq5210: Add I2C nodes
      arm64: dts: qcom: ipq5210: Add SPI node definitions
      arm64: dts: qcom: ipq5210: Add random number generator node

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 276 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  77 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 752 ++++++++++++++++++++-
 5 files changed, 1043 insertions(+), 81 deletions(-)
---
base-commit: 827b0a511f329ad072f0f689407b3595a104cdf1
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
prerequisite-patch-id: 08aa18faecd4f3588cfd01f3330eadb1a76dcd13
prerequisite-message-id: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
prerequisite-patch-id: 72e661bc72d8535e1dabc144e81978bc5161c3f5
prerequisite-message-id: <20261021-ice-v2-1-3dfa8f343ceb@oss.qualcomm.com>
prerequisite-patch-id: e6cdcf2043620e898c6dc3a5c266678a2b08137b

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

