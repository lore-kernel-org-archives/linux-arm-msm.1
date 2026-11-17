Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907954;
	b=J9ca/q4HF/HDOEOn3qZtKWAESZkLn8rxWMKud3tq6D2wvdzVFm3psf/7dQukHtlQG+SC
	 tjZSnscQapxFzlaWNMkPnZQD17Ou3lr52utezoqWCFOxWmknTCeXZL5Yl6BSlr62UfxqU
	 UmatWXPsenuMxnwCVdQTZy323WYq2btx3hHeVbdzMuSGDMyL5Jln8T/uiZKDjkg1P1bZF
	 v7Mo3uP5N1sOH8xrBdVYBNqGFdmVQBig7njMFIFfj+IP78/brEJ0taXzeI9W0lTTdFksu
	 Qlac/m7LCZ53sLAX+bMLRg0IXXilqJ0m3cocqjJzp02O73M4Dpm2lgjFDOTDiPXiQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=;
	b=N+0DoEAofcdhL1QZIdyhFlgNJAOx7TlfVXdgjIi25WRgFMOI+MR4HQbRoX4aaqCfkLid
	 uRGIoGPGcabh35Dtao/khgoKFjPIi0TCw/B0qS4vY2wDClcHSBivxAyrkbsXmMFHuS4VU
	 sfSGu8V40SLoyptB/KvMf1K58hGFrYwCgimTpIVEe7Xa7EGeVflBGYtfks3rm9Yj3r94/
	 ws5eszI4/E1P/zPmUn2yQIm7yA7xrSq3jTtNj76hsUTHmL04DcsTYT52PO5/1knVpxRfF
	 7YQDz3U/NuX0Kzox9TCltngTk5u2ZhYvqpUqiNlEVu/Im1QKoHMxeViJG3nj3ayTfeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPxwQKau;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9pmi6fV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36581606A889
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36581606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPxwQKau;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9pmi6fV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f6FV2998730
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=; b=ZPxwQKauFs7WJ+4Y
	EMyRHC/myb44S9B132SesqbUeZ7Mr+9zbODjeFUUhtTLhcFZEqghODfYctZiWY4K
	K8hQddKPu3OU7r4q+mSZY3E5l+BJLCzj4ziA8PXiAETq3IZ3fvWdu58j+YH9GnYB
	3SiUY0qxgCgMNg1U/wDYNtNdFg568+4cyDa9yQteAbeDExbsWDrXP7xt5HEPig7R
	QLIv9nsS34lammcc0fNthESM8Y4w3oJP7ksvc8SskFM5xd+sGxvhrg+qZ3AMeA1o
	OaCqSelXp5WQKNLKx2F9YGF4fo6jdCjq5RUc+pOzqxtX6CjoQGrDo2w/Ps+jd3bx
	MqA+bg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0pav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:32 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso3994379fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907952; x=1795512752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=;
        b=B9pmi6fVsFFYGYwnqBA0lWSugbglm3nX9DDobrRokxpBxUImHuVhnal5w11zKFkb11
         PZzH2nqbArvvZnwC5kEaXo4TUEx0dgZZ7VbGvFEdQhNPN1FtnINszI4xXMJrpPsEvUNc
         PepE5Reqxt9aV5rtVNV93bY7zXLt/QCjjNRS9+bivppQpnzPHlQ8wpzqrj789B7YynDm
         RyIepe6Qxm8MDo5biR93lGahoKp+Q23Hg86+1W56x+JQaTgv8NOoGPntNQkVrdM0wuMn
         tImx4okIFMVBXTiTQWLUn2zWaOh1w4tDBBqk+r4471d3yDu/f62Gd0hF5cNnl2gnPh7n
         Jerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907952; x=1795512752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=;
        b=xXV1XiOoOfmLDcNA/2QMELhsr3d67TQVwAZnENFsKGE15vtDFfIEFaHbZk/xUkDjeu
         wDgcQOZ1OkntaFA1H2x04Xcp2kyxnYu0M+yXEkM/oZcDTifsDYnWLXz5q0GsFsRyI/Vb
         i6plW9fwI347JtV7oJ9mRXXGIjOuMH38+guD8t5k/i1fkk3/vVAb/A204Ic+GTjwKu0y
         cMzLUlRxMK09rOPPsxpKNynvubXECCPpFwBkOEvDktpd8litl1HDm+PvAJsyfR9na6qG
         /zy1LGJefVIDZqNvNjCq1kxMAHIhvqRzyiQOsnYaaJp/j9uc5bu9GRiAhkbSCxxxzU7r
         2LOg==
X-Gm-Message-State: APuU4Z/uV/AOdD2ywuDjxBaSW8ELWZj3QrRBh2MJyP8Jka3Y50hPmbpv
	tDTs5wI1WIUHJdxUAP0iiifA4Tz5QtxmRKLCe06uaKo8gkkBSdIs0MnecXJxLoNO9LOQqtcKWPX
	/mWcrDv8n3LMFbr4CuPtbqsVZCosVOthRKBI9m4ozql4Vr7CgcF6a3RLxH+BmTd9wyd1N
