Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749030;
	b=h4y29JWHID0SPa6Y/i67Befj1DCYXcQ9tnDE9zV21p3IlBsjhpr3YK3/JXrY43tiyKMe
	 P7i2Ts8Rww3Tbh6Eh4nUBnRazlJOn2zzi7vY1SlLbT9CsCASXORhZsLIkC5joxmRc+pA6
	 G4MMUp9hrVUEC2pTYtBIkdNVDFuuosTz6hxmMm/Pk4RqAE75CyYB2EXS8Rvmep49FtUaE
	 mo11QIH3f7ZXnjGSbkNO7BcqoSvOYM70M7sLGv6Ll3vXBxtyRS/Sj2A2Cm+4WRiNFH85X
	 TT6GdmZxvywN4WpAcZQ/MeYz/omeFIxsfAUDo/bmgOzFdlx4CYgG1pIMP4Y/QcGb+ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h34ihJrcJQdSch0S0ZuU1rvUuEaTWSNGZoGhzEwU1SY=;
	b=kNw0KFxucPRV4BuXupNXFC31bfHGskwHUQUXjB6vkhPiVM5NNHWMKXGjMjOCyO7Doigh
	 NcNr3Q7RaRiFf/FhjOSBYlB6VjspeoR5JAJ+LwjTsGDqrXp2bI8BPpB5chrscjUTI5xp9
	 xTEFLWctBEnr73JNDpxpjFodaqM8pFCE9/NOvmVPQ2g2rZoZbvbpTxBlC66f2ZoOWjsvv
	 adBSnYfM58NNW3BGMWlFNbzwnsEUH3tvRnSOg8lzNWYXHw4GJ6EKHzKo4lsyPoSYfYuW/
	 PV0StmzW7XCIfg5+K7ZSpOv4NqXn/ENkQnsV+AiXHlS1W4Pc1kCt4m20zTpOYwbN67g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCExSbFc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i5QZe/xd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF6606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AF6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCExSbFc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i5QZe/xd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR2D5u0269665
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h34ihJrcJQdSch0S0ZuU1r
	vUuEaTWSNGZoGhzEwU1SY=; b=LCExSbFcOl73pGeAq0gcVKHN1QhDQWX2+ppknj
	8im4cHGABi/zyDzuR54HGOOj6v55NdDaTcUNc0Yadvqst+i5LGmNX9bg8vOipQcA
	lT8UopuRlnrObvpbja3Lb29a/YMba/O6toFLiNdn6Lo1LbSxXkRwZxcv+DHdEBMq
	EjooCVp3vjfGLYa//NMh8UW3SRwQl3bcLnEi/F5NA0dC8j9GLNC6hgIe++fRtxI4
	d+7BH6D3kje9Fbg3ws62CfY2LeUgG9NAgNaCIek1y0rjthRTPxolO5nwBJwlop3P
	oa6bNwsZ2RHqV8GnVWKBzsg1wvF/FCW51FYpPY3qqOeLlQcw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru38ukw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:10:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0592d4539so8369687b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749026; x=1796353826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h34ihJrcJQdSch0S0ZuU1rvUuEaTWSNGZoGhzEwU1SY=;
        b=i5QZe/xdTZnpa0Dm3zTvQ1sVkL3PBkuIPHc0bKvjvTQQ/6LMthJC/9936rnaZE4SEB
         XcXNyz+x0Pdm3gCHybXVWDeu6w3p1pd7pdJn+pPTCD6xn3PS3DjSJhMKncvx0DkMFSke
         u3HKI4eGbY91eZZ8jWdg8jHYof68+gFoxwBZwg/D3GS8y17ErVnn6kfs1vly3lE0pLWJ
         ajNGNs23vLLgdNFzCWI90iWgWmsVIHaFddoBK0B1rPaiuShnx03rto3E0n3GGLdnhae2
         4fBfpafm+iXq/6UcbHbC84Tr5wcQXAD0BIbHstQqFquENSRvHArBxyeXXbOSu6bjRHOi
         4OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749026; x=1796353826;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h34ihJrcJQdSch0S0ZuU1rvUuEaTWSNGZoGhzEwU1SY=;
        b=z58+n6+41CTanl+QqYeezfc3lf+IjBCq7gyk8q7S+7KSWcqO/WrOJ6gYfvAgSS+X+s
         0xJIXtwwBSZkNNzlCcg9j9x278/ptTqV4pj+hv9jJlDxTJdMTMN8c4XWBFiaBCPS1/1N
         fBySe2ck4b2/4lxSn0at/2MRFx4eqblwna1vkqKRizBt6K+sunyPCb43zDGy7LO2n+gQ
         09DkOekUPZZ6Hdrnscho8Aw9IXsi58JjlFHJTGVqyq1m4n7z9CaTlLyjrOBEPs6WgMUv
         zVyWTJ3GmR/WgJgHrtglYz8GHvfoT5ohhsiGvcYcD7UoKgBfE2Q0Ns2e4sfUcs91xh1q
         ThIg==
