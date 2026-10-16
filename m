Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63E13E763E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140730; cv=none; b=ENmONbuYwu5LLKxu/rolUrbKdYlKGfPILoL9KHw2cZ3GSZ1AY66VyP4uICgp+dWHoKuuj65FYt6iub/zEDcs5qKvsJBGeuvBaxMJgUjc+xHYdiLsF9P0k4JOyPxGCuUEc9FNdh4PczHquuoQwOempE4G3jawCcwEXZFoUaYx+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140730; c=relaxed/simple;
	bh=c5Q6iKkDmFbV+2yyd1vXV0ZOV3wkIrlOQ8jFE8fc7Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7pX9mes6Bv904FI2WjzVNIPF6Qf77HIIwwJmK5coE6TO3/GGjRCA1+DsgwTTFlgjGnsRwj1uFBQ+Gvd/6AhxROn2NbuKQNhPpu7IyUW+PV4kRvIep67FxNmNcKL3Ub+wlRXWRm4M//YQepFjDYJS0U5czLgTpTZj84WuD+zoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaFyT/yG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0h0b3Cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaFyT/yG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0h0b3Cb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lwtO2219131
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0
	YU5mfgok=; b=EaFyT/yGKCS/4GwIonOQN14ZfsbCda+ksf+blv1A4mJ6E1w18gq
	my9eilg3ddNJv9dC/tTzyDBnAAKaYs5McYqR80ZvcgbV6AVKKe+N/fAM0DI3HD63
	SWbL7etDPm297YR7+G1JXhd2ctt5DeG7wrZEtLLhItgh5IWfxljNpwgOV4e9Ghft
	Xxhvkg3CNhg6SM+0xNB94bnccLrhM/Pn5mU5LLkmVi7HSW8gMcBIcytz/cjNcJQe
	RIereKivikupJ7yHIAsS3S2CEZsh+XEXwjF7rZaiMWdhRmbQAUI47T8KCb1VK76O
	EB/JE3n4tcyHQLfybt00zNb5POjLr9rrmWA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3mb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:52:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104eedb5b0so76057566d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140727; x=1792745527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0YU5mfgok=;
        b=b0h0b3CbkDdkTcixVJuoANwkPEgxu5D3EwGSYmaDLPZj6d/4tt3hNUea1rzbLOEZDj
         aS/ByCvkmrHusPorEGY+BK/48PPw49eXU9qsau0rWuZ4J6ybcyorYcNvRHBkMfU8DRv+
         ffWQde/qgP4ZdIE6feaPZv/P2MOh6zPOzi07Vlc1WTrdXxQMGFMI6QOHbkcSaw9VXPHk
         Mm11SupZWjvBMgkmD5+8lE+G5AzniAeThuSuv/vbCaCB5x3WSi52Cj/XC8EavigIpjyP
         m+tik4O8rM+5N7fO6gM+2TEHm34mCsKke8TAlwYLZ+ngaykTX8OiEWYUC6Udht2vkjQP
         aWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140727; x=1792745527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0YU5mfgok=;
        b=R5WsQxMLXERHHuObxvLmAyyCPn7kOdnGg49aFGA8i4SLldT8H/fh/3Z1/Zy1uAWLTf
         tlkepTIZ3aq4hQP4+oPpRO90DnwtN/ahk8jTOR7pmL2PrIaybT+4sqp9Wd3BTVznyys9
         9wBEDn5QcK/M+DnST+kHaOZoJb0b6ZG/eXyX0Wq8use4s5KuYApaw/MhlEaFjP/TRYNr
         O5FQN9qet4u2X5vhXab6qxOnaQuqZYEqGIeBFZWyGU9lVjgW7kMERCKzmfYiw1R+vjyw
         bFj00pluxJBM2tU1MfWrp+64wgolvbiVNcFCD+Qqzb/Jnur/v5q8znuBE3Y12SR41tng
         G7yg==
X-Gm-Message-State: AFq9FYK0gj8Xagv2L0kWFde+BF/Qk7djKdRmORjInbQTokzeZBSOtYrl
	AG7a9pdzBECOpqBG22lXSQ+5P/Pb0tGn61edxpe/QBJA/RndRkbDEpK6Fdva8p2MnKBVh6gQm5+
	eoSBmqrLZZTNwpNJ0qJnCUF+DX5d+ATuMO/TRD6xYJghqqBtTSCW60i/TXrJ0+uPxqWI5
