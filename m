Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555864;
	b=XY7hacTzjjwMK/I8xW57aQftgcomZkOhN6pNpvMO81aSyftodTuEbjynptE+2KM5L2Qz
	 UzUMEhU/8Vl6Un9F0xgBVwvh27IlP0yl/b4Rc4xizE2aHt9YW16/cXdJjivITWtK/UvNk
	 ndT8WsJEx8I2CbL/dONgeH3W7c42zqyMaC3vcinoD8UQt+gV0cAeG5OrYoki08jw/c8I/
	 21nAth5TwDTWs77SD9Jn86tIrKfsjzNL05Kx8FRcYip1vKFhkPgV1tQQt1SY/6txG/rmD
	 KiGD8evBtyqQapiCwaX4G4cjyyWhpdRlcevTfGaK6NVfQ5DSTQb9OcOtn0XWqoeYGSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
	b=vAnTgz1CiTSUy8rEoxTwhJ9XOi6QRt8CL3dclxhHde23UKbxIvMnHTekcObmaqV6HBc/
	 uD+eaoChJ78sdPaVrnMLlnO5aDtoc2VEMPft0nVGc2ejYcRaNyiOxgR9u1g7t8Q7LPwJU
	 egjYZT2diadaNOBjtrBNaJKFyrM9pLwfnIEyNxOOkCyUFg4Coz7BA5VeY4EDcMVJ+ij9Z
	 wWnnU/et6+kycJjX9wmZvBIwaMVtlx0I1V/JzKVdjvpz93T/d8Lrkg2yWajzEL34Ch1zv
	 Sz3Gvg68Pv0k0yCLuU1URRv9L/hFuwzfu5V1Hx/7rNm5Kk4+PCo/3h9wRJKZBcPmSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dl9bYCHd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tKTbc8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55EA606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dl9bYCHd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tKTbc8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FUJV1957068
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKf
	to/eg58Q=; b=Dl9bYCHdXyIwzUyCF2SeUA9h6+mQAojQV0JJRQjd/I2qcojmpyE
	HMOYzLUrvalVi6CvMM5kEqYTuEWRFJKz0RW1Tj+suGcXJ6o5gPaA0el4MfqhVeK2
	0fbASxwlzyWzs9zTh2uqHmESWFxrwrDd40Pg8qYAnWn1kjKpEJX2s4ExPDBhv2yp
	R3TlzxxVNGckdg90CL42xSpYYEuZajc0hR0KM3BFE/wGy6KZ7/IL8R3ke4UyNy5t
	f0f5bDsRcnHUjgU4Y++bPOIl+I7UtXJTG+CYLK+uKwvtr8yO6qrrCDpjsDljTCu8
	Lm+JCzxM5meG84GKrWcwwpMJuIez2Ot2sGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbckx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so666143eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555862; x=1793160662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
        b=E5tKTbc8k/N6cpreQNznQflMHw+T4CaWLFtXqeYgrd2Y4gPACS7ZyWPvIKwctDHgCv
         PpW2M6QNpZzd4xQQIKkslqaKKypkmItfy6q+CH0L+LOnBwd81vn7tbfLrbDTb5LQReGd
         /4fhCTkznf3HqIncp29pJzFSZfbS8VAyMaTGjptZmUGLv39njiZSq+SmoLTWWXqQaMMU
         YTHRYboVajDir3pXb9oAAkwZxxJlA5srK2NffT9qbmkT00+go/e9gp3z8kI2yfBmn1ub
         C6uUcH9O8sJmHAP96n5BTrHO0ukqdQkZrWXoql/raUK6eo6RgmueFntZ/qXAXNytWhS8
         tDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555862; x=1793160662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
        b=d33bapAX/WP9ftxxWKS3Kb3Q8ei+gvFsAsSDDn6plhd1a2EbOnhwlwygpkbqdW0Aui
         e0HRmkHcALa60kqFdT3A3CI5eH40XkGqO4Wl+bhZOgPeTYNVLTi5u7Zs2IBB6QzjL6dH
         iK9pwdVu1rp9dtKy4JkTJEJnbvFiDDGXdZRf+URBOb2NqPkyYNWjzZR70CcAdoU7f085
         nIAYPEwpExHhzRTLFlXfhZd312ZlG5n7/g39F8M93+EFnlkuiV5vIzgQwIOaKMTi/cp8
         tXboNr5IoWR+9MqP+291t86qNlgisS8f5ULic/Kps/bB+Ls9ReAVw3/c3m+GzPgPj/iG
         0Trw==
