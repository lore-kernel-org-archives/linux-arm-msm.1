Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBD252BE3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687464; cv=none; b=a7BFWt3MY6ZyNisUTh26OAsHg1psFn73P6odJapMhUFMUd3AUas+Kr9ty/BSYmLXoTYqQkEAmaMAUoJWGTrNmmqWs8aIxrRzz7hbahFWNtVyZ39ocrZ/hVVJTmdvxoDA68GkaskKi1wfsLo/ZZLBYxe/hshEaeMX6HK5UroB1nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687464; c=relaxed/simple;
	bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX8Y90JGwGh+IOoi3K3NdLNJtvW5S8XQaZj9s8XkTMpC2y1e/be+FXSryZfVZJdeEYO1ak+RjOS39Fvin8xj76AqnQtQ8WKUPhJkTx1a16RcY54vXWMf3eHCn9lp9lSXXUCxQBzL2T7hcmaaWMpFMYBGpM5qTxljLGavLqcEDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6hPmdAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4uVXGAD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6hPmdAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4uVXGAD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdXa204839
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=; b=E6hPmdAZCN3EXaDH
	K3Qn7JF5m/G5mLsVOSSqbimYgm0SWeinMJPYG8unXlQqPY9XO5WszP+GnWjCNt//
	xqRYxBfjIe4FMGmQfzCSlm+OzPgi0B4QZAybLpir9DjIHNlkszbI4xVjvaXVResB
	UnzSlcQwgnZrnwE3arXMNfw4ul7hOQP+p0m0IJoXR0PRm3pRrLR/Egf3+ZSeWK2L
	XW6DgSQDJIgQ0JXgE8UBDv20oPQnok6Z1rj2GDAmIN8DWGRXVWvnHmu9GDyngeiG
	Q50hohQ9wGibmT+52qArm405Ghi7LFTUekdrAnyhgYRne7bcMS/EpFuNbV6og+aX
	Gd5AaA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144u48b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:59 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8a9977a4261so46354867b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687459; x=1791292259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=d4uVXGADl/wbMBPwOQh6CJHOFbwEMw/k+wjuccHh8roByDVGe6zBMZNEJyHUbSiEhT
         8Lqi8ycsAfx8ssjfp/i2dw+Scc4x+hi8U+1RhL3Vle5pkN/vY61RL5MknFDRoSSJzVoV
         m03HzyF+n1s8nKZu1zMK7kCak0i1G4fv6SpQZV8mEnYk2TbiQdHW2TrifFvFrbWkjoqA
         2LCoUOWuHv8Zn/cCM04P/tLHN+wrHM4MYQyaSg+QBGYPBvubtbBl+52gA44dnf48Wazs
         ti6hVNTrdi2HtH6+I1m8VOdU4bDIb+sj0e27k0W4iQ2EG1F23sGZBFHSwfh+EN6C3tuD
         IM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687459; x=1791292259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=Zn+ZeTfb4BqIR/r8dy/PmuQQrJMAhOcCX5tjxyVVJ5Rff++Nr56VqLX5tRLpKKujpM
         +aPsWKtpJV1EvuAKCQsE5RxlfAerjiVQHk+wBwizsk/4J4MzdAgcfGu2yeId9gYeacx8
         0hoxdj3r/rgJ+QhXJCk05VwjNttsyVmOFF/v+Wgvph9sMUdNFpSS1zeWP9i2Ri1K1RZW
         B00q6QkevySX7R9WYoDFpYWqCqN8QbOClVe77QofZY2zcKwJitLfFpgmY6hOTQI9sX0p
         4othGAx2IQPZ33tZ4J+G2HcO62CubU7WbDGQVUYTY6CBZPwViStnAmwgxqoHliBH1LQU
         0F7Q==
X-Forwarded-Encrypted: i=1; AKwUvByOIYrU2lH9A+l8rhBuf3U2Cp5z2VvBtyx8BPNzApRFSls0mlgfLnFc2z6FzX4vwOPySe5jbQOyytjnb9c+@vger.kernel.org
X-Gm-Message-State: AFq9FYJvHd3hxyeJhSfHVzsgZwd/ikfWKTRs6vsZDtCVVwPufdyovXso
	SgXbw7ASXfm9VH2Lf7s/U6luKxGIxybefvGXOA4CJwiI0MXj+uyR6msG/V1StOgyvfirM5xpafh
	WgvXWLd7pQZvtM/YDgNZDLEFi5hb78T7V+n9y83nZva1PQctgs+NAZHGXy1jfu0qWOE3e
X-Gm-Gg: AYBFou3LvfBm7UwNkJS1lpR/bNEc72kVTdw4lsn6zGH8Qba/odXyIqJOnnEWHSadmzg
	ris0np+mXeVBipz6lAXjuBlVzJg0GcdIFs4zEgHWROJH8cEEeP695p2TMJVWJJzhQDkMsa06u+j
	357RyyfWq1GpjbvDbZNrOalqox55WtGTqBuxc9gbdNWdlzYha/3mVaDqDpqE6xPHpHkLwl0DCRC
	HihIKKGfXzAlaE2VDQwd7ImK9/PPAP8Gw/+UvMTbRB5qXdXXhJts7mMuqrEnVSC9sp34AYjsFge
	y19n+WquafICZ+x+CFsnKUHP0a5CjyuMBz42Yad4cnv9XvplxnlNrdGiNSScbEI6lyjI5BvXRDT
	5y7yMArzWCYpbzD07i09MBGEbDNo0uaBfEas=
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906999d50.53.1790687459330;
        Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906941d50.53.1790687458764;
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:42 +0530
Subject: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1212;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
 b=u4iXrFBZgUFB5iptFcMjRQeUVV5k2ovuNLVXsWXLgTQXraWQ453EYM541qN2VQ5O4pPZBXkcF
 CXW2USgM/CZBNn4CMkNlUCSw2g554xmq0KthIYZfSLLDDIkfPVcYHFp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1Iw37hEQHTr9
 dc++ADJeQg5gadxORekOZs05b39lbVkh593c4+Cgki2ua7aJpT1yAsKsFJE+a35nrw0rooQpGvn
 X/MGymzgY3MDlNoc5Yby3t5TTTZwcGgNXDfKAuIk9V3kmka7iecJ9NeN2vZCR59dYM9lZRlKK4+
 BQ20uGKJKFkhVTn7Dg3sGevNiDBeZpBF1sdbD8ahv6Ben0VZLoU0lcjWSnZPwQp1MtqbAma8MlA
 BIG9+6nNAj11hMoyM5q1W3IHtRGadHVbkSdJ08SCQ/ZRlzIifBAOfqAod3BEE15YHBfRBnOdstS
 nT4bL5Q+uwAue4oIkqOcVTSYPhMk/1x2QzMKLm0N3wyW9q2l1FijRtYhhIUYcafMkdCom973ikU
 mwpNhKrj9jPM2nGqkG973ksQU2/Bv0QxbY/cknrbHTZxJvNmYKoo8alxhkM4J1w0Qo98iWe4oR8
 3rMUtE31ExBJDFQN+sA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbb8e3 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: OhjGIsdB2y-5B-Nknui4qBekWDlNmpmp
X-Proofpoint-GUID: OhjGIsdB2y-5B-Nknui4qBekWDlNmpmp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX7pq1tB5e7S9V
 CvQPffRK9KQV/0pqPTejgefM3m4upY7PdRoAC5o+tfzDr7Gx+Ubm1gDWIkRMTXmYhpZHS4wlo4I
 XKX8Fyj3WA6rq/bwg1vYkQMnasbUAwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

