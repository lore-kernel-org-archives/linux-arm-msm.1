Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79EA41F35C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232495; cv=none; b=T7ef+MCedrLbFoM2RuA10KkoCs9XR8FbttuZeRbtbyEtZhU9Ge4UldswfLaqeUAH/ogrY72EMXC7qDLIk9En1NMOdlKUXkwsG/QuYFvmnWcwvNGWfRRPMDrS7Wu2mopoXfNYRBuxLIjLucAwUQvBKvahPwayxFmwOh5gg3TqGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232495; c=relaxed/simple;
	bh=oi6FyzyVJnz9Mk995hby2l9AHSSEOthgArlwn+kBN9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Am9QC7wpewxeZaXL2jebWQSvyt1hPKO55tm6gJHri+PU8X7Ddwm5d7ai2dLx+oEE9UCaZNlbNtlcqqOiBTf2H0L7LBNzG3ExKnYmfxu/hJK5LxW4HIsRX6qoaZ/aPrJnBqSOi0UIoeUGV3Il0rnlQvLk6EG7dd5MykDyGhlSxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTtDCymF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PykBAl1f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTtDCymF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PykBAl1f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82LbL2359345
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAMrgILvwzWqIrQMJOhqF/nOJIjycXqb0wNzcVzY6u8=; b=hTtDCymFr282rfw+
	f5sC3/U1oOQJPjqIiFWcog49YvtxKJtDG11p+G/vDA9mbAMiRYM2YLjRBNHyB0Kf
	96yX9ncvPJabnb8LKKjV+8uC4B8l0tA7kjy47zxA2PMrnT2mK+XdQHzzgscK2/Zl
	Gv4menMVhf9xiBelKhDvK43PEeQzE/BEkXCoCy/j+P85wf0YWxl7Iy1KSmviYwT0
	xQ40o6UZC6RbArCu2wKvwkTkfticciOoxbykBzP0oD+jnqAhqlZmTgQ/242z5w39
	4bwkl+ftoSBgzBtj3yoJJmyblqNG8kpi2aR4hUekD9uBcH5px/W3+qW9145Z8DRC
	9obflQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y1an8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:54:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso37980165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232492; x=1785837292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAMrgILvwzWqIrQMJOhqF/nOJIjycXqb0wNzcVzY6u8=;
        b=PykBAl1fI71YE99TLE3nHNoSjpHWfan7L9EBGOxdYa2/G+wDypvjm1d5pQbPIqJCZA
         5ZgyRtcrsBtBcmFrtUHGZNAd6AMT8SeWvgCS07vUhJtjV74gT6kh0x05gtdjW9R35hFR
         rhhhItD0rsHKzdvYi3CjTg2uDpOHWSVopX260zVTHPYYrhT+5cqoNWTLKJdaKd9JNj7L
         nrujfoWoJJFeRSdafv9Yl8fz5V8FfNsuXbJRrIXiFbhPPirdt0s0CMz5FVrCeh2G08Xs
         PAcuRFapeJ/gcci7Q9OwffACd0P6Smrt5OJyR8P0sArsH7lRvyzfn5rYASVGbccZFdKP
         RQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232492; x=1785837292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAMrgILvwzWqIrQMJOhqF/nOJIjycXqb0wNzcVzY6u8=;
        b=CrzdS7COwDUemH4A/00/waNEU9q3s6mqoZVuWdhm+0IH8/l80NDgwLWeWqU1Sas6S9
         A/alqrwtBndIFTtCGs1G/vcH4SVaZCBms9Z4XlvZpOxieLLMV5uC56b87+jHiG7dGE87
         BZTlukpJvEwja8tJuovFF2UXPqeXiPgGosPD7TSRp/jgLonbXlTTDFOrT8D5cODrmKNI
         vS3WeVFp4F50OWhzLUqEnakgPPxungsmvkt5+t6Ff+9N3UpydACN202PxbjV1r0xKznb
         D1TpdivZ4oGWOD4kqt9Z4y9b4L2WkX0SzYrlIcRMrSR6Q1L2MQQjsH73vGejbokotDL2
         TS6g==
