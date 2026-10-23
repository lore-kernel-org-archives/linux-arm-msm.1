Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769347;
	b=Yqj06Z5EqLcTnbJEi1jbr93kRCiwZjvNa6Fi3Ww7CNBIbAjGVZWMc3hAeia4OB7FSDsT
	 OUdswH56MeXOrziquyalDgTk8QDBBABoZUdWv0XJFg7s3Ioxr+FOiKnNkoNLBZeW6kLmB
	 KWitAgfIXfhme3CJ9wBq0i7EPoBAGCCQVqGUfnHxD/oIr33XvXL9pLEZFXo1iKDbFHmmY
	 bKEwdrK0mDGRs0acMgXHNlS3i6nQPkxHCjqEeMNpfp0tQcPqWM9RLN2/vpN7PA5+pvI2I
	 ca6ChT/+rXd/KtC5JOwA5smI0p2aNbpTDrN7cgCdTWw6YCZX8s5haQVgVhJM/dH4Ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
	b=qp5+NTPPEhzYo4mSI14+qqguBgUMTZepsPHU2L6JHoKGwgyXRNlTyo7t/wKiUCXLJnyw
	 XqCfwvyNUQ8IpMRAn970zjOie1w9iFtpRctPfAMTx/BcwHyVXNvcP8yLy8O8I+zy/6AOr
	 kxQsTZPBCkCkiOLU0biWVPs+EOnAoXycVKG0e/I+5yCFv4fdX8NzEq/4IUIsPFQNy4SXS
	 RidzG4TR9aV0t12e3Wu2lwkdZOU0xxjDtxPR0/3J6YSV29JGnqpbtpS8sXOV/iD5ExHvZ
	 kg5c9LPuNoS/cVN2QDNuM0Ki4w6H2XQGiuGohUsy496Ux4cvsXT7hzerSk8CP3zpGsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NA52DDVJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MT/g4f7l";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA0D606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA0D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NA52DDVJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT/g4f7l
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DTd2462575
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YsJQSb2B+CK
	DpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=; b=NA52DDVJl7tU2Hyx/ae74dxyyYi
	jcGBvlB1BbLrxheNUgU+eZM5kTi5ZaHVHIL49Dqri/987pYIus2A2YZaMcThc8k9
	k8OpZXGuC8WIEuMH91Ov+AwJFfD6RJhr+rGDMQF4BgNii1k1mRvUEib24lNqvsBZ
	9MRajVU25Z36a7TY08mUiWtIgkRXc2afBj6f8cGGFKvbODmwxubAs3xEeLQuN4zJ
	WbKqvlzHZ3K5rh8ZhvjiUJsUrrhN3/lwS8hnDlNHLtp6GDD3s65VRaHi3eHJIDRQ
	QxqfeDoNgl78zdIHdWKAJ02dZ61koWbgNv0T+k/KXOwiDNvjbhaCTPwOeTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvbrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso305050285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769345; x=1793374145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
        b=MT/g4f7luUw1xqQFYjPksQmS/jZ4JaLljRQ+TjnIiLFtOa9VNJIz1WHgumL8vEbaUv
         nEetM+9zSXipzeXgbnUI72zg6bo6eYWipR5g7hsrIhENQe9YXWFiaPvZXJgo+KyHtHsT
         CELZp10XRjSnoTCwl4muUJF54ckJguAxLIIthc643HkkqNpSMUEZ+kRjyJlWAUzPrHdE
         ESvOPqqLmrrJhtAl7LRsqE/sremIdVQi76MnArcg+o/DU3rw0TRLWEBLgfnvoF/+0ywO
         iDInnT9AaGY4nMaDKgf+O1PYG1o7DG4QhpqA0k5NbigFsp/Krf0sPS78QtwLGp8T9yDF
         27Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769345; x=1793374145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
        b=tCtVXI5XMOONxeJj5Urz5L2GTfAvCLP3JgN9nlfWd/uh+RlDziJT99Yk5P0iE1H9mi
         Ghxkyb1QQ8cag7T0g1cNB6awDPRKAawkMkzyRHzWb26CEQ9Oq7+oGWcIIJQIbTgYpMgn
         B+wllUIRoc4bEIZWyPxyuS50QffkmaUjYkop/l8g96rkRKRlS2AswY8piMcCSt7t2wbU
         IDYRrKO3LkGZchDf60MmffxqbtvqTtNeg2B5F/vhiW2VTL9304+ohXg1GbMMQhursJOL
         Ez1RLBxIgX5VvUpCQUiofCWzVqZlt42vs1EI/1jnYKUEuy66L52j4NKUMEkxtAOj1tU7
         RYpA==
