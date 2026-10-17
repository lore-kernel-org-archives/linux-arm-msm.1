Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C713BE643
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213123; cv=none; b=fgQkiu6bfKeCmvPYG75CBPix+Ia4yQczwA9G6qHoFi5X7v7KCT3sryQZM+GKZ3fnr0jDeEy0AbCIJvVLW00TU/7Ur9pqJZaWHXSELrELUkYFWCuLcqgLINsVCRI1dWCOWddfZjxHyAUzAT8wvuscH56J3HM22lzU6O4bXmBVUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213123; c=relaxed/simple;
	bh=gUbGpMehdXTAOT2mYSW1dLh9J4F58m2XPrcBI0Gk4AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyFw4831/nGynM7y+83QOs2Dvqtdx9iGfJ/vcv8FE8SOWeL6z57pg5afJxNZrA0y1abTvQkDtIErWpbW//hcVx2P/dVMOeXxk6RGgL7CHkjUp3ogiPwjVrpEb2Y4ImY/aCxnUJOGsFN92n/aEkKFTrg4sBbJ0BTf9SFfCn+gSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzHRHq+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToMtdU0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzHRHq+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToMtdU0C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30hWh351030
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TGJ+GhNnkEO
	Ld2KsiipWAv56syre7ugC3IzB9jrXOZY=; b=OzHRHq+qbBfS3s+Jv/xpFwPPr0X
	G1VwwW6tqkf+6KjhPcaKItgFrJiEq6lCsvKw/QaklHeYRS8sZE8zH/spD3K5DL9b
	E5KpVSffr/I6CXHchGJ86hvF/9BWmraON6KPN8OLumnEoJZPoPV0ocskzIX2eJCY
	vVMHW2xcuR8B2SfswMi0xdNv9CTLsQNvE8xWblQ0+srJ8WWutut69zhyUOv7CSq5
	KEMDhmILHBRkv40vc4zsewWL+RnKf8TRMShK+7bM6CplJe11WtuTsM6EmiIva+DM
	lvulMLYlh/FdZGt2AGF/NvwVqBIEtLc+kk3LhKP75wTnuzjBnxs7ZibObgg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016g94w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1947557c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213120; x=1792817920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=ToMtdU0CfSk25hCBtzjU28U6HRrDGdr2SbZWGB5eepQ2liNF25II9nRTi6+QrEiDA4
         ZCP3jZygtGOl2zFCOMTz0Q61dga62z12CtImYc+CCJ03S0jFKOxGbcwMC0mNvhdUDUA9
         zwd8mgYw3j9lv12SGYQtuXOHBUC53gmlZe9wcnMdloAwheyigY9Vs3YnSnzv7/SJFhFq
         T2FffIKlxsizNrh+LUEUp52lFOxrwZpzBTkhWrBhctJCz/MdsqIIQKuqFTW6+jHOKqJB
         xTjRJE9ZjLQ0dbAHqdDX94ni75J6xoDK7NM4xwm2oINoN5rVHfg2DVrIJE8pPZ3dFsdo
         J+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213120; x=1792817920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGJ+GhNnkEOLd2KsiipWAv56syre7ugC3IzB9jrXOZY=;
        b=134DUzFKYmb2tiUofY8lmxarRK7li4HVubbQDjDG6qwTlfZORae3nt63GQF5jzrXoj
         ix3APQwQH6GuYlZDEGsxMGhocm4uBrPXee374NflXG1zQBxUhpQyXiDnO1w0t2mt/bnm
         hwNs4qml0e+xnNkhaPlxbCQ4NuIQBgvTngd+5AxX+MUuO5dr61gcwYLCGpqAh7sDOM+a
         wvshdDRsM/M3BEFsxgN+bz876Hu1IhgLrYMFnus3cf7wF79kPxOh48XzeAUZuEAvdLOH
         bxcy/Wt/9UtitqOLhATAN1GffBmUfTQrK5thQi6zIiLkOMOgI4fO1b8T4yXueL0vC2k+
         s2tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj9jWZzadS5UnOu9sJKGT8Vn9karmKLqHnkneAioEZLsCVxSUYrLtz/t8A2zB2hWaQCGfd4cdPXpigyK8A@vger.kernel.org
