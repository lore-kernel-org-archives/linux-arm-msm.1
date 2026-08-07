Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16E4746AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103418; cv=none; b=OHjujTcF9NS5ZwDNWhjVV9ea5A9bwYe/u7nlbrDoaFFNYsqfbN2uKx5CHyncpxqtDU6AWIPC5GS51CYgycs2cPmP89mVAZVXFPm8lMe6r1EKpu3eOwkl+H9MLEGlFM3gGgMKJwAXSFg0tNMnwvj31Dq/9/nRcWI1B2LJLmV27Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103418; c=relaxed/simple;
	bh=mPDF1SlEMQdjw+ueJ/HclnaM4zDdbSA8xnmKyLwl+PQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JusWqxL1XuQJ54stS0lxk7c/nMJJKfM1a68uGlZEwVwE0sggCve76MYTjRTAoCNMoaat1zMApKVIiXI8m5GdeeOByhhPsMo2iTjSy0jj0sKCKvo/4y+gvfY/SGodaJR4J3Kq1CK+I6Qa2eEg1ncGeqST5VGQp3Ej4qmkGk/qaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5tg3InM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTDQ/oin; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5tg3InM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTDQ/oin"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779WOnl564980
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 11:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KkZyAejonYu
	VZwLADkzVeCeYi2RQWrl55Puf6gMelew=; b=g5tg3InMob75DjO38W4J0skvdbU
	PM+DjCnY92Cc5ixzlE4/aFlRxTWmibfBLtvSO2Z3ZB9QuCezN6pOZ8nUL06TbbAl
	SWxxqpQdsbQtNf1+g+88oTsOWCiQ+XyTKDgsA6EXn/HakXxO622TDQliC8bKJHeq
	5w8lY/13ewmVED7VXt14qRLdXF+j00dwL+0v7VlzlDrssXwi6bzayQ8XfW9xIojZ
	o/tXvBdwAbDyqVKfZV/y4WbcHH/T2FFTNMFwjpiCS4kGj+wCttNTO8ig8ZS6+aqY
	XFc4QW81RV/pZhtU/vxwhrRKGknH+G9is2ugO+1Z7smE9FINsZ3irhWedww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp8ewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 11:50:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso39247481cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786103403; x=1786708203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkZyAejonYuVZwLADkzVeCeYi2RQWrl55Puf6gMelew=;
        b=aTDQ/oinjxxvdwlmMIhW8Hwsf6Em+6HJthcRb4yZhHP/2eO1+BseTbSbMjXYihRVMf
         SdOq2IcQLSNQHbxBWJzi1UQi0C115Kb+GM6z4J1ZeM4tIvHrGw8GuKwl991tbHhiIhKl
         AOGxFbV4Nk06o1cRibWEssrcyHSQNwDk29BgHkdnV1LqGYkfckHo4F6ZM2F+KBOSvnRu
         3outdZUCYJsz1XQmxP4ikHvPyH8MFJsEk3ncDRTAtjy6HBsYme5/c/Za+z5Dd3NO18fr
         mslDKz61vNJ0PG/cqiokuwUIBIidRtokXg2p1gS2aFAdA+yKC89SmyMapgv1ueGQko5q
         f2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786103403; x=1786708203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkZyAejonYuVZwLADkzVeCeYi2RQWrl55Puf6gMelew=;
        b=eV9J+dEM4Kam4ocMLUWvpv9pIGOBtQgV1BScfEiDrJc3KpZlXv2XX63JfyqwLNtP8C
         cOJ79OJEQKTcOIvoV3dCBrih1twzhwQUtw+YFxaXCw5O3PsgRIWAxm+eqlU+nxvNBe0t
         LfZXP0WMng2gVsIOmnJbijZuJzE6bRllI9Izo8ib2+F16OUV3Cq0oO0cXXWwBR/sOFko
         HLNTyzaIfujEodp40hsKS8T0zQRx6DOW5x+i3SWaydZDjOLYklLvTMZwziv/5sA/rc1D
         VvYES8dsO3Lld9QFnYxlJwfmR3eU4NWDfD9RGyYWeyBwAv1G6GM5ovSs/6Hfeeu4BwgA
         d11A==
X-Forwarded-Encrypted: i=1; AHgh+RqNqlGxw5+iJoSqDw3/Z1FwkpR4ipzsxDZ4L1Lyic3VhuUrB19Nt5ZqOTiHiVUsTzGZOdrH1nGGeVbphJnU@vger.kernel.org
X-Gm-Message-State: AOJu0YyI32w9m18IjbJ0AQ3Cm+NaQW8Z2xI5iDyYG9F4rmHB53Ge9FuF
	nEkmiH1K7JBVqow5nJA1UCiOHbLsrq6kOHgK5BdkH9yggrm24900MUQuMGSYb9yPDKxJw4BASdV
	+oaeyHyIMWWIje/J0jvBgTUpWlr6LWzJeZ10q/aYXlMinOpC+74leeArHMlQ2qtwK0fQ8
