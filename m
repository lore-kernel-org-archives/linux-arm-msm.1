Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE03CB8F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182495; cv=none; b=eek4DKIRtF7M+TL4CYBfV0mfM0JXiqs6cxFlOWXAIAp427+BgkwV5tuEG7/QURX+7/CakCwg+IMlstDWm1fWfY50hIPhja7tx1LqL5hqqPktU3TxR2tCqeqED6OxnWymT6c2fRPHlEsPlMBSqSjO2w0wy9yo+NbUHC9WSSwneTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182495; c=relaxed/simple;
	bh=R1WXsTMJJLSMOhTtQRmHVYlRDt2B4e1V+UNbQmiKheA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGMozN8zbKAwjMeNPzGkcmTYsiMxSAoKNkzw9vc3j6SLjpRUTCEKa1rTsS+AkgupDjwCs616rBVN9EtqDyMbBTOMs6NfaiaXgPMUWKtp2ywgDw6Gk+tzbHLfytY1o7mSRkG9VMOJdCiuZGge+P6w9QCHOnpKZ+0HhRXcJdM39tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2LzK6v4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epWga/KA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2LzK6v4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epWga/KA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC9A8200925
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7JTgPehYs9SdIexPCKytrsSob2r/B9u/xq0M2IcFQE=; b=a2LzK6v45RnvnYRm
	sZfKvd+aD6awfA+Nty+bkpjtV3+u5nR5PbG9dtPPCg3lfvFg2bun1L7qhOHMFsED
	GoDiiG/tVgTX3gdDi8QprfN7D/vWl8SkIccQyGrV7QfvYFtD6EHEApR6zSCVOwA5
	cGbN5X0xdoBnQvab4rmPhDCFtq3iZ3X4zRIrJuKfczMoke5cHW18kiaXQedtxqPC
	u7seSc2iL5I9twZ237VeNdFm9jS4pLF7l6frOixr8wugBGHYjBLjgF+pxFKrRqXs
	BKE1D20VeCR3x8/6jS85AOfZcI5ka6iR0j9D2XYIXNZQB9phJZscbwKEm/Me7/nU
	fgQSJw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2jxah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c2bcc78abfso2800428e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785182492; x=1785787292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7JTgPehYs9SdIexPCKytrsSob2r/B9u/xq0M2IcFQE=;
        b=epWga/KADOzoe8JnPPvIHZWjS+lsqz91CLvmU6zUjuxNNFJbm+sRuGYw2P0AO6s3Pg
         Q6guek01QC+FJHyEkgkygXp4jU6SlGmQY5MqNZnfYIULVuEiS7jRwMEjz/TrvDIQnr35
         VQWGuj5wQIWSROlhdRL8tZsFDYrsxl192qT0NRuyK17pXmPskS+kuuV8JQhXaRbm526v
         ZAUKlsR4e49RyTVyJRC+942dkhzlTPnaLdOhfhIBr3GnXwqxSL3C4Jtxw1OydY+E95Ef
         IiJSLyxv5cEK8oT++9uqbPZyTcfmS8kW+Nh1N6P7l7prIKV5wGQ9+KJfyONIhNPbYw/D
         1+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182492; x=1785787292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7JTgPehYs9SdIexPCKytrsSob2r/B9u/xq0M2IcFQE=;
        b=I6fti0YyPxUGUud/gA+nWyHME7ma9Dv7VO320CzZSsYIchfigzNPDpX/zhI8wnwWY+
         BI+wJrb1CxFYuf4tum8JKGnogr7bni3ebCse47bpjQdOGFsWfjFVrEVRZ8DEBJsHX2Ij
         TeCJv4Fbb0uflOcPzqSo+Gk3AoCAENYypAtNL8+tjHsTrnnhKQHGnzrqxRhVdv4cXOaY
         jPftlxVn5wT/EVFmuR+5P9hU9PGlPOfboO8GAvjwsRDz1wJ4IAec8iVzokAp/4XRR6TS
         8+lr1g+cz2Cwj+SKYheZrpLJaPZyPi99B+b59sUwR1JxeCDKV0Ck18s/g3+9vJDyoyXC
         Klzw==
X-Forwarded-Encrypted: i=1; AHgh+RpgGDOi3/dmLuSpOIDQe8HjFvIKDDwOgF91UfjTsPMnJDEjuhJcrZRVUZo5cAI4Y5xSzp+YzMo138N0Q0Vy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzme/Ap8Iv3gbQWjLzutBFoCI2R/IALZxL9APfXsFdw+dWL7aFJ
	ckzdqCF4r6ZesTnq7Pw4Pw+0r6C5ELJSuJBT0OyZYR+sDjmzoCgkchWg8qqgeh9zpIyhHJ2S8AW
	dCrcl8f2wAc+uXrsKr4NOFcXG+IhjM87dihdg2HxxRIw1fOGTar7tYXnq4+/yEPo8P5HP
X-Gm-Gg: AR+sD133zzobcE/uvOkGVjxjWFFlulmMfIU4bP46V5QDU/hHzMsyixBGw+tE0oBktUJ
	36ra12htiqK41XV9C7yallu9KdodSe6J4zsJHYTjydFbhOFbzadfaJA1zhN6PB/JmnkY4GN+GLl
	y2t43KoM2indyCrJPS+Gt1Nxo99uvSXfyWQy4in1PiNGMPsZGXtP/MRlNWxWvJivMQIZeinJE8f
	iZnB8EhV6ZEV1ZnPXbllJiYAdBglPwSq6uqQypKGMltBSOknCF1nKVZBtTptCDeKUpoGdYBD7pv
	DujQGq5TKgbObZ/aQbgggK2x8PBoNbMqiM/Y69LaoIi3B+HQYqAqrO5KSlC7EdbMv1dIJZIn2ds
	n3LUtIJmLmMK/Vz5JGJkyAW3h
