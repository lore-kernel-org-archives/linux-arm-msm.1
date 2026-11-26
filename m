Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688483;
	b=FJwg2IB4iI3tMmPJkcQvB75ixrTzGYa/IDn5aP7fQQkPe9w0t7UPlI0Y2FxwkF09ygC3
	 q8vFsp/bue7UrU6F6kLXPgBzfxw7kw3/bxXDYozO+SGfsfgMU+F07TeyV5jBs8fLSvG9O
	 x65uNCmyv4NUcBSnFeuECFjs5rtiUe0d7cQuaGUW8DfWmQCWshus3HvofD5a/XVZfs1pB
	 b53A2GOYgExeVmCGHxk8RDHSvtPTXJoBxzTd2OapZ+Jpwa9NyFXj+jA/1+FQYRqLompR3
	 L0gm/xwjHFnpIeO+ccDxFBlL7SEBj7qYtuGZC6ePdSwrTAycikPjwUC71Vvsqz9gPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=;
	b=IyHo6ZrC08m8ycDYAY+QjN3gduMwz9o4ik0OyAuirVbjZq0BziidWf4qcPbfxV93FCUp
	 nlN5HGkvHl2bgZiyDHDzf3tbbNg2kcSCixnr32R8ZQ5osKlBsYNC7dDtYqfzaNmXhi36b
	 Sz8WC0yjgDgzw5GngewZjN5odYteF8FYB6j7GEbgodL61e9W8HBZ6IjJtSlIfpwO/7fFa
	 MVnY9Gizs/b1p1ibsgqTfpitXGZq+n3ZoFdF2UZh0XGBd8ZlB0+cL1CuNU7uplqGuj5pa
	 5OMobnTOiuOe8vVXulnT18hD5jPIPVdvlvvTEIc0iLaQOHcY+qv+MhxF0wmY6pmKE0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KOG2qRvn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzEf+Wvh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76524606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76524606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KOG2qRvn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzEf+Wvh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4WT2175787
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=; b=KOG2qRvnNuZ7nKqk
	53VsSii/wPSbblR1nDMnInkFzJEk1kYer+AxEfb3VfZU+ZrLrQoc6W1HgkzcrKhM
	m1SECI9yxO2B3X5lDfpsyuTBG+570BV9XoyTyxkvsZw4o8BxXc42ktXCxssei7re
	2EeVnu2tvLBBq2I3oLoEA85joCGvn5Dw7SXQm/vb/mUmDUG93PV4HfV2le8qRdTt
	UjK2JGfBBmqoREdORv3Elq9aZh5V7jslL7jFRyjSfjTTgyU9XsGCO09pYQJT3m7i
	HQo4BznGouiloEIVbCOaNgFMSzGPyvlDIynQ1suquwnkIoeecMzXGzZp+DJvdjWe
	5KIuYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuyv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso759336685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688482; x=1796293282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=;
        b=GzEf+Wvhm6GhuIXdkVy+P3uFLLVtXVvYEzmNhD66pfvKBplaOMNxUOWxH2Mv933Cap
         2F4OpRmq9QCVkhthPrfdoAFfl4F9v7nOmpydHadg1q+x5JZ94zWnu0lasJybBlxqDH9m
         hzeAMJFy9jrvrWTpy+o1GNUNrMm3EABlxag2xJszOuzlVx+qI/NB1oH4ywqaSfcC6VhJ
         8qLMDWYKCPASSUZYZHOE21jhpkTGAiFsuwf4kVLgwFk7CF5fseBhXpxnejpa+1JiwzCt
         WtjrdoTjzgiZ4oWilQjq7cGIkuSK8SL7GcE+uOezotAIR0WVjNvQaR10NU7685Dx61BK
         sOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688482; x=1796293282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kk6Dvk9uLFBzq3m8NlqZhzmZsJJP02j16A42P149LX4=;
        b=CYs8oIWjB1YXfcmOTRWsuW9DP5cKTt90BgSwWE1c4mITCU/GXScNGuqHEjIGK79yYS
         8RDRWzrxlH/iKeq0E+Q2numZClA4s9ABiCXXiul7KIOmkRkF4QnkCmuJ3RhPJOOkNE4y
         VB0Fuu4ieMTbU+W3tKqo1Ye5DoAt39y7UX73ZCrAP4jB/OOMWlph0JEPKMDoAJ9f6Aqn
         TbsEsysOb5UBMuhCjcBOghbNPhV1xb1jlCjiKLi/jemBJYQXmar8zv0rPYbvIkgvXldc
         m2kNqcOXQMs6gQ+mCqc0wM7Fzz2dsBZggUmTBg64Ehg4f5jSF93tf5cvbW0IKFeqX2+h
         dFpw==
X-Gm-Message-State: APuU4Z9T1zT6ZyxR9An9vxqZBuliEXpbISBlT88sGByq+OadqvzvIddA
	NUwToOeEsI/H7jAdMVEs4UJSqJ0MDuho8A8KL/lSmw5fpS+xMJIQb0Tc2D/mM0HebmS0OnF8jQW
	zNIeJ2SP+DLm3nWA+rXQs9ZDsl+R9lQLJPO9Wr6qGFyz23KZUDkm72Z5ItcAG6Aqh1WfmuE2SHu
	oQ
