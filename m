Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611713;
	b=0OiRysbhrgjXbDBHasLfOgfPGSksBDf7gDfbvn01G/JSjiEXOZT5VVz5eZ/n0eSMGyv9
	 hv/JUKbp8vG//gSXdNxbuQrsYqUE/8E6bUKZhnBggyRQv61xxUDC55mTlL3p5zbJ84TL6
	 +Y8KOXXA15tCrUIv06iFG3yGWdhrReFBPYQslpUry86LeVIV5digWdbMLrwMILlf6QhmS
	 m9Wg/T6twhfzwwZSx5QwlvEBSaKId1u8K/vquosj9F/kx9QAXTgqopzJPlybMwhEAYdST
	 5cc/IJCs9VKHL6Y5auw50qdRsS+D3bMJLynq4nxjDxFu5PhiFBpLYnzd0+TLxtiss6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
	b=yKBJUUNdgur8DV+zTrvHSf9JYZfB8/SgW5n7aE7oHlPdevHq5x8cDadNe0nhvP9BPfru
	 EqOtTpQPqxcbZtsimYpIZlHiARgQakg0aucvmKCsCbQB+IHZi0MvVJnRhXkpKBbCeJd96
	 tCpyFE6Mj38TmTmeExsVy2hDJL3drQ1oaBXvLmwAd9vLr+Ku5IwRcBfXvhCvRrdEv9O4J
	 xYP6hY5FfJ6aFAu+MQsidnBwkDGFiI3HJCHj+gWvCEaYH2Y8AVVAdkFHRa56Wyzq3wTTr
	 Bd+e6yqud16W+3sjXrAzM8rnZmEAjUz7UTxqaqIY2gfUuh1GChJoWzG/cmBuxNJVzeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiSGGqkS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86B606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F86B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiSGGqkS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALC92880833
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bcAaWAAo29U
	XjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=; b=X8s1xPRnEUjh4VACQths5mr/jZ2
	+M5KMt5X812eVjoFa/aQIybk9po3wOmN9U/JFiupJ6T4YpD+BO942o4fIzRrIXe7
	GdRNCPNNlh36tULSxUBT499UEhDW9wYY76rpssIf0kyu1NT37P3lcFiiphBFQb29
	i8gnTKw+9TGxDjFWdgTlKkj/M94y0GEK0eq2sscr5vgrUqNBdBU/UP8OaKqZQcPP
	3Y0n4bTpSPXG+lZybYWNpT1YCGDvOeaNoOXnN4WXhx3PZuCrLan673vYDD9x50AW
	Oq5NvkosY2y2YaBC/FlCowXtfyYaQXEEcBYvc/HOJCaa+ICC6bFlLpG9vOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg4mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:28:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso398808785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611711; x=1794216511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=MiSGGqkSz9AEyjV3CJaEdqDY7lsUnjqeiSRsy1pleKRHLjayB3n891m3RrK3zeKWkM
         LtC1WoKTLK5xI7JlF8yv+X2ACYi5nlIl5LOBZuvIUPnO9PzlNIFfRkQag7frKNuR0vIC
         Ro2fetpdvcNTNbqG63hDx44uO94gdM8IA6EXeKKEc4EnmZMyl1Su2iT10id0BF8vmCpz
         zt+6An8I6v1/su46hDJ+FOoSN++YHQzi7N3FQgMtZMM2sYHfjtgUEKv8fGd2LqdFZdET
         Kdarvlr3aqUiUgm2Ia/F6JjwSxotvkCyjWywXPT4RTmZUYOtC9CYJ82FjY1UF7/szyXU
         0hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611711; x=1794216511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=kpTc5I8bGJLisREdqUrfCkgBf/mUBg0dXDLQKxu1XE3I+XkbvnqKWAoddyq23dzLb9
         mJgwfSvU1AJL4ubfBmOZM9/jlficctnmLIo+6SUZNK5o+7Oh9Uz+/NmRi3FIqICmBWLj
         lC8yAf5CqLJ8tcsc9etQPgcvFCAKGKKlQkmZCS0A485CZpI9AAv41N7pUDeATAV8q6Y6
         IUWdKuJjkij30jEFDWIJDshm+NULBUruQbSR6BXgXbu8Zr46RkWY05/jsDEI7YaF8eAX
         wHr6FKegE2rVkFcXCVGGh1ZpbEufMDJGz77AHacTLqPVtY+hfCK32QGC6a4W/vWg8a/k
         RcUQ==
