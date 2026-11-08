Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111695;
	b=u7UFxwWroR14vetUa4Gyok07LW/roiJHZvbhoZ7fGto9RaeKRimaamqR99Gi/FBnNhme
	 bxHRu2IX3ZJfmorMzB38caBKl32aoINyWwPLro63IQZCM+0h/xL07WyE33aP4watbU1wN
	 VdLCj01VmCBA3ZdOGG4CksB/F4Kr0ftUy+TUen6dqMzBj7fo1vvXwTVJiLLx5buuDUYGr
	 8niSpQJ0BaQ+HJehGaLyFdOBTukPe00GfYeazxnP08sv6F7/ZphKYoQLj5LY6w0uJYlWM
	 iculieOfSyAok2/0GVwKITxui3DHH96yk82cQuG7TG0CiIU1UZPpmrInWgcl0Dpefkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dv26UUNX2sysY7lIEi9udja9AbScyAtRHjwWVUPwN0I=;
	b=aVBK586VH6Exrakq6xmytC5bTOpqpfXM5sV9yvbVRSKZ7bBNh4RcqRevkaqcbawGfxrJ
	 lOWYI9JcMAXJJbq1qM9jJw8T0bDK3DGE8r8temQE7CaqJyA50ykzseUjh8i4c/qPtuygC
	 bpZrsuvEWwSFz9h9GdcdgEfk8edxppl8bF46vkejKsq779Ivf/gErKMREfrylsURvv2Kz
	 ZzXmV2Fx7ceUYp4I0kDCiDKUBuD0jdTRmW1y2pd1CldLLyQ9crNrMQIs/a+kbU6oQnYgE
	 WkFZGTqHpZB3slKsXwVDvlAy815TGMKAqTlsF7aOmmCBt4g3aHMoZnD9bkpjdcXu0KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EFU7VWQ4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jCUJvU8h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4B606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 04:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EFU7VWQ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jCUJvU8h
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84K2TF4142657
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 04:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dv26UUNX2sysY7lIEi9udj
	a9AbScyAtRHjwWVUPwN0I=; b=EFU7VWQ46Y+5rHNqD0bxorHKbrfSomq5Yhztrg
	Hld/dWbQi4DASHTZKu0m5FUXI/SbGzejxsizPanBr3rGubLL0sH6FC995YdD3EyL
	EMwnehrsE/ZCJbKjNeVCtTTw1IKeTDGiCh0PygLszIPTWiXQaSq1o2SyoQAKcPpe
	t8YNCUBEb6mO11kCwVtGqAEDgldthGfHQuCwLiFes/bsqKHk9/nQmqoCDPGpLPLx
	9zl0uY4iqZh2vIsPgKjcQQPzFhhRfsgdcdqwKKot/vcdnVHqE9nRWAmpZdkSHUdS
	p+Bn+eS/2xvoB11kxoGv8t2GnbNLEc8q6h/RqPUMk9w3LvQw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvret59v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 04:21:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso407562eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 20:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111693; x=1794716493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dv26UUNX2sysY7lIEi9udja9AbScyAtRHjwWVUPwN0I=;
        b=jCUJvU8hIAiVRCguE77/JoOPGEq3ysE1A2KnctYJnn+crbo+LdmOAr9yvlWvgx45rU
         EBk4Dz32FV8ldlr4zFj59Za/Gq/rSckplFXnpMReFRx2w1Mo8Brd2ApBzdSsXyrlP2Fx
         rr9OCZCmQP4y606SL+JWfdPjVHi7OxSAFWwO1ApvANCJ1iSJMSHuo7zFg2EuFCrTpObC
         Ee/blOVeDbBiYL1RjMuyCyhwtLlhDN9ftp7rQ5dhc3m7L7Z+YNmM3233QGYVp+x89OE5
         VYxnE01dFUdZ324XdU5aT6NpXw4RcktjSnyXZUjIpQ1PVUJn6duiKpwdI5iPgbe27wEu
         8k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111693; x=1794716493;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dv26UUNX2sysY7lIEi9udja9AbScyAtRHjwWVUPwN0I=;
        b=hWBiaAXq+TtGCyvDrueZp3M31fMQSqcNSakwPX9//bW0tUMTYm0m2j/SWBtrl5FKbs
         glYA/A43rpL2YRwcIULPzX+AVV6SVAyk5k9wYzJzGFvmBo6A164K1ltd8LZnqwkPpSxI
         OqnJUGSqoNjV3xol2Gcptjvc+5vD8d5jtgkFZl4GRcjt+OCPrUXHDwA20L4eN672WSai
         gxqFPVQ5mXMjnZmqdeUTsrCsdAGZipIYjEWws1xQxxkFkA86VoZqF2bW7VirpATSZ20S
         SK4+FlFR7e7jfcOHCyv0ldyUqbsrpw0ohGFoptl4TQk+N74XL549FFdKYuNpOWzM8bEr
         UCCA==
X-Forwarded-Encrypted: i=1; AL+hErHHOmc6IQ1nSuo0ocDYBYZc5j4cil8UQSi9fT0gdXl38zi+MRhUwHPF63lMiKdjk+gn++RHByNdCXiFH2hy@vger.kernel.org
X-Gm-Message-State: APuU4Z9FWkg/4GWNNexC0aMXSuYGcmlYjPW260qaC89qXL/A+i9xt5Br
	AzpXTyrJ/PadUBjWqPLwOtEl/T5qqY2kytRkJyX7K1clz1cXEstu8gVEEOmQiXIgE6qi0NV15R6
	1yXlookTl4ZYMwkXQRP/D0hDZRGt45jrDUxrSPffdW6tgcxTow1YSe1dmWJGFx/0Arpt3EwsL6x
	ux
