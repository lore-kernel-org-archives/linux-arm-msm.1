Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014283;
	b=K8HqBqKYHmFeOhIjMXRnO+gFJPoQVIpOD3yAp1PUpsllmiaIEz248pOud4/pXi+BVzsi
	 eF2vBJtWCdlhfknfy99BswLV0zxNP0oDs1Wq2gR/qqsuhO+0OD8hA6sj1AxYQd0B8ySYx
	 OtRu/UNRCSi1Lep8lgRqvwC+EwcvwPcq8UH6UoVWz8SSWLXHynwxr9F/HJ05/6q81p4qP
	 /1r850Ez7NyGj9NupyzT/dMmzvPQmCe3X+6XCrKSoF2ioznm0QVku6BLRr/frksddgrSa
	 LMQUiN7fUbz902HRHZpfqw7PpoGS10tNmmUFoJDleWEhWdOKbA0erBm73RprVu6b3JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
	b=SJNvqZFrIUzKuvMdP58/DZnkuDN0oKQdQPg3N5U3ynahlxcr5KvM9Qf5V8EuW2ww4FI2
	 m42jRZcEOnYE0rtFnzZGxfNsbKQ5TNe3NBTh4DcC/7su6c6kUWtK++qDGS5Ow7EIg5Prd
	 fFWE3AA2uUD6EgZMgK1P6lghMAuvzNdmhRDyx6Wc629sA3vNtM+2gZvFMAcG9wLFSD7eG
	 4FKrN3K387Yy4q4GWNRMR2Q/pcOcpXWdCEVSb7zxeO74+0yFsNWvzJR4KgD2BAns6+Km2
	 SnAifITeiFtuEFSf3OsiGxmUNLggwDmwEU3HBMiVKv8XNc9pUKbvomHPi+3qwmVGRgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CfQxc4C/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXML9xq0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7417606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7417606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfQxc4C/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXML9xq0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt54S3034427
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=; b=CfQxc4C/kewcTgE/
	Qv1d7WZrlMrN1mNjVUYktg8rKXaO+MniuiEVjqBweZpG8m5lmPGysCoEkLmNV+xm
	5/8fWVO2hq3iYArAubOuj2NJ4DP8N6zggHTeJPiz564yB4twCoJpxKE3NVqPcSut
	fovHAokjYqlTt2EAyzcoeGufiXS+O4NPGJuop8gZp+Q71K0Vo0JOMIlYqXMKlWTa
	nMDCnFFXK/28dbdEz/nS04MV8NkUiQipL9GMvo03JmqxCryK6+fw654eLK+Ua14u
	uIVniQcEEs/oyCdPKXCyOvUZbBZRUEUB4TrnPL7u0o/niVqVN8EtK8u1DPwx3I39
	m8PjcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y06c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so4238720a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014281; x=1793619081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=MXML9xq0A9r1uDGmwTsSlV2c6k++EzU53Q6N+VH+HGB9kq0ybkn75rmcshVnYm/8Fv
         J1ZQ0MdJDoWQlme6e6k3+dLcjF7Uy44CammlBOwjc0pEYY2476a+bKor7f7u7LzoLtq9
         y4M7a4IQsxK1UL0AEtueR0ExtK6tnJY4rcWnz18DBsK5Sdj7PUs0CWUZTQ6fqZ8HFK6X
         DbNtNLKH+BT8tXPGGyxCUVEDhA5kOGyNbwiFTp5z8zyusJIGwbNpBa1DvWLla1pSam15
         h6NT5B+7IR1TfN51/IPTB0xZxlicETWPZ0ws/A13/iWVO4px2Hsbj1rbgWfq65rZa+ND
         rZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014281; x=1793619081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=pKWat98IM6XF4Uh/uMDhYj0sPg+iIJryNkXDDmbj9qOfOSv02KUQlQI59SgFl2S0+h
         wDtdvXawqnamx/VCZtOJegKqIy4B65cyLBdpP3S8Cgb7+jiY+c5afSWtdXPoZLRP/NXz
         zi2BCJrSSTOr2udIHGle6uv2O0K0x7Bu14iq9Le2TwhuXK60SYZQyci+lh8rn3aXudhz
         rq3UFpvG1H1PSRdqurEzmTCB+ULd73Rfnu70fjJQhJ0ZRKpl/RU9bu+eqf2yCbdi7jcd
         g+ijM5WFQPGtoHbQc8UzpHtj/QgXHKOqT+ablNhDX4qzmjuP4ASE8eYlayI5coqcmqNY
         g1sg==
