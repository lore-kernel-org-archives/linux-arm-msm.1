Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769343;
	b=r7dS0WHJEeccPmZT9D2+4qEGWeQzkgxpGIvh4WGsBDpbfVRiIHQ1awzchTJ99Yg9lIB0
	 3WCzawYmWNZsld/ydanvkaK9gRzi9jlPUItoygesIRXjZexY05WrrhHhp3jBx9zvOeyAo
	 WY/PlUckNJ7F5EKBc8GT0tJ3G/XHwXFdEqIhP9toTfgg8IAgxsITOYZmjFSYcMgXIVbXf
	 vLnEFRkGlrmPs3wX7U/z/RBRdJiq+kIEra8I8LRnvCdAZruBWgXNOzroa+mo2/cE8UL18
	 SKRLT+nYB82K5UWxZFiCkYPqDbb2e7Q/Kt78zJSex9KTuMeq8/4mm+geN5blfLUpwlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
	b=mOrACR3UeqYfC7Io9FG3uKnLxiVKAMmshp6G2ReOVA2DRgNKx8IcFsMdb/GvDS85cNUU
	 cSU/WfEur4nZ5pRlOuxic/T5qxMEvgSXRVM5b9SQl6yyxvvnfLdrtfuCmREpIB/R4+XCp
	 Szg/79qQAGxjD6uqGNeXg28rXZr7exOLbmTqZPAbgea8yzpIGT5snIG/MuIPa4Ey4TtUG
	 rxxprlgR1K5GLueeV+3XOJXEahaQIlRbAgHUgXBaq9ND6UahEOs7GNlluZRtDqfrj8Ypg
	 4r87I85rp8KWZTnl7bv7vCM0kTMhiXuzzm0UWrYgGewqnGKVvEOT0A3vjjjRrSsulRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhnHfL2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw7AZBT+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2B606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhnHfL2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw7AZBT+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6AtZ2974538
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNz
	uJGH0AN8=; b=JhnHfL2nHvO6BuDO0sx98eXVhu8tGhjfjOpd0VX+YkZspKdg9Jd
	stTytPtrQau4EUhS42KwmDNGi9ePlORhPKoOUtXvONEJLjhQgDVtGucSvOJfiksu
	1LCc9OHx8MXljBFQTDn/M5zF8M57G7DEhmkfH+/lbDGGl+VTxRV51gW3I23a6i5E
	YN1s7OwBIj7+GKUn5q06AUnV2UaZlPZ9Yv0s/hjieEPf9mxbmToiXfeUWo9yktI1
	Z5LpQqzSrgw/+d+Xp9PoJSiqDPKYTmde03JRUuxDhebW8f2rPSIEqphgbzOkH8t6
	kKGDc5fHVcxvAwCT76piPW1dVdPPnD/RAZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4swb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b92acedd9so32102176d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769341; x=1793374141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
        b=Sw7AZBT+vOPGeHFrROqofYxcBg/1V/U84eesQRpnoNqHAozAoa4lex+Mv4x9y5a4ES
         Yah7jQjqKmP6SRbsnJNR0nu26Xdo6yWb5g/9Uh+/rP1EKy1RdBjHxc3j9zS9qRLXSUyN
         QKcDbdNvJnWgIV6S0aorwxQZ+b8VwtEx1G06WqqLNbpVseADlgPa0TohFzqDZD23E1M7
         XZ5FgQCdarRYa/CF76tH1pdRZ9FPhWOw927g/KUdQRip4U3YwjHkzZs56lZ7/Xr8mn+Y
         Vm77F5kdfX1J1r0TEqmExOLiFAUIZCsAt0tnVbZwxtuVOtzrpD8bruwBIVvKR9+dIU7m
         r+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769341; x=1793374141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
        b=mhVrqr5CfFRmkiIgD+V8kly59Bg2zN2lESga/xOjJ2UC03V64BKGmo6SAD6bZ8pT5L
         cOhqrT0UkB45LmiR/chnWK1Fm59o9QkNku1QXfZX8TqXQAx6XhBrGO7ihtKqIwLVHzK7
         u/nGaYxg2VBeiI6KQQdlUAGrvmpXUL/uB9iys6IFHtSiZF5vZMNUnfFt7TDulxcPLlZ0
         wtUcqjqRlN6d4b1FEEKfAbruq+EoqJWHENkMHgx91N5shRTsncnQ3M7TBHlnn+gTMvwT
         na2iCPuiJUrBvFEHynpN6zUD3H7EPzxNWMqnl3KduO5wcs0psBSo+LOo8qCrucKtNufZ
         zlog==
