Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB23A05C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170356; cv=none; b=T+xJjzsd4DxPVA9YBRNfqhoehwrnXCldts5Um9Oj2OFbzOv1IWhf+fLUQGEt6Ua+SSt+I7g7mwHrU63om9sCavR3+HVe8vg5o2gXhMdIx5XiIOUoM3DRA+Um6Z+9cAjZscpbnEBrBhvvJK68kJWmIYB0BmUpRHzLQ86Rp0JJnYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170356; c=relaxed/simple;
	bh=nmRrx1oR0BH0XgAAu9wmR3V3AJzHV7iNItpEHazJysA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEZShORVdT5q6r0L+5UX554EbaL+i+Lul6pE1pozQkS+z+7Zr0yr8lNmR22hzu+UbgXvUijTW+U16/Ci/8jQZA6flwm5Y8PbfqhmSJTZqpicD0YmSeINHG9dqxSdBJwdM+UD+4YKGBa8gUCfgoSa6jzFuFFtbZWd8usr8hbw+VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1gKkraP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlU7xYbr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1gKkraP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlU7xYbr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbRPk3295417
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJc22ULLzoVpK0pQz5J4SJYa+mta6CEUjm9M/VGF68M=; b=i1gKkraPKMS+7Lsc
	3WzCUIBj1IRCgfBZQ71EcDw1F3yZH7vSIfmCMhHnws3KKx9qDiNmPzzyg3KSC3yc
	WokZwZwbt7XelWJ8r21laXwOyBgsy+WWZInCuud4m4deqlFUP+AXaW0h8sTN5N/P
	YwV1TXLHi/5PaJ0Us90dYNUQD7knHmNTAmsvy6G/MzMYgxTQqf7J+P1C2iu+UeTd
	GNMKnCsLqRluQx+oBjCsKLeZksyhV4Ead9wmFojAAw+RIdR+byE6S9HRWxQ6V/lG
	rEn/eEWn/CSxLJ1isleQ5hHLk899c4IIIpmyfgvEOHvnjPIt80UPTedmuBIdYU1F
	kS8ouA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm91ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:32:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a760965865so69508137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790170353; x=1790775153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJc22ULLzoVpK0pQz5J4SJYa+mta6CEUjm9M/VGF68M=;
        b=TlU7xYbrRZ7Ox9pGWpW9c3AFUfSZGF+Zjn9g1XUixRylZbwvX4S1i7yzBAO96vqc/F
         oIcCOAMxUk0fIqYBXmYAgO3HU5zTtq8+B+yEsR9zi0HC3eWdqa6USYC/mwNb+hSkkx3e
         MkAHD++4Cp50Ccqaj6kUNW8WucpQJe/8giofF6EngOfYsIc4kt3vlyUpalvOH92vXVL+
         ZKcb9PvGe07iK9GTqOG+VF5RT0gyOEYQpyVgfrjGstL7Tlzkqbc7P2B8WWXn+28+eORL
         PW3qMBX+gGdzxg1mstxp7OoScOPRJyMMypOoO40ifjHkokjDrd84sYMae5SCNjIGNRMY
         8I6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170353; x=1790775153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJc22ULLzoVpK0pQz5J4SJYa+mta6CEUjm9M/VGF68M=;
        b=zyvwe+kzYpZMJQDR78ZsYNpMzXYF+Twp2PZavljes8MH+nm1fkGW/YoJZFxxC2zFeE
         jQN3KCp+8W4YzmAZd2v8dK/rpHFswxkeoF6ozSAsfCqLjCvejCPEdS+38vG7m41NTdBM
         YmDbNRV2KQS5a+zelbgKcrYo3kLvbMPDyQbInS1xIUP+XpukSUMX9JuTsEi5vHijMHCJ
         MKpdGqSxkXj3B/dIKmKFVD9lLy+CaalcA/ecrPdFxKOGjeLsEQsi8CGnXqE/T+4kgbEg
         WiI3yJIRhxTs2IYN2X+KOpku1XotS6ZwM5mw0h2fFojJS8EOVetX939Y6bHDEI/lhtyg
         XDMw==
X-Forwarded-Encrypted: i=1; AKwUvBxgWQ/k9I/8nV0HB+hVYZ5XxXoQVCZkVii/L6rwOmfC5vbAvZkW9PmePmmbszZfibe/HHaP+wn2PzyTSi3x@vger.kernel.org
X-Gm-Message-State: AFuF++mctg7aBCYkze69YMa8TA8m9xKeJK9Otft3uUY+twLYTu/b19T/
	irdGQBf6fnpQ6G9MASHiSMwg1xoOEL63iiy5BSahPvCPA1QCG4P17A+Rqn0EYHVuJk/psJgUphA
	QolAzh3Ry3X4Ne9ZuVWcagKp+17l9AHmLCOss9U0ZsA6xmhA+KWeEZG/QyY10fJCtZepT
