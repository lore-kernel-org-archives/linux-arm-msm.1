Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698F382F15
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 04:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991367; cv=none; b=KO36s3rNyiAvBflRP2UimM3tBiKGyIb+nyXXOe26StLCnlutv1rd01nhl2dkdyzntWNC+8cnBPk5jWpwi3WN/XIfFdrR/3wWmCj3L3UQ+EHuCTRcTFFbRR9t7VU2/6I5uXqzK1GNzqb3B1Ljao8xes19SRY1S0spZSgxq+7pQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991367; c=relaxed/simple;
	bh=KK5fOJv3HcE4z1ixBn/u7cnTTyKHDIYC3p/im5bWYUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lV43dsCyA+hHX5NssIJU14R4s1bd0KVyp2Twd7pcTGUfRA2snr8cuDqckkdH+mMt1YUTx6q2mHct1E6yWOGmWeaCC3J+AP4IH1VUc0anlxv9bEMHOI/9QoeQVEBH/RjpIlLDDoFvwdwJJ3Wd4OPopPSFYTaf6AoDuYsiCDRs89s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4KNEc3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8EOW0n+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4KNEc3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8EOW0n+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wXW6775131
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 04:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oz+Wc6Bsoqf
	slMI9UaiYcAde1YtVj4xAT63QnxB32cA=; b=L4KNEc3p9/E1GLx2B/KVClbUubl
	IsXHwNeLuoFn7qM9mq0xnjNXFQ8wqy0EBx0Zk4w2JOAdGHPo9IEYWjak0JQAe+R0
	8+FvAoT7inqX5BjfhfIUqLRUtWBf1+0isj9zzFCt2zuKe0FclbzRPLo0jtJVKifD
	wspqWF3jU4SmX8cCjy98gREH90Fi2KTTYSQtaDHcOVrRMQE8UNqpv3mFw9BHF/9n
	qX4kkQgt6E4iMXivWaVHnMTh4tNNEN+DXU4Swe5PIv+QIclYIjDer45Kj1zeFLXs
	8AjmElsyb8D2oiM6FlhlyofZZtRfYUTJFIsQgWPWY+3Jk+wdjAYsLPfo4uQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8g4j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:42:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so22735955ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 21:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785991364; x=1786596164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oz+Wc6BsoqfslMI9UaiYcAde1YtVj4xAT63QnxB32cA=;
        b=d8EOW0n+4+F8HgW5D1w7qJsr4a+DAkn2NXyyYkefGcUdXCd1f+WPkJz8vi+5+BBUli
         AJoSHYC3/p8hww5JNxf4VMYCo15Ca2h1gV9JjwKcJgNGxM6wMsmQ8aH8iQA2XfuEZMgp
         gByJQFmTToFt8SvC4JUrzL/5z9pCANOCio3AVw+u3Lu9Oe4KgXnpvRg+aFd8t35Vx84+
         V7Ubks5sA0eZkN75y06YSFJw6JGhbWUYBSrIZrVnfX9elydwcXfWOzr95ocS5kPnlIs8
         Rj5Fzj9ZDTfQeJ6RYDpb1Z+OXaMucbdjslPGE5jKhtmwpg+YX+XylQKNRS8HZptuplur
         EhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785991364; x=1786596164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oz+Wc6BsoqfslMI9UaiYcAde1YtVj4xAT63QnxB32cA=;
        b=Rhu3mvOZwe0RTkM5oMGLU+pTotAhKsVEtmQ779gNlC4hrmNodhQjE0iry79sd9vIF+
         qsbBtXb5hwqTmJflrijR3H1vGsHNYmnFxAX4GkmFVg8s5PtmHmDePBPtLf2iYmcbkyyu
         Ezx2WQ87cSDtqpZvYEKs6tIccI5mBMa+YJHhnW/pd97Dju8WkdLVr45+xrAz1/iaaW3u
         Wr6atUwla6psmkMhWxEm390INFwPfGuRT38YDR2vwDJn2niYi8p2xy9u87IiQPCNO2qL
         smRKQy7xqsd9DI+WlZKlGU9nGRjkcntizvZvzR8f1Zw4HtQkNgUieQJcs+g5JBo7/O1M
         SZnw==
X-Forwarded-Encrypted: i=1; AHgh+RqrNjbD981V7DOUfwjVtVozeRci5mkpoEqeQmB0D+nbv9/L45mUcMDNeb12w5JiKyy/2vkGD3zqHdXG+vMI@vger.kernel.org
X-Gm-Message-State: AOJu0YyFRoVHLfi54sYI2SjVWG/U+vOR3ti+9hunEtBoMRCbWIzzqFe0
	fPVfhCi1ubVdUBGbKjAY33OxqilZM8TiHG0a65BG31mY8GGY/L6HeT9/DsWaViMXCaZXdLJ+y/S
	RGb2JfuXIWMIEvO/b1GWBsZG9PC6M9DRnsh0daN1/NT6xRf0fix/cegwJtlsPcBtnM3iO