X-Forwarded-Encrypted: i=1; AKwUvBxOKW5i9PgBbo76P/iOHm1t/JERD849KODv+28FPYB5+BRfutQ2nkMfaENvsbgCJ2pR3djIZuI9JGvmH2fr@vger.kernel.org
X-Gm-Message-State: AFq9FYJEaAku033TDwHNlV1ynR/Qbubbt8jBnBdzphuYL5yqNOFyIN3+
	sSg+puhkn5bg6uW/jBCzswladNwUSNj0Zm0CIB8fWUwx7MOk5Z/O4jULfubnpDZfZukYY9dcCwz
	dOPDkZR80PTNngS1icFPPy1Hhe9ognAzL/y7vIa9SduAxykH6a0XMKIlPgIMHbTUqmI1R
X-Gm-Gg: AYBFou3qa8mVyT78eF3E7VW4/DdyfMaRFjnOZBVJSVmLgExWqv/YA+nEvIO0jHlPYU+
	ATAiHzdhao3IndIrb00XCJWDYN3peAXK2ioKhrw86LmfpZfs1PxtwDwTcH44AmqQsyARobGsV+j
	rSymKl/dvXu0qrzav/5wqxFo5xjjJhuXe+9MchFvXINkFylNZDl8Pa777Wcx2VstvasaCJajh8o
	bU4KeMeWe76AJ8Y9T8s8WbpcW7Jnrj8gMZvYfG3ltavv2pVrNX0fj/xWRDv5bEa2lyaAkP9Ane0
	HLtcSDTGJ3MZoh3pPKXasQDRgTsxZTKjsoUz5rbzq8gzAp8rhkNliALdua+GGqduRPlBrZxjh/h
	1U+nIwlERo54SnTL715J2lgjy
X-Received: by 2002:a05:620a:261e:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f6f58ded3mr466610285a.12.1792769341465;
        Fri, 23 Oct 2026 08:29:01 -0700 (PDT)
X-Received: by 2002:a05:620a:261e:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f6f58ded3mr466606385a.12.1792769340969;
        Fri, 23 Oct 2026 08:29:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:28:59 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
Date: Fri, 23 Oct 2026 18:28:53 +0300
Message-Id: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: gv5qB7AUPFN9q-J2TlJ7N4kN9pDFRjrs
X-Proofpoint-ORIG-GUID: gv5qB7AUPFN9q-J2TlJ7N4kN9pDFRjrs
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb7d3e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=zMOfFELr6_fzUAOyo_gA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX2lH5s7dF+lBG
 QEvpfYEZ9Q/N5DEc+nD83OAjIq+dDKh8wv6Da2AMZ0E8RDMUhrh1uOnlEqTgxakSmj7H3JIjnRh
 59krYLStj+9o4nm2zCt0cM1WJylKBqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX1gzkIim7Ppn3
 oJ9xPjop8AFM6/pXoN+Hc1KTc7RzolrUQheKZdKDKRN4iSvOgSNGyvs7CeqWl5e3JyiqhXd3iPl
 ZvPvphiygKLHDzEoJoAvBm/+4XgNDYULiFFGnJGJ2rS9AGOm7mprIyCL6c/ujhkZ5EJDaRvFzKk
 xqpQE0+kWmfI1bYg0Er+afxst6g4hiasxgWpHrzK5bjaqZnAVDtV01HZIC20N+jwQaaGbijoK5l
 ManX7k0do1nttC5aKkpLW5MHmky2vWBFeLVcw/GRW8a1a9eiwhL7nmqT0CpMSlFpIAp6I4NP6y0
 mGWzQHZ+zL1IzMLvc48RUe2Vhd3agF78A/cbwfIy12Laa7q5AXvBNxgrLJ4ninCrsBcrwNdKwVL
 XslhyYpX18S7jQKOGRPAW2GyFLHP3qZdQ+ODk5q6FCHtbwLtomHQd0bzr08NGgb8B35pjYud2Os
 QC3r+7xMogdj9XYzR0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock source, and all four VFEs share the camera NoC AXI
source. Each VFE sets such a source to its own rate, so the last VFE to
power on wins and can lower the rate under a VFE that is still running.
The CSID also sets the VFE core clocks to their lowest level when it
powers on after the VFE, and nothing sets the camera NoC AXI rate, so
the camera NoC runs from XO and two concurrent streams stall.

This series lets the VFE own its clock rates and aggregates the shared
sources within CAMSS:

- Patch 1 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 2 stops the CSID from setting the VFE core clock rates.
- Patch 3 groups the VFE clocks by clock source, so that a shared
  source runs at the highest rate requested by the running VFEs. It is
  enabled per SoC, so far only on SM8250, and also lets the VFE set the
  AREG clock rate.
- Patch 4 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
use the same shared clock sources are not covered and are left to a
separate change.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, the shared sources stay at the highest requested rate while
another VFE runs, dedicated clocks drop to XO on power off, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming, without
the concurrent capture stalls seen before the series.

Atanas Filipov (4):
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c |  32 ++-
 drivers/media/platform/qcom/camss/camss.c     | 211 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 224 insertions(+), 32 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