X-Gm-Message-State: AOJu0YyUi3+JY+3ZP4jZRKAaRe3mRt28NH1mwoPYOZMMWEfyEkcb/yRG
	8sofYaRXFyuqxxC/VpQj63Y77AlSzQ6DOsiZ+Yp5JNwXemTsVGhZA9m9l/wydm+2Kh1NoeTph8V
	fclk5Drnt5n+JfHCDFYAKaXBxH982RnniTzi34Q/t/Xsp42utAebfVb1pwiyaFXOVx9IZ
X-Gm-Gg: AR+sD13inF/cUDz17ql2Vo1Qv9hBC8afo99zvRTksuwjVQ2/Qrp6XgrLuvvI6YJ42br
	B1HDCoDk+m8U3kC/2xNjJX5RcwqRQioZ5YYqg3ajmCe3wfH194qVsdn2nHC71x9Q8iW3CQfsJtI
	0Ms4Jtb6AoL2ygISLrh1HdEIktUd6dKoQ37Fs/1tm9sxu3orkLReZSDa98erdJ9WYLxOO2SESpu
	CyogGR8xc3VvBiQt0mWirGK3jeN29xm8Tkt4QzBfHtqFyPzjC9A0mHQ9SzRrRdR4mY2mSEpXTBH
	K0R4YgcY4SlrBROm3Rv+fXUftD6i/lZXLqpF4OlWLkFEyu3B+oMZlji+pZ09S6WR98MvcrkDQ57
	6CTQfrNi7DIpMqKth4kXvyQsxVYN0tGMYJmWb4FooJNmxagJFHxDnCaS0k894EJBzIH03pw9NMQ
	==
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr19418265ad.10.1785232492002;
        Tue, 28 Jul 2026 02:54:52 -0700 (PDT)
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr19418045ad.10.1785232491556;
        Tue, 28 Jul 2026 02:54:51 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d00599b631sm20264945ad.42.2026.07.28.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:54:51 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:53:56 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785232480; l=1369;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=oi6FyzyVJnz9Mk995hby2l9AHSSEOthgArlwn+kBN9w=;
 b=w9D7yyJ8jEVo8k9K/5FD4LYY2Byw2/aJyjWn/OM35jT+anI0oltHvluKE36ySddqWhqUo+VKE
 u6hhvKqRYMeCmKtsIhKHHrPiMU+Tv9ABQ1cf4aumrYSqD6DKFI0oPnw
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a687c6c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7g7wA4PAc6ioHu1SxIwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX3Lry/OVmMnRF
 KWT8SKksLVD1PLV48pus+O8Vu4oGYafNlLE7+na9f3YBpoio8YlxgyYtogA4ziOS2sq59uj2jMN
 FO+lxizmqMqaOTaOeEbWunm+6b9hDGQ=
X-Proofpoint-ORIG-GUID: Bj9EK5Q1XECu-jLmje1gJkkOr-USsfmy
X-Proofpoint-GUID: Bj9EK5Q1XECu-jLmje1gJkkOr-USsfmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX+au4wpNkIb5z
 688veMhdT75rWjugkzLSaVrvW89PFpPR0dTGxo+GffFdnm/bCnww0bLSph/Zi+TwitbQRjrCRAm
 5ppjOXLnCb/Xd7iXkwYiFhLQFTuDiJgwElD5Wp1TXdPUEAPBIggQmFe72aXePuxFDS3HBgGRNeL
 ya2hlO0fjM3oz2Xsrn2TGFfIUiRExYwUtpOu89NdNx8U5vLhlqyefWgUvIhF9x5hrmP61LyWA7V
 NFB84mS08BKxl7fhuzyGhQOb5Ne+qhuH+VDgbl+WjfnODRzMGzf5HLhotsI+aXx1mYUjndZyT34
 w8BXJp8F/Gya7NEubo4zH52V7tyi0YoHLrWcV6V8EZws1ByePqRpVeQJOVtV+J7GbM62t7iehDI
 /yAHUY6qFdDa1nkkXOHdCvzQuw3zSwbr+2JlunJBTS5jIt8AxuHdNVtiA5m5oZe6vDjh4XaW/1g
 DHaEo32mjWdcZUkF3AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

Add the Inline Crypto Engine (ICE) device node to describe the
hardware-accelerated inline encryption for UFS storage on the
Hamoa IoT EVK board (Qualcomm X1E80100 SoC).

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf957672b4b9658988359e79d8a432fd93..abec577c062d53952528f3bd0330638ea53b83b3 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3894,6 +3894,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -3939,6 +3941,17 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.43.0

