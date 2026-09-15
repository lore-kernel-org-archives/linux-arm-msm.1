Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B1E3019D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459372; cv=none; b=ddctyPuneGjHbL/jw1X1/SrKaR9QUqcZdHKY6N2YD3TTpWHTTuGYcwRjY0FC3UYdh/PlT/dDEV3L65LrCz3x4G1bfqx9DVzktfqSDP/0uCq03tvHraHP/OaWcxuQj5hkzhX7fLSEGij4ZgNv6dzgUkqzB3qt8xqGbi8IDVwVA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459372; c=relaxed/simple;
	bh=52OWS8LnN4THzQP5thj4aW0prdXfz1T/78kDd7/irDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SOaMzeiI9kUJJiSk4dd1PCHOW8T7gvkhW0QSWFaK4AHfxe7U/Od4IKRG0UAKChiM+pgP5x87IfdtsRkIj+WnwR0aJfG+wiQ4jOhvPNkjT1JC7xEbtlUQ5pLP9pMZdOgG3T6AfAcO9fBFijYjXvMdDYx7ZQfv8HmYn+khNZHAWD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFYWjSWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJGxCV7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFYWjSWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJGxCV7g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZSs92250636
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFKzwv/5iLe0kTyFD7bp1j
	KPAZuYELnFQL/r2x17H+0=; b=IFYWjSWM5AfU6o0+W+L5/MGQq8OEVBe2PQu38/
	Oa1frtjQnwTIDJP5gvmwiFckYN9cQwa7BlliaRCSGWqVtc3SWTK+Q7Wsba8murso
	flLWVQcZfN7LpIOeVXdKpW+jo54C7RT6/IebuI8ffV4vH/6kROLRbdpHWqVGqNrZ
	U74xNHv8iEoU0CNiCRGZpoxpMTnovRqazpKvuw6zGfk4GxN+Xs/oAjgkbsyyuxDs
	MRo0kOnvR2JOXTGzEO1Vrgmbl3vGNWWCKCCed7Ut/XpePFImTI2DSScNy4yopD21
	zkmqIb5isFhHj3k1boVdkOn9TFzjnUCNtLlLQsBcKlHXCfjA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70pqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:02:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78830f4bebaso894604137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459369; x=1790064169; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFKzwv/5iLe0kTyFD7bp1jKPAZuYELnFQL/r2x17H+0=;
        b=XJGxCV7gRAPllOErpL6KPMpIGhCM4EyU1WFvRWcp/a0VQn1Qc2LcuCInrayHraCckE
         ar78vv2c29klypIg9UsoKHVXjS4nQgPiMgTNcXLvAQ0OGuBsIveK47p11pCgtvycSGGy
         EQId/AazA3WVTdEBQ9jGvFYDKgGJmqXajSr12vqugBYlnZUpq56AmY/IPnGa7Xp4Fec9
         HhVRTvUOePZFDd4YMWjU1PDEKROLVBJUBIPAu05ar+qu7LVKJnCwlO7OR+w4BUKVyYVv
         0C3n9Esq5PS27xnRaqQC3NcGBz6zKsvuNSg0BwHESwCWaQKI+wZJvs5KBZL8jcAKqoNl
         fKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459369; x=1790064169;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zFKzwv/5iLe0kTyFD7bp1jKPAZuYELnFQL/r2x17H+0=;
        b=T7GBPFFwxqjnPvvjDRug48oDbWJzvNkcS16eltnICFkjJBZDbfBLEctiNdvTtvdzet
         pVGUd3OQAEOxyEJ1x+PtFwF/2nIC2ONLsvR2wafouvCKeXvnF9JuiMs0l2YHn1tF8/J0
         bwAInOgcAZhGxuEZX3x9Kd5FdAAc6jlBltryoO6537bxdwPY1fAlcc0HKuvlJuv1/L2y
         lad01CJlO0YqTqmKMoXsbpglaevmjEIStDg63muz5ncp9IUsWPKfqP4ndgZ/yqrE62Rg
         vGX1zlvSvx2PZDMj5INwGe/R5Si5TZp2hfKi+7y9bzR0E1Q1O3HIROrdFWOxE38B0E7h
         OjHA==
X-Gm-Message-State: AFuF++lJn900gSW9xVrnlcBdvrgWIBfWWuHCCl61gwxtPawaE6YAQIYZ
	Pdooazw6AajFXNUenpFXgpyVWBIpVS7TvQhapm1TfJ+xj6g/OaSwbBYESz2BUJZmqngnQG9B20X
	75fMoE3crZPVCd5elDYgShhL246LcbMeJJemqeKt+a5nfLMfuRL3UvR6ubXf3OG9GELxZx2IwS3
	fA
X-Gm-Gg: AYBFou1Pu1hxMiHUjZ/cO+co4YGbe5Ay9MC6EbJiqYSXuPTfFe77N/3IdnosluLUFZe
	yCLddngS3m2+SiBDJmnPsjYEsCrpu0inEBzIKRbAaOW0wkPE92RFxrq5meodMzx7i7pxxBCfUcG
	it33qPUmIxsV0Co7krn7Ec6879HOD1iGdR903nFKJSMAElZcgqTQ1iXQrCHzeZORMX0VoXGETZr
	0Id0oPdp2SO3Hai8d7PDZ5YBNRakKGls7H0mH82FBjNWWbwck5SCgwemV4RKOczp6d1UiEfNeT6
	wrFIhQSFIHPmAGCCjjBu3xzBMQMLrCCG0/CT0ov5mOVtavGHDyhLyBSggPdJ9sroHfZypzaHpPE
	bQmldPTcG
