Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84C42D9EE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398110; cv=none; b=Nil9JpnmlFa54sRChN4y0DAAAzVSJBEB72+YUy4sV9o1qCv4r0UMjcRGteIZ2XtVpBIRpy28LcAWUGy9fIetO4n1bqqJL47AQpayHwMFbt3dc/BkvYOIu/gD03oy6a0Obh0BBs2noriyFxr8A1QJVe3cfw89xqNr2dqRCWQLScw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398110; c=relaxed/simple;
	bh=xpbeott/c0v2tNmBRy7ksMTZvOQ2zp1VkozVc/bGQNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYeEL0qAvVGkslKYMqFUZR0zMNXWw5I+BUcLrJ/tiSVUFi7olTTlTAAu5srUNkspNOJS6i8Ew9ry2cRCUI/KJ3vXQVN7+Yo0eTYrIeE+Kj953otrwnfIpWjdaume1ZkcQzNiQLDSG1zSRePmsSbfHVzZ4b7X7s+DjpTZ1j/6kmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbmkDDpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMWadtZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbmkDDpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMWadtZh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7nCoT3892477
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qNHHTQdXJ/8FF6Dwb+kHCvKAU6klkfwPOJ6
	yXy7s6bw=; b=XbmkDDpp51lrgyg7d1lLqnJdT1ChPMqC4t6YfSqf/avTJLRetl+
	Hl35q+cyEyUxX1RXiZd5sR/FYDcjhAJFVkA++F4Q2ii5ZRbpv2H5SADtzk1PejS5
	x1oMC3cGHO3Row/rX0xF+Oke9wWV3pR/Qphpj4b62wLhlxzsqcSzCI6UKmGLIoSK
	2UVq380Q6Ud5OF5PHNa1SFIMwaZWqdHK54RKrMy2ccBI95RgoTF1FMCMWqnr0wOS
	aBiiombHzDyAHdWl7db634Aqa5iZ0MryLPrGiWVAfoqjTwHH+sZStfPqGPUqDu4S
	5Y9DW8sV1OxaIpU3CNfntk2+SV7eH3+jJ4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2j700qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:55:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so19755311cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398107; x=1786002907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNHHTQdXJ/8FF6Dwb+kHCvKAU6klkfwPOJ6yXy7s6bw=;
        b=FMWadtZhlRwc3RfGgW0PP3uZmKHf6TNymL6w/nHmtq6ISLNRVg0SyGNYd0SV0k614O
         GrCrjtVfp3vkxAayx08ftRb+Qg8PMUmn10ZOeJqyS0toELrV3Ppx1WREwjMlZYjsd0U7
         nnzcOgkThytFWjy5ns9XUV8W7zURG9uAwUkXg+ScuXxI6animQHzRAB/9Kq77Eg1J4fE
         cjwpFfWKW+hs6RW1Wh8Q5p9UUPgkZ32lDed6A53qi0+tqewMIfqCe8ocUyN329LZsEen
         QxPOtbliXDjQoLMvlMjZOATgG843dumkWnKyp3pnurWSTQuwmQ2+dmX7YyoKFi0HZCQ/
         o9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398107; x=1786002907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNHHTQdXJ/8FF6Dwb+kHCvKAU6klkfwPOJ6yXy7s6bw=;
        b=hehOXNq0gWNmdCM1NXYfULREkWZawBWsbWJIQG7/3IaqqgD7YkxT6SQkshNv+RjTy4
         luJsQNYFf4/itAC6oxqsPvZ1QstPYKupeL1mfJMgxm9QFNWWk3Y3QMVR98iQYpECn3hL
         7zBNJGahfcVVwi6Ut9IoVYkoOzPr+NzpKz9/LHKLZDO2qfS1tR9jtqTL1HwKv1NlCER0
         y+v//EJ238fuA6URXzQNptf8+zRE1SK0fHtpbPOcDkZK0qGDG0a9ev9LdQFX1hSNuvU4
         8gN+bg4Xa780IIoWmwg7JazNoVwqy8NCk0h6Zxzf6FK8UM6ZeDNMCAU2ri7uiA+zJ8zy
         N/vQ==
X-Gm-Message-State: AOJu0YxNm0mT2W63kjWTksiZLQMh8B2mZfvE+BiR97QLCWJTiBDORuUu
	lweNyEdzkgE2j4qqUkXJ/pesAmQ9ZpsI48OiA995cSxqROCa4SfNd8hO8GvflhehY56p599AwiG
	tdPOezDnvF/Ygk4LGVEXAufBQxJGDo1ooVgh+jSFaR0kSSyKZQlqjUu7MITg+XRftvE5h
