Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986650;
	b=09UnQK5ZHuAvMjUtD21Pbk8Kkm9CiuAAThGVRAmH003YSc+AvdAd7REsINXyhX1IYyXb
	 C2WptYjaPWCnnimweGIYh4rPIfk1xYGDaS/IGKWBFks5JXQj2iZHClmJNEwekEsvv+hjn
	 5IM7OYz6QAdvyCGv15aT8LxoxIkl5Y+SWoGbG90mYGcktL2vbizR4sufrF13gujEiUsE4
	 uinB13Kx5Y7RtPQzL5CzMnoechFWR5U6RDQe/WVkmdHB/xLF2BL0gbxSdSIb1lUXYv5dA
	 k8ioBihfM2HJSxfK0pJxHOcHQR2O6DAvKYNJB+LPmT2OZn4wVFUvhTG2dmqkqLFXNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
	b=koZ1/LStVeErvDy9UqY3Bkmm6DYqtuDrkYYQIaA2KAMc3o0LRSc3aLr/Y71wgHLDenSX
	 N5r+ncT4pM8fjBqaBC3kNJvNXDsTVoN+PaYdfArZM58XPEi9YNJbmmCOL659KxJiBoC7r
	 uj8TsWIgKr0cdmORp/OepAjhQmuCnb+9c1dB8H9WJTICVaVXEA1TZMv7YMIgPCx/KtmNN
	 ec0MUIIRsctv7tVGjH+MbjxhgnJreFCmEYWChBQ5h6/8H7fIEE2MrPrcV7PAscAfi7dkr
	 N7YcvWEJXiekML8F2HiIigHo94VGB9KrT6HjNsCYNWQZKCCS+Li1GrMXqMQhbj0pLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fo0N9uhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fstgmRUI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29883606A331
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29883606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fo0N9uhF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fstgmRUI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0D691039852
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 17:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0Q
	PMFVOYVc=; b=Fo0N9uhFYfLY6usSQURyUGdNlg7cDLWV+qqLg/8kQMViadKA/ED
	rReBf2trqAb4kGxF0976H/t/Xl/sT9MtaiU36y504gbdtmJOPCS0ZnVOyKemSm4z
	c39fZ59DRp1rXFXduwvUrsnF31oVDIAmC8QH3lswOhTGGJE3ECEj12PgN6nTYWCC
	h5On/4v961yZtJ3Xjp5b0D8hvCn637velKIbfujeCny8Vc5cEv/YP88wqOcb0m83
	06epewpsvbBPY5k4V42cXM4DDxhxoglL9FPfUFxHo/qw0W1CwAxbzP6+PzBDp5gc
	Jj/dXrCzO3SWCzleiPH2Nf8iBbqSlKsRajQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9uyj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:37:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so177430085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793986648; x=1794591448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=fstgmRUIAd+AEsyHKFv8vqkbX57OCzJ+RQdTRcFVT5zPB8RFr0wa9217dSVe44Jxwr
         NCLn77ecZRFZ9DLVRqgbJ3h1Fa+6R/AWmY2JzalmWC6d/WMcDHNRZ0qPA+i7hDiXDwSR
         9lsgs+MNRMuDIOsvCLJTvtvFOAFcqodg03o2I2eXxLEDYrHIsWn/wNMfhusR0LmuuO/I
         ua6Fqy0zz8tumMy2wSmQGO9JypZCXcQGqsym5lFoB3DyvR58tp808SmGF4AzgQMLFubb
         J/B2NQMQWuGuPjVMYp2YFBb0cZQNW+c4VLwbG10/9eDtE/rA45/QWBzaNJpIe0fStAgn
         ZBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986648; x=1794591448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=xDnh+YBrdeOJRFJu0kiUYKXFQf18j+y+jC8rg7yJEIDjjlLi7WebkglfCJjnxIsW0x
         wa3fN3f517PNgca293WawxcBxYB1Gmi00fi4xL+ZEPjsBNssJj1FjYxFRZutS2LldMZ2
         mq1Ooq/3FvpErJVdJ6mYO1z4JmeXadLz1mU7qgWVFzYTykoIfwfsg4wzVJSvAc8rMNkP
         sYHLOY+zZ+gfaDLRCCGD/ewUZ2fwYeaV4ny2bOu32ZBIsixW9QfBPLBEZodHoyEINLK6
         kGcUCQV+dC8zFyJtnpSfugy0BtLKAQl3fkMoZxg59jY/75mBsC+4Sg6a6tKJMTR/H+Bp
         yugw==
X-Forwarded-Encrypted: i=1; AKwUvBz8YEqEA4qGerpASGgopMJ7BWq7LmhamlUUb6DW+jTT5+JjgwJZRnkdajRdoHDrYORCuUxFUX6SqeoRedvr@vger.kernel.org
X-Gm-Message-State: APuU4Z+jfAlAjc9L+6ez0g2zzlO09Pb3pKfVfwSSEAG/cO8v9k48fOYk
	pepL2dztmKX3w/HPSK0VwwEcykvKBGC7+xED4JIBr+OQXl0m2Z+QwiAsCBuynLNEqE1VmVcK75Y
	3UlKnQYdUpB0yhjb6IuShc5tsG5MPROYbBuHtFGBmFuMb7O7yOcd7K6YO4pfpSlF55eUf
