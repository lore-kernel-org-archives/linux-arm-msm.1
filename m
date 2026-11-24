Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530573;
	b=OqIQAD7Hd/P0RYo2wF6vcCCtPHQVczMAclK8uW+i3cmWyx7ikpCBSrvLUuipVbbnIDDo
	 OeN+mQ0InNC1kXdgYMVSUJOXyTC0gh1cpcqkgJHtvmj9FZoWWDvMIl8IoF/8X+UVQ3kJS
	 ihylOF6A+N5smRTCb1tYAR8Us4QZQf6c31UYeC0JCPppPEMeOt9maBCvCnIYeWDyEh0KF
	 90Ukw3Xbnt0p3XYWw1NII2wj8Q3Q4jWYVwtIDDoiqWs5gGUALtxessMRuZrkzcEHcnXZn
	 NjnJXNBoEMy6mh99Peo0LuRAlQlKYc96khbhRS73globSGAwF7chkhedvtzrPyraTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
	b=xf6CRS3V8OoG0/skHTYv3ULHlx4wiX4QLuI7TNwukbVkJzRG57InaQZWOFPRPCJ5LmYr
	 U+33qUqqSxcB9L+ZkIaMkiTWJvNbf9RHtxUjKx2sd6bcfltDiqbZje9MM7v/mZQiLwkgc
	 eodtHh1Apjrk1kxwJG3Rbu/cSiXS/5gBtPfSgzciIglAbfWbkQh9Bi67e/NTYbl3/0qdh
	 8EKW6iKDthVJbXpdl2nX8lF2eP94rbmMLXyPKUST7SH75JiGdvTIFumAG44fqesjdEx0f
	 j4oKkSSjQOpfy2VCCZFl8aMrWB2JmWwuRC4t9w8BGdsSSCVKgz1f5yMihiocJCwg/ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVpTECvS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad94un+8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D2606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5D2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVpTECvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad94un+8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAv4Cn750559
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=; b=kVpTECvSs64/Obqs
	L8KudiNXFPfu3gqyBk/48nCFs72AyHc5J1CbbM52oDrCm13knIlWYXHAaQdqIVue
	VqEV2MO08ksFLXPUYmuJK38Loa21lCtc51Hv66kSuPX1uHjuxirJxVixsgKY3VK2
	yBfGpNB31L3kXfDi0mUX+dhhCUdyTyFgj9D2Dt1UK2Ugf5xduae/F/dhyEJCm647
	5YhfOm4JRgBBpF1zu6hbZD5vIkPxSxp3uEB/LQrgb1RB+oP4ARbk89kgYpw7OAv0
	wtM9Ov1usT7GnDSadnntRVb8mucyAjvJ5XMaVH0fb2YNH83d0VgefOhEVcLYmCs7
	UXR4cA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb392e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:31 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4dca1ef03so56308117b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530571; x=1796135371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
        b=ad94un+8YbLkfizTAHTEyeK6PVhxe+xL0vA+J55TDjNPemRXae8m2UyQ59JGhzvD88
         8OvWrxFQBR6GMAkPvABdmvZuCi2yHzZqBhQBMPDCs5kE8ulllxs6VQuzKkQne8xsjt6Q
         vS92qfHqfz+JDrTPx8xvwhX176LmsoN8nPbTypwLaq2GIdGXnroo91lh+TcgahStsMNZ
         RHLA8GDdCpZu9fNBW5/7ZrCYenvvN+4fGNaUF/52ZC82LFZwU/g4enlcW7xDX4/oiGhI
         5PUjtqBWNzk9earnAJSBqI24Gocvu7DVUWTdk0cVP2IetNhu0XaUpNF+r5u2XCNdKExZ
         lu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530571; x=1796135371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgOw4S/YKKSkgXu8zGtaSLb8x75hEgzqlSeRCTv02xo=;
        b=QJL9k0Vg5PbzLjuNvpE2+h+A5pGx2jUmjrcuDauTSTCzI+/9zyU1wY3ypUaiYecOOM
         Qq28kENV2+G7JjY70TkP4fiuVkOgwyCn/xmpfbLOHe8cVxhKHW6ThrRUHExSogMvrAMz
         bt5kv56zIZ2bEv0T4IPRTY6YIbhQ7+WE1IXg279t+abD0aRtNcwfUMje4roKY3tp+P54
         931cT4BvSvBmAbaoHcVNgu9u9FTNqqiDqLHF4ohXy25QrfzOHT7y/7yPrfg/2d+PYPkj
         jHlLo3LGoL5hLJlioZ24B12DsmKhD6ppB3GfWDMhIb+3KgedxEPg1LqW6uTBzdBpgEZd
         faAA==
X-Gm-Message-State: APuU4Z+NAbayCW4UVI4jvTQqkXnxvF0e6BuUaWSYOwl/HQOCTotjPQRz
	uf0oKle/b58Cy78gdTTGU/aX6NNZJ0yYiLlDvtSkeL+04yx3L7+p+eMMem1I8wRYyRhQuMv2L9m
	c7E4ANT0I76+T8UgawBI3Azt9xgL762FkzxJhxTI+Yv6RzTHJ1KoxYnqjXAJbsKhsPLY8
