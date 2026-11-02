Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621471;
	b=180FUnv2EbzjBBwDNCSbC++tHUSbqmcG1VllumBMkroRSkWazro5WD11Fg6utipBMT96
	 UVFLsYTXzodQLAysBl0csypaICajcUbLYTyK/MJhfqP6b3Xg2gWMxOqwutK9LjyVs8wiZ
	 uA4/4VfmW2b0KB0CLeF1Gs15hhiiFefmVr94Z4fxU+vo9FcuZj+Dr2fdR/h5DxYZ8Sumj
	 wSheeCGFPP9UozAo0fy5/s2zP/N7e2/+Q1m2fOnGjvLYQKef0Su5INsieLUdi1ywxLB2e
	 i6N56wibc4L6lIwehVdcN6Weq5I5QyIlsP1Q+wY6oUtUwjF6+fIoWGO3UL3q+nTNJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pJgv040y1ZV2PqS3oGxhp53JQNq9XEa0Oz8iEOfvfj0=;
	b=UIfdvq7woDPITF3UnZzvU5vP8E2z9W+riTF5s9udl3R9koi1Je8aA2khrtqmkgT63CAA
	 vu5jF0wbr5iPL7NdwycfQ2hI8x/dKXfQvQ+aGk4xFXR4YrLeteBF2fm9Prq4gqGWcVsHN
	 aViDIOouBMe8hxoU6fZFNYgASQuTnBOMIiky7FjUSsCd1eVauBEtopQoqCyFgMv6XvHrR
	 x+63TwT7UC9Do9hBbPIiveA4IOlhN4w+HXJvs8U26d0Js968e3flUlngmxlAKqU2zn3Tk
	 C0fSnJi6Ndn3YG3cWVKcrSReGlRLFbBWuDqkMenukI6tcnfN6myw0uPxe0EjqkT7u9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=epKm3OYf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtKFxZnm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791AE60A5BCF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 791AE60A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=epKm3OYf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtKFxZnm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29APLX4039722
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJgv040y1ZV2PqS3oGxhp53JQNq9XEa0Oz8iEOfvfj0=; b=epKm3OYfHXaxCUJf
	YlZKT+OqqznL2ZnGt20ntzgn31sSO8Rejc7jdnrr6I7zytMkP4lCqfriZCBW0ZBD
	6TWW9DZpUOSE9rTA/Lv4eD+lEg4Gm0i1BTM+PoQ2THZXuIrEQOPGQXNgeNGPJ9kt
	ojrs7py7d4IlbxLXoApNyGyhpR20EC1+uUQ2CXLvrpZ1o2MFJclrFTpvAlGXtera
	Cc1qpzXfnNWb8ey0/Hsx6q8MSy6+shqitr4SZPYnMsu69IvFPBIFseuJuikFcO8w
	B2/UYzIr0gpo0c/3szvrxXeX8CBdVBmHa5vwMPQ+kzMXPlKvg9nYMuxPWFyUQmjO
	FmjPzA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph1921g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:11:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso2326437137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621469; x=1794226269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJgv040y1ZV2PqS3oGxhp53JQNq9XEa0Oz8iEOfvfj0=;
        b=CtKFxZnm1MOgeiiQ9fX7k74GiqBKvvQtebh56W0hWn7X5LNydrKgWGJcH0IkA+e+k4
         GAe9E6t4PMs2EswXDbiugBbC3lP+Kulzy0gcif+pmmazpMN8wTPCMj7+AUmqMGOLDhsu
         Q3gC1ono/vOwJO4tgZCG2VvHJI3xNh31w0kGleAJuiD/mNPGHKbDwAqn4EHHnJUKHhh4
         xf0gzRJumoNXLOtE0jtrU5PKFDvgRCA9Dlcv0Nc+EaWTiMZ1C4D2xSYA3Kjdvizx0XUh
         sPcqFySINJy62T0oON4CxxQpidLK8g+lO0LySeLbo9K3i9QV9sh0OzDplfC36erXtoE6
         ACSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621469; x=1794226269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJgv040y1ZV2PqS3oGxhp53JQNq9XEa0Oz8iEOfvfj0=;
        b=t1ZYK/vPI2+TZyudsDfcDFPhPn0Sw7Hg1fPVfEJ4UVzBEnCSy1i12x9SMMoaXySfkj
         4jtThgOl5DZhItvCo+HAyLarCOrju7HPoOnrAK3BUmPSeftOwlytEN64uo79euXdkAUz
         XtEtPKTrE90hOYNLargRC1EbxLJr5puDetWBeXpW1GiO3IDOYceuFGDA8Ow2+dAXKkeY
         SP/+6xEnpbiZfmLBPRni3H/w9/SadxOGALvb99O9Egixwr6zIOtgv0xbCHlXtcyMSraD
         52mQxhFzlZCREoQo8RrvLhkL2JqvdUuHh7NhG1O+rvINaGq6J6xOPN3KZjn1yhTtIfxz
         pNrg==
