Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180670;
	b=TulV5zifJh4B3VyYKZJHXojG5fwAJTJLhUk3wISmK9TSGbxUdobG1LUzD+KXfTJhIfKi
	 cyJOizWulHQGzLASjg5P3jJDIPn8iU0ZlJ606sPFzxZ4oQy/zykA3giEPzZK0+tvwdkPb
	 JNev+0zmVTW2NILFrYhRAGSpz/LLa9I4nDqTC9T+GXyEO9asZ1HJ2jC23LpIq05ZTFoF3
	 gvwp0QBBtzX+DCXgOfld0XlXpr3CdGVsjsm4B+qzZ6K6tD8Acpxzyiupwhlf5D+8iHlOY
	 +dCVBWoObtwNkghSht8bm+xryZWlj48LgZonDLdf2L9P3hCpiO85CnCXyqvNm2pM4bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
	b=nIoBRt/trB50dKaAxy6zTh0q3eUWTWsK+II5pb+W/e9+STlDOcNN0qn4WzAEaehyKer9
	 oOT2yegN7kJm31cksIkaVI3J55Eh0jATqMZuY+8WIXLGcC/YOl8Vd8gJjOcOr4nIAc4La
	 CZ7r+PsUhjskhZq6l3Z5NGYAHLU2q8LFUhKpVo+BgSCxWcCVuqpZCszSjK5NuUQbdzI79
	 ToxGLRIJXqS9nu2g7Qzq/ErbxJ6mPecR7VyEs837dPwkRRGh/5tZZ5PKgvrAqWdVbyCX+
	 OU/guZDWJyvPnIur0NW4Kb/iw8v9M/JmpxfQyCItCe1KBwxmlCdQGF+YJ4t8jgYFslg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glPkfccA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyP2CURk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9A60A2604
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC9A60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glPkfccA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyP2CURk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxtr1528618
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5
	VymI3MVE=; b=glPkfccAQkvM+KwsJiq8EGJow/vXlIrm8Y3+jclO016Qe6ONnae
	ZKZ9Tv4zv2t+LlcmC+3Q0Uk8O4QS5y2jiIZ5vr8S710K5N5q1hTVExRgO5ErbenO
	A/mZjx2yjTUwpXz0/7Hfig9g1UsfusNj64wwD+N2RaSU7LD4pSt/+gksPO5MQn5X
	6sUR7zFfDS4Ob+p53WaeZsWDk+TTuboT2hcv1Nmsjrpc828ktCVrwFMbaalQUAds
	qKRWBY1srGLtan60fJzFeQ96X6bHpCYrIO9K1DkMdDb47gdYLb/Rau8IxHpyX/G+
	qtKShJle/Ce7dYnInYxjamGJ2WQaYdES3DQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt0es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:17:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94975041698so495501885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180668; x=1795785468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
        b=EyP2CURkZsJg0CxkAXvJJnDEuWv8IfaL1K8doDGNHEINRVgLw9SAThGIoEuOaM1Oag
         7B5uRgjOq+bvRwvm2EYfdnhbjVSYFIVukoOYlwsPvEKEaznO9722uqTGOK29ZCz2lE00
         0UuPdhXrUqbaQf2cAcEwtUnwcMK6fGevx+91unJLbcL99mZU/x/++tmVsiePCaFsFwBr
         u0VPmf+4wfF9y1HkjR1347jmW5nX7MTbLyiv24D9+VR25TUVtFWVhhSQ+0rtXVoPlC/h
         qzTj0fmVVVK0zqjrt/4mFBILv/jNhbFTLDUokxsYk0vZHYlXSUBPy3PyuW9/zssZTyPY
         frGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180668; x=1795785468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
        b=N9pkjEkRBO8dVzdYL4WjcZygXNAmYzeKoZTRaK/HO+zr+Yp/zY8xG+CVSbVdJxubgZ
         Xif6IgNURx4E5elKBWucdzdN+VDyd8jG5palFBpUBHyCVESiqdIurPaeqkYIN4JKgGJu
         tkb4eyfLmsMxaObYEgoUwW2ZzQ0BislXSOE86p7KFVxmml1/H4Qm6TNyw4dfshEZdZ8E
         bR0EHFE3cCERHilqtDLK75V6/8DdtPw8dR3KonfbICQinkVqmnMyhk6+sMG1kbljeQBG
         mmI95jtU6RS5YO/OakLqSSintCvwuJb4BMUAGWWW3CW+NmYxgr5G8mFMdYI20Ckzzxkd
         XHCw==
X-Gm-Message-State: APuU4Z8M8XJHAzUCPAKXni3MBKG+4reJSENQwDX7BwRLa9//VQweVjAd
	jSwJjbuOVwVrUlrVn35ZIyYvRlRQTHKin89MfhXv2OelVxPUe65s2KweRgwheSkDw+8Q92/W7eP
	MOUH6BJy1EVn4vwC1yeT3eGgBERRa6z+Tqdoom+jcUrrs8JXZ49/FnQ+10T6BzJk/pxHFGLra4b
	PS
