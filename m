Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C7C38330A
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792207546; cv=none; b=e9AnAgKE4c8ZuQTd4Kg7V1fiPsNelQ7yqmdSIwLF6On4ZlyfRPl1OOUP+3h2irx2eeTzo09YwvfaAGRsvVnToSkYvMyeXFLN/6pdyqg5FZh+rLtVIUxO764dZqLbK2kO88iTBMsE9J6pAoazRUl52P0HtTgTWchqkkNUKfxh0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792207546; c=relaxed/simple;
	bh=7xhhEFhc5FWmoihtNUDA25SO/91fb9nkW+B+vD2NgtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bH3v+duz2TYcFba1Qqp/rvpS0y2nzOL8E+eVF0qVF9c5olI2aqP2lvYIIReSyiDsDHNXp1z9/eqVzPStCXpV19sBGhRLKkW4CvDxWdl5IrAQgnxfc+49vsn06AEcbE5SAqvaXyP0yzHUQ7zPb83L4554CBCNKD227/ZZ1JCsWEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3/k3i5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aExotiJA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3/k3i5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aExotiJA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30XZr3074283
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u02s+P4ghOqE3a7TA/QqWu
	rrs+yx0It5QXRpILne/H8=; b=H3/k3i5Dxk2csuDZKNrdZv1eK5DHAZsBS0LAeN
	NtHWYq7vOqYYfG7qkInCu6cL9m0jUZFCowProXkeuWdz8vRRRLxOqVOiJ0iuxGlO
	Q9U3J4a7KVgVu7z5dJyUjkolTLMMiSHMFm6GoD04Mb+u0Kmp9uGlcqUBi3/tuCAU
	adk6JWlWsL19X821YD/XBxTVAepnxwD4kDnmV2my11f17hDmpTVuzQHjdr61OQ6p
	QU3qJ5LpZfaJ8N+9pOD29UUV8aJg9/DoV1g0ZwweHPI1+RdEOYc0z3ahSfrSbfoc
	CAmoYOCPi43uxnl+T0bVg9eNWpH4Y4wQGUJLckkkl5V4F1pw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur36qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:25:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2891393eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 20:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792207543; x=1792812343; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u02s+P4ghOqE3a7TA/QqWurrs+yx0It5QXRpILne/H8=;
        b=aExotiJALFDY3Kj6ECIEeQOzUQROdhOXEqOVpG9qpgQbEY7HwWWty4ty1bZNECQQm7
         BnQ+TI6Q6TxnGcjAiURGFZJUZALrCHVBSin1fV+aHSsxxRyZR//mMHytnWMhqe6qgnVr
         3/qJ+lf//XIgBaB7/xl3IBnVIZfL13t0ttaFoGoaVfs1gC1iP/PHRdajG2mTwY+/AnBN
         ATp1J9tcNk9UaRxOC6fcgTmyJHBf977Sq0psVyqJP+9mImhJD7kVhgeV15GCItoQbnWz
         s2qo4SkJH1jqL4SqVe8apHyWxFLoAJvfEq4eV/ccPO9Z2MlWUWgBlGpidB/qzY4NWcVK
         0eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792207543; x=1792812343;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u02s+P4ghOqE3a7TA/QqWurrs+yx0It5QXRpILne/H8=;
        b=KP0eofpg1sQxBuXOLB9UCSHHk5DpVy/PZ8GGpi5SJ4629SaRhEqikVsta3Kz9JNDrS
         8eKu8nmHqPcdp9qOWIE6tZwzbbZycD8djvY+1dZ4wse9aesIMvMg5d0Sv3jTaYn+qBWL
         6R71sW6A/9GzFIo0pGh5XyGsMXmpliRd0pSzgDGVBic4ygB1zCAwBM8mQYjvbaZxluyG
         GGpTWPDYrjX50nvq/j+jEVylvbTrI8XQ96Ngj1paMWXaBTFhlh2dw3SHGr1owPNEvKCF
         X8SEkCqS5uPQ6rlyb45maGwGvwI/wsWCsUh9qpSzoDQy+teqI3fJaMqqhvgc4ue6mbsR
         hNhg==
X-Forwarded-Encrypted: i=1; AKwUvBynhAgElNDrssMQBPjufNj+M22NxUVcrYKkZW7vBnFivWUNwg0g4ZLgPeUTbREojA8yatI8/My/I0iyIUwj@vger.kernel.org
X-Gm-Message-State: AFq9FYLf2//HucFoRM3tEdxmGh+XXpR22+AiV/KTlIZxXLqme97gyb3R
	IjH4JzBOLwjzJwDDxWVkxXGVyIcDNSiYAlRUJE3Xc+cyyuxbY+NO2YuRt8kMMtveqVSd2LMH3PO
	fqh3fU/82JPDPFcozQcbt2G/vW7ozrcHyH4a/bX0UEVa2e9mDiuBpUsXEJXJRkgWye7WC