X-Gm-Gg: AYBFou2XEA1aCdogj9fDfjKZl79kXR1a5D3jn3+r00kbL2Puy7xB9wn/K2DcXtjFeOe
	2ACESjCxm21SqwTsHiP1VN5O3I23N2AJE5BCF619jAZyE/aPDd8P+ptb4cY30Tkz7Ipiffq0/gW
	qAS0kEh4Eo63WvUKn9UDVLQuyQ7Tkp7Z/kEMrx40ZLqwWhfmHxP5H8lTmZlY8f8ZwPvD+N9UYWt
	HPMfAiZKlMuMPKcezgHZuFZ0E5Kh8g6f3nJLeHKiIp6PXX8MkoipuXKFAKXlYOEx5SNH9uqoyqM
	jRHdVjrv6FnX04D1P4Fi4nJ8eW2aPTBot3/xATtE/r/5KnOyRGEpK18G2lbwj7u7IUGuDqqO9wg
	QvOIUsatBw7zGHCVF7yW86XNVi7SpVm3RoJZc9GxS7MKI2dx78La+Jzdk74OjV7OHAkZ8hZRBqv
	5PG0xqW12ipRAnxlUcZGFz0+nm
X-Received: by 2002:a05:6870:c2a8:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4afdf4eed55mr10942750fac.59.1794907951649;
        Tue, 17 Nov 2026 01:32:31 -0800 (PST)
X-Received: by 2002:a05:6870:c2a8:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4afdf4eed55mr10942736fac.59.1794907951129;
        Tue, 17 Nov 2026 01:32:31 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:30 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 01:31:33 -0800
Subject: [PATCH 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
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
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-1-7a862240683f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=2942;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=bMmJtTuFOhspQ50/s2y2wIQI3rsaWPAH5XFVb9ltZa8=;
 b=5RZKvwuLTDfyyHFtUe+m8WLbDkFyGodk1XemXgtwcBiJQkYhFq+E/FYdTR4CXMLo8e4Qk8ekD
 y5UI9w5nj5JBMWbOO1BLavbfpwnC/qTHQcaA0yiq3rGfBrZzaqcxwbX
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX2R9BZkH1QWN4
 2K/TGZS8cBNUFngBJpsy2xiO6gTOE3cPFpbtPhLZfUyztoVF1J6c7s3lAiOWAWNpk8csnIleSXS
 KSFg+YjPK8XiFePgX67+wfq1EfFAkz0=
X-Proofpoint-GUID: QrjPCErWqSJwWWd74EEXrngtPK1OlAkO
X-Proofpoint-ORIG-GUID: QrjPCErWqSJwWWd74EEXrngtPK1OlAkO
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1f30 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kaEj7Wm-z18sYFa5t94A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX/jw5YqR11aVE
 E8wV0NgNaiRHuHWZpumBoA485L377iOj0yfLjnHMgSzi7KuvBTfC12ojdy6lPsZVaPJymuYUY6Z
 iHvVKa7Xhhiq12H2RLtCUiakufGNRdHtx2iXIF7sn+VveZ8qyUhwF2jn/MkAXBSnzZ8fuY8zNvT
 WLyLJ6O00ATCc1wBRoUL5NCdZ9Ge3a4VekXqZbq7pAVTymvEbWJyc832iHRFQh/8eaqMAGMSn57
 b7/BKMtAajSCcmTrgQ8eibzdP0aF6E+0HhJ82eRgNXuwtCoNhldCkX308Q2aXfE5PHE3TG3kZ+L
 RAOk24eFrLIQxOCiMaC3AiyFzsddwQ5nfQOpNJafYwM00ivdsz88mecTnOIxl88p1QxDwmfOOPC
 Xggbzr4Rn10K7JdZ5vWfaYQM1G/KmFEt4fLxU3Tsxeg0fXKPGvOkfwSOgLmdZ741vUZYleDBexo
 oV6PQWauJ+GQFEc5OXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170037

The LUT resource cleanup path currently treats identical high and
low indices as an unallocated range and skips clearing the bitmap
allocation. However, with a 2-step palindrome pattern, the high
and low indices are identical, which can leak the LUT resource
because the bitmap allocation remains uncleared.

Resolve this by tracking LUT ownership separately from the index
range. Designate the first channel as the owner of shared
allocations and each active multicolor channel as the owner
of its per-channel allocation, then track this ownership state
for both normal cleanup and allocation.

Fixes: 24e2d05d1b689 ("leds: Add driver for Qualcomm LPG")
Closes: https://lore.kernel.org/linux-leds/7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com/
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..e14a3316bf22 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -111,6 +111,7 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @has_lut: channel has the associated LUT allocation
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -147,6 +148,7 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+	bool has_lut;
 };
 
 /**
@@ -393,15 +395,19 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 	return 0;
 }
 
-static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
+static void lpg_lut_free(struct lpg_channel *chan)
 {
+	struct lpg *lpg = chan->lpg;
 	int len;
 
-	len = hi_idx - lo_idx + 1;
-	if (len == 1)
-		return;
+	if (chan->has_lut) {
+		len = chan->pattern_hi_idx - chan->pattern_lo_idx + 1;
+		bitmap_clear(lpg->lut_bitmap, chan->pattern_lo_idx, len);
+	}
 
-	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
+	chan->pattern_lo_idx = 0;
+	chan->pattern_hi_idx = 0;
+	chan->has_lut = false;
 }
 
 static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
@@ -1118,6 +1124,8 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
+		/* The 1st channel owns the LUT while other channels share it */
+		chan->has_lut = i == 0;
 	}
 
 out_unlock:
@@ -1176,7 +1184,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 	mutex_lock(&lpg->lock);
 
 	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+	lpg_lut_free(chan);
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];

-- 
2.43.0

