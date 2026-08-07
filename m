Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7BE4756A0
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120556; cv=none; b=jGhrdszIpUN25vPXp5gv2YFWqmddmd4ln6TdxMJeswLoIk7T87qRx4PNj5dRzeyAxQGlOhyBjU+Dp4+65EEPrX6T9YIZrRWGC45856cipj6IfreFjhKDEAihXXJXviWwQDiOMjqCUV64ws9s9y/ffAUoGfLzezEQqUXhtvSnxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120556; c=relaxed/simple;
	bh=BmRp1VdJt3hSFJqAK88QqT4SOsnL1auWQ3VL34jHTkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6RdkmdVxrA8lFOhkn2Jzp76DRDZBy4Zv1QrJL/RgsY/OaQ6V893ajwnYxS4KFEsz8gKZQTxHFh8Bj922CV2xRRwNlArOY1LjR95QSjhcYKkknpqzpioRVsIMlFcTnJWB9oSThayLz3akfBhyskQldFhmM6uh8T8NUe3rzl4gcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j03/Gu1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDektxkB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j03/Gu1r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDektxkB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOWCe1496458
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoEAJ039J435oT7pg2vcPfsKJoprjPfKKy2ZH9CMY4U=; b=j03/Gu1r+sKiEa6C
	ru0POIK41ixBX8IhIwU12xpECI53H77TKv13YISPYL/hYgfGlzZDP9U9PcudhCfI
	kMXpjewR0zRi2frpLJP6Kpld2b2E9qnHvNAlo4lFihxPm107JEqTgcPXQHDtLtV3
	jwSa3Y+hIUflz/tip1ViwKIbtRBZ9nHqEzv9By4DBW0EAoQ/NP2J3a0XEyj8lGTA
	AaoESVNWignk44Tl577pnjEB7KBdKZtvxKV8giJtVHGQEchhRLGpB8kr4C2NKGLU
	u8yfeSbudJx+JSpRt4NjOprB7Ei1G8gompnYH+Y7Tm59f11KOEpHI//GAMZvURnr
	yRqjeg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp9msr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:35:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4074291a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120553; x=1786725353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoEAJ039J435oT7pg2vcPfsKJoprjPfKKy2ZH9CMY4U=;
        b=dDektxkB12k+uVGsR4lesC15ItMsIuw576fNjJbGtdNTgO5f7nozNXQPu3Zar48CZx
         Gk3xAp9AjlSifXLr90YdRCdG7Q1C7nMWph5yM7paU9vXjzvxhWokTIapEDlDg9fJ+YTu
         v3PrR7XikCWaQ7qxX0Ct+5KKdFmYFwoIcZ7GVBxQ9E0lyPwsn9Zaz0QxKpA2iPezu1Qv
         Gclnffv+rB1FE7lPtlw1CM4zuAONMLyP4K3e7xUSmir4H7ARRsmiFnotIPcM5X+H03WA
         gL+84VI9N0nfdtKs0yQWa2BnhTTfMXW2ESItXoxnPUqzIEKT5qgqFNtThrPQV/O8mriB
         mBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120553; x=1786725353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoEAJ039J435oT7pg2vcPfsKJoprjPfKKy2ZH9CMY4U=;
        b=H9sg6bDT4WrYclQgXCPUtMcFRkeEyYKxhqd2ChwxFl7YqKgU6KlJBAcETQrbJAUuru
         VsAzvdF0j0VMER8t6wXG1c4BCtGBnBVNYTRx6gOGXopYexUl4uXKcTDxa624js7Nl52P
         pU9+vukkWwQgbcmx4RGHDpdA2E7ZWA9Clp2pC4ywLSKCh/GQrtmc3LQamTpgvpQ5UfAx
         KgEsYWheD9dQ3kSLxfufvr7RnYKUNn2iBknozuat71U88QVw7Qk9KOjvF4h9t4/xxF8K
         /L6oxQ8R8Bau5KBQ3Nv175DCCF5GVTyqRPzsLu8BSxp/OibRnpqxPgIonR8zHOgmZP43
         SqZg==
