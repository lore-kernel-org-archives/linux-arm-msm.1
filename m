Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810190;
	b=fgM0QEssPN+gBH86Jdu5PIcdNJwdtAbyw87TByZrJ45Ulg5PUDnrvITcAgmT7sPB7X0B
	 z5N1Dj9pzuq9KPn21phlpCmxuapzN1/evamC1q3CCeyjM0s+2+1wVxalFJgR7t6WNCZ0G
	 noDmkrn3SBhDT+ivo6DLhZgMCRDfaEiwvp4v6mR7EGnDnREdd4eGsCD9BmI01ntNW7eFo
	 iqcxlMK/l5NVQlUuIa+NqBYRSGnCrLFwM6vJxNXeSJGKbOhHtUe4XyFClDeq86zhv+SYc
	 3qEodaeLS6r0i7GisTYgLnB/vq6HE/Pe1tykivBB+uqZbvCTejNTKTEK7JhDw1n2aDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
	b=NW63yJOa9b+q2ucpbqIeP9DKi0bjMF82Q2GyDqPrQIBRZ0zKES4mKGNYaIpjs8b65eCV
	 fYQMi+boHFOb/x/ICeFOEY2oUmvb9/AHlWzqav7vvDfGngu2nu7m7zj4wq76QT6NJS6mb
	 ejlcx3aF8WN9w8CYSJyYOhZC1iW6gWBcziTn/i1ftPAOOxJb0o4yMhWqvbzRMm3AwgMVy
	 EDzeqSDY5RVA0yrKOPJ2FAg2VL6hxhqi1Na2dpNFHTFsUD4tw7Cz3geFOkWplLkvULAGx
	 eZxi/AkAHDfgIwH1YBA68Jrk3vEMsFopJEdBgLEkHWfwfpU5JH9UldTgFhszL4QW5oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShPH+nR+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkOHByB0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E93606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E93606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShPH+nR+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkOHByB0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4GUZcB763885
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Q97qnHrubmaTZHUF0bE0e
	dWN/XleOsKgIjXjH28YHU=; b=ShPH+nR++KomY5SgjajC/D5f0fxgie58a2bOjo
	6pmVBhKn4bC2VH5fuEZEfXJk08YRoO9VjBVceiXeaq97T977R5fBWqw8naocWcoG
	sJdwpdN5yFmHlJgvDnJoP/OyCcQsPyqUp95vkboN7jK7M/8EijXCt8PBSwVjpsZl
	8zbjodETeI2Y9FNHcs22jgvLOhF2+BN4F2gUmimH3yRaNRZmzcbGnIntrTibI/OK
	qr/Ky7dGBjp8RbU8deOUb78Ia5wg6q1L3kZqmCLefhe0J/8Mt7lMsw9qqmriv8so
	AfIX4aV3CVlebJKHjJ5jYzqsuEHg2y3bFfiud5v9oSLrysYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89sr172-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:36:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so283794885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810189; x=1794414989; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
        b=dkOHByB0acCDa17DbFUUlUT0s9sFIFWdICJs+9q4f3Dspze9OKJHqK9LrpN8SkOrDh
         9xzi2zlUgZniRzeCPMeMlnvgQgdEx/3Vs8+oQbS3Ch9KftNrVrY5HFGscBoZEuHUzff5
         Xw9lsaAeovLQt6U8e0xUJ9LysXXBWInUwxCBGwbJeqahzK7I772/wTehUXxve5Nl8ews
         cSLPdOBMf76px4rWW2XeFNHaTxn+jdv7+AyKh/D3x6hJtNTRt8BFdw83TnNzT1sotvO5
         xjPZrgPMhTvwP1w3tKIX8F/HoSqIlNOh7TddtgPqZgm54jI++B0HAKZ1OaduEOif6ndy
         59/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810189; x=1794414989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
        b=QVfUnn9zmwtsuy+YND2Y7bheJq2tAtK+QYWYpZcgUUb11GV2Esf3hUzNQW+aL1guDt
         QNSHrW1k8Fr2Q2Ko1U6ewbe4h5P0sTyRO2xaMvhAhzpitr9g67GitDNheTTI6u1TBMBH
         E68pYHLzRMTUuf1C8k/F1XJgkrq7KqUCaXhGqxL9kbNPq8ZiBvjL9waklZcPgJYakNVh
         vvxOaO4EIHX0+w/btn/mTwDi7TmATvQc5rWD7Yqfxe71qIs3xDQB0GANOTuC1GRsrHUC
         5gDctwHjT+Ffwf1wuhxezhT6sQyYpxEhv2h5aV6WfUYXYCqFbU5bhrHww021xbr3V2gT
         RbMw==
