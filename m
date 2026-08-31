Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E7560AD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184061; cv=none; b=Cn8RMbrsOj6RPTYef4r7YitPMz44nWoWRo2KtGN3Z4SWe1erRoSVJJC3jVmQSsYSRcC8LXka+UjNH8nojAJ5Fg1Q8J5+FgBb9bYIZ8ETZ0gB6Dw30DuYpWig5gibfYJT+q+UbFLX5sJtCVJPbnVm5mC0mepB2oluzXHmHhfS/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184061; c=relaxed/simple;
	bh=/nO0Cpff0yx61nS6yN0kn4Y/CRuWwctaTI+ET6wFJi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9fYudzGqU/m08HjUlQ1WKKCPiNFWZR1gqTnbpHKTMze7UQ14Uc7Mni1MjquqY8k5XFM+MtiZ7pBlQFlE++32ekCaklnrnVQqj3RSBd+P4nF507J4GzNC99Ig0fIk0zauvJ+7HxxjcNeiquhr1SJA3qYQbH28YMt2n2FNexs3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imywTNVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQdVjos6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imywTNVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQdVjos6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAKuK3600894
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ElUpCCZ5QXQFa0YF2BRx6zqlfZx9TQTRG0x
	3mmrf68k=; b=imywTNVq9ISTGUdJzE1fuV72RCsBezqjlN2xM4Bk0y2ft1ixezh
	D2hnPIYrrAdQ+ehwJCgyzE+22cCvT3cfs+hz7bFeCt9ast9pIQZmvG0jwT5bRSnI
	KfRa/m6fV5SF+K886S5JGZuSKGa4u8G/DY5SE/6q09VIYihCIb0C218uFJvRD5Ao
	syij61uoc4BI/9TaV+7I5Kj9IcwRF5GQqBmLUv/d3SWxci3ZNkM0l9gO1sIUlKp3
	7ZSBbIiI2f4C+eGc3PwmZngNGwf+Z2bOsRN35mGdsn9oE7Xd3z/uqN3S3VpAHZpy
	WxTsGn/EarfR7no41Wo9oc1x5kiZhidzD3g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgh62e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:47:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso5912307a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788184056; x=1788788856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElUpCCZ5QXQFa0YF2BRx6zqlfZx9TQTRG0x3mmrf68k=;
        b=jQdVjos6q0iYT8QniMZGzqbEb+yWglYeMOcBwJWsrykncHG5XkDjj5xUgNilxmXbkp
         UV9kJM06oFqLeshsCDpo7rAdudFSRuhZxFK2+trPjaZcJWj0Ao9t+DBSLWEQ/1EWEy//
         AX95RXcaqVcAJQUh9dx7Uz50T0yLptG11t0Dt2NtakRn9SiEccvXxCIICpYBykyVI6bc
         6V+VCrkNzeUHgbbGwvh/OpYK6fNZyjzOUHB7W9GNcO0vzNYzuBjGZYJ2iPnRI6iRLZ5F
         aSph99yADWDxXWGXMVQeX2OMEK799Rwy9IumtCKn1ice3+ewcjmraqiijgdmSyjC+xOi
         140w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184056; x=1788788856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElUpCCZ5QXQFa0YF2BRx6zqlfZx9TQTRG0x3mmrf68k=;
        b=ZeSvBpRBlDwyxjLJQiz3sZkXQUWhduQmBSaSqE3bTRLu7u79t2R+CnWErSz8qDMt/a
         i4OeQgt6+CG/ADeHju0giHSEV66rJ0R+YUKDWa/zcpEyez5bVzFYtPJ3Qjusd9AML+Hs
         NOSgK7VhjXRVLJncdGLGusE5dk3O+PMdsHQF3OTiKnsBRr7+drg/4CSl9qzx9FIyYzH1
         Cg4QAmshJCjEGcjS3tNy6J74dP9D37Es8fmanYuBxBHudxhnIZEZg4CbuMxrFJzMVreZ
         7U6AZAf2wdUj0nL+LunhpDu69IJhetffEMx3wL9G5Jlc9ZRaC89mPTVnF1ufCuAC04Sl
         mLlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1bgTmEZuJ6uTfcdptX+kF6I7R9RdQ9b9mNHodJNQ510ta3ev3xfysbqYWqkhYYZOD635gWoo2e3+Zi7ME@vger.kernel.org
X-Gm-Message-State: AFuF++m4wMUZlRm5lBl65QQ9BPepay26ZjABYcbZlVIAMbF0F/QqSsfl
	RkwX2lp26w/Cpb1/eRCaZlcrjA4iLmkowNZkTV4+iP3EurvV29hPKyVL8W6MBcVNLgoAKN5vvBY
	mNqJjCA0tBxLRxQNXjAJ/YKrwoYzXM5dJOpkUwdHvvuqrANhBWq5sEkOY/b4jxnW2uEGg
