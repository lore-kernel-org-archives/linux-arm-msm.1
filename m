Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981808;
	b=chKQYcf7JBw91G8itbYN0oLjhqfKOcmvMTLRG2kG1OMMrokwB8yXQV93YjAj68UQ7u/R
	 EsOjC72iv6F6vu7YIaJH8JVbWU8E3NOVP7BT0S+mbolE7NyqxQJEsGBxLLY5NSG5dGtpX
	 3c1y0c9q3/J+E/gKJH5IohhfdvKc4t69whgIV0vB6lDAxgz1RJDSmDLVMd+/NZ9CrRlvT
	 ywi8yzig9tkDRG6GUh53uIb5uaLmhApbE2a14kqfmEPi0+pgAEcA1VqCjXGzfZAbktNdX
	 LamteBkI7K583eq93vXDTeURSIvVoAM7ZN4H06SGUeDYYDg2bo1YcAwdsUt4IAt72Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
	b=oO6j/Yyz5MkJ5KyB5h1TxSF04yA0YFLRvlttME1k9hrd+iEY7SUbBB09AzEmUnRms03U
	 E/G9HPALMPuSjb3DJRoMQY6PH6AZkVXEhYJYyqKghES3tMGTsoEB+9N7pzvbQ4mI9cyJo
	 Q/cGrORdmy2eeeup8aLZDDOhTjLJekdMkz8oQ68Uwgoz/v1IXk+fFZMgWHN7s7glk7rsL
	 ZK7+KOwdxEpnmqzaMo0zgW3f7vFIu0X9Ex1eSweOIUIIDjsm2O9XnPx+vOuNp+N1mLgOO
	 ph9FcwbZlrJFbnQ1SG+HldtmflVfHkG/vDOE7wYGS9z7X12UtzKloDZy5yhys+vuMLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="csZl1/Gq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAC7bR6V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542EE606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csZl1/Gq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAC7bR6V
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uuag2453543
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=; b=csZl1/GqXiGYJtqZ
	syMkGj47N0vft8Hrr+hCCoFG9J/uxuOFskOzYjZvPI25u5DeStP0ATnZuNBnDcM8
	9wf69nulRESftniW3cHL3S8AAGY+AW4EYNsl2HDrdpHtSZJEqgtu5rGdDuSbTXzB
	AUdFPnbo0eYrckieoLXSEL9mDas9wvJX0VeEn6g4qT39kNVdQckTdx0RAbk+zLGU
	AG3lOs+gkv8rrEAanHadB6FrWR0PUuePlDq/PhYg2MHVJjANKyO6oq71C4GGjSM3
	I/X+QNUB8B8RfgHNuhmG5Qqn6wqnc1nMZchi3YczfZTHgfpaMUHAJm5Rpo4QQ4RE
	fHSrRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99er0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eced5a4cb9so5912125ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981805; x=1795586605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
        b=IAC7bR6Vi54NOfuF6rqZ6fSn75EagmUuGa3DZwPN0BlIujuBzmxM10Jq03WP18mBeQ
         1RXxGM/mfpZP4+y80vC0rXARIZvqPgN6t+0rkh0inXfejDdhS8fOGtQ6wiGYTgKI6Di6
         aJY/9t9HAbt2YsA4UfSzl/Ec4MY61hsZwbr4JyEzizectpalsaVGQqafeEtk6uMOaEuH
         0eRzyLhxzR2VKIOqPe4IrnyARCgelKntoTH0BMWxGZ4yiM9/zdBeGZKwHjeDbgAGrVhW
         lmKxVw234KXn6DgjS1ZliWxJHaDzWaLNd2+XKDxbkDKOP7qS7Ck76H85/zgK/kB9RAhC
         QGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981805; x=1795586605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
        b=xpcizwXZqgDK7n11DHIu1/6z4vYo03LMBw+aOvhDG3WzyajQDfeDTTQ6e6GmXIpiB+
         7UQLIpHusvdiJv2jY2WtlJpLP7+IQR14xg3UxxnozdF2BqpEOQB9cEq5uJJQDHtwYG28
         8Ya0L2/7roy0d/g29GQPb58xcPtF6HUzGGJq3H9KsP2DH1BPhuwuHxdgC7yMCAoBx1V9
         zGBlC+pWA3thlR006D0kI0Dnb9dtjOYpY0xMhcm73Vas6FrR9aTLOEyAKgfyqAkdAnlk
         ofCmojkWUuNNw9DH8T3E3pcT+KylaekA+nSXyistB+wF395CR4qA0QLK4v6hJztBn8PE
         Medw==