X-Gm-Message-State: APuU4Z+N6zyZ0+DwPejlWpS3MBTUeLoTdzMBND8anwDrQpLN+lkNsPwa
	o73m2fE0dRHlbsNgx7oVBuS/3CINjeQgL69bcyXKtbbojwYo8olfX7eUv3oiF5HuHe40vWgTxCv
	z2u2CQcIMAnF9GokhC3hzKwuMGiaDOZMvQU/wRsL8JaSUUCqlaDYchbPDBgb6Dkt9sQ3A
X-Gm-Gg: AYBFou0JlX7s6hFOGd3i4wY8+PFzZHSaPCokqNAClyjM+GLyKYVO+uUx5O+udF/hDhv
	YTtUqN4gOZWXIN+87mqD7N1yZzDXqSZcxvpMe9RZqkXTu5TrEp231JGiosJDmy/fFSb3HY8zSsD
	N7yzsvSBwCQpdCYRpaIQ9nO4K+jcR3jIDvaeEYp2q3VzjyvnXhBBUOMzyxmbcuWc+2al2Nu3pHa
	50lEo6f1nMLKHH87Tx3Vd7AwG6qN0pznR3t/6sii4jh9EylHcO6fx4mbVNQGLFbIKkHWCIggV72
	Y0soucDDVCvkwWBFNl94OzQ+DxmrocJgKXSEJNnSpxqL3nJ57qKNgOR9V7oTOtjJmBb5cz+csAj
	BbrhZoQK+GaJmoDNcRg515RlCz4uuX/Ag5yXuA6lXxDMJtOa2n2mVYpKLOAuoG+I8bA+YegyIyL
	kVFEAndfsCd3BQdPsLcnC6a+m8O4yjF/2X8BIvTyPAH1e9AjPao/pxgbiggmtiyA==
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3042995285a.69.1793810188455;
        Wed, 04 Nov 2026 08:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3042988285a.69.1793810187938;
        Wed, 04 Nov 2026 08:36:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm, media: define the UBWC buffer layout
Date: Wed, 04 Nov 2026 18:36:04 +0200
Message-Id: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPRe62oC/yXMTQqEMAxA4atI1hNog1icq8gstEaNoJXGPxDvb
 mdm+S3eu0A5Ciu8swsi76IS5gT7ysAP9dwzSpsMZKiwhhxuzeGxC3GqV2yDV3RlTsaVbHNHkLI
 lcifnb1l9/tatGdmv3w/c9wNdQwP8dAAAAA==
