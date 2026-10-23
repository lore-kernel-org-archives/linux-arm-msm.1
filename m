Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775617;
	b=Ec37RyTD3+AhwTERKHOD61rFHbEV9sXZ3iWIqSgbj4u65K2Geo5PcNzCMJPyQiqeaEHn
	 gIWKQjsMiHkVkSmkTyGzktY4C/nXmcqUxvtva5+/eW+16s77393YIfhOI4A7iAlBqjEbi
	 7yCwzMu1d/PptsympkDKgD0ENq1PbrMvh0TdAoSSVEGYXBnIjBW61VDw7Nn7ClIIXp8gR
	 WICT+Z+IFXMFyRaqvODSbN2MkkIbqmG4AV//02X0QOrJMOTD0BbvJH2IV1xtDcAgf06Xi
	 cgx100+BOPXanMVMCIkSTgSKSFhr73QOCwYNqYyVNJ39kEAv/IZHGE78J5f8BX9YvdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
	b=pjPhLr15l8Nv1TOCtNOSSw9/uWQ5rfDVtG/a88wPOeN98n4AML5KscsBd4q1vcRqmp/0
	 adqc7nK0Yp0ffvR12+tk2Lh7Ts6pZinNk2iVjd35akqDtc+9yFHTu/jGNUiZAC16CtPOb
	 ADKwHwJHplUqdUomSFcptejsnf33wM/vSU6M5Upg7JbpGeEx2C1otkJMSsbGzE4cXUQRx
	 iopUcGkDa0/5vc5t2NdsZ0NXhRFAyJI1klmISQ9p+5099T2Uw5bN14/lfvKh6V0n8zmci
	 jM823dDzaUOYDFi0Jg4ZXL7aZvIrzhx5/XKmWsmbXd7JDFaf1z8adoAJQWUimbB52PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPeE9K52;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNgySCA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439EA606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 439EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPeE9K52;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNgySCA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3uXl3812384
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0RaoJf1quXY
	WRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=; b=CPeE9K529Dr5esSobebjLOZOJmn
	lC7XXPUB2BhZt8WFuvJhrtNQLzNm3glP8Lpdvcwasg6vfan8GbezAjEsj4gcbxpr
	qS2QvuPvrJY1zwFrvQeRNDzQLsgHXxycCQAGo0HGYlfp8/XC8AFs2t2Rtd9QQeE+
	wLXlHCmnCVt03gMhBE+qHTLqNuuvQMEuUv2XdNDjTHx+PzQ0UHo2KpxByoncWlL7
	e+iBRwfP37yaZHHym3l2HQSsNA/yBZ/66koZ0D21s20eLt/OduPHLiDP2oldZFN0
	sCTgg9DctvSgeVolatlJU7EsZFJ3BX0tG3Hlads4JlfGadaezQZVJOGHrGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas888jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so226133985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775614; x=1793380414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
        b=jDNgySCAGDqPFOm8WeJw/bnsGCKYAxZM8As1HC3sVfyuFB2FP4TMkp6J2Z3tcZY31d
         OExh9NnHxkZPY7AEOlp+nMbS2vJQqfTvLlzxQ38Mr971jVwTIgtIzFArlZlEK/T3lp/+
         Bu1rQlHHA43W2Iijk684jYri88rTP5HtFsujyL15Yz4M25n1JyUHABCE6p53DgbWmUVV
         29gD6t1tBeg6Xh0QQtzUnPn1Utuu+0onMhnm8SOhNW8s+NUnRWnNivNAXK72MLP8W7aK
         G4AcBqxBGSQfsRlRQZ1fSucoIoRQR7O7OqTiFgTY+mZRBfXxc5+JuR3sgKlVyUk8ugFR
         QERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775614; x=1793380414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
        b=dYaVyFbnhFJPXH958PvJb5ZyDkaa9hcgGKgYGkKbkfIvHni+WyxgOrO9Y+G8iL9QFP
         ziiIqsjCwmaG3snZ8OSsjYTeHDjiytKYvZiMGNgROOqxj2E6yR57CKl0qx3L3FFIx0PG
         4xwKEr1fYirCUdonpO6gHwdy9VakWVpyap9cKIUV5UkzusheuwIYsRBYSap/k7+1bD0S
         XuYmNWtlRdtrzHnhcchwQWKKKg9Mi8fVMj8qmVFNfofvRjyJ7CcpWaA+Vlf06jBTJwjF
         r9uNi304xlqDr9irDNL4muatjBwGlv/I4GMs6UjXnliO3v3Pm65Np6+LVGCGZ/oCt/2Y
         psvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSVPwJvs3WnDqK/7Z7CTAAsYlmOLu/FrZ/pcAao14fT2PzA/0YqBOa/PO6FTCsypibBx9ZAOIO7VJ1WSOZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJQT/cE4gQoYcVhBlcZbHkGjGjYB2ZX4IppVknsjid7+W0xhq+x
	n0KKIz4Nd9fJ5g7mMDctL0MZgP+WhytJK3K17iZ4yVn5MpO5sgxwDQWdK552qLEN12fKoEY8Ujm
	IWovbrBd3FG7b0Man4l3kmt+yz9dTiYEvvhnW5m4ZgxUM7n0m89irk6iXRyBj6Cw9gHpL
