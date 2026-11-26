Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688478;
	b=PTUJ7+MTIRVEB9QyE04Mrs9+1JOTnxNYpQe5QVsAu0xHKtTyDNOthADZDjk+9mucb3B6
	 TEicE1cFRWEzKIPvosLafbGloHynmAZFWmDp4sTyKRzfrYzsUUY9qWY4jEMxJbR0qM5jO
	 Vg7n6SzxylIQpxxQUejICw6mcwv26zBFt8wUaRd9kc4V2q8a8KqizaMT7mjR6pPEHTZlQ
	 dSzzTY1lV1E/NEnTMEfOQMrJn4eLU669woEBPP4s1XpcbncCZSSgWsHjdv4WfhL43G7r+
	 ijQDZA+TVK/oqN5LGw0qzcCgu8KZ2kHkEuFIbrlrcahXUrWTHi5kN+GmvUENV0HxcPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
	b=10QD52k9zihUmqz2VxmqGtl6CWxbVp6z00V1h7cQLiS0go+AHglCH1CXNqdr3pK3WHBN
	 3/NiBqhqyYaBjvPm1qT/AqZiizsTmN03JQ5wzwTspGICWsziu7eln0jf4EFwzUhJMjMrw
	 qoh4BI6t0tdhivGp6iBqlgkUi3nkKXJFpGj8OXbU2uUqDaqVtsPE/e5L2j0xl+78LAzt1
	 PKcUj54Gmmhei5qD5/YoeK881g19XzqyEImynRabGQGF6dTWV0mJ9eEJilYWFJoAY2SUW
	 83wGRac0kGFv9mqH5ONHWm0pCOlfoQiL/cVg9lPs3qAj2dGtT26RMmgeNfxGXNrAWSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cel+veus;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYDXEZD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E801606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E801606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cel+veus;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYDXEZD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3mK1682474
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=; b=cel+veusijpS9hNf
	IpuDHqhFg2B/FGsum9pCNmeuH8/HOY0I+lgdM1hL0jhjfVOMqXn5UzSitb7ZxAUN
	w/KNaBUN9zHT4gDv/SWr1IfBCMLsWxyj/CtnSHpzn6ROx6wcv2k22PdJNSGXAPmD
	JB4NLj8EqMPQ5GYAkBA3vnyYo/Od7wHdWd87YzJVPmwTApW4cFxNMm5kpkGold8M
	A+GNfUNpKTzrAN/9G3FkhKsnuT9CZvY43m0I60LVQfQHmvmmN4XbG8amZu5jaBmU
	g6tiDW+5I01Dx4SG9T++smMe3y1QxlgwlC9gzd7bYxXa/skAl25ytzWwJrfIEhTL
	Tq0+bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeknw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so1294048485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688475; x=1796293275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
        b=UDYDXEZD5QBY4H6RgTHkyDhE0yST6vBWjPkT+VteaEpGKpkYzwcL+PvAxL7lwu2oS7
         ZD+kjCt3OL9VqIM1CsbXSrPtY0Oui0tCD4rXcXEICbCn2pdmD2j5+1IbOobWml1AW65R
         W2H0AZXIqZDqd4FIczVyX+YAM85hCRLZqn5Jb/hRPM1iVqd3f2ShNe1qwt/HE2P1no/i
         iW8+fGRZ3FhFIrmPpxw/Z4dI2+juBef5oJFsR5mCO0mzcNz6yIWe3Y+KqjolWCqgtlai
         qCtFugAEPlpYDllsFuiB5eqaT9yNdaxI0E/DGc0bvs5vj3dBPgMEI4a6QaU7gvj0aHeU
         /RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688475; x=1796293275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqIzFznaIqKy/d1APlvOVs0iwxm09UxdIX49QA8Dc74=;
        b=Mo8Ij7nUigOXNmmIOP89mPcuWTUThQBhRMg6cQC6yl4XDjk+XZ9Bb2qI+WDnmqonzK
         snh90sm2nqjYi/pgCMGMioAELJHUcqSb+zapB5dd3ekGmE6R7m9EdAlovbGyj2klvG9n
         gNevr5kTP91/SKbU7TwONivXjGloGlHxBKOk2UTu0HPMKCPTI2K+7d0ojHTvmd3l3uWX
         UB7ytqbeeFGFixf7MY2xBmHPiF4Akjyq+shUKpLV2Nz63aQ1RNTKY5qjaTEftiR5+GxO
         6wMj1givqqM+ihADB2T8xrxhD81qwaORsQeBXAqEjjPhpkrRFU319TI7cFwQky5fSGHL
         IDKg==
X-Gm-Message-State: APuU4Z+kxeVEGk9sbFyctaVK0URJ0yWxRKKZHzjx4Ahw/s57T/TWIDZM
	dLeIFPgiXMfkLCLcRPNXw7gEmwN/OcQvuQOmu0yk3UvjCk0WN23iDFrzBDAN6OXLRqwpoCkqzkC
	OB1cGE/vUbaxXGunxwQDCJzEmiHY5hzfwmzk5xflfwHUda/6iRq5NcHeMh3u7gsuOMSKa
