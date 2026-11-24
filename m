Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550531;
	b=nMlziDcVUuulyoLzpf2/zWOevzFv+CFzsT77tlozIGfwZCfyroR1tBFNTJ9Us63VCNma
	 eBxzc+ZSGqveoZzxQRAc1Vk4spiAw1iT0t5RIVVRrqWHBWXjaC5+KFW1/NoBCvgfc2ReN
	 4RKG5TMIQi8EpTQ9TgOC3MoigeFdKqlvEfbK9Bs28U6OaZ5qftw1wvsiOLCg5BchzCiNg
	 mljMUUNZaBxbhtLh+f/DTaPCayyQcJaRPSAowwfoReEviSK7CRY8x3UYd3rhk8GJjWFEo
	 3aoUy+8ZI6+FulpbhLjB4NZQZostQOzyeWXJgFIIhbcGdW9hdggp535b66YH7Ofb1OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
	b=u6l3gGhjtWEx7eWGFawpBZeD99WKmqu5FqA0egWfMKDTY2EEagRPrd/h1ZupYMe1Zmiu
	 VywbZBxKD30J/UCsQs88iFFdhp4zdLVx8BytBelubYBGg9bwaCck0EVCfFA/GT0MerBSN
	 Uj3AhdwKWpXKi2TCCcoyVp6AlE3mFVGlZnGrdjfX9C4tDH2aLc8qJQ3mDRcjb5ZobKQTR
	 IjFeFC+4HQua10a8wjICUjnvaj5wwxL56QtU9KVzctRXbzNIdrbGEst6/55A3OQSfrCXZ
	 SH4+llrom/ER1mH4/fb0BQDKJf/CcesLBihEI/ztrV1CA8OYE30rGx8nXLRVDmtYbfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ijRyg/7u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QI6GxiBz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FAB606A685
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FAB606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijRyg/7u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QI6GxiBz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXLpt2306269
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=; b=ijRyg/7uiy425nk6
	xxkriXE7jaF7PKGKzLo8R5zD/gKCqdT8L9upLh5FG/xciI+yp6LVEYYjBjMtg50p
	3NMH65vBbw8802dNc7KEML3DV1WVnlzqR+7nsy5J3EccB5T1L4sOxI01vptmiSep
	emKrQC+RgJ8LqFOg3uXB1rNrOWKulpjXyjnovyXYVFarQ8jSAa0/9/Zn+NBKSzuo
	+UxFZ5/gRNKwRQqqOOhRJKKieaQa7g3ikkQE7sJfsScjhmD65/vVODmVvcR4mp3o
	pnUmCAtor+bmy15nsqRXPJ6gNK6e8HhaVI06bXp4uO+wPtfoNfCGDyazclWVKymu
	kQ/6+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9auu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949d87937d8so21973185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550530; x=1796155330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=QI6GxiBzPixld/3+5TVJiOtPAd9EANPRLK5CvPjIcLWo7AEeqcV4pDS8v8c6tHlrfi
         dgFQKrFIC5bW9RgGut1+G7gdTUF6wGkZMKWuGZI+Xn4mMEvaAeztAFqBpJ/gB7A01mbi
         7Q2OHYZBrD/ibRPfA6kC3PdqC/QxD7pbdfF8D62XTfI60oAqKHxcQPnIA8GnY1QZs4Z+
         HUbCDLP1gBCimn+BQ1Oh32+wRGi7n188C+8ONt82E6Ua4W11j9+i/hfJMELCZLXGq/Fg
         XeyccX5a3Go+5ElQFWAkY2Yq9C/YGr3tj4W7WGRP4gJNOUmeARF/Zi8bhjj/szTgY4K7
         lVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550530; x=1796155330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=0TWHiJnnfG9IKwsB8W7nmxAGmGQo8Tj8Bk6L1huRR5+rbZh6k78Iy6yQUEcBbbYxQR
         O3r2pbYsgoLtgGi1YTpMUz0/r/d2SUZ4EM3w03ES9GkZnvGv96rjp3TYpyObmWQDpeie
         HdWU09SjeA62yne+TV3dBK81mnbLgte/Vqq01TGzeolkXx64zg/Sr4QcIXZ5Xj+Xmb8E
         ZylNDopzyhSzoamVDMz89EmmPeAVDLxvG9NSt9U8cOi6n3+i5EkfnlyMryhit+jVhmzi
         IARbXFullUNljXQEYduBoUukZaVh2G678GqSjehegPedRsob9kpUpQyNCZaAcTwlSXg0
         LEUA==
X-Gm-Message-State: APuU4Z+Z9a7Zsdi3yqdFavB5TvBRCf4gbc5xr56FUkC8/iB2FhpvUxjD
	AW48HQAzFrVN+dx6PknPP2LKYdvD7Jdh/61EnoA5slwhf8iu422VqhX255dZldfHxj7i4FAU1cM
	xj/jJw8rAT/MSPrKF9KovQj2XPgdlHjDwkJUrdEoFiX25Bft71XQMoB3Us5GsfrOO6Fu/
