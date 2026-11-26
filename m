Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688487;
	b=1YFkA5wEz8my5ovoFoImBxGNC97ifr6lzXNs99CsrYn5qetps4IGgL2SPJva4Qr4BC2X
	 sDOkWq4CeJStG/SxxhSTI91lRBaThY7cZlD5JtcjD+8L3CG33OCqs6DMMQu7hRlFWFHdc
	 XvS0LnX9NGHRaInvNSSL1UQ7ypTzUtJwhBfg5zYT433M4kEPWASYjZbCxc4Nmh4Ngnoyo
	 Kz10lUS1LitghFw46IXSiRe/g63KTci5/9zp7543+5BqAUwerUGMOiNWEGLvFBgDImTDW
	 ElVQoyWQ+QQ9SQet0QRX9VmLSqJ+RSaiRRDfF9x+ZntdzoHliqwtDpnN3wQx89I+whw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
	b=R3jiK1VNKEBWJ8l1HfbanxsZcd2Oh9ct6irj6Yt3c3nba/cNImp5lmwlJe1sznH/u6Ym
	 7NKJdS18U6lx0LWNlLNHn9tftKRVsMdLyoVBR6Vv+vpsQgmStwxgn+khUzyo7DJlX8Qhi
	 I2M49LhmlDvJ/Y+/fN+lKvunSkHu60mpS/CyJnlnTgEqlQGAVVSvPOFMQwy0Md8YUa1dJ
	 LVvc1pj07g46WmGNQR4MQACFZ5gp/8X8i2kxSfwipAC0Hcm+VjP3ioDpE/d/Hzy9HKYkQ
	 H48eoekGef3vyQOGjXeZrS9YfJ+yjLFUe1gjKm/vCBAvZj2gEvQxod/mdiH7n8xqnTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQNAa3KV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iukfzc2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D37B606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D37B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQNAa3KV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iukfzc2x
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B27V1682403
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=; b=YQNAa3KVzrUGRphy
	yHAh/HSryBqZZt4Naj0EX0LISornqJaCvbya2KYWOO6CkHdZGdSkgaQHb+VqVdy2
	DHM77nt/uurT9cw+a3FTeqxC2LPT0w4CEBMVkDkvFR6pgGDI4CImRayaxnMCzcf0
	SjvaZs2j+Mx//+ukhQfMpJPhIFL6N7C3N+Ff17JIrFuDkdb3OopW/Lgnf4EinRYM
	ht9BDhDSJh8ALWiMwXAmw9N5isueDffVq3EDGEW5jBDTD3GWNmiCdXM4GJPQ0xgs
	lFubo36SZTaPZJYw58B8C/7gOsM9NGkYdutHpJC8nfHihqlgdvwYbAMt/lFvNFhD
	kDgWVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeknx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1251246185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688486; x=1796293286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
        b=Iukfzc2xMswq8CWtY/PARIDkGUncaVsw8lCWr5buylh+4NjoOGvmYsdvEM6EFf9Klr
         5MyHbUZHAh/ZsZhWOJLGB+hcR/bM+X5UH+jT17LtqKLTnXX6gNTkJ3OcJ4saSDUXFb/N
         rLYR9mlaJ90Yxy60F8jxVfCHHJha0t+Cg6dWq64w79StB+7Lrcz3uFbOZJay/5DX41N4
         u5FrNIPUfiZLHT3PJYd0mdCQKRFMnoMknk8swVL8oc/nELU9V4zkTrgdxlaHuezJNnQQ
         T9Mx1d3JTx3Wrn7fdK5hLVDz6QPe/BCZPVvUyBjp5rGB75R+cmn6g7qZhmJnsRPvWCB2
         uRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688486; x=1796293286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSMmE/tgHywg+Ku8MuFxxbFDolusK8It1lOLAQ9JkzQ=;
        b=CztmQ6l2VuoF5r2wxREDvaFcKb0VVNygHqpv1/5lgHOLNSndcZfxT7YajRGNkKEno/
         wPGilpzhD5+hVH6/Kgaaru2W3glFAwKSXyt5U4ujbXGFHOiMtGcnCst8HrNn7LlCzqQp
         0QKf1m4O5msM68N5EmSCMIBcg938urD2vDfJKiUXC2mWjl6GqKnFxBYJafSJ5ekZYCT8
         rJ7eJyZClhk/UaoemhTFpU2iTGIrFTi4ei38L+rUV8Fe0yQGYxVhx7A3KbyGm9g1N7Z0
         tznwEmmQQqs9sSooauZqc1gkdjlRdQ7hJcYfsbciorgSNW2PLo3LO/Wy4XdQzt79jrAQ
         5G8w==
X-Gm-Message-State: APuU4Z/hsP1V3AQBhCsjmI2YGE3wl585O4jKw3lcUUXJyhLBbUCfeHVB
	OqFwe12ggl/wYAOPgvRi0v7e9IzNnDITPv4//o4AVKvweVyIyMFeBRX+ny9VaTg7YVAcMrYP6My
	TBmB+FBOWGUQFHFY5IJ9ftUHByb/oviM9jozCABqZakwUK2XPjeR3A8Wd36DZQEhB+Qz2
