Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B147FB09
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203157; cv=none; b=TOO2Gn6kd9tFU4EdfnDfemCB+TsLtj0KeG0H5XOjxFCLXhP11/r+QJJQaTYqLZiWhPtiHayLZotWZUan/yEwyghmYH33JNazNIuIzEwsBgzovYX+8TEtOPenahDLIQvxG+N4tcetfGmhA1ph95czY5pvkGun7o5SZwbx7X8q12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203157; c=relaxed/simple;
	bh=bWkI07yTaxFWD4atiiVpHEgTv/JWhA8cgER3iu8rSDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BN5U3BLqyqLnHNAVRzhMy0QnDMLi9yrri13ivZ0ik/chibc3QLNxLW50+bCwNrJ4WqeYJ/lTSwsZgmmqmOOsyJMItYW47bfYFZNbGZhUTbwaYxICSc0dDvEw61lvegegEhCKuB3DiN+8CDOGjmXVlH70S1Bb1RyB2rwnXGHPTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfM8xqKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TecN5Tos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfM8xqKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TecN5Tos"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFVGO1295000
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=; b=mfM8xqKb3FejSNJ+
	CgZaO3jOsZv+GauTDRjU5DvW746DbIjGmEheQZ1WWidlaQpN44OxwC0kstI7yh7y
	Zfvu2wNouaWJZCXXew5coFrqbk5CEZRQW3g+MDkZePN1oOB70r13SKOFnFwXGoZh
	fLfOAENqFG4i7u2OE40xiAmHeeSfb2z90WzCz5BlyhSA9FS7gjiU828taY1Ja6CH
	60l30yqmSP4dgCIMpV9KUR+i6AfJ8O0XVFi9cWX0+1fbYNW78pi6CQdlNWDZlfYp
	vWbjkKI/1PbdUe99c3uFq6SLZVy9KxK+b61hoGspxtF2lm4Txo3Mstkoj/yCkAEi
	3ZvATw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn9r6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:25:54 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-820ce3bb94bso1681331a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203154; x=1791807954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=;
        b=TecN5Tosd75qUO5B9W/ijGZhIknnD7b4BhSni1QQHLcG4yj9uvpVG14ALZm3+Pz4uH
         t+jpl8jBUBG1Z5cSkdaoy80JPeib8PubGcaEeONLVULskCH7Rdg8SnerNmRZ0WMqmqJ+
         Rjmg+S9DFxa9Wgjx81yCsxxfpodFwjgILWv3ri2g0e2I3URoHY/NwFS8nPci7Wpgq1YL
         0FUyJTWCw/XHgX8sNjx8Sfy0oOMjC2j4urmZBcKnvm2eftcLWTyaXHcpoOnc+6V4cnI4
         W+wxKi1+bg9BMLw+nwz1WIB7f+70iY7gQMzcaDCWqWi3pLF/YSbBiXSC91xHBWXIDRbI
         TACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203154; x=1791807954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=;
        b=IwKARweQTIK/0VJ8f0wY9Rofy6V15J81xcFF8luQxeUf4/pTWxKRRAfEhTIxtH9vEv
         IhGT7TGMaTnsOkpBIXPmfFkIBzEwS+7IsuGJxzzgaLyhvL2Ktz6YMEJKVCneidgS7gqU
         2dnpW+lSc0LITiPHQ3v84c/IVpKdv8m0GBAZNHkFTKe6ys6cxqZ8sc/mE/e5iO9OQ2fA
         KZGM6NYzLKjx2PfYR7CFAaNXl5NCfsLiyWwCzdSXxvmoN2yJsWMPo3tQltiFzGnUL2qU
         CyMRbrKr3CM/i7A/lRclvgQlroX9Os2Vrq2C5NtwLhqt2iCGeau0AQham7hDyrF7HW48
         Bz8w==
