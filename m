Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC847F2C6
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261304; cv=none; b=Ay5A+er00f8LrOT7wZmLT3tJ9a3OkvXik/LJxHmed+NoDOusoqMorHBMnHEgNMULjDSMcd4Z6KV/GdCKXS/MpGUuigvkgoE76xI2LNU+5gtZEVQo/udLycUSZO6JEZIPCQ8G+SUpG5BvCOjrhjNiPF2l/MygukzZlXHgNqwxHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261304; c=relaxed/simple;
	bh=9Vmbo987UH6aSDo9AUv09C8teHlN3++wQG7mQ3tzuAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hh2AhGscAwX6um0MdilWweVcu7GMdPYx/xqLHPq/lVIzMAzz65+Dkvi3I7bmo12zRo6otDm5zr5uSclaAMoHaZcCdezQ6tY6PkeNUWeyaF3T3stVKa6Y25+IDsMSd+RVPIs/QaCR0QJs6JDOMqJxMw66mD4OIiKarTNnsxd7c4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2kDuW+d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DymQqzSu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2kDuW+d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DymQqzSu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJffP2141716
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gJ5qkITOsRm
	Pm47iY8hOfrhQuZlteW/MXIusB651n/Y=; b=m2kDuW+df9CWp69cK1vsSL83l4m
	J8yoIGWA2nMCTiJLrfLHaXt0/m94FOMcc7rlDKhsV9flj6eicozTzzjy1iBNoUpJ
	TgyMq5nc/vXjBGGjFWYd6aKSFr7eMvjfRmlwo79DBBRuFhuK9hRcyqZqfnmVEfAF
	OPNUH+oMJlwVjaYNtei4sIGXCDMnDsc1uVBrJWY3S1KBcpT3uqdMmd3PaF5XFJup
	RTxSyzARMzxOp7iNwhQN0LX/o5AKK/IFEMB0nWH+mjrCxkXOlydWtprbqWw4z2Gn
	W0urNonX0lRwa4F5sesfrwxGvqRFSyzNlnkQ3yQT7167rhPc4DA7bD8oDRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsy1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:15:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so575330085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261301; x=1788866101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJ5qkITOsRmPm47iY8hOfrhQuZlteW/MXIusB651n/Y=;
        b=DymQqzSud2qBFIz5EZ9MTddjC+ptnB1Xk7GB68ZhhBrqaM5wmCB2+dQVOxfZ2+QZHA
         86xCiqMoIMdx+BVYGA0pwB5j6oeWy5B3vL5s2R1rmb9vkLIumCWsPLDeVbTu/WzC2h40
         qBnWFfRPj0HU40RZ7ZM5F95eIlxKwnh0EBDtd7QXt6UeJBczcM6voP+eUTOylaMSy5wz
         rxwsp4Aua1jlln/JFasYF0mJLZhzsfky+r0sx9UPEa97gEiogKQoTpNjxOSIzM6ZyCwK
         8eVWAop53a8WsW/9DGxPLLXTy2NxhFRBeNNHbqJWKxOq8uppWD0pE5wiylqSvu7SoMxr
         v4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261301; x=1788866101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJ5qkITOsRmPm47iY8hOfrhQuZlteW/MXIusB651n/Y=;
        b=Qlg0AFA4uOhLCWeAFgpRc8NKrcxHodQjRvefXH0xYUyKW9HWCZWuNTGmXg7EjjDbUG
         K8Pdi77zLwFBpMRrVTF+9SXtHcSYpMTlVCsFi2JMj0CSOSAyRby9Jl7EInmsSFS6erRc
         8YpArJ6LGZGoY90awCdEz+EcVzWxFAWqr5eiRL/DoH5lEDNzL73e1IPUrRMA1FoA8ZLE
         4Z6NfWmXTQsKFc0onWdtYdht7DYY3aKICFDKqJbEy3PNp3M/4AAGuEb8/giZlzTk0xHK
         zprBDj9JnXVh/m55L4AnO030XfssLCR11/WwZWHYg+e9VqIO3CpnLJVIQXv+50SZghQR
         RRig==
