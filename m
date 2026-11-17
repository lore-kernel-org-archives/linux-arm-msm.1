Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907957;
	b=L3AtKVzka9keMNoW7CWfslaClz7VLgCPUDGzq43kI481gMK0BL3QZnUHQgH6M6LtVonl
	 hc6A8jZu9EqJN/tCSq2yaq8YmOGrkDDZWo3vdXfQa98v9izaVyii9pXxjCofI/i3oQJVn
	 URgcHnx8w5nHYdPdkBsAqDXxDaxVRbPO3zKK6zcq2hPzrMvYfIfyOV+LUfTRHUy83lqbR
	 qkYEveaZsj6ye4KZHCLQHo8Ocv8K4p/+a0vIId2UeTxToSPko65a8R57gRdcySiSgFqk5
	 G7kkeZdGpkcltH92d9Ecjkp8ZfZ+btLRjXkMn4GG2lvysZrlkL+vVmZyI/4A3EyQMMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=;
	b=CGodxLmLO29wz/bvmpdf9MSCniBBbOoCFJo0l7BK14bC0D/AVk+PboS63e0StrarQZHw
	 fVwd5XEY6TfONH0t0B3db/fi4JBtWqJrVtY5gtTOtFf91VVpt30YVUubFzPtfkQF6EwnA
	 xLNkPOCmZvAH8hNCw3mZaszCTXnPXalqtNcEv8tPuSjcJ8sCDHpuBaPgDfLnxgHNg2mSu
	 yIF0ODfZ38KVSw583SAwKSeDw2m/hrKsvwMYwti4DPdQ9MQ2plpc2cxMuFbjSUwUcNQwq
	 q8KO6ZgZQ0gISHf9p0wJaeVy6gmeAf91nX89O00vw4rv8I4cTlomSTH6hwIRGKe60yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Evso+/sJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hLr4iMd3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8D606A33D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F8D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Evso+/sJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hLr4iMd3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6Lj2W3980683
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=; b=Evso+/sJcdVYDmRw
	Fr1FJhuFcUPL1gRGk6yRsPkXKo4aBEJz5laFGNPRVF97il4T0f4lKHxlzKP2MFGU
	UQUYF0IJ4TDJP5qVGGKACqSOY6leY/m/cj/TH1uPpmmh5HOE9bbHuud3BJdbembn
	mAt/PuymZWY5khHDh1udIIrPZS5pon5Kbpntk90gaThSkYheC1bWDGPlyB7uyH/O
	SDIz6YIrBPAPlKQUEjORIz9OsqVZnMBkkAv2fILCr0QoLCG1BVP4X8xP83GUyDmi
	sRT+sPXV3qSkF0GjHT6s5dBokg6pctHrJq1rrNJsgh2HVmEUHXWGCZQGxA/vtRRJ
	hEhG7w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0qkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:35 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-71af90057faso920966eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907955; x=1795512755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=;
        b=hLr4iMd3D1duxtNOTbl1eJ3Tn6E20l0hFVK65GHe440Wu0R5pdg9Q0rDPSWPvbf+BW
         OYF9sVpln6BajSqDo5IC/bPhI8hVcgQ5QDeuikcyXUciBrDRR1+Hig62HTfjemubXdTA
         CWnSF2DjYvbiVCEYooq+OEUULXP6G+gONUcGMMvyleSz/9sxodvppJEcASclskfaFWUV
         tlO6TcoGcDiRLNj5gs6PKqTAsnHpjypK3DQvH8wLEbp0UENuzYuttAPnDoOkXkq9Z71/
         WVOcf+EntZs6p9c9B8kLJMSW00Lwe2kvB6sdMV5GKHJgqbOm96sskHDqgC7i8b4yRSQN
         3XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907955; x=1795512755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=;
        b=aAK+XhAVIete3cE1FGxxb0kIW1mV0HBvWcqaH4olkSiGqmJA11HiusiUayU/kMTsje
         16ryngWsHJCmPqFF0iPt/LxmEwJWuEF6HuJD+6XxNpRfndNBHIorkgQwIMd/nEqwc1Dm
         OD2iRXIkfJzqL7w7SxsJgNh2kb5Cv42y1u+PfFf5chb9H3G+hX/BF3YZMB3wetr/XcG9
         AxJ/V9hvgq+8nHDNOOgWqT8rTa2CFMhMuqoayruej6zG/Ko61iX7NpAOTaGN1ychTXSA
         6g/I95dwiWvTCH5Kb0o0XTwxvXpCe4nwHTwQ+Byp69U/Gx2J+kJMhQC+xoTucXh61t8z
         X6mA==