X-Gm-Gg: AYBFou0gv3ukwTzBkJCt6Vbm2fqigl+17GC10xiITXENi88I6eAqPk9qg/ToaTMzQ7t
	1qdFnXu6nUmjDSZzS4JX5GVVMhYWdTfv/wW02dsEMwgOk6O9QyBNEtqPV/r42GG5wbvxWmmu5Tg
	6TGxScWNuSqIY88zM9qAtEwKVe5xpOjGK53Ts6UFZbGkA5u/2EPjrXlR160i0MHlVl5/5W53Hn8
	/cD2466wcopGSGnwrJ7gv8Koj0uwhoNEA4QQeENkTp8uK4k6EkW1zRpHiYw7y1B7b5fC+hpZ0KK
	qdbZperId7bg0tIjdC0N9ileqPVdA6+ACuwMDkjucrpq9jNtbkwQ9Do0ag5CQ9LLxgzsaTZIW6L
	TEprR7cI4e+mTDD9gAjwdDWqbmH0=
X-Received: by 2002:a05:620a:260a:b0:93c:be5f:b807 with SMTP id af79cd13be357-93ebd224f84mr3659461685a.13.1792140727007;
        Fri, 16 Oct 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:93c:be5f:b807 with SMTP id af79cd13be357-93ebd224f84mr3659459785a.13.1792140726638;
        Fri, 16 Oct 2026 01:52:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm3667762f8f.9.2026.10.16.01.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:52:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3
Date: Fri, 16 Oct 2026 10:52:02 +0200
Message-ID: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1e5b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EllheS9fpYLeMF_EZvcA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8Mymf7IBMYQTY7cWQ2RbT5eD3TYd332_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX/7YDLJ/0LmYx
 xCprXQtFNLvGrbdsoCAHr4pgbch9vuGcqOeVXVc1JVjkVMLFSEwy09FGtlepPBZZtnm2b+oL4Gd
 ZGIlePXFDQcZksB3ljiB+PDRXkT0z0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXzBbq+7XKd9SN
 aG9m0xknZicP2+Kg8rYv2tg1wyLUbHd9yZfJkwIMkVMzORJq8pP0/y6hesu20CAqu22UKrd76pp
 kdLvj/GSUvmsIxrsXpvzdxWDimDDnlxWidjKZ897yAQQUZZ/3+lQUwvLGLItBP11xr1WplbwSq8
 Ahuk5thvqYcNMOInDAuCGu43JvskcaO4OXv3dPp3zXNdOLZ2l00ZQHtnyvI1AUHqp9xNSse65AC
 LsFksS2RFKL9wKzKAK3v14JvHxrcXNlOKr6jN6UKUXjD0v2llwCketcwDU8CcKrN2aZNJayVfLG
 8NUgispDJ+iWnGM5qG78vYm5sBfGgXBePi8OPXTImk3RqkFfvU3JIEe0KqFenEz4B0TKw7GCELC
 ueQShdJzPzJRXbKweGu7OnMAVGDSEh/2GGNN9aVtDRrJMv/IaRmNhZ+Pm7WVAIB+0n6EOL/8msa
 cdDZG5I+uN5qGY2hu/Q==
X-Proofpoint-GUID: 8Mymf7IBMYQTY7cWQ2RbT5eD3TYd332_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

Linus,

Please pull one final fix for Qualcomm pinctrl drivers for this cycle.

Thanks,
Bartosz

The following changes since commit 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a:

  pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12 (2026-10-06 10:05:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3

for you to fetch changes up to 1df7f369075d7e8f7794981995a5103f1963bab7:

  pinctrl: qcom: kaanapali: add the I2C strong pull-up bit (2026-10-10 14:56:32 +0200)

----------------------------------------------------------------
Qualcomm pinctrl fixes for v7.3

- add the I2C strong pull-up bit in pinctrl-kaanapali

----------------------------------------------------------------
Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)
