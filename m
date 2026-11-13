Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545752;
	b=aKaTIk5pZlW80oq57U9Yb7JM/brS8EdngOuLczBZoY7V3kCUwjD95e63MQM8HbXY3hBW
	 64YQzw8LT5dAp7r5o70zSs2vsPu4LyhflEr4uRmh+ss4IwJA0D2yUGlfSOCD+pr8E4wd6
	 RICCwYVPnLcW3lbveTF/J1pvp0bvEgoMu+LvoojpOrOvK5+l3y/nRNAiyQT+P43vPN3LX
	 9tn8SqZOweIXpl2xuB00chHXKh5dCPgiq3Jxjk1LhO1AN2KmqhR+fm9LGbHzKkKkQ6IPG
	 sL+hgN783fEGal2qb32uImATi03ruh4xk4NsKVu+kIyftBo8ZMpTAu5q8zsc7Jhs69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=;
	b=pQF3eZrePZluCD+r9Jl8v1oZnAna5kPylq9ia8qAjBIDCmajzlnZ3KRIOvFxc5sEUhOI
	 5xSCjZx9HFV4Q/a50TjBFsZ9KXwQHMH6wXLKFHgpfTF7IZePTGS6Eu1OQf5KhFQnqjt1k
	 54rWJk8HkfJJwJgGrYghGwqqnffgwxmha9VzFBSFg/HUWp4FjYYcv+4SuY9HGuzffsGUJ
	 PQYSlIl3HaQzEa5i2yjCjJorL1Gh/3mEEkBiHi/x+5umckuqCcY09NERDj0wYQx+GJ9Xa
	 8sHs/C62XWT/aMyINNLP2q0cVrlJBhZxi5DR7ByJYr/r222oVo5KhRiK5Zhd2k2uHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzrXUVnn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E1SFlVLA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6790606A896
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6790606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzrXUVnn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E1SFlVLA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KAtl1187011
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=; b=nzrXUVnnT6/HJmmi
	SdT1vf7pGZnIpU2ViVZaQOljsNKmBFwAlvCYgjnVI2aDic1YyeQx3TR7wVg2wVDY
	Po20IlAiHDF7cxxiT72xwx6hEkSEmix2N09OaQuN7DzokhLT6Z3B9rZosdqU5MYl
	7XBOTeiDBMTBsy5V+Le0m63MFWyyKmSvsb6HjA0jJCScDx94wEKMB3lVyyFCHagu
	VbQfjgmR7SMiC/lXLt4ppALNWg31YFfC+ZcbBQ4WU3cUlPXcLr62CLnAN6fdEbX/
	TkLsXp3UI9KRi0rbXL0ZL+THToatp75xGByhfgGYNIM9tt6PR8Rn5NAh5rGrzPJT
	Cfd0gA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c3yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:55:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so411598a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545750; x=1795150550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=;
        b=E1SFlVLAdhIXdAHLo5dn29nhqcsqtpVy5+gLskr2bk/ULq93paSsrIepRaFE4TkSXU
         VcDh0w0OmoeGtgHQLtoMctPXh0AdbbJsB778HpSutBqTgu+7P43y3OlmVZXpb6jWaI48
         /m2PTvK5UK6D51uGXD7bMkrOP0CH1QCKt/oEHiKOBUzgXoUWxi9N8QwVTriTVHwhibHt
         1W5/Sc0hazRGec4rbtLBhpUtrB1N+XolnDb2oYxTGc2E6n/Bvq1jfGMA2qWzAfwTLoHY
         L8+cLR89ijAQylRNgfpd6HSYUaczJs7spdAR5ck9vD20rYS6DMDdCbVHNUk5t68XOLIY
         OBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545750; x=1795150550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=;
        b=r8BLRAwVggJ8BMdjUKlbMKpmKiA/Dkry39QBoTY9VS9Zrl8TDwAnvXcoT9hupsikEu
         2OzzVdg9z3yFteHFezM2Y9B29QD2le7KFNFsmzNDxqMygXUCRfvV8Im9UfOJ+VgVTjOt
         IlRyUeuMRFDXWw73D1QJmtgdzCj2HYtKeY0Q1BRNh7KsHinXj4ngjnRLwMUqgpjNH2yL
         tE9UNuDkhKw6U0IO5jai5vNJmCcdmr/KE1Pyw1bmP7Zd0ZAACTGqeMjYag3eLGn0LM2B
         3hj59Vlra83bvrTxREB4kgu1f52/HnOWirHRIutAcbuFqcrDBjLp8YODjnJFyIM/sAKs
         Zwzw==
X-Forwarded-Encrypted: i=1; AL+hErEfXXss47VfQLHBmVIGF3Pr/2Ap1cnKZH4dABfED9GU22hTnDNwn9gAKIVh/Dx/O80KarnyC9UwdkS7uMHe@vger.kernel.org
X-Gm-Message-State: APuU4Z/kggKAMPxFuO3yenduQNtOOM8Zz7a8JEQrLKH4gcsHsKnQtayd
	AIyx5TMUpZwsSumy3GhX/g+EZKM+pQFuISNQl1zk9dPFEdKgNEbm8+sQF5AEA08XJXSGMKMeZjg
	xmcPmAdPgPSpbQIeu4qRCTYZyaYaf+/bvt1E6+fSX6YPQtLJanYI+jcHZru1wG/QoRL0a
