Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956916;
	b=PD69SaoSSL4xlo07p5WF6i+vWIY/+w7PnO8/Q8jK1pW50cCE57U+Z+Ik8B+8AKxLbT8t
	 6abzQgMVBnaxw2GZVDyKa/J14+IBb73Bj6W/AC4hrOIHpT0gcFGT7l1fEmXGq0xKdJhH1
	 cCu6Fl4uiUQchvpOFfUfv/aoJPD6Il4HusDdfxhKdLztKPlZ9CY3OG6SGy4CcLGGbWS0+
	 9N0lC4SxI1nFATXeyY1F7DjTvAdAjScQ/Ipb2C16bJoK+tJzlpWT3f2ZR06ZJjuz2R4Sr
	 /iFL3/ufPLe2sYttm0ZvH2/QLrLKxM+X5iVeOBGU0osrBQTh36SObGSh/KLfl4pzWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
	b=4GXek/Kz69u0Jr002GxnSZtQVuHP71sISzXNItsBPDK7bVuQ3iFT0VAF6WMx6R8JmESU
	 W7ml4BpA0t4LiWhi3J10Ygh/v5k7UmjXKXS3vvcAhCi6/BLr3BJQA7PRKKn2C8M4QnZtD
	 WiNz9aGQYCdSBAQ9J0+Rpa3s1/8XsnAtGR5QX5C0lHOcabbfphMGwoRenWvzw7DopuycV
	 DWE9it4Weilka1tmXdTOgUWOB3fay2Nc7dZc3Yn220e4FQccYkIFHDjff+8GH8RxlEWeo
	 Bdg3qZN3LWeSblW+QnQqIk8JW3uf6kKVFEk4o4DHnbvUQ9Lih5TYPxckR7oR5m5HQUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKTG1eyn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGNkyDNm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D33606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D33606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKTG1eyn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGNkyDNm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7Eq3243885
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=; b=OKTG1eyn9ccy50l5
	I4RqtoTGWg0KsGtlON5NVsdmdZk24SeVUdA/tfqhZqhpFGw96srG0rGG8LZuxtH4
	co2Sn22T9qRn3k+OGX20E7rpIJ4TEtGeo/SjSeAVgQyySHZqfX1+MiEhidUi45wi
	7q586wxzf0N9v/awvQ0/mnwwMKGb0PXwAk6CvabaGkO58ye78fP4WqbSAeFPVBfm
	6FUppPRCjA/VAR0e/xPYL9vjgOWosMxG2OsvCQuebrCjTuGnQkKj2zl6rxxj3Tgm
	S+dT6vsWYc+jTqwhyRP73QwnJOvjaN8lfvB8iOXZDWtt0kyOgTB5+SEi8QIUu+I2
	WBBvAw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa222f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso549912eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956915; x=1794561715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
        b=GGNkyDNme1DX6Lf/UOG7FHMSbMmkj7UlGeXCksbz+0PL43EPMaRdlvCdp1sIn1NzLz
         R2Ajpfx4yuNP8zwmEcmp0g169c84JfOzx8R9dP8w7wX4a07rRbcrG9CPnww9w3xOt5XY
         Nzw68+UmnNgIkpZ/0G/ilL2Bs4DK4TXhWmtDE8shn+WjAF+i9GcHe8FV0fM7L4w+2a1C
         RqhNWolMJccT5FxWNPSoOi2C9W1P1stEtwyBbuzvUn0lkxvi4VqhNBlMTI7+LlHuAR6l
         hop4wTKZbb6VNBfa3XNHVnJwWRXLLjQmTGMsCuEl444xCLesWjr40axUn23mktpivN+c
         /9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956915; x=1794561715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
        b=kwxAOz00uQt9WdnFxZ+xwWLFjxuBIrR6FkIYIby6OxYVLb9rTjoC54sgaH7+D0iFJK
         yBWXUPJaX8065pdtbeFhxVPphFUZ1ID/oiIAMn5QRURi2aAn+6cUIL/HOP4CblRW5H4L
         KwNAsPSsVk2WrzkOvHkMEr8p8d1k1Nu+oxEirEso5gxWmHZ4CNpbY/atLtGYlB8iUVpj
         ovJ+Q+rV+bVbX7NvY6jqfNrhrgNc3U+OXhtKInJ99OwGIdyvNNRZ5QQPvOIwj5dHrUms
         1nygaak7oBkEObc/GlF5UKCPk4l4XhCCFTNZR2jpE27+hE3wU28wgfQ4CCiapJme9mIy
         5AZQ==
