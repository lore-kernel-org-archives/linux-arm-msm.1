Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322844EA39C
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852534; cv=none; b=S6wvVaLQz1+QfI/aiMErqMPtKDHUXDSzbhv1uUsBaxZbuJdCPv2d6fjQIxqFErCo/mlmxYWXyTCX+hYRaN5lWdJAOfb+zkefIS3bbOc4fYtiC7jnRxKofQT0C7FiVZcaoDbYo6exTg2aPyrzGetOfp/t3yaH5550Co4ZpJGugy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852534; c=relaxed/simple;
	bh=X0YuF0S/pI4xRaYCEnZpArGR4s6grsgcg+v3wGzQ8sY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W/OCnN8c/nZ/WK+42tAVlUiZ9Rk0bqyU2WOYBmcBF2NONd7Oipjro1KL8Pq82yx1xOYZleYvowHbvmA4adyoQVHpGBj47Xsipsu+gYXEkIAWWy2Ewb39x980eV3s1JWt37TCJT5oDKLnNvyuQt1z/BuLC2ficNh45+m3EenpsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5ZZREsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdqfjI7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5ZZREsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdqfjI7p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xeQn2176984
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gIwNsqGluazdyvL/065a88
	cbyh4aj2fj/dBF6vgUhcI=; b=N5ZZREsTzczYNYT++0Itf3+EDTDtYgdZO5shT1
	SA0WuX8M8EM8mR52C7tkx7syN7xinmGE/QosuozmP/mg1qahyUVZhwvFJbEinEK7
	zeRW65RjTsweMDTUBpaQNA1xekF3bgY9UwU37poU58d0ybo+X/TVhPOwu8UmUOpi
	zDtyjQafQShfJMgP5uxV1JbLmSLSmrje7aCO/+DsfVWhLPNHbvUrNf1mkvKBXbcg
	5DRfesdYRZfsTDSfbVlknUzIYSAfy+Nq/3HU2P3owoq9KJwCqBgJQ3wLUQMO5XTb
	Ns76L3waniI/VSG1esJPeVwNhgrJGUAc5iPY334D3xOgVyqA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsg5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:02:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88620af3beeso335090b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852529; x=1791457329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gIwNsqGluazdyvL/065a88cbyh4aj2fj/dBF6vgUhcI=;
        b=jdqfjI7polZkX8DzHnZWSJkQ1m+fBGAlEdVJpTITCULboZK9z4okk6DY4ftZMeJ7eB
         sfjMAhBWIW2bsg2aYmOyUhqUZlFjtUKwjJ5K+l5ckSLn5ZqZQHXL60hlHZx4HTcPT3ix
         BL5HwaQ+qPggvdbaFJzU/nL9EJ/3LDEfOSNwrMiP7HN1GL2PX964AXAzfQJJJb6OPD0y
         ixy6C4dhLVKH/TJexZIFhYK4ZQDa+87Mt4rD5ux5dzcM9kiKOH/bkxGYpurEeZotdWx3
         QXRk5J7Az7BcLF6syFbA+1CDYDoA1BSc1yS2fV7JUBB6ul0RZoMjPaF6FdBuiiphlBkq
         a9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852529; x=1791457329;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gIwNsqGluazdyvL/065a88cbyh4aj2fj/dBF6vgUhcI=;
        b=VH7ym6r4j6SLJ5tDB3PCXPNYSHu3j0g4yJrEdc1yLU0tcxuS9m2xk7GiLujvVYlySm
         CjlIjCLNSg4DOug6KejY3BfJBu8jcvThbp+xFJrT22Nl/XoAOUvsDVKvc+sUoQVggLv7
         Vm3pZoCqLON5s75ATwM5RwhisaG4ME6dggwBupLE882plbRF8431lKFxmkoeMrKRrHnc
         ngDGjZfbaR9AUeFEXFueI9fAqf+vnoNTPaEDoovjdAFK0rUUiKpiBsYNy5/CBUJXIk8R
         O8CdCr0sWHIygHVdrjlZ6GplBWi5k09t4x7S6y0CZHTtfH16mW5Uku0nPwTZpLd2iJOm
         f+3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMOPDYUKNY50V09bMVoYFueZxfTmB2turunW1j6HloW7s6xhSYiYF550a7joEA5imkd2ujxMyVRmnj16yz@vger.kernel.org
X-Gm-Message-State: AFuF++lohR3bCPGR400Jy8e2xMmRk9eAXGCjN+Rfmeltdi7JDT+NYKMw
	1TZcS/JkM4VSOlT2beOOZwhF6iegUOY4uXNyBTDJtMFnChJgjG+LoWL+8V1qTh2+M+QwRAY0w+A
	hqi+Oid027az+CX39MdMfZJ6SuOiNHynmbYw+1lZfDfelYvoRtibwPH8LR6audnuWXY1J