X-Gm-Gg: AYBFou3OhFb4+wx3h6DHA0dPWaVKpXLq5nhbQpwUv37SH3ehx9uH4Y+fzD4RfNn5ITT
	wJRmdOMPobGikbW0+8XZscJkHhvuqJXriTiHIBNYsVIVdlkK+GDVW1kK6DpY4xrhWZfGjUXhPa6
	8uI2gpegtrPbG8WTrWfMi2VltX+WKRrt7y6qOivllhBPZW1iezkBZsXBDOCwHZy96TF5R2pY/Mi
	fuuWsBCNeb1qi+YnvsU9NhMXOvf1QQha0lri1wZggpbURGBmjagA2lMMtyDJEoxf4xunqbymJsY
	WswlHsy14IhEJWSw96RoXMJP/jarJiwMsLWelpOgA3L63xhoDvPt+JhFzD3NQMNuDxfNDh1iJXt
	5ajAA+192HEKy6UjCx/xIOQ==
X-Received: by 2002:a05:6102:508b:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7ae544dcb9bmr525648137.3.1790170352841;
        Wed, 23 Sep 2026 06:32:32 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7ae544dcb9bmr525575137.3.1790170352179;
        Wed, 23 Sep 2026 06:32:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d85787b0sm611269e87.16.2026.09.23.06.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:32:31 -0700 (PDT)
Message-ID: <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX6Unt5NSg5TSr
 CKRXVZ9AICobKzQbGr0bbZKM3Z7CHB0KMbOdwlQYmc25INfKDGshaVNPJpHxh8olqGWf3Dpija7
 qZzx1Ea0adMj9M3rTQVTyHxSQNAX+PM=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3d4f2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=h7LrUwqXVdtm1vm8ficA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: XVOM0rJq7R6NTrAbpfDqL7fxIuwTXodd
X-Proofpoint-ORIG-GUID: XVOM0rJq7R6NTrAbpfDqL7fxIuwTXodd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX8Zm32gX+ZKhC
 aIbt6/TUiIH7fKm7AD6mqdx4CcvnFtAt5SK79gtugmtolAnDGxo8Bwo4fU4mj3IE0OZzCKkfutT
 2aj9Bi5ZD7c09Kjjby3E7d6AYFWB1toirGs5j+MLBKvI5wIWuOZWiLwCRK0cIkcMLq3pvBtEuFk
 Gq1mWQ4cHf8t476HJgUqbPMH3XNzemWgRqttWdsnb32lpqdx8lzNXxf9GjmGA/6KVRYnENkgjKy
 NSbI0bzKTCzqVoR46TYAvYCgVJAZuhAIksa768WQZyqd7695AJ0uhKfX43WJ+3zoUloVhQPkXsq
 TUTTTMFvb0Az7uUCz67aoLtDUrRnjKo1u8sIym82oDoGzlvCe6FOiDdEdYFjt2E3WtIwpfKHATL
 kNbP7qe0nmzU94x1fv6OJjnLnzotMvyBo8dfgT90qMLndz7BpiZmN4VWiYYVToxmeCPCsNFZCpc
 OeeyglfgdCpXaKcvdFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

On 9/18/26 11:27 AM, Gabor Juhos wrote:
> On IPQ5018, the APCS core clock feeds the CPUs. It can use
> different clocks as its parent, but during system boot it
> utilizes GPLL0.
> 
> Under some cicumstances, the 'gpll0_main' clock is getting
> disabled during kernel start which results in a system hang
> then the hardware watchdog restarts the board after a while.
> 
> This can happen when a driver gets a clock in its probe function,
> then releases it either directly or by devres cleanup on probe
> failure.
> 
> For example, since v6.18 the kernel often fails to boot on the
> TP-Link Archer AX55 v1 board by using the in-tree dts. In the
> failing configuration, the 'ipq-cmn-pll' driver is built into
> the kernel and the problem is caused by the pm_runtim_put()
> call in the ipq_cmn_pll_clk_probe() function. Due to this call,
> runtime pm disables the 'gcc_cmn_blk_ahb_clk' clock asynchronously
> which results in disabling 'gpll0_main' as well.
> 
> Mark the clock as critical in order to avoid such hangs.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Note:
> There is a patch [1] awaiting upstream which intends to solve the
> problem in the case of the 'ipq-cmn-pll' driver. However the same
> hang can be reproduced with several other drivers by triggering a
> probe failure in them.
> 
> The actual patch aims to solve the root cause.

This is a good workaround. Ideally, we would resolve why this
happens in the first place.

At a glance, we have the CPUs consuming
&apcs_glb APCS_ALIAS0_CORE_CLK

which takes XO/GPLL0/A53PLL as parents.

GPLL0 is a child of GPLL0_MAIN, so this should never be gated in
practice. devlink and probe deferrals should make sure you always
get a valid clock handle for the cpufreq driver..

In any case:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