X-Gm-Gg: AR+sD11aZOoICx/zp5P3vrefauHbAOfMC6bYo3iD/1GQcxVFxxD0m/NjelHMRkSr7FZ
	mhYROZ3rrUYXZ3gtq62KEjH8cEhUoqEOX3NTKayYoSswA0bkqj4JX+VV8NjZd89LfnqRlmvFXF+
	bJQOkOTsgyoh88M+GcAVdg1lY+vykN2LRyXN68R+v4xvZ162L5pa6WKSg1ooNt2I5ko+BQx/eQe
	ZFXogD2sDYchPXQbEagh2JD9Vk+FVnK9HgYAGpncXneG/CxtNwGwY9dd14qwmnIJPbwsugnyyw7
	gzlS0OCWhnrG9W2yKWfe5FFHNT6miW/PnVw9vokAVQqnXTv5DuGCB9kyWFN5R55G6vXHe/s/Bp2
	kuURtphz/MHFfPY5vTHOVX8uhneoYEh53O1JZsvwujjyPfYJI3BTVFCu8dqY2phS+6FPm7+ICsC
	L2h9ptRqcWPChX2xw=
X-Received: by 2002:a05:6a20:cc0e:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cb85efabd0mr14830162637.22.1785991364310;
        Wed, 05 Aug 2026 21:42:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0e:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cb85efabd0mr14830111637.22.1785991363750;
        Wed, 05 Aug 2026 21:42:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm32643473eec.11.2026.08.05.21.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 21:42:43 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        linux-pm@vger.kernel.org
Subject: [PATCH 1/2] cpufreq: allow cpuinfo max to decrease when boost is disabled
Date: Thu,  6 Aug 2026 10:12:29 +0530
Message-Id: <20260806044230.909961-2-sibi.sankar@oss.qualcomm.com>
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
X-Proofpoint-GUID: kUXIlMjFKlIccgjVIHGxKtXagRbZZ-PZ
X-Proofpoint-ORIG-GUID: kUXIlMjFKlIccgjVIHGxKtXagRbZZ-PZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfXxdT1ksG3G9qF
 0W9CFV1SBbFUVTBQEDYbKi3tIUP13UwG36sB6bw5z9oA4wZ97u+rPO5AKBhEgNul9Q8+oAuFIMX
 7EZfYnUzONX0yKI5IUZU7sTEcntElb0/8KR0A5n8b3K846IrvbjR20+X7keSVAboyEbkqVMIFZU
 1RDLt8BDHLqOoblHy4KgFm5aOHLMatGlOYZkXREWDy7F0X47NEYDzheLtKLUSU7RNZU/uQFHJN2
 GfwewLLljhPjfgVnOh/t+Z7sHaFXSOyEUbC/JI9ApsSkum1y87pYcVvg1ipqen5J8J2Wht89KRk
 gAAu1Jf3VZJIBWwQPI76YMTHsPw3zNpVJqcdZzFFCC39w81SYxoI8IEnfCDG9SjP+q+wPFGkLUU
 Zl7vO7k97vfHewlnMGtP+YWFPvdGkK/SWDNV8geCOiNaItI0BhYUuwdLj+MPP3Y5PdNNOIfsZuY
 Ps4S94nwjmTgpEKhNdw==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a7410c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OnsR6Khfw191TVAs058A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX3v3dVtoqmQpN
 f2LW7wHOZ4QjwqkNAcnqKu3DjI/awppd4kxmFd+SgoEsOFYa/+efjMcbEc7Qnx+Xecw1XGW22kB
 raVEGqV/+urz9jfdGBGT7PzQTfSIc2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060032

From: Ananthu C V <ananthu.cv@oss.qualcomm.com>

Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly
if max boost is known") guarded cpuinfo max updates to only allow
increases, preserving values set directly by drivers above the freq
table maximum. This prevents cpuinfo max from decreasing on boost
disable, leaving policy max pinned at the boost ceiling.

Remove the guard so cpuinfo max is always derived from the frequency
table scan. Drivers that correctly flag boost entries are unaffected
since the scan already excludes them when boost is off.

Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/cpufreq/freq_table.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ea994647abc8..791118466ca4 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -50,12 +50,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 	}
 
 	policy->cpuinfo.min_freq = min_freq;
-	/*
-	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
-	 * it as is.
-	 */
-	if (policy->cpuinfo.max_freq < max_freq)
-		policy->cpuinfo.max_freq = max_freq;
+	policy->cpuinfo.max_freq = max_freq;
 
 	if (min_freq == ~0)
 		return -EINVAL;
-- 
2.34.1