X-Gm-Message-State: AFq9FYIYfuLf/8YOAgyyFEi2VJTcPudXbtqEbCelPS51dDFKwln5c6rf
	vNIzXWhtpsJLOOKd9KJQFtFf2v52TznHxQ/fjUsa5yK2EOqDpxZrqAdg0qgB8FBeCwsxTAl2bDw
	BgFP+wuFQDDzXChSgUk3PRnqxiu2zCkFJ9rkaVuSjAsrBmWlTBCsDT9z8WaWDF7K0zTXs
X-Gm-Gg: AYBFou1awimJZyUhAoGIaVn1pWvW1xlWEntYQz2GfvSisESlnll18S0f121jW6EeSYs
	buf7R7Ao6z9KvyCvPmVxBjltjc7TyP3RI8IOkg2+Q/xjISy8BkNLWdGcGq+oqkqQd50NNO4d27E
	pZNr4BDIsZLEBEZu/nEk6Gdj43ETVX3Ao009z+8h1Ggx4RaPj3TFFVVAiBcS0jBlssz5aIiLJf6
	N3SZjhyBcLUwazhe9OJI9myO0uzDU66s1R3dTBdmciPcebQapGUxe+q4s18DH+EMWJ6h0xczLGn
	90wYOLP/gXmMEf3+Gt1hptKiUjaTFkfrb00zWrlxunZQgxH8to9G53iixADyZKYuCswNGViMsnz
	6RpNl3fpxJD2r4ce4rQfMC/vjCPhSWTBBqXD9lLRXmy/GwXlgSY3Js+E1CBM=
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450118c88.37.1792213120116;
        Fri, 16 Oct 2026 21:58:40 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr2450095c88.37.1792213119588;
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Sat, 17 Oct 2026 12:58:15 +0800
Message-ID: <20261017045817.1506961-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX8C+DtNvcsj3v
 UvN240Xk1GywT9iPTpb+Ko5zykF3lI/8ZDXWAhZaqeK7YQa7AWfp3q6wozSVuh4VctSVZHwn0kG
 xYUzCSYQHD1hPesB+LTHnQDkX6P159k=
X-Proofpoint-GUID: 7y-Xu8sP05sAWlGhmB2Z7X4dgPnOGMXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX9Uh2GWDvbhQ2
 MEsmwUPS0JF8H4SJTDxrFFIWLRXjjoDYKkQu+xbT2YAF3G2qxZYDm4Uiup2MHaz4Q1xgrpkinm5
 cPwNSYenkQh4sv7jZRcy710JYJBwmbX/fOtFFNSF7/9zX8Y2VebislM5K5vGcKD0rFHTeH5Q48D
 BPb5xQYfGhhMfzXwgl+1mk5tzd3ch6+KBOkP0iMGj2mc96XeR0q2uHNfuB25I+sMfeSCWS0tNIS
 FTuykRMSvjX4GCJhZ+MPXem0N6vPxyqjlYwlfFl+/W/1Rfc4V54LX49rSKg7vr2LodTQTb0aWty
 v4X1/EbLcndZ1Ngvy7wZWhK1/+Rm/v1RSIJDoDw56/7qDFfmU4dEgggTObm3hcwvTBc7zG7jzX0
 ggrdCb0Bfqc5G27hRHRNYQ0EVu+wLUBHGT3R/h5lDN1q1HoL5uCb470xCbV9A4tXszwNwdqokbq
 Ue3vP1d4dGN/4HSI6UA==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad30081 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 7y-Xu8sP05sAWlGhmB2Z7X4dgPnOGMXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