X-Forwarded-Encrypted: i=1; AKwUvBxnQQFK2TN37fr+Jl4biXSlQeCUgsAqiRZl8MaYgA7qyhSYnEpx9Z1Gjel0g6pe5aYZ//+CkROO15zD050D@vger.kernel.org
X-Gm-Message-State: AFuF++mjfJkaDGo8JLFYNXTPvOhOCMqx3Kl8IEFFR1ZWkVP8TirKhguF
	YTJ1sBhUEX1VyjM0DFPsCJNZu6uhL872+hAUcI3txqMgQz6DTfz8lDrEGpx5VtklI7RvpRmlU/s
	hSFNnMTjFlLaPQN1HMt3e6zfx5hgBKupLBwQ1F0HKKvdExIlMRro8uLuO9isYpRk0qcRk
X-Gm-Gg: AYBFou07oWMwyx4JaN8esFEP7WHA/kBvNTZLn6uvEcMlzePdjDYzE+sUjrms7T1+yr9
	UXXiAkXWCUMuMiri/SS/u1RMBhagqe8blr/Tqsub04xKY6vn3URcp4pvvsk7b0Yx/Yh9viDUZMX
	hQRw2XuI/DyvlehCoaJHw9PAeTvoPzgnC9VJG2jtawrVA0chZ5awmTtTA7lfhr3l8EWh7DDcPaf
	3B4+AoJ201H7BfHE7oWn8D5nWPkhHlFLYu4yQQZ7F7rW9LzygjMm67pBXSjjvxY9rq0nBHAWDZT
	b78XZSIdy3ddReVe43D7O+XmmcwS64kG2IVCoDmHydCHSK2JkHvLwIU/tLSvspQ5rZUCy957F29
	Jn4LMo1/xMW3MHJhbDGZJCbm9OKZfR6cvHQ==
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id 46e09a7af769-8227fa8f917mr11197411a34.4.1791203153219;
        Mon, 05 Oct 2026 05:25:53 -0700 (PDT)
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id 46e09a7af769-8227fa8f917mr11197384a34.4.1791203152682;
        Mon, 05 Oct 2026 05:25:52 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:52 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:11 +0530
Subject: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1265;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=bWkI07yTaxFWD4atiiVpHEgTv/JWhA8cgER3iu8rSDw=;
 b=G0lvChTsfBSyXbyJbOlm2/bbEoTUbl+hghwIpt3euwBIZ3GEeqcSEhjB1ymHDU6ozgTHgXnjG
 nbz/VRCEmGvAdwQrewRv27fzccZPQBLiXh1i8Xk2quL0/l0R4IC43CX
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: -GTxyixEawr8SviY1FWLp7HNKWO2iL6e
X-Proofpoint-GUID: -GTxyixEawr8SviY1FWLp7HNKWO2iL6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXy6Kd/kHiE+f2
 /GZE6SmgWWCPKYCSr72BRG//zS8hjOdxwZQyuuQZ+NJnNHnLSstzZy8kZKScnnf0YN3Bkdq0b/0
 9uDop2mRnVXgFUpkrxl1FIgTAo1pPNm8ltp6IIh4vDXzL2x6C3xCSOwZ/M4leTGOx9rwj0LLq9R
 +mF6HCpln53li+UYqfQEnuJ3FeKnqigHXgV/9A2xLacxeNrFWOcoW9UAB3viQidsidi9FCPsNuX
 MwAO6e1bXiMgGX+wyuvpH9j+k0RpKIHaEVjJwmZa8gFZNewVRHmEALWdwB1cgzSdHiJhNxaHNiB
 ICyfKRwzO15HBGcbGA/WpNHofKLWsGMe+y6zQFZdENcdxUNd/F8W/1RmPefnE9z7KxONy1JnFkh
 OcmxQiRllA76U8xKwLSrHq8STc/o85GR5vgvCjvwaTXi5Vwsi50dHBWJ2BwkzYVDiphRULdzYo8
 LPk6YQlt+4FfLFfMxgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXywcomZTAeAHY
 o47ow6+Y88PINx6zokNt0smybDZy1r/7FPVr+wA6oCcr6w/f9ACPnN8TNRo1xJBJgenUOukdv/7
 Hf6nzG1gRNrPaLhJr6TZYn8tUVe3sbU=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac39752 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