X-Gm-Gg: AR+sD10puo1/g6zrRwccKkSM+WExmJFGkZwViCaZ5k5M5lkizhDAyp5U4Kc0YLdbUvm
	H61WKqQ8eILM0495yMJ7vILf7IQ2RkH/EPHyFvY43KhLWm73uEFgtSGBiidFCHE3LtVEPI3x3Xj
	P1Tm2+wGzBl7PIWGMRsRf7USvx9JSS4hKX9fUQbH4R0jiK+HiIwQFUkX36YLYfPcNGt87SH2B5I
	ereAhdPoET7dCqwaDvFhS0yDidQpdyC66nD89ICDwi1dlDbczw/e+DF+crcIPzJRYOY2ha0kzzg
	S1L7p7+BJBrxfqDCv29VOCJC8iRW556B3PMwCwcZiOpamxWZalxkbDXQu6meyjMf2N8tBvM7ijJ
	0VqtYtGmmACNfN+fFVmXdRLPt
X-Received: by 2002:a05:622a:5918:b0:517:87bc:9b47 with SMTP id d75a77b69052e-52ce61f095cmr244386631cf.39.1786103403181;
        Fri, 07 Aug 2026 04:50:03 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:517:87bc:9b47 with SMTP id d75a77b69052e-52ce61f095cmr244386081cf.39.1786103402790;
        Fri, 07 Aug 2026 04:50:02 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c9047esm43046266b.33.2026.08.07.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:50:02 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: djakov@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        odelu.kukatla@oss.qualcomm.com, raviteja.laggyshetty@oss.qualcomm.com,
        vivek.aknurwar@oss.qualcomm.com, quic_afilipov@quicinc.com,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 3/3] arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node
Date: Fri,  7 Aug 2026 14:49:51 +0300
Message-Id: <20260807114951.4164439-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
References: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75c66b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Mkk9YIhY_DRy1CQSCJMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: oGZreyhwseqf2ImqJ7fBaW07brvbKQe_
X-Proofpoint-ORIG-GUID: oGZreyhwseqf2ImqJ7fBaW07brvbKQe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfX1bdg4hNf7+va
 GpdC9VOk26b9zwE93lyY44TFmkvIa9Uk6or3Ww4I65w9iiLP4Hbc4jppn0O+IYKorYUBwhAX6vr
 Gm9XOOEOu1PDQUatrRwHSlMOyHntFsucdvRAzuVwes0YBsPR/2Pg5g0Wy2MfPqut2PHTjRp68pR
 07XnEoeg1VX9Xkgh+H2nyimN7zN1mbc7MAW/EPqWeaGrro9xiYfSrQLCZOExyA0I1r8xLiKJPle
 GzMd1lXVe/uqQp9+bM7dLIW2wPSuLxjfhWjuDZ645UL6xkDFj9kz98OCh5bVubCuG+8bIw0+4ed
 BNlvwAItcfwNTo+1Fx5Nbi0z3Ht5QXEBCPS7KPAQ4qFe1DamBqJNALdwXkCFpJg5NyjreJPHFVd
 Y8mO5qWALrx7xgbGWwTGk0CazIiL4diGSwMhtr7qUhnc2WBZ00gk7aXhtmoVQkKJLE97Ze6JKRv
 Mcydwg66+4KEXIQR/qA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfX3vhxcE+PdJzt
 hVWBLJXFmCh+oEFGRgYsBNFV3moeQed7U22jzQTzFXrO8RsSeRqY4HOsV+uh+teBT1dY+uQz3mf
 bTZ3cAvUMtfZayO1PRlNQ7TvacFhRQs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070091

Add the cam_virt CAMNOC interconnect provider node to the sm8250 SoC
DTSI. The node uses the CAMNOC AXI clock to aggregate bandwidth votes
from camera sub-devices via the ICC framework.

The node is placed alongside the other virtual interconnect nodes,
after mmss_noc.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..33535c83a4d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,camnoc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -377,6 +378,13 @@ qup_virt: interconnect-qup-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	cam_virt: interconnect-cam-virt {
+		compatible = "qcom,sm8250-cam-virt";
+		clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+		clock-names = "camnoc_axi";
+		#interconnect-cells = <1>;
+	};
+
 	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
-- 
2.34.1

