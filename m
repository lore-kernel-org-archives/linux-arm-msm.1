Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773405;
	b=y6k4zJNTnA0ce+s5pzfDuKzcNgsKxC3CUtDo8o5/2z4xaoesHp+UP3M/uv2EAxUr4vaX
	 9ITHrNgK/fGCMGnIw6nklfcGIJWO44m6qb4PkqYnAszmuhjpw5OD1hlW2G3w9U6V5qyjp
	 35Cy8WyUXGHJn3W+0eILiAAZj9av946ZhP3BKjCIix3MU2/DTkyyS5Phhz7U0JtZrX/gj
	 vCNrVV9rYxOoyPze+aMQHt8Jbg//M1eDe7cSu3kE643snCzPc1qJHdHnAQtMLqqccl9OQ
	 3AEK+GB9VxpubHTD3YPSWCZzPcPlIWwzmZL302rw7AV9wRHc+9ZbZ4kvxqBJ0inSU+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rOAEHEPzGPKwtDLIIlA2UTDlVpnV1QKTrGiX5W8rsYg=;
	b=AACfZYW5T2PXiBP2QUI3tZIKQ80a8beWVpaqt8Y4xj/0BK7+GyFNmgixcJr6jYf8dOzj
	 JMo+s6na8Q5iiGJCyeI8CxM003WP3+E01T5uya2tBxGNVYHxmreE9d0SOqTq1tU7WoOmG
	 Jg5g8Gap5P9VasHLRbpAUJI298g6NAyC6T5gZAqTDkT3AjK2KKT8zei8KhvbTLHpC+3R8
	 ZyeDB5zvz0qTVUtmW3V8gRDioXp0VWSS4UvxyIs5x+/+K2XbeApO7CoQ0UTWASleDlxDx
	 aP3O1sTRVQo81V9boqXVDUKzs+Oeg8Kiefayy14m63qdRgsoCvfZ6NHlUNjp2yXsYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fg/3yELy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dK5USles;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED9F606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED9F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fg/3yELy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dK5USles
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GMSa1779885
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rOAEHEPzGPKwtDLIIlA2UT
	DlVpnV1QKTrGiX5W8rsYg=; b=fg/3yELyYacEvRINvuplTYIxEwVX4j4EF4UenE
	f4FY39jzeqWtshjVia0i9uoGDEchuG8u799JuQ+/7wW+FqNGB9mw4eZlXs1uKAVj
	5CdjaYUGufgGc2GEjplaE94HSYTHyWrNYw3H92YmVdZJeFMuQdGiC5ywWD0kQm3i
	zB9ax5guZqTQJ3SpOX2Ci3nUPIcEssDkwztA+Ph7jA//yhOryvqkrx/oWdmIb0AM
	YolPw9Dv8FAf/f8HEgm82GRPDOPQSgJD72rH8gcyjKUa7jpzOW1k63PJUZ6cgQKG
	1PWK4ShRJQyDkNRN/hKYQHVb8Qbko1Mvt+SMCp1WyH1M7C8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhh1j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:56:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08904845so103769245ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773403; x=1796378203; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rOAEHEPzGPKwtDLIIlA2UTDlVpnV1QKTrGiX5W8rsYg=;
        b=dK5USlesl2K1udOfLbkwV76apBtCxWDEViNxLBNjF+6s26rPP3t8flW3SVBBbNiozP
         Mwlh9XNAQsD2jBbn/hV/3AYrcDCiYpePbhkW/zTn/GMzWBtItpbBtowwq2FrUbjhySYJ
         DVtSqGDhwD1ZWpQlTlch9VfqPnoTqyz0ah669NeAPj9dFNgWoZu6qmGJDXxA7sv3S8w/
         1u9aEQkBOeXUlELzdTmyrd+OWnRsP5tAHulTAsSQQkAPjmbEESo8hJC6fqUm+s1HXZYs
         ctwnP607cs40E5tF4ZlTYOWdi6pm//94qsmwCE7SuGcACajLzT1NAxWIRBZYU4rRMpbr
         dvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773403; x=1796378203;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOAEHEPzGPKwtDLIIlA2UTDlVpnV1QKTrGiX5W8rsYg=;
        b=nBcrS5ILQ+hGCdwlgB5dyAfaFbpif1Wwshn3xTXEVUYCXhuMfx7AVOI3DEFVZNsl3y
         rY5nOew6NCIOhe3s5fvB62z606vbtEFp7Xbu5Wj8I/8gP6bDjrx4MWyo+gU5F2OEbHiT
         EMXqaO+REuNylazjYQuP+PX2Mf/bwAmcntnQjodep4vcAz8sha3a4ZzNp2/4l0q8K+Qk
         51dA6sCyUEK0ZKjhGH6NgpumlkWS5n9w5wTZZZacdyjZktpFK572gNxSIQWAWZ3QM/sm
         2MD3UtuQo79v0kr8aFtfbCxB7cg1VdmsinAwXPae6/W2kRvzs7qv/B1ZT3xHEMkfhKQf
         9qjA==