X-Gm-Gg: AR+sD10sayi3yFPurz1PvOUgm2yZhJjSK3aMIFCv+loSGF6JVnAwIONaUrIGr4rcGzr
	iOaU31P48UuGAnPa/RR0NwxN9dM1uv4+gJlh7ZRAerp3q0SvQWzv3CSB8vBYPPEmkA765fjLqg4
	ZQx4mxEl6yYub2RRw3ijhcj0crTYexHq3tankicyL0ApJLCyCGA2zjRXFlWmOP9wNPpJU2ZkKKa
	kD6VOxnncKdAE5uVJC5l5ABiTstEwKufHfOtOqkeqA2pDBprTcp5Pkn7kOKKDJBcVUrjtVY0Z3I
	R3PEw2qRWGtyJCeWwUYpu/nS7ZdAquJrnd9pd7apo0gYe+zlrxHB9RuUOh+XdLHjGy2112SSUoU
	43tVv9M/JV3H5WN4PbxJ8YxdO3vbZ
X-Received: by 2002:ac8:5acd:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52b384f2e71mr17311211cf.32.1785398106796;
        Thu, 30 Jul 2026 00:55:06 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52b384f2e71mr17311051cf.32.1785398106383;
        Thu, 30 Jul 2026 00:55:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:529e:6fba:4bc2:e378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010bb0e7sm36959025e9.15.2026.07.30.00.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:55:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pinctrl fixes for v7.2-rc6
Date: Thu, 30 Jul 2026 09:55:01 +0200
Message-ID: <20260730075501.7653-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XF48rKrzUwVIiN4mtrFc2GY6TuFf3v_B
X-Proofpoint-ORIG-GUID: XF48rKrzUwVIiN4mtrFc2GY6TuFf3v_B
X-Authority-Analysis: v=2.4 cv=GMc41ONK c=1 sm=1 tr=0 ts=6a6b035c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=s0bWprLixBiu8OTeGpoA:9
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfX/bL6xZnRZWqk
 TWSK3Enp5wOZsgX5tGi+PwXDo6wgSbQHIUsKPVjNZg47BPcTOYiZex4s6gd/tO9Gh5WTu0Vg7JV
 F0Yvs4GlkddnZvZV0VkLX619KP4+aCFJ/yxfShK6XldUXImCs1B48UkiqJJ3lVghzxotaK5Fz4W
 Q04wNHm4VtUO7TtMZTz09/bnUjEdY1ywUM6WHm/tcdUPQNu0l1+/VnqOjSZTdL82lWgUcrktNUp
 p3l5pmicZEAT3dT3FLSvqHJZZ2sunZc7//3fPNL6hhcFIWsAowGI1Pp1zNIvJYocKJ4Wn39esnT
 QCX/YiKgNZX56PwzpnaAQHEqCvz8t/vNurqDT5hEhBSQv+hb3bdUK+ngdoHJCOmKqIgpBFihkjn
 bdebAwbSTupiCvZva1qjJVmEtcqdmggqe80Hy9GY+ZTt+BLdCFlA20/QzRaTyEj7SVqBjHDBJkO
 nXh4I/MWKpqdY0S3Kxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfX7OYQwUbcX0Mq
 MBSIy7h3c+CiGmfoETxeTLqVCw9zg3tF3J3isw6eO4nNRapxIanl5cvhoKobIo/e5KpuIVbvVgX
 UfD0XRIMHqQsVihpjqdZpbVj7o0rebI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300055

Linus,

Please pull the following set of Qualcomm pin control fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 437a8d2aa1aa442c4a176fdf4700a9b3bb0c8794:

  pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151 (2026-07-01 09:22:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.2-rc6

for you to fetch changes up to fd46760956509f580f7d3d25db4de10e7c6f949b:

  pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function (2026-07-28 11:11:20 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.2-rc6

- mark gpio and pci reset as a GPIO pin functions in pinctrl-ipq8064
- fix audio_sec_mclk_in1/out1 pin numbers in pinctrl-ipq9650

----------------------------------------------------------------
Hans Ulli Kroll (2):
      pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
      pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function

Taceddin Sancak (1):
      pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins

 drivers/pinctrl/qcom/pinctrl-ipq8064.c | 8 ++++----
 drivers/pinctrl/qcom/pinctrl-ipq9650.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
 3 files changed, 11 insertions(+), 6 deletions(-)
