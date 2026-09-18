Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA304E36E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733139; cv=none; b=fvQPXU3sQ9+bnJBybTX6G128cFraXpiULJ5keLfzo/yPOnI9h2act7jND+YLaqZHqBGXIGuPBDfIZAUKG2CHoLuYP2QLw0oTOK2Lz8khdQ4JKOAIjpTrjC6jMko547I377r+xu+n4aunSChHWuBmGc3ZnUxY/sF/MwYGvqnVDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733139; c=relaxed/simple;
	bh=yrWESk565CiF7pWVu3f4zAmz8lqipJBbQUa+EmPfuek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+LhuXYdyviZymUEircQrrx4Y5+d+Z9t7QeVzhziWTW4twRKmGzr/1WX9mOM/V/KiYuEE23hNt2gnVqyKcKL98d3doPP44ozop0mll7+uPhGIyaQCZoyonpQfTA+z3hd2klGspVMmxrSaaYHFtdF5/WETgXw3mWb08StPXCcqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXM5dF/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLQX+l9o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXM5dF/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLQX+l9o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dsQ5139299
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPVi9Zw6kD0
	/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=; b=DXM5dF/hKObvtEbd3gN/IjgjB/q
	03wp7Ww3S3HvzhYfSpM4SW9P7aGAZm2dYvRS63vtJiCvLgGxdq4Wnow0tvBFn57Y
	wsKvT4/oGgC/JJ9ctDe0oHzIwGJD0ExF9Gy4uDif65spp8GaZWcSIwAiRm/wnlcI
	/4vJH/hfbc6Bkbr8MnMseU7A6UloMOKNznjHlrYUcafI3aOXMzn+lMahCkoZRHu4
	vu95U4frlU5n09V6YdJuBAIvUuYCWJhxH7ojsMAUHT8/CGOQ+ZVfVfpBAqZMqlrb
	UCr7pNO2mzhkb1Dq/wDgzH8CS4X/r5OvYHe9XaJJWQG9NO+mooBvAuR+nBA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bsj4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c830ea02d3so507086e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733136; x=1790337936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPVi9Zw6kD0/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=;
        b=DLQX+l9ofv21FD9+A2dTXIV252RBaCCmoyfCR/XfUmQtw6vQcsT3encf8IqnlRneWB
         e98LIF5uuIv784rd70+MLds7skJZzPc5lHtbMD9MvQwFquWECTzfB5hc+mUpNGGrJQJu
         DQHw5zU9J1Xo2ehCKEw/Qm142EW0lwbgka94iUniINdkoAwWYU1tbjs/rWXRyXKLaZoH
         jYsiPcB1CW8GBKJR3RKTMcHAact7Lm1XG+DCi65uo86WW8ULAhtECNnZ+TJBedGQ3Aex
         dMymbOXkxNw+EWGNVR++oqCTnAccqf7SilMrJkEAGljRi9jENp1BE0IT+bAML26vvi/N
         rWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733136; x=1790337936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPVi9Zw6kD0/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=;
        b=tHynJfAdgCSL6VTwPhFsOHAFugk7nJeQHgM8VCl9uO43XUcwHoWcCnelLk/kQI4lO5
         GgW2K34uOea5SvdoncMud9dEEYnCvaliytnh7wlIwkJLZE3vJkrFhm1hEBMbWtjzRIpj
         AoQq473utoZbLatOXHkTmrJ8zZ7t/lEYTZLQrsHipYGtHQqP2WHz82fznCMYI98w8iVr
         Cjan0KDGR4j0wilSVe+8V4WBPhi8AVLIiQzaQbFmi/u3sEfxDe7YvYppW30cNEiGceTP
         9w4ppeaVLPJjPhC+cD/CWhgYJfJjNbi5MSgDkB6xonU5+M0EQb3FQWumVPcAb9OONckP
         zH1w==
X-Forwarded-Encrypted: i=1; AKwUvBzJCNjtptX07yHmyLk45Vs5+Z1c0v+1VbdLYcIzcy5F3DHzokFhtrzsAHHSieNhhGu3cTEICeRAdJTWEMYk@vger.kernel.org
X-Gm-Message-State: AFuF++noMfxWM5PsNF9BgaDslIAaM5Tg05HN0Ub88OA4bGN49MA+7rgP
	8linzb1d8ZQixerEpDe2LqudrXC+uY/t0nClQPnMA8f7zRqpmFEOos6yFBmjgo5+pt8UlTWi8Rf
	ww3VJJUuPKMAs6NyVfMxbdqeAHfRdqITPBZyJ0RzA6rVstIsWlY8KX0oqmCsepj1db5p1
