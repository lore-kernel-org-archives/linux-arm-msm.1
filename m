Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835663;
	b=oR85ghJvAQsWRxcewoxEUEqnQYjDyF7AHLVJKb3wc34ecCg+qrjwAr18RU6QPR8e0ozP
	 IuP0xXtILIj4hwYtvxYam6DvxNqEz6q9GU6z9BUoxRJYuZxzhypvQ7UN3XyPrUwJJlqP4
	 gDTVg5MnHk+TkYh05WTXMn3AqfzQuTu84ShNlXzCFnKOwfruYhYouT5fXyWxaFoHwz9R3
	 ZDQbFN1eagENnP56tLv7eJ7lK6I2VR0qO4ojK2552BA5moY18ogQTQhnEg1E51RnGE2m1
	 7iT1b7ZUqUPjK/RCsQb/y+h+nAT4brh3fQKJv61gWVXqFF70mEf2eIht3BiUR8xY3SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=guvuApfm1WiVp6lOwwVdCibXPFsCHhFXRI8JJuThGKE=;
	b=MgaVpXc4gRyICMBYtMm73PF6guyK+1BFXGSQtB6vsnesYoXjFHfoBqeIPzHfgQvX/fcO
	 9IFxer9Jv13qTLaAzTmNHAwWeGryFxxZmCdGya0HGFzvaXQDzuXY1T4hD6m97VS+A9jxy
	 vBB10+iZffRtgsNbxsJj16RL9dJM6RgXOSFRYPyK18lLpFgG87d+txCvyO+Cn9zPJXc3h
	 9QLQ6WS54ha/SoG03Q+w6fa0Q2XmIbXmSnMyQEyAy1dAdnIKSdCU9Sc3WDqBv1dFkE1aR
	 0CukVjscrl9NsPz5yYPbBaQCtVsK9kw6HoohP5eapLNZAsiNpsghI0IIIuh4BzVpcyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0exRy1I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmslQEJT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3460606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3460606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0exRy1I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmslQEJT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1HZ13117269
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=guvuApfm1WiVp6lOwwVdCi
	bXPFsCHhFXRI8JJuThGKE=; b=G0exRy1I7k8EfQ1IhV7Ysi77z/1Sf9YixnWMJf
	4TLFbn8IpNzsTkfKV4Au0zE1vsgh9wrzGlPgMpSaYvXLVlXvWms8PyqsQJ0JycMW
	jY83XBZdt7IB+lHvLB/VkYcWXtGnVC09xSkqGY6AJ5hUN0vPylBcacO7eS0ODSwU
	qbJ1pBf8c5rLQgJWIClRTiNr3QS43yWBdE4eTnHvOpd6z/VNSSlB2AmXarEXcrNk
	+KhSO8DDS3rTD5TqWU6h1gOxAKsbOPcXVv6+3Arab0mG9vmqATgWK0AzP5zfaIkS
	pjyY/okPECO2pqLnxNuhkXrSux0GWpZ+hoLVuxuzAlAPBEpw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8096v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:41 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862bdb93612so1446787a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835661; x=1795440461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=guvuApfm1WiVp6lOwwVdCibXPFsCHhFXRI8JJuThGKE=;
        b=cmslQEJThzbaewK3b+vfKwN6WNYPfIBKibGhEK+figyrmhuilePDOvFnZLtyLlayeT
         vDY4rGHd9dP6u0AnAZBsnIAAWofc15SQi31kI61CM4siaJapuj0dI00uhNofwYgHHNWj
         ux5p3gMQqY9R5Cy05iX6dI45HSqdSYWkc+zC6CuxO8WjopYvBFRbGCXN0vet6j8fiV4M
         Z+A8IQGNG3/KoUZxGiN98RTfVpukFlpnc20gpxpASOt6Mr7pcbAvmczh9kqhLjCQHBPD
         /WwZXVf5UFr3RUzN8XOha67B/DsHJw5v6vv09iMRcHmRF464cek8h56J+cuPcpEgiT9m
         3RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835661; x=1795440461;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guvuApfm1WiVp6lOwwVdCibXPFsCHhFXRI8JJuThGKE=;
        b=RO+vl1NuS/rq8kF1U8Bn90OOpLbI3xlrlyA/5yHqRZ0toBFiVCR7vRblayFlY20fLW
         MiDlSexSgTL3wd6RU8smhAYWYdBJ7mWAOMO7Vr4Hf8c4qk+tjtFowwUMpY0pjeUyKOR3
         j3rqMqXQ9/d/QuY0Jlc4ZgXl1YubN3f7WX9I4ODbdxMCjiZVsIYYjdYQ2SQAqwwHPKRl
         8XjVyO3Y/++cReKY3JE8vB/9YJfO33BxdWTEQJTDEfYQTY1n1g9k4ZjIAHtC8SG0uA4p
         CJNRGyIRB1x5sjyIUyH6XqDbOuloXuAUDyaZPH2IhWzA6rnlVcFE+j0SdSvfP2RSg/Sj
         3Tgw==
