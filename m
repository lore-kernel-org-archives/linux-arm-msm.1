Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4704657EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627641; cv=none; b=E8RL4hT8B5efQbwwrffT+AXiZ3M+npNIC54mtRtwuIvf0ASHu8bib8Yw41eiAfiI4PEkmK9OdavFiPQjQ6QAeKarb7fgm3IVdNAkTi038FhbJbwLn6W7KbHzGZoNtJc7kxTC8kXkjwVbD0/OaiFP0B+ZppBzU9lpVanh/Bn3cNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627641; c=relaxed/simple;
	bh=h/I5qtQCyzhc0DcHlJvNKASagwuTPEwMjUgB/gz6q4Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g/pSkzHsl+HwMZRk4C+jO8vLTnD4eRJJcpVVz0cPCsvAivb/r6RN424+QAUIKheTyMHakDVPlVNhf1AV5mhLWFFuptBg777yD09pLYDvzAhxJgGkcYXbROHRJLHjVdXzoq8dpxR0ACOg6makLGfoAyKkjqPxcolK2SKsXS5QnGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxjqEHp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aisp2oeH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxjqEHp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aisp2oeH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8g42g569822
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s0Ad/kTqFIEVVHlyxWbVsM
	ZZs2OLjnk7ipym+9asjYY=; b=bxjqEHp/JB3PChbSsUhCCjsZVSN3i9MN+EwqhO
	b8zqhIMFsrN8iB54J/1Bvh9F5afhslJkpWLJSwatPS9LGMJGm5nu8c/2iPsnOaPP
	ex6OlJBkcEgy6MDvKECWACjh3Y6+ZSMrGmQ/+lrXgLP0qx56Z2Jlk1O+jlLXQq0s
	0jbsoue9jia7XxylrGw2cApsGMt8yEjFLg6sDURWZjEFejFi1Iu/5uargKSeBd7e
	ucLPkZh42A7i4kM0lcvBcwoJXehRVTv97PCulRj5rxWfMRcBuDbbyWTvdk9oIs7H
	q5wDyaZz8nx1ZKOc6g8bgo2aGQ5gjJI9zoo9O29ycJXqRQdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvskwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so12782065a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627637; x=1785232437; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s0Ad/kTqFIEVVHlyxWbVsMZZs2OLjnk7ipym+9asjYY=;
        b=Aisp2oeH5vlx10bnD9ajf92dkssWeDTD/uUQ+g6613P2GUDDBFBL44YvLmBQ8bu2LD
         PQqwgzkpdrGTEcxLvEXKdQ50ONIFfHkCLa/uslCL+MAhqh5Z4mRrRqrkrH3HbrawQTE0
         yZI+Q0HSQWnZ/UA8JGi3jKufxuuGJ3YFIOfVMZhyW0GUvsLhMR6OyqkCFmNCWaQV1XT7
         BfW5vp0o0EvwHsx34ycHqJTTedSXzQJaUC02yiN7J2D33diQv0iTN+yTZuFxj3dozLtB
         XSr/GmvdRiWt/oSipcUbqr6WQvdfsQ2fpIk2HXF5K+dZrGFbgJo+W7A0uAiNkrcE0anE
         OBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627637; x=1785232437;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s0Ad/kTqFIEVVHlyxWbVsMZZs2OLjnk7ipym+9asjYY=;
        b=Lm1Y6pC3XLnOjCkap/pqcMI42QkpEE0+Jru4AO11Fk2sYaCBM7+UbkaW8CV+3Rzf7Y
         Yye1h3+YyDU63LoUvGAVaVisz9r8ws7/8s36aMrCpMRe7SfaJfh/EDjLT1F0WqQY4Emh
         sNqhNnIffQ3QPFua3u7dAlXl6T9onW+/du1dhOHZ9aYO9H/9hxKZYUw733gxwKo1SjiM
         4yF4I1DyQ/S0m3TtokI6PCiPzKf2BGI2oVUcJz5QvfzSW3hM3d7Nmju1tykwEODSNJFS
         WG8kJMTWXS7FJEiacRJqrH0wsI9No9ONxZtaQT0TVXo4/OJoK0vvvYuxX71hqsM4XVIq
         Jm1A==
X-Forwarded-Encrypted: i=1; AHgh+Rql3nkGnJLZuDZhROqIzpJrqsXo8cq218BASL9gdCVql43/fUnswNbGB0pBZhh44vwyJ0LwvG42ngkAwZAi@vger.kernel.org
X-Gm-Message-State: AOJu0Yywt9aK8EkyjkvGU2maQxThMpwmwLJuAq0oi4/tkKsOq610YWMG
	DnwF2m0iX3V5Js+1qKg24noSFacdJP89ixHXOyvMZ7fQ0G+3manUE8BogU7S3mzNqYokHJC/Q7y
	5fqPEhbC6PpJDSMbKs+r+BwNpzXg19xqKYQlLTOEFy+fIJdBDTBosJzEs+Cayy/HtgHOC
X-Gm-Gg: AR+sD10B9v/yOOzk4bFr5G0n/Z5v06T4Uu5QLomRZJ2YgrAaujAq1DEn/SrMQLNVg7I
	We580GwTvpPGh7zozNq1dO2CMQOg8oxgFOnP+1TkRWrUg/e4TRssd/6qJV3/7HMEC3cgL0awvEn
	RnLDSS/HadDbNY9weQOPwf/QZxHJh61/kBg266DJnYRx7e7xS9AY6SB1Sms7AtXsBle7h9J2tli
	MXfuGF8QpB5OAi5vhek1kmZZziaLJ7qTctnc+H6a2tXTENgYezRRNPlwy7BTMD/CEteqSaq8ji4
	9OJWzH7MlnsMxoyKe56zXUqZnYt2nOZohnlcshbTOHyAAeIYsMOF1HdFnbj1hicXrYVs/KIkmjx
	iUBlNMlQmKOXQL+Vj+UuhI7uQ01r5OTo=
