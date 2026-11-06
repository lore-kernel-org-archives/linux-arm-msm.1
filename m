Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953541;
	b=Y/lBwdpjh37S2/8mTmZSnQN4Fkf+oSZOjiHD7fScrpKp3vY8xUtFssbvL1yJOv8PFQnr
	 p7gupWoonAAbznnsKbqad1Wiw3h3vLF2txOl8J7oHj3I4NqyHFs9ZrGU8zQY3noEQRYML
	 zvMgcs4ZalPell+KanWmyl3H+A6seiVUahzgcIXHEachvFkJf4yRevd2SfxYf11mTbJBW
	 NzPAf7tDj2THB/h3u2Q7aka1FHVONJ4YBigtNcA93lnC2ylZAad6kwJS4pCzx5dc7qfE4
	 A3BAx/8hHygMbyuUnIk2qgAVj7TjL1Dgjm/cM0BH29c4m9OnIog/nTp2E83I7pzhH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=WWde+HsAOLZZxM3dm4oL43AwGhOJNrT6BAzGG9r2lKBryY2iDBRdhAdzNMu16BllyocM
	 WWvusvEmTRMOdUl6zYBUdZkrp6z9jHnqGozbbZz0/ecQYl7r3sjNGwrXvKG2/bm9OMC2S
	 JQbE/SZcV1P5QUcYmd1saz76Q+XIDW9+IZUc7C1G0um89u+W8yhGBQ3WGO4ckXDys2zAT
	 Kh60zQ9Fyru/haha3AK86+bcrbSwc0vs6ge8YZ4H52SGHDUJi+fBQCB2qNs1cVitpEn/a
	 DlRXPGBfE6omKLf1CBnGQ8dOMIbGCjFPJlX/v9llRs7z4Y4JpjUSbpRSSjQnER2usoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E7606A328
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568E7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RS4a2194508
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=nb4dBQpcclDhdFZH0+sibeHUTGO
	TQqHVBm1saZQDojMKIWH5sg7pqbDZBmpqp4G3nu58L2s0l3r9nn/w8lZgu8wZ6ci
	9olI2LL6MDGIsy5VtkAtShcbh6T/eHFWdSx3gyYiszIOG/eL4Bb9fb8KPAmcbB1m
	jwigN+hiNKyFtOpczbHyANviKXFFHr4s3e6da207ft4B/1WE6+fzc6Bko29jfFOc
	kwvGfsYng+CwsxhOfzlnKZaz8gzEE3US68zmEnPy8QFc8KVqDBF/yxcePFzNXVTT
	BBWY8lLRiReV1U5LYv1ohK4gIhuPn+f5yvh135MVXj5jJDmIZCGquz2Pr3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa9tr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:25:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso308976885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953540; x=1794558340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=Zvx9t0t3INy99PSqbz8YgF19vLw60ALAmtA2ESpaHKS29oDotfcMcNPL6IfYK5CIRr
         g3ITS2ckuXPDS7Q/EDTHkfppKoJkoYCNeS/9h1/vzvvzhFbcNmzp1HkgaHamUloMtQED
         BRgCaNAQyWDbQPgM9Paxwmm/I1MwzzLeFHJxY4q1dfLfkEG1qZ9qIpySEksGaVu4etLW
         82jVNB00K/a3Cffw7C+ATyaJ0Rj9UFWDj+R0/LnCwRbqU/Poj1D7DRmVtfNNLfB+xfGx
         8BNOnqwGI+oelKpZE4/gW7P1eeKMLdvJogR1FRf9vGIuEVln3eck9m0kdLdwRboEt/IF
         H1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953540; x=1794558340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=RLyjbXHkmXq/YQa7p76R+r7y7+71lakXm9dv6TML/L/YjSsU5lC2OEgNfs7EBSRz05
         /eW6UDikEoecjK/rNlGwN35heV9va0WRb5dQri0kDxazLOzbq//ibFfAUi4TzBt7vs1m
         9JVMnxoP3N3n1uUmzScEx1KEF8bFxqjbub2pJvWYCyN/ggJGFnUMNJYgJuUyQHLsIBkq
         JM6AuCJzPXjFgxEb9wsZQpOyF3X1fEUV+pkcW20v+mP0e0tVF8FCK4bms6pjD4byfuuy
         n6JfOXifFy6f+g9IH+jstyw5pi5AwCaCtSmHJViOl9bVFGNhHgODvR9tKkyyY693Hz25
         wDdw==
