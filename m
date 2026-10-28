Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181134;
	b=D5+o/F2NwtmPGUjjZbmGi6iWrUYu8o3+JcVxTWfY3LXaa9MxPKauPRT1iGuSsYM4oR8Q
	 LBWyuGqa7ePcD+sIrV6+bcDm2VN/gDp0hN9wcFpb7cls6j9cJ0rspz7A9wUWEj3Hg/cPO
	 zWYW3mLx37sAOfJWNz0rjNr48QTaGohfBmYZtb9jPEJkIktR2tu0dcA9Mmv+A0fbgvAIE
	 CuO8TQgezqu+ZBxcL9+UJwwcNsIA5dfoVtw4HA+66r5dL+90fx/SP58EsnZcL2jytLpwY
	 6v/Ii8AfWbke73k6HNCIM34cMvI0oim5YLsQ/n9gdI1oi7b+n5ocMX3T7mBOkCpWRPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
	b=PaeNy4IhPU/jQwjMqfQGYLEl1jzH1bnfZt34YgwAQoGrGWWtmIzXRjqnx85Yd8Q7z2Vx
	 DGEsIU9dtFkOeGOGvPEEigDdjaovSFlV+xBFPKKhaVxDwRiCoWNa5XHP4xMekBj5iOfmC
	 tV0scZcxDNmAQuIHwLzeMuvZa2iqcnhAb3T+aP9sH+J9q+YHa0frB/TY1JGeokG99/jd4
	 PQT8520h+r7/gddtyef/K2ufmbdmw9Kb2LiOx7B1Ls+aBfo2QRf7g0KujXM5qigzAH90u
	 P6XsZ6UxG+WACFxJCc1f6QyqYUdEdvE11G6PmLNDINL5Jeni/YJvhYx2pTDgfatWo9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o8lMw/aM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJRRgqg8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28240606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28240606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o8lMw/aM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJRRgqg8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K75I1667693
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IfDKzNsgAHeLY6I7naXl/T
	i8gw1wunbFLanBQnyLppA=; b=o8lMw/aMs1SPxXVNchecSlFSlZ42GWcqNlQyPH
	hwJrPI5O1kaHSbYpH0sUcnQcYyNW2hHL+4jnV7q4dkHEEsFXXOYgzfeNx78u2ILj
	aMYhggByYTWkLMKfcnw/GKtzhztPfHShz4yv+pwLHP6zAWBYV6mk9H/DtaGM6o7J
	xhteXrBCIiGz9d50rZmh6BxP2zW1i1e0+c0sNSkpcnWZ7zFcd4WhDg2Mqz2dHYRb
	a7INfbG/iIX9VYaND3IV27iA4QOVbQ6CEry/u2Q4ACDg5R7Wb2QAC3pVm47pM3Ni
	2/ZdwboAfxfxxZ7K3ck0C8V2n1Eu2pDgmpezi54daDptvqiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptyjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso355551885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181132; x=1793785932; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
        b=RJRRgqg8JAcll22pYb5ZJ9xWecZrl4OBsPAb+sz5SLdk7kF0WmKjawYgCctPCN/jIU
         3LZqsP+D6dKLsY60JJ+CkgHDOJgvkpMHrWOHey7iBH26d1BBXdRsG4GXs6vCA9eb3BE1
         dBM2fQVocBe0gJcq4dp4lBA7BkJ8xJhujT4VSAtHl3Fn3iHCWuP1E4oqTWt4iwoOS1/Q
         X+ZzzrZPkfTc2mvnvrHbEy8U7zSWhWZVsp4eE+yQ41HBTL2XKoUUQ0imwyz4sgxQD56U
         xusume097vSguyTUamjEcioWdYqkx1CMVxPKvf/ZGORatNqNCPulzU9ClDU9WlWHfcO7
         gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181132; x=1793785932;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IfDKzNsgAHeLY6I7naXl/Ti8gw1wunbFLanBQnyLppA=;
        b=VPPEKh/Jo/jsE3XPuy5EFFnSMeNuirfBg/nHtV2lS5aonIMR5V4zpeW1kJ4wsEUEPc
         rENWlKORGhYMlCDFcpeeX8AdAlqUKqUJ6xpV8bnMBGuldVDVV3cYqc86EJszaE2n+pxr
         u2R3kfMXAMPGSYBSFhxLCcZAkJb5kj7akJbofHG9GIcur9tQwRWCzppJvmGwfpuj8bHY
         qo/kWW2ep2xAbYVct9cH7sfmM3uR6AcI1mOjhQSfZg1cJ42ZPRJYtZXdxdDY6D/ppR82
         lfTbW0uqtD0a9M6i2nRjjml8seD5OgntyLrkd6VJlsJgcSNDmKXvVG7nQn+m3GVWfiJU
         RXaw==
