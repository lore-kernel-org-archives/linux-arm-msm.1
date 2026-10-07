Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9F48822A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363834; cv=none; b=aM60w4OlipFCyj5wr/sSYyzkX7sumKRVNnVRBBcNiytbcmzH5KWEeh+SA+ZdygkkH06vk0bjaaHlDKkyPet36rXd4/8i1Tc2wygdzObHMZyqG667XXLlTyH5hs8wFrnpXsDE4KWfaeQQVHqTEHk51W8roaCmuUlLruCGfksryAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363834; c=relaxed/simple;
	bh=V1+LIzhsNCYGghySNC0huQ8BjohirEoPB9lOPfSjmNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KOBKbzSzuasaDUd7vWd6hzzaa0zg99dJPXeJX5SlFFQEh6yW5NZ39gFYyLlTa4OIr2fjp+I8Ma+HGRonuRYVrfgFUZTNlqnKTiDToQ9jK4vu1q8fEjL/QMYVsqN/3mWma+jwzOSQ3V0r+ptjMNxIGFD9yBQYWtXTXja0MhsYOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2/FpBNM reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2/FpBNM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jsFl2312942
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAbK+q4lPjl
	daIW60C/b3RXYI3mjruIC3tTZr7L08yQ=; b=I2/FpBNMsAE2T7Myntk2s+fk+xz
	mXWDmacwlp+99yQAGAUARMVGXFpnRb8gotJd/M9zLKP7VxV/A7u734it/SpN24L6
	H0A0rII5hb2kkBPN0uTD/hKa6oPrht12k6vyq0MQRtqARQDw3AQEOxm1CxpkSBKu
	gSCzO3Q1S8F2VhITuJqF1M+rvi5TJAU4I2sjkAcFVFtvG6vwOrwebv6t3Ia94Iml
	TNvwkO//uJmImKmEtCHkGjXNRxIXvjZKHT86AVP8Es12jRyB0hLzJdlv2p9F6U1M
	ts+qRBkemifnj9EBOmOis5ynAPOPBiU+u6Q74x/fEyc68l1FgGg37mTe+yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askngu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso738911285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363732; x=1791968532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAbK+q4lPjldaIW60C/b3RXYI3mjruIC3tTZr7L08yQ=;
        b=0j46Led2bWQ/LJbKO5Vd4y/mJtLLBGhbns/ubz21u1bMvdUJoFSo4qOi/G2a+Qh7yK
         WYgSk44mls7zZA5kJRUEW/sThfn/lTtiemJWXxxeilPORZP8Rg9e845AaumqRtIuux/i
         /+iYn/DYUkU4LoZsW+Z7zTOtfaNm7EHCDcMGyntyWzL9N87EhpgSBw3ZDOQX+65GJmQ9
         zZe8PDtjo9AdNPnQgQOqQDxLJpxIMXqFiGvgerEqDHcVZAj6i9mPnzEcXZhoY2oSe0vs
         Z0yeTYIpQPTkvDWSUdcKWv7Ospw+P0GZYx0AUzC7S2kcJStAXYQxtVewQGjLCt8DYL3V
         yyoQ==
X-Forwarded-Encrypted: i=1; AKwUvByK//P0ZSZQ7/EA9QZHSjibjS2teWoC738HQ1yGtiay1wtyBr2Vv9TIgW7QuuCWBXK7NjabF0wgl+DCclfS@vger.kernel.org
X-Gm-Message-State: AFuF++kxP1wx/QBiGnQ/tnSoiOfn1i/14/f+ciVcaKuxnOAZt0hWy4t4
	oxakETUSMT/9PwjRwKB2whcRxhE5Al3PiY7Jp1SkXlJgPW0SR7WFg8avxgFOQjQptrUjTtyCt2F
	x0rkhWZ28S55g3MjhaTSCAvewks11Rjb58ND8J8ZV6+C6g1et30j2X5jRPgVTs+1Q8LKB
X-Gm-Gg: AYBFou2dAaOOBM1UH5iV0CYpiQ1KdcRWB2hNnItvky9LzvpwlGFP2cM4mtrOk61I2mD
	EFcI3RLK4lohd2Ic53N33gdRB6AhtjgH3FV4Q2CF9XFzqRMDBTcQQ8wYmkDVNlLsuzqLVnSTN0m
	ntpHqrjXObQe1syO3z9wAjD1tn6eNWK1k5+Z80V/j0Wnm8feMVTdJ9x/K4c4F931SCGIFi5Fw5/
	/SxloJfMzl1ADOP82eQorR2lcjlECa/lE6nmcdUPqV02ZB9vi+yL0TbbQgO3dXFrzs7cx9mIkN2
	u+znVjBI3feK+IhV6/ozh3GzpqxMkqzr1oaAYWQ25OWWMydoWfxzLM2jFT4=
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447764185a.40.1791363732385;
        Wed, 07 Oct 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447757485a.40.1791363731820;
        Wed, 07 Oct 2026 02:02:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 24/45] arm64: dts: qcom: use SM8250 IFE resources
Date: Wed,  7 Oct 2026 12:00:20 +0300
Message-Id: <20261007090041.3732717-25-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o13cVcYUNZZfw13fS7EfzfzebmMCilsD
X-Proofpoint-GUID: o13cVcYUNZZfw13fS7EfzfzebmMCilsD
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60a95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ucHQKD9_QHzbuw8IWkIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9qh59Lfr6pnz
 4DlQSzYICuXk4vRUY1rOJmgA7GZ3vylLMCiVii0qzmKDEPHtKLEjMfLXpQVex6kLrreBivaFEv/
 AiAAa3F1Gbw9n9xfuOAR56Xm2XsrryO5U+pwY3oBmh1FI5DP9WnJKTY00r5r1jBgrLDM1N4pGnm
 l+zj1n/F9vQw+K8fE0KFUtew7+dm4lZbOQPQCqQwK+BRgSB4bMWubSnZMwDl2D71JhwCvbf5QUS
 IWGUPK3Ztv4suRiYuNFuEy12Km0cSXnYoSEeK/y0MzXIV6bZSOqkHCBZtukx5Y+GQIVqTpL7CGB
 10gZqKUb6ig1HcotXew+CPxjZzqXE0tNuZ7MHFfGBn7wMQ1A2QPsvGHn4euI6/8IiJjgLIvzZj0
 e24RtFlEXJ13l3CMEa9CiYGxw49h6qxJ2T8i4xT6ld3M1GaIAsoOxJCBJgZLss1quEAEqt+Sxdk
 ZWRrlSUgGH6REi0Jr3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6BXCU4YxqsVU
 xKHkiRPGj1v8AanbMxXKIqIom1o4vkS/VjwUYur5au3Z+5ltTPpRPxdg+ycBihGVEmpHUn8/iB1
 m5gJ1cOTPL72bta4sCE72yDhT76Ar6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..21550d25ebe8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4487,7 +4487,7 @@ cci1_i2c1: i2c-bus@1 {
 		};
 
 		camss: camss@ac6a000 {
-			compatible = "qcom,sm8250-camss";
+			compatible = "qcom,sm8250pix-camss";
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
-- 
2.34.1

