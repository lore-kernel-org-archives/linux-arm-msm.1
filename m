Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775619;
	b=EGnedZ8Kt+fg+e6BaWxIRpHekuYo3o3xfalwdzikPcqR8rknk8IlDXPKebNXVIk20P0i
	 4vRSttN7u52llQuPJll4Rsj/pc+mwkCuIwzb1mMHxni1IkRbj2JUjD3cVS//tYKDk8jOA
	 JK0fPaGCTp/qiZiSC8aNEHnPeM+GnzhNop0ymrzlHMZKc2VhjQbkZAMShcqeDSZQcCOoR
	 nsEVEIaZVu3a9JG+UsNTJ4Ed9TuSwEdlkBesFso0ga+Vnds8jiuTbhuam5tizo7ej3p8R
	 6LzhOX6FAVFEFcrg2AVcsler6ag/rpeQdMhOOLC2qhaTkYgNFA8nXwSb7KloHb0fJnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o38SHGbZ6zgVNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=;
	b=xnYBBacRNFdotMj0CU8tKhim//8PjZbTqViBmYPmTDx0lr+nxXEckYim5n4W8ocfkwlR
	 aGgxteymz/EMjHQtxajCGnxnVGMzIy1sQ4f5FJLP/Y9AsEuh9OthOsD44T5NEp7B+OPIC
	 vGuzZ5WaHrDNBheLXtxiaC9VlvElcjNWxYGKEIpxGbNTmi/eMJygaeWVcgXfijb5WUEYl
	 pB9gVobHJIdJ4Mu2cXRa12BxeTDyYGZsth77MFCksuXgipG7kcWL0+NnDYFLZUlE7GxU5
	 XGTF5qdceVv62ABAsfSnw0/x3fqykm0QPVk+Y37BOjqBlfJiY9oTMKKH5J3Sw44I74g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0+R9SR0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gldlTce8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849EA606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0+R9SR0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gldlTce8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE60LU2109421
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o38SHGbZ6zg
	VNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=; b=l0+R9SR0OTreDR/I0IQvUgOwyPm
	EFuLboXhCU4myF0BHYec0m0OtcxP0Iul/8+mXM0ahf81ngCB2hNPgpTFKFfcDtCS
	FVHqWJJgL2xYJZVe7ARlf5oSBMcjIp0CU3VrEzrfM9D1FztP5OLd5Bz+9o8JhT0+
	3BqWhjj8C/fW/R2LaExQ5iLI3ZQvez2xdPkm3zaLERSQGo4CG7MIsUkK3wWQ7+nh
	kpykiD+zWT38ErO7m0i6IbsuUvkq8uSkfhBGwe9Knjxt66zo2spm75Pw9WvV4eH4
	/7l5dhWmb2+0J6csmtgxANyoc4KHgKtNjhkkMSNivu+H/Avb3aOfuMFiYIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4qb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so201066385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775617; x=1793380417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o38SHGbZ6zgVNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=;
        b=gldlTce8WZZFWQBu1OCw391OnzYez1fHi7gTCevnJYC0DMnrLYh6+1MxRo1ReoquU3
         7b9/dHWU6HbTTUsMefJbYHO7bNTt7Qsp/wKVF4atkiSfTOh3VnZYJmw7Ed/GmE6RB+y8
         KvPF+kSpHEbZtWvyj+NTYeTOVpFrvTxMdd6Dzjko8RUru7h8k+zp9rbRYeQsDXMLFtbC
         KF+GnWTAb5SyQxQ0QT+eg4fqfpEBv80PNUqqLHjnCJYu4UcmYUzeB81Z94nI0Hnqb0/D
         enM03f/Tkc52MefFKupYVQsD6JFAks8S0nFW20IW9woxy+knVRw4F8wv77rx77XFMaur
         cXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775617; x=1793380417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o38SHGbZ6zgVNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=;
        b=ZDx5DjXuSM+R4WqdWM5SDlINbT8lZVHYmG6hE9UW8vbLBCP0X5xkZTvo6syDG4x7bW
         Ub7F06sAaNw5UK+1reJ8vsDFC2XXVsZ4BpTLSDDAbyZjsotPoL8dPQ83LRAEKSZOU+2r
         wEleLPqAf2cOw1OwTZi3voBl4EIhQAqvPyE0dQ27aNTdSxBZgnalJ3gr9ZzwDOQvXJ3W
         sptwYgLZBYl2qR24xFCns3S4BFDnkLBDU4MqxVMDcKv5o4jsNRRrXGnBNqRzVTXlpZzs
         0smXSxmP7F6qaomp7GmKUypvKiM0tiAk0dP8oUIrhm+PYiQp5NMyv6YR9RdnSHINtb7u
         1Eyg==
X-Forwarded-Encrypted: i=1; AKwUvBxsez+eGKyKvFPPFiMLtfzPY3rmpGI1uBFqU0QmsUwiXOR5hLCH56Ts5NN0C3Zr3MDrbcnAJWVQ+xvK7ffS@vger.kernel.org
X-Gm-Message-State: AFq9FYJCQdR995X+uYMW7lRRZ7H3tUf6b0/So0P9/POvU20IdK59FEvI
	/pmiXyL/iN2MEqlPD6Jcklc0OHoLXujENofCG38vQ6jCxz6ElHrxKl+/nsb3hZG7BQTKyhBE2Ub
	d93UmC5tmqVKjC3CpijZlBvApAie6KSksZPW81vMWcjs/Ca4Q7SgXXm1KBwXP2GY2vyHh