X-Gm-Message-State: AOJu0YwkZjjY4X9on2D/zRdqxGjcEOqFDmIIqG+Ad6MIBeVkusdaFGPh
	klnxmtQpBTY3OS5Rx5px4BzZDRUu7CQmfiSimbaSm7PcplouuAFozlNRZ8+FEK475O6DxkucfMM
	OXqde/EuB0r5kIwS+6uqAKBpbkHH6FsgqUw6YbgalpQ24w+tfC1E07Bb/06v999TMRL6w
X-Gm-Gg: AR+sD11R8mnMzCeCY6ItfUkevTy055MSXuzIbFFRhlD7SqUdsXoGHcK7ccRhjJsRm5y
	bbV+vSwq66tfCZcqigyqlBdqzRTTPhXQKNlHbi9r3Uo/8lbbfVY67x2L9uWfMsg3gq6PnQMq9kT
	vLaG/sbOCKOW51thinqrI7I0QJnnIemfrO+NwhWu9PDkleMUXSvBrVCm7bUrgBOao/rnqrsci2A
	PsH37n8Gd1dzIEsSGcBRcWvnaQxs4nGfjqRe/3R0LUI4Z3/d1tTe6czrxAhwXbOmFrxiZJN5jlZ
	r0Uy4XLDGT6KGUT2bG2PImF0CnPhT+vN+okS5BPuGvrf2E0WGQykYMGi3HSf2pVftuhRA/bYJdQ
	/r6sPo7e9MgbhrS9ge8kR17L0uZ+Vc3YJPyrmkTQ6uY5NIIWFNQFs3kseKK6wqnPnhh5pdP5jVq
	H6CSotGnDnYBY=
X-Received: by 2002:a05:6a20:918e:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3cb85e2acc2mr24856064637.9.1786120553009;
        Fri, 07 Aug 2026 09:35:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3cb85e2acc2mr24855992637.9.1786120552492;
        Fri, 07 Aug 2026 09:35:52 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:51 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:05:32 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI
 mode for SPI-NAND
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad_dts-v2-2-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
In-Reply-To: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a76096a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7mV663YIiae9hK7Uy8kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: fuzL0h2ZYmFgRarMHNajXePmr_dq8pCf
X-Proofpoint-ORIG-GUID: fuzL0h2ZYmFgRarMHNajXePmr_dq8pCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX8N1RhMoF1u8T
 BMAYThyBl5vjwUQhaAjvsJZWh6tOzjx9LESS87Z23wcu4XvJW/PYap+/iPyLpJhAg1qvQjBkDpU
 u/27XoQH+jaalXgX4PKRfL6vi5FhtfNXgTgHRQNMwk4sN7Q4AtAzK+ar7pM/VqaZE3MxxnwG6DJ
 5yqsGEQna7e3NevomVpm7w3wBEtug53KW/OH8mo8XLToIhCmEWccJeXmVm4YZn+fMX4QECADW7H
 MVJfbmWNVzJAAtNuGuGQOws0Osi1tS+b8T/Qu0hkeUlCPUdDnSvo1dj6wnsb8hfxrvLHcHQwt71
 q3lx4T7ts2G3LSe1d1qDcNak72dHUG9lUxCnyRyG1h/skII++Iaf9EwkgLmgFYrW9S7ln5JkCBi
 /+rGAwAuhe9NSqgZNHbM9eVOTstShRFGXdd5I1UVHSuVd1oE4lMhemsaX6a9s97UjNuP8AIDi1Y
 q6O8dxxetedW5Ces0ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX6n2sZam6gvmD
 fNy3NTrBGykSsTz4qZ9hHSrHtP0lxWKe7El103Ta0Weo/qcsvn9zAu/Qzs2zhaT0rTfFy0WXIZi
 1jYvg4e2xN7DBFZE1WWondazjG7gJes=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070129

Enable quad SPI transfers for the SPI-NAND device by setting both spi-rx-
bus-width and spi-tx-bus-width to 4.

Without these properties, the device uses the default single-bit bus width.
Configure the board to use 4-bit read and write transfers so the controller
and flash can operate in quad SPI mode.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index be8657239c46..793afc3ee82e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -261,6 +261,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

