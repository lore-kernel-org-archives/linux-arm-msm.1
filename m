Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9D4FDA72
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895767; cv=none; b=ULZdUZz8VOEWnKKK5E9TUtihgWoKPoj0GYRHqu19oRc6cpWnclW0Kk+JMflvRaXZHuFCD16b5QA55mL96tzmPX9aqZOvo4FLoVUopgG4fHqSZGZEKHJnj0Ej3MzS99BGgANM5RFchblNsflDaPdjI7oBFOCnKbTXKsP7NE4VXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895767; c=relaxed/simple;
	bh=2HcZi5rwpcAgNNPH8Svxs02xGmZY1S4uExCQbIuyjeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wcc5bIGFuCwmaBZUeTX16kYfhz5rGM+A5kSeG19KZXabVBhmh8tEBgJdc4DEGZKYXHSKsbqBiz2DOuXHTmEhzHxeF/T38oDzw4K4v1MgljQ1UVx1gN0ZW0xBz+YyCv/pNB0K4e92URqFObSRx5+EKnpbvx6kxpokUZ4vfDZBYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odLvvXK6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUA/iHDG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odLvvXK6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUA/iHDG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8VI6n302945
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqGJtgxTCuUY4F/vbYigKtFLbmNorBUy4bj2nRymZBg=; b=odLvvXK66ynPW4em
	PqMgdzEd1asbKqxIC33kj5IN0Q+N0nX2zgJwiRMyaW9PvoVROSgWJQ3Ibeu+3bgm
	ECVfx8WfugEU0oYSK0sDmXZqdhHwMeUdHVdPeGG0gDsbdsmaedH4ZITyg3hrkEVV
	VmKOBkncZ0dfn0Y77GMv+wOKSNM7JNEUOEbxocn9usHdr8xxlSpC2Clz6e0Mub/f
	pbyJoCZZio4HbrL3IEyRwxR/4xjeJGi/ueJpCN3vIKXD+sSsWtZpbVKbB6sOEZdI
	8vdCV0MD2xMAePiXT7JiTvR56Ez2hPrzeV9cr+plG5cd4SvfoJSXdGMRO/+cVTq/
	50ncqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqaxk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbacbb996so479700485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895764; x=1792500564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqGJtgxTCuUY4F/vbYigKtFLbmNorBUy4bj2nRymZBg=;
        b=NUA/iHDGOpE50TV03HmOwkCcX9+yRGzkIAkYHREEOQcpv7OIQjxdXBekzGtSTcYoeX
         0Uf3C3l9h5K8ChTGWPWU+leml9CG5GF0CGKEykRgC5uiig6PK7PrsJJ4aZddcmIG/Ekw
         17ek8k3v8mRaFHJBd6lMmQEPqMPad2YQPAzWVuVFi6TsE8x1z/JZysw6MeaQL6g08qxX
         7x0xecpI5WQi6CH1UM2x6VzvlwG5yDx87tWo/d9DnS9KJFBydvMZscL1Jixf3+9ULYxc
         81IKJn8wJLTHDomHvDS+WpjTFd/AKVY7Z8SyyG4jZ3ed7sVe08o/yVSpTbMHJAQKeV28
         ZOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895764; x=1792500564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqGJtgxTCuUY4F/vbYigKtFLbmNorBUy4bj2nRymZBg=;
        b=llBpbqcCTXpKO6jBZ7vJqX2yG0VNl9Fs7PDzTtJNG9RSmlLtnzbWXCWws+qosg8tl6
         B5M7BT6Vcp7WCgYqi4HA6nSXaBqR24nofpxuGRl7pObYLLEufj4Hv9zgYZT/m24/1sKY
         OX369rZ3MzdhbAXXfHo14D9H3ZPrVA++U4lGV/y90pl2gUkS5RexgKYLqyLkfljG2FPW
         2lYg6EV8WE9xV8bPBAQmxAX8Wge8uV8CHuSHyiOgRXYYOg/XAaEoznKBc9wgdloQcMEU
         hFthSjQOWabj6EPWYQ5FDMqBC5GiNgYACcQX+UZy6Nz/77/FZa3hFzGJV5W/ZqPBLa5c
         8BDw==
