Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500134;
	b=f/LD35IT0NrIn6ZQHcv865+DKwkRA0iomp9SpeA4fOp/qyB3qhlBXtiKw5R4fb2DbvDE
	 RZ5P5w+qNzr+R59iVAST1+L8yWKv708jd2SZoLxhHAg+80sC+7xYYwmxIphh5p/xGT1BY
	 bPfaKEzjRzhUEcVZn6GZyWW7bMa9Ou5S0a3Enx2OH+yhfvcorIZH7a75NlqgBEZ/z2EIG
	 DGrbvv7X99v2W0h5gkAjpAvCuLDV8EWFys8WvAM36ymsr1wjIrPLHVCWJOTpIsv3+djtN
	 0IQ8TShDAmV2dZFN2645wx+cdfpmj0EI23T41ASbrgduuq2sIpuz2h0rvrQk+seApUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
	b=4iNje8H15VWKynmINZfaFB34vVkQfe5meqSZuY/39KO3GtpwPgOyPVBUj4m0rZiLVus1
	 LQprSRfzJa03TD20PXQ/0TuZ3wFmjjzLfnHf7mDCN0bu6vd40AZX0O5UJ36WnKuadoLXA
	 N507f9aYtvjBv8HBuIUPg6EASgFq8jA8Ul9GbGtOCFmNOwwQe1a91Dw4OZgFHCCKdTcO0
	 MLXSP75p6ZPOX9XAjZTWyvfkRAon/9PYZZrwDMMrxXKaFDopyc1k6RVIwzlV94G4odfCm
	 ts+eA1z8lRsCCMODKqwFEfwr5yKgKJws4E3rcn5Ncy1SO2IE7MASJ964pRInPwCkuEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J3R4a6ZM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FnnEetM+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207A0606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207A0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J3R4a6ZM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FnnEetM+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZnB81652571
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MoD3amaMD5SRK1apB8zScN
	P8aTosIbfh13l6OfNFYjY=; b=J3R4a6ZMj9y35oGr3vxJ0o7+JDRjkVzo3S2Byl
	QPwYQVtR0x8FBKbThceAZewe9LIIDjxxwrQdGiFfHws+9OZxBJxX6TuFmIpXvhJo
	u2k2s4wznKOj35Gpzrl4+dx8UDWvG/98h7dqYDvYBQlW9bPz6FpcyWgN9Ly6vXHO
	DC1xR6wt2/bmKPIXfqm9IfCLA6003FtXzmlx2nLzR46TJNMhKTmXVFhR5nhey2v0
	ure6+5PtmG4jozQNtcr3lBJDcalx77JtpbTjg9aX7fwWgqMzOCpO+SF0OqFqghB7
	CTeg6uda7adazv7ahD91KQTZx7SCCLn8tWCHgM8wZLghPjKQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc6481x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:15:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2ca2a4489so1030413137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500131; x=1795104931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
        b=FnnEetM+QMyLlM3+7aiK0NnoRzJ4dSSSJ/TO8sSt3YwzjBc3IpKmXsoYqAChcuL5IX
         qacLjbW7yLxgn5gro10EgIToeL80zWVmaNS2ICxMfPyIhjx2pxubkQbm+FlbuzPJYOwQ
         weybcXyw9zVylfnI3oG32qVGyQ0EkKbQP8oUe5JVrYCxlP39i3q/zy+KL9x2WCfiYjVb
         RUGS98rKp48Kj5frEM8sGUjL/ImXILAx++CvetMxybwOG5W7R9n2jaWJ/cy3Nyg9Lv7C
         GwrGnne5SJAL4Vm0Zs5Pl9rcH4e7A+lWpZdvoPU1qe0UTaOHrInPchzc4J7k69kVd/M0
         Ixew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500131; x=1795104931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
        b=168xoDZzx2zCygyaAa7Ex497hRY+FUIMBrbD2Wu411+POOry+skJn1NSUsq/+tPn9c
         2OVkBecvPSp02Sli463oX0o26h9AkdQa9NHkVpIuImzPs4ifAoqky99/ONFZz5+Suwtd
         nYNanYxNTg5knLkoyAyIVITtAkuNNkEH/8B3hhZVzGPimLh/AwN8eTRpDuwoEIyk5gZs
         a62oZ4hvmuEITVXc/1+beUypQT99Q4rPdJ2y5c/zuwOzeC4ekVoSPnWgd99J5PnZ8iQD
         FR0ZaE1k+u1bNOub8qAL+Y5+WwfSM/X9f+lUoE7Bl/qnPRw2FuHhwIVROXZsoKlrqAxi
         mOvg==
X-Forwarded-Encrypted: i=1; AL+hErHgjITOtskSZAg2WGhli35bmsppH0RVat+CgohsWTycIl2KBzaG4lif+NV77L+/+Ym61aMWF7W32qTXRgVr@vger.kernel.org
X-Gm-Message-State: APuU4Z9OWDQ+47F8b65sWGsJIZwl5Wy7Elq83rAvxwk6uWt4uo6Rs/vA
	oE13vw46K9fsDWSnH/bKZ0U5RbEP4Yfxqk8+F1NyDjENwSCnt/vnbcH1/7UxQdUdRM3R+3SGx98
	jNyRyUEzAdfedoe199BSqsmsqCf6DK5e7hoWZiq+k4W5DrGexnot1aHhcigHU0KzHY55p
