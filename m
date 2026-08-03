Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D11437107
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785325; cv=none; b=L3sF8ZYitvUkgKGJ8l8etU5L+pTx4XP/DprRCorqUfuIAbLNDEPgz7AbbV8L7szH4sm4NbKPSQZN3rUZLpAAuSgr76CDNUU0uwKNN6Rr19AFXUcJGoIeNVJCgX+rhWTOM69EfX4Z6TSyqdUki2qObwzEPHTIx379q4GMiisYqMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785325; c=relaxed/simple;
	bh=4FZGsEeKBJan6pXgYOjNUjuTyyrjSLTqxJwnLlXfxPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnMdN9yQiiUlxx/mon0pbRE0uHGRCRa2NwFGmeAqV7L4+bxu6oGAWcx1wp9WbZUpc6Y5WfaZPF6+6V6PQbFSBu2TRlDMRx/fp5XuGBtXe3HTMj4pXnHHV125ftTkggUSUmrem5FhSf5iqHC4xgRtmqbtUVNXz0yiRk0qRlFAgVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njlU0JDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCRKoPDD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njlU0JDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCRKoPDD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673IOdP01707229
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWn0jGAX/JCFoCMtmHVkUSNBCb88RMYT03vyTiaEeqI=; b=njlU0JDqccejE/Wa
	O81EeYUjcMzIJp6tLCCpiYVS6RdAqrnpxSS1MA2HdHLw0+a7oF0wETADuTMDar9H
	9HxM8wSXLboz+Msx86cZnHGrisDWTu1RyXtwc7fqzbwiMMkMHq4oRPCkMMkKjL2d
	tTTdGfA+qPubBVKXsBV73/XzaQdZPzpDB/4xWLQSKs/WmF235f/fv0nphETfy/LX
	XuFFEuCjhBqQ9RJT2iWSlHz3v4TpNBBh+rB73krgO7PvbQnjltPO5Wbc5puxRrOq
	KpGLOVXannZb94ZpFhpqe8uVeARaOzRsitg95fh3tywnTgU15wP5KAgPuDBKOqfl
	n4PVaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sgkyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:28:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3796976a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785322; x=1786390122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWn0jGAX/JCFoCMtmHVkUSNBCb88RMYT03vyTiaEeqI=;
        b=XCRKoPDDOYh5Bui5TufN8l1Nqim3fnhi/rApxFsZusHZQsXsvV9Cn5k7Lt0CvPjRVb
         c2FjQUk3X1mPtGkA7DODHgQ6P4e1SXrPoX/E+4SDzi9bAbStJ+CnBHnJBx134nPhd0Jg
         FbDIGMbUilmc74NhcMmfCLGjiv454ivs2iLoHSj2dsSwuMEbv1e52ZKa0oJZodV2yHw4
         qatnzOxHnZkIW87ef/ntzM//zQIZc+iGSJssbWw6FUVjkCzcVhHxyAB+/5me770XWcY+
         +X1DmvAtbiDVglR7580YSYg8JSkFe+J3fgN2tcj9X78Za4appzqIecxYDoTR4XA+gTcj
         07Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785322; x=1786390122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWn0jGAX/JCFoCMtmHVkUSNBCb88RMYT03vyTiaEeqI=;
        b=oByZdH4B9m5tQIisSCmWjaYCv9sdYBvEsYhv2B3gGLGuwtoz1l93TjK7cy8jAc4Ecp
         pyxhbIxLKi9g9Jfk2W2NFOljLo/flcrrI+jNpBoWdNABHTPOhSfy/ACA7NAvIWjGGwJK
         VXKJZu4UJqvY+BZJEdQ07YysljCVuRgpSroEaq02gFNQ+ZBE9e9kbnNNrIH4l9K+ZCTJ
         AeYFVHI+EY6aFiqgsk+odgz3ylz4olCb0vaNW4lbh6lNCqjRnM6P1VLwT8XoHRZPH1b3
         E5DCjkNpNv3cLESs2kCeOfLurI2LXkEodrQZOHXjZFPSKEFQ3pYZsOrfsSb9Qr6RjQkN
         iIdA==
X-Forwarded-Encrypted: i=1; AHgh+RpBBhsAblLrmjxDriWiYVrzAX4EtNRwSH1eHsT/UCIoe3gjqGndn/45vTMcodiemMhPdCcwE18neQUdSY+x@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuT7ZpXq/KUM9FNQ/LBPfgYhEiVYmhW2DkvxMUtolKDW8D4pV
	h3N/kgH09TKWInu46KDvffHEBgx2zGn9qz0XPmyNwUyRGzvemcWOfQfGZGs3sDwdu64nXq/LGvH
	WEVQjzQXMz1Y97YulNt7MlG6FKSMm2V96slyRncNE3drKm44uhkU5/rN2QMPMMZ5E64m4
