Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391591;
	b=ONLVQJCrPWa6aKHLnLN1tLPX+jJ2MrNkklVHKq2vSIGBNO9p8LoE5A+WzPFBv4P48+3Y
	 PL9mrq1HkDOM3AiD0M0qAuyToyzkSlzIv8bB37t0DdTWNzCj4/KZ5rsivjwN6QQxMSNK2
	 DeM7qd0eg3DjFcjQbYxA2XvFtPfYHRkXboskShpWpGK7eqD19OH341ATY2qQdclR3FPaG
	 enM4IdZjUQ82T/0hxp7jhvmiVVL5/vQ83T1WqCIBAHLhA/XZzSVfG6Dv1KiTmZ7xNjktA
	 gRA42YKYcQcNCVUhcHMgj2IKpcrpKxqsLVYhGq9njaYGW3sgmjE//9lfaWIRIsGEQaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
	b=wiXNIrCoADiC4liPnRi0yZy1xgT+YHyp6BpQ/NMD/gPtMDXgvuK99gbe0gpnLqY3PiGu
	 T4dQxpiq5mSM+PqjafyaEZKGpwcLpVpkwfgxJWmHw9IYO1Qjlr71DIAsx+tZyFM+gb9HI
	 772aWdwrWgOAya+p/k5vXFWVX4YNGevn0YQtY/B83NYqCsUH05PGbdDkQLc6KYHi6xJ+V
	 JzEtP5Qw2EKdLgwcR2XYWqHe4/Y2DHgvWqM2Fjus+5z6miwp0V6y8+iTqixzY0KkvY4dB
	 zPtIHVK3Kzw2Jf95VzkI7Y6Jc4L9EZOQtjZNA3pqWuth/CGzYCTyRDFdDzbcD4WlOqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Phw7tl0q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LqZFDTJq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D512606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D512606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Phw7tl0q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LqZFDTJq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIckCW4118819
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2kPCKs/RDRmqxYkAxTLufS
	Jm8JbuEsv1KYBJrRSxuuM=; b=Phw7tl0qbHAoMn2kPxpTmKvydreYwgw3+m+fcZ
	ybZV3NGFNM9zmBMopNsSXRGLe3Cn+E/dSouR8S6FL69jUMi8eEk5lR0fw8xdU3V0
	ZA7tGEwTqqlR1HwVQgHX6pS+KV8jZREu/1g6TJ3PNFgayjgyeNyaKmniomr7ztlO
	LoncEcUGJhygPoLnAP9kBJ4KAn0bCx6qoYPMXHGXP9wrMSyY8yqsy+hKFOKKUzHB
	n9A0aO6+I1YYw2VITCfi+sSKqFkIitV9vqos3VvmrF3FH3X9qE24XBkeQ1GRSKwP
	5VkhEqrOu9WliLE3eRGC2TP/Y/h5+8Q5syJ9B3Xvc468uA/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0pu89s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:19:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so1436734eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391589; x=1793996389; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
        b=LqZFDTJqfzomXjr1rNYXr41O/uJT1xa2Zd1/9Ugs+7VUzbnQDVReUNoJ6giYB+YQ77
         KEeDETYURJ3HM29GHGNjhYm6ebQGlzqB9/3DMNiB6xFTaBCBWYEbh+yIkxv71tp7pr+x
         EpDY1RGOOa+EUiEViRdJwS/QiRLh4NKU7esZm+wpjMAe+e1F7CakLfQJbFmBWieAhXvs
         heL7LeaLICfwdQFkaj0QgKI4kYwpmht+PM/kQ6Zd18Lhns1n9s8rvy0iELnw4aMO/HFx
         HydPDD8H68enHToYqHtzOLskDy4kX6gZM6djRHcRGYCiuePc8o7Vjyo54gdm9zqb4zW5
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391589; x=1793996389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
        b=CydM/HS5ZwgboYXcUjgP2rxpmisqKIK/lba9w1osn7CLa0A+iuKdmlIYpUkGo0C+vK
         zuFlvNOU6g7iqyUTz6slcXdNDwQxRJHyShWFXpfNAuOpVItSKjskG/NNeKk45PfvXFXi
         PqYd9BrB6Ulw1dWt4y9w390ykP6SaaJHTNJZt8A4QT0i7HvIDZuDTBSRfAfC5RV0RZXI
         8wnWjdcS3TuWiEKa/EiwQRbzR0FYihluU9NDE5UE1cTSL1accz7qZD0lDbdKlISxZOal
         WHN3uBXmdrv92o6YTXdRbb99eDZPgovaNmiHJfekXYaLxU1hzFQKcLvHTN6DRZMoYFpH
         BEFw==
