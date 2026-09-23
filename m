Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF722485959
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161511; cv=none; b=YaXp5HHmgQDg6GXI3xmV5sj4Dyn1mPgiRaWpUy7R17bZJIGiIlSMp9Fu0dmZcZpGYiPZwdcc24uA0Eq8eIOx509v2cgYeEgdy5u0hChqw54Nyq4BdEbmBBszfuiihF1U0dDUbfIX2I4AL/trZfg/+zwxxlmGLju/1D+xpyRVSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161511; c=relaxed/simple;
	bh=npxXC/2A3nQUucjpT0p08dcGaxkVim326juc3Mpe3ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcOoHM4hPwTk9XuRCldTrROcnaB7p7qoknM588hTL0ESr5Gg0eocOcU77mVcAaKoJABxarD62odrOFj8uX2UyNnhMJ1Bd4pxvP5idMuZFTmpQgq0sI1Khwq4ONknDx3KZbcHTi2245C4gIovgEJY0bKWJ9SZBIVGOgFK2G8zdg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4VripW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9reFQUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4VripW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9reFQUX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vAP2821989
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dD+VmVixjFFrk3iHvh8FDxDS/komPYN3IGSBgS08bOY=; b=G4VripW4A6ljkhaC
	4C3PuwSs9z0k4I1GrfAA5khZt0Z8cjP2xuFP6AYGbrk1W6dTS3OBqnRyQ1uPzEgs
	3Hyi5ZFyxnGDj7GLPGNsjGZ2cWa6ehRpkOC3ut/DzLJBQjY/GmilDAf1goEdEV7r
	iIoracOj+DmuecE9F5H+tkQVR7qrEV+/S9vYGYiS3wA5VW1j8mtXbnM+OgOb3lBN
	ns/QlVouxNZkLmLftsEbnkb9klwMSBWDVYi9t/yO6Rl1dpLWCWwnX2aEDZtgMQsI
	831Aeso47xmUCQEwHaFFM0YtCbqsJWuXFaCHwiMIZZ4rMd7FjtSzA6bmkT3Dxs91
	pUSVXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarf7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:05:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-331b2ec616fso2937624eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161502; x=1790766302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dD+VmVixjFFrk3iHvh8FDxDS/komPYN3IGSBgS08bOY=;
        b=Z9reFQUX6KrYwIwTvlZLa8Kf1P5PNZCWMTQptQ1T/zMwrYjyALxwInDYMqMhDw7Q06
         HP3PZSNoZvJfqHK1dXvFQY6OXOvJn1X741noQhFwopwjqmz0jr44UrS0pQnT/JSfWoP1
         Bg8LADLI8BvdczxisoaFoi5b/N/yvR7ByRfYT4KA6XcV7cP/C2LFb4U5gm5T7hzEh6yB
         MLyVFrUZUFn2FUlO5riRJFBeNcDE8nf/VvIz5bZDj+zm75hjuEvbddFhLSY8Q6vvO95a
         AlEwLyJTpYIeTnawcoFMuwgGNgEcRPQS9Mp8SKG2ts42XK7ZfZ2d18IWTvUYdPdiPpxn
         JP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161502; x=1790766302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dD+VmVixjFFrk3iHvh8FDxDS/komPYN3IGSBgS08bOY=;
        b=DRDAVMFIyctNkLfopeT7aCycTqGZduhLkfznLvB+1f161I7vQec1FFoFw4xM2vdJl+
         92Ic3ihG0ko/dIkhrFMwDUhW+Lo8Fy1oxgoUp9aN/ldBrtNuv+f+vyrUOmUKU0KzxeVO
         dlXjclhR0rHUzMq92fWFpQyBtHJaWWeAQMd7QclBBgSSSNaXKoqiuuPv9QcjyF35UhZB
         9/lmqOo4I7ECPUgl9CzSfK6iv356zAr+qmioCpmlXnFktrdg3dbEONAP0m8kpwTHMVIx
         7+8cAlF3LxBdARXERtoN5FYi8sCEdIBUUUmVlYPtFzQL1VxVW1jjR3tUDWNmBa3qQJz2
         AQtg==
X-Gm-Message-State: AFuF++l1t9JrI6YebXyOjGQJ+rr7ihjZD3u5+W1iKlaYJPKZP8aMlgnE
	IfE7noXJ4peZc/f4uJrtqnEMS9vT5/0exOkK5amNPYviMpaH80SS8cL1NiMTr0t/sWmNdaMnzrn
	4Hxpq4Dr20lSR8yZanq1bTQopUV5+HcK9cIWGu1XbCzsinKd+2pUDG7TraAP7zJUiKHZV
