Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014272;
	b=1mN59Z998tJ6C9YHek47jBR69NBG0eivB0KSD4FXkhXVbLytOv0teiAQuub5x835C/Yi
	 CUYxQnouF0ItdgWIbxMEt/BRRslhsZccMRHwF3Ash7ontD7KWA4IDs/yh7D7/AvykX2fR
	 GwlWNHnPudoGlimi4RvQz7HtrdNBzlB0vy2VpeS1IqpLpNcXro05sWYe7uj3FsdA86yo9
	 m91lffzmOfuIo0at4GX1CI/umhc1Brfmll7wDP/j6fz0faUvHd386/b5F1m5/LYhFYEHU
	 LXt7E2aCMLKOkjzLJ+xF7dE6BstMuZz50nhMOgBdaRP3D01CWSc7Kb/5YDUOaQNoEhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
	b=nnfylv0kQedEIn+2bBTzo4O7UN62ABZZsuvVYyyBwb5EqICCUcjmiATSMdYJqGzTkrJ6
	 R78xDnfd9fQX/6sLOizsxMdgUTF1xTq2AbqR+4SKV8Jp+Igzs8QUvMuO+oGwHvKb46Jz7
	 Xm3UG2Q40SrQpba3ud5ZEcZfF2eK/uUzHtdbticn8ETXR4edgiconb0ulv9812pqPdROS
	 y/qBw8FAIqutBy6Vv5gys6fgGnRDXypokddffUcRQNLrwjKi6u2GGiYMsdDc8JYW9E44P
	 c53UfDNlHGoO+fFqhEBaW+X+ZtWzuWzF3/61fyu5469smF+bIADk1u4ttMC6iWCM7dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O7RW/zIC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G2iwfRy+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E260A2619
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4E260A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7RW/zIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G2iwfRy+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0Ir3033852
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=; b=O7RW/zICp5ljs+ax
	SoMTMgPqRK8nN7vWGWf9AhDVKAWbLURmQdBvAe3JTu56NjBlAdlhECA4qJOZw2FL
	2Wt/4y0vapLJLJSgdwy4dCYK1iKo5D7T+m2IgIm9nzj4TdgDzA3FOPgpZYcw3Pxo
	Is5CuB74z8yz7R1X9cfRePmjk7JXJnn24jNFfEB2LzVdQ3VKlkDW4qGbyB+Crqdl
	0ILwSPkKgCkunyzAHDwFicoJtlVssmo/WznG+dMHxnLKxmIGaxJFOdeZE/u1+XrH
	tY7pZbp/8SCRca9NE2Z/2BZSHXH6vK1T2K1b7HHE2vi1iRA/2dCQ5rW/5EoAjsvb
	dTpP9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y06bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:31:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2750549a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014270; x=1793619070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
        b=G2iwfRy+88pWxkqOsJVpKAdoZdy5x+8TxYYQSa/GAExKr8g+49H4aTqgcbeJtXGBC7
         c89+0DEWkd0al/5qez4Qq11zngelic93K8LGwbHLU4mRUCCxrPFs1gjylc2G+y+ZGUnS
         GROK4dQ7pyyXJX2/TJLxfQ1uaTPAjLxT944T2gCfZGoOwX7s8VJJ+tMVK0j5ZJmzFFo5
         vFnHf5UmcWW4wN7sffqCQfEWCs6yDC9zEkr42/3XNkOGYovdVFMEvLsXXdqSRbjszfHt
         HlaY9nBkm7ZbnvGai12osSwNOV7j7Xy7KH4Mp2P/f743iWiSY+h0ON58DNrjMz17yw1b
         R0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014270; x=1793619070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
        b=QKtR/vGOeOLkXX5BmCMP2EDINT1jF5H9/WP/2SCn2YD+sfU8Colx8tBd9hBC9X3zZM
         hHhBlOOHxRqLcmvf+dKrQEBSueyPaLpkMJQCOR/7Sf2xAvMbcfQEzebBk5wZneoojcv+
         55F0GgGhwC9TG38OSRDbgb+1O2LWphwcBAvrCp82qeI5LnR2JGe0fRYooZmuClrj2tuz
         gQwA3rUnJrqG7ex9h93DH9YfM7r3TyFYgDs1RBDFLfBB8xoknSCr2GXiyWv2fnQZkBIB
         0W79PmCqdwsuBEkWGLMNcuZEuYdauplVcghAGwlXU2bwoOkEManOQQfPji9BA7/EkJKd
         V7+w==