X-Gm-Message-State: APuU4Z+gtXq1bmpiSaP9uFQ79J/QsJG8x0xzfr4KOho+0migl1QAwZT+
	HWShiUCETvHunHHndGqMwTSK9U64QUIgwR2YX2D+bt20Qx+9am1m7EDxFo8sWA3kKlS7Diw/OKY
	pxkcmp+2yIzH5v23hfTBuoFHQdf6dZWAsdKbFYnc66CnbxcY6MesyOAAm0cBC7OLcz2sd
X-Gm-Gg: AYBFou3fIq0egQWXJXOGKBAMjT+n6FMyIpNrmLdDoQCZqHdD12bLNPO2m3MVWkHriF+
	q79Im5oknew2QvA3GDuKkfb/mJMroFSzD6ybTICkd07pmK9OSOtNjgrMeTuQlSwagmAcS1MZBBk
	FkixU9BJyYZFCv9dhEfsZ02IRnP7/aEAj73KXlSU7xJIga641OkMugqkcNxptKqmRg9K8ld+xhb
	SZKvh/xHS1vWCrLa7cCf5kIy122oWyC3+4FGEW3b68tkNVennv3H1aXXE4cQq1M1zJWODeXz2UY
	0kFRj5VZseyhWmv3HiY5hWOJmQ0+B3uufXLGINmeNR+vvIiG3JmopxFeJd2awlTjK+AjuX3YMQB
	mBheYSGx8htPL7om1x3CvrSr8SUCy4ijjS4iSCwRHMx6HpA63X0wJzY2HposALeJQtU7K776mXi
	Wiv+qxDSR9mgkVPStMW7kkgAzYLkSQtBeefSHMDAHkX4hTJ85+6lJN5loa4nsOTDGxh1NLj8Vvi
	dvF3Q==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2640821eec.16.1793956914772;
        Fri, 06 Nov 2026 01:21:54 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2640800eec.16.1793956914305;
        Fri, 06 Nov 2026 01:21:54 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:53 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:51:00 +0530
Subject: [PATCH v8 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
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
Message-Id: <20261106-08-dts-v8-11-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c33 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XHihiHp7Beehtrn9I_oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX/o7vE+VnGORU
 C5eq8stRpVN05FbIf6ji39hSTi8H/zo9mawXjQDguBTh279QDm0HHNMdCbUpKrhaR2r1ZvbCTWx
 ADL1y6KgJOL3eJ1rjirDhFKuIZta9cg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX/ScbNa4J0p/d
 eReYEF6c17a3ayvTv1LmSfaPoeKxj6WxDegtbkSldThl3kkk4wmRA9IA6XQjFfxWImqMNguBPv3
 5Fn5xtSr9dSnLXzO81dUBEMht4hKUDWca/okAT33fV8u2iWdh87gmzmJ9tRv3L03jD4OY0DnJeG
 JHJNObwq4gVPtR4jX853GPHcxPPJrqWfSzGAiPXmlvR+206hQfnE1hnKC4f7whyt0vfImEImreD
 PfsX5bQhFvreiGNMmP6Y7DMl3USiHzVV29hkiYYrcv3E4qWe8gGvIg07iwZOR7zPZnBjOUZ9kre
 q3diL88Bqma1p5MqRaWj0yAUM40FvKI70REHancFllpsRAQD1fDpQrIYwIhi2L4xeQOSxb06OI4
 /QFcPbOeuXBDb95YOYrYZ17nUrdflct6rl8cNMH5ga1N4QPMtoTejoSjNdr5rjgL7xUjLBuvp2G
 ELZ4TIscqMN+pdnLkTA==
X-Proofpoint-GUID: XZS5M971s_0qNur7KD2CpRtndMt_8LSZ
X-Proofpoint-ORIG-GUID: XZS5M971s_0qNur7KD2CpRtndMt_8LSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add random generator node for the RNG block present in IPQ5210.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 61a58fd5d4ce..91ec7eac8a67 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -386,6 +386,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

