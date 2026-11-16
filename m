Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806891;
	b=qV03aPPgex66vEkP/kWTSXpbhqVlQEvDmy/30O3ytL4wL0JJC3NToWzIr9AAKGEOb7cE
	 pTyoUGsx+B2EPRnPreaeszPKoNgpgIP6cWs8LzJLfqtoP5OLtY+cKanzoGikg9e2Ncacy
	 9XCvQF2lBfIheM/YEvDg0f90F8eyHq28h3l48fCAo6Mqyk30EdGccF3Ihh4pcP+hAb4Eb
	 XAOzOXLTAJW/CRn06EIwGNfEV6V8NgyjgY5YTnjqTWLDIsAfnQFFqiXeTwVLOlHzzHzkU
	 J47YYrZmE7hC5PiwAlS2L11hw+nXx0zTex8teHfWSv3xzO1pu4h54xQujQ16AXn2NcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
	b=0f3ho95VfGYy0ZagRkgbRVop/+rlUHP/fG0m86KH1svX8HcMabda7EUMLY0NIcd5vn9F
	 svgvVHmWZsOLd4PXdQY3ymhbFYpvUdYtMjZQlZf+UtcrRSLXgWwTMQRD2Tkce5xf7UXqs
	 H85/gk+So8gzQhV8AVIW0kJXNbz6UGoHAz9QLFg0gbBNyUIVDC3jHW685Wb524rrDGz9H
	 pffaQKJXQRlWHhAehZHY/n2WchLrz51b5JQwejfmHxfSLGmmgHXauwsHxnf0P7lDH8WMk
	 FWxnhaCRUvU6EWEH9MRQLQatvBH76yLu/VJbQQeQgOlH8u/3CcBeihlCTkp2hKkMWyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581CC606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581CC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M3ox3177620
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=; b=i9ASdc+dFArBZJF1
	J2TL8pAAfcAJniWfpqQ9iIlS4m9M+4LsFmM8dH4h7ka6x39UpA3k32mQsJV/Wycv
	sQr8yWCEDyul6fTYwrrqwzfqNYwKM08cQa+QRlVcN2wWfxjBDxAl2M5gFOhqzOas
	m8SX8JYzD8jD0df5LycrmWb4eyClIRy+3V8mqWuevfodur3hDMMnwl+pdMOpQ4/U
	eoIq29/dbruF+t8GKK51lcry/z71BwDz8/pEkF5G4+3Z/6oKiqDB5zIk7Skw+C5/
	6B9pIkECRMPHXdZtHJlnFWSowNmojPt5PmdxsGpNt1C8COX0kSLfKCrRd6RrkBNv
	58aX4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmccuc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:28:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so12328195ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806889; x=1795411689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=eTHw56QsmFnZpNq0v6EqdzxrNpgoVces8lX4s5u7LTQrNpOIbpNTb7KHQyJbIwundc
         0p7mImb8IqvGEnWUhf3NdFbpKuUZ2+oUDjph9wi67qGzX9wLGIvAeEK+P4gOLrt9AuPZ
         fpoaSNxRsI2Qp4x+pgIpRkE95FQApJisi1y/5vGaSBxbesQCJN0ooa7LHiLL/+Fm9vUF
         /EfQlJAhYDIFgz7gW0jJqbYbP7hS7flUKEMNDp1Un4w8AC4G1f9Vbv5lJ9s+3ydR8Grj
         1MDXAp2CenQJVlrM+5aD1EsECVjTirl3POB1EUfeNBE3jpqDxJoLwPweFqUTFkPcbeUA
         rHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806889; x=1795411689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=1pMyUoqUUPronSNlVEATMok92m5MsD2egQVhP4Dql1BJV8ANg36OQbVzSewH3TjNxH
         L9BrOLvbOUOq0/7HIMd1FZCZAjqFR2/EIH56UEpbNtwLVX7UywjMSB5/ST1uADo+gaj+
         sMbIWpLvmIsI9rCsbmCHbaa3gjnuFiZK9Xg5IiUhxgKcKIVHRs8nFv3XuufTYJChrj/i
         u5lLDnuttj041KfbWEKHf2R/xyyaLovGdpdJgZ3kxi0sIRw3IfAnBQQQcofzpEY6W8OQ
         anyJ+p4EgvJXszGO9N8I1+m+e2sxKWtl+rFHBZvDstKo2+25AJ7uJ+pBMIzCxeRxnjDA
         5gLw==
