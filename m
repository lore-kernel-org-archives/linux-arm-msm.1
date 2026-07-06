Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755A73955FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347246; cv=none; b=IYj4JbaYSmg+YGuqo7ocuUSDYC4j6F+Yx8G7GTTGmVYomRiFpMSfOOi8ynryw6qU/ejQomx/lqHCDHtRJQUi+gN2oOBKV0q7pg7U/gIpmpKnA+UZn3QPw4NZj/91A4OxUAbIpgD6dnJJqwGDiDeqYJKBeDlNH+uOegZ5VKUfmPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347246; c=relaxed/simple;
	bh=HGcqepg6YZ1JLarkhjM1wuzRvzUo2nasEdQ9WRZI6e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMJFAkuvpDgAsNVBr9Sphq8Zbvalyyc8CXKn8rf5w34LviznOGl55T3ajZ4N4NT6x+gYx2iaeMofmrzXvuTqjv+vzvmUWCmTdtr/nKD7Yi4cLN+hvbkma4JHTCsYhVaGFG8LhryCFXLDkkSlWbvpEQW4DkNQMppoYlcTrmnHMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgQZLRKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbqyyqze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgQZLRKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbqyyqze"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDwlL845294
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+MKOt/7Ya0e
	h2rnAvsxZyC5RZn0azraaMZNkScT04os=; b=NgQZLRKEXvq79ImwhmYQ2d0np65
	X2dEax69go0VE4uo3kAH0C6ZSa2MkfXIcCqV5Qqs4yoPNqPJvtH9g7giZVk0KxmQ
	gsCyY9HdVw1qwynoaXbSfC/440n3+ZJEi4SqdbJlaiy+NExfWg0g9T/3VDVzExi2
	6ik3ZirTCboeIpfycbkel6s3TRT5jWRScP/qW5qCLiM/rbJgAC0RHfO2PsDP+NFr
	RCve15TPTCe8sqfJZOBZT4joe/A3Ux+J//5E+C2OETWi09h0JmYP2gaapqEP9uFV
	yDe8YGXTSwHF8eOWqqU3FOcswrtZi82WDQnKtV2CvUz9sD6FbrbpAcvJFBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gs1qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:14:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso5804326a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347244; x=1783952044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MKOt/7Ya0eh2rnAvsxZyC5RZn0azraaMZNkScT04os=;
        b=hbqyyqze2RqAriAPAPXPhrD+xC9/5nVi61BUCV+mArpjhV8jEPgTw3+da2QCZRiNRj
         licNaQSLRdrkhBZjizShmYv4O3kNwPmBV2YX0pCE1rSmCHLFbNKWSxKxmULF/wcOcmIg
         9u6ju+UbGg0VmNboU+PrYN6EEwb7K7ddYCOylpP/jqsMwTskJOgHnyOc+On9G/10JY3r
         zshJdp5ZU/O12B0aPLmYfjzV4g6zv5FGgxAAWxtub7IkOClhb+8Vlffy45D+3jJggd20
         IUpmCiPsUR3hXpMpPVpwOrReMrX8pTEM7LWigSjq+DdC0PemzfoN05YntfBXmxksvzud
         Q+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347244; x=1783952044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MKOt/7Ya0eh2rnAvsxZyC5RZn0azraaMZNkScT04os=;
        b=nvhsbQB890QgnWOzBQqkbYsEaF7HFb73GGPwy8R4y367vlSt8TBdzeTtCQuL0Yodm7
         /C8VGBkcVSsbW8Nd0o0jkuhVREJqU/B1GE7M5MBTDf4PgrBOIQgO0GoviFkqnFA1IiAG
         0+Mr1qgFH6yX5KpAcZPTjrmoDi1WVNgCLrbpQdla43C4Yniw5JqDffQAEbJUvJ1w3pV8
         lJr0tmsUma3c3tbzLE9T0YpiSpnrSmBz/Xf+42ya3atJpoDpiGU6l0g3kw54mCKORxc2
         bZc4vhBki9c5hIIdonzCihz+e8y7WG++E9MpE8lFK+iXIAwDbHzq6HxfZTzCgmJ3uPhb
         +rOw==
