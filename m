Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415321;
	b=iqwEgvVbonYpXmr2iKQs3gFKtjckQnCiHhgOvasDROC3FVXNKbSRU5xx17+OecEICill
	 X+CntDaS/bNeA+Ee+Du1b0LB1vUmo4S0QUFEKriqpXx8l3jOkPzKIT8onbClcChzVu5sn
	 ecua1ZLUNmcuvz2duY826ry7HqHIGnrsLAa4YZgVMjNHn0Z54DXwCJeTBZCS6fr/B9cSE
	 7jEwMp02bgkWglnEoIxQTn084LaYTgmpE7KhHfOmX6bCMIozYnN2OsgB593nvoLvN+iQ9
	 W1fNQfmZMFJSaA8Lr+arZUFhh1wXP4v/rRKYUiA+CAblwLHYtdvT18qSH8IwM6lpZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
	b=0n0nvwDoq0kR5yF95liw5DTfez83j40WJvvlInD64EVSlNDehiSbzh8UFS1sVdaYUWGz
	 3IA9EaQWPy1U3H8NDdJOzHA/+YEx6Kg6JMBsYUw6D3BfW9DCXLtZExz/8JdZMky7uqhlG
	 HQGfMxncLu6jnAVpXfWCSv7Yx+4oxTxLYHH0h2Z1fLW8JctD18lRN3ReNKk8VTGziAeah
	 u1efDX+pQOtyZZtOHVJ816TIWdOr7h05Qo7BRIm4sgM5G15wEsmZVsHWWZJmF+G1gs/wY
	 hGG9c7ze2D+O+ZVGKDsRsrbciLCr8hAIwc7uCeEp7/b7GMZ4C1Mqo/wrkVZLxOEB4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61DF606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61DF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DrWu1664726
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=; b=kOJ5iFQxLqGnHt5G
	VtkhBb7vWjdmQUvSoffpIXHnPnT1xZc3pChrOPDCA8IM+j68rf8y9NmiLY7PM4NX
	ye4kDncIjSYqRLJ+pnGw+3PawUnq2AwR5aTP9GN0lx1R2IrqLt8pOVLY1+omkcLM
	AUGcXEXtFYaoGuCZ5bWGOzWOBcc4cQgtZQJrrWgCikz33L1JY7k1xegUtBmyjSpz
	xU1R06AqKUTKUTAld6nsi2KGtPHyAxWtGNeebnhxTxMftVP9f8WixUJUziJLn1uB
	9HzKl324iREdwY2iP9qdL+/THh8Lp1SvsGs7O9OAQRKAy3ndFgv6qCc7coEjEcTb
	WaluRQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p81k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5727b04b81eso1838223b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795415318; x=1796020118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=Zxtl5aDScmU6mMpS6Oz9R9LvEdGSf5DFyyd1bf1zg0LXccdY8bya2wvtiT/+/capkQ
         ETTNDb2W15+6Yp6QJhdFtYTq12/FS1De9g5gnoZzB9eiQDLFYQ3JA3MlyeXUwRBXkoGJ
         58l6Fsx7PpGXFpDiz6ZpKaZ9pZFva71gL4xiEksoirlCtXpZqOKUZ6Rk5wqLxYWgwOdO
         Qm6ru0i/0ktlzFvbl1SoEtnj9Nlz2UglDFOYMu8Hn0p8/LbaF4F5ye/Opq5S7hOgPYWS
         SVjKeBkvZBNZNPcEDjAQgzTItXcwBeE3tsKwusDVx10A+FWHK1rJrYnERDvbjBmRfskv
         x4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415318; x=1796020118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=gS1pPj0VgAjxWDGw7IrCG+Ipyj11SLzOcVhLHNKfYG5Kvw1BGi4QPJbMIK1I3A1vJq
         lYG1kpf0lBSEPhljoHwDMLkibxW8m1vD/IkwQmc4ZD+2O4nHwS40yprUS69O/GPJTWji
         0RRpXlIUc9hiL+FAf5scmNkXHJQhkFX6hJM7L6JbfAd7d8CbywFB/vJk26dfkALj/iak
         dWRKbNjIQGeTBe4olp6vHxBMh63LuoIhFRWIjs1cXzNzWabOPhcdHBU0BJbqUTDW0mVs
         8rbO0JdBYGdybR8CiY0/LXl9z7FuKT/QaKk+IqoBcIgZg6ch8eYUmEPvwJXq5X5a5U8v
         k9SA==