X-Forwarded-Encrypted: i=1; AKwUvBxaE3K1UBAM99cC5WViLs1rTmvmnMK77GZ1ebb7WLxVUgOCcXYq+DekY70fkNwE2AnHK5kHNnVI/vepS/Q6@vger.kernel.org
X-Gm-Message-State: AFq9FYL3q9ZmWBhIIp4Uu0fO4zxS+nymPT7QLrRJEt0q84DtzLnLgwM2
	ItTACokbu5ST0GXrPVFfeOO0w0TusNWBdi3UFZDRLMmk4yqCg8uuoPL75fR7eyHGdbF0LyMYt1L
	xFXn80e52/pLnHjdPeNTNJMlDReY6pubLXyb4JyqEEilfsrSYJFmvG0cy5HKc8+GpaUvK
X-Gm-Gg: AYBFou3P30T/zZw7MdDm+FZNZCB3M0NdM7S2XVDnJjMGyjgSagWe4fLQncgv+JkyTTk
	+QL8TVsU3t7NQUJipgtz2vy7mnmu7+KDn/Nq5071Wea9wTZradEKLJaBcYuPAxzd6/daUBL1vIk
	CxHVllA6U+rFykxKTUy/529HFJLeIEDTNxdVGrFpxOHb+RLOy/nMh4OHqSFtDMOmUG5o98r3kOI
	rPGp1z+vBkNX5CPS57pwiOc5Q7NINEca704wUn3v2jy8WqGdlUmECQMvZJxxdstNej2k5fn8DIc
	GX19WxeJJqEFJNoKw1ZFrqmOdodmIikk8PBrNUfQl8Do81N7ygNx77h4owSuC7qltHSxb02HM/J
	0z6zkE5aaQbELfuF+yEKVD1I4sBTK/aL0VjajEcjk4SBFCOnoUN/yfNS9nfk=
X-Received: by 2002:a05:7023:c019:b0:143:7001:7645 with SMTP id a92af1059eb24-190a8f51d82mr965139c88.47.1792555862065;
        Tue, 20 Oct 2026 21:11:02 -0700 (PDT)
X-Received: by 2002:a05:7023:c019:b0:143:7001:7645 with SMTP id a92af1059eb24-190a8f51d82mr965116c88.47.1792555861468;
        Tue, 20 Oct 2026 21:11:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Date: Wed, 21 Oct 2026 12:10:41 +0800
Message-ID: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX5IS9tVhhPsMf
 nGkEyHq8MI/n+AGWDw0OtBnwHEaKya0iXmN37Hq5XKf+yB2YGDoeZu7naGpZmM6W0/qxWexudCm
 VcMV04a/4yqv1cfXaPMi1BkspBWsNoWt013KXBWe0xZdDj2TqUXyRbWZSnP9AxjQ5pJ4UVM6gG8
 CCMwV+GIlr1+6HfT+C2Dhr72ys4LgcSGqz6nPVi5pXbUSsPfqvAimw9zNSW30z2rpn7NZSzEwnG
 FVEp6OD5CBS9OMEk/9JJ2NzBrerfCWYwSiIQrM/3eFM9YlIZOKn5ZDKMQqPQSYsYnaX11K0FrhV
 GaVRP/Em6/PtIx5ZipsZmSAthJGKad4TnWe81vMg2KqoXXwfGZjRwnwd6w2CgMz7QtwAsWB9Kd1
 pFXVIhqBuTWEP3YN1Ucgognk0Da65FGkXzUqPLOSZwT2x9LJU5onqZB1x1xngzSmPFeRCoYDqF5
 X9uh68eorDJsbL4fesw==
X-Proofpoint-ORIG-GUID: KTTCm_orGl74_0pC-YESlowlunD6jvjO
X-Proofpoint-GUID: KTTCm_orGl74_0pC-YESlowlunD6jvjO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX9zMJKWPXtbhX
 umpkwH7ei0OavfhN0hzGbe80EEfXd299bEs0ycfax5GbEnW7cySZ1ihXQ7G3EhrH3se/C4AspIn
 fTQ5HmonKxgrVWGpP1ZEFeweg/FKHMk=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad83b57 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jKFkqTp6JJoCw1ulDCgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210016

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

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Add Cc stable tag and pick up Srini's Reviewed-by
- Link to v1: https://lore.kernel.org/all/20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (3):
  ASoC: qcom: q6apm: Fix unmap regions response handling
  ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
  ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

 sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0