X-Gm-Gg: AZFdTZdfpaiDjQpCAbQCkeAzUullTcd8WH/mBYhw5oxoqjh/MTxOkI7A+Ezu/xDgfTa
	CRwcADmP+DFVXzaAPMDqFAPjtwQC5n43+HH5I+ueXrYR09Ij1ixDYMjrHlZ9xXQ3psyygNcmztL
	RWk638XUlonjYvwZpNOrNzunsrXEwuH+i+7/4c9xXzgF0XCs9GLVopd1skoTj3I4nlv7zRAJATR
	FZYHwhFWhrDEn8XD3VqSQ+3uJEvJZyuNn5apMnd0ZeMR8qIKOsm7Vp5k2tYqaRTIoRVTcH0fADD
	PxuB7jIT+ctQQI0/S2muEpd8eYZmUjiGDdGYDoS0oARnAiM8EpCW0r8Bjee1aAAY1bpMpM8CF3A
	6WX3mVc2Hul43BzfSwbw16BrCmbGZ5yJezZ/OuAEV5HMcilZgTfTOEKV5OPb+S4aoY39rHNMtPC
	r8gbl643o=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492983985a.2.1795550528156;
        Tue, 24 Nov 2026 12:02:08 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492979185a.2.1795550527583;
        Tue, 24 Nov 2026 12:02:07 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:06 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:38 +0100
Subject: [PATCH RFC DNM 09/15] thunderbolt: nhi: Resume the domain if the
 NHI suspend op fails
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-9-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2000;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VkyXd0QiiEQncfW+Bjx7hTZQ7/bCBvoRe1dG6P5u4+g=;
 b=w4xeWydBj5adKKUqB+y+5tcwfjeukaRXas/yGtt4/eWlBLJ0+XyjsG0TEgr+nRQgr/2bi+iTD
 lWRKVcz/oOXDJ7Uyl0lDZjLWx4f3oivC7cVJnV6F8m77tjvMrYmjYIe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX8ga0N4xPoQlh
 6u93vCl4I/7kT9C/P4LDbZc6gZUADfb/0+u121xl0m7UvOvlc5a/xvfBEYqmnv5w8fSeEEs/O8Y
 J867edSW7g/XimbtpWVV+rNuO6gVewOsebR+ZQTqfhmGXzgSTjOeSovMvRs00aFnOjC1oOUzh8x
 FusEp9/+wVsQFQ34mthbiZpv+ZERxnGDP79A41iN+hgJ7v3hP4Lgv3aP+8doxiZp4oVnKyF8iXd
 npe2HoJl1eIjmyFCiYC6rUDs77fBiLeHTDLR6k9p//kiVhb/gSZXNukA6z69xYES6CbNPdX4QIm
 euOSmkeYzooEiVsBXwE2K9tOxFV3BrNjJw8aELI75tJIA6p362H8VC2YpGsxin4tTM2EYuqHhqK
 J6TWWQmfdduUjYIJsBhwYF6FjzwrSyEc/92F39zNkakOkRvbCStJVC+Vf5c05a+0vVDSXS46hNU
 VAt4Z6pXV9KBgHb0Fxw==
X-Proofpoint-GUID: itgFLnXjq80maDGyqP9FK-KpzdwjGNxO
X-Proofpoint-ORIG-GUID: itgFLnXjq80maDGyqP9FK-KpzdwjGNxO
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05ed42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=kCfvZJGldO2mi53t-5YA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXzy01m6NZVIVa
 xE5bR4YeAu07NPmRyC/FfumX0Qj+GSMCw+ZGKTlmNTvy/pl0NUs3sikCOFYJ9X01/T7nvG31IPb
 Mi0D6EcS72Mq+S+Mdy4klu9Ry3OYqek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

nhi_suspend_noirq() and nhi_runtime_suspend() suspend the domain first
and then call the NHI specific suspend op. If that op fails, the error
is returned with the domain still suspended. The control channel is
stopped and the switches are marked as suspended, but the PM core
treats the device as active: it does not call resume_noirq for a device
whose suspend_noirq failed, nor runtime_resume after a failed
runtime_suspend. Nothing ever resumes the domain. Hotplug and config
space accesses stop working, and the next runtime suspend attempt
suspends an already suspended domain.

This happens on Qualcomm USB4 routers whenever the router firmware does
not acknowledge the sleep request in time. The op then returns -EBUSY
with the router still up.

Resume the domain before returning the error.
---
 drivers/thunderbolt/nhi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index bcc2b959e3b1a6b014c13a4938ed6f68cb0d0fd8..e2578740d569a7ee1d5ab22e8effc153cb7d4632 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1177,8 +1177,15 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 
 	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call resume_noirq for a
+			 * device whose suspend_noirq failed, so resume
+			 * the domain here.
+			 */
+			tb_domain_resume_noirq(tb);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -1281,8 +1288,14 @@ static int nhi_runtime_suspend(struct device *dev)
 
 	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call runtime_resume after a
+			 * failed runtime_suspend, so resume the domain here.
+			 */
+			tb_domain_runtime_resume(tb);
 			return ret;
+		}
 	}
 	return 0;
 }

-- 
2.55.0

