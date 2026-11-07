Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074821;
	b=TbUCu8HeBin2XSaR2r10AwZjRFkJ7NP17zET4nLdkLs7lLm363oGlYjGWAVJ9YsvDwqT
	 Eef/KRNmxe+xpNVnOI3FyJjP6Kb2SfqbuHO2ggv9pLBCbvuEfLheKMjKIeCqpwYiYihjM
	 2tfzNhCHqqAQWNeESKebmogigktFLZyrQywdq5by3Mv5QVi2hiXZ878DMqYDXUxgbprn5
	 mw9iHjOtkMxbGkGBxhIO+qTZBUqNxvDBP1zOQElVR4bht1tBfVO6JOOA979lcggwph0hY
	 fQjFpkAG2/3p9czdNCi812y4/3xYgcHSXWk8L/bydPB13APkypmmiawhT8R2LGsgwvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
	b=iiJ6TTp4GDMei9oKTZdDe+kYI6UG48Tl3rV+mAbbNAAUc614oLJL4S4tG2E0Qhuy4TEl
	 bvi4XSIerHZlHEV6YAPEH1U65bsHinXSZVmHl5PpTenAOrIGspE1bz6ufssFdWVFrMoHu
	 EWayTvqA+QYGHquS67sSCkxVqTH5HK4Ft6ZCfOhtIjYbTV3o7sbu5A8sVge3u6WKyzrmb
	 iDs3rwimpRgG1DP+KarbUnZEFsZT6DH7nJ2RUO2/DKmH0IBvfXs19FNsremK5fEmX7dKF
	 Yni00pvNpWJc0uM3J9sB3iR+Uh3e6g9LrFMsAf2BfEaDqyFguoAGnL5Jkbd7NERtPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE10606A33D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 18:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE10606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7HtRYB2894682
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 18:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=; b=c+FXOOV4P8LCuKF8
	9DYVHgim+w3rFMHfQZByV6EWS4my2MLU79ycnaWLfTibNV4kZP6snIGgMcgficp3
	2OWyTSVCusxJScLN093/538olFGoYQj1QjEd/l9wyJNZeDXwvvD9Mf7RjDLSIEog
	BOMLEMwMPduVZh86DZXVs6GGqa58mKk1YGEIcQGQ6FXRsaxeovfvBgSLktGvDpEi
	hn5rl1xW/uraHscCYLqUYqLh0VcNMyhIc3sOfyd7NHwkx6w4O3r0DZiYbg0qa4Vb
	lm5yn3QXem7VZUx8QLiNYi7J9QRDYaxC5CO1IldcdBRj8N26sLrRQ2nlrt5xmbaX
	lav3Mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvresb76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 18:07:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso4964795eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074820; x=1794679620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=YlVXrR18NxkBaSkupYMNuhlH9Tgln//HRUGwg0z8PQTW54gRptnACes8sPbqC1NGn5
         U4Qy9RpyZFuRhUvNORUUX3ZKxHSg3agXbNMF3vtDzaQgPWgNs7Jhfy61PWOjbu1OUX2E
         /+FiPrxOd8nxMu1hvpGAyj4B9Ru7CBNinapIOajlorjdEsUradNfzMPIbWaVgNZSR6KK
         h2fM1moWsOqe0MgfqC4sme0QlI9KhKgs9yzDwmi8wpTBHxt+D2eR3aF5dnPKkA9nCqFK
         tq9Zc7ZT7EAT85Qkhk0nwQ0OzKqApBt63le6x4dX341cimKPsbtH3mZIaVaXyDy1Rjua
         bdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074820; x=1794679620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=ljElFyC3oNJho+dCV2sO5W+PFfxpTcG352MyUhM5oGXMG2BTkwWjAj13kps1r0KwZc
         REcUQEtBIZ7m/Gnj1n2PfGrhrjMBheJBq1EY23X8B3w1qy6KWlc2dtLD8aXkj/VQT+9m
         rpb9YwIxcPFVxcA7Y5KoIEMYJnGwSIlkH3NjHmB9xEovzvtZbZ4XoNDYCcFMxMt0wrXN
         6DQ9r4PrZaJfKliMM4t3ta+botsGbTVRgyQSSqsNhE6Tx13RHePr7lLYI4fbTk5HCTHg
         fR5vSfAN2ZWWYvfuHXMa5Z0hYs/1rjQHRZKBwYNoCLOdriZn0UJ53o3cCki7fO5mzYMo
         /5QA==