X-Gm-Gg: AZFdTZciiVtZHyjTKnuW2Zdab96fwK2RGWJEFa0KIv9ZTtCdJsB8/HMgLoIl1UKW3vI
	GatYKp8qoDB8XCKKB4KCMwpZhHDnZ/wq0Pl2tH/2MKMn8jKw0XPqzFPx/1EuE1dDyUgkRdsqgB/
	8f67+SfJe0GyWfI99stNmlRtNVkPQKI/8aPKd1cMsewQyPwqPxXNghIg/nBm7pEl+T6/9wUGuLW
	8PMME/9xBOnJqTd3Lcp5yKYKw0Nu0PAXw6fgOp4H1sx6HHBL4fga2GyoWnzvJNBv79rWSzCkakp
	PbsCbtfxy3hGQWqgKcIoueOiRQo1RqYSDSdHaodAPRlkiuDhLT7JLs2t88l4dPH7IOiTS8GOfHp
	EHUfLJ75KoG5yURfjwvYisjyU5h6msbS8Tz2D0dWzVY/JQyOleafg3aw9BwhUny5iYHzZ85BDDg
	zU+5yDDJxWnGDdpPaFHeHzHnjWfpXKzlqajw+88pMmdXPU7uN2NbyK+7Rp3QoW0jg=
X-Received: by 2002:a05:620a:2949:b0:949:6e15:e1d4 with SMTP id af79cd13be357-949ba9fbe56mr3585125185a.56.1795688485726;
        Thu, 26 Nov 2026 02:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:6e15:e1d4 with SMTP id af79cd13be357-949ba9fbe56mr3585122385a.56.1795688485284;
        Thu, 26 Nov 2026 02:21:25 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:10 +0100
Subject: [PATCH v2 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO
 pin function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-6-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NxZjSICPl9X/NbtdwNSDoCfWXakeOJNPiqBVm6AQlSE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgT/O1M9gwwpG4og3v18LGeCALWLbDFzqiO+
 dLC78I/wuWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w6S0EACwJ6oFlDzdg2+Ukbx/H0iFJtaVtQuHK6TERMpOzXCHo68afBjKEY5CHTi5F8Yh0mz1qyr
 6/MI/KklQBfeIIEY15+bZOge0Dp0kGeCX79ayWBqPeaoIC0qk4JkuZK2Mz0+dMK03BKnVqeSN+6
 Dok+11wF7f4QiVmehB7jpzRpKgyq7/7bOtwWKW9r690odx8wycEZcoUALAgJNaxSMlac1GkhZwG
 K96Fm1kLDvjmsH7205dLU3gLRpK5q5JjpJp0fZm79UiU4jug6cLCI7b2G29muSpx5UWnScZ5olj
 pccieYYC3rkEglNWyEepqYUaZZUkRNIhzvv1GhlaqBiWO7JNj7vT/62Rbb56cE4vOrfsPojFNa9
 9Ke2mMA2Fkkmv0tvWZ4HG6I3/tvH78sm9f8adha9PZyJSvabr59Akfpu6pozUtElm3tOQlyZ/7a
 5oxOOPmDF833LQOruRGMp662FFqMwG2v0g59Je4StwU+njWtCqAqKlhZJEs1ejwbEuCyyHvDcxO
 S42rQ32iAOGvAG5n/9Mr41K8lOOQa8xCA+wNeLUr6P6KS3ZG76ciZIlJSyvToUcaGpEdMG+6o1f
 7MNTzBdPKFYm+6+VVDsbZndePSzBdUzJStQ8uPV4ntuF0GjFec702PtpqXgMzPtcpJbiQcAqSfH
 WHtg9ZQDo/UMDZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX4YUZbxudlvjy
 RQSOASyZWZagHluEc8pbV8oCBncU1si+kzLGQ2ubr3npDzhz9XVnLVDUQP5lD/ttQOS3eZsEz38
 RrSFTRb5/eKU8ERMRWEip8MUY2uMwzx7mWkXG/hT06xCZBXKLPUneMpSCEs47X0jqIDD2ZlPXC3
 Og2temlC0mjAHjpOVVAVQRv/ixsy7Xvux6QPs8/+Ns1NfW0bMzSgxK0EkkEHttMr+Qoevqg7zzM
 EdQ/zVsHupwhBsina7rnivA3dy8m5F5S9LfhLWC6V4Ro6Tlhgxb4gmpel3vWB752YW7X2T9yBTR
 xcFttP8Pu8k1hH7jBZscIuJGYemc+DsVGD91RYEeBZEaSN9VQsZAVHjC58HhhR+SCAbHjYMFNAJ
 vwCkXk3keU9sXbVsYvWb1CvT3QRkJv4Jp2qxbI50u057sdDODjPnMxlYUipfe/fERBrl5j4mJR6
 Aqu1rf+8dJzVLazo4Rw==
X-Proofpoint-GUID: Q5jO7PUS-AMlgTKR4nyeY_z-krQgRN-i
X-Proofpoint-ORIG-GUID: Q5jO7PUS-AMlgTKR4nyeY_z-krQgRN-i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX4D99pBPjHFkd
 y6i0s1jzRWEjKdiD4EsrN4K0pRSNyXOUIVJ0MLxZmtdBSCiiJgF4bgeX0fFnVTdo4zn0IzCdu94
 WLmCS4Vp8bM3EoIQsEXz9ZdJ513FN9Q=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080826 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eqPcoR3FCcofXUvmvEIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the kaanapali driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index 2c27eb2255c30777310e6280f6767b426b12fc79..04e47b475ee60fd4990b2b54774f566360ce643d 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1379,7 +1379,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

