Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662724;
	b=uUoUq/BRW9zABpMZRxjUDr74pvFy0pJGXT6ibMlJmrwQpnAJZHB8sRDeiETvgb/YH1Kw
	 Bm524+pVKCFey0rHeTRs7eV0A5HqJwl185FzAxLgYpyU1AxQk0bMLBHRuIYKMbNFuTlfD
	 Mju+SsWfHilWrf/jkbe0LWHmFj7zyMoHjwqOPEaE/fIHpQz09aldYcRPZS/tRjlN5d6CH
	 wKDOccFCzKntsjmOavzAwcW0gHTtMNTaKUa8KA3iEKbD285wj9qNTy1WmIovO1NNK5VK5
	 OJaKRv3IHXKV4btJCkJtLz7Xz/3faa/wPkGdvtZcKkGEPDc48CaL9FMQxoncXP7LfuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ibZbAM6mxwTviQGJE6mRb86msHnx1wYpor8WMO/JeSc=;
	b=LiiPltDA09D8y48ShxgrIJd4+7hWyqdYo7JqY0JllBi4C1VUi2PY00qJ27tsUdf96kBN
	 kB7n9zKR9HkUy6xs7UnUy+KZjTapbNuxl7nqxOuKEiI6798bUQKtHXR2V+0BmbuYhSAdZ
	 BzagSRWAzEFrCdAR2u1+d7qk4CNIIXlU4vbttk46crOnxFp+8mpEf/7FunBdNN9v4PZEa
	 RQlX88UXHqwczf/fOsBQlEtBCfIAguIGM4eIacCUf3lcIlab9EvkoV6CIPNqcJJuocNcE
	 elAgsbFJAq/hzDub0f+s7jtkqc5DW917IxDji3HihrI9739Sei+t2Ja/hVw4HevqFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7Xzwrny;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmUBGrpg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A0F606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7Xzwrny;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmUBGrpg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8p0Jc3271389
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ibZbAM6mxwTviQGJE6mRb8
	6msHnx1wYpor8WMO/JeSc=; b=C7Xzwrnyd9b9GwslpMsBv5OubS0kInrGpENouM
	O6O3cNuzljTdAxD09OxwUiu9GneqxHbEdsZjGn+jfoKED7NRGKTKE2fcQ6uk2aU4
	aHOx5/8peflJn1j+eN+OtdzZRFVnGN402bn2b01qb0jENTsOk8cFPAKUjrA9M4CF
	nS7R/CdRSOAi8y1VzfipC/szB5xyyTx0ARJsDnGY525C1AtpcvGwLttpLkH5wX4m
	EqH7G4D841pyLMsaPNtpE4lRa3bYiFa3bqh8MiIBBpVdm58gp93QijbUw3MKu+Ym
	d1QydRW2CzCnCszkW12IbKIYFmwBjD0AZ/iFiJJApc2T4O7w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asr05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:52:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so2807581eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662722; x=1793267522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ibZbAM6mxwTviQGJE6mRb86msHnx1wYpor8WMO/JeSc=;
        b=SmUBGrpgJUf+Tq9+aT80UlaXIpb35ocvWF/8JPjhbZZwzP5H1GhnQn3w2vKhsVB9aW
         mwML6HYM43P939haimf0VL4Z/F3Snrw83eywgLTyx0w6tqQ9bOFfqjMmEhfqak4llGxa
         sUGAq017CS18nXPZz4rfLqj41UdNuxNsCcOL5CwRFYacvVjjz+lPIYBQPSg+KDC/UbIJ
         zxnHu8nxZr7BOp+G8ZeMhD4kSm0jq8qNpWTtmr+XaU8W/lJ3nN4gAYzhyOae8XpS2pPV
         zOAmzanlrWrLyi7kDs5ulX6mllRZVUr+Owr98kqBFzA1rZfC5aZD2n+6bRg8sq8d47hf
         2Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662722; x=1793267522;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ibZbAM6mxwTviQGJE6mRb86msHnx1wYpor8WMO/JeSc=;
        b=FMSIyESIPHls+6WCIC+nZopE6nRTKWnpQXfCelU80tHq43n/b7fCtUPOFRnKKiNtkS
         eHiY8tMQim9Cl+CC9kLe/cbzYIm2G0GKOmfgjtvcWlj68JuJDDmYVbB3HZVox3MOh6rz
         HG87cWeL2m7TZ9J4L0iDgPc2dLpct0TDM844r5T9ju3d+YfbK41LAYDEGmk3u9v9JWP0
         qKKacs4JDctH40UNArwbB/RFdAWx98gQESq7Y/0hDblNqGNcBwGqCwSocQXOFAO8NtL2
         J/T9mvM6OGHM7Ry3k3J+qm1bEzXkt9Y/DQ4KIonQHT7Q8XC6gK2yrkfHRkV9y7xAMA1t
         rSaw==
X-Forwarded-Encrypted: i=1; AKwUvBwBlseioUlQLbj5deV1sPAJ9z8nD3ZIY4Uluu48jvRqSE6sbxa+JfDbkjjsWnulNKRnHXux/vPZGknoeuUl@vger.kernel.org
X-Gm-Message-State: AFq9FYJsg6NG1BfQUXM6VLXH3OFtv3V3LhMGcvfTP+4dNReOXL7wwWBu
	dllvUceJ/SRmB2GH9vO8ovkiqhiONML+TGEUv3NeOri/Sl0FNyBGnSM6kdDhQQ0qrQUTw9zfDd5
	g+9wBBq9A0mTji09sRumt/RsAFRLfh+Y0eFFUkjAnMuGgHeQuX9nDGA1+XnyJJnXpGIvV