X-Gm-Gg: AYBFou3Q4gKLXTiBwsKYM7B9+O7LdSKdjFV6LPDcLFqua3L2SQBGRHTM8nzw+z2GbYc
	Sq7zLw3PhUrqsv2LSB3cbjwvs6FUQj5UXxwg24RNp5pO90wFlwPtzerRD/szXtW3WHwPl0woCxX
	NYUlJpweM1nSSEakganSAVrGupki61y6b7Kwuk8LSEp+CaPafv8N13qbPOFCw/Cf7fM3kQBG/zX
	RnkyMcxnUWqKFHwPQv0kVEO1v1fZaxJ7nKqwEWB9odJihyYx6LL2ezD25L5YlkomKIBtAMhkhE+
	3Q1+F2Jl9PJFR0In2lp6wbvBfgUOp/B/c3MHVXsO21/7buzMiWpkKhui+0Ni8fY/8woGPX03tfz
	BCaacM5jOh5pDuS3YNztwgOzRnwm9MxB5G2MaqXCUkBh9sxbUv1dNPV7U7bCIOrEFlTEw3lRbRO
	e1Cv3iUjXFTvxugbhTu3FubMU0VpxpnxJKr2VELmVH5kPmrQxz+W5Td3nHFcpeeze9me5BOhwYE
	s+HxLIzQ6V9x6BAG6t/eqjgVOc=
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr1915970137.13.1794500131227;
        Thu, 12 Nov 2026 08:15:31 -0800 (PST)
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr1915955137.13.1794500130657;
        Thu, 12 Nov 2026 08:15:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: iris: venc: fix encoder crop handling
Date: Thu, 12 Nov 2026 17:15:27 +0100
Message-Id: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB/m9WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3cyizGLdtMyKVCBpZmhskGZkkJyYZqkE1FBQlAqWAKqPjq2tBQD
 Incq8XAAAAA==
X-Change-ID: 20261112-iris-fixes-f6130f20caf9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Xrmx36Bu1LW6zg85HMdEZ4eYesfTf2Ir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfXw/Z9GU1lV1yJ
 OMGF4ebbc9W+ZQ8mTr3axafJrQ0yox+BWD2iz/ZOEusZrad4NIS9z1/RoO89BvYRGypvgvFd0ia
 bp7dYIE+JpcUkcOkdDgCr/n7SQhxL+lbaoDfmI9CsvXwwpvnnb0ShEzIOvfOWvf44GNhLCxMMeE
 PIijj839ViEItQFyiyk2BpAXANIsVoFFnwKwP0UKzNQtnRp3TfrVKgLeRng4LgInPHN0CYT3h/3
 JJh+MqXRk3tCrocITxlxRdoC2AalempDmV+iI2NyqQ3vd87Qnnd1KVLxApDSNToLbqFscTKEE4S
 +fIL/+2esSVcxea0htaABe0Cu4PHNv6bSdo2BFzAs8TFwZq1LeDO49GATlBMmA6Im8IWGM6ujf5
 XIEFiLhJ5ye3/Zn1bag0dtAuxhKuJOWzq0Qki1LaVg2jIecSzCqLcWsfI1m6S8mnKgK6VZWff/q
 qi7UiRqedO4a/r23olA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX0ArdGAhoRUCy
 e93BUhd91jyDqF7Yp9v3+MMiYqKUswsKvqoghizUlBAukI19p+MF8RQI1sprcxtMZE1CgMSps5X
 k7FNC3uJhW8W0AFnybr02nyfAgWY0os=
X-Proofpoint-GUID: Xrmx36Bu1LW6zg85HMdEZ4eYesfTf2Ir
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5e623 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=aBm2fhwrLcIJbTaFzjEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120064

The encoder keeps the source resolution in two places. inst->fmt_src holds
the padded buffer geometry reported to userspace, with width aligned to 128
and height to 32. enc_raw_width and enc_raw_height hold the visible
resolution sent to the firmware.

inst->crop belongs to the second space, because iris_hfi_gen2_set_crop_offsets()
computes the offsets as enc_raw_* minus crop. Both patches fix a place where
the padded size was used instead.

Patch 1 seeds inst->crop and fmt_dst from the visible size. Before, a plain
1280x720 session ended up with crop.height 736 and a bottom offset of
0xfffffff0. fmt_dst now also carries the codec alignment on every path, so
the CAPTURE queue keeps reporting the coded size.

Patch 2 bounds the S_SELECTION rectangle by the visible size, so userspace
can no longer select a crop larger than the frame it submits and silently
get an empty bitstream.

Tested on QCS8300 with v4l2-ctl and ffmpeg.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      media: qcom: iris: venc: keep the crop rectangle in visible resolution space
      media: qcom: iris: venc: reject encoder crop rectangles larger than the source

 drivers/media/platform/qcom/iris/iris_venc.c | 24 ++++++++++++++----------
 drivers/media/platform/qcom/iris/iris_vidc.c |  4 ++--
 2 files changed, 16 insertions(+), 12 deletions(-)
---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261112-iris-fixes-f6130f20caf9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

