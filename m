Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453036;
	b=JtpbbI/amswSC14GLJIuFuMEAJXQfA0KwUUw9i3dpGJkHfDZD1DII+DghkHJeJmYJjlD
	 pgQleMQ1auhe9SDvX5Uzll6MAHOjSj4r5Wnu2moFs7Ua6RmiL7xD73X5Pmzu8C8fgB9WO
	 hH//ooNGitxpTBGZ+qyTmk+7xW37AYxwEvuo0e9fjR2itjNo1qs/DsiqAFYIAWF5iHmhu
	 AZwsguZgaAYBi0CJKORUgfrA3yZCtgN+u7xX+Rhj5cqGoZmcUbEq6SsXnLS4wQ3QBb2Ap
	 dJ3bgzdwjZr3c/n68Gf0gyzR6XvSM+CWwPqGOY3nGlRgVO1grhzCvMnR4KdoN3UXSGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
	b=Do3DGYaqlY0VFwAPwRU0XtDp8K3VUPfnhEJzuDyr/xa8RKQLv11nYpLGFfXCPENhV5oY
	 4dXSzhQfH69OB9BOR0Lx2ElbvMmfTcNQ0oqnP35RWJXWobMlJz7KndV5kluf3Ufh31BUQ
	 4LhGgX2hlcsR6VQ0odaVfwTi6SM4LEbS8BE5m2Zu4O1y3fumPh7hWxNDIsMl/o+XDAZ2A
	 6QraFKaVxIcCw7O58cVqgvBY/2ACQ9em/2n1Rs/n8ZwykSxEvmqbIWdLieSMtU72+vupf
	 RI4NX3zwypupmjybVW8iFmevnGrHYgszpPXClpx/UT2SN6BxfKKCdtsJ6+p2k9wYxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OHIdTdt/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCjL8yo+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D87F606A324
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D87F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHIdTdt/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCjL8yo+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00rP1848103
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=; b=OHIdTdt/k8FzhNl2
	cpnKZ1ptWxQGb0qB0J1bVEcitOuq4xWEcnr2EOpTWYIqgALc0VUhFkF0RPyfVYUx
	upWrQFRgmhfS0uiaDSOVcGKv+IeKM/01VMuJCS6U66F8YGzVmj9NXaPc72cTl0+P
	byaiVgmePxMVz5surUDUwsvbh/zwI00JumCWPKcHT0G3A9jrv9wBWbU0DDNPeC0F
	5TZh4td081cDKOuegK5XISTZ/LA0zV7X33qphGD5/aerHZaC4QPM8n65c0woUfVS
	m8tDwr5AfxHw6FICPvkTlcq0hDezNCgQJafWxQpV7rOT/aS64OEagoa0lUDi2emY
	Ei1ZhQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfs8e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so2718482eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453033; x=1794057833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
        b=gCjL8yo+aKgtBfkG0bGwFG8yW2mFQtzB+R+4pcQmLdSECo5nhjlWhosdgB0jw9I3/C
         wi3n5Fpnp1rK161QtArZNMSTRtmO6dOF5RYPI0Bz88P1gf0IMdMqL2fMzMnh4721s4HO
         BxJ4FBGGYpzuuW+QkfD6TXGfM9UmUkSO43vkeuFGEwWaLx+R+HDX0vqyULPTUBK0Bf/u
         f0dJM/QB67p6o9j33BgZFlU/Ym1A7OfRjWrwEOTzv4zsUj7P+0yyvrwL+bDYWoV6kr7e
         bG5EpQ4uS58c2QphZRCQKP6/zvCd/u8AwfXAqhkO6QNVHAMzIUjhG9Pkvjpm+7tPRIdC
         qdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453033; x=1794057833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
        b=fCrQL0JX/l/V24y8U4cCta60iQrAV/JdERbgYju2xcWk66vLzc0gjIKxXiDc52Edo2
         CuRcoVQvUrIf8kmXrsgO5b4mg+36UEY1i8TkJ4Wp4N2HhBH9ydLrgsbvqsEvZQfkDFw8
         NTULoX82BK3q4tH0kdg5TjM5BJl47i3Ogt4NffkMujG/5MZ5ujaGqoobcCcP9k+OGmIL
         AQoVYUWEP+6VZDOnrI2RsJaXe73gQKpdCKyASBV2Kx2cwnsbRMkp/0b8oi9uXGustd3Z
         QW6X7BK2UyUvw4JQI3XJCgXRjhT4wo5AK7lwQbuq2MTK8cq2vaI/n1zZ5spLkEqzlNh4
         PeQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmmhJVKgso0SECWfTqCx70gGvdFrXpqkzFtrHCFOLUUB7+KpCYhGM9bw1tk6pZrVsCGzTNYwBE/rFH+3K4@vger.kernel.org
X-Gm-Message-State: AFq9FYJPEgQ3TKiWsom1lUqzU6saLZEohS9JbNhguZWcUxfBo2jseRdB
	sqtjRsPJtidAsjAVaNjpCzw2ZIaTAEp+Gs3iL2YI/pSmik6Hxvzy9uTYpkTaTVY5bNhfMlhEiAB
	y3Cr7GWhWp/wH2UgPTNcM5gz2WMnw2FcOzH+Iv7uUa+hKEZv1WLBMfprXY25wkyKL7Uht
