Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364113;
	b=0Rpjnxl9qF21hzDdWporHubnvcEcEez3UazUokr4SPh+IEDIyv1mxkupxmuvabIy5TIB
	 biMfmD0DzsT+5Uz2seYLtaYHCGXDC9rGB4s8c8sRIL9yBNH6D/6G1GLUqmk6SfaM4ARi9
	 Izrm8y+jRF6fYhPU9XY0Ia9Ydk2eRhNBwqX6HUgYhL2nNfBy9kblF0jXyewmshUEYrQbV
	 RaduUsA1NffMjXcvZU5M4AsZB7VvwnFD7azNmdh+tPUR6TsdkN8u7MDy5cUTQpsf6IVS9
	 ZH2xdgYXqHRLMrHjqcdYMYxDlk8hx5ErX3R06asmWp6VCWp+YUlTrPepxXK80/U9ycA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bo02fidDDIi7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=;
	b=vzSAAto4zx1AyyBP0DxC8Rm+BnOW78DVCnguaKy1mzOlMCgZ5zkU0WcNgB7/sKrv8FIV
	 +mjVLNHVUlvaKlRtLU61JG4zf3WKu6G1oKEO+X9tdj6ghRHtGW/3BwN1bHIdx+D3yrKUX
	 PieP+O+pxhRNSHy9ebhlt3HL5aJImBb6/mn8rkWPWRuxppjunmUgZpS69VPOK8ycDPnaf
	 8kDlcaDbbB1TTGo6UofVqXw2MZ2TP7FSt9eTAgvDI+PcTUmh6k3tdG9pI7706PP1LIev/
	 YgvSuChhu/xG2feviXUGQNtE13VwMdmPOvnbHQRjUe5Z0Abr6qW9jMvc9h2mr7FDKrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p87cdvIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2iCHEJ1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06060A260F
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A06060A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p87cdvIq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2iCHEJ1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQIw03852905
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bo02fidDDIi
	7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=; b=p87cdvIqybXI0n4gJ6juhr9il/p
	+sJZaH4gxKUDESdvZ7ubhX1Ol2ritoQf+tuvO61R35iudkRmyfIr3Gk9vLngLfyK
	A8ISw9OWl2mt9/QD5b2itjQPCYgojiqpPkuyt7Gv3EciT0Y/HozYjvN80hVRh9Hv
	M9dbUjSr1h3sGRUX0Cub6vI8XoWhDwWdtzR3pwnJCH/O9P43HVSLu2vgyFhq4e6t
	/x95gO98PNdGJ77fR0H5eqEp9oNDrQBsVisfku3v7wFVLEOxSbk7OHgCvngbHm73
	xdLrd2VlOdLdREYogcrTc5MYxGUtGHzMesyDCNpzkxflHmDvppm2GzwuQ5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:15:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so431814985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364111; x=1795968911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo02fidDDIi7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=;
        b=R2iCHEJ1EkCxmZ2fKgDcFycXtVNyZ+mF3ZvP9CIYL/4GIoEfFCyaUm+yEoFBssZ/ry
         RRgqJAyQ9SXI95uBQNHyVR0zHOq6GU1g+f5o7ANflEDZIa6/DB5y3PYi9SXcuaM6gQfo
         SrNKTwixVpI9MzSpZ0JDQkYqM3Z8bdEBD23A2QjMwv0bAm2DsdROx1GECoD0iafq8UgA
         YmCpjL878Ve5iXHbLkHyVoX7Hb1xDXqcSqV+8PZ/ywUnHTy5MRa0VOYxnRuaDN9Df8MW
         BuUygHlBYZgQX4j7TR5HNp77x3HznXTuICtv2zMVSp/4s7hd3A4UGCBu9+L0M8j4SbjS
         9hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364111; x=1795968911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo02fidDDIi7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=;
        b=UcvtWyzC9J70zvhssFRCuDUn/VXeRMV25o2LKQkboF+v6lCcSDVbQ5/Iw1yu3yq3+O
         /Tj1e8u3A5d123DSiroTHCIhktlYdFtcBunTGpsFvdHH6m3RkE3XyO0/PldIqmOsRiDJ
         nVUfvEFfmS1XDQIoZNYz2AoEA3I627IDv/a9KRVv5l2kl5S16tHseCTRW+unlR3jlIZV
         cpDfjT6nexv1u9cX/ZH9SL8Aw90Bup7iubfXIL/8NtVfjW4EqS/nJFm4qrRohxQqVXZ6
         8HP51LQTYj3CE1r1SlRyo1EGFtfaH7IprTW+xYq91pdzQqZzDTh8hjTOaK7FBOnPm82h
         uZTA==
