Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5A382F15
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 04:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991372; cv=none; b=ip6KW31rq7Sw4fn+ZVDmD2njN2ynZ4LCQRH+sCtsMDro9O3csRAJ1t7TsnUPxx2bocb05gC2fjkut6ykDu1KNU565F4mQaPJsUZ1QeqHlb/fM8sJSCImGdgKac/AGTNp6GpQKR42LJXHG/aBGPzW27lcxzznvtI2OdzenY7v1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991372; c=relaxed/simple;
	bh=suOz/Hx7XUoXe4sS9JmcD+pnA/MA8fwNnKj/ilaZHZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcTnHHuiTYhe80obxL5aaKlYLYdu84p/Bs1IwlfEKQp95L4UHAYEKJi7k6biHXinUUIBybM3boHwC42O28Vt4KKdfLJpqcneMktjJ2jEGumnCMmod25VQvvf9U6h03LW6bCi9LKGBiJdXtrTbIYv3M5cuSRYc8X3MezU3FdnMpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXa8vCWm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2kkXGQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXa8vCWm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2kkXGQc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763x1UB482471
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 04:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2i4Uj4137KW
	y44soo5k/hNh4LVeKysh+1efT4S0lnOY=; b=cXa8vCWmhBMHedHJ9i5NLPuzQ/L
	pZBGNdjsolj8i1Ealyh+p00B2a8aBiW6kFAkxK8B6yXhiIj3ViA2798ngX+IIqmY
	DlIzociM5yNKunNCYqEfAp2sbZAl8tXXkDkorwLallXMQ2wMQFZogUIM7woG8lsS
	OLADrq0pdjCrEBLJe45XRJxHBudg6K4VjTXgpPy/G9dHeYoTm49bEOBMFuR83c/o
	nkYeHkXnszDNmVDioSWotbrYp4T+dMn6b12FByB2OBSVgbXNbevuvmyO0lt280Fr
	oBkXiGdWb8MwjtWhM7Us+ePKOXu5WBzWbetBQOOk+xJ2QS6nXswMhMCWNGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueg462-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:42:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3521896a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 21:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785991369; x=1786596169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2i4Uj4137KWy44soo5k/hNh4LVeKysh+1efT4S0lnOY=;
        b=B2kkXGQceo4Q3qcR22rcC/XHNvYy7wNYdpNammO34FRMkpX8gn8z2oVXUCNb8Ho+Uk
         KwMsFydwD81Nhl73LNwInhGnDHWOan1LSAvo/ZGuUlaK1P1iKHnbBxdKVklguANEZhf9
         r7+RkmBHHF+4l9Yep7CXu0e8d+iHG7qQuN563gZi6xwIsXWKzr0kUO4p+q3rrYPc6iQ3
         uL1BnFXlM7mOeEtswaz+JIds+KWea5lVuj6gCgoVpX6Yi+uV+UWTYbL+0NgNsAmx/fvL
         PLc+kCge85KzkliWNB5UJeX6PATqDLZVJicIFYv3oiPXGGSHubaXtQUIhHVzxB1WVh/A
         YDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785991369; x=1786596169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2i4Uj4137KWy44soo5k/hNh4LVeKysh+1efT4S0lnOY=;
        b=LDngHibucUsU9xM1GqkcYY9oc1pXajOXpYyKaSjj4ynz3n6ikI3JS6+U+NutxgCirO
         14RivnS9Gbx1IQQcPOJ97LUZA28kdylsBVK7SI4gP3lUamF4g/dE1hSJrg1ksg0LTi/Z
         icCrG52IWT/kZ1XOdHaqxhOW5f4tCPnLrLtEZBBFLqhhg6Rl7cKqcPQOgJ8KtPpMWY0J
         Pi3oUuz1S2pH3196PyJnIGbsx/XR2swoLu+h7JdN/ZIcLIqLZTjwXl7ZzOo771Rad6Ga
         HnVRbXOewpzcZs0RPUAcwHbNmTvxL/VMLlh9UEf0U+tcy06Qyr0HAFTbhFqCiAprDZn9
         WrEg==
X-Forwarded-Encrypted: i=1; AHgh+RrCwgHPWq+z+q9AIrxv88iE0MlPtndhxQDSoeNG83qaUYp3qzrkpKU4ROcPqY2s+peAHijc6DI580mBSUp4@vger.kernel.org
X-Gm-Message-State: AOJu0YyUW9LgcF+U6bLdgBQxPF2+gwxWKKBmdaHBU5xLCFd0NI4tSvTf
	/8ltiIrM2NXPhcpzkYmPtenotCkYRclhHJfnDVD0YWZ0z6Hhw85O1e9IrQe3Cj+VqQx/4jgAKez
	MbNGdNpczd5oZX7KZr8avLvQHV0mJhIEdjSxEFIhvNIGJ+TKHlmXlDj6Ln+uAnpNxw5dp