X-Gm-Gg: AYBFou2gLyvq7ZrkahhQ/8xHozDTxZw58Dr6GaOgndRGWs1aQS+XT8qBdCg/qQKhdxS
	s7OvdoRRAOgpKiMy7/ewsWUYR8q2nmhvT/RfLwP8voC0R0zXL7gtrrmmCr1tJZQ+q3iVoUj3ln/
	GsnY4gIIkuCAFeZ/OdsRsRYHrPW4U7+z/HEySsRKAD5uushzpbNFqOz7Dr/8j4puWLzICp445Ju
	eyvFd4hmplAzo695/7Yykp7wPfTe8Jzk3kPGV6axu6b5ah8pUolpVSb01qDf/sUXKCW8EqBytQd
	4P9+KBidJ1Wa9RHpPyvGBbTu0/dXmCm7ORhI2eVUP/kO3C10Bk9E9yVPSn5der/UIBK9VpM8UZv
	ojUOyqPK4znDlwjhvpKz/Yw295gGTVZ3XmdvEdEqAb0sM76JWj5utSBAyC5ic/uStIhtQ7yK3Vj
	N7J0Bd6SjPXi20VIs=
X-Received: by 2002:a05:693c:8956:20b0:36d:8b1a:7faa with SMTP id 5a478bee46e88-3725d77d41bmr1386388eec.7.1794111692893;
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
X-Received: by 2002:a05:693c:8956:20b0:36d:8b1a:7faa with SMTP id 5a478bee46e88-3725d77d41bmr1386359eec.7.1794111692342;
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:31 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/4] checkpatch: improve exit criterias
Date: Sun, 08 Nov 2026 04:21:01 +0000
Message-Id: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXYhCSWIVxEf4nbqrkIt2VqE0
 rsb9fFj+GcjRzU4nbqNKlZze04N8dCRaJluYBuaKYWUYwxHFoU85rKI8mhvOGtx5dDnPCaJQ0J
 PrZ0rfmtLz5e//XW9Q5bvGe37Bxkjzm95AAAA
X-Change-ID: 20261108-checkpatch-fixes-hash-0466f2c1d2e4
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1367;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=LdpkWZq+OHf2J+IcGsf2TtECnk3senyRqEHyRHjdB88=;
 b=L/Kt1UGoT9q4JRQHhqncRgWPim6RJ8FI7nB0ynzwAWNfgOarsHBQohuI6xQklrzZQHZBn8n5e
 dHFA60n5UrmBDDNTimZ1lIaMWTbo/GQRWa96KL1IMOQ6KMk+t9Ox9qU
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfXzGwZtRIApLgT
 CPNfLE7/PpBZaJGp4mj4sDjE1sMxcmmKlks2IFZPhmY5VclLUDbmHbe0OqLrubVsXKqof24Zu0m
 Zx57CsiUp6zydYyjxUvwFcOWcehaO7I=
X-Proofpoint-GUID: tdB4p_CQ1yLDExVg_Njw8z8bOOUaovKN
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6aeff8cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dGW_xDJuxoKmTSZJ3mQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: tdB4p_CQ1yLDExVg_Njw8z8bOOUaovKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX3D6xMLaXouq7
 R5TJV6fyOhgJtuO58Gmq8rgFfKSN3EWoMUVMkCC5Ugn/4WgTZL/RM3+gnZ1i72Uh739Q9eUIDDl
 LpdDs9kt0LAfia9p1OAWTfgdxL93kTgeIY+fMuz2obBN6ShCOVEz7PIGkhwUKRKLmAOuC7xUAci
 J+OuSc0C3Ca4pqUb6UeuoHc3XylqGLykt7f32FcbrnDowhnzkuHj2wh+ForvAA2nC7rZkc0YN58
 GhvH2jW4iZHKY8JnVo4SjENoQDsCcjzsKGcaP26P49TP8dmHDbJokkAZ0qh2hSrWmqxBCWuclKP
 PnTTlKtCs2S/YSKTV/T393JyrCVYQo3xXGNEiVr3rPKWAfUrpMUC/9b24LKG+lDpxjS0fTZLWQj
 eYNeYgcWZ8lVESXbcOxdv7lMj8AXtk7MIqxTlOW0ygMq5JMj3kZVAFNdtArTjZwEfgYrQUVeDVL
 HLNAfXdXkibFULPxGdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When invoking checkpatch with the --mailback argument over a range of
patches the tool unexpectedly exits successfully on the first clean
patch. For example:

  ./scripts/checkpatch.pl --mailback --git v7.3-rc1..

Checks the single commit and then exits successfully. In contrast,
omitting --mailback causes checkpatch to check the thousands of commits
in the range.

The same behavior can be observed with --no-patch or when empty patches
are involved, which exits successfully after the first non-patch has
passed the checks, either skipping further checks or failing to return a
non-zero exit value even though errors has been reported.

Lastly, checkpatch fails with a non-zero status when invoked on a
missing patch file, but zero when invoked on a missing file.

---
Bjorn Andersson (4):
      checkpatch: don't stop at the first clean patch with --mailback
      checkpatch: don't stop at the first non-patch input with --no-patch
      checkpatch: don't stop at the first empty input
      checkpatch: fail on missing or unreadable files with --file

 scripts/checkpatch.pl | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-checkpatch-fixes-hash-0466f2c1d2e4

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