X-Gm-Gg: AYBFou3GZrUxgAnE8z8/CxoiMor4O2kNrLuSh8EjZKn6vo400aTy3J6+3wwKlxusArd
	u3hrjFaJoRsQojyhZ17dlR1yLm7ZEq4uPnqh0SrklE2MxQH9Bq+nnI4ZYeS9GAzbMIGBOPt99Rf
	rDOkYOuREekV7C6CeaQaKsqoxRRRqMCGb22J9A+njrto/gRAdFsQDGGu+YXEmQFOU/c6kxNJ2/h
	2DVLGNeZV5g81qVK4YExYJbUPS5SxF7ZNUd2x+t/1ctoPwtbc4eavXk2JNWGVgOIqrSM14JAvwt
	z88+juX349lAa/Vx1Jr2vVoHPhHpVbfXOeH48ysd5qmOhBXJPihnNcKO8D06OArDBBB2fL4iHmJ
	T4/loVrlN7jURfq1oof1ideJCDa3XkUL2IxfIVHRA
X-Received: by 2002:a05:7301:5414:b0:33b:de43:4aa with SMTP id 5a478bee46e88-33e8c442e35mr2309696eec.12.1790161501976;
        Wed, 23 Sep 2026 04:05:01 -0700 (PDT)
X-Received: by 2002:a05:7301:5414:b0:33b:de43:4aa with SMTP id 5a478bee46e88-33e8c442e35mr2309638eec.12.1790161500470;
        Wed, 23 Sep 2026 04:05:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:05:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:44 +0530
Subject: [PATCH RFC 13/15] arm64: dts: qcom: maili: Add camera MCLK pinctrl
 for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-13-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=1581;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=npxXC/2A3nQUucjpT0p08dcGaxkVim326juc3Mpe3ls=;
 b=YsYtcU86DYgWmwtIhOPKFQ62Yj6nln8+PucIgx2mqT1gc9z47yTmOl7/J0PAAk8yQROqGKfV5
 +iJtYg1/j+QBMO/CAZX3SWdow7ORIcqZnKmRkF67Le+COWyQv1Ltlc1
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX9bx6V7gwDKS6
 73loClYq1dgmFi47gEuV8/KLgWm9EvFD1oYtp0WVDbcX7Mlwr2hgPOcWhJdXlZwF/3+xRfuoiLJ
 2lKP8KPlwI11f/n+JQueWYgd+T4lfnyWWSaIng3ndEfbfgIO8xQqIIwzDhBBeRkGqjTiEZ1dtRQ
 /aQm6pwmny0tJr1mnkCQr5BBMciFIT7yMrKizdlOZQyy8l9GLYQcFp2hfZMKzCG5kS1ZWO6COcX
 YTpMn7IPuxjx1mqGHY23OOi68EV7t2qFhNSbzXKFiuJvqqG058WWAtOdfgG/UpJcT+r/OSmkutV
 rT+gra2zCGV9+eWToaVT+oK0djUHbt8ikgvroy/fovMgWICC9OM/ROcUbZje6R/CrXYJ33NvQdr
 enlaLfl+8l6LNGPKJqCc+bk3qydQ+8AD1+Cz44iuNIeeWnOXOxXhfiynpdcpeY/6pA22YDAbKHv
 JsLbUGIOOksw/O0DN7A==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3b25f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-5ruBYKNFaXfuGS5u4wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: BxDbp1aT6ecnsw9Mhm7WJXKeSnV-BLMS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX16BKxXod4gM6
 uzKCDz/y7cp11c0Gc/X0lHI3OrcxBCR22e2tH5bH9l6FyCMdil+5A0O37C+WZ/pPILBkh3AXn92
 1b2Ga9vzJhcvzSGeYbkmYAtsqRd2y2U=
X-Proofpoint-ORIG-GUID: BxDbp1aT6ecnsw9Mhm7WJXKeSnV-BLMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Define pinctrl definitions to enable camera master clocks on Maili.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 8d5d64a23642cbde51ecb6c7377a5eed355f0d65..a73e0548f9ae32f64b3429c05187f9529bead616 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -5748,6 +5748,48 @@ qup_spi0_cs: qup-spi0-cs-state {
 				bias-disable;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk4_default: mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk5_default: mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 		};
 
 		sram@14680000 {

-- 
2.34.1