X-Gm-Message-State: APuU4Z+8alkfUEV2dorY51Y4fHJvQuc8tpto9+AEDjSoylCXDVbzhyH5
	A6+CoeBJWe2kjJXoch3T9VrJjo/d/8oe74P5iEZ8yYzkfLIhQq530Cgva3j4lcrIFQi/MVXRwN6
	PIBaF4WbFMkeDKxBlL4ezCnO829+ASLCzJy6C25JuIxDjbNAX1wJiyoTz0GMId2lRJP/c
X-Gm-Gg: AZFdTZfAhcScEWodxSA3ZHT7gWCC92XxgFUvQSrVlntPktU/GFjQXQloKI4UxT7+ORx
	8yd+SJkXlthNiYTPl/JHVNHdH++DEe1aQYqNQyJadga61vatgNPQz29KkLU3mFDHEOXf7FffSUd
	VWR4JlRBhrQysRUP0rMgSTvTfP8CSiImvVaHzLS3hTAgOm6xNWNHMabvXUOEGn/R5by/U40AJc5
	AZLHJxT7e8nyX7Ek9/6AV9jxG2DLk1A2hNrzXiqwB/FqxZhKrjVT+hLOJ0lxFUHLmpZPxtpj7bj
	c5pZ7mS9AjB+TT4yeFRJEJ86L+xrXSGtvjg5pDMhMHZrj/ClIpoPZ1WrvK38h+rZn4s94hG+uut
	n4kmNz9jCsOqkjj5KwSn6rtRNGTnURYGErfzG12Py3cuYvohYCqnG0+WtSX6fpMg3t1/B6w+smD
	O0IeFaUO7SZVyvq6fLHqJ8u/VFIA==
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305931b6e.48.1795415318439;
        Sun, 22 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305924b6e.48.1795415317985;
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8762533b6e.17.2026.11.22.22.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 22:28:09 -0800
Subject: [PATCH v2 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
 lpg_pwm_get_state()
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-3-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795415311; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=E9cLjwDx5BK+zqMQtgOEwMzmeW7XdmjYZZoDgxpPWPY=;
 b=ehXU+osAStcKgvOmBX+U39c081WCbpCMsxGMgWGRC4JcPzKSYDLvwF00BsXf/XqO2HVbLJ1Ms
 Myww3XaRcV/AX9Kgqh1dmfCyAefHpUPgvwQzNxiIiL+uNoVHerQl8di
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: v2J2f-KF6FWTw16XQyQzciaJKp_MO9OK
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b03dd17 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX3LqPyW+dBoYo
 JaVDplX7pHRY6axM+XKGTZ45g0VpNgdznBr9gpz5mk77lr0qxr7epXMYEkyuJKVSupnUeexbSZE
 /JWJStaCT0Eg/9Lwoh/eut0qkPl2bFQ=
X-Proofpoint-ORIG-GUID: v2J2f-KF6FWTw16XQyQzciaJKp_MO9OK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX0CfeQIXr8Fuu
 NooGgL3M0dich9TS5zsOYmmhSCP+rr9S5l47t+usYr4Tv0KfWJtfZx5c4Mx898WRvYQB4Qm2qpd
 c6H5knE7kw9iBmSPP1W06Kk+YcAMaPyM1xYjXzjuAmZLNmWr3MnAjcqJmOapMuhebYB4h4aQzps
 D0AlzmRawI2pQ5H7f+PrH3FWbxLsIgXGZhU0OKjoRs02m5CuXqipwXCcQi8Tswhqr0oAoRh2OhI
 2o4Dymb5oI1PueMcmlFT/GDcELNwO+MkrQs3MhTCRGVAZ3ADIsAGXjbis8FQXuvSbI3Xc/w8E8T
 knTdgMH5OGcB3KlUH+4wU+tHtLblrBN9LhBMh5ncz8ZXEPdfIV7PLxrcN9hCzGMtle4B/wQDkA0
 uFiHNWbwMdzoIKCxOrJt8XFVsAP6NwWkilNTTvatszI6AnGs9KpGv7WG99EA72P3F27Rqr7NHAY
 ws4ItJEpH9RlSIA2Yxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230025

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 763d6379bd2e..5d8f82ed228a 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1470,6 +1470,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

