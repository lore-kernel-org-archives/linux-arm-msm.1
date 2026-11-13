Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548065;
	b=ww27ka3Mv/8sMnAv/ORgSHIebqWgBhKHSfp9TRIX6Wn/fWqGsdQnTWdDV41md86wINXw
	 t5kI/nK4T8PxOB9EsB3HxZGSgpTiybuT10x3NrF3VJEYs+VMNpp8P5k2s+UCfuXqIUKka
	 xofj02f0EYZhqsD+u99AFP0wMbIJL/yX0mB6rYsJnP57iP3/lOLlLwPWL0PYEhEQ1Nt9S
	 bw1JobjpXAhP2X9fqejeQwM6CuhWQFnhx4esTu/+f253DT6hXzJP1toSJ57//HagAStJO
	 fGmOhQeQVlaGeVe48E/XRTPm2C0kcvGd+LZWm/8ezEiTmLcw+s58jivfHddjuTlNPlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
	b=nC63jgamsWV31KrLdZt+AiTkKoXcNgVqn1Kvxba1/R6xdswUd6L/q/Lxi0BxwHhsrGwh
	 zhLhShw0/fRE9jgkA2tgt0DpyugALvLG6rJ57HQfwxOjtUUCa7oJglyeS9QkQK8xCnYSK
	 GrtePi1P7+QvrgjloRV70lmRD9LXDfOHa8vkmp+Ir+voxW6X695EzjoJ3Vz5WK01N7FPi
	 iHmdiRzhiUMj1H0Q9ruj14cuyV6jqhlnQcCM2e3GuBkJvXFgkTMB7Nuw+Szvg0wmpPwUk
	 y0z/MEHnsaq/TXZXovh0fo0jNicxyfvLQ8fZm6RcZbhcNvzPXJ0R8awzwl7Hh4N445g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854B8606CBE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854B8606CBE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57BaF3283375
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=; b=Y0DydbRICd6VfJxi
	wjL5DVVFUYeE4tgWndVMMVkjwvXSdFHl84VMV61V0bsHm3uwhTsCIcwi5Xu2OH+V
	G/xZyjBSLULkBCGGz0anfipn1ETxvO0brGhm+zLLWpm6GxngaGphwX+5fwtBzsPB
	3gZOND19WDlSoaimiAUnV/Ggy9kqsClW0GIBLR9FLVgi0E7PEfoHlQSnPSST129k
	yGdG/qL/PfBD8KIwMRzT4kaGxqFQQrS+V5rKoFb7VmoxO+xbxK9NQY7FC/vHprGS
	CDMpGfKAMXN9hQe1OFFZakaoASQ9PqHz+f8PLnGESOvcGkYMBAFIf1A7+jeNFvyc
	AXFhvg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37g3xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:23 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso627872fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548063; x=1795152863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=UcRJ0GTK0uCIuVe3J9kowV4zd6yA6naU0eqO3ExGqYe4IoZ4kJ3eTXCRdZMoW+YDaC
         H5tz2QfiZW6AAx2g7XoqBkxPUVa5H6KAKJfnWapoQs86tIyKRBxwSZkwFkn+PN1PrLPl
         Kyi2d/UJDqDjhWig1ky266qN7temx/1D76nmXA9/9Vv3Vp0a8v6mPCKl64wNYA9xBTpv
         i+xFuPzq0WsRqGJP1G7lxjifEppPbNm9udcifxkJXndOKNhsGRIG7v3GYM1sqOexx988
         40cRIOmAhFbjOL9BQGdaME8J0jlCMZV4coqxmOyKasAAIeoP2e2o08Zcbl+NZ3Tnh0Ah
         m4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548063; x=1795152863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=kSAiQf/Vyt11x8T7Rr9DrWUqMV3s6icBea21svKJgB6ZF6CWGM53GM/bEx/hOajiFf
         8iPIGlB1BHCWdhGwcHdj85ZlH96JNMBlxfonjYTTejqjYSij1qnpQfQPbDqj3rmr9nlY
         3175a5d8Z9tFi2nvvS2rwAA1toy2q+44qzPJNkSOlo1LfEAwkPeXqPLG4MUaTj+d4Veh
         7ANwP5lZIEiPmLqE0pIlcHYj0ej6tUBhR2f6OvNxR+i3eq+tvZRsshQrpnK/6fQUDpWG
         pMIVce/zyvcjVUVmBamVLV19H/W6UQ3191t5PyzyHW9t5VUy0IL8YJhL6NbXxr0RxodK
         e1jQ==
