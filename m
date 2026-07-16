Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F419D37F72E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219378; cv=none; b=YGxprk9SHn7/6jC2vzthSdAnpslJjxhp1wrU2jmgeCQ1Id3SM+fqbyuij3VZV1umV645MjXvldaHJCISrtg5Qu6rpfZEkUQ0J/Z6jZmOQIgqeKkS00nujqHMYXLgk0GAwvZ0+r/xOd0lEDhDkKKVtsn6onFw7+HhDHXnNARHsvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219378; c=relaxed/simple;
	bh=v1hHFU9deXzUxaKHNDsda30JBQDNROQAE+8D9yGTboQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkSvlFg7TGeQlTjDzTTIWiqNZSRNhKBZ+bsxdKiiN0JaaD9NyD3NxeJDD8PY0p4xLTvhhX4kshnZc29sBGQ3RXwIfrf+6lRRoLh6Nc51uIRGF09hoVkdxN+eHZ1YELsfIL5xh1KMbPt0rdaaVaZsgWLQvi0F1dfnUVsyj6X4QGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpXI9ldY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g32LRO8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpXI9ldY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g32LRO8A"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSpJ73301957
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KLuVogy/rwqMJUkyzlQNASRE5shACItPIpk07cHb4Q=; b=ZpXI9ldYFnKuIOvS
	ERGsuYW8jTkSZepUhC8XdvqY8lEWCNj52uYvZlC4ShbWhzAQYKIdoNLiHbEjemAv
	JmzkVsrurfM/pFMRPA3fR7iL0vRRQd2DvGpzC0KTOK8zr/0nBftccwIbGW4bbwno
	3rF63b9RH9WOMoLEnksxxbrXKDzzh0R3S4cuPtmdnzMi5uEvCmwd/jW8rxfcCB+C
	tygXqh0jlWPWK7SPPuykcQDcN1KBRMw8MlvnYU8IHDsUPfONYjXN4a108WFeC2vC
	3YamCZfhWvFrfHjzHDXdNCdtozzOrZwZquvkk/X9dt2PKlVAVGza5z5ddNeoMlod
	i2ENtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex27na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:29:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so8173569a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219373; x=1784824173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KLuVogy/rwqMJUkyzlQNASRE5shACItPIpk07cHb4Q=;
        b=g32LRO8AKBpN8QzfR3DbtzRNI0Bs6IR+//K/KD8zZ1BPcR3OqW2ImCPbCLRKr7cnz5
         DrgDdIRzELlpPyHa19n+i/n+wfRBsBL3OVARPb6eWZ/cTliusPIfA9WkR8O87FnIc3Rq
         EXEj1U1XSxf8BjrDc1+YModqeSjxit46kmDKH0VfIkyqWx3VRcyfATndbTHHbCfSEHXZ
         QX2G/PjmmYWP46CIm0yyscVFiQu60epBm3p65IycQGqdkWfVrnaOBPyh4MICkP8BMgt6
         vRpK0qieNEmykUe80MpRBHaZw8LoRpczWSvC4vtJxmyTDGGfXD1mGxNglnlr3wJI7Xer
         SZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219373; x=1784824173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KLuVogy/rwqMJUkyzlQNASRE5shACItPIpk07cHb4Q=;
        b=Hdpu2TlNwMliccXDufIX6QF2h9tjhsvotndPgeZonH6sGvbMPorWzI5ILd4TKQFfqW
         TTTK11XgQ6sRBLnM0WSmY2CC8TpQOs1WTT3Sj6STSba2hyBqiVdvJ9naOWNLc96en1MH
         zipzvoBLAd/dqqHtQOaBEjnIP9OxaNiPHTfvfaYHbTXFMtirjDOzFSuwQj048FJMlzsL
         DDKGh99IXu4zzxU94Owf/t/ELcLrhrTSA6Jv3qvlxobEkQtezoacYAW9HLbzqbH5OlAO
         5NbDC+voWWMQ+akE7CJkJi2fBS0TBGnYNdboHeZJuk933uDqMhi0G2jgKYKJXbrYwa33
         4ROQ==