X-Forwarded-Encrypted: i=1; AKwUvBxy9+iC/eK1TwlDw1zQ6jzqOQQD0E6Q0fc+Rtxr9H6G4Zodi3LOJUjBxP92Igp//RX+6O03ypaemdks0xxA@vger.kernel.org
X-Gm-Message-State: APuU4Z/pLWd6B1/anGcubWMhwnAC3uwxjuaNv2VspPc6Q3SCDVKODr9d
	Fy2xmtt4sj/pepgxU1Ub0fMbqdGffrfQbpvwMilEjJcu+AyFkyGCHeLgC7QcAgWPv4Xy2vJSlzc
	UuGiYwp/89klDfLp2olWrnmK+JlRWOojJGheb2xs/jQcZdVbpsBFyEqQ4MgvTCmnBPmgA
X-Gm-Gg: AYBFou1D2esgtonkreP3cEWa92h3Ubk69BqlI0AIP9D3Tosp8katTwGOXzw2fXRJPqN
	WkQehAsbk1Rp1MRBZJH+jPOmVtYswC8unt0wkq4YOBr772odgbwb2897Rb/tSrrlSDutECaaFSD
	+wscN5pwG+aufO3VtH3W095KXddCCcJ3APeJrnbHN4J+EinrVoXsi2mj4aSvLyXfmbhsbc/Fx0F
	Df1G/uQZC0ZFQSmxTYey+wkQ+fdZ+J6YGsSyoUDCdyxI2hxkadjzin75FYTflcsnqDREpgPuGkJ
	oIDKWv58cXbzRyFhWTrr8/whFttWwhjLOoTuyqmxbgu1iypUdByX5sjq7+77q6I3Ej+ZnZUHCpO
	Bx06gHhdy2zppmF+xVlJDj5QW72m7anUxmAB+Mca2mbSTH/ZNHEuC06DJHZ230dhrtLmzjJzWEw
	==
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852292985a.25.1793953539837;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852290585a.25.1793953539438;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:38 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:20 +0200
Message-Id: <20261106082522.1448390-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L0_YO4SSdNc-FzTWsxeQWGkHUjKH8wPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXx5Ztj+MpeROW
 ZwlEYytJp/J9IO3BgXIFc6sV0+lOQESDOozgvT3eJC1co7kIQXIXuZ+aEJY7YMMYrGHRjctretp
 mUJFYd/l1SIa/95FoEnnl868MsgOYP2pVJQgapO/mf7bC8hRWtV9e7r6jUzQIYpM4vvHS61C1Oc
 GHD06p9nJZXoGNRWTTZ7hJSszsXsJH0Cuxid8nvA+hAkRg0lW3yF/Zz7+WD83WuY16L8dZ+ck9L
 KRYqvUA89vjIrHzY4KSiH+yK3xQOkW3AwpelWW0aWEHwCCn/bM9Op37LwBKCEfNWH25JuR28ovM
 L2F2koOle4KYf1/3jC5CTLDtR2Xzb9TFjWnosYoHRvd4AxBOLEXZNJ70/6jENI4pCEZwvLTuhAN
 r1R0a4mVLKbid1HaSwAYiBxRi9JGbwXDFBReEmHh5bqeLrXygaUKo3sN6qAlgtM62itHyto6vip
 Hz1AP+LhhIERtpRuZAw==
X-Proofpoint-ORIG-GUID: L0_YO4SSdNc-FzTWsxeQWGkHUjKH8wPJ
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed8f04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX81e3xjLu4BCs
 VPfXvSfQH3HcJS4thyOqQeChSFz9VuX7r1CG6DvGWpC+mgUs1ChMHwJqMUZWXbSZRH9FtdaJhan
 crjww6NYEXXnU4JF7YfYkp08tzxzGw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Enable the JPEG encoder on the RB5 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a3..949328806a9de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -668,6 +668,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1