X-Gm-Gg: AR+sD11tAIFcDCR/Ui5HMPl7Aa1n4VZnszt1zUydVKgwP3xPGzhC6F1VzGtApJvDRPz
	ff1lzDFX8lFCPkHq5aDNGsDiwC0YdYz7rfsDsf559HFr13ody3gzo64udsBJuiu5WkHu8dqdrfx
	VUlibGmQgDgaHdxG6sj8bwH3UUpSn3Jv+4EOM6APpdISrx66akJcdmb5ndr8/er/gM0BdN2ez/R
	riOJo8VI2t6QBUF29PnYSXnWv+lx5TtEP9U092rgHr8gZMpNkNFeZDLliBinp/xbWQjCvSMwdyZ
	R2oIRXSzeQ3Dvyyu2abfYS/T7XQv+y/iX4ArEd/emBlSB5GKcBHaXPo54lT4pAOaDg2LIe8bxCB
	gUw4ncHKHdBSdKDiSKfCiDNAJ/KvHTg==
X-Received: by 2002:a17:90b:5690:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-38fbc4d9f82mr10742131a91.26.1785785321873;
        Mon, 03 Aug 2026 12:28:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5690:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-38fbc4d9f82mr10742107a91.26.1785785321427;
        Mon, 03 Aug 2026 12:28:41 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:41 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:57:59 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk: fix SerDes PHY
 regulator supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-3-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1746;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=4FZGsEeKBJan6pXgYOjNUjuTyyrjSLTqxJwnLlXfxPk=;
 b=3PNx8Q2peALp3P73LT5Tp1DjKcUaYBq/vnmv4LOKH1fssusUZKAjavov3a3WwQhrvfWZOHevs
 Sc0RFLA1syUBHg+UdiTMM1t0/EBFTIenVfk5A+WTllVffl/XPbwJErA
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX5v5R1rsMdxpO
 xfL6nx+TsGoQyEqcVWVnUlTFTtfXri6o9wcGLK58rY4ZPKM6S+I33xad7rORmi9fxqHoH/ujRfo
 6ubSoE4cH60ddg1ZfUvRuX9MX7vgYN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX8wRI76t53Ler
 Y09apfsTa2nFawV1u+fqB4A+Up+q4uUiri1QxD9z+qV09L6eNwMdVDlRKB2oshRdyJMEBEetVtJ
 NuxVMqQsG6GErU9GcgvHN4oevl3riECMtM0LXbu2kkUMB9PCqWSArcxRN3WwdWspWJclLqbRaS7
 PcvN7/PVsPcPO5jwZ900Vdye+W0LIhFep38+5mdJ9OJwoyUfQnh5DboKleKYFeeNq9UI7f5PNxs
 xtV1ASIpHblVBRMxnua62GxM7wHzov95MX0/V+Ck0GeiJfaoy9wzbPH00+I/GRKsY/W3iX9zBvF
 9CySyBNCLN8qbmzd5x8wX/BJDpQ0YvoADUw8jyJJirqLEvCI8JtL8BB/4yBHxBCsnHXNrX9/rq9
 HLgv26IRTKE+HxYUaDsb2kfFZd4lRdqdLTHLFWzXI0HILE4csrxcw2m/9hDix/HiTzpSxpsQ+LT
 1NCqyeUmow5fi8fu/FQ==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70ebea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iUjljtK-pkRXqhAa9_AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 18BOAIGVPPGNbDV3zfhSgcujQyDuHYhT
X-Proofpoint-GUID: 18BOAIGVPPGNbDV3zfhSgcujQyDuHYhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY nodes were configured with 'phy-supply = <&vreg_l5a>',
which was incorrect on two counts: vreg_l5a is not a supply the PHY
requires, and only one rail was described whereas the hardware needs
two.

The PHY requires vdda-0p9 (vreg_l4a) and vdda-1p2 (vreg_l1c). Replace
the incorrect phy-supply with these two named properties on both the
base EVK node and the IFP mezzanine overlay.

Fixes: 71ee90ed1756 ("arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 3 ++-
 arch/arm64/boot/dts/qcom/lemans-evk.dts                | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e91d32df0695ae4059050e4e20b56..8651c412d0288fcf2ab69fbfaed86f68fb2b4fc5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -291,7 +291,8 @@ pcie@0,1 {
 };
 
 &serdes1 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0c53640c42a65c62375e71f7ae79cbc834a05888..5c046b9bfb3cdec59cffc1dfdbf9f2a51dc9721b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -978,7 +978,8 @@ &sdhc {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
 
 	status = "okay";
 };

-- 
2.34.1