X-Gm-Gg: AYBFou2o1SFLszb1LjD568W8xZIRGBNypXRqAm3AbFJGbzjRB6wIMzBSZHa8NtTYaDi
	41YungsDB8d7nJFqqvAlIU7YSZBg2xFrH5HAUQAESH2zV7NC89wR3kNu3tC/gMxxkJIHw2fdT68
	/CrKcdtsSdUp55bKkcadz/sVmiWCMUF7dF9sO0JJoBIFr9qiQ4G9akjpTJfvnFF52Cl1ob15dCQ
	hH1JjCKkctX4QeIepJrjWX6U8T5LHD+fyt2SQAB88wh/08kGWgD+Ne7JV9A+FyXDehTxfW7xh06
	1sgn0sFQrqCT2I8b5GqYBYtUUkXNj4nFM6uP7+GTI22YQA3psJykgjOF68nZgExOprw2vI1IV88
	iUrSqfAlmZchtxCB9vFqoXdXTo7xXgrY8Bw==
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr3151669eec.37.1792207543169;
        Fri, 16 Oct 2026 20:25:43 -0700 (PDT)
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr3151628eec.37.1792207542597;
        Fri, 16 Oct 2026 20:25:42 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm19471422eec.24.2026.10.16.20.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:25:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 08:55:04 +0530
Subject: [PATCH] media: iris: Fix out-of-bounds read in timestamp metadata
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-fix-oob-tss-v1-1-fb86f4cabf65@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI/q0moC/yXM0QpAQBCF4VfRXJvaWUV5FblgdzAurHaQkne3u
 Pw6nf8C5SisUGcXRD5EJSwJlGfgpm4ZGcUngzW2JEMFDnJiCD1uqlj5gipfknWDgfRYI6f5qzX
 tb937md32JuC+H7iOGupvAAAA
X-Change-ID: 20261013-fix-oob-tss-7d317d612cf0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792207538; l=1952;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=7xhhEFhc5FWmoihtNUDA25SO/91fb9nkW+B+vD2NgtU=;
 b=LawpIaPxZ27QVFYN1j/PsdMUYUkUeHcxEYZbhURka8kqTxRctzFKAWtptPpfe4EX8OKt5hOXs
 ET0PEj6Z96bBvC4eXFG2cwmtERy0NzJyjlMDG/9euQp9JG5mBlGyiGT
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfXzWD14EDBlK+w
 kxMzQPXGdUOuyMr4Mn2kuMwDJrLdKAMcSxugbAarrvmBn7F7oILEAujatd6hg56C80XY+obXadP
 +RSC1bN5OPf+Sj35c7KnCP85prDbeS2LyKFLgnlT7xLvrIZAl7mxSOuxUTv9EKVUZk4c0C8s8Ru
 irx7FSBTg4DAX/8dUsIfU79o3kr91SKMNSdL1G1/q3R3ercVi6x14JxRmic9D4q7UVHLoKGvvbj
 E9wL9d6fw3w3beyJb5/tSvSyoA8RJMaAyfKv5ph8TJiQrm10L27dpSa/at02ZbzYS6RWAfEAaJ1
 5qUrWTSLSGslhclX1UEe5OyNrbNA59ysIhMXPvlCBP/gpfWI38LKqrh0hmHFQYdM0V2ncmW65hp
 WpW8RfWX0ENJfCkInncjKT1OdPrywbE7H51miBZxcyWjjPV1R1CmQCRmUGXf9S+8yYgJUFAxqT0
 eR+2fWsYD/jLZ4UAnxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfXxQjpW3xnKXgD
 enxCqgfoAcfuZjfHuHdH9eb5Z7Hk0+rJXa7B6hLxgOV/ENTb96iiDL5x/pnytd+MSCTjc6l4lvQ
 RfFf21AnRIyhZU3Ff1jGRzVk9+xxEF0=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad2eab8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wraWorUZ4TRzSvnLzhcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: WNdPC8kSPEfWfk8j96QtaM5FzJ5X3Rvt
X-Proofpoint-GUID: WNdPC8kSPEfWfk8j96QtaM5FzJ5X3Rvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170012

inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
through 31. iris_set_ts_metadata() writes at metadata_idx and then
increments it. After the 32nd input buffer, metadata_idx is 32 until
the next input buffer is queued.

If iris_get_ts_metadata() finds no matching timestamp in that window,
its fallback reads inst->tss[32], one entry past the end of the array.
UBSAN (Undefined Behavior Sanity Checker) reports this as an
array-index-out-of-bounds error.

Use the last written entry, metadata_idx - 1, in the fallback instead.
Fall back to slot 0 if nothing has been written yet. Even if stream off
and stream on happen multiple times on the same session, the fallback
always uses the latest metadata received.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f..31cba99a665c1 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -865,9 +865,11 @@ static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
 		return;
 	}
 
+	i = inst->metadata_idx ? inst->metadata_idx - 1 : 0;
+
 	vbuf->flags &= ~mask;
-	vbuf->flags |= inst->tss[inst->metadata_idx].flags;
-	vbuf->timecode = inst->tss[inst->metadata_idx].tc;
+	vbuf->flags |= inst->tss[i].flags;
+	vbuf->timecode = inst->tss[i].tc;
 }
 
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-fix-oob-tss-7d317d612cf0

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

