Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795882215;
	b=jZziOnX1dJYGuog6rxb6PgsQqRwFL18xDH9QWI7woyS5d4KstnUIlsZe4tMBKRAn39K5
	 pgQ2iJh/qoGxUVnfOT1PZPEawu4O8riWPwaTW8lqf5qjRA7z1jVZnI/mmCnFT35bpTVJx
	 SPP0pHWSOZF2/hJkWVeYFM95YxLsCMWsmfFXgOwF9gZ2XkKJRrs1QOuUr+kKQh4OwUH6/
	 wCEc3GCCcJNQWyYgYzmbSFlVJB8wszYiukq9g1W0RQybUgStPWC4S39iPaBVjAJV82WFA
	 YXbTv9rtSqSc26adBZM/CqfoiCAFC/2ucFsP2QUJx/gPlwNkLSTqE0VSwHZ36zNHajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795882215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6H+Sx4BrYSr3AWXY909pVSIxWLcl+QQRphAzAnabLds=;
	b=eA/aQVeIoMdZuQln14ofK/IdPslTy8xi1wvqVF6SmBDyw1wHpY1A5KS5gqpp9/5qr2lq
	 oUs6J9HpzYvB95RH45lCKrpq0HLG6d+R45aAFBVRn6P41ndPP7HPdBw9w1b+An8xliDIu
	 co1m+M71g6D84XYu4YolZ+ajFQhJISTS4Mgi7TYK+lXiCsTDn/squhRzBVI97N4acqHCp
	 bruTYDaRDf9kT89/fp21Zk9z7Z20JerkqaGhFPcC8cw+waP2zwY7mCbLimzfxLMEcVIMV
	 6dhctvaBFrRFiXxDFpYd07WkGYq3ka0AE8pbv1Gxkhc5lukNe8b8ecowMuXKOVklOVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKc9mRYV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbBofEfY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC3606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91AC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKc9mRYV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbBofEfY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAJ8RK1412715
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6H+Sx4BrYSr3AWXY909pVS
	IxWLcl+QQRphAzAnabLds=; b=UKc9mRYV+Cm5BB2cj2rKMnheQm6HzBLYDRIagY
	gzui4Bh0YXrV8qmwoeyTrys9yjPteQ26lAJlM+FGWRp0EyEQ2pTnMBPzDHkoJeve
	S8Bx9Fc0ysfOGUx7xOOZ+T64Pcgoq5rv/z1yrzm980IAsxGynph7p/4Vb93xQ+uL
	j/zemQ8wqWRXRMD2VXGullEUnikDK7Z9H1HymPURKaqh2kkGLsNH/eTvHlZu9ovK
	PklxvbYq104ZL1XxGyLOIk582VBLQhyHh2XNzW/fHI4MwwpoLiyBmWpd1Zf+BTXn
	gl6ySNCLifYE4FjeyYmokTvdnqZ3FG0HMN6v+qFsFGrmQuCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7ny69br1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso11178562eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795882211; x=1796487011; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6H+Sx4BrYSr3AWXY909pVSIxWLcl+QQRphAzAnabLds=;
        b=jbBofEfYy+6Wimmvr5MC8q7wKteL6VHVwpp7Pp/ltmv8XLLhwRVHWxog7PBomuX3S2
         sff3YzmK09f1+E8uEJsWk78USK2bz+NnRXsEOdJUN8yABlhhLhVw55mwsNcCbsbDaKVi
         NAX1rnkXb8s0vKhXzjGF5/jznI3qSnsM55Lxa7+HK6pfoJ656lva/abWkffmK6SZoCtN
         FW2ypk4mmZbykV1OOMNiTvSDh8VctE/+rBs/yvb9WZyUL+m3I7FnH4GbxM3bG/wxO9iS
         JCFjHHTXRJDNTRBJOrWmHrxk9jCzssUrbtAbBZKEOZKg7bSaI43QbCW3XngnWtAutqt1
         B9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882211; x=1796487011;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6H+Sx4BrYSr3AWXY909pVSIxWLcl+QQRphAzAnabLds=;
        b=qvY1BuJbq4HCcADkopKZj4MQEWuQCk9E6R46LUkp2vndMlfcWML6TTYtRtxHyWZKSb
         auacO0yB9mQuWWayHougBtY6G6SuUkSoV+/qqt4CMvS//o3KIllajzpwXXOObB5NPXuW
         oKDslNuXgB0Izz4zsvITiUt5SECs1xXVua3uFf3XR0neMKZ8fUgt88nfdOQJzBBa0OJC
         aL0xLOAbvbmtNbyqN92v3qoSFU+h0ZZXzH0/cDbhueA/EEy707AseU9iKov0xxJS6xG9
         oayg84Ln+xkGWdQ8V32yAfpGT75U41Qnods7azcsP34bq5SxFr+gOVb36ULj8tgloqBI
         h/0A==
X-Gm-Message-State: APuU4Z/RZ+xm5OTOObmk5o6pg3EhXFEOszC1CTZAFUraU2nvB7RTRU6T
	uiPztckn2dKlqA/fJil10dhQwdo/Ro+ZTjnAXdqKepIMZTgFc8Xn/k27o2NzjM2n7/QkIHL9CBd
	RnbPSB1YMKXnhD1GsSLhAzqDJaFfxfGb36vVaZfwYfEs2HUtn6LVyMmCGpurFHPuuIaus