X-Forwarded-Encrypted: i=1; AKwUvBzxGz55FBSXGcGDJ9aIdOSMX6qLSqM02afwmkf6F/3A9qGWqVDJgpGt7zAjEB0ncBs0UPYCzKLuuI/dwf5k@vger.kernel.org
X-Gm-Message-State: AFq9FYIPD9xugxMCebyTBy/QVWLQ/FVMmu+j+mOA5t1CqAOHBcq9tVj4
	eZ6JaNbJZLkoQOGa7RO5oAKzOOoNZLvTvK8FTcDPA+i4Qt9QOQYGBThsxdsOphgqVswgceGElIx
	qgttjSc/otQbv7mX7NPxsTWzkHZT8YEYfIknavDPP2g99t6UQCG+/lPAvrejEtMn/4OIA
X-Gm-Gg: AYBFou1ZkTlvCU8yrLtL/bHx0pSw3I92t1OkJaQn5QAORfHrs5I5xfJHqWIJZ1OdxwD
	7R0qCukI7yvkUO6Ak0r8cJvH9ek0l/3HaWlBaVZa7Gfm/RtOgbNC/seXEFvIWMpjipXLoP8zFta
	SIw5UkY/TCwqXrRDjx7axNGope7iRvE6SAejHh33M7u9wIv0gWuAjGlkv+9b2LClLtEJPVvtIO/
	Ms2Io1OUVDIfNr/HoM49QiXdwW3oD/mdiXcF0lz5hMCN9RuOuUv47sOsyl1SN1c5GuNFC1kIsds
	xr4GQHNOpza53xnSA9k8dwWk4bF8iqTpoO6j1nsoFcE3hAdGEGR8UsQHjk5B33q46xhnM5pB0SP
	l7CykfXZ0Zts2zqq+JwrJed+q
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr449465485a.56.1792769344801;
        Fri, 23 Oct 2026 08:29:04 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr449461385a.56.1792769344328;
        Fri, 23 Oct 2026 08:29:04 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:01 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Fri, 23 Oct 2026 18:28:54 +0300
Message-Id: <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb7d41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yH3Gd9U0UaHnWrszFSEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xtlYJ2dgZ6M1Vsa9ptYWpsMLX8qbvsLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX54iOrD8nam/G
 OmsDk277XowNgEGMZU9iZVQrPHt9RW8lCIS7X705btXAe9PpwPn8PJkpWuRPgHOa8Bpb1Je2OBp
 5wq8O4CazKSzChunJrWvMwTB6vJFxXLFk2InoA4uL9OVsksGVsK9L+ErURFxYgwTlZlhp5i+5Mw
 olXSQ9oQuyKngHmjLfPG9hqaMk2tF1l9+VzVNwDH29BGP+wBspsHaymT/nsew3HwbSLlU2521xR
 fq4NYH6WnexWQPrXDfzntIn+DP7gNFc2J5jpBIBxk9MxAvnmngpzx6ZWnLxivxbvqar5OjXBLCl
 cMBMSpkKSH3GPmHC7q6cU8YDRHb8SW29CmKA+ndf40XHRpPmGtCYfy/kOygnlIKFM0VYq5b2g0z
 KTUbPjDL75skOFYD9vh8TppG90wlBlYBGI+0KatAMesbN5qziVQEjnb+BPfHm7GTRyGSlCVrZqr
 FDDFEGYKLHpGteRVfjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX3UknVKH72Z7M
 n6TE3FfffRoSG68K2ouf8qYBons66HT165tB3bnvPFYbybpZf0V0pf76Mr1gRTObI5tN9w21RJV
 lObTeE3vcjn31mGKbuIQiPV7hVXLHas=
X-Proofpoint-ORIG-GUID: xtlYJ2dgZ6M1Vsa9ptYWpsMLX8qbvsLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..87096095b1eb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 
 			camss_add_clock_margin(&min_rate);
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			u64 min_rate = 0;
 			unsigned long rate;
+			long max_rate;
 
 			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
 				u32 tmp;
@@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 			camss_add_clock_margin(&min_rate);
 
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
+
+			min_rate = min_t(u64, min_rate, max_rate);
+
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1