X-Gm-Message-State: APuU4Z8eqzUGZm+KN7OM0POSIg8ekitpGpG2bnMgoPsIHr/FpdxTX65b
	3w404oIu03m5GQHTYeQrho2bGKAbHwjN9V4qQkQJrS4b+2TaGEcTJxdBsJ2aFDgUtJ4CRq7XpQF
	rAN+YroWzQPusveXl/yoHP3b/VyW1k5InRGBJM2/dSOCoJ1b147qpooUB7Q/dPE+22HLZ
X-Gm-Gg: AZFdTZfk3SC4kwTRVxnF3jsqmREQrBLAPUwEbGEjNP4Y4KxG7P0ffW94Bzt7b3oChl1
	M7kyD3/LYi+kuijjpieWFaaPUkB39dZ1Q/3smyXlvuOWUZlzViTRnLYyv5FTmUVPyTu05/RKU0m
	LrscyZ4EXq6NlafF5OT4wrMeUzzbTRrbQoohhtdorAL8jGDBJ/qmrE0yNC8n2rOZykGk/NSYhNM
	W0yiJBB/RmcFyGqF0UJOB0wKHQog/wEEqlcQrF1cWmjTPs4jRUdGkx5GGYzgUtZGtqnkEOR1y4o
	8LvdF47ggQ09atqfSYq3RPRi2WCmD2kF417FGa7lfMIHArr8J2DznEC4zkI6z6i4b+HsK4b+Bqg
	dFRxmUu8S/RRxCzcX33xLRkDCGdPYl0MHdb5glogbwyqoKnaEM1B4z/SgCr6SwDeiH8BmZW9v8M
	NUmzQbikebDBEsLK8HPANXo4wO7FhpAwTXgJs=
X-Received: by 2002:a05:6a00:1c95:b0:89e:a661:ef5e with SMTP id d2e1a72fcca58-8c87d805b41mr21337287b3a.55.1795749026200;
        Thu, 26 Nov 2026 19:10:26 -0800 (PST)
X-Received: by 2002:a05:6a00:1c95:b0:89e:a661:ef5e with SMTP id d2e1a72fcca58-8c87d805b41mr21337268b3a.55.1795749025670;
        Thu, 26 Nov 2026 19:10:25 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm12157354b3a.36.2026.11.26.19.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:10:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add ETM devices for multiple QCOM platforms
