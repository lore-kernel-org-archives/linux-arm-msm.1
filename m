Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646035;
	b=YH4heSbgH7oHq/UHqOz9DL9o7nnzvcysT/rrK6E2/zF1r90DGXwXzR3xwG08rnHMVrKn
	 nvZwiR5qN6z4pUGCbBYPaJKliZQl8O8BPquQ7aMeyVWnDqJh/9h1PaDkrIQCs73+vTVN4
	 AyNWbks3hl8SIsxnDEk6oeGjxTzCZLbdHJ8dI3OLY+oAqj45OJtSFeN5938a5AZnPdyav
	 rebpbfPvmyAMg4t+7sm0ZhXmFPgOXI5oGpIhL97AQIOBDKMpHSqmIRNQjtdWwAKRQEQiI
	 8bvCQNiguVUIVZp3UM8xeHolKbhcA8/terj563ZHYuOKgF3UH3BF3ey5OuPk7dPegqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nftAenQ++hk=;
	b=n4eBQQocDVDuuzlo9PiMMJMGU0fzDTJJkGaAvBmCrSMlM7PIAP2XL4uBk45ZcEOiT/8V
	 fsuQ7cYmz9XPZPo/W9NsuKgtoTN3KXmRpTd80KqHpG7eW6k/DPWEgPIXmxGgQPoFq9SWN
	 C3ioK2Ak1GjCq+uBOPlz1nj1aV2nMSx38J6NX3RiYE8qMIchI7hALMCFqm9TGsEP3dZub
	 9z9hkh6q+wkr7/KCeAnW0BY3FCXzjyRuvOqrh5VAUWz05p6s99JgEJ7Bm8kR9U6tHnnGV
	 qtgMiDZSzfPVrpWxZ5VXOFXrOEC0wAkuLemt0i35wdf53zlKd97lD4lyvpyeik+8+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GM5u7uVC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gnTZICHt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF0606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 19:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBF0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GM5u7uVC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gnTZICHt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HPOne966449
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 19:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nft
	AenQ++hk=; b=GM5u7uVCwYXNE+NH0yxrLu6LAfSBQylgvZLBgSN1Byt3D2gkflL
	J2J9FJik0nRbwirrMRA/uBpLy/X8RtQ/iqnagYpZi882K1apvtqhtMEQYT0VEqLI
	dDnJGHod6IQmlH+iB/AfLC61lgpti5jXFFYeQ1WBhPQGuMl67PrN3bnsbep2hea/
	dEqzZ2vMAM5qwcYAnY+/irAMzxoVu30mU6jPsvZdJl8XN2gDANColHYkmTZl+6So
	cnWDzKlligIUbRbwE1b1oqH2CmtnBbiuXlI2oo89DOdy3BZEuD5rLAjBAhff0OFZ
	50I5LB1U7NZ0HjGScdgvJYEhUgeJYzgwY8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph1arpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 19:00:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so2841788a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646014; x=1794250814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nftAenQ++hk=;
        b=gnTZICHth5vAmAa1FPSrB2uihkq6a78pv5SukDN9X3fyC670tKLa50QNIga793N7EH
         ZQ1+yNxHfjrSErli0JlFPFkOqKj/bxXVjFk3/LshL0o0pGEnWUQpRb9w2HBx8fUPaM2a
         xVByQoVaifoFgJBTKtUsH7o23zadxgJAv462kjZPmY2WKlw45Iun0TDRhB1InMt6YPSb
         pTz4B1EQ69gQhH7EBMfI+4IvpNymFOC53let5gPkAUfKUrWXp3R4ZaKXRkBVJIPdpxVI
         Whcq95/4r9oihnowaYRPrcQjeR/h8OQQoMCf0OLKZRC9UfGrivXjVBC2EzNm4GbFqUg0
         RW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646014; x=1794250814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/cvMVzpCOPhWRaXnpWsNQICJTP7fTN5nftAenQ++hk=;
        b=VtPax/z4zhdjDFE8bQ6okvW2nZWqaWLxV3i7iQ161boCHhU+CmOCtGJZc1lcoEZ2JG
         Vy0d8PY4SXcO9thUXQKqpKP+gJRMEbLnFRqT2RRhPzNZHNZYlOlxaOojz11RA9mHBFYh
         ZCN8NGwS1XTRxeWuugAM/GeoQIm+mE9suJDL8r3LBhcrO+Jqb8ZJyVdCoiD6aUftZQij
         wBitZyDLvB2ddhWktDWTKUdJ/zg467Y6K7TbfxisC1JhBueUDwEPagUHP12tIIArDW8y
         8zre93/0r19rEMwaA8nguEXbEIwkQDx6o/Qo/GmZ1Zty1xe8vZJAtTbJn0LXtmjsp9Ns
         daEw==