X-Gm-Message-State: APuU4Z802brvg4Cjb0KGRPX8EiflkSot+BB8IvhJ54QtiKDtVrMhe93J
	CaHrwKqkJZtGFyaBNi2I9uRXvOKcPHRK7EYxaW7hnL6nt6J9pp5FzCBNgPlVc65zVQtJ1KYnkTf
	RnHJFkRaebfbl6exrSqA72AKbkItwNufCZnPiYR429dVUoY+hqHZrx3bYm3/FZNnsqGoO
X-Gm-Gg: AYBFou1b17VZwAqfPREWg6TgZeOsPrGIhlqw5cH4M36ijgni++ivFqJVsKIKqOc/4Rl
	BRHkMgmUUmxr2mWo0YP+TqjX9ZmaZaWk2Pv1RGuMqv25Uz3F37GlybQDhU8+1BWWVEX8odTAVsz
	/WNqOf/eR400BexGLODj9fsLulKgr744Q5OpXpT9PiaOzDyrc2CSTLXCxQCb3mz0SVB3Q6xGuCW
	LBu/cLmYSyStnkfmrCDiKVCpQ0eq2bvOZd4nHBoS4zcSu2BrNGJVtw01lCHFhcOJTeP5u88VskG
	yjnNXYgYJ2LN4S5B0MfkJgBoTIdOTqpETdBiZdAssaIu9jtnMkci/sLrv6SGE6zmPcjyM8feOEz
	Wo3P3XD1aKWzR6kFHIy64kASxeKmPvJsCKIkw+1mBmTWCFNLLy8vxv8leag==
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d05432ac0amr3935519137.33.1793621468678;
        Mon, 02 Nov 2026 04:11:08 -0800 (PST)
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d05432ac0amr3935502137.33.1793621467975;
        Mon, 02 Nov 2026 04:11:07 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:07 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:50 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-4-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O3SUqRXhSc6SLdBXeEEQGlCcfMh8D56njkYIF3NM4/g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3S7A+JyTqUkxWcushtf0UZ4KMTGd1UvoDb+
 HFHjJZf/fmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh90gAKCRAbX0TJAJUV
 VlcvD/9idD+l01iPHC0S1gs9wFMI8atp+8wss4HKRs9cA1NShHyrMwhwV49vzJrCtGy0CK6dYn5
 PLDnXrZgIzRbnLBOKhMnUhWaEhMan5GtadjgsnMcdY9so95eV16f6pQwNL4TgynJ9Xd3v2etFCe
 MHRWKHWNA4ErS3mZTYcGB0QVUDheZrFX8u3b92jGuZIf5o/Mc5peFaOab5U5CcPtb1yX9GBbUvV
 nhFqYs0QSPoISMdDu6jYLRwf5eqnTSMiRpIIXpejikjYvCvPzC+qQcl5PRx0EB4+e3/wBcWWhiy
 6b2G01EdnoI9l0glZ4IGpJqsXuuLBnkUd/WoQh5+icOKur/JRDF/oReY7srN0T/rbFWcrXRJX0A
 KqqmOVjwfbpI++r5xLUpa4PLJkDeXYV2jIpfI0ZgpsvNhMb0cYTewH0wqQfMb2/XMXlDZ9eu103
 gKVfgGFE2wOMAZzE/hGBHacvAe9FHE5/vfi4QRGtW8beIJC4EX6+oVPKzeTDQGig4ZiYdaVnDY+
 rbzIN8YGRB7mAek/iI2zlgJrO51XQD3AM8eYwBz4um/Hv0FT6/3XKG1/1g3X7dRVqKERP6uBYbE
 jgre5cbib7tdhwDOfB5emlpqmG4bbMNT1s1NW7MkqQ83X8M/WE5Mbtgpq6smVYkJzmtKdsUeoP/
 Ztmbfjvl+6GGBjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: fNYWAck9P55VGmLgUXzu6QesDsTr9Ll8
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae87ddd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6fBh89nGgyq2_RNJhAEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: fNYWAck9P55VGmLgUXzu6QesDsTr9Ll8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX5265DwCVinQ7
 2WBdTtzYspmIF2Mj+py/qeDjQEjhAN1PYeAsFlUFCkdrlIAp7EptwMv+nGocSeHp0XLg8OMovy4
 qIYUN87nmgfpMoVnIHN5sQMA71rV/gT/MTCVmaplSfcQ0aZZ81SHWz595Wu4bszE7+QqO/3QU8Q
 0bwmYyHZemibroEz/ZbLvym8OJV27gsQa+VYg1culzxW7jfuukXZ9SaOdNadNo2h08Jy0gHW/tN
 FptZe1/laLo9g1VkxAKoz6A+LvTyrpd8FAu4FcfqsiVFm8WTB6qLqkrhYr9N3nQaRRfhP0BVFW4
 vTRI31gHmST3XxlsPvHCuR3Ton2W/Dw7TjAmE/nqEMBxv3KkMs5PM6iYHvJid1fI1R5L01zPRU0
 8DC0JFkoS1uvomXnAo6Kh3yvygX3Rl2kooMoq7ds+jIxQaJNVvOFiMstcKtICNNfwws/o0sTK1R
 A7GLpI/lkN2N5KGAEkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXx9KA5/RBzVRi
 4Ih34KSDbbZjaoqrMI3DSy4WuRaWjsglQ/dNXralL4O6mO9T1lQEjf831J+EO3cBd0nAKAKvvKN
 Utl63J4FcbvshJ66wUccaQbFsykwwO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The Eliza CQS SoM is also available with UFS storage instead of eMMC,
but the existing description covers only the eMMC-equipped SoM and its
EVK assembly. The UFS SoM uses the UFS controller and PHY instead of
SDHCI, and its vreg_l1d supply needs a 1.14-1.26 V constraint instead
of 1.8 V. These differences are on the SoM; both variants use the same
EVK carrier.

Describe the UFS controller, PHY supplies and reset GPIO in a dedicated
SoM include, along with the variant-specific vreg_l1d voltage constraint.
Include eliza-cqs-som.dtsi for the shared hardware so neither storage
variant duplicates it or inherits the other's storage configuration.

Describe the UFS-equipped EVK assembly by combining the UFS SoM include
with the shared Eliza EVK carrier description. Give it a separate DTB
and the UFS-specific compatible strings so it can be selected for the
corresponding SoM.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts  | 18 +++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi | 29 +++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1a06b321db20..988e0c10b514 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..41239874ee82
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (UFS)";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
new file mode 100644
index 000000000000..7e99d273fd81
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "eliza-cqs-som.dtsi"
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&vreg_l1d {
+	regulator-min-microvolt = <1140000>;
+	regulator-max-microvolt = <1260000>;
+};

-- 
2.54.0