X-Gm-Gg: AZFdTZdRzTmT2u/dYW2ItMFGmA2k2+y7OokU7J1VzVqaqkG81RE+igehhiYu6MlwjDW
	e4QuJFNRoe8d7AWGIe2RSDvmUNuN/rBdDUVqyPcYQx2hmkh3Q8psUCVYEXsjHxc7rvTuNU8OPdl
	50lB39iKCsysB+Jpv5B1ASJOdPFf1veV2Lwsmnu1toP4u+VFdXT81ND3ayVH7NvZbF+e+tKGY+j
	7JW3/37CojJK0Nc7vVEjiUYG5n4vWO3ffKocZg9OK5UOGCQzGC1GIwGC6ZflaQ6s1Q5eKDgJDOU
	5kujfpLn5bsw6PoWbRSI4Cdfh7itdb9L4asulxsYuaCQxhWVuC7wt9XZ9qGloq+OlpXEEfC7tJe
	PheTi6L5IpP5gYhFJzahvMImoCPrfMg9McbMEuY0MAYxgF0SyCf9gKCeA4AtJmV35ZGDL3/BXcH
	r/sv2yiigazlyM/8M7zCIUcHkEZWXlj+JAFSDYQUciUAcYRd7VXhz04Sg0v6XM0Yo=
X-Received: by 2002:a05:620a:258b:b0:93f:633b:ee13 with SMTP id af79cd13be357-949ba965a39mr3603799685a.28.1795688481643;
        Thu, 26 Nov 2026 02:21:21 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93f:633b:ee13 with SMTP id af79cd13be357-949ba965a39mr3603795585a.28.1795688481196;
        Thu, 26 Nov 2026 02:21:21 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:08 +0100
Subject: [PATCH v2 04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-4-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1vLjlyqfqbwX9v432amEbSWIntuaOGNi85SrnQeiuyY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTJndVMiweTa63kSLTfWiSLHI9ya+Grx0K+
 8FEufJbH1aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w+dbD/9XFRxY5QizMZmrvZ1uJedK/YVP2nea7Vrxje8QfnAviPb1SfGLyvQAbjPXFDL7DNTvFvH
 kduNHNYwAz0JsJo3RYOe4k3mXKwtUfZjD/tAP34klgizdbqfmz5hi3JCr4gxa236wzXkzFrZn1T
 YpelyNBanT00EMAoULeWvhf+eln2DgR0BCY7I4Kg9bN0RfoR+J35lR+b42bReTvKsbdAZI9Nmv4
 ko3+3yRxOQAyrRYI6q4Sl95cQFqL6XiE35ztL+rKtqmjtRddCcYBT1fYoMADmeFasQZiAH27XLC
 HPYLR5Vzs9zv+a5Z50rA0jOEYujnPxRDtlUQUAcfkIoVp5iBarjR9yg9YXECkAXhNv3UjyNE4jC
 e8vOhqoNKRsgJxWR+KxNHdQ5jwr8VqjDViDmMbMh5kaSRkZ4A/nU7IAI1TR7i/T7v8sC890Yixa
 d77emTj9ayN7TPfmyry0rzLNr9EZVmQrIUVmkVM+M2OTezS6wkhHnT1Ep7tstnend3wI5reY4FR
 ujGwwMRK0XHpPCFMIWbc46ECZTUjr8rEYcErOH3hzOozFPDN+DLcwmLxNbbQ1p4A1eojqgtOMaL
 HUNDvECLMdgI35t8Db5vfvv81atXnRBhu2NTyPsUP6EonOONW7NZqto5bD7v1du9+Fr8k1mZObh
 HyQBe0VS5ZTPuxg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6Dz34HHTJGGKM3YRvtC3dHA3LqNrzwfm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwKYYOK8rr15n
 qf0rLfw6LaRcAwEhw170jDi0EAydX9n+z5oiM86WEOuTZluvivyihX0rkYPOFY+mC5waQCC2wUr
 zhurci6F2l8VUpc3Rd6Q1KCliD3ut98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXxjDbY+lF9DrV
 GXuwRWsmTwrOum8N2yAz0ybs/eqBkA0lXRaLp01T/aRykTbI8cG0Pdnk8n9OOo6Zq1q4yxi0eUP
 ZbXPJHmxIV9wwRqKSjDpBZPmyL9on2iJPlFALrtScnNEPn0IvJQeBy/bM3W12KwKyramxv7yFU0
 5LJWNI/1b/AZuzFLpVM5peZZRo+T5HqmjsuwSUJRyUtAzOfpWP8Az7hnBhtWLveg+TE/8PXZFZi
 YOscwDlO+XAUOK0TGqUObojJ6h3MALD4ESgjfuiqvQBA/66sEW1tgs/U/ib5cYHOVhBB2/S16Cx
 PtvN7gGoTUUoYN2/Rgt39f+zBC1ep/BqJq5Aqp9LdceC2XXeRoupNbmTCCPJz6qhDkFGEVQaUbO
 Yxw1BtISj3Mhd2bPjzkocqanKUH+/ojPKCEFEFO477EfvHbc51eG7k9k0UPTg4EcExFulZ3g3Qz
 YXXtKdiYykgkpYXuo2g==
X-Proofpoint-ORIG-GUID: 6Dz34HHTJGGKM3YRvtC3dHA3LqNrzwfm
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080822 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the eliza driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 58545e14710e2730b2b8b97d8b7e85ec2b04ad6b..8e1f67864872996786613de5d42d5b6ef308b2e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -1239,7 +1239,7 @@ static const struct pinfunction eliza_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi0),
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(dp0_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