X-Forwarded-Encrypted: i=1; AHgh+RrdRPS2Mz0VH6ckRa52xINIsg/5H+pPRmUQEYOXa94UuWuQZIa79hMLPI/LuFl5jYl2SaY78Odl3wHaTYCH@vger.kernel.org
X-Gm-Message-State: AOJu0Yynj7wEYIC39xPhuTzLrLGevbZ8rS07gaenxBnIN2ALPmYHn2pl
	PSjCWEMUhNNP8BLqoEbom1guCq53m5wjB2yoeyCN7sXDFaihfgbQ4MqhBbggtS2Ywnjl5mYIg9t
	++GIOjGnO1Y5rDgXucQUvYaJZQje1Lzluk5hGry37ReLAImeLXovEcGVipVAobmhWpn9x
X-Gm-Gg: AfdE7clYJO+KjUkzLPrls/fo5Xi+ZOcaGwKW5DH646Ev6FCP8JMs9wJmOqkT62Ta6p3
	yXDFSw4VB75Chcw7JLPcVrCFUVvgHYyTXAZlpNYCUseUZ+a/Nr+a7vOvW2sCYduXaIItWXeqmXc
	zeFb/iCkRhd2aw5R7gpO8qA73GX2j8rAOhGZ60RiXYoVpE1wT4vRrCOwCGHT/ah2GFfGidoanjA
	q/NZQzBwsgwq4tuj/3w4qUdG4ij4X6H2gZfJocUcNqFmeIh/d7YGc2jpQtH+LijTEKgG0esDDJk
	bn52r2yyYsoT7tJq+6PE26/HR/JpC7AEikwG7htJDHMgQd9laumX4AhiumRr98L40qRXzAFA3BI
	C15gw+eel02tXjgCsK6pVircg8PLYclP4rgyb+Q==
X-Received: by 2002:a17:90b:1c0d:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-387581641c4mr626221a91.19.1783347243863;
        Mon, 06 Jul 2026 07:14:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0d:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-387581641c4mr626171a91.19.1783347243299;
        Mon, 06 Jul 2026 07:14:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Mon,  6 Jul 2026 19:43:43 +0530
Message-Id: <20260706141346.4180348-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E9vgYx6Uz4DTC1wuSaY2WGhOpMbM2cDX
X-Proofpoint-ORIG-GUID: E9vgYx6Uz4DTC1wuSaY2WGhOpMbM2cDX
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bb82c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX4RsoY9yY0YrV
 8BOxUSzPRXXlz2CjtTsU2soEx269SpzgqgyMjcw3zCklnLVA8hTsBb2GCSZI8hahmgQZKMvCWzC
 RzMht2Z9PGfrRPGPYmMwlCTMKLmSwkG58/1gwPCJHyHAAZt7AzoNKmoYkqx4ivU2Ljkw/Fb7A64
 EWACNBmHp2iN86CLiinj6Xu0rtd3nbmZiRUIJfECti3742Vze7o8PiYuoiVnyxMaLlx4aHIDeZG
 ym9987+ZHpGoHa/z3NS2/DLlaYB6DHvQC4jj2haA4Rx2ds4M7sYqwc6T+9wv92XhqRkF3D/FV1y
 6SKvQi/x8ChHUBK7ySfV/CXf15wUoqndosgXkNJrcLVvZOvzjq05TBNUN3AHd+9OdJOXMBxvuhh
 DZhoROllsk59zXCbg03mpWJBKuZDLRZCa23rk8HkRpGadEtIYAH6MIHN2hs/MKjrZ0bANtiDr2D
 Bh7mDIIw6JIATDlnekw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfXzetjJTalAZR+
 7EjyjU8M1aa0JB9MxjiE/iFh9vI4X9TwCtfCCH7wUYutWoF7fdBsR2FWYfHJLPv3Ucac3K5nuBm
 XvVkzC6K8UBHfKJo0idU1XCiJSFPCZk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060145

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

SD cards may need 1.8v VDDIO also to be supported, to accommodate this
requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
supplies to VDDIO pin of SD card.

NOTE - Since this SD card is the only client on this regulator, this
change should not have any side effect on any other clients.
moreover, SD card driver takes care to explicitly vote for the
regulator voltage based on the SD card detection sequence.

Also for stable operation of the SD card increase VDD voltage
supplied by `vreg_l9b_e0` to 2.96v.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..af6f42cdd39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -228,7 +228,7 @@ vreg_l1b_e0_1p8: ldo1 {
 
 		vreg_l2b_e0_2p9: ldo2 {
 			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
+			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -247,10 +247,10 @@ vreg_l8b_e0_1p50: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1

