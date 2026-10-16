Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F747D44C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159933; cv=none; b=QCMtRjeY8rPxonmALywjHCX7PqFZmNLVvNpHxX9Pqli4Qriew4PRQ0dCuVBeu8LBpAgSdtVJuZ9wOAtQz3WmcpjwILFPi+mdW/dM9sBT//jJdtylpd9Dtwyttgwrl2+z5HSMqs8/NDHL+E51Ifo6xaBlpBls0pmks5TCpV64oYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159933; c=relaxed/simple;
	bh=j7d1Iwmc1nnbCs1Z7DoVwKKeYm/LCHvrRylj1tJCeTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aaANspPDbxjQlrNvNIxcHTGBqoFgDdQH5wwzJg7Gkn5S1fs0gnl4sLxjPgXR7Kl49V5dWt28WYAecUPSd+dKsPMb+CZ9tMWmgGRkVHaiXGHGKSMSHVO23SJHMrBfrCbUU81bxFLit+UcSqwZlHRSsBbQ1NYkxBoku6O974Iw7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNiA4wSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjbfvX9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNiA4wSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjbfvX9p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5j4b996893
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incg
	cAnnUw7Y=; b=gNiA4wSewFnl0QFVXsYWju4qBVyN8VkMqgGAuIgMzTtFntcfCeh
	/pxxPUpsyqzX0j014wgXuXsJKu+Tqlrwv3eIIDPhXt3imQe0+mVC7Enh1Yv+o1uf
	EGRdCYVe5Yo/FVmkdOsx0qZsu6IaE7cUfDXMfPlreIwaYYQQNjwotlq4XLT1T8JA
	YbtajuJgDRDoYQUak636LNlg68/2JKtarzUqZrchzD3+wLVhofCZfRO+y6i5Q9DV
	p3oP1oWWa6XgjBVqnXuC5i1sFh7VVrtPIJieEr/UdTN5inkHr2fGCIFMNyBCoE11
	hfpc0ABNAqlYH+f+qFjGrgdRMtmV6rd2QNw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjta6v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1665200f4c2so8751953c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159928; x=1792764728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incgcAnnUw7Y=;
        b=cjbfvX9p2hhkWrTNxZXplJXzOaET4vEY88ON9XzQkr4I5vO7As5Pci300F1rhI3s6R
         8kADFjgl8kewNr/dhm/C2SryMnCZDfUaKR7Bu9gJ3AVMLsO4tAu8FoqCMveW6mT/Yv5x
         WqgOhz5BwuvhSSUgIOlpZwgZhS1ApeMIHZHwsSDI/mpQRhnxlvwq1zGRsBvFb6sEAKfQ
         smCHVa4fokIVVNchEOvmPQh7L5hrahWHl6p9Ms4Z4OtRO6qb8/bKpAyEgXN3Nqs9Qxbv
         giCwpcW93HSGql4hHjVTSgnvn7rgcCWtzkqqOX04ecyuQj2rLJlLnPrnZMOBIY7Xa2Nh
         P9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159928; x=1792764728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incgcAnnUw7Y=;
        b=rNVpJBZfymGw0eK1NXp0TtI+FJc+rR0Q/eyV2mSpecU/Ro+vd7WH3Axvm9EYg8n+S3
         tb9vDd8KDrf4SXxyNPusfcKVCM50VOt6kmBXpA71Oe7qv4/dNX8Q3/lbzSoqPie83N/z
         aX07YB62B/RRt7RjlGPxAH/Hi0hzWS3MtgCQi2GijiAyIzrCM8k/PCx8fE9qKPoVevif
         C31X3G7RYf8kgCmr62WUQCiFTcU0IIh7doMmMfMis6gi6+UakF6h9aM0XGQlDZdKxM8t
         y3hZFBIp5GCNg0MznIE0S3CMRGCQJpRrYKMn1jpaPl0TKz3UJs0QV6ZNyMJCZUCLAacL
         AHuA==
X-Forwarded-Encrypted: i=1; AKwUvBzC4+4g0vFxPSIo1N801EK/6qqNO6TwxIHS+M8A5JyjmMxxQ+eRConYlVgOuA/eyHiEPLG+EeOTrBooP24H@vger.kernel.org
X-Gm-Message-State: AFq9FYIwFb/woifLrMyrgm9EtZMyjqm7xYlijDOzjz4QIa2MVj7vc68Q
	IzvbRVMdMTloXB6alTEH6PLLkJgqZiJOpvN2hHg794tQNwssk/bRZQ9m4k+FBSSQKKda/lU8Wld
	4SftBpsQvZZGpggEuIVLT4r3qL3Jq6CclhBD3Bc4sW2CfB8cpG6Sb0KQfRmyWt8Ph9jjM