X-Forwarded-Encrypted: i=1; AHgh+RoFqWjvs1s5voQqVus2mVOku8wd6CVW/4bRJDLrC9R6oXx7sH6fA19k5UmbWyehBt82iJESfgeN6nBtLx19@vger.kernel.org
X-Gm-Message-State: AFuF++loRKQsj9jOK/2a/A9Yb3eHphYrz/pu9Ezdb/NHo7qJBCkFTwjS
	dvqRlQNOB6knq/4GbJTCSlxXdwxLbj7nB2/eqAUBXWqHCYLxkU7zqzeKDPDSFC7lYXd4UpeBLgf
	BuvzkbLHTOTvGud0gPz1szg70rvfO9e4Jy+no8OZoNgnWu9UmhcBe0rvQfbvjRVUPg0hi
X-Gm-Gg: AR+sD13HBFUy1u/rcewWJS7SAKbxt7bl/bcTwBaP+ihgwR1L8ZBivdA1yKQQ+G9yVq6
	u/zFHR7l8u9wNEvLlWVnqymxJr+s46E6IJwx7893mvstk5oCvtbjGVpH573bunUItxuWW2lPydr
	MVUl7hh1zBpWYZT9coQsIV+DQDLw+q6SdtjRWCU7Rgv1VGX0EyuiODiCLQIfRY/FOuY3k5TcUYk
	vTGQpTWh0MtwPI6H5zjr6NTh8hEyTiIR607c0xFk1bEdjN5RwzlsTVWLj/lLcB7QWBu3gKRrHkT
	yaGD9uxgcnUjFnrzCxbmGsX4ZRI/51WOi4tKyhH/X+iAe/OJWxrQlIO/B4CTKHwrzxmqmCZRMhE
	PEgWsj35Ri9QM1axkoIet7qiDiNzKIeuJSsIln+x4nG08PCqKwxRXtKy+ow==
X-Received: by 2002:a05:620a:a404:20b0:939:3c52:b117 with SMTP id af79cd13be357-93947f8f742mr803385185a.8.1788261301007;
        Tue, 01 Sep 2026 04:15:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a404:20b0:939:3c52:b117 with SMTP id af79cd13be357-93947f8f742mr803380485a.8.1788261300582;
        Tue, 01 Sep 2026 04:15:00 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:59 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] cpuidle: psci: Move initialization a bit earlier in the boot sequence
Date: Tue,  1 Sep 2026 13:14:08 +0200
Message-ID: <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YfxPQpZoZrqgSpAF7dQ-tGdRwMhdOd8W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX0a/3I/n6DIqX
 4l83FW/+CLJNR1a2xUQX2BtQrYfbngdgWU+pUZpqS9r/Rzi4ebaw9xDYkJh6oTujjHPBOw+lrFe
 ykHK2Lq0YErWRj2fETxpFGZEyxyzVZM=
X-Proofpoint-ORIG-GUID: YfxPQpZoZrqgSpAF7dQ-tGdRwMhdOd8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX16CY2BKu6isp
 FJKnLeqKj9kbUVATPWj1nWcjNmhvjXr7U+BZNhY5kc6YzUf2vphv0DWEy3ukzZ1yg0v+QBk8bEy
 NeUQ0knMF2L+AYhdgi/SVqtfxCfO/FT7kxTcQ/k90JH6xFMezbRwR4vgpPODe1OOqYf0T9MZO+C
 tktlkFp1Ka3LGX02VtxgkcXCTPWSqR19bCZcR2HrPGegT81+1oCcu6u5hVhHlGwx1o5iFlXuzKT
 KARyMPolg5zTVX/nWciTNYRAw020ezW32UhCObS53qSaMmGbVulLTv5pNf6rJ03DfCGN/zKFK/e
 FA13boMdwh2ejeKc9eTq2VcQNJ8bV56k/E+AM1cH0ZW22Z5OXv36GbmDaM6v6TufznFAqHD2TlI
 0+1srJCEbWY3yKOThVXp2JnLyTEaM4550h3XoeAJiDUDwVtu0AJXsmnNycoY+WGF9ZkuiXfAnUC
 FnCO3ud8zW954nlN5qQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96b3b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mXaVKpwKMN2Bo3EP8aQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099

When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
it's of great benefit to attach the CPU devices to their CPU PM domains as
soon as possible, as other non-CPU devices sharing the same PM domains
depends on it to allow their devices to be probed.

Let's therefore move to a subsys_initcall, which should be soon enough
after the cpuidle-psci-domain have initialized the PM domain topology.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- New patch.

---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b250d0dde760..0187d6a9096a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
 
 	return 0;
 }
-device_initcall(psci_idle_init);
+subsys_initcall(psci_idle_init);
-- 
2.43.0