X-Forwarded-Encrypted: i=1; AL+hErFkVhd+TUv7RvfChUXC312JeA85PmiSO0Zsqe+6oAJYPHrnjTR64DqnAsd/TjkEsvy/nG6xaID6+2Gv/s1E@vger.kernel.org
X-Gm-Message-State: APuU4Z9dsG72+zSjpHuIkB6yK9EZjAKIxW6yOeIu95rDa66q95K4nEzz
	zaR4lZJNn2CJpan8wZiucmeTGx+7w6xME4MU0gnnZIww8EzqB/n1Ts9+Wgse89yk6Z6B09JZEED
	38woCnMXsOgRySnt+WmTSsuMHsBPq15Ytr5iDFspczVf3eEv1X+IUPfBeOR5eusqWBmSbCmkA89
	rz
X-Gm-Gg: AYBFou0n2tHHRPV2tDhqchseL2BGaPyr57WaF6eGukk8Us6n+xabkxJTa805LA18aUG
	8P8CDwYL5vDmWGwB/ntkUYLBXfrEQQRTAhTPPCVvV1ZQWtN9q2jO9EnZbvKTGj927VOqM1rKSwq
	bfVqdgh/H/cHyahCNppTpzZWTS8lrCWx/2Noj+Vg1/m4MfLfXJPLkH7XR9KcOKL0w9aUJ1izXNH
	yLg4ASPY5S9imLrQmPe4pW1qYDQRJHOnND6A5X/itQvOFBc0G9Iuwojnk+VeW3I3GVW4BVcu8U+
	DGrXKW0Fxq4u/lJ+RLGbxeTC4Y0d8Qx1ntoyEcoNo00PQDowHdjROdPqbGk7S5kmKnBV91X3bG9
	/QYFxsYyhefQG/1DvNDIzFjPwyBBlpghKu9mtKVG7qgQTHDFuI92bt8oNRWKo7wmhuqY8RPwWBG
	9+N6K7E2o=
X-Received: by 2002:a05:6830:2316:b0:862:b733:c7a1 with SMTP id 46e09a7af769-862b733cc47mr3294274a34.14.1794835660752;
        Mon, 16 Nov 2026 05:27:40 -0800 (PST)
X-Received: by 2002:a05:6830:2316:b0:862:b733:c7a1 with SMTP id 46e09a7af769-862b733cc47mr3294260a34.14.1794835660295;
        Mon, 16 Nov 2026 05:27:40 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm10012527a34.17.2026.11.16.05.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:27:39 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v3 0/2] fastrpc: fix probe-time races between rpmsg and
 userspace