X-Gm-Gg: AYBFou1pT/53TzxdvARXCa+TPbeFL8MgJAiKT918PwnjFLEmOUORzX/oxRpoCJ1lBAy
	VHi65GGtEjksNGdpnX1Lrecax77UDQeYn/IA9IN+fyY+3WSqmsccC6Il+F6JZubIT/By1hAD2AF
	2EIQ8n3VO4raJgZ+5UkVV9YIzaA7LtNnlKZlGICXSh91zkcuis6ioIOttWTF/AtBM0nCcKtRKfn
	InhKq9njxlTSV1EQYP9C3r4WERq7FGPkbLFoqOGld5hjLwzfBisj0toysha3kZUxfVLft6AXITg
	a1WMV12vIowFlaSkl0PKMbyMLIJzgXNk7SaN7FB5LkOxAJNinBJFShou1QJlxupDST+9BYsXhEo
	Gq33yvj6x5351
X-Received: by 2002:a05:620a:4395:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-93f6f9ed474mr543865685a.68.1792775616800;
        Fri, 23 Oct 2026 10:13:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4395:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-93f6f9ed474mr543859285a.68.1792775616307;
        Fri, 23 Oct 2026 10:13:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 3/7] ASoC: codecs: wsa883x: Accept temperatures across the full trim range
Date: Fri, 23 Oct 2026 18:13:12 +0100
Message-ID: <20261023171316.819857-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1PmspkTQLVqY
 5PjbZ6Fi3IrsTcD+0iBR0LAGRBdmNgN5EqpWmt6wFy/sYds1ocK3XNYMT/A0kZpfCVXyjlBTxWH
 3Y0FXbRELJD4dwC1yWCv4H+JH3v0jIcBGklgV9TAIUWsA7vOkmew0LopfxQN89ZDS/pRv4Enn/X
 +fgty2VkFmvfbm/QnTFzbiFnvwtpp5RbiU1o77R8RUHH+JClLqsbT9WYKqTNPjGvIvCUlfJmt3O
 +gQ8xSlHJxqZ3/nq1kLyI2HoHBUGS2b4bkJjLs7MQyP/GMWHk69sQ7XI2NK7TqVd0ubl2HeRPuJ
 AjuatPi95MJEDpgXcfsCkvRmJi16J2Pn+r+MqHxRffrxIlzZnsU/mBT950J8AsV1PUcfO4mnF7B
 EM3THYBWIMvU1I1kOeOnYVS0+oyoHPRq7IKctBXbeDgMP9OGUJVPpYeaI4jUdBLU2tcv5OFnT83
 ojIpM9uMfZ0xIy8XcyA==
X-Proofpoint-GUID: fZLTOfi974tNeFlSn1BWGJBlV6IArdvx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxNrl3E8lZAG2
 GX+B5IVwHZHfliPczObWo5YbuLETGnpesmQXr8VaJ+3Pw2OHDIHQGvkzVOZiw2Qb2ZWmnYwvH8b
 wVyXBvf9NjaqwkHCtaO/Wma/l2YCbVM=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb95c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BDwgr6QAJ8wfB24CiCYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fZLTOfi974tNeFlSn1BWGJBlV6IArdvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

wsa883x_get_temp() rejects any reading outside 5..45 degC with -EAGAIN,
so a speaker that has been playing, or sits in a warm chassis, becomes
unreadable above 45 degC.

Bound the check by the -10..150 degC two-point trim range instead, and
use inclusive comparisons, as in_range() excludes the upper bound.

Fixes: a02c42d41af7 ("ASoC: codecs: wsa883x: Implement temperature reading and hwmon")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 442cf9f3eaac..ccd4404c1644 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -456,10 +456,11 @@
 
 /*
  * Device will report senseless data in many cases, so discard any measurements
- * outside of valid range.
+ * outside of the two-point trim range. Do not narrow this to ambient: a
+ * speaker that has been playing easily runs well above 45 degC.
  */
-#define WSA883X_LOW_TEMP_THRESHOLD	5
-#define WSA883X_HIGH_TEMP_THRESHOLD	45
+#define WSA883X_LOW_TEMP_THRESHOLD	WSA883X_T1_TEMP
+#define WSA883X_HIGH_TEMP_THRESHOLD	WSA883X_T2_TEMP
 
 struct wsa883x_priv {
 	struct regmap *regmap;
@@ -1430,7 +1431,7 @@ static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
 	unsigned int dmeas_msb = 0, dmeas_lsb = 0;
 	int d1, d2, dmeas;
 	unsigned int mask;
-	int ret, range;
+	int ret;
 	long val;
 
 	guard(mutex)(&wsa883x->sp_lock);
@@ -1493,8 +1494,8 @@ static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
 	}
 
 	val = WSA883X_T1_TEMP + (((dmeas - d1) * (WSA883X_T2_TEMP - WSA883X_T1_TEMP)) / (d2 - d1));
-	range = WSA883X_HIGH_TEMP_THRESHOLD - WSA883X_LOW_TEMP_THRESHOLD;
-	if (in_range(val, WSA883X_LOW_TEMP_THRESHOLD, range)) {
+	if (val >= WSA883X_LOW_TEMP_THRESHOLD &&
+	    val <= WSA883X_HIGH_TEMP_THRESHOLD) {
 		wsa883x->temperature = val;
 		*temp = val * 1000;
 		ret = 0;
-- 
2.47.3