X-Received: by 2002:a05:6122:c91:b0:5c1:1c9c:c2a7 with SMTP id 71dfb90a1353d-5c338664bb5mr654799e0c.1.1785182491794;
        Mon, 27 Jul 2026 13:01:31 -0700 (PDT)
X-Received: by 2002:a05:6122:c91:b0:5c1:1c9c:c2a7 with SMTP id 71dfb90a1353d-5c338664bb5mr654746e0c.1.1785182491366;
        Mon, 27 Jul 2026 13:01:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a91ebsm17923935e9.3.2026.07.27.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:01:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:01:21 +0200
Subject: [PATCH v2 2/3] irqchip/qcom: Add defaults for desired SoC drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-irqchip-qcom-defaults-v2-2-466f3c407937@oss.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1WXsTMJJLSMOhTtQRmHVYlRDt2B4e1V+UNbQmiKheA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ7kTGFmOUg6NT3sYFbM/BoXsASa/HKvkW1ILf
 sm0Pj32CFSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCame5EwAKCRDBN2bmhouD
 19nFEACFJIe3u4TL/N6H6gS3U+mhuoXwWT5BGj7R9tpA/Klf93ez0amxS8v9XKC0zNWDpwPckaU
 2QWlWYbxlAVesTpaB98Kg5czTSvTyMR4KesqNOnp8MTpp3oNH6YGt5pEyUTwbztVveoAIvD1+8X
 eQkeUBW4xNA3X5q9jksjqq47vOdL+UkCEXSeAFlPLvDAXPzgwJdesKScd1jCLCX7MH6//o5kQ60
 0n8++Ofa9dMdwVCeChjF46BKs+QAXe5VCQxo9TE02lnaXy9xAjQNDlQjyhiMm+Z2iCR3/xi+cPm
 UJUFBPev2OtqsITNVfmqZividg28bR/0n27kpAg4tIQ4VSDc2uifywSWfYa/Ox/TmOgCToNF1Qt
 /DBpT0t4J08McfJ5NoJ0UtBph/IT9Vptl/Sog4/+fMH+xgS0fc35Zv47ykbK8fQSSuSplVnAyY1
 SVKRER/Td5FiuKYgsrnhKtG2W5Of/dqMisvhA4FTv2pWharT/BlSqGWw6rro70eqpSgJwBavZDP
 zEJ+yNPqgah/O9ug0NyPGnAIweopr/HQ2H/IBadnI+SMxNGWJqNqyGtmz3cAfZxvx9isjPTayHk
 FIAvwyAkwfAs7t42Nttt0pgDt14oxM1xeEcmerKAwsdEk3pXKGNOx14bkdCRyOcppa+CicgAlwY
 a5GopTV9br6hEqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MCBTYWx0ZWRfX35VeSYFvWwPF
 23cHO1AQbJHEA0y/XKj2xaEKdVPZSYSIjUosXkceuTcuPsJ/aoQ86zdqcLxKdo3vtCCWOrfQzPz
 qLYxx9Etd8KGrFs6BLEz6eYL2xUWrJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MCBTYWx0ZWRfX6MiIWSumgvv0
 5HcSoKcSSRrIRPDpt0Wvt3isZB3LSvaxMecdOBCYhbqXfjq4exzxg4SvMV+tYrFdPi9WnPBMnpn
 ZAXXbZJBUxNp/KHWVaCfSzrXA4y47al1VtcTWYBA7LCNafMtGGFf4tTarpl1v54ILSz6SwVRTjH
 c1EH3wJ/5lc7cqFl4PzQmVR7H2pkkpDwZx1/tjPkzQhuKqimYOol0llZZnozTot3GnopxTe/iXf
 y2mptKeX3ujAHVz2L/B/+MKIFbrAPdpK3HaY7JvrIElogW6kXoL9rsL2XGb5HxjB0KnEgTQqP5D
 oLrMYjIk4XoNWdjoUgbDsJGaVC9ZqJm842yCLofQfoM/ncAc5sEHZRXIOOUmVAuH4uGhw0Vgs8A
 6VnKfN7m+j9xszxhuN7NNFIW4MIiDmUaFs2ime5PLyYk18TBDvXnWPcSeb+I7Mt4LAZowjmycyM
 ALRyjliscHO3pl68gMg==
X-Proofpoint-GUID: XzKBCcAlQ5830zXoPvuddEhzV5PU3Hsj
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a67b91c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BWlt3klZKUeuT-1Z3GkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: XzKBCcAlQ5830zXoPvuddEhzV5PU3Hsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270180

QCOM_PDC and QCOM_MPM are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Enable these by default whenever a kernel for Qualcomm SoC is built.
The change has no impact on arm64 defconfig, but will enable QCOM_PDC
for 32-bit ARM multi_v7_defconfig and qcom_defconfig, which is desired
because SDX55 uses it.

QCOM_MDM is used by 32-bit Qualcomm SoCs, but there is no in-tree user
of it, so it does not have to be enabled by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 5a881ddfa3ab..a8f8c423b795 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -524,6 +524,7 @@ config QCOM_PDC
 	tristate "Qualcomm PDC"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM
 	help
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
@@ -533,6 +534,7 @@ config QCOM_MPM
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM if ARM64
 	help
 	  MSM Power Manager driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.

-- 
2.53.0