Date: Mon, 16 Nov 2026 18:57:29 +0530
Message-Id: <20261116-fastrpc-probe-fixes-v3-0-3cd56d9d9a93@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMEE+2oC/22Nyw6CMBBFf4V0bUkfoYAr/8O4aGEqTcRCBxoN4
 d8tuNAFm0nOndxzF4IQHCA5ZwsJEB06/0wgTxlpOv28A3VtYiKYUKwWklqNUxgaOgRvgFr3AqS
 SNbyumCkYKJKaQ4D9kYrX25cDjHOST7+wczj58N6XI9/SfYQzxg9HIqeMclmqtpamMhIuHjEfZ
 /1ofN/n6ZBNG8WfSohjlUgqrYy0yipRlPxAta7rB1+phLcdAQAA
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
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org, Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835655; l=2067;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=0hSbXEUHWhOnAJwHR1KYQ1+mIhj4JPQ+AgjXU0arhKo=;
 b=17vbNjqF4I1i1d38v3E4MmjngK7pIy50QiuIVJTmoCgg906g5vHwhP7znbye0X+F0LKim2bfn
 MUbmFojkzarC7ArQU4KIeGsPKsaDz7bY5knBTZSO1udOMn6nsPlASpo
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX/um1CvsPipk1
 MDxOsHlb84H60yzb47xHk0Ywb7mTZC/A0efZBDLu+vpofQq4ZwlLsFoYf6vHBR8IYjQtU0lYa3k
 Ieqdx18KqHm0wGv3J3p+DVK/KXpc7L9Nuej0lPN1/QlImMoKc08ZL0ECri3yFnvFJd8XpuFDWSn
 Uik60LBUHsaZQN5Q/akpfOYj3K/qFk53SItc1s2oLg6h9m2xuTRs8Uq0e82hOn/mjIrn3NoRicf
 LBaKPwW/ilFpsrfRE3pbyT/UqeDw/Uk71vY/hoH4a0QTx2WX8Vw7Do0nq9did7vULtpluB6Wyrf
 Jqn0LnSQn8e/iO6X1iOOsyBnlae0NTzEcA65m8ip+28U+p7C2xLNdlpszDTQZo4j3b0c/GnyTSh
 x8s6AkXW8BDzgp6JlqPNG0opF9k+lcOdNFjEPO5T/70xMTCPKOqpCxL7WrWaV04AoPVarrpQw0H
 zOWtrbKEH6BE8tOXw+g==
X-Proofpoint-GUID: JL4kpBkyLZbkqDDUXIcuWU1oKQg6KXtx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX455P3HaV4PI5
 o1YiLpZzyBuFdQmdVl01ZmCIqiTsmOaLz58t+eeO5Kh8iWKLMWyWX5QX2tlSx/uGhT6szaVL2rH
 kQ786A5dWhLCGyn2nB5Mj2h38qfFano=
X-Proofpoint-ORIG-GUID: JL4kpBkyLZbkqDDUXIcuWU1oKQg6KXtx
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb04cd cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BKo7ZjnSzHxpABjNsfcA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160053

This series fixes two races in fastrpc_rpmsg_probe() that can be
triggered when userspace opens a fastrpc device node concurrently with
the rpmsg probe sequence.

fastrpc_device_register() calls misc_register() before the channel
context is fully initialised. A concurrent open() in that window hits
kref_get() on a zero refcount, and because of_platform_populate() has
not yet run, sesscount is 0. The error path then calls kref_put() on the
saturated refcount, which kfree()s the channel context. A subsequent
IRQ-path fastrpc_rpmsg_callback() dereferences the freed spinlock,
causing a kernel panic.

A NULL dereference in the fastrpc_device_open() error path when
cctx->rpdev is concurrently cleared by fastrpc_rpmsg_remove() is also
addressed.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v3:
- Drop the dependency on the dup-sessions series; use
  of_platform_populate()/of_platform_depopulate() directly in the init
  ordering patch
- Fix Fixes: tag of the init ordering patch to 965602eabb57
- Rebase onto next-20261113
- Collect Tested-by on the NULL rpdev patch (unchanged from v2)
- Link to v2: https://lore.kernel.org/r/20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com

Changes in v2:
- Add Cc: stable to both fixes
- Free cctx via fastrpc_channel_ctx_put() in the probe error path
- Clear rpdev and wake pending users there, as remove() does
- Move fastrpc_notify_users() above probe
- Link to v1: https://lore.kernel.org/r/20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com

---
Vinayak Katoch (2):
      misc: fastrpc: fix NULL rpdev dereference when session alloc fails
      misc: fastrpc: fix init ordering race in rpmsg probe

 drivers/misc/fastrpc.c | 94 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 38 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20260923-fastrpc-probe-fixes-30c1980b50e6

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