X-Forwarded-Encrypted: i=1; AL+hErGWBvwz6bzl/PbHZAB+axL09ikiG1RcKYXfIrOznk8QF7BZ84zlyBjMoTDWksS1hhLuz2JgU4MX7IsS3vjX@vger.kernel.org
X-Gm-Message-State: APuU4Z/dkXPbTR7OTsQmUg1NST6xV0/ZKjFCxmHg5qOLQVKAie2z2G+t
	6IPxF9FNc3Fxt9w7Wb3B/hJHzqcH6eAR7JMEkdFqIm8npnrvsNiMBmn5kalAZFG2/YawmZuYExc
	K5AynKgTf0bNCg30wl4dfQv/s+7hHmJsZW6mHH3tCnC6jcnXEdBvrfQ53fXuiR7NVx1t+
X-Gm-Gg: AZFdTZfMBJq9t9uS2pEMWh1VUfm2v3mgD3H2usleeBHGGm90G9EHTI+Svzv7/GzdR1o
	69lvYxTdqYq/ORn0ijooIl0rqtX9qb0BZ7e/Hl6evJENYyYLD9ULcghwcYc95vCKZrEBrACiQL2
	49kZzHLU86R7g6d14dTAp0wBKeEDgUyloSskRdHAOFZXNWQKczrOOM9xI2bJWYnWHImjVN2UZkD
	afHtNsoNA7LuGsl1QAoNL0eR4wklvi7G2msSpebzvapxnVr6t34VjzrObwSaN81cbQjA+bzkoot
	21yH53b3PozF3cdq5ptDoPABHB8QZYs6SUCZEDupZK5URfrGxFROQKW3Tc+qWZvOoWA2xR5Tcrg
	y/OocwEFYEQkIPM75QDCrvmRynHGB719MxOPe8gHWu7jkbQ+L5XZrDlDGGRXCnHD36QgHyCuQ7g
	==
X-Received: by 2002:a17:902:ceca:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2eff7541959mr14868355ad.49.1794981805129;
        Tue, 17 Nov 2026 22:03:25 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2eff7541959mr14867995ad.49.1794981804661;
        Tue, 17 Nov 2026 22:03:24 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:24 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:38 +0530
Subject: [PATCH 07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-7-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX30Hpj2kHSpeT
 SRewJWJs7HMLsNWq/hRRC9CANNLWuhHjcLcrcrBhF3cjztx7Ji42cXw3U3L9I4Coq/Zy23zwLRz
 ozgZKIwwn4TnmV4pH1PzciSu6/NjtRQ=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3fae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5Of8VGKfJeO1p_vZ4b0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXyXbE4HR3pjGq
 mmNZugZjaOwRYSyOQbXkiCRj5e80njoi5Gp6nmonXkwm8/qpfaiZf91u0lTJPXgPOniZFdQJdBA
 XvyYle5snZYhvUzchANzVfCN//1jmnu6ldMsOadEh8BlP4eC56d1VTkuBcRjIEal9choRjbhMbM
 3JTusZXLVJ6ex5o7WU6ZTYhfckcCHN3JXDeKROc1mDcH/8F/ImLr9EWgdnBImWul094EsNtTBIL
 FUe3J1OpmXFJdGWp+0mh4LMPfnRmgma52W/1PVoJ9ZsIChBk8FAwSBoIVslQAzF5xPV00nKmQtM
 F+Y5rtNkvNU/IsQO6thv13vlIyiaJo+nNZiurfORfkItuwA47dDMRBCmTCyvuViiQbaiuLkUUrn
 DN+yOWbD/z+AQAWTO43h9AgLvFnVaDDWj6rFWC05vvGy8KoiJq3XLWZTfN13oImWPWjgBnJfpTR
 UeCYhvA163ROXXKny+w==
X-Proofpoint-ORIG-GUID: X8AvDnuUeb1s9bJXNp8uEiVzF9P5wv9K
X-Proofpoint-GUID: X8AvDnuUeb1s9bJXNp8uEiVzF9P5wv9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the QCS615 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
index 2791e578c1ded3fc1b839c59fa1d8c90df4d837e..768f8196032e01979df6ed39c2036c2aebdf3905 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
@@ -78,7 +78,7 @@ $defs:
                 atest_usb, cam_mclk, cci_async, cci_i2c, cci_timer, copy_gp,
                 copy_phase, cri_trng, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot,
                 edp_hot, edp_lcd, emac_gcc, emac_phy_intr, forced_usb, gcc_gp,
-                gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
+                gp_mn, gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
                 ldo_update, m_voc, mclk1, mclk2, mdp_vsync, mdp_vsync0_out,
                 mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync4_out,
                 mdp_vsync5_out, mi2s_1, mss_lte, nav_pps_in, nav_pps_out,

-- 
2.34.1