X-Gm-Gg: AYBFou19jUl7I4lO3Gn7lkJzFm3cJ0VkUYo75SKgaqiArLJREGlf/BMnkrDYsABnCrG
	O0FD1sx0LbdiI5rfmfjIiooPBhTo2gWsS6dF/IsuGnnyrQN++LmFmzHZXfmAEsbwhLnAxgfxfpZ
	i8A84Lqi5U5Ir7rSWKt4YDbLabWm6b/Jyp7NOBakQ4+I8QycHvXUeFpsHDDKNKL9k0tqjaJ92Vx
	A2gNDWXstnf41rV985SqoVjIqwKBeWvH/utTG+HdaxTgP/ksCDaP6DYBP+XDvEntbTWvyMh9GUT
	iMEKzyhm5ROB6Kz5egEWQccZYJQFBJb9TWSIRHaMcYZZQS90kP6+GAAkA06oI/mw3+7MBaxCbMJ
	hWfS6nfHGC1go
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr963959285a.2.1792775614095;
        Fri, 23 Oct 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr963954685a.2.1792775613589;
        Fri, 23 Oct 2026 10:13:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/7] ASoC: codecs: wsa884x: Accept temperatures across the full trim range
Date: Fri, 23 Oct 2026 18:13:11 +0100
Message-ID: <20261023171316.819857-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxrhBFKWil589
 Z0IzRV4QMgczmJYeE8sEFDK2bPBFjx2TbIxusA9678920XIRbciuFAN/Fv5oyPtEqo9i5z5OMRG
 GSfuBbtA7D1JjtppYH0wiBMU+s2QwQM=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb95c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KF22LIoASRNQ4hJq_1YA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8vv/xCuEJxsX
 x3HayyW9ozTAtmr23s0vnAX5rc5lCDxOy+4gACb31zzj+ClI1x2ytUceDNDmhs7N/3ikgKwzG7r
 h6u15C/ghwGNhJZqPFwEjdZazOgSe6Kmx0JpM4EEBlCg7xZnLLtXHCHB+1s8Isn1M26bVDsEdHq
 6NmHzHYZTimP3tVhMOh7O6exG0dNcBWxDbNj0UGkOV2IB5JRyTwCj3e3fPjn5HKB4615da9HIiI
 L4rxLQRdTI9yHWowAX/nFF8mc9E5BAssA9XXaSsTFIgqY39aykcNiK5QQyJtHIvkaMnSgS4LD/Y
 8ncq3062OY0tqlVcvlS3SXZm0vymC8tTegpXE7Xrqe9L+S5FMTsm8koOM5Edcwp5fREH7NMAE3V
 Jg7Bqtc2zYAYpZ2a6EmHwqc2sUFPjBkux7WS71Gc9PREwvFb0r77Ad98LMPq18GcOR+Yjlq75l0
 JFoJPp3+WvOtJJWxRZQ==
X-Proofpoint-GUID: P-nBxDhUD3ucrpqToSldKPF0kVehdQ0n
X-Proofpoint-ORIG-GUID: P-nBxDhUD3ucrpqToSldKPF0kVehdQ0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

wsa884x_get_temp() rejects any reading outside 5..45 degC with -EAGAIN.
A speaker that has been playing, or sits in a warm laptop, easily runs
above 45 degC, so its temperature becomes unreadable when it matters.

The check only needs to drop bogus conversions, such as the all-zero
reading before the PA is first enabled. Bound it by the -10..150 degC
two-point trim range instead.

Fixes: 6b99dc62d940 ("ASoC: codecs: wsa884x: Implement temperature reading and hwmon")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a367c94bfb4d..f0857c0588d5 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -720,10 +720,11 @@
 
 /*
  * Device will report senseless data in many cases, so discard any measurements
- * outside of valid range.
+ * outside of the two-point trim range. Do not narrow this to ambient: a
+ * speaker that has been playing easily runs well above 45 degC.
  */
-#define WSA884X_LOW_TEMP_THRESHOLD	5
-#define WSA884X_HIGH_TEMP_THRESHOLD	45
+#define WSA884X_LOW_TEMP_THRESHOLD	WSA884X_T1_TEMP
+#define WSA884X_HIGH_TEMP_THRESHOLD	WSA884X_T2_TEMP
 
 struct wsa884x_priv {
 	struct regmap *regmap;
@@ -1929,8 +1930,8 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	dev_dbg(wsa884x->dev, "Measured temp %ld (dmeas=%d, d1=%d, d2=%d)\n",
 		val, dmeas, d1, d2);
 
-	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
-	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
+	if (val >= WSA884X_LOW_TEMP_THRESHOLD &&
+	    val <= WSA884X_HIGH_TEMP_THRESHOLD) {
 		wsa884x->temperature = val;
 		*temp = val * 1000;
 		ret = 0;
-- 
2.47.3

