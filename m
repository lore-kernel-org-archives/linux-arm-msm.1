Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640009;
	b=ND0OenOLTlKAhz11eXIWKroaqISIjBsi0+9IKNlDpCPTlTHCsXlSFtzBTXo5CxdYNMei
	 E/ncN5yfQkkO7sRcMZn3HxCDr11y7fsu9wfyk/SvWEG9HoXnzIriw4zi7zj5D6xUaLHyI
	 YjM9zXAr4tPBGWQGKmpm6DsDUf1wsPctgqtIbH6vYfGgEyB1dxql+hBH5M/XM2YRz3m9u
	 hKXnFlEkzVvqGQ4wjGknfcIY8F1iGPfTYcPB3KJXta937XM05h7FJ6YYDU+AZ7zXr8+vD
	 tDNA/U/JXf3Cr4q+NsVYdPRhUiy4Wd1jfhx2wT/6ji4CC3q7Q3y8CgxsOGPnoS0c+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfABJXvuDxM=;
	b=0N/auOfq6pOatQkSSPfigbdySA8La0NMiUDaBzoBXYlv7VXmhHw42IC/l6acKcFMHKEA
	 VVtqDjNPcxW0l1lXd6nu82QV5zQAF9vO1z/XJ8HgSx/nDdhx+4rLVCS4U0xE5XOKn33Ge
	 FWe2q08EQPli4BcMaJSjJwY2CVPSMx40fx26S7064rO/TOMQvsOoXORkTARLGFUboYxiv
	 zSrzqGVlfAhQkxjBbWwW7vobcTH8i6DpGOcxBsOhnY3OOzOCA42WtSeLk6b8jsA54Obs9
	 j0iin+qkvsGE86fA92VkCpPV2FKuaEPiJ3RMqt7BU8pK+CjoHPo/NEPnvUmUhn1Sx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YM1fIXsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVbBeqJF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28EA606BA4C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 17:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28EA606BA4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YM1fIXsQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVbBeqJF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZNFA2822622
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 17:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfA
	BJXvuDxM=; b=YM1fIXsQXx82XBg2AG+dABRQhyW/baFIWRBVH7e33pslxCDlcuW
	LYx02RknLm2L2PPMYjc4RCsGyvFLAAUGnmrJEunmOVFcCpAiLQKHVnOsJJYZBVQx
	Nj1uIdNC/HS20LrTmGXstZXGVIFPbmkOC8o6NzUnphE4vB6gyyIIt/rIc1avhtyB
	F8V8VlvKA5JAuMrKInpR6eiRKmCUv/1FpBF+QMmkjMrRv8A7PCmtbjadzmSNQn3T
	T6heZBzihkBwklXC26QU8fvbgn/pT/BVPZZpmAYOh4nitbCKIJJmzgzQJIe+NC3A
	DKtxe7loiY8QBVs+7MAuRB7qsA9GGQ6wSBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4jx7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 17:20:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso3047163b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640006; x=1794244806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfABJXvuDxM=;
        b=KVbBeqJFi9WYqCQ1ogQ4erGP24DDubeCp3941Tjfzq+HnTOOF0VbRt5R/nxjrSMSX7
         KSJPOvMrGweRu4oz7FdLOu073Td53mXmwXidQYgI+Yyu3KlxzIfKwLMlNEaFU2bTP1qq
         BIqyOC5VhSls/sSTH9PkY9WGr8MXFBsQCumFk3bhADNLGc2nOW9agt6Wx1tG6ZJr50IE
         KSet3/AQTzAl51XAAMOBZpo3azn2x5hn4O7ULWBwG3VwM41iWEmi6089URPVJiehfNBI
         zd1AlyYfsEBf9Rfyf9CK9Mf03F9MZlcwGpswlRB0jUnpijZsRKc3enMObj96UDzzvgTG
         YFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640006; x=1794244806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbhUry8uTNTmLHMoCjcua8VR18xywygNgfABJXvuDxM=;
        b=cvgyjBhiZzqzTTvH0qV1nnEfH8HzpdFA9hBgUq+AbCaJp+R3e5XFzEG8hILvCJ+1py
         ScMLxeJnSpuf3jrSCOgqvIIQOCct65aMyG8ht0yfWrqDYPrySyHQP7gy6zejn+p1cPPC
         pNl+tWqjQJidTlwcP9kCKO89LM4OIPvqhB9HfcH7QO4n2xGyamxNUVH4Q4OsbdmInd9a
         B4ImGBHddUPbG28+ejx2pOGzFFgOhxncwnJXKt388meDlKCEJOh2EtR1vpp7898Qzn8w
         9Zg/D6MhoOkn03hV0qkIgS9EVlUrEX3Lf1VbF4qeMORGW5IiN7wb0ubF5E+nF3+8XJ72
         CTaA==
