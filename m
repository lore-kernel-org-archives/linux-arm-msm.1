Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D832243B6DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725519; cv=none; b=M1m1FeAZbQmSBzxUOArgaO9CunlmSWh2qbcl2kFcFNloBNL0UQHFZ8eT0oHId11TrsKPLQMg7r1WVVy33r14cqCA/K0WFPbWmdOgUnaFEGWZKbvd6q8tKGTKuNN7eWrliL1KqsH6qJYUrKA+8BY/e0R9DqjjCzPUTrubLORTcQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725519; c=relaxed/simple;
	bh=vKnL1OC2AK7IzVOMe41QvS8L3cgzxhIWMBKb+YiXdME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=muYbWp4GsDF/zT2/GfcbAL9xGLI4d8TfyE5yPu+HktWtuUgLCCfpFS6k4mkjAQECotzn3YNaxMG51lytHzZFvXBCXFcJaRArGJ/JKm5cl1lBWxy3wEgcQgSYEcfcTB5vSKTWQo315cqq/aaXvmHTdk5UNNDo/UT7MO831J7xWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSfZ+zeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EENgxGSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSfZ+zeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EENgxGSo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dabh385328
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pb5p/WL8kUy
	qaFGWpcUBrh/tb8T0Qr10UWefDKPbxTM=; b=ZSfZ+zeWIV9Oq32MRVdsdnYqoPW
	Uvu7JLixXy3tU85cOpniIw4ShGpNITlwkeqZEzMvcWJAwYTukByIaBYwqTVD2vwN
	mfVi8lucsY2BXcFQhaCzd1lXuyJLiNh6rVltcU9HsyNvU/pkeUAhM/Ro6Yz1AUdU
	loJ2ugcmhYLyOroszN4bF7QkHKtHqt9dB8FWREgprK7fi5qv9GOQRRDGbfRtALA/
	25WxSTEp++HgHpxtqMHzB0R5HZd55A4IM78JPGbBjWt9nJCsc2l/YlDIyE0so3bi
	kalm685qSfJJCerxaFoSlnhFcwDYf4q/UNQVq1Uo0WZzBE0TFkTgfhJdqrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsber-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:58:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8d1600b3so142061a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725516; x=1790330316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb5p/WL8kUyqaFGWpcUBrh/tb8T0Qr10UWefDKPbxTM=;
        b=EENgxGSosQTC3SRP/Zh5h8E/vn6Paq4NyFNOKghRMZjKw8sLChiRT8DsroqfABZEgr
         EoxkjHb46mrndWgv4C3drrfd/Bivgh3KSRnltXvjnnGY6f/hsMmrCI0tvCctUJ0YT8eJ
         iUld3jXBWN6pcaHJMXyVky8F8P/12ajSOJJ/Tp/Rugb51i+G5vjxvoBrSYYzn23C7Ajr
         C8eUDhdVi0BdvsB1g/Pw6w33g3JRIxT/Msyn7v+L2o79kW6gQy23oyz6DGZu35aMdZxO
         5gU5E5olw8kgCOZSfrIexfNX9tq1IbE0ED54WLOnJw47/ixiFJ1Ob/A8a4h/MmHrIvek
         Xf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725516; x=1790330316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb5p/WL8kUyqaFGWpcUBrh/tb8T0Qr10UWefDKPbxTM=;
        b=2mbvdPOxn+T752M+ZzeiJk5CinErkMqff4aMPBpnyRZ5vLBv/xHRCvYiENIfSgZdL7
         Dc6ruacEDvawsxbKEp3rqn+2K0d1N9CGNEJmLxcZmgwmGGBs39z+LW1U717O3DPMVp9o
         HLcAVAj5JmF80IWaFS4GD041J9bbsZJ1Sx6icpJKEVbW9voaGL7Yb834DV3pMhdbfFQr
         4w10sR3HqyNctLiqGj3MDZGq5ju7aicVx+7p99SwNHIt3+szQDmvCA5gFVq9CP+TPkfy
         L5aBVAczPyl3tgDB9Pt3UAqaWE5NnQWrOYTtvIv4jrbq9IGuGuBbDhwLGxh1IxoCr54A
         ouOA==