X-Gm-Gg: AYBFou3ri11akJ5pZ7mi714EYJvrxyEz4wp5xngjIr31D2gchrcrzsD+F33DF6s0gbr
	OI3Sv12RTo6pz0WotuAN3psl+V7053pKFDjYf+2Te8RXumjnwm2+gR8FYQdvPznSufTejqs9JBp
	KdWS4gVgFTQ5Nae2zvCqe6+vrbvi2G9IH5mm0ie9kInCJednlZ/iIeOHfjH42PlIX3NOmHdnSWd
	PEEW9dXeW8rF66x6xqIzXBWKXtBIyfz9zDiA3YJrJvkzOZfISOzyieVdtr/P6VIEU3TsyOzfxaA
	S1gxhQvjlzMSVrS7ySNIwg24LDl/R2wycUCjCsG4C1FDE0RZXFi0uy5kD+PBoeuZAnin8r8BtkR
	tPySmJHZw/vJiMg==
X-Received: by 2002:a05:6122:1d08:b0:5c9:a60b:e5ac with SMTP id 71dfb90a1353d-5c9b59a397amr1048060e0c.14.1789733136200;
        Fri, 18 Sep 2026 05:05:36 -0700 (PDT)
X-Received: by 2002:a05:6122:1d08:b0:5c9:a60b:e5ac with SMTP id 71dfb90a1353d-5c9b59a397amr1048035e0c.14.1789733135738;
        Fri, 18 Sep 2026 05:05:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
Date: Fri, 18 Sep 2026 13:05:14 +0100
Message-ID: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfXxxm+qKFvFnOa
 eeuy/VWkmUtmLtDMZEVf3PmOmAhli5khtZrcUJvDgFWMf/T+/XPsECCTt4sbtHEtiKVwxkXBeMJ
 djsnlGPQ+573VwN9olMtDOFx+t34ZAojjo2AxUPL6utw5gNCRBvqp3cHvOhE1sh9BXLfDSn39e5
 BngOyDPUUZJl1dooP3Dw6eVfU5bUTtWOXG1l0fCsg1VyTItT/QgsC0/OqV3lmXEN3cjmnoNo+SF
 Q8H40Ou5efXvb3FTOfkH+31d9MKPSj155o8cD5ZmgaL7O8b1lASMxSQfm1F84Lvc7f1shNNk5ep
 imOwBX1RGbCfCLS+7D7ByrtfWcDYxnWO0Dpv0pyte6847D/t8Hk1IsVlEUtiWEaKwe2JB7EW2LK
 j6uHKmbSSpkVGqydrnD1dO4nva5sBLBwjCW9W+HQ+l6QMhNORzbBXaZ13kCfANiRWl7IJi8FlYh
 mQzMDgULQ/lZpUL/bUQ==
X-Proofpoint-GUID: DKZC0fd42PKzJ5MKlv0y5BLaZPsD-I7i
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad2910 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z2L8r4mWo7kigEPKVCUA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX3PbBEyskI+yY
 UoeKD/rGPZNH32TLs2vqtIZcl0aeK99N+XEHgcGM7jStAG0z0h7dQwH/R7js1abSIoDBKoqXPnB
 4YMS06QFQa9LOyzt3vZw81Ov/5T/c+w=
X-Proofpoint-ORIG-GUID: DKZC0fd42PKzJ5MKlv0y5BLaZPsD-I7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
The panel identifies as CSW 0x1465 over eDP AUX and is not in
edp_panels[] today, so probe falls back to conservative timings.

EDID, read over the panel's DP AUX DDC bus:

  00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
  00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
  0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
  66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
  4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
  53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
  00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a

  70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
  00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
  3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
  00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
  22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
  04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
  1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90

  Manufacturer: CSW
  Model: 0x1465
  Made in: 2025
  Display Product Name: 'MNE007QB1-1'
  ASCII String: 'CSOT T3'
  DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)

Datasheet was not available, so timings are not datasheet-derived.
The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
entries already in the file.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index b66751df502c..29f250e6e64d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2141,6 +2141,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x144b, &delay_200_500_e80, "MNE001BS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1465, &delay_200_500_e50, "MNE007QB1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "MNE007QB3-1"),
-- 
2.53.0