X-Gm-Gg: AZFdTZdL3t2gGZvqz7vMHfZFPmUMZATkyCjQDuU6nnGt6a4ZzIzkS7w6y/aTrGfah0j
	UQeY5+yE2HEN6g5e3/06qjWacTl/jst1dMYE/xFiT1uneM14GGplH2gGRScKHV+Z+a8VvaJAVkG
	qBnbfQ9fT3CXfDZjjVd9A15vbaw9xJoumUpjCoZj6oNpFOcaBwf8Lv1ETwM1sgAbPNtBv8HDLcz
	MEQNG6TKeOFfymp6rIfv3CNJWQ3RwBcjj1A3tOraufmH4fNAtA0YUUyCfumNvEpEHMy9PfvM7Yb
	PQX3RrM9dprGTGImEh1O3OroP49+1Q65CuJ5GLW1KGpnARijSdEdIW6x9JG0vN2+OtWzfFNjkJk
	6+fCfDjP9g69X9x4IcGGp3lUGc03r46gCdNqq6DBbzDXoE1ScygHN2USktex7efi0mh45towNkw
	0oatig5BgU3w==
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr35413183c88.21.1795882210992;
        Sat, 28 Nov 2026 08:10:10 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr35413161c88.21.1795882210426;
        Sat, 28 Nov 2026 08:10:10 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm98647481c88.14.2026.11.28.08.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:10:10 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: aoss: fix cooling device teardown and bound
 cooling children
Date: Sat, 28 Nov 2026 21:40:02 +0530
Message-Id: <20261128-b4-aoss_cooling_upstream-v1-0-55c1b0578582@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANr8CmsC/yXMQQqDMBBA0avIrBtIgkbtVYpIkk7tiE1CRqUg3
 r1pu3yL/w9gzIQM1+qAjDsxxVCgLhX4pw0TCroXg5baKKU74WphI/PoY1woTOOWeM1oX0Ib2TR
 964xqJZQ8ZXzQ+7e+DX/z5mb06/cH5/kBef5/qXwAAAA=
X-Change-ID: 20261128-b4-aoss_cooling_upstream-2605597b6170
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA2NCBTYWx0ZWRfX0lfzrLU1pzgO
 lIwg4NX1gQVqUxzxai4nRaryIGV++PFvYW3yzeyqPMqPpBomLMQq5FFGIzowgtRo0TdO3G0psxA
 ZUR9caFdRaay36qTq2Xxw92fozhdSFA=
X-Proofpoint-ORIG-GUID: SVF4Ltx4zga818S36pkm17O21_S12diE
X-Authority-Analysis: v=2.4 cv=TMfQ2Fla c=1 sm=1 tr=0 ts=6b0afce5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2xSpECBfjZfySUlGadQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA2NCBTYWx0ZWRfX8o1/o9lZ49Vi
 vSNsQfoIRCPbGExmdO60O1v9Gij78FMptB3kjd1Dw9qt7uqkA0RSmZXzzC3d3P0wf7B8GYz2HGe
 Sserzhqr3t7B065fhvfGgbPzdlM0/Lh7KRaypkxwpqQ2MqfbC2cVlIR6Io8OWnRTs/ryCxSJ1ya
 AkAXNBotEN3f8ICDrMN6v/Sv2hFQq7WG8vVuHxYzd3a5xJozdeFL8R6Hg39gfGyvWcFtd8dFRDT
 dEn3jceRKmlBjL+yMCFrAFftw5FFWnAo2P3iOlizd70JF6m1+Ef9F6CdZJObztrGwnWr6R7emrr
 gGpvvN/SG9o4v01M4GGZJIhtyy0vMqOzDwa8elntjLwYxaha+ELBu+RyOso3XqhysDV9gdswEJ7
 rOFtAgOeTO0kLPQJ8LSpLG7/7xh2SJZ9W/K/Oiqo8qe9IZJCWA+77NMUWXBDwFxxlxcMxPWKVrf
 OwDqOghym6JitgUI8aw==
X-Proofpoint-GUID: SVF4Ltx4zga818S36pkm17O21_S12diE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280064

The first patch leaves the cooling devices and their array to devres,
and queues the channel close and free as a devres action after
qmp_open(). Before this, the cooling devices were unregistered by hand
in the probe error path and in qmp_remove(), and qmp_remove() could read
the array after the error path or the no-children path had freed it. If
a later cooling device fails to register, the earlier ones now stay
registered until removal, and probe still succeeds, as before.

The second patch bounds the array to the three cooling children that the
qcom,aoss-qmp binding describes (cx, mx, ebi). Without it, a device tree
with all three children writes past the array. No in-tree device tree
does this today, but the binding permits it.

Both patches are for stable. The second patch applies on top of the
first. Neither applies cleanly below v6.12, so the stable backports
there are manual.

---
Anup Vishwakarma (2):
      soc: qcom: aoss: fix cooling device use-after-free on teardown
      soc: qcom: aoss: bound the cooling devices to the binding

 drivers/soc/qcom/qcom_aoss.c | 52 ++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 28 deletions(-)
---
base-commit: e5aad2bdbbee783611d32599f89cea3f12f9593d
change-id: 20261128-b4-aoss_cooling_upstream-2605597b6170

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