X-Received: by 2002:a05:6102:41a6:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-79ed3794da1mr32210137.1.1789459369314;
        Tue, 15 Sep 2026 01:02:49 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-79ed3794da1mr32146137.1.1789459368728;
        Tue, 15 Sep 2026 01:02:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48556425e9.4.2026.09.15.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:02:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:02:41 +0300
Subject: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKD7qGoC/yXNQQ6CMBBA0auQWTtJi6lWr2JYyHSQMWmLHTAkh
 Ltbdfk2/2+gXIQVrs0Ghd+iklOFPTRA4z09GCVUQ2vak7lYh2FWfFGOqNFbZ1DDSLgoY1TFIRe
 cAkoKvCL549n1vifnGWpvKjzI+nvdur916Z9M83cA+/4BRdMdRI0AAAA=
X-Change-ID: 20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-c8375b8bc58e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=52OWS8LnN4THzQP5thj4aW0prdXfz1T/78kDd7/irDc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqPulwHkfYoggV+VdpxYsQe70bjox9WQO4abDx
 i6FRV4PcsqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqj7pQAKCRAbX0TJAJUV
 VhcOD/0av3hwj0UPUJ9e703e5feEMCEx7U+phqXvXXv7Gq28E94n5JrG2CR8YlJkiZ44tYa6rWz
 gvf9stzxuOYol9iJfcSaoTsaZnomc+i7NoFM8ByIluzhGKzcW9GDwjnhmx8GvObwdmPxb3qS84E
 hbFMceTfSjkNcFmm7l/iboXSUjgpaxB4kaRN6fcAd/NLzZH5vtgNJ2GyQJ/pflHWV+L8SYYCKTe
 waUgFkt1n6JthA/YRZCL+wIZYafu/+xhVGXkjhj+AY8duvQxcWYtsUvDB6tW1hfZIuy0MyhG5OT
 EDi73k56cruu3WwwamKogpsDb2obszDR2wssCOgxZ0OhhZUjWV/H6uIMPfiXs+puf81TopH8W5D
 qb4WrWPnl/BfjVT5f66OiFu7Kbc8TEJ0PxAUmvXWVVvwBGPIB6j6TuyCHEg3iDIkfzzXGc2rump
 O1Yw1HnmwJHfNSj8YUaT8mieLAa81IAIjj6ETZj/r2KtE9ZbpktCEqZgUnYPfNv5EqpW2n4Qzl0
 JvYBnC0Un9Z3y1yBiFABXj1+MDgzybLYlxKW4du/eFdnbV4VE5YakST67FpflUouKHkQxS1q08/
 UWX54zpZ6HfZmlZEa3N5SSNZBhP7AWbRYRwXKBDilroZb7CF6XMWEZY9lnDip5oXq9RuRyP/eyc
 Y2hXWS/t4d8nmKQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfXyaHlPJJFot4q
 8+5dSjPpaE6f8cBWEFBe/lvq83sotU0KYDZMQMZ2KXr6mhGdH/kcU1rJ9nS2KXQxWf6rqIaEqa4
 VWvJrOa7lokbcg27TrMr1xPzLNah7x1o7gz+qc1yauTeDb4D/TIc+3HvZwQR8Wpo2ju0G8fgu27
 B/Talit2kNqjPs+Rf1Q56avM3b3L8uxCk9ynVjbSkRVVhwuurjEPo2RZqhKDhsh7/qolIkCANsW
 theQPRoXaRAlUEAC2jJVbzjMg/qZ0kVPYmQhR4S3fseNdfsFqsmeFSdd/Qy2cS65IH4QlOCLdEl
 R7eMaxb3StBAsraNikShywU/53Ki2Ne08fNrS+00B6pURjnxLqtzVlFAp6k49ZuB60uyg5jrcJT
 gfaH0H1On4sevlBTXRSvS8WWM00fh5bVcXOVqG4bQbbjQc7Qor9AAtGixwFKGUvCOnu/MPUqS9u
 rkv+FNDQOnS6VEglVEA==
X-Proofpoint-GUID: XC6O5P7RPR96AV_ea07TGMKLVe3WKDyU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfX2UQLRw2mQvdX
 r7OEQcdGypXmBhuSiOla6kyFrvRmqnGkyumG7E6CvzFsyEMgjXfyOC/l7/ha/C4PD6SVV2sSqYE
 u+mgAsVBlfoE+IOvLZYilIcCuaQrzp8=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8fbaa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7FdngZgBNYIGrhQwqgA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: XC6O5P7RPR96AV_ea07TGMKLVe3WKDyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150114

Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
constant. This documents the selected RPMh power domain and avoids using
a magic value.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..ae2c259e8476 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3574,7 +3574,7 @@ sdhc_2: mmc@8804000 {
 			iommus = <&apps_smmu 0x6a0 0x0>;
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
-			power-domains = <&rpmhpd 0>;
+			power-domains = <&rpmhpd SM8150_MSS>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
 			status = "disabled";

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-c8375b8bc58e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