X-Forwarded-Encrypted: i=1; AKwUvBywlK8wI9i12GkqcL7iX1nFIj18fRA9OlT0JVwFGbSLZx7WrPmTB6NWca8kwZ4MQrhZv4GoUotAVrxrCs7E@vger.kernel.org
X-Gm-Message-State: AFq9FYK/AtFuC/h4deqASTlSby9A9ngTYNfQVYXOCAya9b5pLKnHyhz1
	UtOcxANGFGQcGyWKrI6ZH9adrssLmueSsxoSLwt4dJduxApa7BlSNBydjkmJp1lPfNy/t6PVQqH
	KZLG+bSA0ZZlWMXZmI9YmHMeB97eq+2qkTUVHmQqv8UZ0eNDHInTd9RLIzMjJp9m0xwyV
X-Gm-Gg: AYBFou3t3PiJHcVznPWabLgzWhOt0vVF7L78AzHo3B9BEPEFHzBvChQWssbGSPLSDe/
	DAADPwu51dk0SXmgnNdHB4tSj2lNzXmtlE6P536mrBBWI4k/+aqVqoUWjQgtOqgLhbncJ/oorNz
	Nf+iKR43Tl7eLWF5CoQ48nyKsYFdBfnUu2xo4lc98osKCyhPPlWq9YWTl7lhHDhjZQ1Vq3zNuwo
	9RkAyoFPHQaLVLfSfeb7gczVNrsXa6to0Npq9J80/GraNa88mcHOwdqrfx/3X+k2ft6UM937Cek
	k+9o6DdmtVIUMktKi/0EK80F9IsZPrv3EDl8lduY4D4WSWynqLNOuersLFw1XESN1qVcmkowZR9
	XqhMI0FYI5nE/e+ZIlH2Ki3M=
X-Received: by 2002:a17:90b:2d86:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3adeae70769mr5826670a91.48.1793014270255;
        Mon, 26 Oct 2026 04:31:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3adeae70769mr5826620a91.48.1793014269630;
        Mon, 26 Oct 2026 04:31:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:37 +0530
Subject: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4s8qrWiYX4kD
 hDe+cCPNuzbipsdWnfMsg1GPEDna35TyXaQZmqCjUYnJVeCj1koTEyFn9nmNYcXdl+t+t1chL8q
 s9iPBqvoGhlfKJ5Uoi7lzAzAgqEnh2Y=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf39ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zpsMDwxbIOh_EP-Phi8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX6mapPN4pwaBB
 njtOePx66VVm/2rImsL1vVd/T+XozZ+1oV12sILAwH4DVQicZ7O7kvop4vkTsM6td143QuhXJw6
 G1Luzgdigt0U5ejaNZ3saQ9aQCHIHDLWcZHKvtb2kwAUJ3hpggtBHncKr+U1ox7HDXLXrbi16tI
 23llGSS8EyWdLnpIco7i/D2c9rAW3GQd/p0Y8p0l462Vj3kVCZhah5I+Vg2Iy/zA7WQouqDVmOR
 MH6geC2YOYPEqUn6N9WsMbAt0g9CbVC1e/NbIhhKnRVx6/YaBpdJjxRZtrnccKS8Kpsukgmu5Kt
 NaNNiwf4cpEeoxZggDRbrbf28MZm2KH54zmrfDOiBMVzu3pe09ZcC+j7kiEQLLoHx7C/e8nTaEf
 4i7UrGGySFbMe+C46863AxQ+hAsAm+ERTtDygzikkVbZFceffDhq+vZa/x8x6rt/DiLTzqRHoiB
 3DWKJptTd2GCzamfCBg==
X-Proofpoint-GUID: _IDsVw1G-RmQUqiXWt0J5bx-mwSpEMwi
X-Proofpoint-ORIG-GUID: _IDsVw1G-RmQUqiXWt0J5bx-mwSpEMwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d2719775b8f5c6a8cef138a93292721..de27a051ee3b0e9046ff97b8e6fe0164985d7b17 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4442,6 +4442,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
 				function = "mi2s0_sck";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_data0: mi2s0-data0-state {
 				pins = "gpio98";
 				function = "mi2s0_data0";

-- 
2.34.1