X-Gm-Message-State: APuU4Z8riUWK8WvxfHVZ3ZbHQz4wfie5hpcQkCIVJuujUJCMMB6PIrhj
	piQQEXwrW2MPxSWU3eblaCgcb6t+jgdCeR/Lb6dyviCDH2CKmNxnlK4gtUoSYsP7I6FjGXD/WTT
	EnbRWVnuZdY/8mYFIgkt5GwGBMF4HNc19QTrsZLTZ05G9wr9Kpws3YB/FS95LbM82O2ts
X-Gm-Gg: AYBFou17dIhwJUpIxar/sMUYatntgH5Oesbx78e7vEb2Mqes9ZF98xrBQzOjIs/UgxP
	3qPhZbE6u54+miscWHtJWE9Clfo/Zp5xe+d8HDLWz8a6en4nlrFbUsbVorxm8TpePPhpZlPkRbX
	1QGJhrB4scBFaaQ+ldy6UWmjTgYA8GRnx24wvQQhbZPzQWLQulHvhP56jLObBt51jZJbgTFChAw
	M5EEBl1ppIWGu0vtxEEW6DQYeutDUe8dFx3Yo22+xfUL15EUYJTy1xWUBfpTt/p6XDX3XIwpsM0
	r99RueuGce1fXbTeHAzYyxIHkJ390sH0QLYAYp41pCxZhkOz401gsiyIll6YCdiucCXrcjSlfpf
	jT5cRRIDreF3d5LamgjMGTxd4E6ID2sIqt3bqAiXiSyskaNTzPEsVDywlGzcWxTZ6vK7Il7n39B
	CANrBiG+cQAlhTTScgCYkNww==
X-Received: by 2002:a05:6a00:b50:b0:89f:3447:2dd9 with SMTP id d2e1a72fcca58-8a8324b1a38mr8158935b3a.29.1793640006304;
        Mon, 02 Nov 2026 09:20:06 -0800 (PST)
X-Received: by 2002:a05:6a00:b50:b0:89f:3447:2dd9 with SMTP id d2e1a72fcca58-8a8324b1a38mr8158913b3a.29.1793640005686;
        Mon, 02 Nov 2026 09:20:05 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aab57sm2209733b3a.46.2026.11.02.09.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:05 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 0/4] drm/msm/gem: A couple VM_BIND fixes
Date: Mon,  2 Nov 2026 09:19:56 -0800
Message-ID: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: M7P2ho8utTUpc4JUpbLzTqf2O-EJFC7h
X-Proofpoint-GUID: M7P2ho8utTUpc4JUpbLzTqf2O-EJFC7h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXybaIngcq8c1w
 mDqsa9Bim3j4sTgaTII4UcbNTytSKTh7Ke1bcTKYxZfMD1E/Hpw//MUc3ok50im9gfaiL82LVtl
 DHZt972HjHlHQ4DlSyqNM/tvcj5th1Y=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8c647 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vDWxNTotJWpNCD247a0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX3kt3scyFIGUe
 FznkjpemHOuf79ZHtCbyka93Ggx4cu+ueRHZVKpm1HrMj+sqfyIPzitbImNeJaYdwFHwKy4JpUc
 qp0I7/IiBC/LAW0H8SQkyfnLpXcHEZqkySmMCsR4QB4Ul2W29W6vwsHWVGdZcKlgKInIdb0DIO0
 eit3qIHeWosUHTT/XcFQroV6hFYEb4iPkSkQuWc2bkFi8mmqcAP1FhgIfP6niS0jos4EIoHWTiX
 weKegAw0Oj6EiwI47UoXjxKUt2Rho3iIeAyfpTgneBwhtniiDNrvvTrzNURyu9BaZh74IU8mbwg
 6Q8QO6airX5PEb1z31S8GaUT/6ti4pSFt3PpJjqI64WlSt83KLFGCVP461a4I9TWmfTaXxsA7G6
 aUQSDyAKs+hfutnuYelelooEDFus7Owrjf3Lk2h9dTXL9ePM1TgjIli4S6u0yer5APzPXjXt1+j
 lq1Y0x1sdjs2ggzaSRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

Fix possible overflow in range check, and disallow passing BOs table to
GEM_SUBMIT for VM_BIND contexts.

v3:
- Also disallow range==0
- Add patch to clear stale nr_ops in lookup_ops error path
- Link to v2: https://lore.kernel.org/all/20261102161002.497152-1-robin.clark@oss.qualcomm.com/

v2:
- Also check that range/obj_offset are not greater than SIZE_MAX.  It
  doesn't matter currently, but would if an armv7 system ever added
  support for per-process pgtables and VM_BIND.
- Add patch to fix handle-dereference in idr_find() error path
- Link to v1: https://lore.kernel.org/all/20261101174911.25184-1-robin.clark@oss.qualcomm.com/

Rob Clark (4):
  drm/msm/gem: Fix VM_BIND range check
  drm/msm/gem: Disallow nr_bos for VM_BIND contexts
  drm/msm/gem: Decrement loop idx if handle lookup fails
  drm/msm/gem: Clear nr_ops in lookup_ops() failure path

 drivers/gpu/drm/msm/msm_gem_submit.c |  5 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 11 +++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.56.0