X-Forwarded-Encrypted: i=1; AL+hErFR5dpsUZj5tbWV2e1+PARWIrCHvdiRK5dQc3RQl4gHj43e2ttdeZXUL1rBSdYNc9mdRcGDmJ79PZOaY/Rp@vger.kernel.org
X-Gm-Message-State: APuU4Z9gla1l+VZ94CYaxr5vklITEEWL4CFOE7+jZLY2JzPDpReBaY+A
	vXECG89T0cG5XX7SM/dkAtfSWlqzhbzS+rTimamPTonfZiUuN231YlAyEY/3mASHFb2IOZiRkl1
	FGFAbKCET11tMFtI5x/zo3cW11Lx06wOTKtPipgUQgfSOIwyqsqqVx+EBieVziY69yvlL
X-Gm-Gg: AYBFou3LnnJeM8LOQfLREfEiIM8mOOAlplRPLLtZi+Y/znjfrgosPghkIlcPZsSsqRr
	5HJW1QntCqfDTbPGU8bBUkSc5wGah6FySieoyuiAICQmKdMItvE0ejjKTktTWd+uf13y5pBWePO
	0fhu2j7BJDmSxNywPwBUuvMDNCO8gOQqntQBA9WwvYygJ3NHNnfsNc6DzRsgMo3KK3gYfbPJjNP
	Ck5JheIsV3WYl49vyewQixCFycuMYTrApQzJd+ThFnz6+U1CIPYwcaVhZzbvyiDg488SRMe6+EU
	LzLGijdUg7K2CKoopugn/OyOHTAFYcPqCU/SRkGShKrWpoV+s1zwG1VLfOGR/T2DGuqhq+SiSRS
	1T6CcjN/aoI7163TTUOYYfUogZMW98GrOzYjamiKASyRthb7Gen52nU1+OKWP7OMOx39QvlEK
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067080eec.21.1794074819348;
        Sat, 07 Nov 2026 10:06:59 -0800 (PST)
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067032eec.21.1794074818692;
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 23:36:36 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks for
 Nord
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
Message-Id: <20261107-gcc_i2c_tsc_support-v1-1-433d02972d7e@oss.qualcomm.com>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX5WVo0Vx0OTqN
 q3e1suTz01EVEDGLq5gAmCKwY6wOQR098LJUEt7yOtztML7qGD/gjj3pj+QSDkZNjGdQ5zsCikA
 sabF3QvaXfJy3dx+KhN2cBJln5S3MSQ=
X-Proofpoint-GUID: xZFHHkZFh89b-zZ01-6qdzpJLI0pKRq8
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6aef68c4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: xZFHHkZFh89b-zZ01-6qdzpJLI0pKRq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX2y2qyOpbTQFk
 kA+joJmuJ0AQhQOwlny4PoCyoXGJmPnL/RkI0Q1lXdehgIu4TXVzmDEVCId2Wa1UvuILKQVwtbM
 85P5Kd9ZBSovtDYf1yyfUMPwhRFRgNj6PNxIZLyz8GZN6VuVNgJS83HwDDzyE5ScoDtZuxfJAGE
 3rNVBChzHdkcjRoHxIeLVvtKt6CgvoAGEqF5YYhwlNOF6JfflqmqypBGzx+L+Mvglibnx+Sn8Zx
 1T0+LSk8t7LldGTGSpA7P233ozOkfV+FOSIJtfaShGw+InNlgsJXYBGYqIoVe63wnLbkCAj0DSp
 qnjcdQw1RG54R230cia3Z03BfuWXhClfHlVkPgjEtfmfXr5zizTRU9TPd4AZXUG7OcPv9weQ+1x
 kSoM24viJYJNZjBma5YKF3CY724QXYG21Yl2uvSxDDimFKznFjOjErSt3H06mjVt/b2tT4Os35/
 IlVC8/OASsCDrV9YRgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..921b216103da703818fae4d4a572a6a5288e1513 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,15 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_CNOC_I2C_SLAVE_CLK_SRC				79
+#define SE_GCC_I2C_SLAVE_AHB_CLK				80
+#define SE_GCC_I2C_SLAVE_XO_CLK					81
+#define SE_GCC_I2C_SLAVE_XO_CLK_SRC				82
+#define SE_GCC_GPLL1						83
+#define SE_GCC_TSCSS_AHB_CLK					84
+#define SE_GCC_TSCSS_CLK_SRC					85
+#define SE_GCC_TSCSS_CNTR_CLK					86
+#define SE_GCC_TSCSS_ETU_CLK					87
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +105,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