X-Gm-Gg: AZFdTZfLRnRNAemHNICTCc6l8bpu9rwAsOZqQDNn5r9n+FC6Lvr3jxVjD9cq1LXEu6x
	ksqfJBqob8JTdu+KfWd8ZwEOP3pI0zDaBHg9TDYvnQMzGpLsdc+jvDTxSGb07bnxsLSY/QE265U
	DnJE43KnjP6Ce0RI93S7CfZwA6fJHa7Aj9azrIMv8e6LIqMLL63O7LF1d2WnLDaCWTkr+oNjdHH
	Tac1LcToJwGqaMDD5B8CZlNLrcDU6SC0IOp6N+jj1lBZYiGdBKglxNhSQ5k1ylUnKX3fyyWCGMa
	kaOl88EyM180ws5EpU0mlGVOOqv82Ljs01LTQGwJex/zTFFapvHwUrpu1llNLNNiip8psrGJmD2
	ucjHC/Sk2y5bUce4YTUrh9I6dPPOUgkoVL+EZTIkjsXVnwWj9+93BDh0SBoTHJJUi/o8nJZsKzA
	7G9p3HVKWKIdqjscaxad9tp5BNo960ol5MSX3yw8nXqTwT5EPTCdAZBoDGr0njjvE=
X-Received: by 2002:a05:690e:128a:b0:67d:b729:eee4 with SMTP id 956f58d0204a3-67df42baf2cmr6444063d50.1.1795530570592;
        Tue, 24 Nov 2026 06:29:30 -0800 (PST)
X-Received: by 2002:a05:690e:128a:b0:67d:b729:eee4 with SMTP id 956f58d0204a3-67df42baf2cmr6444035d50.1.1795530570084;
        Tue, 24 Nov 2026 06:29:30 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:19 +0100
Subject: [PATCH 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6L55zPWwXoWKqnOEiZumw3Qxh5x8aXSZJfNQ2TIlUOs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9C+k/fI4eyCOqb3VY6O3SvcmiJaMnmzWgEy
 15wcRfgxsuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 w0inD/0R2AsSV48q45DDF/zJTtrXQ4BVrCcCko8A9Mf3tIW4tVkuDx9TIoxiS67MdmKJKiNBRtR
 lTq5Q8OiFmbFVcu1OpvhRkSndpD0EBY9r6t3fY0khmeyB/6h3M/a1iqS2zT06ROtkq9uhIlq/bj
 ly5r0me74gXQ7o4fw6M8C/eX3FsKQ/7fyxbwYnZtzgP+EWqJz7OID3PcTVfm/Jzhp6KuV34Zcse
 b2XyzSag6asXJOxz+Z4cu/qPJmEtzlwEJmuZKpPKK9Gk9XaC9JHx+cjIQkmwUjCXts+fOAodxMb
 d7v8JTEVIglsgba+oa74QIfNgm1ZiGFkAxeWgbpZqy5E44PoFQjrwyiyOrovE1qY28UuJ2ORqGU
 etC9ejWeHIwMNttThx9/j/2HootZuWYBxhFBOYAwr8mLgnzEr+01fJJiM14DhQ8XQCrqaCvWeUn
 2j0+Gowd8bC4z7t8JDZMWE9LXwUG8N4mLVb+7fUFcyLRbT06948XODTuBNFhWEgfUkk/gqtdLPW
 IX/gHR/7pbjuEKiFbWilYikN35+zGHZFK968FjK/WLNJUDoOSAgVNmrxsP0z3ylS6kPIzm8u+Fl
 CqNvENRNSgxcmSzPbpTwHnH0I1vnxChoGDD5ZOFq97GhW7Lyno695jKFAh+yG8Qw6IyL3kdJ7n4
 /MJjUwKwtSrGJmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b059f4b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8nAbR0bechdim5sVv1AA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: 5CkpNELdkGoSTVMzknUCkdvWUmLVmaCt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXx0FiydKDZ0F7
 lRRoUElMe+M1czII9r0zfbtjzKDnlBH92sNhOFwP5pip49+1muPMY27GxAYA/RttvlmUC71dv1Z
 bY8qZU0/x5DGbI5V5PLyO35jU5NBvRE=
X-Proofpoint-GUID: 5CkpNELdkGoSTVMzknUCkdvWUmLVmaCt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX8D9euIjw1mCl
 yZesNsbMzT8Q7g48ZJ4nPcXy/A0Hch10h/XyMfMBK34NFTH52nXPc0PwesH2LuXRGj3BJkwSZrS
 0Q+EZlRgM6kjLsNzW2h52JMQC3u19AjIrVyGbWL6dIi5Tm+8qo/zo0EwexUkrl2yohyYnXlzFF7
 1G/uWUSSD8pdevavhtskd+u+N3EabPjYI1WcKpvv13O1lvVci42b+ATP0OeEEUrhJgqPlbMYztm
 trS9CC/z2L92COV5L/JPnww2PGYeYvEyPBSGly3tPqvmvjVolJqeAj6Bjh3gqFnHTrksnifYdXO
 xSqcLr2FloFMzyD4KZD1Wd5y0muW6MY+UBB6clsEhp7u9KslzikIdcfB1+xLlMIuzpjjrHrA2p+
 FCIz3vLFQltY3Fv4CL64YpAky/zAUuv7LMjW6rdiSMDn6MQ2W851L/UgOdHh8XvmDpJTMCoURqp
 YBoYgDhivbQqVUML6Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the sm6115 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 0099c474c44222c71ef281dcdeb25b7eeeb4deef..7aae2bb15a435a6f64e996a864c49371dc1fcef3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -689,7 +689,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