X-Gm-Gg: AYBFou1Wvbunsv2GRZasDPo8AFShNVD7DNJCJ2JhE4Il65H/pgsRznUUZcUH/4l2bPN
	xIX2aKR4eCu3RnKAEZAOI0PzFYggZwK1UJD9Cmym80hskvrYd9qcfeb4Qyq6N9UKhcYd9vmound
	zs4i6nfoaSVehVoCJg8VylODfa6x1D6c/5ZFwCYyUw9P/AuU4o245OgCa7NjWxs9AsbYUbprE76
	Rkn5JcnYELDJ+HQWXKVTeAhYJw177MwGm0k2xkSWEwpKnUcF+NbocFeLYCHmviR9EMdb4n3z4SV
	/98aCu3RGJQ/A5Xvc7s9z2psxH8kpnKMecz4mFPQz57uC1WZOA5b7fq20U5FW4VZp0r1cHYczDM
	k+UkyBFccjIDOwDx298YKtLcbWYw6uc7J
X-Received: by 2002:a05:7022:f512:b0:187:efba:9ba2 with SMTP id a92af1059eb24-190a84c55a9mr4905128c88.44.1792662721799;
        Thu, 22 Oct 2026 02:52:01 -0700 (PDT)
X-Received: by 2002:a05:7022:f512:b0:187:efba:9ba2 with SMTP id a92af1059eb24-190a84c55a9mr4905106c88.44.1792662721247;
        Thu, 22 Oct 2026 02:52:01 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm15742170eec.3.2026.10.22.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:52:00 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/3] ICE: Enable runtime PM support
Date: Thu, 22 Oct 2026 15:21:49 +0530
Message-Id: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALXc2WoC/yXMQQ6CMBBG4auQWduEDmqCVzGmocOPjpGCrRASw
 t2tsvwW762UEBWJLsVKEbMmHUKGPRQkjybcYbTNJi75bEtm85ahdypwY+8QGv+CqeTUsvV1jSN
 TDseITpf/9HrbnSb/hHx+J9q2L2ZT2vp2AAAA
X-Change-ID: 20261022-qcom_ice_pm_enable-3c5d21b99e42
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX4e9OoVDRKKjI
 kEW7jHiGL4WVRwnnmMmfDJUELz7lPn9QwUBLdlYZ2q/s4UdubEq9DUFzriLROoD1RTk86XeH35+
 FUxauhTcqweGlcHnJsFloCmn8PtL1mwfCKtIPpPcXzetQXIMT90jEhiDHadt3jOatr/SIl3gvKL
 vo6xw+2UaaWGkrn0zb/3B92jaGX6ji8QrjUteIv9NKq/IrogKPAaUbPfEEhN7cDpLVstBIF3MDs
 KQsSyg/kxr5py4pM5YBWurXgm/7e+xQ2+A7TSHrDE/OfzwDzZy70sNBo/LENDRBED2Xt+RxPKVQ
 Bk7GAYgOFVvMd3bB9P33m6ffFUbJiTVik0NtTM09JVKea5yj+BnzHh+A/as+MzHREvX1wz4KJsN
 vEf1DcahdPRXNQbRYRZdrhV+0Zkt3rX//kmbK968THWHXJZrhsVshUsPiVWuddJFhFdU/JyWTeu
 Us9bK8gRYV3611BYbiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX5wXsl9QsSp7G
 PPPBxhfJFL+LUNV83f5hKzHquFWkVxkTRF1SB4CpMEDljY6t0JLkDgwnvipP/Cc6XofGvG0yCCD
 HfOrHnXhTZSRjMW1FniNKfhbujCq4HM=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9dcc2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=q2l7TY2mCMnZi5pTjLMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: bSVoKLdi5YJOrnKUhWZ3l-KWFl45JADN
X-Proofpoint-ORIG-GUID: bSVoKLdi5YJOrnKUhWZ3l-KWFl45JADN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220039

This series fixes ICE clock lifetime handling when ICE is modeled as a
standalone device and referenced by storage controllers through
qcom,ice.

Currently, ICE driver enables clocks during probe and keeps them
prepared after probe completes. This keeps the ICE clock voted even when
the storage controller is idle. Add runtime PM support to the ICE driver
so the standalone ICE device can enable clocks for probe-time register
access, then disable them and remain suspended while idle.

While enabling runtime PM in ice exposed couple of sequence bugs in
storage drivers(ufs and sdhci-msm) as any key programming call used to
go ice and never complaint as ice-clocks were always on.
Example, unclocked register access happened from ufs/mmc in
qcom_ice_program_key().

qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot));

Fixing this issue require ice instance at early ufs/emmc probe so that
correct sequence is established and ice is ready to accept key program
calls from blk-crypto or any explicit storage operation.

Merge strategy:
Patch 1/3 and 2/3 are storage driver fixes and should be available
before patch 3/3 lands otherwise will result in bootup crash.

Validation:
Tested on shikra-evk, kodiak rb3-gen2 and sm8750-mtp.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (3):
      mmc: sdhci-msm: Enable ICE before enabling crypto support
      ufs: ufs-qcom: Enable ICE before enabling crypto support
      soc: qcom: ice: Add runtime PM support

 drivers/mmc/host/sdhci-msm.c |  21 ++-----
 drivers/soc/qcom/ice.c       | 139 ++++++++++++++++++++++++++++++++++++-------
 drivers/ufs/host/ufs-qcom.c  |  29 ++++++---
 3 files changed, 142 insertions(+), 47 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261022-qcom_ice_pm_enable-3c5d21b99e42

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