X-Gm-Gg: AR+sD11lCcdaOZT7owfQTj9eOsurs2grHlP2k4AXO7VwvP1u9dx6i6IXujHq5L0s3Lu
	fzqPP5SdnIBYNVaqoVG7kmP35WKaNHozZpAw61ri1cC2kXpXOibtMs/+vg35K+gulKrZiH7LT3W
	cA2H65IlTS3no06wWb8xAIdFaw43g8xHveeRUAhUAZCyaUqjHPgEui0v2BvuXRXkjsQ0SfCmWW4
	OKb7rFiKrxnK5V/CPlbFNcfR7GaliDbPRBVyFOcT5L+RLJ1p4zwSwghisYzMbFTsbR2RbIBE812
	GdE2ouxumrYHcRWEePQfSTVWdwCvTR2oNrY5gqhxeWAwSxjIx9PbOQ9YAEUmWWJQGnBxYn4+i4I
	Te+oiPquuPbM+e26TOrmqY8wfUjdr7UG7eapuDYpn2fX9KjlOXji7FbfV3Fcr
X-Received: by 2002:a05:6a20:a123:b0:3d0:d0ed:f141 with SMTP id adf61e73a8af0-3d265329781mr43053618637.2.1788184056238;
        Mon, 31 Aug 2026 06:47:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3d0:d0ed:f141 with SMTP id adf61e73a8af0-3d265329781mr43053539637.2.1788184055698;
        Mon, 31 Aug 2026 06:47:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm36548784eec.16.2026.08.31.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:47:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: Sort Nord clock driver entries in Kconfig
Date: Mon, 31 Aug 2026 21:47:17 +0800
Message-ID: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4WdsEbekvEfe3UvUqusrRSdn7P_tzdjz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExOSBTYWx0ZWRfXz25cGFo0Xnh/
 w8TQa1zChfzxbV35yeS9iPJVWiRR40L025PgtolR26s7nJ4aiidwyZ5kDnSIfWrEgBMw22oUpca
 PcpTcDMepv52x8gpYqvTeqn3T432Ktg=
X-Proofpoint-ORIG-GUID: 4WdsEbekvEfe3UvUqusrRSdn7P_tzdjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExOSBTYWx0ZWRfX+lNaolQuuQKq
 FdL3d+BMxEM6qtlkLnKAdvDW/POMem5A6AVZOgmLGinw/JIM4OpVqB5i4+nEuDB2RvzoxbfiWA4
 GmCjdyHCisvi7WhjXA+GjEArhaBzI/1VvDORg85A5uY3r/YvdpQjsutTmBBr9F39FmOLBc+DcR0
 C30IkyjoEy8QKZd3RY2UQmApWGkO4J+rv/nKAi+XIqYonWo4Paji3x5chi9NJTqtFPwJQmWqnhW
 EtFHZfXw8r8weeR49dtiFO2BzwbfvCXZ1IceFkKW5cQ5xR2QGmALXTKp4W16lvAo6BHzhCu6IM3
 6fghJyFggIZajM49Gs7xIPui3nI/WZK3fuJ6SsveYa+PvOJDIHCpCy/yw8WT0eyO+zusXtqI4Jf
 k9WZlKTsHFBd/2cyZWRmIhV36O0p7yVKjZay+5toS5pgXJ72F98UzuGNV7yac1zZsGjQOYph2ub
 T0noo2Xhbj1PG4XIK7g==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9585f9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vrDzJWvLJd9NzFkxaDYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310119

The Nord clock driver entries in Kconfig were out of alphabetical order.
Reorder these symbols so Kconfig follows the same order as Makefile,
making it easier to locate and add entries consistently.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
The patch is based on v7.3-rc1

 drivers/clk/qcom/Kconfig | 58 ++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d1fc9bf87126..54f20a6f2bc4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -181,6 +181,16 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_MAILI_VIDEOCC
+	tristate "Maili Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Maili devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_NORD_DISPCC
 	tristate "Nord Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -192,16 +202,6 @@ config CLK_NORD_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
-config CLK_MAILI_VIDEOCC
-	tristate "Maili Video Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select CLK_HAWI_GCC
-	default m if ARCH_QCOM
-	help
-	  Support for the video clock controller on Maili devices.
-	  Say Y if you want to support video devices and functionality such as
-	  video encode/decode.
-
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -213,6 +213,25 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_NORD_GPUCC
+	tristate "Nord Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controllers on Nord devices. There are two
+	  graphics clock controllers on Nord SoC.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
+config CLK_NORD_TCSRCC
+	tristate "Nord TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the TCSR clock controller on Nord devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
+
 config CLK_SHIKRA_AUDIOCORECC
 	tristate "Shikra Audio Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -233,17 +252,6 @@ config CLK_SHIKRA_GCC
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as Camera, Video, UART, SPI, I2C, USB, SD/eMMC etc.
 
-config CLK_NORD_GPUCC
-	tristate "Nord Graphics Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select CLK_NORD_GCC
-	default m if ARCH_QCOM
-	help
-	  Support for the graphics clock controllers on Nord devices. There are two
-	  graphics clock controllers on Nord SoC.
-	  Say Y if you want to support graphics controller devices and
-	  functionality such as 3D graphics.
-
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -895,14 +903,6 @@ config QCS_GCC_404
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
 
-config CLK_NORD_TCSRCC
-	tristate "Nord TCSR Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	default m if ARCH_QCOM
-	help
-	  Support for the TCSR clock controller on Nord devices.
-	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
-
 config SA_CAMCC_8775P
 	tristate "SA8775P Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-- 
2.43.0

