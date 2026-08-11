Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86953FC5C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463617; cv=none; b=QboWL8jEP1dzczwqgQq78ech55d0fC/zylTg4pXmQQj8R4Vns6MJm8UZBtneq1zras97MvWSL3o0sNDv82bcK3GwFs/BGv7+Uwk/NnpV68/DV221R7McVgY1MovDUJUWnInOHU42B8JUUJmUh/q+vBbbn+r0ZmlZRwM5nTAZvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463617; c=relaxed/simple;
	bh=a/Bp85Gwns8FUWjZGA43gS6PxJUrfuust6vHqofL4wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFSCO3PLCZ7LtCH8vO6rFbDsu90PhSIwrAgCZrCo4az4Sf7rnSHOMnp89oJ2O3QQH0n0MciPtO3w138klK9AUhT37DrTOokkCBnZTP3+c941XdkHj/epKNj83gEPQtzaeDps4Od3kDWA0JnY9QkN90p45QGQHfSliQSXgO651wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8LejGeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYInF2FC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8LejGeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYInF2FC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvjL766903
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=; b=p8LejGeM+HKN3F30
	8jTNOI0JXnLisw8vI7/1PKA2VRebNJs8/Pr/cwMDZszf7g6NaKCJBmWkIYYplMDF
	NuUODtyAcPmrqttjqAPG0v8lVuxXfL+K7JDGg8B7/lNC4a/8l5s4YSgapkgNpy73
	IOecY1bpavmGJRyz5pfnlRQq8zkCn8Mld4PmAQ9MtEtPYQmcs2jZsKh5A6XfmW7N
	vVEw+JDwCSdDOmNN3CvjtuAgxGlxt4UZf7Jpvg5qokqVBs8eiPBTdIEWj9GZZDrT
	RIFbp6zO5Hcx250aVVRtRcfD/+h+3xPxzaV5r5lrKeRR2szFqCNx7aR6I5wAolPj
	dQv6Xw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q11bmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:53:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so6643a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463614; x=1787068414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=;
        b=NYInF2FCoHUOX83jHU+SCHCUF6ohZK8IwUqb07zvtXR+ZZdR823fvvyS5NGtSwDbn+
         4JM1eKnpdiCouUe89WWvtjHPc8LqWZ+Q3fuAw7TO/Aj5jFxvRFmw4t86Ga174iCXpwmI
         F2T/VG2PvZtNFnMHUCttS0IvrukZavHmvSrZQrABAmAacuWRJqmlW/tRt6KtNgGDbVgI
         xvhDCC6Ex9zoveqMgaDmjmZPTqaXw4NtjtU1aeHvPjerSvghQKf57J1l+z/8oAQGDKYN
         FfT0bDXCraVZhTixOGB0mbTfBb031O6QD3UF8xnuhM1mpeYNoDAUtc8JpLUNvewxC6dP
         tSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463614; x=1787068414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=;
        b=U2Ffy36r3pXLu0KSRa02Vnr/xUKbKAz+4SvLc7bYSgnghnkXoY2IFog6krAB33i8He
         hUeJvu5uJS+y53elWeF8+S8WVRD3SLgrez6UggdSOxPNHx7AfJR3L+jAbeDL8FkXr8aT
         N+UYZ3WlTbdvyrc6Wc0Udsopz9eG/jyrTRSCxpDSb/QBLxfUqdh4YPajL5KwmI+VKzcj
         xhVCIZWq9wtvcdh5lFFKfJus6ZLq9Nh9auOrP2Lh28PHdyCBViBsEiGC6o4HijvgwgzH
         oT4oyoQqFTrvKG7RK65B0EEnCr03KK3jYKwrlyhzOhBDB7jOlsRTqiTlcVIbeXZUz2By
         jwCw==