X-Forwarded-Encrypted: i=1; AL+hErGdDk2LsTowmLGy62OH0I76DXY6dJaZTnOmKperIlFfRkTFZaAQeW+Mbudy4wL2UrxfZMdKE6DefQXkP3Af@vger.kernel.org
X-Gm-Message-State: APuU4Z+gWdmW7OCjsOZdw6GrQvnTFQrMKPkSUPnhlRB6HQUA/vHVt5Wo
	crX6rlpSj5oAsSrYhMlASWevaYvWRH96DXDAqJhp8EmYO7qAEGu2sON96/UFBgDfiK245qbEsHL
	c0Cd5boY6Sq1IdCx0AvAhBW2GX8QrDG3NZN7xhZp/zHK/hwcS5gsRSADV0zPR/zVOEKIb
X-Gm-Gg: AYBFou04rkTJdq1yJLHu+q2nKRm03/XLqMAfntfj70KncuF1Kc+LwL9vHR3TtOV3lvZ
	TjqAyCKnjAQiPwjrC2CHIpAXZHYqGeDb3mPF7CQ/151jW2YIpJpYEMcp99+7GRWjPgL2WoHIcUF
	70mGaaK2lPQkoA50jw7D0k12m4c7uNZ1QxVyo0BlylVZ9qbqSQtcq95Nb8fVFSuhugWeVfP9g46
	qJkFaJtUiQooV23dJ89aLlM2On5w5MBgGe7kBbmOXKkgUqMzwKZhw9ZLXVrVyrm/v6m1e8LBDl9
	itsHBGXVkp12WnKKudVumiZRSAM1KHMKaE/9AjoFjg39B3dy083OVeE5H69TaV6kwuTgXFUspPW
	OGHaFsE2l83vzmWuhi+SMgpfmNv3NuVziOcB3fQHu/b+aB1NkMyks7Vt4w3EkNqFZUpyF0zA/MV
	Y43RljAGFPX3yIJxZ7oNq6Vt5VCbx6lygODS1vSWObYxGv43bqkpGEgJa1a75z
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846695fac.11.1794548062825;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846679fac.11.1794548062344;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:46 -0800
Subject: [PATCH v25 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261112-kaanapali-camss-v25-14-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX3haa5RM9rBoe
 /DeFnsqjw2re1Gc19k2r7IkbDJUSE/UK48A7yJEwbGIgz5kDTxZzJk84YQPEGN1Tsaw0q0DfRCU
 aCL5fBiz8Z05wexUDlCvQtEC7ss+vx0=
X-Proofpoint-ORIG-GUID: h2-bdPhfjBYkWU8x9q6nGrqhXlrA7HDT
X-Proofpoint-GUID: h2-bdPhfjBYkWU8x9q6nGrqhXlrA7HDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX+ySMCq4FKBxd
 /NRWryuIoM6qQduk25JUk23193XPJMj22XLkaEjzlSaZ89sHrMCYvR8HhtH31Y8V12AOmaBAc61
 Odftcn1MAmoxuhe7BZFv/tL8zubECUFy+UUESbLJO8r0Y7wsZnQbpei/PhsK8dMsG/bZ5L7AwG+
 uBEVVU564VrIC8p0DQLeyewz51/Ncv6BVDau1aY0DOBnqf7IhvH4bKr0C9qsvfroBSDC48/zIsB
 HIbw/E6OCPHO+S4XAuCuuSAVZaKXpFURmpqifYsATKmFcW1kvxyJg952SCbg4SkspgSXStbg347
 FJNeotz1kZ+SL4mNKkjuXloEzFJaGMS049QT38RLLSjozkuN7YEshVSzNLJZ9U6tnCll9HqtuBF
 Ilzppnww6eiy8EhGypk4eqvSfO+I1+M6XsZHHGl9kFN5BPk3Q2k2X+qZM7X80lEfQjHF2u9qVBK
 N1AoiZU6oXzRgFEAeOQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6a15f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130021

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 1662ebdfe729..3c9c97a553a2 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4663,6 +4663,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