X-Forwarded-Encrypted: i=1; AKwUvByJO+0sUCQBmKatiT2d2NLDvhiIPxgdPKilc2Jp9l9sVl/gVOOHH/3r1UIHfeTURE+N7j69XiQvAdtj5NKH@vger.kernel.org
X-Gm-Message-State: AFq9FYJDYNtTuDu4S6zptOttNPO3IKjKx8mU0vqteuOYgwec8gIsmXot
	IdGQKOtmKaiMT3H+qOj0mrgCZ992QqEXPBTog8xTDy8nePf1ESdNZlIVksVBUurLkkCMobKOdIC
	pHBPCjNo7YhSR6kclHqN8a2Afpq2b0XY1aEULhJwS05gw0DfXE/sokxfRQA5mRvMbOdKu
X-Gm-Gg: AYBFou2R/8RZ2E9B+wZgOaXeN9VV2Aanb/Jpr5oprFg9L3h5VI9dpefR31m2s8YVboP
	nnFfMeKoKxl1g3d1N4l+UudV+kpYtwMeoBZ7fJBDlB5gvMIa1GTssfbrFT8MYDLEnfYTFZ9mW2k
	Z8vy6MhRd5bUWHzzrDCWShL0s2ovWh4wDR6gnaLofVS6TExRZUGmHCxbxcCPRf+ir9hReBjhha9
	IhkXdZ9Aj6dZlyG5G99mXUjNBS5Efh9IWoX3PgwnC0Jhiov/QohpJjxjGYRWaLI3UCXDDEqbeCP
	rfV3vhHxCa7BndlaAE3LK3Bt7LyU5zGZ0z7aVXEjOw/TKjnp0GELi/Ub7XZRPYEIcqKtBD8atGq
	dFAHM2enSpi/cdg8IaJVQSIyTg27+bbTxP5SzU93jFiDHZILzYWbfzRssUigwkreKAqsvwOK9Jw
	==
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585043585a.71.1793611711443;
        Mon, 02 Nov 2026 01:28:31 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585041585a.71.1793611710931;
        Mon, 02 Nov 2026 01:28:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm22171893f8f.3.2026.11.02.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:28:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  2 Nov 2026 11:28:28 +0200
Message-Id: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com> <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com> <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l> <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com> <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy> <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com> <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae857c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=MqBAt_2VOQeXeQd1tQ8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZS0ar9I_bf2bxX1oa1BHwtCJotM8Jgdk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX02x6s4qKW8Qb
 fYaQIUjwg3TbV6ULRBxS6P02EPB+Hkzjee8kCmRiihHRRBfqZXYrTuZ1xacIJhN1w9orIgGCG8z
 Pxobm43/uEORoUFlGt9CvZHHcDMVcWI=
X-Proofpoint-ORIG-GUID: ZS0ar9I_bf2bxX1oa1BHwtCJotM8Jgdk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX5t+LPnMWB67G
 we1gmOcCk3PjtxF4H86ab336KIdlsHC4Ixl+y8IKnS4lIpWz1PIGa9lVOUuPQEtLo22xVpfcGgi
 wSkFbsdMaJDS9xzOrXTG6YZMj6gVhASI4x3ViAM3LlhQX0rfulzutyyh2KI96KR2BYSjiWn0u2S
 54NNUI/ibW7mc5wL/AwYA4nPT4mTuv2wQu2/9+adx1D2xR66X+jhJKg5ZOL0F3OM5mwZeJbiJrh
 ezuoH7iOyyjLMmH0ISaSIzIeECryH4CiNU1RAZKY+YWHGBOXJbfbhSTx13nRZZJ3Z4WQ1nDE/22
 QCHH+jsg949rxcnbUzzKYSTF95Vm1mZLUQveZaIh+z3Pao4ZwvhbLK66jVkqZip67J1ohFf2q5M
 jUJCr0MqlakTvNm0it7CS7iXDrDh/IQdBY49v/Bi4SnPcVtTmvoAXAcn62LN55WnCjqQK3butpU
 3dAkKTDiuNRf1b1tOqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020037

On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> This will be true if:
> - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.

Both hold for v7:

 - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
   subdomain, so a performance state set on TITAN_TOP_GDSC reaches
   MMCX unchanged.
 - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
   so dev_pm_opp_set_rate() votes the MMCX level through the single
   TITAN_TOP_GDSC power domain.

> Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> not match, so we need separate entries at each of the corners.

Agreed that the PLLs need MX. Upstream nothing votes MX for them
today: the camcc-sm8250 binding and DT describe MMCX only, and the
rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
the camcc node carries MXC next to MMCX.

Since MX feeds the camcc PLLs, which every camera consumer shares, I
think that vote belongs to the camcc-sm8250 clock controller rather
than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
power domain of the JPEG node. Does that work for you?

--
Best regards,
Atanas
