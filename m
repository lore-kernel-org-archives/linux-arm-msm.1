Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979096;
	b=utynN2oOdt1gMjlzGLt5qGVnqnsGoDtxU25s809ZC7PUobEMo9kW3klEk9q+Mee+qWNz
	 wfGVYpMIh7clCVJasqpcjmremyMZmrkb9p8nEKSaSifWfXgjo4EyYt7tAqXon5QY58q7k
	 Ji7qMmfFZKqFrNX9bK9YkOj7EC+iwl7HadqOvXKTTSWhAeB7DgW76uHyB4IuakRejipLB
	 cM7nIWkqJ2XYld4ub6FlnWVSgH1DNwz0m7Tk/DGyVRcl9Gjr6g+jyGtx33UQzboX4QKTZ
	 jw4osVLQ/99/JiEZtks2ae+cRscSnanlRQRgzijWpsTrjSN1ifdZOFG4IHUBNJyBsAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
	b=vD7YsjrpoKq4KE08k/q6XcMn1Fn2YF7cDU/oqTIS+LkK9vDhVDcnYmIpj4iJYKqEbyyu
	 wDKKK+f3puRmU+1z+iwf8+5BN6qkTS6G/WfA7HgsASbMtlSZyaylBMTW8hdEOTbnsvCHV
	 m3q00KYfmgqd0DiDjdElIutD0nx8nrSzliS9Z+EXgHUoehTQYyaPJnm5Id8BlC/NlEbhD
	 FfheJDFILv1fg0w98vtLpTn4ol0CKZiSwcnHkRQxeZJ0Od0G1dU9MIAgx9KqWcj8PYgO1
	 2U9PLZhU1bigZEWMcvAv2se8CMgo/uI5PhFy/LeYPkEbdDgYnFHHW4QXGmf33uVgDyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWpjwBaE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRKhn1vT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA4606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EA4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWpjwBaE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRKhn1vT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0o5p710601
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl
	2ScC7y7M=; b=lWpjwBaEKXb5o6XpgJVXUazxxmUjLCzISZPNG8YiXBFQLgzJG+W
	y3C9r6cVlMMa9RNfi8xOpVQRDWcalIqn70FUa5oz4QWR28Bheln38mNUh/Z5iC8A
	7vyFwSkEUBlPp34MOEdQvP15FdHzJINEWeDsJBwQkGzIP8m7/95VIRJDoM3pqxbE
	i1VhDTQVpHdibAbp82FWgGAzmVgMmbPxWVcq5UMs+6SYX+AymRHtnPn3VpccFQpk
	x15GEefyeV/3VIuOs7DdNIXeYbGjBrw0RaWcbLcVwiy0nyH/iNcDox1meULAR++p
	EAJjrStumLyrFFINzkLN4gvcwAf8VNpqvXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paucmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:31:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso971494eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979094; x=1794583894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
        b=fRKhn1vTN0Iumm7bTnmiq+f3Duq6spQsILkyqn1nGc1r6umvxQ+BQsgRRz4sKfoBo1
         cTUoAwldoYWu2AFvABamdJWrmWR4+kSE3Swz6v5jVY2rqbhz6uUjZVgH+KNh63Q842jH
         mhZ5iIv/fOTfzcBBfERMB4/k/nestjIUpW9Y478LIEEH/lN1d1dyn7hEl3yVfpj0StWD
         A7Rf78Rcg6FD3YHF4EgFyUPyMlNTMwfPKPKWK2ZPJNiYnbC6UMPis2VNiTGxSztwk5hU
         HgW52l0i54zn2YtkjP7wioCeu8tBqOvEwzunsR7V6i4pOVbjnxarHD6F53eyak9dnX24
         LcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979094; x=1794583894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
        b=h6IBkU0k5IJQfTXRYQoytVSA9ik80c6DApgK+X2LZCK0kgyodVpCuYBR3tvTJ8maak
         vD1Wa1hsVQx8wm5FvzPR4a3+3GRIBqzSoc3OV1RpMqsokz/GyqJgWil5hjK80SZxM+Q9
         FpValrxJYIUpnQaYPSHL8RIU4jEQQgIluvQEVW1twXvJN8yqLfGFqW3ZNDbg+m2WrzdW
         bG+8l2bYZSqtTYY8GdrAabcCPJCHa3NLOrtplOBLs4TZSZCOTz+D/fio8MtbOa/7M6xw
         oeF+XtZydT572dhvGXtufl0teKl2rvodGeQi/WGmrjmihhd6feBlrT506QY+trxPGig1
         x3hg==
X-Forwarded-Encrypted: i=1; AL+hErHrtOfOFqbYV/IGHkMAUoOMrQ3tHafx/BtyqCJjlT3Clb7vRbEZVYsX2jLOpP0rbwEG1XwdBEO0ESkw+71I@vger.kernel.org
X-Gm-Message-State: APuU4Z+0pY51KUlokh1Q14B5g7zQPXSFatwd4V9y8Z/bq1zjk+1Y2zjr
	KRA/28LFMtkJlHP1HVEgDyMGYdDezc78tZDu5Nj7Iw1y9j2Keb0RmwYW6PrqKcGbbXPcuU8/pKz
	LN2jf0Gwu6rgH1lAJhdjUNK8HJ23UA4leSy9en+LUBxst8Rqpf5aWkrh2+UL0e9OQ6Mzyx/zmwU
	tb
