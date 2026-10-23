Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746200;
	b=kSYHmmNAQF/rOel7fxcIUBQhbWfKB5jpxHVrnpSoQ60Uv+lyTr5XcARs4+68mQKa1nGp
	 mrvLlXh1Pkm3oZj1rpn+RulbqugT1PQNzQ59Y8hBP2xuWp7zF28VjSLxKjQqh9YfPg8b4
	 VOnoBmqspN1cK7QkDx0jioGUaUkGILcYPa1/mQcc4Zcmwpdaqml1Nw4lTrqzGnbwZIxRf
	 eyTPgWauiRJsAoWr7lzH6W+BLHQ+VlE/gc4i57CLjIIYYthWQTvjfS0nquq9PjKdSgrqt
	 MeplEv0cxZon3lmW5m8CdNJ5Z0QE7ivxhNGoIaedc6Ix479seih7S1bNRI6j7qeHMIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVeOTpt+v/Q=;
	b=rMttRca3M8/v/Z685Ftkh1Yw2D6Z/9LhbuSd6MwoDz7fHUs4rV2cKclAkqQpbtKtV9EV
	 IgzlkO8jBikvzEp8UIQw4INp5mRkhYpTHm024Ab5uQVrvvVX1ntnN8YObUvbsV2g1JkEo
	 g5pWZomzb0+6pNltROcyaJpf69VOeoDsvzsGFpAXBenNf3LnuXWxnCCUOk3xoZ9h2yZe4
	 FOTnlyZ6vLhSyStz+1aeTuYlJDws2fENAeUSuS8XZ8+aVpSSRwZ/52oP7R8NpEmch5XQi
	 zYS/UhMhtdbn6GzswdZiqG/fN/pYGqVy30RxiTI90LeIBcubTK7v00SiFcZM51QAZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmkeYydD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGTJfoPi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C6606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmkeYydD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGTJfoPi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FNI12572534
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVe
	OTpt+v/Q=; b=SmkeYydD58pSevZvjyec2CUU2pp7BfKjHtCYz8FL05LGbd2sPrw
	D0Frst/9UHWvtSLjJnvEd6cXnD1HsVxcIwLcyAKIHmht0FkL2ZIQmHJsMOS4r/tn
	2ZTkAMXKbexvU7eEYuEPVxk132ooHYS2+VmwSB7O9wHpvyLlKObMi57+CiiqMk/f
	gMZiR2+DZxqVnVxNmhCRegbYdx3Dyh4IGJFyOdAGqnj+33A5YTv97//HPrIRmmDb
	bY0ewtrehgJiyabNmvdDmXH+y9fL9d6iQl28pb6aLl/+r9GZ66IaVycL3MG6Lx51
	inNgbD+U62LkRt0tAnmX/VO2g0zmjgXO8FQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0kd9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso755069a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746197; x=1793350997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVeOTpt+v/Q=;
        b=hGTJfoPiPQ2EcIgXs9RKkF2VHo/EiTJAwOaimj5tpzdLlY6eOeO3Z0VKXBZBR9MNEP
         aSwtrdINu/+swuc0WuMPUuxhYNFuoeUonuF26X/sJbuj1YoNjGfq2HwUIdjCp2dLpepc
         s3DzBqKwm30iY2u60VUId3Wnfb4BzSwQA52PudIyZve9w7ussRwPGtWhveV9vt0Pch4U
         IMj+mhr50MWHtSdAV4j4mQ29w2fPNdljJIhM3wmKhZWm8JRMqtV/dkH72sG8KjWNdGDE
         H5p7+V5sFW6b+mnZ1U2f4rw6gCWlgnx9KsysdgS8Wnmchq5G6khkUywRvAr4AoPtJnSm
         Kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746197; x=1793350997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVeOTpt+v/Q=;
        b=Tp1xUkeeHaIdbhcfM8JU8GgbjSWqGzfnj5t3iEttIoAsAZPgCwCX5vIreLbapwYScI
         jB8S+a9JiEI0A9A4iceOL6g3js5TfvpGjCi5cXk6SnOxneiGZO/BQH7n3Vm++0jx5cta
         D88pgdW8LF6W2V2v+Nk5cmCryBjd7a1xMuEgslOcHDZXP+qyRBP+NjJ7yGTkD0V6zDKx
         qc3f5IFr0BgKtCdWgJinyI5eYidBlgQElWSdD6hRH2aikqJgMnbJI963dmMeOfXxfOAr
         PZtW2MzEqGLByeCA06ZX46StAQJFc3Z8oDE2Tj2XwoAoXmesFv+P1xhN74f85ivT8bb4
         79Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxqkr1QbbZ78cqH98GFeZskZpOn5OZKiBEpr0hEGrgO3ykzSp2ib5sJa3b3/4end1UDQ7c85aBYYdUm1aHl@vger.kernel.org