X-Gm-Gg: AYBFou1PO1SjAGJ0Do0ZU06a/KbYJUnl3tJlv9lbWxjpYHnkiu5L5/sFBdMQTTkmAYP
	w5FV5JP3YP9nbivbzTOh3z/69erPl8p/0iVfETMsmfT4toMjA2xA4VsV27NNf5P+0FcXd99bGy9
	fjseT8hziIsiQiLzMEM6RNSOh9AVNsbHPUNtczVO1tkmh2fbGUa+xQjry/9JC7x4vwNZ5hTsm5F
	gfMLhtpQOPEJc4BJboq82x2LDOV5KV1j48sV6mux3CHBwB8qYDYpvzghnykkKkMcZ3J5ObkM2R7
	nD8iuOtaeBQVIEQO11NvqrIpXsWf44j/s3pAG4nd2CSMTs1VSkAY6QttD6sKICLVNZ/KRKkV3zl
	cXpNFx7nr2LzYOfHUo5YODfx9dDC1Rf9L9S1Bg++oZABqB5WL+rnS8gm2tHav82/FqXX+Z8h1nY
	bs
X-Received: by 2002:a17:90b:1644:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b1b0597ca7mr1229868a91.0.1794545749570;
        Thu, 12 Nov 2026 20:55:49 -0800 (PST)
X-Received: by 2002:a17:90b:1644:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b1b0597ca7mr1229846a91.0.1794545749067;
        Thu, 12 Nov 2026 20:55:49 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:48 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:26 +0530
Subject: [PATCH v2 2/3] pmdomain: Add support for system-suspend-only
 states
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
Message-Id: <20261113-s2idle_state-v2-2-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=2420;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zLzmWla1eE4cZjRAIYhpKVJwqHFJ8WiKdzFMzj9uB2E=;
 b=rvhcPu1xJ1lcFOXWFywbCb7prw5OTabSQiwsUPq92R1r9apAzpDONPggy+TWZicvSkRGi5WvS
 SUW7KHUKWebBBb+61zgtstKHbs2WDHEKd3X34LZIX16klNqJJQaX97/
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXxdoakqS0LygE
 rbdeDwr9UOaIWuZXPPgwSQEAnQQpbq6OXivJFPeU9FEo8AR0kJoe1WJ3opco/2xqPWH34/ToMbN
 OqH7bZaLMikgF2pclAXEA6tetZS29ZjLji7vbb8x5C0koL7KFoKHP98E+xFpuuQS/d17dPYe09t
 4kgVzEi9tai+uv5JG874mdFbnPcfnbyG1UwTKj7HoPg6i8a9XKwIWdjF2Xv3dXpxJljxvUH3lCO
 iqvMpYOsZ6zpf/GdVGXOLXHjF1IdST9OqAWSMvy8D1rmYtzVj22zJHQyI1W1lJEAJ+VOoTLQnCT
 cx4yHP/nA8vB5n9AcUhvVl6WM9ALnR9XqMta4R5Cwv1rvGYlbC+3Rjw8Wovpjo3Y0oo8MslD57N
 Oqr9qPUBFz269scL0JQzJyKYMyBLe0O10Bx9BkfG7OqURRhfKVtmUZdSSWqx8uCCdVlaMGuC/X2
 7fkntZI1pzfDSSoANHw==
X-Proofpoint-GUID: GMHqnQAoRGNWfBBVOd5s04X_ICtM0ofT
X-Proofpoint-ORIG-GUID: GMHqnQAoRGNWfBBVOd5s04X_ICtM0ofT
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af69856 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=XIWP2vTyFktR7zITobcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX1pvp71+OkP3/
 efvltlz8Krrlpif/yLK2cSjKujBERhdNshMga+N0s/MDZkH/QYmdy3sHO6/Dur9SooQfTXj4IIL
 WCfhFik1suZa3Q4viRcqJmU8la49BoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

Some domain idle states require system-wide coordination and should not be
selected during regular CPU idle. However those states remain valid for
system-wide suspend like s2idle.

Add a per-state system_state boolean and populate it from the system-state
property. Make the genpd governor skip these states during CPU idle. Leave
the system wide suspend path unchanged so s2idle can select them.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pmdomain/core.c     | 2 ++
 drivers/pmdomain/governor.c | 6 ++++++
 include/linux/pm_domain.h   | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 964e44c2f78f..288c0deb2340 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3701,6 +3701,8 @@ static int genpd_parse_state(struct genpd_power_state *genpd_state,
 	if (!err)
 		genpd_state->residency_ns = 1000LL * residency;
 
+	genpd_state->system_state = of_property_read_bool(state_node, "system-state");
+
 	err = of_property_read_string(state_node, "idle-state-name",
 				      &genpd_state->name);
 	if (err)
diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index 38bba24ec26e..7684f9eecf85 100644
--- a/drivers/pmdomain/governor.c
+++ b/drivers/pmdomain/governor.c
@@ -185,6 +185,9 @@ static bool __default_power_down_ok(struct dev_pm_domain *pd,
 	s64 min_off_time_ns;
 	s64 off_on_time_ns;
 
+	if (genpd->states[state].system_state)
+		return false;
+
 	off_on_time_ns = genpd->states[state].power_off_latency_ns +
 		genpd->states[state].power_on_latency_ns;
 
@@ -407,6 +410,9 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 	 */
 	i = genpd->state_idx;
 	do {
+		if (genpd->states[i].system_state)
+			continue;
+
 		if ((idle_duration_ns >= (genpd->states[i].residency_ns +
 		    genpd->states[i].power_off_latency_ns)) &&
 		    (global_constraint >= (genpd->states[i].power_on_latency_ns +
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 14e0e346c610..d9b3e67042e5 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -188,6 +188,7 @@ struct genpd_power_state {
 	s64 power_off_latency_ns;
 	s64 power_on_latency_ns;
 	s64 residency_ns;
+	bool system_state;
 	u64 usage;
 	u64 rejected;
 	u64 above;

-- 
2.43.0