X-Gm-Gg: AYBFou0ONX4nMbu2reNdHwanfMwmWVLFB0U5jvFpCaq9YQWpXMiQscb44D/+h7BTPqv
	Ajs4F+ieQ1tufNl57n/1UPpqzY4ZILL6EHQMspqjiimZn/D7gezJnFFFAzFjYalJVfgG2NtpR2p
	GHMGhs3F8+ZkayzTaiorYkuTArPlh8LLdf/pqyCydSmdPCPHoTU1jlYAQBu4UvCbUhWoRUKzP5v
	qpBaq7QiodNHdwuL8JQ/ECw3SddE1Z3OnnSBMonjen5tDeFx5nQKmV+v2yXJYi3X/VubXZPwPKC
	+mT07Ftx9x4gfk+arGohQkDQ7zT/H3KJWMHeZpiH7BBKRd/zoO/n9IH4jL+fAY2JB2UJ8ELGGw1
	f58xrqEHdxLWfDmwd2GzAs07VjgcdzkXFbTeNMRKh5EUioaxlSuZdmFRfwWClAw==
X-Received: by 2002:a05:620a:3194:b0:92e:bc28:5479 with SMTP id af79cd13be357-945f32a3da3mr493258085a.2.1793986648271;
        Fri, 06 Nov 2026 09:37:28 -0800 (PST)
X-Received: by 2002:a05:620a:3194:b0:92e:bc28:5479 with SMTP id af79cd13be357-945f32a3da3mr493253885a.2.1793986647771;
        Fri, 06 Nov 2026 09:37:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm84256135e9.6.2026.11.06.09.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8937: Fix CPU4 thermal trip point type
Date: Fri,  6 Nov 2026 18:37:20 +0100
Message-ID: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cWi/sRCq4/psEC0lzvEToo4ZOL2Ky8kWa/kBXNHZ8aA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7hBQCZUMPp9KYItNyPqEg4img3WYZELzqxUP4
 mos81WLoI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau4QUAAKCRDBN2bmhouD
 1zicEACP59pIrSjdTgQicn3Mt0vt/PWdfrht2zlzS6Vd1+kwt56M5FphY8nJtURhhnOrdc1ERay
 hEMM0TkQj7O1CRFab956TZCz6pFX+MD1cvNO9cPvDvPKHgCcWZR3rHfEt+IMS9/UYh8y2aGNK8w
 4ElvNM2pc7UF83jvIp/oZ4bF/55/3H2FENQMxhtAu3vx234GgH6lUvrEarOg9PnO9sGdMfFwH0C
 sxT5l5PdKeTAk6M1nD9uu3sv9+cpVJD5Wyh5P1ygY90M7RJWB+ZqmsWZ+NfT+PxlE7orTTVzwlX
 4DxqcDOGZASECO6k4dGh0tG1xWv77WE0hj6Sj5Avbpj+kVe4oo//ci9R4b9N9nNkpor/RP6CVA3
 nLI+5vn8kqF89BE2o4RlF+NkXddvi7rv4bP1w0ro+VzmZ77oyTt7UBsIKU+PceDLEQdmg8MF4EJ
 hgo3E+IK7kRzSacPincswBkv+JnnPHHAbcvvIvybX680zvp/6fQ0TMXt8XThqfBGGsq790smjxq
 MVcsa9t0N8SeAMhhKQsfnUpm/RJ5IcSfDMjXeSGGVdrSPBZODCFAiREKjQB92Z7GC9vP9Get5x1
 q0qx/ZlI4/f4zz6iNAAVjjYrSaG9jfbXhMCXngiZT40PRUgh8Hdj3wvnEXRjUqxfs+zkVQRsPUq 3xWYWqwjDKTu6fw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXze8wuQTqf93B
 TMmW3Koxvqwh8P+ZFFWR03PwfkAwF6YtAb9GeIbU52Ka2RrsazjVv/BT/NydgppXLQIpvscJX78
 P50JD1I4/bQa65qfhbM7rJSFSIasLho=
X-Proofpoint-GUID: 2VZw0V6LkoWU1Y7gPisvqKN3cxLTqQGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX+USjxhBH+Qv4
 vZv2EIBuDIaLG3ZV1X00RM4iVvKyUQl/gF+rZ80tDfPCQkplsfLLKgLwMkPhvvTCNS4UAkgdjhJ
 /ewvCT4C/TsB3Zly/d3yS67SAJd6gG/HbOPmK9fDty+PNZ1DcsGn3fvsihPEKjRvG55qKxJ0mp3
 OwpB4dmKI12K5UEvgZzRZ02sWjWYIJA36l0dAZECItDOs1nozaG9DOgsxsl+J7u3mYkKWk168kR
 seIDP/rjUwrSA+ymWUQGGFy1B/x+ixndkF6lqPkd/JGzax5JkmqJWvv3evHsbm4ANGTLer9o6io
 y6ys+6jvoY6SX79OtrmufQoAL5cW3bYdwMjbO1+XW0Bd7UiFGHAdtwOg/0wJ66j9CYjzexzAUWF
 4dTY8DRf23omVag48pRV5OvK/Gzoefzhs8tZ/Iq11ewqS64t6iCZcWxOWmthljZewAaKUUwCxuu
 pIYsi1nCg4LiR8wcs9g==
X-Proofpoint-ORIG-GUID: 2VZw0V6LkoWU1Y7gPisvqKN3cxLTqQGN
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aee1059 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uPNVP4c7M2W6CD1-7SQA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

CPU4 thermal zone, unlike the rest CPU5-7, has reversed types for
75 and 85 *C trips: the "passive", not "hot" should be used for alert
triggering cooling device.  Wrong types could cause missing thermal
throttling of CPU4.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3ae74c01-648b-445f-9a65-114b2d3b2ac6
Fixes: a829f6f2e8a7 ("arm64: dts: qcom: Add initial support for MSM8937")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de48f..6729b39c3f2e 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -1942,13 +1942,13 @@ trips {
 				cpu4_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
-					type = "passive";
+					type = "hot";
 				};
 
 				cpu4_alert1: trip-point1 {
 					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu4_crit: cpu-crit {
-- 
2.53.0