X-Gm-Gg: AYBFou2YvbMmbrGW5dwMZxA3yC1l65ROYU8O0ZGNtEevwOwwpKKhx+tQMuTRG0wh7L6
	W975ZUvSe7FpGpv6jzzLmC/dHXYPWw7NbB7/Krjl12h5jNafTt3p5RtRUBsc6p8ITwIsaJWYD1R
	u05WmCBnGvZUWW13xBkRWPjVTm2OhUDwuZSOjW4i0OMMMIzAU44LbW0KmzIXIme7MhyOibBEUks
	EEGjhAJn2v+BgMGt0JcUbiEbDRB4o0amYw2t4SO/grweKxtTKOt0RO5ikDcTiuEa7vtqdNrhYsp
	P6fOYiZi4VcMRYJdXKfOYFdfv4WN2wb3qhDSQ66ukJ1sF5ifBhUzOAgMmbBEfImip2UI+yKr6hY
	wYY6I8aLk01VoEfuItx/nCPimi5vwQcgxgZBE0qhnQK22dgz7SKDNde9KPjleGyWV+ENaEdjbd+
	w=
X-Received: by 2002:a05:620a:4720:b0:93a:1196:ce5 with SMTP id af79cd13be357-949b362497emr696170285a.33.1795180668267;
        Fri, 20 Nov 2026 05:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:4720:b0:93a:1196:ce5 with SMTP id af79cd13be357-949b362497emr696165985a.33.1795180667760;
        Fri, 20 Nov 2026 05:17:47 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm5489060f8f.7.2026.11.20.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:17:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 14:17:43 +0100
Message-ID: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-ORIG-GUID: UDyaMQKzaVwJQ2QiDsOr_lhGzDQOLhiL
X-Proofpoint-GUID: UDyaMQKzaVwJQ2QiDsOr_lhGzDQOLhiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX3cD18btSkFLZ
 n/YyzOD+FPPjW+pJV0BY0ymzAoaJgKLgq2gPlZeI1cmvgXIcdsCJDcodphQqIoGZddnFaM2qXSQ
 7CyOmfzX0Uw/MNvBUN5wRbZbVceMsL4ce3WwSFBPpNKE8b2TZ4STuicTKxlSiua3PzlcGkPoyG3
 6YTeH1v1qR4Zi/cVLjejH3yOcm10zPKxA9vagL6hlaFn65F5MwvctVnuDKZNyIqaB7vjVgO8hHm
 xaOgqYfHJgVlW08/AoKUDrKQySXnE3dCywHT+Vgko0M6ZWKz4S1WjTfK15ln7NQf2Vtr7LBaJGI
 /dUPz1Ls9Yt7qmwE36GjqE8ieHlU+2a36JDl126fQEs5iIARFvbhIKuWc8w7rzoaTtvtSXPPCcI
 r8Rb0zfBz44LGnvtXCWkJxA2lCEmFcFEM5EUfeN25B2ND1c9/Dwu4lSenRx4gV6VKUOV9RUInwa
 epkLIXeyVCVB/RqruKA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b00487d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=Cb2_Q8YfTQsDjjc_npEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX6OL8hqbjmzAT
 NwlHIDLIAgthR/p119nJXO3YG/+WA+EKcJfnzAgkQEAbSdRMfC7qHJKDZO1jv5LzYmWSE8nOFQv
 c/fA5w4WXe+B2zB3/ZMYA/O31JK3X8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200052

Linus,

Please pull the following set of fixes for Qualcomm pin control drivers for the next RC.

Thanks,
Bartosz

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom-fixes-for-v7.4-rc4

for you to fetch changes up to 21d7ff7d6531b3420727539f04470ddae499592b:

  pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied (2026-11-20 13:40:36 +0100)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.4-rc4

- don't cache new config until it's been correctly written to hardware
  in pinctrl-spmi-gpio
- fix incorrect pull-up reporting for non-i2c pins in Qualcomm pin
  control drivers
- add missing dual edge GPIO IRQ errata flag in pinctrl-sc8280x
- fix a UAF bug in system shutdown path in Qualcomm pinctrl drivers
- add the I2C strong pull-up bit in pinctrl-kaanapali

----------------------------------------------------------------
Bartosz Golaszewski (4):
      Merge tag 'v7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pinctrl-qcom/for-current
      pinctrl: qcom: fix a use-after-free bug in system shutdown path
      pinctrl: qcom: fix incorrect pull-up reporting
      pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied

Haipeng Lin (1):
      pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag

Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

 drivers/pinctrl/qcom/pinctrl-kaanapali.c |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c       | 17 +++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-sc8180x.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 11 ++++++++---
 4 files changed, 25 insertions(+), 5 deletions(-)