X-Forwarded-Encrypted: i=1; AKwUvBxA0NXROmF2gSxr5Ct1+WpK5cLSsc6CjJvHmnHAETq2om5y4jahv4bcdRhsW7zZzUbL1Zj+2N6y0i8W2YTB@vger.kernel.org
X-Gm-Message-State: AFq9FYI8+tOmHm/FGn5MBEjzv79hGh85DSJb1cQK0IQMZBkn9Gw3nT/d
	W5xhJPQNTxtmobOr07k7xc3pzUbs5uCHxqGXa8+ROPNUIXWo3l7g9IVZuqHkILddAQyvLlUmNAO
	WrBzGLDDEwGrXA3eR5orIGRbH7/nqhTcx3HWCWifO7qoWRSTV8wrAHuKZ6HPNNHQJH04g
X-Gm-Gg: AYBFou1mWjZWl/0a3SYsrAYQ7g6DHic9OgQfreOxqjhIPtOSRRasBg4VlD20AVeQJMW
	WQiPbJ3/3JrD7TmfkTzMyXAJH6fCzaV94tLGFPriNio+47KSwUgaQsQjUEmU8therJJY6Jep1h4
	sAbvsJc0L20laJpT4+xFWiue0cn9BHXcxRTfYnlTOnszHCL/3pwpFL0/t32tm8soxuDxFq0905w
	0aWL8pPAzlBdtertgqbbGWX5U1KYmvfzCtc0yER++3SbkKjrRvBEkOLV9ERomkiR+CECxuswalB
	WNy8ktU46k3wWXvtEnaBIXZizCHTzcVdYB0maHr3whEypDaOjXM6rHthmJKS/YlWMkoiGDzPZEc
	WgWbLZlI9
X-Received: by 2002:a05:620a:6412:b0:93e:94f2:ada5 with SMTP id af79cd13be357-93ebd1e0002mr2075824485a.25.1791895763951;
        Tue, 13 Oct 2026 05:49:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6412:b0:93e:94f2:ada5 with SMTP id af79cd13be357-93ebd1e0002mr2075819185a.25.1791895763231;
        Tue, 13 Oct 2026 05:49:23 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm4351081f8f.32.2026.10.13.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:49:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:48:42 +0300
Subject: [PATCH 4/4] pmdomain: qcom: rpmpd: Let genpd enforce the boot
 performance floor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-genpd-boot-performance-floor-v1-4-a765dc83e6d7@oss.qualcomm.com>
References: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2671;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2HcZi5rwpcAgNNPH8Svxs02xGmZY1S4uExCQbIuyjeI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqzijJP9V0ONNuDY/UxTO43duW9FrHWEpxe1kQf
 OHuTNwtSpaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas4oyQAKCRAbX0TJAJUV
 VpuJEACkqpR82XZYl9bwCxi7O8nm2cHU6pRKcxyAzMVWnsQuMPeZgEGv5k+qcHcjULyExcaQ/Mt
 W34HT6gMrvJZq/1j2Nx97Mkbxn9QJIHOL8u64igQ61KS0TyvRyI0f0VEi3MBW24toiDVsF0dcZO
 Njwi+ga+EqcYaz4d6/Ff5300Z6/Fa7zS7tRZiYbfuXod+i+DTvWZIukX9d/Q+FUqIFBbJMzcF4G
 O9BsEPvnNXGFANp7b+uY7Wv+NdrkzUpWmKNX98CM2O2EHyqd5Zf0v6jQyM7N0wrOehVF7KQAMwX
 EyGIBTJsCaNJfckPZbWktTOqnmYVyaqiMUGBIe1TVk5yUWUl7CasOPzFjUUbQWildV6J6Y6+Akg
 Q8k5fzNtVOlDTbBs0GNMqDn3VbsYLAnaY5LiPLlYxMT4aV4TIHYaIFHQ7W5mL4pPSQcSjbwWWNB
 tVwTf8q7a+bZcNPbFxSFszAAIAoEJYm7qwzUXHmmWgotGCuYl2yZGaQv7rBz7Fpl5WbbD+JnJy/
 hrceETgyORzNMcR2apn/ELlT3DYmO9a7D0HJLHhmaJH0VgHiM/xNQkmU58zN6cmPfW6f6wN9mpe
 HwG4z+eojVTeSsWMIFP+6F+kBOaLBXVvtrOPrb14oAm2d521nCXbWOefIdqdwZftXgJzl2wRAO6
 GG0FIHB5APGRpgw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX7DL0wDbS1uz2
 Lnpt32ZHiYEJXNdOOk+BEGpZBhPNFkIrbvDBkpJOg6VAgMAWVe3HZxDqROQYBVxFJlqZ9sRzMGe
 +47xHYacDfhGTv8q6eZTw/kwhjc2QzL+2MSglKMWn8SHSyZdXqDH9N5ovjZTO9Br32wafdztpzl
 O/CmFWCUVSMbHMwX3my9Yghs0df825v0sgImYEZxr/IJsG8uUtXuIO4UskHkqC5MdA6Cf1H3Zyq
 kF9dqpjb4PWxtsceX/pZuFnKMhB1o7YK7JGYLvjYUupBNYb5RQH/A8+zgA8kUYtEiK459iad7B7
 1G7NjQ85VD4u5hL6omqV6I0UoWsvuvk5PDwHpYjP4b0meDbeDOIBQWTjD2L8QdXi7ZYpfRwMtqr
 zY+WJxIYuUqzZkngt8XaNAaQedLjR3xVk8zrCTpZ552LhWKcVBWBIu8VShEC2rj5jlqasFSmy2K
 uhv0aQ2lu6nuQktlCzg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace28d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z2pBvWV0IUsHogfwmUoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX2AdZybzufPcI
 nnZhgE7q1HqTmkAgPWTjItiVhhPu5koSUUAXMgFyepFlyPxX7FZIfRq6wGKd4qiDgvbUcS5FQbT
 C1GoVroQ7MHoTzQUknBndT+qxfTUeWM=