X-Forwarded-Encrypted: i=1; AKwUvByJNxqRqLiFT9pMOMVS0H6Htaqg3RbxmDYY9XTnquo0sYtkFm3Zq0eazJti42RD/HfkYTmlX0qydd2+qLA8@vger.kernel.org
X-Gm-Message-State: AFq9FYIJRkRy3biO853CqIlwjGbjOQVbyEgvwFbi9GX4zNiycNRJ3VK6
	7A5Rr3Wd/9qvWFY4k3E9ULMxd1wP6H5v/GzEkjsJyPi0tb5HTesYlBD0cZoO7Oei3HCkhLyl13u
	9lcB13J5J6jboAGnXOmq3Hd3ppWnFyiwZB5JBoEwfJdW6ToP3OutD8bPyUY6dQNGPSlBS
X-Gm-Gg: AYBFou1yrBEZ0P4WojwhY68PQxn1jzZhOQNUsQpKfqFxtLvXp9N4MKVLQuY2/GBd7ux
	HST3bAlvs+9Gc++GScYIManspqKqycZ2vqaYGtvBChPUfzT1gdM69g9j0ExZEBaMbYn092f/FpS
	fwdvghnXe7DKfknoYgyt1Bxx6hsQxlAFkJZhFWS7W0GmkGfiE6ts2YRbP6Dxf2o+DagSNwQJQTE
	DfRYRHfNR5bo+LkB9GAS3T/BYVA26lK5aJ/pvjE6oK5ZECMa4A3JiMlNyIWW2Q4Id4rASg9ORnt
	dgsuJzmAeGUhTv5WH2TS77E+jKphqwE5xDoHcvPAkFBTLRYd9LXyA4qKVnGiSDoKn6LX2HCJ2Nz
	wA7o/JPBXAFwESLYaMLNeZEwFZyvvkBVn+ZcQchTUe7m7/O7odXCe6VbrXa0=
X-Received: by 2002:a05:620a:470d:b0:93c:d209:4ea1 with SMTP id af79cd13be357-943f4b8ef57mr892402685a.24.1793181132123;
        Wed, 28 Oct 2026 02:52:12 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93c:d209:4ea1 with SMTP id af79cd13be357-943f4b8ef57mr892399585a.24.1793181131501;
        Wed, 28 Oct 2026 02:52:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] clk: Restore the clocks of a provider after a
 hibernation
Date: Wed, 28 Oct 2026 11:52:03 +0200
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMPF4WoC/yWNQQrCMBBFr1Jm7UATq4JbwQO4FRdJOmNHJS0zU
 YTSuxt1+R7892cwUiGDfTOD0ktMxlzBrRpIQ8hXQukrg2/91rV+jbHD9LijkpVRCQMXUhwkkuZ
 Q6hh3HTO7nsKGPdTMpMTy/l2c4XQ8wOUv7RlvlMo3DsvyAX4bTEeJAAAA
