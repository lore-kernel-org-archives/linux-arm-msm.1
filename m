Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530576;
	b=QADXwK+X3IMY2RQkOajFTWRLx/V63ZRw+PP8Td24XjjtKWioFRl8vOhNyRYOgmzzyGv4
	 rtPb4NA7jMcq1ztRue22xH8bC3KET6LsnjyoXoG6waSr6cbwT+a+KoKQ489Gfs9Shs1GC
	 lxSOrMLvD0Cz2mw8TFjyDRpbsqb82aDg0pf4Ps1r9ZDjNQXEqVup1FJ1B16nV2u1NNg4u
	 BAiD9fHP23+45FRJkrhRlaPHFBlrqld0ogzpjNUPkatnypNA4w7t6ktHw6rICcMlwRzSh
	 6N74mL/hpyMXDRKKu6rR9kKN1HB0zTbc6Du3/5PYNboE1aB3nKr8doJMCy6sU6r4PZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn4kCR0DKeAKGuLMPmYmOKsl1crCQ221lcTAvGZ5tFc=;
	b=AeGXxVRXq79/gE6XI9rqxVcxoy8cWf53h0qLk3v5qk0dOsYoBzMa1sp1zgMd+3+iz+jN
	 0+J4aBbhpKLVGS9YX1bFEK8k9/Pqgl7fzD1y6gP3aCk7rLDUI6htvphBAh6ZbzgYnQLaf
	 /tA+J+WJR9WDlkVwGiLUcVAw6RK2CcWhkm+MtvfSjw5lJgG1JjyWfCojRfsac/c1nNu6S
	 0yEVtKXOjIcCCKNQt5IWHqtCkrx5EhrSaJRwMDR1h1ks+Piu2uq6yIgruC+GsQ7ks+Lwc
	 xYziSPseVG0fog4kyy2NRnxFiuDeKHklEGIFQMVYvsPLPlj0mEjIOwsO+Q7MIgfchUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaRcM8rC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxI8bpln;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D73606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaRcM8rC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxI8bpln
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuhTY1291462
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn4kCR0DKeAKGuLMPmYmOKsl1crCQ221lcTAvGZ5tFc=; b=UaRcM8rCA0ZKa+ik
	qD8rXUHs7uD7gpkUU9YGn1mZH+lHoJ6Ncr4lvwrVELIxNT27YedF8Su7qcxbdaZv
	y+MRXi/u+X8uJn/0pB9T/Cw9X/lQxeMdn4El75w4+Ms439gbkcTv43iwa+okfEmh
	+H7Hk8qB8C82351BhzRkoge8UpGadnCP2XXY8HyCAX8kIKau+MfPN1RczICR+Yrm
	ydgaK5YtZNCZj960F8+adjnfVDOqjeq9aTwA0GahrncVyG4oSBRF3Cu4Gp2b8CAh
	VDmQ6oUCCH+nLsIxwAcx6SdmjKzuckzJIN4++h7NpEdnsfIiOBav8PhnhB9KGnGI
	7sOrEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrc8q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949dc497896so280125485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530575; x=1796135375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4kCR0DKeAKGuLMPmYmOKsl1crCQ221lcTAvGZ5tFc=;
        b=MxI8bplnB/FTZo/r/UEDubwHEIu4RUXZKPEc1jAVTuc1wlpuUj2kMDcYUkyvxIup0R
         b/uFE7UEb7NkT91eC9UjADpMisX7wymxvMk6mivud8vVAhfK1IaPjCoeHKOQI64UegpM
         fVnbrUio7o+APywOf8UkOh/833ZraCJctxIuj/aUCRg04UvF5ypX/IeuayFKPYikr/ln
         zAHbC1SpdPNIA8KJBd2ks4gqyk4sHQ33d7ODiI1MssIUvxeNh7XUppbttBKJ67w+YEM4
         YC9LJt1d0YzQBiw7AaZ0F5j71kbteQKQafytzieTnqxqKcGWAmwsWA/uBHdmtB0n8kMn
         u5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530575; x=1796135375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn4kCR0DKeAKGuLMPmYmOKsl1crCQ221lcTAvGZ5tFc=;
        b=KJBRRtXvWGEDf/SVyk8iDv2jpKwJLZ5NKXnG6RgUVgOzgk9WqbTDdF/Mht18uPVm9u
         CB4nRerGHtLilT7JrThFZZH4pswune3muVhE243f/ugQdne9TbGpOi8aCbcl2QsfjMjJ
         bonYuTzqkeqkQdoNKVug1vIKVnr89Vglqpcd33R2XAJUu98rxvtWzzAehLGvBmyx03WF
         wgz5QCNBJaZREKcoCzOBZpAyTV9+LEVNGReQEVkjaRih2lYYRGn1zZWctWOPa3lB5Jh5
         i442d4dmrd7HW8WC84HImG2sYoPa1lglV0j7VszKoROhx/wtu2ybWtqBzNuvxknPR91m
         vKTw==
X-Gm-Message-State: APuU4Z+ZK8CEfdGAkDVqE/d+4HhcccBcfUV80uKZAAX825LBmuTKn5hF
	HJNgq9Uohp6/1nPvPk4hNVmo99I/6U73Uttn2i2PbOBxkzf7Brs54DCrP0bx2eeaUl8TvGAQwyo
	qhTDPqqO4HPI4FIZwhwJbO/1JZNBjZWmW6M3o4xltG7NPEvfcvLWvaeODIKBE1N/+jKaD