X-Forwarded-Encrypted: i=1; AL+hErE1homEKZZredIXeBl3nkstGJTcm/anwP0w53s4mjvUAlwC8ZAt5LRquyVGoZ9nQaInLSdEzOGM2t9Q/XK4@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xvzvyx7MORP9ZC5TSt/NwPwtGJIuR6gqEOs6WrL73928R6jee
	z1TbBI2sdCEqDkGOAMeA4zSJ+8/9zT8O1yHxw8Y2b5hqYTGl0CNVLgHj5KhhDz6nYRuXH3dFVgH
	ftVEQJbMqjZPMXnVRmh7eDlnJQ3H8VkSlr+WVNjEPUBTudJtJwGRbELhJ/8IORVh3gynl
X-Gm-Gg: AZFdTZfz5n3EXiUr6zrcYgNGnfLAmgKji2xxB/KbQomKimPMVN2Zk/VxoDQhbF+AWeQ
	bxl17+IpSAriJxEv0KZpdZCDDba4OpkgBdvL4iDNry955Nd+KSAjvbWzCn/+j95tDR8REG1e0zJ
	S+EIfYSM/bKFqU5+/o3oBPyr/AcK/iwogw1YpNEm8uK35/kZ8jmLxIxWfJxkIRLUjEX390KJVp5
	D+Pp9waToDnAaQ7JJ8kQBBNfQMFdmZL7E+ecW9FfjiCOR8HkDEoDNS0WVVxGLqr8XltYWEEpA2M
	z67jpVY1Asn6gPK/oYxFmuI5Q2Ki1+kS3Of2MPNANHjmcEyX7E61I1sWfMmK4+s1LqdQsAdDCya
	SbtqUYHfrQREkypYIrL677D+9RJ//s+Twn+rb/4QzMqfx/JmQW2xnjCxk0G0dEyPh
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr1728775685a.21.1795364110274;
        Sun, 22 Nov 2026 08:15:10 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr1728763785a.21.1795364109530;
        Sun, 22 Nov 2026 08:15:09 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 13/24] ASoC: qcom: audioreach: add speaker protection calibration trigger infrastructure
Date: Sun, 22 Nov 2026 16:14:26 +0000
Message-ID: <20261122161437.5994-14-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: dAFJWbxEzCkM5fJgVodkdaK_wZJq0ESs
X-Proofpoint-ORIG-GUID: dAFJWbxEzCkM5fJgVodkdaK_wZJq0ESs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9+OZGEyhvxjf
 MTf1UQ4OLT2QVigBbA8d27O+9TlMCKaDnXbCiMxKS1m2vF7uSm+MxwvnbPpWURmjl5jlIoYGdGR
 KJJpcAQEgDFYr2bSLXf5CtwOgZ65vW9uWL3roG7LDShyhWR8acrBt3UnXF08/z9FC6lR4T97pcM
 hkg8RrPxQRgpkfP1F0D0qBrvO3J0TzZq6h33yyOHkm50+N2yFHrWUtB+Y/y/2OzssUy/TWUqH8i
 k+yYHbo0MKO7X4ik/fC8uv6hRgJn/x65QGoAnY181aeuWX8c03t7Au7NsKSiMYF1P2keaZxIpUB
 oYpd/E6bWup7MI/Y+46adBnm2x6GVvYpWztrV/VAS64iVho2rQ3cNGkOw5Ih3P+ujvEg2DVia3o
 jezNnzQ64FRiWatpvr5FhykHOkUQWpbh1fY8RenRkjXivFRx8jrWGdy9S63d50J8FcOoJYWJ2P0
 jpkFkTpHgcff5zMRhZA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03150f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5LjmXOTvIIUa77iOKnEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6LK1zb/6e8MH
 Rnpfd/GrPKH228Pzbrk96YhgL7NGmcLP/807scyBn02ZIiZNq/53uUBr3PgWCELm8xjIcbtpMPO
 6MDo3g1VmzSBBeuizBn0tw/KfD0pQDc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Introduce the speaker protection operation mode as an internal state