X-Gm-Message-State: APuU4Z8XzvPoFDdUFVY7M42P8XS9RkaApPg3/QuX6ZHmCCMeqNIkVFZ0
	lM7UnQlhHPw8tc+2xFTaqi4RkQudrvBaC4X5C+skihCJGvzFYDkbiK+cY9XegGj8L7sVoY/9Oh7
	9dhhkjpkJU9b4locH8RYnY5yxzfFQhcrGIgPPbN9s6o4+VG/WBJZa1ikEkiWtJRP11TKl
X-Gm-Gg: AZFdTZepxrx+uVq8OoaoX5zvEH5a6jnPCPiZKK8TQ0hURj2B7a2Y4pAA1tU14ltuvcO
	cYdnsd0tZIambsObKUYTY5vzU5tQ/HZIGW24CQIMrdHPmwFZxWA4T+I2q7zirPSbcRS0bjjQXXc
	0M6nQoayErZfNyDE8YIa+JPkv0ZRPrgIdEWBSj7MFRMBoJR3BDL8o1q/KkeFuGGcufH7HXqwhHY
	tU5u5EtgJYbs5xK4i/PDdvR/1YRh9tiYRVDqDS0ZcZu/XMFSDlHEJiy95P5sEty6gseLpeWio9u
	SGV3McLE4KXVvlRluu8unU/WHRt+cL7G1OYDKNZZiukqW8JHeyDZ4MpdcHA+EqaXtTTMnsDI4z1
	0JqISeJGwZIJLcx/Ujubaqsctsm4TARYkgaMnk6uKlvHdmzTr63CUQLKICWk=
X-Received: by 2002:a17:902:e809:b0:2f0:5e4a:deeb with SMTP id d9443c01a7336-2f05e4ae14emr222003295ad.47.1795773403059;
        Fri, 27 Nov 2026 01:56:43 -0800 (PST)
X-Received: by 2002:a17:902:e809:b0:2f0:5e4a:deeb with SMTP id d9443c01a7336-2f05e4ae14emr222002995ad.47.1795773402558;
        Fri, 27 Nov 2026 01:56:42 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm118132255ad.75.2026.11.27.01.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:56:42 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Subject: [PATCH 0/2] misc: fastrpc: probe-time DSP capability query and
 unsigned ADSP node
Date: Fri, 27 Nov 2026 15:26:37 +0530
Message-Id: <20261127-master-v1-0-f998ec22497b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANVTCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNz3dzE4pLUIl3jNBMTUxNjCwszwzQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0ASWDIV2oAAAA=
X-Change-ID: 20261127-master-3f445438861f
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX0/JoPkoMKowJ
 CPzY1Rhr/XNBf9KiXTdufb08Bk70R18rYbTG/KAFSWAsoUmZz/1k/mWRB1yZztzVtnnuSb8libM
 H45aQ8LfgnI1rTnICVG0Ws/8Msp7RtA=
X-Proofpoint-ORIG-GUID: YLheNHramoykMk5h-xitUbRZMAYsmVvp
X-Proofpoint-GUID: YLheNHramoykMk5h-xitUbRZMAYsmVvp
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0953db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CXdNUMfnqeXUppiKwXAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfXwtc2uLVjxVVN
 m60CoLcKeOtpsPsR1dQkvBBt5ukvgJ944W9ZxmAA30x11kNnoEJWFFRfJx1yJavvSJJLv71U5wk
 NN+SC8/UG2i0kyJdpwUvE8AaRzbZDh7+dwbACT0hBIW3Ahm8964oMtRTq06mLchWUpTTdnnCo5K
 UXoS1uWXV29m+gDd0+ypFYZSGLr1lUnLKfC/lRnLZ3X3/QFcsYuJMqdgaeOIIeJw8nH8SH/G2ke
 SG9GgVPtWkXWskJJ9PsYpwDMTf3+rKEeaDyntReiHT28DihH2yWBJM3ZBtMiT+mChKMKgSf5cpX
 di22mxT7u74NmMmdED1kgeBYOEpJvQ+ueoTR3nBoKQfyHoOKYMgIgd4R2gFZHexMLAKYXFk4k9u
 Y7Q3B/NC9fnZwFkIOfDB1ihhtE/NDbvaLvDnhPRL0U5sv9YDl9oLveFFhcJ8PQL4N6sFFG75FJv
 qU4v15I4TMFe1BTqovA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039

This series moves FastRPC device node registration out of
fastrpc_rpmsg_probe() and into an asynchronous per-channel workqueue
that first queries the DSP for its capabilities, then registers the
device nodes based on what it finds. Probe no longer blocks on the
DSP responding.

With the DSP capabilities known before nodes are registered, the
series also starts creating an additional unsigned PD device node
for an ADSP domain whose firmware image reports itself as
compute-capable, matching the existing CDSP/GDSP behaviour, instead
of only ever exposing the signed node for ADSP.

Patch 1 does the probe-time refactor (capability query, async device
registration, and the locking changes in fastrpc_device_open()/
fastrpc_rpmsg_remove() needed to keep that safe against SSR/remove()
races). Patch 2 adds the unsigned node for compute-capable ADSP on
top of it.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Anandu Krishnan E (2):
      misc: fastrpc: query the dsp capabilities during probe time
      misc: fastrpc: expose unsigned PD node for compute-capable ADSP

 drivers/misc/fastrpc.c | 338 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 285 insertions(+), 53 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-master-3f445438861f

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