X-Gm-Gg: AYBFou0qpVLeqLk02TGyIjjhYln/fftTLtRin0WvZt5w5YTWph88KTtOLc0ROA4YJ5P
	/+LHtxVNyrrBzKF5/CMXQENOY56VNX6DwiSHGLfmoN4JB/edeAVQDGybdlfECaR7eh3NBDLN6zA
	avoLUMffZ0oT6OuCZ+8Qyng6raLZrk1vrvAGG1zXcS8QwX8twLqXIRAo7rOnWXttT0240SiUCDl
	U+kip+WhlkKJBl6Ms0ONy9p+Wt0EnHeV6CWycdrftYOlJL1dsZ/iP1iGZQC62vbGWfGJnGiQK3U
	uDzwdvEbe4mwFmtS0dX+UgZX5iaYIO47iF2NMAWjsXZiV2FVNQhUkUajq1X5/l7yyww6prNofbO
	iHaibZAU+w0yLfGIjJXuIWM/Z+xa3vyAF/yUuAlSP8m+fJg3VwKK2+a0fNYYmNdTxUCb81AzT5k
	iAkhk=
X-Received: by 2002:a05:7022:5f0b:b0:168:3243:c91a with SMTP id a92af1059eb24-1ac5bbb966fmr7281702c88.13.1793453032651;
        Sat, 31 Oct 2026 06:23:52 -0700 (PDT)
X-Received: by 2002:a05:7022:5f0b:b0:168:3243:c91a with SMTP id a92af1059eb24-1ac5bbb966fmr7281651c88.13.1793453031986;
        Sat, 31 Oct 2026 06:23:51 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:51 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:52 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin support
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
Message-Id: <20261031-thermal_bin-v2-6-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=5501;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lf/HWOiVq2goAnrErZNybKHU64QNy57/+sqtdj020rs=;
 b=/Ieq6VVIVGsWZNyme4tdWx2ETcvYzsJYZAS/uqPl5ZZmRudHR0vnc97YcG4YGo2pZBntP4/Qd
 K647mMQbYYcAS1UWfdPAs7fNQUQGlJ+UI/J8s+s20H1EHR1eNsO5Me0
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfXya0TqQFNWIhL
 3gqbwdDdgmq0cAsHEhkWnRLbWndkX7D7JOrWmSlZSjVc67+rYCIJEKGyHw6RCtNtGH8hJ5VBqHU
 hwQIHIzbtwK3u/HcLPBKaq0XcM1r4xg=
X-Proofpoint-GUID: RPRNcoIF6dCs_J4yQjhzH6PmIUQyFhpq
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae5ebe9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HHdy7Z-N7RtC6Qn240MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: RPRNcoIF6dCs_J4yQjhzH6PmIUQyFhpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX7C6Owveo/XnZ
 CBIRk4Bk+/oFJS/rwgcQtA5jw7JvcJeKwUyo9ESBhcqp0lbxmVukaRg2zHOR/HkEaM+EIzgAATy
 oMlIfOPn7gp18d/n26eWTGFpG0p11pLA3eoHiHlvaPTL2WFo6/Ik4jzdbYz4ErTGkmJAvUlagx8
 W9v3akggUmLokQ6svJyGF6UEfd1bcLph2GHUq/Y1YZ0Osskrb2nhwKGbQTlzsVU41N5ZJ2pSAgF
 k0Fu6nfgEDqlQndX8cj0XJwL7CfojkZQOkayfFXm9vgqRsVfYHH8xuDBYrPMNJL3d+htJfI4fhV
 WbQ1fikZXV6J9FRHHZXNxlK0JrMXQ8giQUNCU81tNK9JYgJBN2cq2OGajDAuQyLQqL+gs9Ml4ck
 iApcxe0hNIZOL5ndbKqu35IuZlL8m0tUP5LezfZlgublAdxcnwcsWlIw5ymZbNnWjqKEiDsiMU5
 PNUkVIRlJ21KGiALA9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

hamoa-based SoCs expose their manufacturing bin in a single i-temp bit
of a qfprom fuse. Add the i-temp nvmem cell to the qfprom node
and wire the tsens controllers to it so the tsens driver can feed
the bin to the thermal core.

Use that bin for the GPU passive trip points so industrial-temp
parts keep the higher 105C threshold without a board-specific
override.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ------------------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 42 +++++++++++++++----
 2 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..03d753a0ab74 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1553,69 +1553,3 @@ &usb_mp_hsphy0 {
 &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
-
-&thermal_zones {
-	gpuss-0-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-1-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-2-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-3-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-4-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-5-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-6-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-7-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index fcd88e5f5d7e..6cf911e30973 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2766,6 +2766,9 @@ tsens0: thermal-sensor@c271000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2781,6 +2784,9 @@ tsens1: thermal-sensor@c272000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2796,6 +2802,9 @@ tsens2: thermal-sensor@c273000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2811,6 +2820,9 @@ tsens3: thermal-sensor@c274000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -8809,6 +8821,12 @@ gpu_speed_bin: gpu-speed-bin@119 {
 				reg = <0x119 0x2>;
 				bits = <7 8>;
 			};
+
+			i_temp: i-temp@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 1 bit at offset 0 */
+				bits = <0 1>;
+			};
 		};
 
 		pmu@24091000 {
@@ -9669,7 +9687,8 @@ map0 {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9696,7 +9715,8 @@ map0 {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9723,7 +9743,8 @@ map0 {
 
 			trips {
 				gpuss2_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9750,7 +9771,8 @@ map0 {
 
 			trips {
 				gpuss3_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9777,7 +9799,8 @@ map0 {
 
 			trips {
 				gpuss4_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9804,7 +9827,8 @@ map0 {
 
 			trips {
 				gpuss5_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9831,7 +9855,8 @@ map0 {
 
 			trips {
 				gpuss6_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9858,7 +9883,8 @@ map0 {
 
 			trips {
 				gpuss7_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};

-- 
2.34.1

