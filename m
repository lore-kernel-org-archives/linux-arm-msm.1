Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9047F2D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627656; cv=none; b=YMmcHj3UbXjSg2GzIstxQ6xTVNUieRBB0SQFVZJfUJ/1YX8Yl3fA/I0QZFqtRNbRRdjaeGvDpGWVNwMuAlcGGeKbKa3hBAwCZMEEm7Y68f8V/AWblhdnvqpCw42yqsSeQbUS9xney8svKbIUwIsLfPoHxwD5lO5uPCoirfEJrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627656; c=relaxed/simple;
	bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvdW4t1fKqilb3shTbbRyLonpuKG9rmji+FvbPIsHKjQUd6BtLZimmRl+KaM8ci5JVxdNeAFzQLNvpYOgSdpxpmTgiop/vxtUBWKyrv5IJpd/tiAqzuhBBZDPvKQcbwC7E0W4WMn3blFtU3htAkafrBlWgY2o2kY0n7lehp+F7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jU2Ry+L/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcFPwIqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jU2Ry+L/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcFPwIqI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8doAb568757
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=; b=jU2Ry+L/f/9/F6vT
	2pvWY281G1MsU7GactLR7BHxkROB/T88FYbdWmVeArDXfrFJYe+cBuQ5Gd4qjUqE
	VnW14/nFRjxw1mi86/n0L8o2uBGxcQj68UcJpylKa3J8aQC8FB3yuKX3T4ixUCwP
	y3PC4mzmm6a5ktkrslUhfPweYJREHHmes5Mp8yroqLEMPoXou/qdr6BO/Mpthdsb
	/l62it4s0GffxIyRUF0Y+9k/rkAAGkPWRAivCQgPsrth08SNLPEUgGaI+iwmx2Yx
	4I9ai/sS3OLDy5Ax0rfcnJFySvGZ6KoFu5akz5/oHyyX+ErvQL1inW+VoH4jkFc8
	rLN3Tg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvskxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso272368805ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627651; x=1785232451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=PcFPwIqInz60m4BN7IwU1RJYM47Bzam7bvsmSxH+omWME814aDO52QjhUo5BfX7m/w
         ae1icqnysphPgUtZneWmTmQSm3194UfI29Bix7TfvOwfRalQDAqqxS3bqYlx2EjOZm38
         XLG9PQa9rthoibsd+W6Xq+xig4zQOyCXtOcB/DzQ3Nd9xNddIneYRZjP2Tqq9IJ02nJt
         CQZZS2QBLWyyujFrADwMEOdzRSk4Nd7SDJ1+0dC1dX2KRC7v56gXCl5VwcHoKTZPZGJb
         +MGZaVa9tWUSRjccQSFuiMyxuhEtsJLXhSKIg3uUMS7OWYc44uRmxZ7rANfU09YRSw6o
         wc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627651; x=1785232451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEU+od/n9kezYA4bc9/HXZ9tGN8JXCjIT3J8xUpS65Y=;
        b=O58ogqnln2eJPmxFzpPW6wwLeclLfV0NpWRiQY8fZ1FHnFAAcfOnWEY6rk7a98GOye
         j7UjcMV3DAza5rJg7rMmEp3CAqqsn2qJkeRmXbsNM+GJgtvb5jRidrK54W5flT70iwur
         +UH5VArHbAEpzlUQ+1RcOhH9qYlqK8KlxStCOSanGaUU070ESQA86Dxl+5V+Kj8gzd+S
         4wK6hii9WQt9lzxYofh0CccUeQPupFpPR9mqI2ghZ2YTnwkWYyn80tM+m/hqqe3AhXLB
         JVDCbi1yNW9ZPUp2hvkaznyGA8dAUAl7kpDEPm4wltHDvopzfI3wAmKLEqt3zBQCNl0X
         Ya1w==