X-Forwarded-Encrypted: i=1; AKwUvBxHjvoyaeij/dQS4aqLsc+7QPcuQV1jCIoKHrL6GkIWTfK/EYMrSp+hwLJoyCABx90GasJGShaBEfg7PBH4@vger.kernel.org
X-Gm-Message-State: AFq9FYKi52MrB4N9NCFdgUljCRCYj6jZBsQmASZaO9BxRRoOclkAOdQQ
	x0yKCSc8qBvVdcm+tBJBSX/jTnUnfjHlGFCoTdbkqlDz8OVf/DoQOR769bKUBkuV6S2wZ2zHMb2
	mmBuPi2pAMmDAJe9d9RLMvLwdZFNV0S1Mbu85lpvDRzHiYz+Qk/U9mUTH2NP6n8vcfB/W
X-Gm-Gg: AYBFou2+G89eLxMV287Yt44ilw+Fz7zUCMSv48GSTzHoaifpnjOuqicuOXabmSUzMjf
	Am5Bfr9k3p5Sk7iFs/tJ/G7/Hbtr6KH8Mv+D1sSUTFNgGIMpvAjAQW9PX9TifYhqk1sLbwgNf1D
	E2dRXviAsSJNYUPegN0j4f9U3TVSQFT1nEy+G19MEm09flcG/jaEsYPrcaHhBJGctg10Zxk67X4
	gQc1gjUkv1MdiYUeaD8Nl/wBYWbifs+yjdVlD6ZlHyeIO7HXVlwkatYrSuwHVjMnLaUOkUOoxuo
	yYGuREs6vIDgxgt+9wzMJmgh/YpgMBpiUMgGEe4kNVkDrTXiJhJNGME1/SWs8LnkyGwR7QWZG6j
	fXrt1zfqoqAm+YgQjH4cJmec7TIY9XN24jhOHXmUMjoaX6CFlEZPWpd25jju9zmnHSrZ9e8EgiW
	JgnD9NjA==
X-Received: by 2002:a05:7300:26a8:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a30032646mr9314840eec.15.1793391588363;
        Fri, 30 Oct 2026 13:19:48 -0700 (PDT)
X-Received: by 2002:a05:7300:26a8:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a30032646mr9314808eec.15.1793391587769;
        Fri, 30 Oct 2026 13:19:47 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/3] media: iris: Fix issues exposed during decoder seek
Date: Sat, 31 Oct 2026 01:49:08 +0530
Message-Id: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALz75GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2ND3bTMiviU1OT44tTUbF2jtERLI1Mz4yQTS1MloJaColSgPNi46Fg
 Iv7g0KSs1uQRkhlJtLQDdVyLWcAAAAA==
X-Change-ID: 20261031-fix_dec_seek-2fa92563b495
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1148;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=aBpCigvip3vzlaPahoVHpAyPFq0Wo97KNuqvQOgjQfk=;
 b=WAWWtyA7FK3dH+XMZfC4EzKghm7UFBxlf22+Btw+plZW7u+k8PJUulRWyGCo6s2xX4m3Dic2j
 BzCSCVu7mB6Dz9sgXn5B9YyIHZBBkcf9CBiVVM6qIbz5nnYdpfgqd3L
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: dJW5QAWDXZsz3yR0Quzj61eI6O7DfSRN
X-Proofpoint-GUID: dJW5QAWDXZsz3yR0Quzj61eI6O7DfSRN
X-Authority-Analysis: v=2.4 cv=O92sLx9W c=1 sm=1 tr=0 ts=6ae4fbe5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX3s8sHiirC+ed
 sWfgmn1MjEfZxiLmJP7C8R0A1tJfO3HqvQQPwUn7QUS0hNamXyZnssM3wYDwzGSqfPp5EfOO4Zw
 NnxH8QxH413hNy1dRyWyfjNFfVdpBa80njNKM0ErmxCkAMeL5cVMWLtkqRKk6DMIyZVi840RtSr
 oy5KECi/9NstUfjVX4fIQ8/LPQ3V2W1oAWoc4I4imkkeY9O5k2e8LdnR9eij4Ofo7PKfiHVKbc0
 DfbXotscCqWaj7nXye+GD20dJlOKtwvhd+cPnehtjBzmuOcxrFxTrEe2AFEI1lELLl2F9O/7JHI
 JrxKOeV6KKZHug4HTfotNenoPhS2ZWOHeLQ8gucie0dVVozp/qzCN5yMRbfg7JprfQqQOSIEP4c
 z3A7MylHx548yBECvJicV7irW3xM+a2bN+2xbhwx16giHNc2qH69pZv7NSFd5aillgBsykCg10J
 DN4pqeSKAgShbIpa7LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX930lCfnzaEV6
 J/Ubn6VB7Otlo7KW7Ko3iy3sUknEelKpmn06rBvraFlLHzHMZh0Saluvr5fmVRgxUqjqyp8Cp3X
 1LYLq0+fAQ4kRGxCFp3azZOcmXpj+5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300080

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         |  2 --
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  5 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 3 files changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