X-Gm-Gg: AYBFou1wvnTwUFSnrAdZKYInb43LuSnilK65Vkrr8rM76MVGayoPsUKDCQvico2Y2AM
	BqMPcCRTK94Lx1sJ8o2GUU47daspEOmK0CkErdt8x6cXDI/yi6YYPVhto2xyPijshoL3PcdrkFT
	Fj7NqFP39IIt16Fs7y67ZtYbHVIk+UzYnBmgcbzjpFWLiY3cOTXSJMA6VRcMscZfZ3skY31o1Fs
	D1E5vyq96hB5nDRk2EASSZWIOp4v5TKUVjZZpgeTQ76mRqWdyn0AKWdWLwhWrGJAUPd7HfF2j6X
	zOq73PqGiYc6NQZEW2ZM7cR/oJajUwPVkeySyP2UyT32PRfw13gE1XM5Vda/o5cBSrpVdtksy2p
	JrssX3kk9MbvhqLJLwIvOLSLiLnOIDgmw8Tfo0z32XJR1ANMW/JDfXnWpqAk=
X-Received: by 2002:a05:701b:2807:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-18512e25175mr59613c88.32.1792159927956;
        Fri, 16 Oct 2026 07:12:07 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-18512e25175mr59585c88.32.1792159927275;
        Fri, 16 Oct 2026 07:12:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Date: Fri, 16 Oct 2026 22:11:50 +0800
Message-ID: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX3gKQLRwjonpz
 ICFDppbQFYciGB9+YrNzo/PTjSR29JXWYIVwYJac/7vZ9fHSNTAfMPe/eWgHX0SK9ImagNvufDi
 0089xRBblM2KZeqYAq+r82voCDoih7padXO4m7mr7jxrEHKYQmUfX4q02u/6sBxu+r1nz6C2JN0
 d0lhVPWADbn6KrsQ/bk7xbjwv5cKE5M6FxxrOzlev2/Lw/jSZ1XUvze0LJhTtpPajJJqDnGUMSb
 U4hubPY6DlgADyU6JG98E+zcXLpWPnfa6Ao73/1dduAegw1NP5H+RkVvhoXJiZjCSOOU1Yvz7Cz
 mdhs4fVZu9PkYxuV9k8dOlp4NUm3v1qkwCXVWSBkitgIE5eWzk/SYvzoDMW3jxHbzxr1xvNBXaF
 ONFd2UAxY4ZjzipagcImO6AvREfeXIU/pxX9siyj0J451oLQKxo9BRfimzW9JihMFtruGu+QExg
 b+VkJ15m/VlWP9KRbNA==
X-Proofpoint-ORIG-GUID: mP77iF-t9rGXXVPJ9le1-T8zPLEJyq-L
X-Proofpoint-GUID: mP77iF-t9rGXXVPJ9le1-T8zPLEJyq-L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXwvAzt8AiQmys
 gk+GJoDRP8457Iy6dkCUhd7sZS1UKYOTcze1heptpwy2TztEWMSOFe+bWGljeXimwlCXJDaKKBW
 6+r0WbEVRJmt/5Nn9+MzijAwuPbyY2A=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad230b8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=jKFkqTp6JJoCw1ulDCgA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Since the early buffer mapping, q6apm maps a front-end's DSP buffers
once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
few problems, which show up when the sound card is unbound and bound
again, e.g. by unbinding and binding any codec on the card:

- The card core removes the components before it frees the PCMs, so
  the topology and its graph info are gone by the time pcm_free()
  tries to unmap. The unmap is silently skipped, the DSP keeps the old
  mapping, and the next bind fails to create the PCM:

    qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
    snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

- Once unmap is actually sent, every command stalls for five seconds,
  because the response handler matches on the wrong opcode:

    qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

- Unmapping the position buffer clears the circular buffer's handle
  instead of its own.

Patch 1 fixes the unmap response handling, patch 2 makes the position
buffer unmap clear its own handle, and patch 3 moves the unmap to the
APM component's remove callback, before the topology is unloaded.
Patches 1 and 2 go first so that patch 3 does not introduce the five
second stalls.

Tested on Qualcomm Ride board by unbinding and binding the PCM1681
codec.

  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Shawn Guo (3):
  ASoC: qcom: q6apm: Fix unmap regions response handling
  ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
  ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

 sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0

