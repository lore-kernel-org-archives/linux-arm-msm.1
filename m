Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616161;
	b=m9yyC7JRaoeWLR8yoTS1tGcE7wYifGjq0C+AfL5Eo4mC+o/tBiVnSDZf6kG74RQ4zLh7
	 v+7WZeKH1q773PHXMN27iwLdZLcF8ETLAgK133D0HASaLlcz7iyO0RIxW78sR//zTboj2
	 riVVl7YThfexIj2TbCyiLnOGCzwGjVNIblrlh9fY14XBODTze38ebIOgPZIXgi63aTqQC
	 SwE3pX5jpPf496vHWWv8/p40oXipwmxa6VE6liC/lsPffxCmbAUYiaoPlv1XPLSzgAn7/
	 DC9qMBmHB9XCthS1QKKO08to1BSLIdHLrPMJPpC6iq/MPlKydDYdgUVgdQzbqvfFk0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=;
	b=iRaRKqA+Fe3go/4deOW2GA5c27xQ78NDfb+hcLAJnZhhF+HnjvcY9PRsn013VBcHWXIC
	 YdDdo26dHWkh989/fkOGg7unPUwrU9bSL4VvB9XxeNp46cxnElQm28ak5hg2Kp6chCYYd
	 VfCY5LLzoPjZS45f5AMwE/eEdl0oOcdbBveQKek8eGilA7FEAhPOeuGZ8xizvzXkVC6DH
	 d7mBEjoN5EIpeTkHMpVy+8I6A9rsEBi3ABeFx7cSzphRo9LaSNle19+6PQlTUNI41sYQU
	 F0bwY+NhCNGouZJKGehi217Y6GcJOJoOdtPY0H51fBtkr+BBuVgWfdI7sVhuUGHPGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaTlsDDr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxLq2oOo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC4560A6F48
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC4560A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaTlsDDr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxLq2oOo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJN32880820
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=; b=EaTlsDDrh5gp6ede
	0UEZe6UxiY6HXUtQFTnduSvtlN7jKnXZ4VDEePkiPIw0NugXp8gAfY3bhJQKAAgw
	AQPkEyGsQc3pvspvhwvJitw8u8UnG8XA0s7SBESEYihu+VyRSugu6LtNKDw/eyd9
	fgrchYOmfLIE5a3gXRBEcvd+/g1IHgv8erpo6I6tkbLOukmOOye8KKQ9+s7B0+yT
	cjyBrltSzhh96ea9KZYU6t//4+CKcoPb7+Y5e27DaXl9r6p6iRmheQTl8Tr9scBc
	f1lKCOt1iHirMXvc5+G0RK0y+dGYQSWVyl8maE+kbOSS4WHHoQvyjZCpeXsrwV5T
	QtnOKw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgdw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:40 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5640a2d9708so3937018b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616160; x=1794220960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=;
        b=LxLq2oOoZM4XjXiqKZZYLU6571woLp9hYPnXRkad+PeHyt38Dd9+nV4siPyjD4Smf4
         mEJXlEGPLwCrnfnFvUxs5+2txg3dXFQ4z5EireL5ICmmKwDCFs686+6C26bwAqLIsRzV
         huQgbV1vWiWCz67RHyIa2sWttKJra03+HqbTsTRELJHSgf3rW3qpIz7eEbtBDNJGy6oC
         6k0hbtzHfLCFdTNER9trYqNz+afuhyY96Las+9dAXf3DmQ38t8Zj/7T5fE4H1yRtM6py
         9o/37weNEM6eQe4T7XG8prfhYo2UUBhl3gw7H7DfhmmwqMyO9ZFtxuYKnolGU+m5kj/B
         GzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616160; x=1794220960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=;
        b=l2AOU8eARck2yrrdEMAdfMDIzsGjEcl6HldBQrdA+opTAtbnYkVVcJbGQT2nAA6ygo
         WXR5tyj28QjqIKs2e0Kc7a1BHeJWYw7X9OMOJvMYizWN2mGC8XQeqNTOlZLwXwnsA+V+
         0zqi1bXMNJX5WZ+P1nUiY2jOxJ1fzhM8btrfmGEQffkQYtQ7PQhbD6HhjkMXMuQ1DsA2
         I7JQZ8X9cs7wDrsB9LFT2Heg3vZRpuk7qWz5gL8vI69MAGLAVVoLWOEyVJxRhLXAmL+7
         AEwFYe6qVPzo0Z1yUsCagzCzGncAJOcGBfj7m9aP92WenabNsdbrV/UXqiMESDpeLNbk
         ie3A==
X-Forwarded-Encrypted: i=1; AKwUvBxFk4bF/8u/ilAKZ4vYFOoe+JCFt06jt2EXEugNU+x62Nxmm0aJm7xs8HtVtd60ANoh7faEcpKYDUDr6KtM@vger.kernel.org
X-Gm-Message-State: AFq9FYKjUhite0YYryQjtG3Jywrb+xCG46FnNCO5Ru5B7OIrvNX1WjOt
	A1IaxV1390lWtGqXk1OQudFAZ5T8zJijwh5D7EeJ38rg2+HUowHmhvVxsG0GMMXlr/ODkXgtH1P
	KMiJzGClIuNDmnfpn1R8kKEkfWtcZVE7GT4LoGGKcqMw8zQKzr8p/8XVAgEBIchjksmwEh1ZTGM
	aL8P8=
