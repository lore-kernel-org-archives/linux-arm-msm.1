Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214031;
	b=Pfb70SfAr7VIuPxxQY+McRZjJf9JSWAg0GCmkehItF5XOJTIrDsunAqxmgXbz9ILoPz5
	 5yOlOceBbQ6DuQTD877g8WsgctMoO3vNZTwKD5Its03nNe9OGd0RC7OlH9bK7vfBeUwaK
	 nt8i7DgoMx4xRilbFX/GaavcZu83WYW8YNLb/lDsjgP/gDg5hvVPNKFsNonHBPqNrNVd1
	 XttjSQdRjocyF3TXdyZJ3Rk39edqzOE1q/ac2Uge1Bkq0X+XsIr/6CoSJ2m48Ka5IKyKs
	 AU3VffS2w7S4nGi+87iTVAccaRoD8aCaYboWywAYZh4a8yU7jPX6zHA7x3TTuI/kyKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
	b=Q+8lb0TSlxo5tMebgKwitqLQdTHOXkSgsV8FO67MMpV9ogh2v/bPy8/O5s9rgyjnubH3
	 UW98A/D6sGIxH3qSrDSyp8wVVv7yiXHZylb3lTL6aH7yHnpxO99c3oMGjm+BYLqsTs4a9
	 Yuiyb5KqNO81cKstamrjauBcT8XcMH7sg15kQ+n9kNS/Jvwh1WggtBe/RWRLqTzD+2KpU
	 TbPyPREhtqdkwj5SWY+Nxv8OnXQL713g+FYaa3GQ9+EtH0wPS6h0ChR4/SK45f85UN1O7
	 hUh1tuNAMTW5ThnzOXEsHsk9YZCcq/SNBiJU89DIB434sPIDlWOineN+am9Ysxc6g+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J87loaFo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixuuXWe+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08560A3819
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD08560A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J87loaFo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixuuXWe+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPiir400638
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ihzh9krNeTK
	98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=; b=J87loaFooyki6t56M+osl7xd0Nh
	0J7oCPNoLJIdleMrM+mZXByx8GlkLvKz+EQgaQQBroSNN+vh9+9UmMnu4a5zKYHP
	anIYVH7AoqxYaV3Pu4EmPPwrGZVUwIGEjhs0a+eFCQaKEK5Xw+BQjPfSGWgabLX6
	SHKmoho/ynimbeplHzz6B4V4gWHj8Uv9pKQS5dxRwKcSyrKrZUDWKfIZvcbg1VLr
	Au8bjJUg6WWydu90Y2TGfaFnWE9uI0XmiWc6p4W3NxIhrym1lqp4im2O7W8RgleU
	7/W3wB7Qa7PPjfipEaKVbJkLoMwwXRMwgfCWNG0aF8NGU7H+6FlpsAlrJUQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnhhp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:00:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so4393060eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214013; x=1793818813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=ixuuXWe+a/v36SY1H6f+VsmVNlIuo16jnlxGJ6QkBHYYvFAPsYqW5hQ5iVaaLch13L
         6wVRd8kR6HUcN0Slcpw9XQt221knO2eFnGLoHU/t1vWxhMCzdwOqQ2zuIt2jX4Y2Y25c
         TieQ6us5zZMcinDjkS8FBF9CgFAsnOEBZYf1Bc+Vlx2fz83v1RJ7eIlFnWuhqmLCOV7j
         4DV3LdDLpbUsKjX8UY84xoQpJ5ydWa4acRY7oL03mgvW2cyhGXqfC5SGjk+pal6yz7Hx
         tnICGMs2AYsyjZuCAPoqRhkrw6+4TQs5KDMXhkBEnF4RQhLt3LpjMrD2wSOZRP0P8q8x
         0DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214013; x=1793818813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=CTCYn7u+CRADFLSDvIpPsabq3rhjy8rpd4tZdvEpRhVZF5HrIpztF9bvQ+BqcNhdCh
         8Y3oUwSrTODNeHEVWn+49URl9jqbd7QAPj7+IeneX84T/LbL2O+9sDJqcoSdR6t9eOjg
         6tF8V4HwlveDz7K2nFyuK4EaEKSzG905kPk7IslpUMsHfuAecH2BiHFyqz+BYW4lignO
         wKjeIkM0F0ejr8MTUYEYeQCk5/CqCg3lNYZjLq8KCZkCXzGNGmarCBMkP2oKShanl4Uh
         byWNnO7eTVK7oTIJKL/ISR63KDHK9bvj91aBaNxsT5swf0DmyZ3MedbzJMlroInHCH+n
         RMXg==
