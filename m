Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458349;
	b=GJdNFH6QaBeJyzzfsrpvTi42s2h+Ng0kK+myp9MsxsnRieSEKHFDwBP3n3Y9rBhCHaG5
	 VLpk1+KZ9BDJ3yKqbhuFR2p7+zF53JMpLDiIqWmjrBKuOXo+tsOM0ukkmKlrKULCMwD30
	 d4hL1yuLcp2R5hbVIt9AQ3+FfjaVU3bU42t7swK1RZmBR6K7NCQjhB4UTbiZxD+GqllM4
	 TSAPpb1W7WP4rM5BhXmcEx8Up7jKausKuBtvqW0oWDJbswTBUQH4nzN4LdeHjj2Fsm6T/
	 BN64lDxAx7oBU0OHonrDMO+8vTz/EAQqjPdvp2iDSI2u3mmHpMT1xRIhOPa1hTeR4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
	b=o093whcJsb6+IgeZ0FowMsRquFCWeQMiAJpIJy434S5QR8ppbl4ER2OABvzTnKkEd048
	 Ypeb2hFsF7ghhnPxZDmDMqe+LxGs/2j6r9qABDlbwlk0HZEfft8N5zXeFusz+uemZlgBq
	 7e8kLgCR3uF2oKR15Ib6tUhMnJs1EcD21zSJpGELGLHePcupr4vyP5D0xobyGhKPwwotU
	 ybCJQ8iOc1iRve+CDafQDmW/K6aUb/VSY2lC2eve4E3B+Z37N/HOBvOyGwoSYU74PScLv
	 GbpXPU4YEwH7/H48kNJgDTRVDhIdIGUd4CEscFRZk61rEBJdU1qrDONpfI2T3qxNjww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="adPsLIT/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmAm4ldb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D0606B68C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619D0606B68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=adPsLIT/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmAm4ldb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZXqg2514188
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=; b=adPsLIT/MAXwmu1J
	olny8ow7jibz0mkNKaAgA3O8VsDsmQikr1TqyznhfXBTP/S62kyah8qimv0siZe1
	prXx/haXS2sI+Py4bGR769gpQkcHbGCIpjG96pf7bAoFyISzXshQPV+e+5SC2mni
	2jpJQhXkvuHl48awGiTmQ+GLnADNShIXm/10P34iAfwMYBBWxBFWGZY10i2zT6KS
	wNbUNtjS2FpZbBYCdvPtdJyocGhWonPdjtZbthIVcWWdduKH3sDVoSP8fdT/CCuj
	nGnnNHK/fMILj7r1T/NUVelF6T6463mCIcQN+ZMWiRpO7Vaf11feFFPgXpzzDq9m
	yRGytg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1swsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:39:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6220392eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458348; x=1795063148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
        b=jmAm4ldbffcqns41F1P7cIGkfYuXgrHsYzcfaFQRBX8rD92yCMV7S4roZAW+k9zgzx
         NpZ7vy1OR5qZTM8RQ3cEbDzGCQdaGzlwOVU1wGerr2REP5D7/iJI5uSpIKprn6nMVBIp
         /0lrS9KhVh5iNf9iMIrkVj/JjWH8xCosBIuSbTUdn11vB4Oq5BTlXiBLvT/RuFoxcB76
         EB2iCv2399tn8qmSq+pkvvoTxQpv612ofDW6CgjdpN4g+ptAaZSZVivNuCfioL19GILd
         6L6jif7LN1groCJ8OZgof8spZz0xVEdK1ZtZrfe+RvLXS3sLFIn2HqsBdexTUS6OiKy/
         WWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458348; x=1795063148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
        b=zYIfcJAjlV87YCcNLxhwRAckGb9xQZM3HPmXgxX3aXuSzs/02zWsmf4xEhsH3iD3uA
         SofHj9KWjOC4C2vRMhIZ1MtVbxAL7UppfHM/0JT+KNv4iqBwUNevyUDgCawJ8aHAlTtX
         W1io/cPvoSIR0aYuPKxaAPj0VrXippN1tMHjC2ocMBoShkxBzLuFuYa4XffgifPzpx9Y
         F6TP2r6TZsxfyFHftkhR1A7tm1rZsU4eSe5Hss/dySGJF3wdO3XeDr7srMIWnrVe/S9/
         Tqtys9M2CWTsV7Oeipb9DOvktiJO4CPKqi4hz0EpTwUYruFFK6MP9c2Q/I61ZnCTklrx
         9IKA==
