Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995BC577E4D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965827; cv=none; b=MndxOXywVcLYdG2rwSmU4z17QZQmHwqIKf0E0yof+MC6marzW0VBSdWPAYgO648I/WoX5EXXjXS+ypkuHPDf3qq7kvH4Yt/2VZQJrhxfoaztKGh6hzTZmuMxj0z7Ck3CTSCMu5cu2RyWXbKaDseyWqpzUYNd6n8x5EIkXYCYbMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965827; c=relaxed/simple;
	bh=t6Z5sjaDxX6xGekJGOZPq41x3m5eNArj55TVt7VRYR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hf8EEG0As8lnwtIFD/j8Fz7KYCj7vwfnu/UkYo8qYcOgXqrKpOYkYcCwM3ZUISMOo/6ehzq0A/yyJneUtFTR5usPGxim1Hd7UMp33+r4adIqb0wS+whUPNOKEbUhvyjHeF0zBj3BSUSsGpFDCAiGkDzF/w91FAh8SO4rFiJetCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jezkmouK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/Rtgurq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jezkmouK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/Rtgurq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7ri599858
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=; b=jezkmouKYdKVWsrW
	5p3M86b7+nyzQQ0zG7luy57QSfdD49sVal5pxJqErkq5mxqKUrZRbx9GiR07Tnh2
	H7xomHL/0oejf9KreNQK4GaoXCvda3eb1u0stR4z7LoWP0Ntat/scqOGiRjKi4wd
	mUndH3auIeTc65m8hk1NkF8XNUHgr4s1/H1sAqnYCiAk2u6msEJH3yklevOGH9F9
	BFQ1IkSH0Gt4q6V8Lux+9QH1kUKG92Zu9uMNUV0QhJMmo+n/9BVx40xFowMidS6a
	I2vTIVH/42XLOqa5BTXwnBRXeKn43H/v+rpp0WIB1JK3NZsUms/Ttkiqx3kAlJ7S
	Ha15Cg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2y2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:57:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78830f4bebaso750455137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965822; x=1789570622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=;
        b=e/Rtgurq7F+QH7fo2Zlx3B1ntMfpkHhAx+vNgdTgTv/LOz8d2TXzqCPqV2l+d1wEQU
         rffN+6GDiuIOG1zQ3ZXe7Fxbf4azn4H73C9os5dBhBRo9voilTlon0XxQM3k26MzTtTe
         NFT9vOSzUzeSO8ZHU5KFchB32rJs6ah1zuLJjkYrJzhi5DAx8xzKUWVvA2vi1OCD7R2n
         F50DIMkFN9PN/8zovuCaMmp9bqqTLhpIdlxSNTP6f7oVCwzjVKWKmh2viEj6WrnH2NUq
         Ev73qyIrV8H6M8JXioxXz3RpFk1ixtxj2KN1G6Gpw1jZJX7zKjcvii8I5fdoK5IyOYtv
         Z5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965822; x=1789570622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=;
        b=LttFrf7DtEon8WV/7kp6XxqMYtLUAAca0X+OPb44tecylRCNk83pdZ1bvHMizYs5Uj
         IxQIVFZ8+DNfQanHrMyTohHwyJFeET8UIIwv65jQNdGAO4nx3DA4VZIsbB6DH6+SiakF
         aO8nh4mAJOjtLFz0ePuZD4ah4WXYHCsKhsN2xMZDxqFo6ven5EBrU145g+xPgCqJJRHd
         8R2Bn4inEbCzkf9E+4haMDZuDeUYRFgsuDfTaEQ25Oh+yei8dySdZXwtXg/N5QSl8i0m
         m4ukKLPNClLL+no/HKgXUFEaMGIlPuNbeFD2VyAMzMfPRJ9Gc56NAH53LbKrewjgriTJ
         GWuA==
