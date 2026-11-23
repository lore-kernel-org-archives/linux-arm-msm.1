Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467359;
	b=IDNV6p/wKe7ZRYci6BSG0tjTqQRDHqzR6l914Hd+YSTfTajaHE6my2cgDPNHLe9ykSrC
	 t2ukZcG2VtrSaoVT6WsMNGrArn14QMrpRwuT/ZKLzsdQJmVpleXPsXSL1pwGykF0poqd6
	 +Gbymo74lwW0rxfL3B9gKnFPvSE9N1f/qQc5Ql7eRwYCDcELPsJfS29SUdlvjX7X9QVPf
	 sGia11AqPUK7p8hkdWefINafTxlhAE5HiVeiQPATNp4yY9S3Lp1CHYPB/AwZ+0u/tywLy
	 3E2ONbCqmXxq4lKShZdK9qv0cC2i86MF/u4JEOlbVkI6r96Mez6D/PJnsRspUsnnNRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
	b=MCNWpMiCVLrJM7kZfxrnnlICsoW9Mp/APu1WrpW6rmn3MH+Qku0I9mi59yVMva9QeUbZ
	 xnTyC77q1q+RyoL1/SMEHB0FG5expyzM0x7BW33SvWFz31I3E1R0u5ISCWwgo6e1ERPR+
	 VPYBPS01dzKg4c8xDJwnERp3CGCSz8ATSm3o/wzsYvZsFYRZ7EEKBC1nOf3keVTlFbr/3
	 3sN5Pcf7WVQlS3HSZ0QeJ+LJg/Bx2qY3jz1a3XFPQkTgllxMFOitJZMiqX5Ij3aDNoPYS
	 lT30EgIgzJ1++IVZA25G34Uc4GbgmwZXsheJcBKQ+ST5YoWpHF30mVRdIerVQWEtFqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yutb2C6u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E04606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E04606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yutb2C6u
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuODQ2349973
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=; b=Fx1YEHePkEIEbEYW
	DhVG9OabOyItaKaqLpwpyI4QA/LS+r/OrKMZgfdc4s/lr6s6EwLJPK60p7kkpryd
	WANzPuSP9hqabKBLljK4ssJXXQHaybm1EiEo9QMshW2DzsKe4qZ7PnBSAa2OQkgO
	yCr0PLdvqy5HR89EB8+Ox8UG2MLfsnwyFNhfSy83Iil6GjH3R6ZZQm5CzRiwOFiO
	kYv8Kt9E675aXNprt1l81qcCAeBy/YBJMqeBdpXU2r065eyDJdu70OTXJVESlWl9
	l0CKzKthG9HGgGxzuhx53iJSBiiQQcMQDBDq4hPNVhIbmdj9W+AhhcnyJp20RKJY
	pST2xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so3427387eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467357; x=1796072157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=Yutb2C6u/HiwDijPC4cRR10cCND9KDbXjo3cw4EX+zZ/3UOkA9XoYevI37tgEs/UHQ
         XkNjpscfp9tnJFvfk8ufboPr6kwm5nS4DFI7v2Je6zO9mEQHO1/WxAMetxYtwlapLU5I
         tFFdgRdm5LrEo68T+9HXsULk8mNnK+qMowhR/CF47QKtOMauT5rcBTipEE/Y0ck5N1ls
         a+dOaGUoudUBUrLxWQ9uB2xqZ/Biw808AY1fFrp0YPeqpY44bdvu+bgi0wzfAkq6NAK+
         +GaQK4RM5bR70StC6ENd+bRm7reWSWU2P9dDWd1N1WTkueymZn4tm+GMJRJac37EZ1ua
         PvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467357; x=1796072157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=xy3jeqhDfQeoERmbpe8R7NvQFjuVcVbwebTzrl7TqAr4Q/XhAzIzsVAAaYOBSlfwOy
         tdmAvrU6S4V665TSc1J0Ov9hvmxbbRkFC3ay0uZUcmZqX5uiABQQHIT0/kuhFPjIxzDw
         MTLNXR9oEiLSMkPQnCrMwHwWQ7VueicQVojWVeH/41FulXeJg5cnHO0uzW5lXWHmNTci
         uzwjz4/hptWftM0J/gRtmDB1/DEs67PvUlDWsDF141UyyGxUbf4hFg1sBvvUxj8JM9tc
         LrlFtEm5Rr2PG/0QftLCj5p+vA1cfnjNF79qYsHxrLKiuec8pJOZnbu2AfjWeGzzsTBq
         Nrsw==