X-Forwarded-Encrypted: i=1; AKwUvBzo06ADyYJR7vRN7QAAZn5WxZw6rj3l0XYdGK8jy4ahIP73J67PmKF/Be22gGsuk6BD2+3f9KHg03wi7OuV@vger.kernel.org
X-Gm-Message-State: AFq9FYKAT1dqYnPl6xoUuHDM9Kg35mbpKTX3GURHgD+7cw/gRKDiWZ3c
	WdAiLjzYwD+saCnViP18hExVfGr4lIqUNEEmpI+/miNiczrE4aGv0CvT7ewfTmVFdYimICnVlIH
	PBwnwH/OtOc4JLR5+fd3G+crI+I7touz+lW77vjEVmq8gqqKl9Vo5vbK7QUAoWubiO2Pb
X-Gm-Gg: AYBFou2u1YUe68OXtqBQIMo8PxaqDi8Z35BBdle/PXhHiIsV6fMyVHyOOGdnnQTcgPT
	newajFzU6n6FXowdppOG33cgi/duqx/zIePMYvPI4tKkaOXPbseB40p8zR60ktMkt9nD+drvIEc
	ncWr7kCeAtn+hKa3s1zQSSimgoSSttbetfShleyQgsvbiyDL7uTue4ha2E5kiTSdCjr/yZBalGe
	xsVoazYNrbR9kaJhYyp1OzfyUxjKH4JM1Ljp8q6XJkCSl9a+MU3j4JnvTqFcNtpqVV6966LitXO
	Nn2+Hkp06hpm7sYwSxKoHX7Tz0XqIr0aox5Nf5R1crMyMinwHCNnNeDvlgwnHyxhlmvzvfsA3wD
	78TWrA3EkIRFMytL2dnxpUVw=
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611283a91.22.1793014276922;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611246a91.22.1793014276253;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:38 +0530
Subject: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX7veAv3NrF8P0
 Nt9V+DXq9DLn0Wgs3yLjUbkij0EQHB+uFG8+h0DfNTWtkxyskUl7uA28jPD9SmJXUoHD9Shxdu5
 eerGQCZSUA0B07zlCPQq3PjET6dkInA=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3a09 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Sk_Ya6Pm9egUDeeQrokA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2MBBQLnP3cyO
 Y/0eGcDj/zZ36/mtaNMLyLlLP5Qyk7tfItt05VstZIcY6PiWRAlA9zQPXRcEW5kXnB6AgpboAPS
 087yOaHhNk1di6x/5+wjXqXVNWUyH7YDJMeIe+ZgcW6fE0SP2Ya73qUoGswXJk1k1bR+U6EO3Tk
 NYCf6bkFKK3jSyQ6wHxNgn1En8TRddK+KgPld2F4fKj9szUs+chJJZgO0xhD4h4lk1Q/fvPk0Vr
 4oKO8/zkxIZpMncKMzpSnDpOCJFCqA10Kf95ILtdC0QkiIMf028wHdHFqgpTq64vhn37qTsqqvR
 sFA9KrPhP627YxmY3LKMkcq9bYnBk+HQbuZdaA7b7n+v9cxysc8n73oq0dBlJo7rA00E1FY7a+G
 eH4BhkhM3YHwFIlIFYu5Es0leUoRzTgMaKeSKxgOZmGBS9QbWvhDKJp3dqZ2U3sgcOL379l6eIQ
 hN9DGIKmAVEyDeSn4uQ==
X-Proofpoint-GUID: dnnTtRchSzrg5rHJ4BnsYIWSvpby0_Vb
X-Proofpoint-ORIG-GUID: dnnTtRchSzrg5rHJ4BnsYIWSvpby0_Vb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705c38796698747dfe7bba1afd1859e..c415e782804ca8c9d09670cb8c8cd2353d796b23 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk2_default: cam-mclk2-default-state {
 				pins = "gpio30";
 				function = "cam_mclk";
@@ -4028,6 +4035,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <19200000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