X-Forwarded-Encrypted: i=1; AHgh+RrBuRG7WEmD8Y2Hm6UxyiFV9i+XhoxjoVYyodpW1VERH2TMdUBUMjhwceB8P2QrB5k4wn1thppNVN8l/sMn@vger.kernel.org
X-Gm-Message-State: AOJu0YxGeOSQlzFvsXm0TIli/k4aK3XBn4yn7yHiMxWcsTeWgaAaibMD
	9tbpmuEJEsr/v0jvSB+By/Ol5WC76yLvvNHVdG+4HvjJu1Kr3tN4LvOBJwkA5THBR3hPa/y3Hho
	ANz6gKdRtZcnqQ9d/09jD9Y2JZAn9WYkT++ZvNc4UdHMryaf0s8r5tKIutxHEK+ITHWzK
X-Gm-Gg: AR+sD10tVe4z71W7I1fz/Bv4/6mIUNZIKpUQt42kAMSjGEmVq587mfXYFV4X2MjiZD4
	AaKtjZBo0Z5EHQr3pZbDBTwkM8oiVUaYuA8dwfR5xIfclBKvKWI2Sl/1St97HRsjXvrL1NHgBnH
	2JKIMAJtOfjgb+idlZ3pmFx+J5ddiS6l3pwsd272LRDdoCv36nKlNZo4OUwNo/6eeMXgADycU38
	pVYXEKcp1qhFA/UYORMqe3D13ZryDnUKRQ9DGMnlRajg63JX8CTlFL2sZRnReE4886eAyjVkE4V
	YIuvvm1xVGohAIHin0PDxFlYlk9CIh9FuGDDvDh7aduHaUnFY+cB9f7pd96KHAMixNfJ2TfeN91
	3papYiat2m2+/F0E2Y59bDVtg1FXGcRmsEckuKeTUQ6m+ugVXN8/RgENgH20IN/RyQxMHP1HXTz
	VojNZcjybs417Xs4ZDNocTkvXMIXF5UOIcRqk=
X-Received: by 2002:a05:6a20:488:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cc379514c4mr1591808637.12.1786463613428;
        Tue, 11 Aug 2026 08:53:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:488:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cc379514c4mr1591713637.12.1786463612792;
        Tue, 11 Aug 2026 08:53:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm1143032eec.26.2026.08.11.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:53:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:23:10 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq9650: add interconnect-cells
 to GCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq9650_icc-v2-3-55b8efbd62c6@oss.qualcomm.com>
References: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
In-Reply-To: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: jv6msf_0A5zvkTNxJCl9GO5xoEy_fPWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX+Ukz8PR+n7W2
 0J0Grb2vw7cI6LDhgrUeBUuSOP5Fq7MFAQ9h2CpJ/kJy1oxVSckvO6v31KXWfKNaYfn6t5mXHRO
 dTwKb2egxJHBCX3ill/s+dbu5fmIt00MS11kJ25zFzEkZxgVQhvMtW2uTyI8m5Qw1ZI9O5mkIxv
 LhS7yj1O2OC8RooE5gTXQWQiV2JuV9p8WeJBQXtd0S25wTPVHmuGL5i4iCnKSS+EeYIt4z7YJNX
 Z5J9n3Ufrh4d3bfB3q9CuEXtriquiOqRAdTF78J+62/AJ15UhRr5HfnXB+UfA9OovqeXDC51iLM
 XytAaWwsqNPFy316WkAaYIwiyDAWFyrIQveLoPU+SwL+fdidIBrIKVpZ3yLwjQV7I+0qLymB5Om
 kia4nJdKxR4rdL36mlZ63m6CUkhJpcwSIr8RWka9kYrAlGIJw/rzxx+IukVmkNRlHVzSwLkz4H8
 NBCarBZI4HsIwaWM91g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfXxYTzLF03T+v5
 IlM5fwIiJiJ7QsiTDvhsSGg2Wb5+RiP5amYwqicvYL9pB/fUl5N+P32oqGzMhkvvm2ut+spb+F4
 S/XvYGPq+eiSe9/wmnFh097kGBykl6A=
X-Proofpoint-ORIG-GUID: jv6msf_0A5zvkTNxJCl9GO5xoEy_fPWq
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b457e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=reN9DiWUbCtN1Y_qNI4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

Add the '#interconnect-cells' property to the GCC clock controller node
to allow NOC-related clocks to be managed via the icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3d3b317c6a3c..4c442773de53 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -225,6 +225,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1917000 {

-- 
2.34.1

