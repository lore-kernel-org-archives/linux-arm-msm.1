Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981819;
	b=yl09MH+2NHTddaoq4Qmmxy6/atlJxpjQsjraJQNp/fK9hD1AnY2HBp1CkqnJMtSptuXm
	 7uhTBbjqBv+JOT5WYpvh/NLdFvmj0j2tiV28LUm4ac01ZlmhKSjRu8404R7zEvZYIlFei
	 OS6lg2Ns//WNN6fNuImqnycR1cGTvVgG72g5Gk/4NO2WtXqlcKr+Bbzyoul7YLqQRr/ms
	 14JcVNIEsuYoEM7b+dlnYb4dCJuM4YlrGJIA4wdf/BIGVz0LD5tT6feKtTavguF/miUu9
	 klkCcGpj1Dv+im/G4lLCGoq8mxBwCe/fm/x7Lp1d1CDMHQjSgl+cq7DxYtWD+v2RXAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
	b=5XdEC5XAoHZr6wUy/xlUJBVCSx0UrEiCDCFdgL0jZDO2oMYF0UHmx6vGNWzmjtMUAwXB
	 TRE/6U3QAwxIKfOkdHbXvK6boycD8f0R95bSCmL3thi4bAmi3GIocEgREpQXq+kpV2MQu
	 yDl3emkO7cmSffZ2zmdzT+no3SOsWmu4/5ntpuAdoJVCFWE+nQPNj2b80IEnjWLfpbIgG
	 cQitfsFOTPoLVnQMjea6iSn8+5QFEzwvztrISjn1JAXkJLfuYRHY+kmya5mud51gSC1qA
	 s8s2XghPJWX5WaEZXeZo6GLiPVDtzfBaI9eT57rtqqKBPQqWVHhhsc0hpH1IBeNBsdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29C606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD29C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwhI2602449
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=; b=NuDaoHK7zog9vIxW
	6RSCIIUYrVQ9w0Guy+scyNYEUWoAvqvYyaa3I47zVNGoN3OYis0m8UwYRldXpm7b
	EW+9wx1w3poD7MV6FDVMXj3FWBvIEMv7lDhL0cn8NDztX0BjPiCOJ8U55akGmzXr
	btH2xuKlB+jU/znChMJfQURwipywNPs945gnCV/ffYQcIEYO3i0J1YJYUJWdtk2H
	yLj+uBmaJx345p9Id+bPVhDW7rND5Yh2RaCZazoJMzlZQFZ0YM0Mt7GebraLn07G
	1UFnZtKt9GchjCS98J60FOAUH3fRxiUSQFHXL+jcS55tY0yhJjnZqQBFu/1vSvuT
	ujR/SA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed1fbae872so7696665ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981818; x=1795586618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=CspXak3XYuU6eaDrwpVCNIP1TIH/7+vq3VeyXjkGF0Z+68T+VTDgnZIlqw6RP9thA3
         q58dV6916yOoYmUNyxe6B5alk3rXX79Dm5UDCg0rP2lt1RtKIsJ6L5mWRSvGfYGlwkjU
         yMvUDNsLvE5hTIrD3VRJsMP1YSD30Z/2UQMrGLCjyqcfUMjbuXenL0cbfRvWOS7smffE
         D/PSXg7Ov8MNbMQbubkhaUMU2iBJzaJk1flpJ6SbZNmHYZYj8Gii/bHvHSvWTSh9OSC8
         T7D6G2dU8OinZYY69aJ6uIhdK9TGRtf7jBeierZlaFzJfTMj8dQSYs0asjAK+PPrTz7h
         UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981818; x=1795586618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=SKVxx+JVVJQWteaSjVY3RRNdYDnfmVltM3jT0Zpkl4gTzyx5yog1slwoY79UsavXCK
         L9nxc31ZZinw4zjLVHtxwO0Nxx830spjhUIuhVULj4UNk8BstFmjWHUp0HILAZU5CkQF
         xKyna42JEhsa/dRGt2k6s2UPn3qCeG94wYDDI1PUjIN2UGvRBNL+XjvzZdg6qZaykkBh
         9Ae0PALX4oB5cr+7MZaT6ozGHYejm2rzhwhBZUmwBLMpIczfWww8PzJ2dWiy8xSXRDPQ
         7Afc+Ub+Fu/8hwDrdWuWHkDEy7WbCsbCTgLEHJLnlP6uy7iOOkto5AfjMf3oHoHPHxwX
         AsvQ==