X-Gm-Message-State: AFq9FYK7td4wJQAqhqFjIKHUK3WxQhW+3r86CUxcfKTpJGz80AqYK7ZK
	zAjGYwu4C10EOpPMQ7s39kyY9eBXZjbGHNyXJY/GTakHxLgH2RW2Uye9KnBN+0qp/OiJven/37S
	eSJ2jFLEgXU3FmJmGhmwlBoKygWLU+kImaS5LfVSeIfdD2Ex6Ln9S6xLKTTjaSQY1urTaLhv2+y
	u6
X-Gm-Gg: AYBFou1hkRr+kzJDyxzpgt0X7oKOTSrp6SVpQmVGY+/xX6h0lqLz3lCz7pcYvbSWwS0
	prQpWzCwHrUwj+nPBEa45LS7fAkPiM41gAdjvmezefE5eKmKFtVcVpcTc25W5jQDkfXoj+jWqqm
	QQrCJtDjjXsAy3YsZRLk4XZkKwZNvN1zP/8CvYmindFjOuDSp4fsSbALQlLZluHgprEJa8HC+Vq
	uvibwFNVVVU62ZNJm1/C+RAWYV2EluTJlqHJYiCxsNROaTBcBH9y0IT/0sAAsCSrFHYCtrnxT+X
	7EvC0k5axSbgraD5IQIQrTfcnaFIBYfrIc4A9bJsY2mHFnd1u6IjtvyOZMi8Zbmxs1B3vkZLffJ
	hHaru819EndFI1FHHbcZVNa1PlTb8w5swDw==
X-Received: by 2002:a17:90b:3dc4:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adce0495f1mr1385874a91.32.1792746197391;
        Fri, 23 Oct 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc4:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adce0495f1mr1385839a91.32.1792746196810;
        Fri, 23 Oct 2026 02:03:16 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:16 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Subject: [PATCH v2 0/6] arm64: dts: qcom: Remove FastRPC compute CB9 entries 
Date: Fri, 23 Oct 2026 14:33:02 +0530
Message-Id: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: g7zLRhUyITnYb271SEercW1P5y78E6VX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXxIk0t4Pi7cHp
 +flXSi1fYPUq1fQ+DdMzk9EwByOJzJxU93zi0JN4OrNOYPAHFL/1Qy8MwZFnYOkm/CMUCGSKxSU
 o9FkQIg2Mb1m3vM/2CK3KE3zQ7HIEYPH8GP+M0kiDHjfrAMGd/AIAP2SUlz2jiVmYaN2fSbTNwy
 +gYFqXxrQ+nI6Ov71m6yfwXBpgVUx4owkIimhVp2tZGpJADfYjhwK3QD6YDUdM5ZOJEOPbsO6CS
 IG2zHO9Yd/75pFzJOv7aWi20YswONkq8chNfAU/+yTCq+0u3z4QeINFJyD7kO7IDSUKl6CWg1SS
 nppMBuKsuzPpFvXJqqNiqPr8j5rQ2LfVYlR04y8TfQ7W8mXHB5VWE7hyGAyuX+M+ABj4GbXyRC6
 4cQRXa/7BWs652wpiWPrMQkVEeJkgNKceE9G/w6CmSmkM5dtjqCuNhI83iSszt2I1XUkq5mLpwZ
 yWZHjt26fRx4NMZCrzg==
X-Proofpoint-GUID: g7zLRhUyITnYb271SEercW1P5y78E6VX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX3xCtBiQYr74R
 Z2KE3MrbnEksBTNielCxPb3W5WMMqpZ7WIozOWKG5KFHyJ9yZ/tPpRr2Mh72y0NIK+co1ytZ5cm
 LvKr7YioMLweDW1mjE+IEKX9Vzi8XyE=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb22d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FW0NidNlYbm5mj9sKN0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Context bank 9 (CB9) is reserved for secure use cases and must not be
exposed as a FastRPC compute context bank for non-secure offloading.

Several Qualcomm platform device trees currently define compute-cb@9
nodes, which allows non-secure clients to select a context bank that is
intended for secure use. Remove these CB9 entries from all affected
platforms to prevent unintended usage and align the device trees with
the intended security model.

This series removes the compute-cb@9 nodes from all affected Qualcomm
platform DTSI files.

Patch [v1]: https://lore.kernel.org/all/20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com/ 

Changes in v2:
- Split the changes from a single patch into a per-platform patch series.
- No functional changes.

Abhinav Parihar (6):
  arm64: dts: qcom: lemans: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: monaco: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: sc8280xp: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: sdm660: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: sdm630: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: msm8996: Remove FastRPC compute CB9 entry

 arch/arm64/boot/dts/qcom/lemans.dtsi   | 16 ----------------
 arch/arm64/boot/dts/qcom/monaco.dtsi   |  7 -------
 arch/arm64/boot/dts/qcom/msm8996.dtsi  |  6 ------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  6 ------
 arch/arm64/boot/dts/qcom/sdm630.dtsi   |  5 -----
 arch/arm64/boot/dts/qcom/sdm660.dtsi   |  6 ------
 6 files changed, 46 deletions(-)

-- 
2.34.1