X-Forwarded-Encrypted: i=1; AKwUvBxgtrxx5AGQwYuh4TiFvEQM+KkP35i6hJGY8ggRcdYk9/V0tAqYKVqn7M7dHmN/miqfgjq//4f7HmN9tqXz@vger.kernel.org
X-Gm-Message-State: AFq9FYKRjWfksIqG8d6tgeN2eHBRxqpjXbsaEP7F3rK++yz1/mp2CDDC
	ipPAJOPSfqbsDSD93HIcwAzdHMNl0xSOSYjPhSV27iMDiCNWrqKeuIJCiqzwz8dGunFYRGlTJsq
	iXByKkEybmqgQkxdRIHK8i8L7vGQrzdVfpD7jkDL7/r78KIVXJ+0zpoIr0FBlTX0gbAS6
X-Gm-Gg: AYBFou3pMuf6gMG2Qecm/Q9Ew8+Ip7XTWoMCF/OWb/5jXrbzL15WeLBhajKN0bhkUUn
	4ky72Q2zOUDO90FMyInlbIULzo7ElzVQ9+Q8gUp9Wl7oFHhuimO5zM0+qs5rkDtMddfOTswtFHZ
	VqfQApLn/CSPIPSy7dUtfmMLG7WesKTBRDN9ZgkeRhvLpBvOqS5YjsSIOT+2pcblgCd+9KAT/um
	hsSSGfrqqxHWT/l4BGRtcQG4+QoGvxTRCP6FC78Ny3sUKfBUzRBXJ6phbqrs2Kgo5ZkOLanr5lt
	zo/1ku+xQ1HYgUd4p43gOuuLUYw9Ns2AfkY4xw2BvgRx/JOoyzzRpu/+WD/j8txo7InSwRz2VjE
	wwKMXbHapKa7QQw4ERKDFylkPRR6BX28QhkuQq++kGureop14qxAAriTZ31AGwZ+InNz9EtDorF
	geOB+Q4A==
X-Received: by 2002:a05:7301:29a5:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a203efd45mr4646594eec.20.1793214012821;
        Wed, 28 Oct 2026 12:00:12 -0700 (PDT)
X-Received: by 2002:a05:7301:29a5:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a203efd45mr4646546eec.20.1793214012227;
        Wed, 28 Oct 2026 12:00:12 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:00:11 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Thu, 29 Oct 2026 00:29:37 +0530
Message-Id: <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9IkRZT-TOULnpBvztxa8rudyjWZB4w1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX89txwF3rbK1G
 U3wSg6ufPeLyVNjUY/VF4yMmzikEWLsXvM2WicQFqVTyWI04i1DOsbB7+cdY7oCgCCIYCMeDnxD
 NQsV3OI/kjpiR0C+O3d42fisfJhDhE1Jh8FnUp1cL7rQGgn05/eq4/G8V/fgpjl8AQWjihJ6XX7
 hZCCnguLr7BXj0y2t1SuWpy84sGOanYKTL/BfCzmuaQejpqm7Gf+Ro5zqSbe1d5V/isnFzPhn2S
 Yh2NbzwzGZ26RuzMTeQLly1Gl8EID+HOdr21AaXPptp+3jQM8DtzN4LLxbaf/PnTWcvxYVuyZoB
 7Zwm5wJANptk1K6VEcVso8RrZDDTp5Rdiv9wKzzejNZT7NqU85hvmKzM9rhsQvpXEOXpotCf/zf
 9Fl2bcHGD5ULnc4/OOSYsrMR3P1iqS0Zcie56eGxr1mlFsl65ASWl2KGwyE44Y6e6RWpNXDgQrE
 wZ/J+RLY4U2znI70MxQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2463d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KL4VWcfqKbbHtFUGL8sA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9IkRZT-TOULnpBvztxa8rudyjWZB4w1i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX7O/rHPqAyvbH
 +iT2UBIVgL8PlT6sl5Xt1Ne37sngk0FNOAi23wrePmcjRvsYF7hv6Xvf+szc1jdDGwBVcYaT3cl
 WqSXg+QAGhfUc/4E87rU5q3LrLP0xLI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override at probe whenever the initial role is
USB_ROLE_DEVICE.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0896a323bdda..92f1223f7b21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
-		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
 			qcom->current_role = USB_ROLE_HOST;
-		else
+		} else {
 			qcom->current_role = USB_ROLE_DEVICE;
+			dwc3_qcom_vbus_override_enable(qcom, true);
+		}
 	}
 
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
-- 
2.34.1