X-Forwarded-Encrypted: i=1; AL+hErE2qP+KqPzdtbj3H3XeIVTV8Tgrs2wwi673iVSJrgiIEyNo9dMYkctv71KBzAgBx+V4cfCHh+aRGqThRK20@vger.kernel.org
X-Gm-Message-State: APuU4Z+LusKbAZRlUcIHb4hAV9eW2Ux7dD6DK/DQA+iZhd8FmeJY3EmC
	WIJ02exd/4Yfmw9JFM7BsQOvTZ14EAKPOz2Bu0YyazrAgRAF1beg9dg58wedSPuP5DSewP82x3p
	myXhbK+vyFtaMG9WXOEY/l/buPHMtm42MeHtLkp0kvpcoheOqF7yzIWNoTb5c9T2iuhaZ
X-Gm-Gg: AZFdTZe/5RYIfgAkMTSjg6xn4p+HaKjRDx+LQb5vRqObm/9YCSHIAv8vCj7YCPG733M
	6nk/alPc3ApLCMwZrXHgxgCAm0vDTDbh/xzmLdG0hSAxBr8GtuR8TqoQeB3l9kpZ0Ybd8S0ewfm
	4UId2nXuuamm13ewpbJFz/VdVtEJ5LgjOyW676/pKWAguFt0eW9t7qLB5Gfjgw294ovLIPWnrR5
	pjdIGddQceBxEIl3BZuCC1E3Gpaob7gpCvMh6xgL8PhZRn99m/4kjShtXVckSb7TOTChgszMsmS
	yht3MsINwN6vS6eX2TCSpqJ2SNGI5x6Pmeu0M2n04RJrQntAvpGLRTOavX6jt1XQai/lBczxrZi
	hhgnqTFSjT/g6S70Ah7dKyb2PCkXUHTaqaP76SYFqohd42LGkdOh9CW1GkRXiD8L/HycedFU8Og
	==
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948805ad.12.1794981817673;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948655ad.12.1794981817257;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:40 +0530
Subject: [PATCH 09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-9-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: hWYwIg8wfFPPx7noiqaSJXPlqP_qyFbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwNu5jhZ8WvsF
 Ye65qvSjFdDYAfHIFX/bcHiwqTthODq6kXexCqcCjYR4PLvcOTJKee4bamK1TTHw5eVtMFQPTUc
 yXvQ3lGZRkrvcNH3dF67bZOtQHF4sWlTHmqsiO3TpIY63jnG1T3dI92YtG4RwSE4Dvq5kE4cS/S
 jaiTYrXeH/34h6YtgMSiTrjpa2Le1WKEp9L/vC2IfLwkZW9/XYxY19k0CtUunen5dRRn0MngOkS
 bghQYMXIHCbDVVdLoE3K70zfd9C17XeFPx3BV0ued7Nl4AD+661iY1wN49bgL0qLH3ag6ye0vdE
 MhMMwOQjrsBtmQqeqBa0gZRcNhx94sHiS1+0LpJb8bn3eaeI0Z9vErYXuQ+GlXLDvAUzkmqF/Nc
 o2KKnUirBWUnZ1e+h1Q/kt8C2XCSnWUq/qhV+fB7HZ6k7bJ9ZxOHCMR9QZdWu3fTNoAk/CcANcy
 8j1umLXr+SMcU/dEZbQ==
X-Proofpoint-ORIG-GUID: hWYwIg8wfFPPx7noiqaSJXPlqP_qyFbB
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3fba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX+7CbGw7UC4cW
 csdSX6e7c87fIYVe2mTNh+LIovqGBXIEFiFQLMab+pqWHOS4q8WjU6O/mFrlcPdj1go4q2ggwt4
 odwwA/7P7qUr3FrPCqIrX2bxIjeDq8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SM8750 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
index 7aecc97745a8cdffe70720dd2f1f3391ff979ce2..1af098d45c54b99871e81e6576b516ffd0374fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,

-- 
2.34.1

