Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39900443E31
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425177; cv=none; b=ufoqR3m+zdawGhByHJt7UDgz9665kwKpt2oOjSMoCVgHxlJl2UdReDtMCtbomrNZMoFCe9zBBvDH8LMvZKNUVyEyVz1qjzwvr5SlUZMBPPziiHold0mZYnA3xyr5ZVELOz1hDMNCrLQZavIOQpHJ961vYP418AngpA7/VI3miA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425177; c=relaxed/simple;
	bh=jA34yBnA0u8syAjpz0YDHemxRSdDyIzpxGZHohbCe3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CNOQ9akqnlfQZSntfRrF0fr7K1T2ZVyiNrSQWJN524Ari6BDrNV/yGjGkNEkUN45I+KEpMU1P8JDSDrGAcdOY/JsfjuBH+DTV1QOFfvNPrmftt/5w+AKyKbRzhLlSoxYmILeb4gCKfi5jBmNWaHtEfv80PuxcoHIfC6Eke4dKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJOFZ/WD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6Zco9YC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJOFZ/WD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6Zco9YC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDOA81062969
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X7eyaTLQ+KQB8fRExHIRXb
	GwfGw6QatxQ2D0kSDv06Y=; b=oJOFZ/WDoh5aiKsu8B1pv4y+zt+yC16ZZcwbVL
	miOmzFbMPnT75ld+33IQCqaCDE5YG77QmSF1NgzyUgUKOlcfPnHRNR0LxY90Qfqq
	HXwJYeOTAfiGp5jEPPRNuXUYZIOdNF8W1b6niTYYgR5JeVBDDJ0PwvTWKrYBJ6m4
	8eUVCGpNyoKA/RK2mmOgQLpDjVZ3IiSsCbvpkRCMpo/USgDF0yurest43tTn0gY+
	QqIb+pvagjX2cJr2W/Mzw/rwNZkPipYILnxFnYuDAfs+PsuArb2/r3il0wEc0wmL
	/fMRMPWTzr3Jiks42PSS9WKsgGxVI2XBzroT7Y7tFLZLcAyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrs3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso19100271cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425174; x=1786029974; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X7eyaTLQ+KQB8fRExHIRXbGwfGw6QatxQ2D0kSDv06Y=;
        b=Z6Zco9YChsc8YmSkjhvfGXrJ+9irF3ankK3N3rA+MiCubQeqncLpwHpbWDRMh2woT4
         rBIeNmHky0GCPp2/6BKPGNhwb15w/aJv2xKf2tyOr/9KFgi5rpZ9rwRbpIAyBNf5XFKl
         u99XuLcGC5Hh2W+cpiZJb1lzNss48q618IKucIxh1kDgVl3U58nIwuauGTwEalIYipK9
         gKJU9Z/+sszB5nko0Taq3ttfGBSocHtXzrTI508rM0aILwzEHpkKNjrsCVxJ10MANU8d
         HmRKrXUfn0i6WPSflg9c9yB+V1RSD+J/RBR4RXSkX643jJnufDOmZUhIaMRo6D9x9kfR
         XGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425174; x=1786029974;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X7eyaTLQ+KQB8fRExHIRXbGwfGw6QatxQ2D0kSDv06Y=;
        b=Qf6dwn8KFVAW6hLMKze622SmT+YuRAaIfTSEuxaoiDH4V2jMoJ58nb1znhsVDN5SZc
         f2jFQytNB6hYdIT9o0nSBqPLI4ulaGLVswkylMlwt4R/hj6zfpiiQPzqyTEkGJ7uCTfc
         c2nfrdkWlxHeTWNPkIwPJxitDdTDPoQg9CMPh3rhcdfzcNvjgPoigZEHZQdq58Zs1NJN
         2EOw73hXD5CNsIuhp4SzEAj6VXqHAD3zzIB3FNrvN7WdWHuchakdI5UvxaOnJNrajjB6
         hfzwlfd5qHdGsg1Q0aAFhZywlDFT8gq29+jGbeuhJ1DgB/b8UA9VABiwwyM02tZazLqK
         8PVA==
X-Forwarded-Encrypted: i=1; AHgh+RpgDjck8sJKYbSmcVoNtAD33roSWe0KGqg4XO3AbTA/JPO1m0+0b2i4w8wKn5/t2fwWSgJgzQnQmcxHepvm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzch+VMV/CWjdjnHlKMQR5nceeRn9QYsXvL5xB45V34uVlAuzRl
	UoaFWs/iaZ3FdBfuYC04OeT8r+mLrw2yjsPtbtAXuciK1ppjWoe+U+8EUQSZkvh0TBu6nEmPxeg
	WIcRBdvMBLvMKd8mQwiBm1FZtV81uYgThKevMlTjlAqTnyrKGIPWywm1BEdRG3eprcciD