X-Forwarded-Encrypted: i=1; AKwUvBykwDQzLSLaB0OXvAuTjOT1n25l7GdhEVa674aW5w63OuS7sp996b7YUsfz6Bq3ps0et0/MJTi0I9zZhn6N@vger.kernel.org
X-Gm-Message-State: AFuF++myChGrq5vXcHpxpTElmO2Jjza1IFjMGErYUxwF6zaFSrLit4xQ
	URurgfjp00OUiiuVoSZ3+1dDuisv0S3JH4qZhMp0GFT13r9q8liJ0Pnb+rgiC2lXz4hEvDxOaHU
	URmxyDRvAFPmXZi45tQh+wqsuh9lZCk7UPfeExyRCF5kCxC7l9R+wrXNOiueaSrW+MxH5
X-Gm-Gg: AYBFou1V9YteDews9I5wksXaLlRFGZVWbNoh6XaTeN4c5fDeBu2vga6tYD/llRrNZHS
	TuSEdFH2z0xzv3zI+Jn5jvj19g4ftoVcEH7DFmEh49g0bQ+imiCpyl67WomtGnYJA6rDVm9VGpZ
	4/RmqQnjft5JE/yuW1yvG36/NwPbVvm9lkFmhSBuyOcfvltrh/ZByOrEfI2+V4lHnBkMFVM6POy
	slV8Atmg6AWHgmYssVESFB8cqzW52dhO0mKGQnE2MenEoCl5dtOpVYgshwMnDMSO4NT5GgZE9BQ
	i9Oe5sX76L+oci99ETdRrFkB5F7/vVX5u818a8r/cXcWS/GZL/ZVfqqqNkBs1s34VoUTWqJzsVx
	xPmIjzUQhtUo1RQ==
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr13405781137.9.1788965821984;
        Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr13405749137.9.1788965821478;
        Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm633757915e9.5.2026.09.09.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:00 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:57 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-pci-tc9563-aux-v5-5-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa173bf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=kuerolza6ZzA2jZXMEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX7NYx9gWZzXVh
 9s6QGTaRu9B+lpd5kdryLhTWZsQUZQfKgiRFmnM1vskQvB2BAYh9Ltuy1jtkNTkoreWdl51CaBb
 t/f+eW4FWiOFJ4KdVtzlqeHrW5N2CNI4GXvUHVg80pKhyqBMBtfXP9enpFKE8StkwFi5rIyfFwT
 8pvOo0tpwjVkbu+9jXsWVzQDryAUrPzag+fcofUTHkO1nMAykHF0c2//Hxp1sAnRgvB6SvtaWnc
 UzgUciraKVcc69dCC/FaZxODZd1HcgeiKRKIfK2KA3SHGOO7Ei3aT5IvlK+5jgp/HbMQ/wX6pUS
 YyLGQ/EdUNax4rXviFPg5jfIQBnm8mlLAEf31sKRygkehiMvEFywgkSKXTbKxna8pifABVji8AV
 whRCN2Dypw+OUrHg3RFKVrX0Af0K2mtXJj3/oJ1BH0Bqh61Bi9vSpF4SIq8Dpwqo8KP/RjW7D66
 TYW/+kqMuO4Tm1QpFLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXxE9XmkfFW1g6
 EM5ODig2nmZEE254dk7zIfXLNy5XmQk6Sh0UdoVMQIC2Y16Fz/NbkhjnLSOIMWRKEFHwTnLmR/d
 Ct3rxQ9ZL2IaiMsraQjQsVDK2Lgdo14=
X-Proofpoint-ORIG-GUID: u3zMBXU02ri3_DbMyDyL6SfwAs3OaO3T
X-Proofpoint-GUID: u3zMBXU02ri3_DbMyDyL6SfwAs3OaO3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is registered as an auxiliary device by the TC9563
power controller driver and accessed through the same i2c device.

Describe the switch node itself as the embedded GPIO controller and us
it to drive the PERST# reset lines of the two external downstream port
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..4da7342ca90d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -867,7 +867,7 @@ &pcie1_phy {
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
-	pcie@0,0 {
+	tc9563: pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		#address-cells = <3>;
@@ -891,6 +891,9 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		gpio-controller;
+		#gpio-cells = <2>;
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +913,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