X-Gm-Gg: AR+sD11DQc4WKLP5NuWKmsDCpXVhQgpWEMB6OcD7HVHzwF+TCpLlPhLhkiDGofmlj2j
	ZYxjL73i/mRdf73yaiFIWY1sQI4tITqq/2csqn+Se2GMYAya4AeTSxxAt4wOWo2i1Hxsjz11300
	FxqnvE9WBSbLNYeFk2DxWw0eXGwLNS7drhYllB4T2SGZ3i+wnVt3KOVufKCLHMxLw4W9+rgjngD
	cmrVH33PIWwskAjPfiwJ1zUjKPsDvLqo49kHLDK2Av37wpBNaC0GSngeN4Jjpp69QFXPU8BUDPR
	GWGSJ+XH812OmYORGSBK6WxTBxCtn7wkuFLiR2SR8se5v66MdKW3q99BjXtHMF559l+vsx3SMbm
	HM8vJ4KwjA20fEXpSGZf02DIXN0LYtsGLnqFZUnrcOoNgPAR08JyXNaQtEAR6bWhAkdwisEWevx
	3GBUzrG9Pp3nwsft4=
X-Received: by 2002:a05:6a21:329d:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3cb85ea6f8fmr12556551637.28.1785991369552;
        Wed, 05 Aug 2026 21:42:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:329d:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3cb85ea6f8fmr12556503637.28.1785991369071;
        Wed, 05 Aug 2026 21:42:49 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm32643473eec.11.2026.08.05.21.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 21:42:48 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org
Subject: [PATCH 2/2] sched/cpufreq: Update schedutil's DVFS request to reach the boost frequencies
Date: Thu,  6 Aug 2026 10:12:30 +0530
Message-Id: <20260806044230.909961-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a7410ca cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=uMDrv-Gue8sy1whakgkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: y3kGb9X33eWOtfH39C8gfybyjstxk5Jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX9iVwYUW+C2bo
 S20QQ7Xb8vdPd9thDFR+b0O8B/99rzCFEn2ytkfmiOvOvwG/PtiJqGq5x5ynvUls8I5UFP9cNDg
 3rcVS27t6tIYO6J16t0Dg4BGHaWeGkissCVWnVQ4a5+GHZ38LErpzMtaosUwjdc4XCC7viZABj2
 9fYs3hgbmrJPT3hQmeTepxx2Pahbov/jz6n1JDamKrZ7CwTjvvVMho9Z1CUvWKhHs+/MiSfPR7F
 Gbp/osKEoSxKBwZV/qcWcMcyXmd13h+fCB2GB8OgPmZs6HouZqw9xEzYiYxN7sIIsVixIRKH8XX
 Z2tg+lqNkBFFREPxnJJPouYUQ2VFeyCVl5PbvngqSzovuuZmAb88+di4HESRrOGV1P5RNe8INhm
 4Tl5UFefTeQqiLRLgSePmAljFOGNFF4ewgqRPht7XuT6oGMtJLbSFIEvfe9XO+T8bkMdeknrqM/
 cL5ozojA10XlrC9Ofag==
X-Proofpoint-ORIG-GUID: y3kGb9X33eWOtfH39C8gfybyjstxk5Jl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfXzYEtnOnd3qnv
 8Km/P8rE+yr6b7Ccx4mbTeb6PpJxJ8gyweSUEEfrwQTBA7HsuMM2bT0QpESAVx0dHZfbNKJbwrW
 OiBk7k4uBucr6Ib/IGnB8/FOqAhUe2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060032

capacity_freq_ref, exposed to schedutil via get_capacity_ref_freq(),
was introduced by commit 9942cb22ea45 ("sched/topology: Add a new
arch_scale_freq_ref() method") as a fixed anchor that does not move at
runtime. However, schedutil uses that same fixed anchor as the reference
plugged into map_util_freq() which saturates exactly at capacity_freq_ref.

As a result, a system with cpufreq boost enabled effectively never runs at
boost frequencies under schedutil-governed load. Fix this by plugging in
policy-max into the map_util_freq equation, so that the DVFS requests
translates to the actual cpufreq driver ceiling.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 kernel/sched/cpufreq_schedutil.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index a1782755efcc..dcefbeaa0702 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -195,10 +195,17 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
 				  unsigned long util, unsigned long max)
 {
 	struct cpufreq_policy *policy = sg_policy->policy;
-	unsigned int freq;
+	unsigned int freq, ref;
 
-	freq = get_capacity_ref_freq(policy);
-	freq = map_util_freq(util, freq, max);
+	ref = get_capacity_ref_freq(policy);
+
+	/*
+	 * That fixed anchor governs how utilization is interpreted, but
+	 * the DVFS request is free to target the current policy ceiling.
+	 * Using ref alone would saturate the util->freq map at ref so
+	 * use policy->max to reach boost frequencies.
+	 */
+	freq = map_util_freq(util, max(ref, READ_ONCE(policy->max)), max);
 
 	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
 		return sg_policy->next_freq;
-- 
2.34.1