X-Gm-Gg: AR+sD11S9fz0kMcVYz3Djsg4uiDXRFNYW5e6HxjPXLm6+Cc8MvBI2sF8N8xW3lyAdUS
	9lv8vz/2Ry7xPbKgy6TJPxauOJZDNw1XeQ6kJ74gDRKDeGyqW4yFkUKqiP9riYRZkONwMuvTv8K
	9tfXnw4Ku7CXisTh9jRt3VjcliATw1SCNS2v1wYGmcXn1J8+dgLlDvDCi81t6BVXdnzbKR1lNom
	KsumKM5MCJsPHbyEgMy57J1bLpFn8XZ4vLTNjzOy6QoPuE5k4vOqfA1rwqjtZkF3RpXLhwTsMAV
	DV+k+SDxSEpPfyvKz8O37gvO7c/zFu0mamDuaPbBbuoP5S8x0s6hRTDKv1/37yYTF2TUHc+7tVr
	42JoHqmBkFpBNvmIlxOsXdWo6wMoyzqnuibHZahCmc0F+zwLAEsj7OSK0th9bFuDrUoP8eU/E4r
	CwA8QsyMO7gz1yMQ==
X-Received: by 2002:a05:622a:1c0f:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-52b3867df6amr35149821cf.50.1785425174190;
        Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0f:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-52b3867df6amr35148181cf.50.1785425172427;
        Thu, 30 Jul 2026 08:26:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/5] media: iris: several fixes
Date: Thu, 30 Jul 2026 18:26:07 +0300
Message-Id: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9ta2oC/yXMTQ5AMBAG0KvIrDUpLRVXEQt0MBYlHUQivbti+
 fL93MDoCRnq5AaPJzGtLiJLExjmzk0oyEZDLvNSGiUFeWIx0oUsKl1aY1WhpNIQB5vHL4j9pv3
 NR7/gsL8PEMIDvsFEsG4AAAA=
X-Change-ID: 20260730-iris-fixes-846d7d353034
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jA34yBnA0u8syAjpz0YDHemxRSdDyIzpxGZHohbCe3M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20RabwaLUZ96X8Fp0Xif9iDTpUEfnjPQ0I4o
 xo6wzDF+UiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEQAKCRCLPIo+Aiko
 1fS4CACRASg6/uYRB4rO3UElH/Ee9twhdo12bvBOg9jhWAQPTf81eP5lYlS8sPYHlI+OeZ3KHF8
 Sz+iKBGLt6j5OGdjX5caZjh6Qmb+JJVT2BIjY7t7v3X5cMxbVnAF2qaYwCA6drOtEaeLmrK9bP2
 LM2NC9likB0FaRSflCh/o8ihg3SosIoirWKtb9VWwrwKFIhD1cFipFmD+TKINx1GZc6DoavVq6K
 V3q8Y8DPyrDC40Lt/r12GN33x41zy7PHLdZnkzhK0ghUooNg2KV8ouN1pgRn8GjryuqPV/1lDUZ
 b4TSphFbiLFw+pO6/tf1uoyLPN8wYTaIyccubuXUcql/FYpb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX5E7SA0UlB/jP
 uzYkaI9W2prymB0+fAc5nh2yrNOq6vN4kXS038u99uLBipWVcTzWNpBjAxDrJupjZ08pKdGRJJO
 KmKdSOH+w/EH83qZ7ciFJJe7gX6uFErzopbZCUD2++ieGVYYXht8KP8Rpx1Zap6iY1anVwvY7kn
 palHwiAwMRHcsdDr2edBTbziKA4G6tnWvvReadeybtweNYIBKiXdqV9EtgubEGka3gSaT4s0LMf
 EjBgj8jfVKY+oDV1Cc7bXosnQM4fG/tqDk/eq/mVg6/GUAYnMFWhfcQ7E+078vR+7rk5ARrtJ/I
 4A4gan41noaWjRQ7EkkYPE2YgY5Cy87yl739oeGZHtEk4ujJ8Qv+4o6CamqU3WjYkx2If7h1iBC
 i4j2HqlPIzqpLWgrvRuMVCdkJfuffIztw/Z0X8fED17LSXVu0cZ48pgmozpSPnNkW5wlcTjuAd2
 OfxWVvDSmksM23gHtug==
X-Proofpoint-GUID: cH8bu64VaPUYE1Eu96ELQnBnrzDoFDfo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX50o8pTUoxmW+
 CY+Pp6tITu1AG4uKLEwCgPCbSUiuLRAEMC8F0KZxciJJ+HiTxS61kQ2N/c3t81NZcCDZD6ARUY9
 4qI5KwmieUx3Oh5N4OJK19qVJ8cqrvc=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b6d16 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4abjX0wlFHiq4bt0lUoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: cH8bu64VaPUYE1Eu96ELQnBnrzDoFDfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

Fix several problems reported by Sashiko.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (5):
      media: iris: fail firmware boot on invalid uc_region
      media: iris: take core lock when scanning the instance list
      media: iris: guard against a NULL hfi_sys_ops in the interrupt handler
      media: iris: reject open() when the session limit is reached
      media: iris: reference count video instances

 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 +++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  6 +++-
 drivers/media/platform/qcom/iris/iris_vidc.c       | 37 ++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  2 +-
 9 files changed, 53 insertions(+), 10 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260730-iris-fixes-846d7d353034

Best regards,
--  
With best wishes
Dmitry