X-Gm-Message-State: AOJu0Yykxs/Uu6pDMLFe2cNTbcuTv81yJjYsoIRKERgviskt1/kupULr
	riA5MEtmwSdOlXD6tMzxrJmS8JNoQzQ2BtEzTH7eMY/nGfV5W8+W43eoxidO553C4OMvPMANz5p
	eWw1gI7qpEnpsfA1utTU6JF3btE7PYsHs/7cZoUXwPl3JEIIIUgMM7W+GpXd5mzWj+yXf
X-Gm-Gg: AfdE7cnJ2sAKz11jguVnXb6FJVbuM7Nbe242jAcYIHqDDDwGJkU65bTRljqBbCFqrxH
	rcsCm5G67dNl6ERq1klYr0sHg4nN/vGvUHt6THfl9Hm91nK2JMBKki09KV2zaDfeDA05ZAIOWzI
	3rfC5wColt6geMiS80lcGAtZhhJP1btjdHxwnJRlwm18ZVrlhotT5wHKRZYJLbJCpRw3qH3wmpP
	t7tPAgT//W8gl7HJ5K1afIVJazZR9yE4EZItK/lO6+DU5uTFWu7xfr80ptMPHkIi+Ez3fRR+9zz
	vy0/mdp20YMPbVKtRjKwI26teGXyK7nbHMHPinct2igHXTi2ienkDWy2iOrKE26JZXj7WJNFguK
	2TXBEOE/Gek/Ji1WxcfgtB27exq+X95yUSLNG6HSO+Ll+Xx0iM2BfexItUoATBLJM5lnqcA==
X-Received: by 2002:a05:6a20:734a:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3c110160a19mr23616831637.19.1784219373273;
        Thu, 16 Jul 2026 09:29:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:734a:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3c110160a19mr23616799637.19.1784219372777;
        Thu, 16 Jul 2026 09:29:32 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:32 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:09 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-3-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=887;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=v1hHFU9deXzUxaKHNDsda30JBQDNROQAE+8D9yGTboQ=;
 b=bMb8199eFlD4E6qw++E6wqvEcd8A9pTVPw02AvlVDZbBV9ESYyE8Jlq+FDSl6auSLEjNALN0g
 nAZc0Jy/MwcCo7qY+UYBc0iLeyUV3uMFEEFX/4gPO6LA5N0Ss6CEoPU
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a5906ee cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YV6aE2zFX9roIFle7WwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: qD3_3Fy2gHvYHniIatXGJsVxpM2M5GhT
X-Proofpoint-GUID: qD3_3Fy2gHvYHniIatXGJsVxpM2M5GhT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX0j9S5eZIpOKX
 Gm5YCnlSIpeBGoDydbSJV+SYD532OMCefJC121rUixsxNpWkz24e+9pgT1eLjJ7o15lZJB+d2kk
 f7+9tGGr6WTVlxOUZAu/gBHvLLKVSDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX+5vPP02KSh+C
 f/P5RcdvvotnM/w/HQbNRYUMxeVtE7FF3seBylRD1vi58JwPTL13ec1gPyCLHGyEbx+zpPgu2+n
 q2QUC3LPH51as9uPtqnllf5JE8nIvToyHtl6TYeq00UuWdW1036scfGH942oaZz44YkyG7U+Ai+
 ML9XbDacBjvJWqH0uksefv99XERVYI27vAXpsXh75YMsy+nNAMmak6etXT47nSEpW/CBiGHXx7P
 eYYc3/MwiUoBFZbe42DCo6zoHjB/ktxM2AKvIXS+DSBTswZHLBAWF+H/tgpUxlUUcJuA5+Pbpjt
 unIW8OIwRdHmI9hwQtBOvKVVe0sBa/q+gonz+z6sAOhAILvD1Jj5DeXWTYl/AJKy6ehOSOpJE+a
 /t+l25A37UETyHGhNGttSwGZqHJN6NGFAhE6YMoIcaMkDCBQaOtCW2Cz4Yzi9iupIRQbqFSfwcZ
 dHkhUqE4hOGHNIqv+yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160169

Enable primary USB controller in device mode on Shikra CQM platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..9867160470a8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,22 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