X-Gm-Message-State: APuU4Z9ugIga2oB5YmlJcvSfFHanreYLu6qM5HV+VgGuZ98egr6TKzUF
	P4Cl2SeCl8G2lWptMkv9ttUOF4FqyCiTTaM40Cfi1Vv04fU01lY0u/vPwe5hnjpibFF1vUf20XD
	ZAG/Q9uH7mQh3QcKnKxZPDftyG1erufx7ga/huksf6HdlaCV6lBIaUDcNZMpNRcxR+UwX
X-Gm-Gg: AYBFou3MuF8/orTkRqsDAHodVPpTj1fzyZbaWU0EUpi8sbrBNgthkrMyCrLmQTr/uWC
	61TO2TFYGwgGW8XLILghymdYYk08dRL8BcUU9Ezu14fzQdayaWg+1hCJkS0ys25q5GSRsWe02Ip
	JVQtPhD+7qCmT8BTpwCIHuv8GuWOkZgwF0PJZJcclFMzGZEUZxFrfVQeWX9njGvuuRHGBtfiTZu
	2QAekVKwVhksnpACt4AJGiIPdeLd4w9+3it6HvcDuGePH4oSTBa6JVbUIuJLedGNt1VPme8j22F
	xpYF3f3vgUw5CzuBx+CHjfYo9AqQ4lVwKmzKKpypbpL3Mg74WWOCuOjR6iiKZWxHwERYPwCfcOM
	ahcnVPBxJrRCAbuX2DhK5d3Asj+qFvT/sey0OSHmt22UgfeyB8rPxq9FO2zOjDAylIlXhEWBfoS
	n5eEEIBURYZBz3uUZ3vMlvL4YT
X-Received: by 2002:a05:6820:1908:b0:71a:ed44:18b with SMTP id 006d021491bc7-71b024f1588mr1482565eaf.1.1794907954711;
        Tue, 17 Nov 2026 01:32:34 -0800 (PST)
X-Received: by 2002:a05:6820:1908:b0:71a:ed44:18b with SMTP id 006d021491bc7-71b024f1588mr1482550eaf.1.1794907954166;
        Tue, 17 Nov 2026 01:32:34 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:33 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 01:31:35 -0800
Subject: [PATCH 3/4] leds: rgb: leds-qcom-lpg: add mutex lock in
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
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-3-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=814;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=5eJRVgibwxyaZg2NtEGplKeEYP5chIPBpI0Kdh3stDg=;
 b=Scy+zu91VxFdrh8IFbguc1SsFdfGNcpXXmuPo0ivwEPYow4yX2bP6irzC5dnDhIL85ixkDCMX
 qBFF/fayGYHCWMYRyWyRzhCcBzr3pKk/6L9iPPKxueOxy7oGNrxiQeU
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc1f33 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX/lIqa7YvhlPB
 8KzQWtBLiWVGZj55L6HHb9YgwppMYnQsb/x0AmTuYYjczdM6vTl3eaDf0S8wxu/vaD/+ynDwfRg
 EA3lj8FQc2FP4UhGu4cZnYjCvJmkEko=
X-Proofpoint-GUID: XTHrrSsnM8S26S5oH4qtfoaPbwHDkq0x
X-Proofpoint-ORIG-GUID: XTHrrSsnM8S26S5oH4qtfoaPbwHDkq0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX6jgQ90SgbiqH
 dgtArSQvymsRUZkm0pPcDA2MH9EDAN1DUQelWHv3WWAgho20mof3Zg3Ehqkt3ql4HxLnO70yc5k
 oBzGYv7ufkCVKKHlzXkTBaZvdqdQMN/FPuDtazEQ9gK5oXsg9RHhRd3eB0Kc245ofKf4TlSv8lr
 J72TPfSrjqTpZKGY4dISi0XODbdc793F6IjxfWXZqiY7O4KllCIxSeDaNnJHD90PiS0KRbc6zpk
 x9Fui8OK281fkZSlq0KcZ4SGwwRSpf7B8NsgqeYloyzobLRcGW2BXyvllVlHcihsC4gxRv85n0e
 p+9e4ZRZNguCRVgQsFHJwCZfYsLBkO26lF8QXVNcu4BaphgKHGT3dw3ogd954J1JKvQO5n8n+Sf
 m7QVX9vg3cdPpHkM6OSD/JaBrFIhuPivTdfVUYZMEAZb3ulLW3ckGTfphIScV49ErCDSjSpHb/r
 gWf0WkrucpwRrJE8JKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170037

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in lpg_pwm_apply().

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 175b3680766f..971f92911606 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1425,6 +1425,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