X-Change-ID: 20261027-ubwc-format-docs-7942079e1472
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4SH0JW1dB6WJf33quabAd7eWZqAqkw4IMlKiqa5Y7Dg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq6173l4RVxdwRlHhknfY4lR4Zsy3zNSfsaf1M2
 G+W9EjzeIyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute9wAKCRCLPIo+Aiko
 1QfaB/kBUdmO9yyqMW6ounuavi0h7rwPMCooaVSZ1lAWrvU3DhazqXlPzOzE007FWwQ36OjMeTU
 WcVph6vBSUSFtxdEz4ikzgDuN+b9NUPDF0AkhMR/ch3YJ6sZ46UJM4DHKy+KRo3pnsP6XJ91UuL
 /UZw363rTFmiI/Az5TBj2mEzq5mhxRutwCoAjWwqhWqxShKc2+o5UHkY+COMcEfe7TP52YFeWoH
 6xUxbFwtPr7EwPuF4ZZBvqQJ0mchfsPR1YWPMEJAo20H7+AmM4I5Nkn7shnMLz35G78lhhTs8kF
 iQwL8udwqPdjUA8GBrxiKHy/MGK7TWD28DmoyHeV98WXTV7A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iR6qnnIRZWuXGR8-Adjs9AURC42WBAVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXw4lZLebiJH/z
 +ZEmd1HgzL5xDNH6NAhYgcb0sIOfr1HSNTOMRw/r2xNdrXoSJCAZan4e8ELXMAUBsob8+vWV3Sn
 5OWJTqOPt6nS/wv0bSU4MoW1NxBhqsP4mEUa6D67FWvNKZspIhV7skKcCvxqdQGApYpHDg5uis2
 kiRd3ghgtFdlLu81vZW8BvWjzvDd9aof5quj9POI/0RPpiI9uD7vOqEbidiFJIKOvPPAdNwSWR/
 nmpahKWpY7Ene0/Ah8FvdD8VPxs2HM4VXo11+QThcwoslw4x9dD0SWoAegKxMyYNpW+MYx5OVLU
 hU/PHoIecBRk8grwIA8WM2QqFlZHWXcpwiD7X+f1CWvjHoTZIRpNS6o0aSFEX/FbANEXkowcJee
 XdbD2g6be26rkfd6jbCSx56ZUE7HGwkbfhKevAi8LCBn1MVPz0Qjpf7i7sclcqX//0c4KzG6DyV
 hGh4oM1NBMjfYLxhxHA==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aeb5f0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=D__o4bQJyZzLvQ_PEqcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: iR6qnnIRZWuXGR8-Adjs9AURC42WBAVi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX6tzaZtWWXPSq
 Umy6wDaL2j7/AHEqBGC9R3xxkDLZP4+JCEYseO6IX5IAeg4QNpDomIPXggV4GpHnF57bL6nmgZg
 fSdHkPUO7g5c7nGzKJiN6istuyBCUzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

The layout of UBWC buffers (DRM_FORMAT_MOD_QCOM_COMPRESSED, V4L2 QC08C
and QC10C) has never been written down. The V4L2 formats are documented
as opaque with four or eight planes, the DRM modifier as "macrotiles".
In practice the video decoders, the GPU and the display controller
exchange these buffers, so each side has to reverse-engineer the layout
from the other drivers. Nicolas Dufresne asked for a contract to know
what the V4L2 plugins have to compute when passing decoded frames to
DRM.

Writing it down showed that the display driver never validated it:
msm_framebuffer_init() checks UBWC framebuffers as linear ones, so short
buffers are accepted and the DPU reads past their end. Patch 1 fixes a
misleading comment in that code, patch 2 moves the layout calculation
out of DPU, patch 3 checks framebuffers against it.

Patches 4-5 document the layout for DRM and V4L2: metadata followed by
data in each plane, strides, line counts, tile sizes and alignment,
with the chroma size rounded up as DPU and the vendor headers do. For
NV12 the CbCr plane follows the Y plane in the first buffer: DPU has
always fetched it from there, ignoring offsets[1] and pitches[1], and
turnip reports offset 0 for both planes, so this is what existing
userspace relies on.

Patches 6-7 bring Venus and Iris in line with the documented QC10C
layout: Venus reported a wrong bytesperline, Iris called the format P010.

Mesa 26.3-rc rounds the NV12 chroma size down for odd sizes; that is
being fixed on the Mesa side, before the layout reaches a release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: fix the comment on the RGB UBWC plane count
      drm/msm: move the UBWC plane size calculation out of DPU
      drm/msm: check UBWC framebuffers against their layout
      drm/fourcc: describe the Qualcomm UBWC layout
      media: docs: pixfmt-reserved: describe the QC08C and QC10C layout
      media: venus: report the QC10C data stride
      media: qcom: iris: describe QC10C as TP10

 .../userspace-api/media/v4l/pixfmt-reserved.rst    |  63 +++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  84 +----------------
 drivers/gpu/drm/msm/disp/mdp_format.c              | 100 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |   3 +
 drivers/gpu/drm/msm/msm_fb.c                       |  39 ++++++--
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 drivers/media/platform/qcom/venus/vdec.c           |   5 +-
 include/uapi/drm/drm_fourcc.h                      |  54 +++++++++--
 8 files changed, 247 insertions(+), 103 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-ubwc-format-docs-7942079e1472

Best regards,
--  
With best wishes
Dmitry