X-Gm-Gg: AZFdTZcwEaiD3TYDzrHPJABel4+KdbAvo1UiP6AQyLCRP5Tj3kp29m1RPEENV8idkPZ
	yL07NNvcnh0//GkVeQKb3xB6pe9rJNBAObOg3ZQZzn8NtQykvI3b5G4Xw2JEPKQ33ujMayujXJD
	h/EHyHcNB+xUoyvbgvisYa2/sT8hFerGbdXeeNy1Y31Dxz4XhnCk9j3LkRtkuzUQmy0Gu/kUhBs
	yRaNy1RDrxUw+CUowwFGYuub8TgGzNNGJpePLaRedkU+z4mq5DZixFudThAE/EidRC2UigtYAS0
	QzeKhWKWemjnBEuhnRK228e5scqPBK49uHxqZ3EC8wz3SF+v89vVRmm8YbRcZhxUwS7D11UoA7r
	aosIf9Mk0Z0A6/3SY//ELdPlM6zHdSLawmrRztZM1lu1JGF7efF5ILnTcDy7hS8en0CyxXnNq6s
	UU8lJOUMndUE+lWShgdrhY5RpW/aHS/plxo1WubcpgE7t4e0aWCxJUHEmclGEBoHo=
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr3086813385a.70.1795688475280;
        Thu, 26 Nov 2026 02:21:15 -0800 (PST)
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr3086810785a.70.1795688474836;
        Thu, 26 Nov 2026 02:21:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:05 +0100
Subject: [PATCH v2 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-1-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HuQaVy0w9sKhfLfcac7vUBnQCG6ABvcFlLk85ZOsULw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTTHs0R4uOlA8vgXUYmQEhLdFLXMWcy0IGC
 umTJqNPYhiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 wz5wD/9Glzv7uPllPNGfQuUx1EHN3JQhGMFONxXQy5iBEqnFvMKyAaDGxc+to0UeAyAcX1zTu5w
 vt67t4hc0rT46DGlnbsdSsoYf6P+3JQpDJ+SaiNWFUb0gw56BYL1JJtLCOu3b6vCQm7drEk5Dv/
 P0LP2p0jPxUeYr+3NS3A78mMvjtGnDoXN9es5KTy94MN8F7db2xwMM2YGDt6gFvJa9DyvMbu+4r
 lfujdzqd+VubD/VOiOYOT1tpCz17y/CtTuq9UM7S1OJyt5Vo7ETpOWZMqVULfRZ2Ls7O6Uw6bAC
 ijucnrXGK504DhpQqhFQcyMjfVughPgZaS15YW9gvjgSBEKmpD4SveVr+VkYymZxec4p6dIjtlr
 pBY3n9HbXXVnnpRv6GSZUvhyC6VQrc/2XXpIwp0ZLiEi1UGQM9ZRrtrvAwOfKpoia2TSSkS6Kr5
 AdrCKt7lCkz4mVrOneOkC6qGI08e1RQ8LmkF4hlI0xBUclYhxhj16MJ6OhxR2Q60c8bIgkAo83c
 g4r9Asr8twrXPurjKcYUSUNp4SwM0r/97ay0Jcil1vRtuqPhGXiHyWXuGFI47DGyZDOT30bbQGJ
 NDN5H5a53MmrXoVc+8FtfihqpJvmtbfUtaM5NWThnh/zYecetX/RY+1cIm9kPB0NOlqqy6C6oRD
 mhC647v+Xsha8wQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX35SW1utcWxhg
 XqlwIgggswXgovYXBKFoIsikLJV/mL4BLyWyolKZ2iLyeNze+OyO8e0RqS7BI96TSF3LMQHYjyJ
 FTrNgEnz+SCaqMjzgLMo0rR27LEe3mACRAOEtQGeaHscJN4h1LS33aTpOAs4XLV2IsdfQ31aSx0
 +uto96eTP0j1R40m+z1D5YKgivjksUQcJe8qwO8UiHbSaBjD43zO82UoMLwRTSd3WyPhQL7Euou
 jJfFkWYH1GioDR+ixZxHhxUTLnpqSeAstlbGBvLWG2hz1mCeX974DqiS+vCYqn++zcx0IVU4NwV
 +ex/jbQHAZYmjnpBwEvNzMxdW7sUQmaastP85sYBlyr0m5xRAddgIzb7yjswLvby/y8fW5jy5PW
 /a985/Q8K9G3a1Z00PRWWTQI+f77eKqKqshcM6p0e4U5tbz4l6O5z2+XD/9K9ThpDwpScVgrzyz
 9tIC1pD1Ujkw+d/nezg==
X-Proofpoint-GUID: ptQ9XYU5B2MUnPwkZysoZS_eUZo9CXDc
X-Proofpoint-ORIG-GUID: ptQ9XYU5B2MUnPwkZysoZS_eUZo9CXDc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX14ppwAHCQoQT
 D+0mbjtl6rvqwaLaVm8ab5tKUCi3GcUAgqUEpqSNvhzMtV2k2bAqDhTIU1bku9mdObsHrE8kETq
 7hlUufJrcoFujwcKPdDJ/zSHbMUvK0I=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08081c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6-PDsE6mYu08rWp6JRYA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the sm8250 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index abf5f68ef62f58eeee3354ed8731d194d6d60b5c..8791b4f0dde415e1dd2e61e2219392782c4752d1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1026,7 +1026,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
 	MSM_PIN_FUNCTION(dp_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

