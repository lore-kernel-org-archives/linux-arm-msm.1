Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530578;
	b=xVnFYG7xM6PoGPF61SPKd4Sbo0VJSLHjRn5ZPlwyXi0ww+A/swHJxLUHVARtudMZLiXE
	 XJUJuAar3YkccqbaoWBU5kr7dQAxteeJbmGrfrPkpd6Oq1GWrzHz675KjmKXLJ36gTg2L
	 m4qaxU00d65/l3JsSHI+k6qQpQSiiHVstT/ei1SJdBBYN4JEokI+WkiPbStcGL9MwfaxS
	 N6XUDi0PuGuKkZLjFZLGSXjWZF9O7auNVJSW8PNb+c1UV4ySsW72JyWkZX3Z9wQfyay23
	 ismPbsN7OLOH8Wo3rZpkeMi10vWajaojGR/a1pJr1urIg8Xo4EZYRfi32ibP4PiP9Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
	b=3MCoSZszHnZv4wCt2tKbB4bzr3p28iBRPi3TwQwNNWH+MBz6epORJVZc8f278ZRxP2DX
	 tUzvKfp5G0PPDHad8CjR+nxgIFDiZYbesqeoFLpImQfdRTT2H+QqaM9IEbVafmWlZO9fp
	 oJJCejJx9E+fU2tcZ2FApy136PiOwkhT8ZUEGmhXaLe2qgnZcfUTH6UbrtM3AMwPBK4Fc
	 Znb/YG2odSecMMJsShCjG5tZn5qmM4mVBH2EpNc1l0wqQrr90L0Z9MUxqpPrDldPU4q/y
	 XV0/zZMM1gmJxQddcE6FOZepunxTmtyGzaoTm6yrNWU2+XKs4nlpdMEdFSk4y+R8TpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kMOtVNIs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N64l7bsV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C56606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C56606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kMOtVNIs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N64l7bsV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuSJ7120203
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=; b=kMOtVNIshWOq23G6
	nnwI5Hp8X+KinfBgLWYCif424xxO8QoC7Bg6VVb+wf2rWSFjL8/AnFsBYpEVweC6
	f2jeY0HLqWKkXZjeuDK9VznSbzIbSPSZn9Ks+zsSJ6zl/8g0SqZ5RR1XhxWvmtwO
	CYDKcih3e6/vsBUsDylR3hZHBUnR9drfLf7CbivhiQvVVw4dgydSfrzs87fxA5lr
	mdXVpSHSt5Ju2b/UBLd68bC7LmCeq+4ipHHfRgI5iu5dtG1X++zLKnivSaEZvBu6
	gNajik1lri64y+23HPAhZ5/M/4ygeUoHSJCJQKhmpawQ87H2swFiB/vAQERsftCi
	cUHhMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f3kha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so721603985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530577; x=1796135377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
        b=N64l7bsVqUh8VRALY1fe9gSE53BDLj5wqdiB0A+BiNh1d+qXPPkefb9zaqZmX+AGKs
         oR9B98ZYGj1BDpU/b+gHIQZm6k3Qak0KK+zJ/65HbABjGGFx60r2qGlbpJkoAtrXrVTn
         UGMvQnV0nm67ttwBhhVzHCPzP1vdpVICkc6+wZg2wKhi5melFAIXDTDFzIbgFaymvUxi
         KIh7PzY9++Fo7qrnlV7fysv51S+1/qO4WhM30Z7AfrQBbBXd5wqORQ9kAQgNYRImkses
         wbN45f5Io6KoDomj01YPgKUrYMYyb2FAMEiawv3vt7EhmBuazB88WFODmgSKdlzU9XVo
         JOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530577; x=1796135377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
        b=N9QriLMngUQ+u7Y4O4Ti1VVzTkBaAcvq2MdKV3uBJ1MzNwntQXgnV2QPjk/Z2rYI8L
         9w+HvAyLiNIfLC3Jgf4T/uVLaw7BMSpqJYQmBv49H2HCAVcARNPZWQOAguO8FXEs19mU
         j1hbRQuhsV4BwpzXZ34mrBbR2ANxIqIZ/D6EbH6oKtvqhEk5rztmOnn5R6b40Xy3BSIV
         yNa9x+ZcWETZLdyIfqlwpDbj+feUoreuLwbaVzxAXaY6aOxBLLlEoJUP1kfit7paqDfG
         p6inMuFdtQmLz2Cty3wuxvmu7L3gzMzxtedw94lnpTys+djT9A0qihRP3pYAk6qvudD1
         dRyQ==
X-Gm-Message-State: APuU4Z9dEBkrVaLMWqYChyNt6F2YJ/K+mKpfMJRV/74xNrmcn+I/Pbrm
	a1CH6xdij6sf3m0Agmgjg8sfCCi9e4ayG5bH30KVCHB0hmI0lx1okfmug89hnzJRtYObuWV0Q8h
	9Ehs/lryP0IP0bZfsLJlaYLI8cQxRDMTjZHT3lM1pyOUmGbABd6rjvyf2yWS+gZ5IPL6K