X-Change-ID: 20261023-b4-clk-restore-after-hibernation-74fff1dea5f2
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w3jz68RcqMoy8uBJpAr2vq/NID/jlj1n+38Cjr6e8wM=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGrhxcajhPRtnl1/P5MpMKjmO3wAHx5nIclRP9Qb42we8Rrlr
 YkCMgQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJq4cXGAAoJEBtfRMkAlRVWk9EP+IFt
 h4alqJRTEr965fdzj2YzwsdsX3SVxZYw3KmWbKdsZigTS1ySR5J7dYXE+BgeNV+uTYQzUFrmhEO
 B/w25Z6I/slmPJy8WFfBzPssY7i12jKR/hukbD9/hdd9j83CkXTrUo7IEBT0VH8Xxwo+3VPSAbw
 yiPBAzNu6cIWiwcmkhm63v7gygYQoD8kYNGlI7ODjLpSRfVQv3KCs1KQmXcYrpuXZ6JxRkcLywK
 UKcG4Qs6GT3GVvnt+c6qu4QjyZ9899Nx+zExyFuv7QzxlAz+p09W74kkgdlp1DRjfEzNdI2zsZO
 NknRQI0ZGK2vGOi3P5hXpgyHgkMyZPcAw3uzzmuo+USDinqeXTa+PwZqDcNIpfJUEF7z93RN06s
 5YaR2lrxoSe2M4apKmPRFBdxLGHlbQodq0v3qy5fumkOYuc+DQc5bZUls3DipGkJKRckB17iVbZ
 ni9IXE43ySAAUp2jECfaa0gR+GHEQHQ44UZ4mUzBBwhJooo6W5hsXPrVc496sMKH37wg1cdkfR7
 h6KvcwsbzRjiIi0KnYwOis7DNRLkV7UhpkAJu5Es8OWh96ZIkU1UM4qnTG2T8XaMg4h1Dmrb2aC
 kn0qzndII7d3fkjPz+gSWFs+Q8oLmVs69biJMe++R2M1rzbEyoZ3fnPz75UwrrXOAfGSkPF9Uz6
 ImkM=
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: pLUFrGw5BClSQIlmG21Ch3zdvToqoW4m
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c5cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=mQFjCgyIq3-au8Xv:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ktzcv0D_gfG26edE9_0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX/BJB4O7+rwk2
 OC2OftXFo3st6Y9B+4jqXlAOLoUYyNiZe+sa7qOXWT1tmDi4fpWVsNMhgVJ5QNx18M5wq1mReYJ
 5vWTUTsOJLuiDB3fqdp0isr8B8RUA49zdHAHN/u+swDFmKwhHuno1qDn5lkOi/uKRP1ERD2uNgo
 z0YEISjRn+/pit0jGyjRjINV/yp+gOjLbVcMRblEl2e6b47dQirO1RrKYrufNbX3NU3u3swnc5z
 hgfUo3v3R/YPmIJc+zr0lj1v9RcZnQjgKB/lJUS25LQCsWV8x6vc3oObW3VSkuwvHNX8z8CGXZx
 d8mpv8RaA+47xF5hVU88/WJKCwd1nc/SGXXV8G7qSnXdxMQMrAVZTLhiTlMRSsXl360aDApoE1j
 hn8lVdsTiX2bSSy8n+Ay3KrLmFida2SZCq7LIyL63xOaggJWz5bCBbtOeYU6aCjZ7i5uGeuLDsA
 tuBF2UTObRtXzIpFZRw==
X-Proofpoint-GUID: pLUFrGw5BClSQIlmG21Ch3zdvToqoW4m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX0sH5SybO99Eb
 StvowzE7TQ6RQ68FtrpG0OLp3fjQ88bmqu/bgdeCpQsdSSAHJn789Km2n4zmQ7aClexHrcAL1W6
 4Eugj/rg5pt0bZPL4AM8nnupUybCLnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

When a hibernation image is restored, the clock hardware has been through
a power cycle and a boot kernel, while the clock framework in the image
still holds the rates, parents and enable state the consumers asked for
before the image was created. The consumers ask for the same rates again
when they resume, the framework sees no change, and the clocks the boot
kernel did not touch keep whatever the boot firmware left in them.

Whether the kernel that loads the image probed a given controller at
all depends on whether its driver is built in or available from the
initramfs. On the Qualcomm Glymur CRD, the display clock controller
driver is a module that it does not probe, so after the restore the DPU
runs at the 333MHz the firmware configured the PLL for instead of the
717MHz the framework believes it runs at, underflows, and the panel
shows a solid blue screen.

The first patch adds clk_restore_context_dev(), which re-applies the
cached state of the clocks registered by a provider device, parents
first, as an alternative to the global clk_restore_context() that
depends on every clock implementing the restore_context operation. The
second one adds a hibernation restore callback to the Qualcomm clock
controller common code, which redoes the probe time configuration and
restores the clocks, and the third one uses it for the Glymur display
clock controller.

Sent as RFC, as the same applies to every clock controller and I would
like to know whether this is the right level to handle it at before
wiring up the rest. In particular:

- Instead of programming the cached state into the hardware, the
  framework could read the parents and rates back from the hardware
  after the restore, so that the consumers asking for the same rates
  again go through the normal clk_set_rate() path. Would that be
  preferred?

- Programming the cached rate of a clock that is not enabled may not
  work on every clock type, for example on an RCG whose source is off.

- The Qualcomm callback finds its state through devres, which only
  covers drivers that call qcom_cc_really_probe() once per device.

Clocks left enabled by the firmware but not by the framework stay
enabled, and the phase and duty cycle are not restored.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      clk: Add a way to restore the clocks of a provider after a power cycle
      clk: qcom: common: Restore the clock controller after hibernation
      clk: qcom: dispcc-glymur: Restore the clocks after hibernation

 drivers/clk/clk.c                | 68 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c        | 52 +++++++++++++++++++++++++++++-
 drivers/clk/qcom/common.h        |  2 ++
 drivers/clk/qcom/dispcc-glymur.c |  2 ++
 include/linux/clk-provider.h     |  2 ++
 5 files changed, 125 insertions(+), 1 deletion(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261023-b4-clk-restore-after-hibernation-74fff1dea5f2

Best regards,
--  

Abel