(default Normal) and a write-only edge trigger to start a calibration
run:

 - sp_operation_mode holds the current mode; audioreach_get_sp_operation_mode()
   exposes it as read-only status for userspace kcontrols.
 - audioreach_trigger_sp_calibration() flips Normal -> Calibration via
   cmpxchg, returning -EBUSY if a run is already in flight, and arms a
   60 s watchdog to bound the armed state.
 - On the DSP reporting terminal state for every speaker, the mode
   auto-returns to Normal and the watchdog is cancelled.  The VI module
   path uses the current mode on the next configure.

The calibration run is edge-triggered rather than a user-visible mode
so a stale alsactl state file cannot flip the DSP into Calibration and
nothing can leave the system stuck there.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 69 ++++++++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/audioreach.h |  2 +
 2 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2b5c083b8ae5..130298a28749 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
+#include <linux/workqueue.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <sound/pcm.h>
@@ -13,6 +14,8 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+static u32 sp_operation_mode;
+
 enum sp_vi_cali_state {
 	SP_VI_CALI_IDLE,	/* Not calibrating */
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
@@ -1482,6 +1485,48 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+u32 audioreach_get_sp_operation_mode(void)
+{
+	return READ_ONCE(sp_operation_mode);
+}
+
+/*
+ * Calibration is edge-triggered rather than a user-visible mode.  Guard
+ * against a trigger write while a run is still in flight, and bound the
+ * armed state with a watchdog so a trigger without a matching playback
+ * does not leave the system in Calibration forever.
+ */
+#define SP_CAL_WATCHDOG_SECS	60
+
+static void audioreach_sp_cal_watchdog_fn(struct work_struct *work);
+static DECLARE_DELAYED_WORK(sp_cal_watchdog, audioreach_sp_cal_watchdog_fn);
+
+static void audioreach_sp_cal_watchdog_fn(struct work_struct *work)
+{
+	if (cmpxchg(&sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_CALIBRATION,
+		    PARAM_ID_SP_VI_OP_MODE_NORMAL) ==
+	    PARAM_ID_SP_VI_OP_MODE_CALIBRATION)
+		pr_info("audioreach: SP calibration watchdog fired, back to Normal\n");
+}
+
+static void audioreach_sp_finish_calibration(void)
+{
+	WRITE_ONCE(sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL);
+	cancel_delayed_work(&sp_cal_watchdog);
+}
+
+int audioreach_trigger_sp_calibration(void)
+{
+	if (cmpxchg(&sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL,
+		    PARAM_ID_SP_VI_OP_MODE_CALIBRATION) !=
+	    PARAM_ID_SP_VI_OP_MODE_NORMAL)
+		return -EBUSY;
+
+	schedule_delayed_work(&sp_cal_watchdog,
+			      SP_CAL_WATCHDOG_SECS * HZ);
+	return 0;
+}
+
 static bool sp_vi_cali_state_is_failure(u32 state)
 {
 	return state == VI_CALIBRATION_STATE_FAILED ||
@@ -1588,14 +1633,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 	}
 
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
+
+	/* Edge-triggered: the mode auto-returns to Normal on terminal state. */
+	audioreach_sp_finish_calibration();
 }
 
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
-					 const struct audioreach_module *module,
-					 uint32_t operation_mode)
+					 const struct audioreach_module *module)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
-					 operation_mode);
+					 READ_ONCE(sp_operation_mode));
 }
 
 static int audioreach_register_events(struct q6apm_graph *graph,
@@ -1639,6 +1686,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
 {
+	u32 mode = READ_ONCE(sp_operation_mode);
 	u32 num_channels = mcfg->num_channels;
 	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
 	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
@@ -1662,11 +1710,13 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
-	audioreach_arm_vi_calibration();
+	if (mode == PARAM_ID_SP_VI_OP_MODE_CALIBRATION) {
+		audioreach_arm_vi_calibration();
 
-	rc = audioreach_register_events(graph, module);
-	if (rc)
-		return rc;
+		rc = audioreach_register_events(graph, module);
+		if (rc)
+			return rc;
+	}
 
 	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_speakers);
 	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
@@ -1690,7 +1740,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	/* The DSP calls this field num_speakers for the VI module */
 	op_cfg->cfg.num_channels = num_speakers;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
+	op_cfg->cfg.operation_mode = mode;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1781,8 +1831,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
-		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_CALIBRATION);
+		rc = audioreach_speaker_protection(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 9d9449062b83..baafd3bcd0c3 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1114,6 +1114,8 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+u32 audioreach_get_sp_operation_mode(void);
+int audioreach_trigger_sp_calibration(void);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
-- 
2.53.0