Date: Fri, 27 Nov 2026 11:10:07 +0800
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJD0CGsC/52NQQ6CMBBFr0K6dkg7AkFX3sOwqGWQJq2FTiEaw
 t2tHMHNT97Pz3+bYIqWWFyLTURaLdvwyoCnQphRv54Ets8sUGIjL4ig+x4oeejz2BDDECL4xSU
 7OYLZBA+T0ym3nsGopn4oU1WtHER+nCIN9n3Y7l3m0XIK8XPIV/Vr//OsCiQY1K05I9Ya6RaYy
 3nRLu98mUN0+75/AeCNJwPtAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749021; l=2605;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=UVFjotaZWMoOAdRcuNdctuL+8I9//QN+ZYO0waZTm+k=;
 b=4mmkOe8J2nYStp0WHdNldPiIWnDo/BBpr66WlvT3ypRi5YOHwkSeLJ6EeV9js1LJy907yqem2
 b7VgC8+b/QSBeLC/JgbbUk8FNm4WfGi+5CCuEpaoybk5xj46/vqFBel
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b08f4a3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tbj8vgc1392yZJlBOO4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: dAfrsGnPQBaMIzKYG3YQGpeUUAiMlGvl
X-Proofpoint-ORIG-GUID: dAfrsGnPQBaMIzKYG3YQGpeUUAiMlGvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfX4dUmvSaqqzE2
 ubRKPahXaeydWLnLZZK3QhgJxNdwv/y++y+e72IT1EY3fHRTNc1SaYHaRhSvg/R7Kc0lQYXEZan
 XeP0niilGUDZeF3HTNvAvM8eMvBRYxdjHlAPMmjUaFzjINrh5gk1bSMMyUeomsedKU+CVGWkAju
 mKT3I5n7AIoYKJZ3SFd5LWiayIwnsprNCotZYp9SSycUjFVw6VTFEJDfaEFIQ9SXsG0iWtTgl27
 N44GHioIe8GEuXqBGmaslleTL+Ryel/HbgB7ayIGPeTcGbXJmcz1qcz0LWgWWqoKvvEuW/V48rK
 L410TWUTnj3SdlU0jZwCxiqwG+YfiXwGcnMPIgwQnscE62zRcVMaa6FiceCbLCTPmJDckzKQLo1
 76Ykerqjl03nLyCppnZ3EB+Gg2VIl21B8a2NIbaWrGJsSGAILVqqvP76KaDXA1eSe6lAppfek4U
 4jn7z/mQ7E4G/YYQEqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfX6iQoEn4uDeUq
 a7OmADWlN0rgPu7aiTruVaSbNJBF24AS+XYwYeAu5LY2WRBNb27Im3i9KUc6rKTzMwkOr2mMjs2
 ZAY4ROkp+486MgqbhOzbqmheC5YpLUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270012

This series adds CoreSight nodes for the APSS debug block on multiple
QCOM platform, covering ETM, replicator, funnel and TMC ETF devices,
to enable ETM trace on the CPU cores.

The replicator, funnel and TMC ETF nodes in this block sit on the CPU
cluster power rail rather than on a dedicated always-on rail, so they
need a power-domains property pointing at the corresponding CPU cluster
genpd. Exercising this property correctly depends on one related fix
that is in flight:

- coresight: handle runtime PM resume failures
  https://lore.kernel.org/all/20261116-b4-coresight-runtime-pm-failures-v2-1-cc437170e24e@qti.qualcomm.com/
  Without this fix, CoreSight ignores runtime PM resume errors and
  continues to access registers on an unpowered device, which is
  exactly what can happen while a CPU PM domain is being woken up.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20261126.
- kaanapali: use cluster0_pd/cluster1_pd following the cluster power
  domain split (Konrad).
- kaanapali: drop the planned qcom,skip-power-up for ETE nodes; the ETE
  binding does not allow it and the driver already skips the power-up
  check for system-register based trace units.
- purwa/mahua: delete the whole APSS funnel port@2 rather than only its
  endpoint, avoiding an empty port node.
- glymur: also delete the cluster0 ETM/CoreSight nodes on Kalambo, which
  is derived from Mahua without the first CPU cluster.
- Link to v1: https://lore.kernel.org/r/20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com

---
Jie Gan (4):
      arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: sm8750: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: kaanapali: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: glymur: Add CoreSight nodes for APSS debug block

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 1184 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi     |  884 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi |  567 +++++++++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi   |   16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/purwa.dtsi     |   12 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi    |  599 ++++++++++++++++
 7 files changed, 3278 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20260922-add-etm-devices-for-multiple-qcom-platforms-c165b1c4480f

Best regards,
-- 
Jie Gan <jiegan@qti.qualcomm.com>