X-Gm-Gg: AYBFou3bggKK//m6memm7bU8QnEuZYlJtEd8PGTJsdSOdGne5k6BJgdIz9lbVemBuzs
	wr0mL9vo8eOocoWaDWwYRbqnmnKS/2sDQi16T/Ky16XlBX4tbQwtEzP2w3+6DP6uNwIZ9gIqsEr
	mW4njBuXWKj0tmukpjT7mniUYzMlVM6YmXuxqisnHd2KAF61vi0D2Y9T+N4+xB/Zcymd8hP94WK
	8jqSWJF9fUpCGo0mJco0sUoB1HLulrz1Sl6VaHpO5z0hdt56j1ffwH0v+OUwlFXFReYwD+XzaBk
	0dUiAl9OoqRkgpGxYJvC3WOUM2WdunhYjBOiXxQK3wdCmkU1yAqeRWAClVhl/jCj6O4qv4nMrQu
	6yvMhty3myWATZqyhTgLw20kivKJhmm8D81JwVpN8neaokGzgfER0551pLkXYyWb1YIiz18IOrA
	MigWC1rSLuqcy6EIiLwiHKk3xe6axdEivMtBhMvexJW6C8b+LlisF98PYxp3M=
X-Received: by 2002:a05:6808:6708:b0:549:e9e3:9490 with SMTP id 5614622812f47-5640ddfb120mr6422789b6e.23.1793616159802;
        Mon, 02 Nov 2026 02:42:39 -0800 (PST)
X-Received: by 2002:a05:6808:6708:b0:549:e9e3:9490 with SMTP id 5614622812f47-5640ddfb120mr6422777b6e.23.1793616159349;
        Mon, 02 Nov 2026 02:42:39 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:38 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:20 -0800
Subject: [PATCH v24 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
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
Message-Id: <20261102-kaanapali-camss-v24-12-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86920 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YXrfeFT6_K0meoKCAT8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: CQ7aScdQy0GFeumao7xU96XYQ0ejFVBS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/5a6RO10r26R
 Fzi8a+cRz1WJmDj8gTsv3ISNbB0S18WxTpoHDs4Fl0bgpfSYTxbx8eanZtXyc8UbT9VckaHE339
 oGSslNBOgZuF6nAq77/imPKosuRFqEI=
X-Proofpoint-ORIG-GUID: CQ7aScdQy0GFeumao7xU96XYQ0ejFVBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXxlyYdmxW51Bv
 vQqoXVBfTSTSLFoqkKUdjmY6H52yzS6vzdsWkNlDQwlwyGXt0KU5T+xzd+H+xqF1HiWID0buRlX
 sY437Esx8EE0KMm6pD6dDuJMynpMf454dFAdwaPUYhDAcY2ZFWzos7Gg8DyiEBkCW4tnE3IjHf1
 LxSaIUSMZUGESlL/kAbhU3dsyiPqbcpBdUOgZTchZmmgDoI7tTt0iVLPEdZhXjqxhO/9YKULeca
 72bfCafJVUfTH1kzTol7PMPLA921WX3D10D6HvMVmIJ//deG9ODNB/1cwLdZgq8wWZ6YLLdXixy
 z8k9UPGScU70YaZqMj8uwuuqJN8sTJwyhZhLnPoXzwZCYckBzaEBXoLiF6sbUXCed/+ycGPznkD
 QmExy5lcMQBq314pvfHqgSM4yje4YQCnSFmnpnKxCnaJpc42q8CKkWEcrh0NK/fNermXh1XBZma
 BFAPpQDU6sFaIUISlag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
can be enabled by board device trees.

The camera subsystem contains:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 399 ++++++++++++++++++++++++++++++++
 1 file changed, 399 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..e107bcdf0f8e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -3597,6 +3598,382 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		camss: isp@900b000 {
+			compatible = "qcom,kaanapali-camss";
+
+			reg = <0x0 0x0900b000 0x0 0x1000>,
+			      <0x0 0x09253000 0x0 0x5e80>,
+			      <0x0 0x09263000 0x0 0x5e80>,
+			      <0x0 0x09273000 0x0 0x5e80>,
+			      <0x0 0x092d3000 0x0 0x3880>,
+			      <0x0 0x092e7000 0x0 0x3880>,
+			      <0x0 0x093fd000 0x0 0x400>,
+			      <0x0 0x093fe000 0x0 0x400>,
+			      <0x0 0x093ff000 0x0 0x400>,
+			      <0x0 0x09151000 0x0 0x20000>,
+			      <0x0 0x09171000 0x0 0x20000>,
+			      <0x0 0x09191000 0x0 0x20000>,
+			      <0x0 0x092dc000 0x0 0x1300>,
+			      <0x0 0x092f0000 0x0 0x1300>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				camss_csiphy0_in_port: port@0 {
+					reg = <0>;
+				};
+
+				camss_csiphy1_in_port: port@1 {
+					reg = <1>;
+				};
+
+				camss_csiphy2_in_port: port@2 {
+					reg = <2>;
+				};
+
+				camss_csiphy3_in_port: port@3 {
+					reg = <3>;
+				};
+
+				camss_csiphy4_in_port: port@4 {
+					reg = <4>;
+				};
+
+				camss_csiphy5_in_port: port@5 {
+					reg = <5>;
+				};
+			};
+		};
+
+		csiphy0: phy@9523000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09523000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy0_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy0_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@9525000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09525000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy1_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy1_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@9527000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09527000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy2_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy2_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@9529000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09529000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy3_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy3_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy4: phy@952b000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952b000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy4_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy4_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy5: phy@952d000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952d000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy5_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy5_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;
@@ -6548,6 +6925,28 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	thermal-zones {
 		cpullc-0-0-thermal {
 			thermal-sensors = <&tsens0 0>;

-- 
2.34.1