X-Forwarded-Encrypted: i=1; AL+hErGJmphw7nTsmI22InTLWU08sSq4OJYST8fD9asmzrdz0Tro0NxhSCFE174YiysjPYdLlVQpecUFZd4td+lm@vger.kernel.org
X-Gm-Message-State: APuU4Z/OMosCk6BRdP/8SsJwFAM9f3kUsg0hZx3BHd10YsJGvMmQ5X2x
	Jleuz0iUwDDpIp4O+tvjiU6oxw2ahZKftnTZZ70QVdb1t49sPZxWLv5xaza46WA/F72EmIO9pzs
	s10Aj8qVmjx/h8JOnoaABX3LrkP1OT/GmPUFZ8kCCqkV74SSQiMLQLa1ZoH6LT36zEXjs
X-Gm-Gg: AYBFou30WISHDiphrONmqB9/tIRW1fJi7su50RLHZ3c+Kpe9jHAad3Zsc7UEXGduq24
	cU1efyuq0Zh59Wh34VFtfeoFPjPvUL0lSZHJOL9oWoJsPmf7nmVxc2oY3iu0dvgKCIvtEeIcDP1
	YB4Yv4VN90nPyOJq2MN3r7REboBK6a6FUqXFyz/Cl0XWw7b3nyMYYNpqdmipWkPx9M+huKBGBIY
	/9mXthk/x70zFNyBNR5ttKw67XozbkzNMilUe+KpcDt14GAcXg/VsdKuWwSndY2rGzmrZ2d0dao
	xuzdIBWM2r+GcsAifhf6qAOmiQ27u2r+C5X5mDVxrxeM6NgKNyjp1tCh63fO7qxqjpLGZRD/mFs
	ZzwGo3mbXIvGsblFcgfs+/mOIrJHyY6uXzXdnYomCERD3h+x1BXpgUZpR43wfiqDuBMSye8wbyX
	64VICOtT+kE/YBrESod4KgG6oi3KAXreENpj39ll6Qc3W//ukKSo3tHsSVcp2tDKtDhCMa9U/l+
	wjgYWUBLuaC
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184230eec.28.1794458347982;
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184211eec.28.1794458347452;
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:08:56 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261112-imem_restart_reason-v4-1-3c7177529526@oss.qualcomm.com>
References: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
In-Reply-To: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af542ec cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: EmeM9vd0LpF-EpX-VzJsH3Y37rKa4IpT
X-Proofpoint-ORIG-GUID: EmeM9vd0LpF-EpX-VzJsH3Y37rKa4IpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX2og7Zbqr5wFr
 /+EuafRADHkEKBm0Ln8AvyujXQDE/Mqc4XXGZhSqoT0lUsp5QgRCqrmAmkRXpijsUtVKI0Y1IuJ
 0T7Gx2YS9m9ocwE+xIPj1FSJ3mlWBjVhv6NgSVLNK9YE2KWaGC2k9kCfwpghw7BajJ0Bm+/UUzB
 wMJcnc6sjrIV5wdaxQE1O2I0uyogkJij0q0Xy/LcRKESsi3X4rcuVv6jDFkW63HesdBByO89eCu
 Z+oHidtNiHJEevMSukq5z7h+W5UrIUJXIMjaWNyG4TXyB1ymznXgbH0/XiC0C0rCzKaq+KF64P4
 QCxxH61anKO97g0jc5cbxCGHn841kFgiavC0DV9zIz9eoq4EmdE9zkEgO8WbTtvVQQ2WXmcqC41
 htOrCQ+OrWm6mlwD6nGKWEIaJ1O9WTzhKU76IWYGPji1LKHvLEjwWuQlsFcwv/YEbs4+Qie+zCu
 Ie0MUOuERrHbjaD1ERQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX9v0ZrEzfKFVJ
 QI6hgur0DKJNMD5ZfLyGwkQ9/oqtamrsd/KxVc3ay4vzNaP2zGwFl/8aex1I1UxifVNK55qSR7/
 tDV6SAfjbsKBMLRmLAR3SQiqFXnvgms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index abb7a8391b46..b50fcd6e91b7 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,21 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb3: usb@8a00000 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
 			reg = <0x08a00000 0xfc100>;
@@ -841,6 +856,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