X-Gm-Message-State: AFuF++mUadYSH2N+/KAYJ44Q4TxKl+QK2+rNd1vNrQ0xbSYl9CmKz/n8
	q5xmA7PQvYKo7+h1nBPPdG6ueTIzDlHbXH/Qh8fmw4P0rDoUCC9lo2m7UBVVCQz4JqafCMbFjYJ
	wB362QBBVjkzNGtTOmOSbkJUIqI9QqoLey/vUbqqHuvsCER7y2o1dasEKSOgqCgKRrpaM
X-Gm-Gg: AYBFou1WjNcj7Q9XSaGGKJX7q+TO/rvGO11AWwKrJL1RQTFsrZsa+8VGojdLzj9sKNe
	rgEh4IZR8GPKTJWU+NbTO+xofRr+czLuSo1l34mQqomkkoGz+WUWxmbTTPeapto5wJti5l2GFwu
	ZFkfj39sdVsqrng0zm/1PvsXcKCKmeuaj4/TgVcbhTlcHezEGyhg4ueok1zw0Faq+rrHio6zslT
	neQ68B34dFKKCqL4r50pkSTKkurAyNmAGdVK3goiiMqfLszZIP8kjibRQ0OLvcWI7C9HqFnoO9r
	FPOiqWYT7RrhBqHhVrwxUvK5ISYI8dIbuidP+/fESdkvmyeEB6Rhhs4fQ/jqqYSrHIdCWwaujmC
	apbsI9d2FB2pEYUtJiJAYcFsXfSDE0Ps=
X-Received: by 2002:a17:90b:4c4e:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39e594253c0mr2821566a91.2.1789725516394;
        Fri, 18 Sep 2026 02:58:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39e594253c0mr2821545a91.2.1789725515992;
        Fri, 18 Sep 2026 02:58:35 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:35 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: shikra: add RAS error source nodes
Date: Fri, 18 Sep 2026 15:27:46 +0530
Message-Id: <20260918095746.3347893-6-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
References: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0b4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a7izLWPGlrKpK18tDBAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX5tDuATIb/O0P
 vyfUUGkm6gEy/dnHEL7P50KvcLgK+WGkRzj05xuGIBJrQDWhBHq8z5rqyOcsjDVF5xJE1rLnjRl
 2cVewUd+1tGBQ3ljRzOeEevfKJ+tvy1THuqfHSg2J5lzYeAllqP5Ca3F6UIhNwYDrh4PJvoxtTZ
 NZ2zEIiWlCxLE2He5XLOfbPT5nOVpLMyIILU1ONQOQUFIAgicOzsvp5gfG+QbvU0Ln+MXl8d0lP
 6x8g8dwOP4RnxsFofRCyBUBUwtpXURmmRAg6XosV52eoUY2RoIVlpFuV+d1JexGOX+xKfZXObtO
 BNrGri9Sab2RH6qSoV/N2X9VaYn7956KEXi86oH6+BCM3SMFHO27Iqus1wXrNMm9UMcamPFMkYr
 CNqRfNlZOuHr0eXw58y3R89Ym7SsdMS3OCbnNuZ5v4mNLKQShDJU5cZ+QenCZoJPRre36nu37i+
 dz5M0BG3FJ9X+j3fc2g==
X-Proofpoint-GUID: CpHcLzRTL3LyIjTFvYOAVqWeX-QhzRLX
X-Proofpoint-ORIG-GUID: CpHcLzRTL3LyIjTFvYOAVqWeX-QhzRLX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX0Fh/0JvHRrns
 lZ0wcv7AlKydRIaSQWJOWNecC3Ynlf93sFTuSeEvv3HvwVLXUhiS1cRxF8F2WIyxdcXVWWmJtse
 y5iJeX8Wrf9jLig/FMSqar/ajWRJ5eQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180137

ARM Reliability, Availability and Serviceability (RAS) enables
processor components (for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Shikra CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..c5bbf1f8e46a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -330,6 +330,26 @@ opp-2208000000 {
 		};
 	};

+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_3>;
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_LOW 0>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "fhi";
+	};
+
 	modem-etm0 {
 		compatible = "arm,coresight-dummy-source";

--
2.34.1