X-Gm-Message-State: APuU4Z9EsMab6mQ8RKE48NIIcUS0HI4LkNn68a+2tfLRVNg223vJ5VY3
	/rGfL3LQGwEK+VOLz70Dc4lLSnfIu4036uFnkp2wkafeMYkn2DL3aRyuG4KDGVb074w5evy5oyz
	13ZN+lQBXGAS02gRq/3bdlhtyxgp8N2Wfz8Sq+QlXYKPjrxaGIKlsVjJZFsioiVV6o7UE
X-Gm-Gg: AYBFou26ijzXo+OOOsN+icw8zC7dyhjHw0Aod+lnTXbYIQ+4/6rtXFYVqEvgCZvbH4y
	qJZERKlmMOwPjzQFO1jW5WGiIvHXnLNdXCXsiI3jn7k9HiFvIGYZhp/qiZDZ6d+Oku0Hti6PzkQ
	mx/ZsVeDeZC48Ycjp1XfDc5BRwJfNpSwyB1DaSlH0nDOPiAt3k7RMTE9Z9AqEZ1PeWu90HCeO4F
	OmbBjQviNS1mLUACbsT+czk7f4rTQBWrljKdkFLbdStSkunQarzsQ0YA4MVb/1RlIrdF74SpbiP
	bdFqutDdrAa3nmfZ0NsEWpz9PM32izvjByY8N+KTvfDQpEVIv3dyzVQ3jt8CqjQ5XqKrkxOj9el
	Jty/K0GlE0KrmLoP5w26wNS3GNh2fZM9VX66/tUN6mlmd8c1R2fJENKpBr1Fx7hLmLu9+UcC8S8
	azJqqJcyCSbWmeKOnAR1+i7g==
X-Received: by 2002:a17:90b:3f8b:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3ae89715664mr8609651a91.17.1793646013824;
        Mon, 02 Nov 2026 11:00:13 -0800 (PST)
X-Received: by 2002:a17:90b:3f8b:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3ae89715664mr8609625a91.17.1793646013247;
        Mon, 02 Nov 2026 11:00:13 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5844acsm462228a91.4.2026.11.02.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:12 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/4] drm/msm: Decouple IFPC disable and sysprof
Date: Mon,  2 Nov 2026 11:00:03 -0800
Message-ID: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: O92Ei7n7cFKgtJKD_wiU5RZaFYYwqjq9
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8ddbe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WAnUiRRfp7J0bigzDMEA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: O92Ei7n7cFKgtJKD_wiU5RZaFYYwqjq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX0m4TfcmhErlf
 ZZnKUdgOChfm5LxzydrALRk51Rru820jwdr6LUzIs8s44haxE245p7CRdeIF9FDv77Om3JhajQd
 gaAZicJtgA7E1ofsF+zaTBtF05xNg+IcuY6XH7Kzi6v3POSkymNIODi6yKiZmYFk97xotgQRnwj
 uOeGezq6cMgOErhEm8e5fU4OcaqMlKxRSFuT8QCIGfmthGi+K4t7zIp2ulBI+bCpu5JLIQdy0Vo
 UETl7HMB5aqjs9JggLFQz+1tlL31Y5odQN3DVF0ya91OG9HWIIOEAegna4m1l9KIYIOx0mWam1l
 sFyuX6Xs1pFrnLDRIppYSbPG8AvnNZugH95oLABtQfm4u+VeuEDfQDVY8qI8uQc6kH7+aRqNmaX
 +LeVQilQs8wz0fJ1zagUQIA9cWTn03tRqHfvLOueJgZJrfJ89aoK7xs/DQbwdT9h3mhj3PF3krU
 f88iQJ1eIePC4XiXaew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfXyu9wD98MaIuf
 AFwa/IoZ6omClVGsNqp6tg7SVXnBFTPp1s91fXDKa2xs0TLu7Ws0Rqmddh6U2uf9rB4Pf/Fj0Is
 VO5a3QfU/z3snVU7b47jIyYi57ac6a8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/

Rob Clark (4):
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 32 +++++++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 ++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  6 +----
 drivers/gpu/drm/msm/msm_debugfs.c     | 31 +++++++++++---------------
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 +++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  7 +-----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 +++++----
 9 files changed, 72 insertions(+), 60 deletions(-)

-- 
2.56.0