X-Proofpoint-ORIG-GUID: lCWRAsyFPqpOq3l7zmGsNRDJO9ZqRlCv
X-Proofpoint-GUID: lCWRAsyFPqpOq3l7zmGsNRDJO9ZqRlCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

RPMPD clamps corner votes to max_state until its sync_state() callback
runs, without exposing this boot constraint to genpd. The separate enable
vote is not covered by the clamp: rpmpd_power_off() can withdraw it before
the provider's sync_state() callback has run.

Set GENPD_FLAG_POWER_UNKNOWN and use max_state as boot_performance_state.
Let genpd enforce the performance floor and retain consumer-enabled
domains while boot protection is active. Remove the local corner clamp
so genpd accounts for the floor in parent-domain performance aggregation.

Keep state_synced to include the supplied corner in sleep votes for
active-only domains until the provider's sync_state() callback runs,
including when translating an enabled peer's vote. Retain the existing
callback to reconcile corner votes for domains left software-OFF in
genpd.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 5f55fc791131..302a5f3a021a 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -992,7 +992,7 @@ static void to_active_sleep(struct rpmpd *pd, unsigned int corner,
 {
 	*active = corner;
 
-	if (pd->active_only)
+	if (pd->active_only && pd->state_synced)
 		*sleep = 0;
 	else
 		*sleep = *active;
@@ -1006,11 +1006,7 @@ static int rpmpd_aggregate_corner(struct rpmpd *pd)
 	unsigned int this_active_corner = 0, this_sleep_corner = 0;
 	unsigned int peer_active_corner = 0, peer_sleep_corner = 0;
 
-	/* Clamp to the highest corner/level if sync_state isn't done yet */
-	if (!pd->state_synced)
-		this_active_corner = this_sleep_corner = pd->max_state;
-	else
-		to_active_sleep(pd, pd->corner, &this_active_corner, &this_sleep_corner);
+	to_active_sleep(pd, pd->corner, &this_active_corner, &this_sleep_corner);
 
 	if (peer && peer->enabled)
 		to_active_sleep(peer, peer->corner, &peer_active_corner,
@@ -1122,10 +1118,12 @@ static int rpmpd_probe(struct platform_device *pdev)
 		}
 
 		rpmpds[i]->max_state = desc->max_state;
+		rpmpds[i]->pd.boot_performance_state = desc->max_state;
 		rpmpds[i]->pd.power_off = rpmpd_power_off;
 		rpmpds[i]->pd.power_on = rpmpd_power_on;
 		rpmpds[i]->pd.set_performance_state = rpmpd_set_performance;
-		rpmpds[i]->pd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
+		rpmpds[i]->pd.flags = GENPD_FLAG_ACTIVE_WAKEUP |
+				      GENPD_FLAG_POWER_UNKNOWN;
 		pm_genpd_init(&rpmpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmpds[i]->pd;

-- 
2.54.0