X-Gm-Gg: AZFdTZcWlRFJvCLQ1J6O9c36ERSwHozE37yvhoIXhk6GbG15hfLUPRUeA2hg8do+i3/
	GjqWWmJhYXoQHg3F1dPZlsj8awq7kiHAPVt/h1nrs06V1nJh3H8kPKerR35PnPoRI8boMDZWiaw
	Kj5TVIxXD27lTIN7ycfs5ZZ21qA9c9tdyT5sdARU0LIOvmA9GZmls7/AWFq3SkIj61bmtpuLUWw
	WPsRfgrmS5uTV82JUcf+kMBNgOA8GT6aFrGRK3ebdadnaXf87MpajPNbpPjyJiFwzwmbb8bxoNM
	MQd9HxiY9Gk0PvRUC3kJEfoQuYMA6WJ0ZgITSjPxluOuce9sGqlT2y0CH0bP3hQG/dspyj1Tgh4
	bp5o3U5W4XaLbUt7+/j+UIO2AfUVBJIKlsJhe/tII/Xbbn8/EDRrKBuIiMeRnQCgzWHB6x9Ro+M
	8+35HqQn9ZozuMjXpZFcoCBryN3m1a323u8UFO0vqzkNROwTSpVXeFlgoTOr6G03M=
X-Received: by 2002:a05:620a:880e:b0:947:a431:adf2 with SMTP id af79cd13be357-949ba8246bdmr2256118085a.1.1795530574830;
        Tue, 24 Nov 2026 06:29:34 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:947:a431:adf2 with SMTP id af79cd13be357-949ba8246bdmr2256111485a.1.1795530574113;
        Tue, 24 Nov 2026 06:29:34 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:21 +0100
Subject: [PATCH 04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KqDVttY8nzyyt0k3u33DrVrI9QgsxJrQpK+6Tgg/Bbo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CzsqY8HvA2QzPKzjRXwqoLQVIS7loydAnN
 w79xzP82BqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wwOaD/sEwe+eBaqg6rpiAImW5oppoi02cgP8/L2PdO3ivvxnVGuDeBKfacKU68R43iA/O2v9mU4
 C73vm4bglUhDBqHyZt1vftsPrcnXOhMc5VTItMP8d1qak0hyYyUHC9G4OpeE++rxIKq3SJjcNTG
 YpvESsZ08mn6h1LYo1CMQwV+xLNG0NxVgkQzj31DdOMgYxXUljeEe208FYa6VKVSrSc7wetoNLQ
 f10B/VLSa6WBsNo1bocXoyj4B5o9eExiKdF6wZ5bznYqfmvsbRRMUZhTlWOvrwPgVh4XTWhZz6L
 f5TBYc/OahB6oPNSB8ogfzrZXum5brQGoyIk+BsuPLXzdKuHw5rs1ZG7QxnzWUXgbNqWVf9EU2U
 6lGyySjl1LoDvsdVXMmk39H2bop9jQZJPwIk4P2poZ3D7fmPlQsKWoooxgpTv/Ko3eSidbsgMG5
 xSp18152FYeaoIRUcQXbTrJ9dd2lQM9qhcJA4grazVib+b2rvp0OjiYanaWdnAKnn+kVszNgfT3
 +5DIqJNaKqdYbD9EhAauDTj4O+UtZOCENTTashZCWKiwlt9b7zrHX9Sh3/xezv7RnXVgANGILmc
 Fv6i+GTKqSWzcmWhESISmyLkyWsZ0Y+a1EIskIES+ofnMemZ8WlsiD3YwS88XjY8AjeYKrriOdy
 l7+bltoRQTNLT2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX6TNu5G3gGveC
 Ed9iiOEQphtH3VjGFfSceQIgug3pNquj/PNX/cfDkqRtNlogtLTdHFw2LX/jGtvtPuJ9jXTPdbj
 dd0OuaIUk1WJII7r/CJ0AaFf/frgWnc=
X-Proofpoint-ORIG-GUID: o1Ug33KoeJyx8l48ZH6U3CjNLtZ0k5mC
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059f4f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3ytS6SlCGUze
 MGxY9OsbTx6K+adPkiXCaX/Jm95D67fCxBN8is83at0ppuZnJ/oUrGfHRn3nX+fQcm2R0pwRUqu
 o104RbjnjrvHRHHWpOjJzJ+oSucKhDiR03fUvntCbr2upEdyLKK0ciVmN+07knKHjItc52BTQaJ
 b+uw399tn3wWajsHIWV82FuCcnd0aLNs75jb0+1bhyvgKWHYYUvPmTsyYUFz8RGM498V8jR0iHN
 ftKKxhKldCb8pgWqyA65heRW2S0GLLMmRYYshtH9LJFZCTJKiddyMsijl5fiiht89C1nUdG1l0B
 oaPFBcHqRnCQDE9zw/0wb3W51hE3pFmLn3PtCif1X8a1Hr5775ekoiBikMb9kKrEjipiTLw+D4T
 Y+BN8XCgLjvWiec1yMf0ShaXQ+tlHHLBJS0pCUe9zOmodp8E2a18No0oF07UXU4AtkgmV+q06pb
 +1MWQqW/tICcd7EenQg==
X-Proofpoint-GUID: o1Ug33KoeJyx8l48ZH6U3CjNLtZ0k5mC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the eliza driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
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

