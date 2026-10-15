Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1043B3E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093679; cv=none; b=rFDolTFal/lZTA6LjNj5FMaGvGj4MJOZ+CU0uQpkdyS+k/O5MZDOTefwGnwTQiJPbaDduLaalKx5w9AH0QRJC06yWK3j57J79jKG4hbToyZuVy2+y4TSIu0P10nask+/Mw73xHwccGoiaRFarxAd4aec5l0VUiAR3SwZuvcGd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093679; c=relaxed/simple;
	bh=OGpe59J1qKtUFqCU+E7+QmVCO/53r56q4vFIjT3Ui1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAC96UP2ZCtWlRinNBofrF9De9W3xdcCmlVzo3EjRLyG4WVgIs+b8VDQZ3YPYGC6FuAzpGT/MeXCY1e7dH3DON8AW/+iFasfNOqAOVQbY5yVYw83yfUJ6diRJBbpYdk6BNagTvE8chXLoQd3cJcFoi2/Q2YokwJYRR+EEI4PHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZjEoK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAxgbsN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZjEoK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAxgbsN/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFDTfP4126415
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6q3S3XwD3ss
	KNTNzg+SEXrc734GFwZ80COO3a8rdsI8=; b=cZjEoK48lWk7wepcehAUJRrbnyJ
	a1/4Zso2ZJYgbTNc9xl4/aKdz1y7YWA/TvmG++4IijvmmQGTgIHAyiwAMtQXSRo1
	HNCSsA9c0R/U7tEYNmsXaMC4obIuZDJizcFnN09NKmFDInDc9/+b3kdabJJox+1G
	v0RNRPTzKxdXXqBawtIstdLW7Au7l/FPxGDeRO7sDdNQ8rD6vJYpxi2lJOgFSyXx
	XYrP3WJPKrY0g8FOEDxiXYbngb8J+dUgMlKx2aXcM/2zFgZUMnTQ5GO50gi9UY8S
	kT/KryFVABeosVQybw095uo+29YAsI5Gsc4cNZ3sihMGGGoprGOBzVrB/8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m11p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so1203418685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093676; x=1792698476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=NAxgbsN/NpWfTUIZSMw3cH6CkMNsOb2Af8tK1xVkEACEsZGupw6x6RJBXey5vh9HN3
         cDRQd1qpp6kUnuct+SrZipO41cVDVx5lbQwmgKenjIeLDE/Nz6Bl6vWlmxG0dby85qhi
         XV0yjSfeUgIyrMhnHN13XzG6rbBSlhM7wAKpcGeVo+gPTwT9DSFED7cf1rZhUSNXZeEj
         /EiY6zUz347I3FrlAcNt/IPYoeGTHEYmzWzXrZRtaGmB1jUKtvhjg39/I1JDLB0tw8Le
         Mz2NtoLzRPVy5oD8+Q95Hw3lvZ3yvjU4XOrPpUkDlLj7NCnQHCnw63Sj4hQD03DjJyLS
         JB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093676; x=1792698476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=mjTWWwa0mjJDW+yLZnvBATQdabV4KiHeVuBllAtEFKYdlEXS+na4yklbprDkHA1700
         5QdkzGYsA9Ev7x/OolOcDgLkDe2nfEzBjaAtJYWuL4JHvpIgioyR2x0BtDXBxoAM38zb
         ZuyMNrzD3cOGPQtDnwcjWztDdmmMAJy5CoZKInnw3EhmEq0bD6CZ3U4lzMRMSnOcDzfz
         KvG6sLgNlAKKCi6cZyh4uxvO8VBdD0fa8q0bFxo92caVQqTLvuiMNH89S6WnK5mp8FtK
         PzgDlLzBwKiRgNyhm8E8I9QD9hmxgfPuCtXW/Umcqme9jasPu9aa46iPq4F0Ecpcscim
         omcA==
X-Forwarded-Encrypted: i=1; AKwUvBzFAgruUemE+8SwIlZ0PSUZ4HnHejNacWcicERwYe49MqcF6GEkQ6cxyRBJ8pwr3Dgsc3OZOeoI8d52kTov@vger.kernel.org
X-Gm-Message-State: AFq9FYI6dW9t8oxmoW34GrrlnRi4CMWqdFwKLHbDDY78m2IXE1E0wF7h
	CzpwEsbBEKq71eNBzljxYxvU21fsd7FnRZMJFv7oaq/aNH/r2j3fH/xfzBHlUgeIaV03QR+nm1W
	pI2dQ64P3U5F9H/KJTWD+DEP4bz3BO5t5tXkGF+tAy8DCP8vaJ8kU3IdEYlk6COFpQ+1q
X-Gm-Gg: AYBFou2TEeUXaomcHi5+JmvFpe5flXzGLggcg1Svlj1rS9kdTJ0bHhXku7e8PMP7kfO
	1J5TVza2nRFARFSOJFAgNg9Tbxgvb7C3J76DeZGsvQJQcAb6hBa+h6yaUuQVN0EBLfX411cBbRO
	ONWPS9Px8gcJQJgARCdz0hEH/ox0iamC/AqTdI9H+x7+6MlY3iprhOxZVl+gF+NcmDIlNwGG0lG
	OKa1RBDWj1H5/62xqFnjf3/SQFQ6T54Z+XsZc8yjCH4rco7mJg7oqMaMKk23sRv0IOcltouGZKI
	zo0POCFGxKluKl0kC5wiUZwTTb5a+eOwPCMjD9Kq4n9DVm1SZ8zz/UJg1ZoAsinmYo1CN8XZ8m4
	YIGZ7VRTCElZb
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604371585a.41.1792093676403;
        Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604366385a.41.1792093675818;
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Thu, 15 Oct 2026 20:47:29 +0100
Message-ID: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad12ded cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QIIdgxlFtvIS5BbdDE4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TIw-eB1EdsMoijL2b7ZNyeg2PaxjPn0O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX9/yhV6cs/crZ
 1NANts0TWIcW+2/KNgnPHDg8CxeJIqqCNTjymfFkN7NpA8jk85JcrmxgjgvJmlZq54moFQEyRGE
 k+SVgcECGjHwVuGIN1C/xrQB6zZQRog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX2wrT1ipo3FXK
 jKn5GTbdKzvDgYIBItXRX7DXslOHA/D+//Py3k0QYUGQovGtVKTQ3XG8qp1NOIS1TnS8Y/Hr2Og
 VuU8NKJSpbqFKOCxgsRDb4vu2JENkluCgjM1I4mggLoL2tGuh5RR3d3sdCosJfBNRB1/gTeii2R
 9f+b+s+mCu/kXE6gquspFYbhLDyBI6mzOCxzC18asXO6H/dS7HHyPUuaVbDEWL6RDcZe/x1Xiwi
 BnbYZESSn7emndNc6c4WVPm5DNI90fffVy7UQ8rAf2tZeQTWqqNiE9sdaVUtZHeNgljSTg9t3yn
 3XY4vQuYEHlkdb9x1PFNYngb2IzN25nH/sjWCS3X3ZYicBXBpjSd4UxAtE7QHTaneQMI20RaegZ
 heBFXwY9Xi6qukf4Q/8JvMTdVAye/STIy4miNHFvAZ9ivQkvsNT2xSSXWqaHC10tGkqsAQNOuH/
 KmFHYc6/9TPRVbgfSIg==
X-Proofpoint-GUID: TIw-eB1EdsMoijL2b7ZNyeg2PaxjPn0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
reuse pmk8550_pwm_data.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..485fa2a7a848 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
 	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
 	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
+	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lpg_of_table);
-- 
2.53.0