X-Gm-Gg: AYBFou2dqfh8DInI+WcnOgAQmmNgwRIuU3kW+j4F0UyWifpy5A9/w8tj/VR4vP1wRo+
	cl8rb9OoZ2H0LNDsDrESRy54+jvbXup6SYOMrGfHTPMTo9dgMOeP6bzjxNPaFhfEqznoOPJA5Ot
	cg9YjJuoKVq3eKLePs+4XC/zNNOZ9QHV5BA6AlYeOKSMiVVOaH6/7VOfX35ha8qZ/W7sGywYVM6
	KUxCNxwVQFWBIzonKTT2T8AKB6JmOu0juVY/DiHBYYLa22ZDRyoJyNtfkWJcV0xaIuRLfSByHJp
	zQ8OhsSERT+Wd6dur3kpao4po4Mcv+TVvBBFum5e6HOVqCY0R/yXJpJPmu4Moo2SojIh4+URtp5
	Dzt/zx7UQy8r+I2US3ltqsFK2BndejS6ClQ==
X-Received: by 2002:a05:6a00:e06:b0:87c:e44e:569b with SMTP id d2e1a72fcca58-887fef8fa6bmr1652834b3a.49.1790852528856;
        Thu, 01 Oct 2026 04:02:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:e06:b0:87c:e44e:569b with SMTP id d2e1a72fcca58-887fef8fa6bmr1652798b3a.49.1790852528147;
        Thu, 01 Oct 2026 04:02:08 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888197ced69sm886049b3a.48.2026.10.01.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:02:07 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH 0/2] fastrpc: fix probe-time races between rpmsg and
 userspace
Date: Thu, 01 Oct 2026 16:31:24 +0530
Message-Id: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ9vmoC/0XOwQ6DIAwG4FcxnNcEAZn4KosHqHXj4HRUzRLju
 w/1sFv/Nv+XboIpRWLRFJtItEaO4zuH8lYIfPn3kyB2OQsllZVOaeg9z2lCmNIYCPr4JQYtsXS
 1DJUkK3JzSnQecvHRXjnRZ8n4fC3/dlOccrahWyZg4uMDBvLKo/fZdaZZq0MNnglwHIY4N0WFp
 jOldVaaoHWFug4B7y5g2aPU0ihX58n2ot33HyLY5L7lAAAA
X-Change-ID: 20260923-fastrpc-probe-fixes-30c1980b50e6
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852523; l=1578;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=X0YuF0S/pI4xRaYCEnZpArGR4s6grsgcg+v3wGzQ8sY=;
 b=bH2dKFWVwLfwtMlopYO6Si7aJ7JOruej1mHbsM++YBkEgvJRLfQIOwFcxY1D+UObPS39X36Yf
 rFFNe4FtcXwAf+4Q0Ric//mKWAvvlsqbERerzgX8wwQjCDWJyE+6pcY
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe3db2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z9hRlnAjW1SqKzzyvooA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX7CQ9YHdx9x15
 uOcJrNkFPZYX4/YzyyEcBkkNq5pdYG0ni9G/TmzG01EtU6cnEdLuzzPXlHUiysfbwv2jj9pTSyD
 1sRgnZiaCv/fgwZuLWzu7o4fpS/4rPk=
X-Proofpoint-ORIG-GUID: lmOJ1nP_JN7xjJBkxKc4QcJHBUIXPvyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX/futzm1eaZCq
 6Cb1kgFwfiu3LXt0RSY8oBu+/Rcnq6JHY3m9UzGDFHZIF6O4kGz30VMN64FywoiauFVADNLsGsF
 QsGdn4D/jJrn4Zt8Y9pZ2dYID98ochMOW4W7uCxwEjYiYPuev8CplKMkumh35lb1XN05+itZvwB
 qsJ3oBhBadkZgNxxECkObrUGKJ9PrQTP+AwUcY5hyMUwc0akCKH9tJsuPyY2zi7K0MSR5g0SuJD
 6UVGTPj6w7Dtb1N6zz4XrjnE+vyvEmBUkVoXuJ8HNkx0QULH0qEDTAt7aVo5ABZ7qtXo31xTuJC
 rfrBerjbjrnUd866ZdSLUn8MTtsV6g6vbJhSteTGklFU2lezthUgK02mv1XZJb/e2K0JAEiYtCF
 de70fabmaM7JC8hLhXAVjE26C8C1Gi/x6/H62AVC7kCacQpFnrqqiJFBKHXBRuGbbKl06Kb0rMX
 nSyFGdhzP1M467/ndCQ==
X-Proofpoint-GUID: lmOJ1nP_JN7xjJBkxKc4QcJHBUIXPvyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

This series fixes two races in fastrpc_rpmsg_probe() that can be
triggered when userspace opens a fastrpc device node concurrently with
the rpmsg probe sequence.

fastrpc_device_register() calls misc_register() before the channel
context is fully initialised. A concurrent open() in that window hits
kref_get() on a zero refcount, and because fastrpc_cb_devices_create()
has not yet run sesscount is 0, the error path calls kref_put() on the
saturated refcount, triggering kfree() of the channel context. A
subsequent IRQ-path fastrpc_rpmsg_callback() then dereferences the
freed spinlock, causing a kernel panic. A NULL dereference in the
fastrpc_device_open() error path when cctx->rpdev is concurrently
cleared by fastrpc_rpmsg_remove() is also addressed.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Vinayak Katoch (2):
      misc: fastrpc: fix NULL rpdev dereference when session alloc fails
      misc: fastrpc: fix init ordering race in rpmsg probe

 drivers/misc/fastrpc.c | 55 ++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 26 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260923-fastrpc-probe-fixes-30c1980b50e6
prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