X-Forwarded-Encrypted: i=1; AL+hErGt7YCpvzgGRxZO0g4UE6KUuwutGF+S7ebO1cLpv6aBmw0vXOg73Ie+Qzi/amREsr6oqtDxNO7U8DRyD1CU@vger.kernel.org
X-Gm-Message-State: APuU4Z+Urpdp/WsrEUG5RqLjE+6zMFanLgOIPvgLoFSqvW/PzIHVDbw0
	5dNF9polfLRyA/P3BSP5U5WdpEJhSmVJdu0SiyiXpF67QKL484l8UKgaHUhVGe1B84hVcDb/Exn
	Y4NH1x6Mt8/Lfju2fKa38uUVz/nHTIf+UHCD/rlFTwlzrTGlmJQyPwoWaAvvjY0BGLW6t
X-Gm-Gg: AYBFou2FLr8fMYLCab9Hr8DGccEIJdaz+Nw1c6CuvbVjs0xOZsoyQ3raxdS565UdyBw
	0sSWFqu4MMe4c/cxUB4EnqMChQueV//Ix9nQFLzU5YLHwPmojB46ZsTip2ug5DMu9/rqy86wnzy
	0Bw+n8bou2MQPvl4c8qSk8cUQGLmt6aGMQs4lLCwcKgfNluJNyqSTljvE0uSPVi/1D63C9nNMa2
	sdQ2ZPeNxoBrmDwjQbzMF22n293m/ifee9CiAKX0x+erPpVnYLPfzIudOIc3MtmCizW2CID8OIB
	5/WKyx7WyYJ72EkDk+NV7ZEmW+fnZAgn2FNBfN228Ld+k3WMaoAN1gEv/FXIeKP+moY5ZDN1bdD
	IEG7wOhQu6DWtysSb8/UpdS8EwS6gr52g5Jd1HziRSrzl+DI37m5SMN7meu0q/xW7FnQyaaZhEQ
	==
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831735ad.7.1794806888919;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831575ad.7.1794806888523;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX4kiZha8h60wl
 x3rTLm3tV25vHCuIJTzgaQUT0ql6r6JZ9Ny/zucVHYeF7An03zq4RkRnoknEwRhYgPBngAdbOrp
 t/6F/cPlneSxmneLmaPx25zfeUWKdsU=
X-Proofpoint-ORIG-GUID: F6Cyh4huYbVGZpMH43W1Kk4O_PUZXDQn
X-Proofpoint-GUID: F6Cyh4huYbVGZpMH43W1Kk4O_PUZXDQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX8ByyFddE4H1s
 pLJr16l+naEpXoiRokqMHBpyM/Vxnv4i4NvC1gAizibGGSshxKXA5ZFM3LKgXfGPgMcKmrEWuK8
 Q5qxDmExJ5CUfNxuh6htMr+L5JqcTagqef/aiCfcO7iKn8KXfJWS/Pk+zZTcH8F6vsZ5aSlbUfs
 EKb2MJBK0Lex52SeNeIt1Z56r1gYvSvz1OKyNJz6ZWKFbvnZ+uy6KaHl7f9r+hAT8q/wJU6z4I6
 /wZHz4IgXGHG7I/fRioRBsT8NS/J7bSageotZr0vqAKFsGv6Eqli439d6BBYk0IIKqxfQkkfetK
 NV5Y04ByrjJ3zIdJMOcKfX7l/Z3PrLRrn0eqICqDiXTbfUDcXExf8tubZC1GHyO5T7Uh0Nw5Flq
 K9DOu18q5MI786OrQr9B3DEWcdhWrbCF0HFlJPxIZqQTOwtIWY+QVoVABaSGyRZBJvC6WqtBW+Z
 89obJ16o0MboBKyZkCQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa9469 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dI8U08jQLcRiIMuaFhoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Add the programmable PWM XO512 divider sourced from bi_tcxo and make
GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
PWM core rate through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..93df784ba14376ecf2b60c5eb37e6d0b5cef9501 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1888,6 +1888,21 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	},
 };
 
+static struct clk_regmap_div gcc_pwm0_xo512_clk_src = {
+	.reg = 0x20030,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pwm0_xo512_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.index = DT_BI_TCXO
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_ahb2phy_csi_clk = {
 	.halt_reg = 0x1d004,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -3212,6 +3227,11 @@ static struct clk_branch gcc_pwm0_xo512_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pwm0_xo512_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pwm0_xo512_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4294,6 +4314,7 @@ static struct clk_regmap *gcc_shikra_clocks[] = {
 	[GPLL8_OUT_MAIN] = &gpll8_out_main.clkr,
 	[GPLL9] = &gpll9.clkr,
 	[GPLL9_OUT_MAIN] = &gpll9_out_main.clkr,
+	[GCC_PWM0_XO512_CLK_SRC] = &gcc_pwm0_xo512_clk_src.clkr,
 };
 
 static struct gdsc *gcc_shikra_gdscs[] = {

-- 
2.34.1