X-Gm-Gg: AZFdTZe/6YlPexm+vCAxJjdtln4aNkFvHjLKOYwGb8PqZUxvMvsXzpF/uN6GvdKxV6l
	ngUpzW2HDXrQRb9suYCaomB6lQ/CRs+BIuZmGPznEpTdy0MnlvDFEp0tsGgeDZXOw9ro+Wk/2Al
	3INJb4DWCyTuDfsuwkMONiQ1ChGmBOOTe2GSLEicLlL+zShyELkoE8qJLNkifUO2qUlAXQvYmaM
	1LXYoGVP1gw+5BsQX9o/unR8iIZKx/OAUuSBOFBgcaArbKiU+sc/du5W291K9bHKtK8L9DR1DvI
	4F0gfy/hKqwiJ4sknAREleOe/HmlVjEYTwWeQfUqU1H+4uMbNFYP8Sv8z2aUDsOVVW9n6L9bfNG
	rvQZ3sC6FfUP/0Yg0Us3RoRBFH5Q7J/iiiCh/INOt//lCsZshM3vtpaoGdQdVdVZXWU13y/FxoZ
	ot4DwebHm6DNlNBOuBgGNvOBKJEnZacPiJAKdTzVZ05+5O/d0yOFHO+ZhFrUwBAQ4=
X-Received: by 2002:a05:620a:a0c8:20b0:94a:a2:9920 with SMTP id af79cd13be357-94a00a2b753mr56325085a.75.1795530576677;
        Tue, 24 Nov 2026 06:29:36 -0800 (PST)
X-Received: by 2002:a05:620a:a0c8:20b0:94a:a2:9920 with SMTP id af79cd13be357-94a00a2b753mr56321485a.75.1795530576178;
        Tue, 24 Nov 2026 06:29:36 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:22 +0100
Subject: [PATCH 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sOe/uKklnGp8mVDGaaB2xvvWbRkpxBtJk/Ns6ZUM4Bs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CVyICZwkNyPi/6+WKjYCC967i1fMr+gVQt
 jrpP8Z5fHuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wwu0D/4wZ1FhhV0DoNOaoB+tMtI6aqaDQ0hQzENh/VieXwKr72Wwpq2i7rpF4U7UrnMg+4lPlgY
 e4K92qckwLmN3/Z/hhuRItZC/HCmUH+T8cegtzIZHkUqqf7bEhXi2WjblK87KrGa7Uiz//JPxZm
 g/bGBeqdY+0FpKKAyQj15dqhNt/Z20YQY6IcA6Aake9JeP16v3MbotcsEvGkLQAUUnFMQW3tYhN
 Lq/DsDNSx6+UzrXLAjYEJEk+aDe8sdwPyYETvD3aquUqAK8gQN+T7gqHwRXJGx443KieNP6Lvnb
 Ye6Jwrfq4fWSN5DqPJz94MitktVL2oRuixrT0MOk4ntsSB/5xmDkFxeo+zwJv0cIkxdxIbXdIZT
 jC4deyC32w9y5UjNGuQARDL9FyGGESbxKMIGuDEVCUsx7axZq5eDZbH3UHgCzLAf7N31nDbRf8X
 d0qeqlcpodpRjT0oWkKkFq4xEuzG6cWdskmSXY5eTFTLC7lJaTvkmyBSXP5g8I901VflduizT+f
 qtKnHKh2zxyMlxTsZEomhbVwcSiI4CZv/E4YpVUfl/P64KkAIyQ4mtEeKiyt3PsxBRsO4TVePRr
 DKtsVvY1Y/drG4eeoXCasUSkmJ8xQNii1waIM6o9qIQ7BHYmWNRYyhafMwTfYPpxRCble7cWWN4
 bUUBDBtfFpuPuVA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3F7qlst1hkJp
 E+KXAP3N4+h80Xf8JlZ1Bp/OUQByC/jkQJkL4Tg5tdOJJ5uCqu+yJ/sjGd28aN47pMGS1w9iMOz
 d32CzGGe0t7YmVfNTZUEH0Cuy0a1zEw=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b059f51 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=U65A1e1nmbD1eduP8fUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MExWhkN1gsMX6V-YJP2CoXBSSwSS2r_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX+ommFbQQC+xJ
 AOE6oe/DtmklGifqhcGKwKCm1swrhgFBs+q7y1W6gTL+lJQ8Za92+PAAYgyeIiBEsjVjEcXEfSw
 +75Wylue/puMXXTy0Vx/DE3Nrs4uz+4xx5nWhf+SZq3jofxVy1mlRFCWt/O7zHprVagnyHMtFZB
 YWtdCR16IONTmINWSvlKXT0QyCTIrWUlCt8KdEW5n/UzSh66Y+vH3IKccV6aiI2lunVZgt5A58t
 f3o86Tg6uP9pzeq6gghXg6DsHvOGfmSnjUrTnm2g+d9i4fgjlswxnswHH8VRDFFkpcuqA1qBShD
 EA1FNbWYDhdZ9lV/bSL8SaS9moJuKChTtl/ibZ979TYo6blySL08C5edxnRZdDSBPCGnMT9rEb+
 rzW00DWqeswzetSJCEEnBZanJqkocpSRhH2iue/WQboGhz8XHbW+ZzJ/w0nuv+2sM9CahvnZqr4
 TKkaRGOAPiBMjZl0cSw==
X-Proofpoint-ORIG-GUID: MExWhkN1gsMX6V-YJP2CoXBSSwSS2r_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the hawi driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index 3486a6d63d10e71b0ad78f10b0a88bf6f47db738..6856ace6db1b2253da1bd168a0919e72bb131c5b 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -1211,7 +1211,7 @@ static const struct pinfunction hawi_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host_rst),

-- 
2.47.3