X-Gm-Gg: AYBFou3MUpwP77nnXN+wjjVAfSF/Ieqax6XwwYAGyHHjl93ZOmTSxB/HuttYCo6LJq2
	U3tZEqZjwSdzBCXOtkvhuxE00OZXvR63lr5Ja6EA6K+/c9dlW2a2JBRUa+Fy/bYb6qZTumbk2qU
	Q13JgQbZM4PNyU20AZHKvld0EkqaGAp2nELZaxB9YzLm2NR51CLE4dhTydK44fbLk23/tlrgY0o
	5uGJ05c7t0NDz487tDZclEmeZ9ANVuoJBu8hO8XlMfk7useUqtKOcPkndJBUQXPn/yTvCNSI9EK
	h7oGz1YcWKsTC6EcpsLuspUkZXQT2eZuIdH1gS7/AMWUH5HbJQoZSkpjy4ySjkQx/oF4J6EPXX4
	ylw1TnfDUA3UUwmuwJ5wK/oLiLqxE+S8UcsyZVM3lflZbVm+bzSl2JOe85W/Mnun8hsoOOjPqfn
	3BXy4BAtA=
X-Received: by 2002:a05:693c:68ca:b0:36f:5822:4bb2 with SMTP id 5a478bee46e88-36f5822944amr4017423eec.19.1793979094020;
        Fri, 06 Nov 2026 07:31:34 -0800 (PST)
X-Received: by 2002:a05:693c:68ca:b0:36f:5822:4bb2 with SMTP id 5a478bee46e88-36f5822944amr4017399eec.19.1793979093356;
        Fri, 06 Nov 2026 07:31:33 -0800 (PST)
Received: from QCOM-seNJUcZa74.qualcomm.com ([183.82.133.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13618197eec.15.2026.11.06.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:31:32 -0800 (PST)
From: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: qcom: iris: improve error diagnostics
Date: Fri,  6 Nov 2026 15:31:22 +0000
Message-ID: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfXzVCZdqe/zPst
 t5wP4Bv3f+FIMDzDef24SF7K4CqEciwgZC4h8lyLhpDDRABqbSyA+S5BbZYFOcPU+naP27IJAZf
 DUVld6/R9BI8na3BCRbkgAJ/+6Vvv4oyIidPkB1pyUJdGNd7DONvR3O7hSCgUusLxClP1OSX0pZ
 c9BKrdSULqFWHqSvESS3lwkMEukWsStSv4a0l9JyND4K5ODGJ3CnPaRiutgv4Hy5tB+foIN/H4G
 7BcDtLc0sEqC7HY7b0mkVFkpeQ6MY0Y2Y5JiEbL8/2+bRm8ojK9ETfocK+rp/8wboTqLYY1nwD9
 P00yEuM9NKamXmfTNADlYd9Kl+9V3G49o+uUPJ2rEM05wEyBsbW3fTsSypjXJjForLE1D0gkFtw
 s1S613U5Abq4aFiKDf84NQON8NMRLPZlz0sblfqDHlNhl1v7xTeZfpvOGV0HPcp7K2LkjwcV95u
 yuSRAZzHjvFQBjXOB0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX44lhBQ8YM6EI
 A1gDkDq9VCJDh07SIFOkT/5Ln5E9bcU2mxUQ/SmG4ivrLq5YzPpZbuIvpmZCpNGyX95zlPuuX6j
 2KBe8sLChWT5UUDTacyXFXxKcSVI2HY=
X-Proofpoint-GUID: 5oWw40lF7MZ_ssQTYiOHoQfzrrLCzPxR
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aedf2d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=4lT0C3RFl5dsjxM0/Vd6wg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=wK5rk20clm7eK2MKA1QA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 5oWw40lF7MZ_ssQTYiOHoQfzrrLCzPxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060061

The Iris driver can return probe errors or enter error states without
logging enough context to identify the failed operation or firmware
response. This makes failures difficult to diagnose from kernel logs.

Improve probe error reporting, include available return codes and status
values in existing messages, and add focused diagnostics for system and
session failures. Report recovery failures and provide debug-level
messages for successful recovery and less actionable events.

Dipayaan Roy (3):
  media: qcom: iris: improve probe error reporting
  media: qcom: iris: add error and status details to diagnostics
  media: qcom: iris: Improve diagnostics for system and session failures

 drivers/media/platform/qcom/iris/iris_core.c  |  2 +
 .../platform/qcom/iris/iris_hfi_common.c      |  4 +-
 .../qcom/iris/iris_hfi_gen1_response.c        | 16 +++-
 .../qcom/iris/iris_hfi_gen2_response.c        | 15 ++-
 .../media/platform/qcom/iris/iris_hfi_queue.c | 12 ++-
 drivers/media/platform/qcom/iris/iris_probe.c | 95 ++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_state.c |  5 +-
 drivers/media/platform/qcom/iris/iris_utils.c |  2 +
 drivers/media/platform/qcom/iris/iris_vb2.c   |  2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_venc.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 19 ++--
 drivers/media/platform/qcom/iris/iris_vpu4x.c |  4 +-
 .../platform/qcom/iris/iris_vpu_common.c      | 15 +--
 15 files changed, 141 insertions(+), 58 deletions(-)

-- 
2.43.0