X-Gm-Message-State: AOJu0YywLgz9Nf6UJttRuGQuys+vECP+QP/xTNek3YAi1GezvQJxMKn7
	eLeK84lsbmNRUBktrhxEZjEOsgOl7vRclmiV9NH3O3uZriX4FwfieXmLrTlIcFWA5tYQEcECQop
	53uokiVxJTgs7SsF/0aBLBDESxqnGVq9COIqwHPbftZ4whYC84Jd1oKp5zPF6UUv4qHUaS3NH6k
	Og
X-Gm-Gg: AR+sD10locYRMq+Z5kXB875gg4iAgcPgK3kPPvVkV5l7ErfasSshPZPwXbCEBqBN94J
	xpiPBUgGGrBITfgXF03C3st5UYQV7vPMdOWwMNrtNzPap932+CFYgonEOqvsoyQvTfRcUMdQHH5
	pNTA7C697/NKTbWI/uaFxXnkixOCJe0Hqkgl/USxq3FllvcDd5dDja0q2aKbWRdOrnL6ML7eN8U
	iG0Mhh27lMRrhznZLt9ixtVfbphCh+wFC25vQZ5GvXA4Rg4ZRz+z0kLHCd8zXCpRpgIo2Om40Qq
	SNL8yhXkmIGb/9Bpf9xv6GJNkyffccaO5wF9Ts/5ULgaijS2C1JdBe0/L1uXhOfgF+0MwW6yxIT
	bNlR1tBD0DHC/ag8lrGIqqc+XGu2iTDwCG03lnU35hJLs2GJ/NxZms86vn1OyZrIuOS6CqA==
X-Received: by 2002:a17:903:13c6:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2cf348686a0mr189047225ad.19.1784627651258;
        Tue, 21 Jul 2026 02:54:11 -0700 (PDT)
X-Received: by 2002:a17:903:13c6:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2cf348686a0mr189046975ad.19.1784627650811;
        Tue, 21 Jul 2026 02:54:10 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:54:09 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:48 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-4-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=1148;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=O4ieXzCqLQFPHuFkvy/A9oNVBZ8iHeLxT7KjJawmoMk=;
 b=nX0+oHRVOT/8hy2JeZqlgrRX+yNUpOOilCAnCFOqnVxG/qt+/MyMr8GD/uRYT8I+HIQeJWRGY
 eIHLL07yncnDepgCooWhcv1Zz2HnuthD/i8W+ZWxu6HCfOkdX5G/isE
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: O9lbZbEC5NMMDDQ3Z6a5cQ2lS4195iNJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX3+UKgybhbbrs
 nvMzwrVYQytApWqc3A4qeRBpUm8WXOZF6ZGy7uQGPFemhMPgaBaU1/IvrDiPoObXdc/rTaLd7Ib
 Zey9ts5OtPJorbunVa5rVDA1lQfEmbs=
X-Proofpoint-GUID: O9lbZbEC5NMMDDQ3Z6a5cQ2lS4195iNJ
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f41c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bymAw6jGh9HDV1aGW0AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX3r2vVB5/npG4
 lHVGHg/OvbBNYvhZxJ/UK5Am+zYBOJma8AzHOwXjEGnuPrugao/3lIX+V53yh6lTSeFUErfmEjd
 gxhytp/dokBGUa+lwp8hKMX+5dQOd14ylpofun00GSiUGNl6Qf7m5Hx4hHHdbElUvz9RNWrGZLa
 bLfNVTQhqgGD62avzk36nm1Xlz9HdQQ3FL1J52BiyL/y2dWB2xzfoLqS5T1wFzZ5AXtO0Yq1KO5
 2HRWNgpGxG/gv34oFBkIY2skXXzZ4HcHvQxr8UEusvPEOhgoo/a7G/zuhW5cwZHesxybuLpSDrv
 5rPLGz8GvIH1lV+cbGWdLDhYzBr673RBZfjNWxgYkxSIocCLSyH++QuGPSYsfv+xjHzofy4kcRj
 /4Va9IsDXE1Ey3SzaPD1QbabLc2t2LW76KhXE1hwqLOWZyQr95yX2KDx7neNqtdvzz/gHd+XBOD
 Heh60XW8eMUBF8lhjGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210104

Enable both usb controllers in device mode on Shikra IQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..2d4e34ec3b82 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