X-Received: by 2002:a17:90b:5251:b0:38e:76f8:fcc6 with SMTP id 98e67ed59e1d1-38e76f91cacmr8851077a91.32.1784627637196;
        Tue, 21 Jul 2026 02:53:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5251:b0:38e:76f8:fcc6 with SMTP id 98e67ed59e1d1-38e76f91cacmr8850991a91.32.1784627635789;
        Tue, 21 Jul 2026 02:53:55 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92064c77sm1285462a91.1.2026.07.21.02.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:55 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: iris: add multi slice support
Date: Tue, 21 Jul 2026 15:23:31 +0530
Message-Id: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJtBX2oC/23OQQqDMBAF0KtI1o2YRBPTVe9RRDQd64CaNlFpE
 e/eKJQu7GbgL+b9vxAPDsGTc7QQBzN6tEMI4hQR01bDHSjeQiY84TJRTFJ06Mt+6kYsfYcGaCZ
 TxXNV6UwKEt4eDhp87eS1CLlxtqdj66D6QSnPj9DMKKOaG8GVZBrq5mK9j59T1Rnb93E4G9+iH
 61774NnvpV8t6k/JKcJ1VmW1KyBWuj6SBbrun4AjTLhgQYBAAA=
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627632; l=3281;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=h/I5qtQCyzhc0DcHlJvNKASagwuTPEwMjUgB/gz6q4Y=;
 b=OIHB7iJJH/bsljDJ31qY0FyhTE4wdmTMhwPPlBzDfsxFUf1wlPmdbAmTh0s06wJQEF9X+4hLp
 RfhJsRzSt37AIOLyNreinrweTbtZK0OHlU1r5pmJzvbcpAq1oQ3rQOH
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: L0-upoihNEDC6CrYpYwnaklh_nNL9KUd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXwoxbzTZkAOFR
 CU/+PnrymZxLu/ZLUAZr4KrRnFDtGysiqdt2NWLmzPs/8sdHJ7plprlIh8YvEHO/IbpIRwNmuCW
 ll8Qvi1mhf1VPxZZ8NDZO2hdbPQ/J2k=
X-Proofpoint-GUID: L0-upoihNEDC6CrYpYwnaklh_nNL9KUd
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f41b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AsnL8gqb6cm0EwA9_ewA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXz0auS8kopZ4n
 XXHT2sNCELFeVFSTnuuxxES0aig6t0Y1sk/Bleg2DAvsd5mPfFob0zsY61WoTJZ3auHLJHdDz7p
 I1gZpnFbthKk5zJf+FMbX+VDRGKOTh7EB18+FKRGhgjsY61qP4QRwiWp0OcpfkcfQ1EROvKYJgy
 dC4r4x3lzuXBjdQC74OnlFiPsXgp4XEM2XbKN9OqhxYkrgHERm5w3Ichzwi+xZFXYqnvKa9ZXon
 ezrnlFvRFje0/uXndnkUw4GTpSIUjxRCcoG6fe7+yeVDocp2htslbZDzdzM2Z1/o/aGaSiuwnvS
 7OmMMkG7Ukg5KqmWo8JkDlEvEN4RvkqoXOckIn5PhPFWupYls0BRyTryyi7fG7EVuk9cNYVTZJ7
 OQjTJ0XCmW+uGH5almelJOLV10xvAijnDRgHumytIBbocMU8Hg2PtDuV3oHC1akdFJ7PHQCt6qL
 wv+2zqnCgVWW0D6EYgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210104

This series adds support for multi-slice encoding in the Qualcomm Iris
driver.

Multi-slice mode allows encoding a single frame into multiple slices,
which can improve error resilience and enable parallel processing.
The feature supports two slice modes:
- MAX_MB mode: slices are created based on macroblock count, controlled
  via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
- MAX_BYTES mode: slices are created based on byte size, controlled via
  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES

Clients can enable slice mode using the V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control.

Patch 1 is a prerequisite fix: iris_set_stage() currently always selects
STAGE_2 work mode for encoder sessions, but CBR rate control requires
STAGE_1. This is fixed by forcing STAGE_1 when BITRATE_MODE is set to
CBR.

Patch 2 adds the multi-slice support itself for Iris HFI Gen2 based
targets (qcs8300, sm8550 and other SM8550-derived targets).
Support for HFI Gen1 targets will be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264

Changes in v3:
- Patch 1 (force stage 1 work mode for CBR RC): cache the computed
  work_mode into inst->fw_caps[STAGE].value so buffer-size and
  clock-frequency calculations stay consistent with what is actually
  configured on firmware.
- Patch 2 (multi-slice support):
  - Use inst->hfi_rc_type instead of the raw V4L2 BITRATE_MODE value
    when validating/deriving slice parameters, avoiding a mismatch
    between V4L2 and firmware rate-control enums.
  - Round up (instead of truncate) when computing the minimum
    MAX_MB and MAX_BYTES slice size floors, so the hardware's
    max-slices-per-frame limit is never exceeded.

Changes in v2:
- Added a prerequisite patch to force STAGE_1 work mode for CBR rate
  control on the encoder, required for multi-slice encoding to work
  correctly.
- Addressed review comments on the multi-slice patch (updated commit
  subject and description).

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: iris: force stage 1 work mode for CBR RC on encoder
      media: iris: add support for multi_slice in iris encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 87 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 12 +++
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
 8 files changed, 161 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