X-Forwarded-Encrypted: i=1; AL+hErG2Z9PJVQodDRwzBDsAnrCuc1H4MrPbBxd5Qyvk73uF59FNc/IQH3aDYrS5wZCWK8hnaAJIyH2ipwWNxu+4@vger.kernel.org
X-Gm-Message-State: APuU4Z8/m4LdykxeVW25r1lJgG5pCSm+KrxK/AINKLjEpQJ2drEqjC8G
	yv755mr3JB4jO/gW2IarCt9wM5uKTC37ZeIBDihI+XntHv6SzzvzCl2S30Py2xd31PqAAJaRD9J
	JqIURT1zVONpSaPpQaKHcmOxmqOS4zJZe/QiV0cqLekbI1Ld+TYyj4Jkc0ZELRrGnxm8J
X-Gm-Gg: AZFdTZfT/xEEgHYrvd+dCLGTj19rk7Whytvv9rtoUgrKokJMwdclLw4Y5K3BmCvWrjP
	WWoUXg/ASh8iOGi90UAjjW2dSnqwvWbcn5AqVv6jB41YhAmv503ZxD1oOC+Ynpgd/HRP5l8+hU4
	JxHWsmcfbb2hz5Muig2xE7vdovaDOtG4InsguOk19uUz6M+H7bmw+C8mQi8/aZls416ISziYV6M
	FOwitr5SNQ+abMqh5FTiO+L06Yo/2joyUQCnNrv2tLsskAg6kHGRLw//WmDeFmgrjLcDERbQPYw
	YFrR1a23a4XvvjeP/lZuwwcW36k+/fkl1JH8rYs36rKZoJzrVDmATgpBK3wX1RZoI4DHL1atug9
	luj+8E8Q2/Ypp4pyzP9qpmIiAniS4JLg4NEvWrFNuQXCenDVDcezR0VehK5teeXlbXAF0uoFpTF
	2oH0HBvhEK
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805725eec.2.1795467357352;
        Mon, 23 Nov 2026 12:55:57 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805680eec.2.1795467356775;
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:48 +0530
Subject: [PATCH v5 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-bcl-hwmon-v5-8-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1250;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=p+DrbvohnZm70RkY44JTffgUjgoL+i7eEMdPZYxTZjA=;
 b=/V7wXZSXhkt0EpHZdk8xNOAG5ylHqm/2+sfQJBwLcAfPocvgsEIMFDithwf9rfQD/kDQHODQL
 b5oQJaQ2G7RCTZwrGScrPunlmiaQhmnr8+GWNz7DdAJeMCtTTR8zh8h
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXx7wlRLU3O3PF
 9IMUyUHFPtFO5Q9pQkqm1cvp6nNwUWAOETFurNRQHK8t5g6m6PimR2r/I132cJdNOOJLdHtfLnO
 WQEdnO9t8nD7fhvb4JRBiohZVg9/75M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXw6VHNorQqEah
 fPJ0bFLyrj/XRQyxx7niKwsHxCxKtirH1jOSefLy56lKvqrytWACiH9Z1rQcwczGpgHJnrXYcIa
 T6lQIGbIiQnTWHizQZr8o0HnbZODRMZHdZ+C3XTFTxKX51O9Pe/c8YIHhAAyyyEMXHPe7dhtWuo
 xUBnnygCY/oaHY4WbcaKBBL6NaL/z45RSuMk2Kn+MqHIHBBKp1oSzj7ESIXLVu+QZ0cmQRXxW5g
 WGJz/iCEBbtuJyDi2fkjRS0++1FY5YGnkwMYaye+Js1EeN1VyAX4E32Ac2p3Z4YN75Ak7Ivm79G
 e6sN1Ao4CMTc6TOLcAc3u7gEW4EoiqvTtJZ2A6Oo0sdAyP3SwdXiKrTS+cYjrfPuzPQvT5JUPud
 re0bxsKsIaHLci5lDDoLESM8kJiOI7WEHjCVFvN6cWmjS4MifQXDsaIxmejdmSKp9SMydBjV4FE
 XlAdvGb1wpJAcuohqyg==
X-Proofpoint-ORIG-GUID: u9VMdmWPs4pN6BDonX9vRtBE_QLoXz-L
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a85e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: u9VMdmWPs4pN6BDonX9vRtBE_QLoXz-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

