Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD74BD348
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887432; cv=none; b=AWrF97sju3XDzUJxj0YSX8rJ8Qo+Oh68aJCXddv0LbQoWzZgvyHaujwAXKBAqLhDNTFl/MSYHDmiwp4Ez3BjWgTHO00ckBI4efQLHeEcAMBFQ48adrDJhQzcWGlEYp1PPu31XUyWIlitMmYln5wLaWG11ZFLeDUmoZ8sO8nKNfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887432; c=relaxed/simple;
	bh=llUSfK/j52895Up498qaYYkhoVfBtms/teGO4gw9de4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QuMMr9YKt8Bt6Kwf70RJe9m0tx677uHGsfBADrQyebGHl90666xFxF/f8YOpzNHeWG5U0IxA1WxycxjWJZr6WDSqvVc4CDs9LOlx00XcXxLUTVGP6JJ7A+c3uIM8NpwQRJCpauVTSFE40goPHZvT7DwhIq0wMJ5NBkzuNYxFCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyBmbbDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEMfScuG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyBmbbDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEMfScuG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D87nQ3988768
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i8/Q4Tq+4DZuh8QWu6beqC
	0Jl3juQa3zTScBd6grHSw=; b=UyBmbbDZT32sylslpoJIJjCZWWne/CFTe7nuUN
	+0PkAsJIkRpr1xIuhlvUc0ekv1U2y/apFjgTmNoTRQgZyTICSZlZqysUfYC8gJqz
	YXEmg1pq3JJMOEuWAuEiqfySSZiarVcGRD6pTuym0VaGW7abJEeZvNQ/sje0BQxm
	qXm2leegsgzZLCxj58MxhjDUVHkvqVvNYJ0IJnHKO4gbVnUgNeAE4ib8R3MfhFN3
	czM+UAEqH5IKns8/25Eoi69nwxlldd/rgGzdyJOWzmtU/xT1FQIlhhmANnqvM+Uq
	2p4LUZGqijQ/pwZ8XTC57RNycTP6WACybKAAmiEK0rbv3G3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso628909385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887429; x=1792492229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i8/Q4Tq+4DZuh8QWu6beqC0Jl3juQa3zTScBd6grHSw=;
        b=fEMfScuGkS6Au2LwbLgBu/EGRk088/exRNhNbRQxtNwFNKbOL1zS0AawCynt9fbvgU
         q046qwWG/NE7YeFhIN9gehpl6sK5+iY2511olbbCPKh3++QLUf9km12yPkYN1Em4TxiN
         uPHrD2XmZT94W23ZNgfhWlLt1C5C+L1i7Ap9KSckyLEZq02LszQQfziogRuGJtE+MoMl
         mf99o+ZHoArRIVDrxEoL7svWjNlzaZduH5OW4CCkw2sW/LN6wV7YwiX8Ak4r4rh05Twv
         ZPA3ExGJ40/SE93J8PgDieJH1saM9od5LvA+VyFq9AZuiBWOeihBlh95RSIjgK6+i4iz
         menA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887429; x=1792492229;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i8/Q4Tq+4DZuh8QWu6beqC0Jl3juQa3zTScBd6grHSw=;
        b=kGaZ+lv5gtliT6U+Wxw+RjzsfFGB00Ei2drAzkBVlDgt1Q6PmPfIC6PY+lUMqpjwHh
         FX5JR563br21bXT6DWh6IRQrHGI8z7El/MiQCm84ghWwsk0yVJj93E8rLqk013UuWUlG
         ccK82yGiRPWlgppMWJI0SX7tUbebjKmtoPkUarUxleWaV1w14v8g+UBDofA0Az4ZnknO
         8stfo59EucZ7AMCTYgOCy701mwWe+cPykN2jt/hTWHYm60c7UZXiVwPIL+Tab6LS04Ow
         lqkMXTd6JFn0vUQtGCEqCWIujS0trNzzkjPj7E6gFm4QCxbiejNs70R0QQJ9wzgolXWl
         Jgog==
X-Forwarded-Encrypted: i=1; AKwUvByJWfiS5Wxnn7N++4nygBQlgPLde7QP9WF+y5cTemb8KIocqL2Y1t1fezMZufOWjSkPZpEnZ5vAaQnKe0V2@vger.kernel.org
X-Gm-Message-State: AFq9FYJhLaYfajfBSKQSr63UE4YsLWEcVSMZxW8TNTRvLnY9XDgfZ6iw
	9jT7yCc4VREX3jWCcjLbLoc897MzqL8YX9Rlx7lc3kYj9OGmggx0vCpMvE/IVNfSrPCUki4rQCY
	N3q8CROhIkWa34DhXNLNm5Y58J49BA3s2i3T6pPtWx8i7kfHsiybbnmnNGKbTzh1lHMjt
X-Gm-Gg: AYBFou1TGlUH4sdh8mwdBVm0l8el+BqropWNoLf8UrFTT0XHKRxhYDcpoR5hstHCSXq
	/NjuIyqAPgWgfPEtdTUQ9cxvUi+0Lzzx+xUZiZX44FNxjxyL8oODFGi3xzloVmerz0CFWY2p4mP
	gOaRVqOKK5SNALhKTOLvBeFiOYTrBILY8ije7o0ZWBfIMyaVtEOHOAtVgr2bcjCnstELAY+lvjH
	qotdjPn3WDqGkGlAw86gcxJbWbzl5X3tkhBi/xCZTb/1Z/OsVl6VgD9xYqxP/DOg7AtfXaZXt5Q
	AWKn+yHWJRCQqrvosE50vlC0gzTcTFNI5/xThEraVMa1+Vk+WDYWDxlmMJo9HWEbzRoFW4X09A0
	wnjCsgfVVT1KksRCyV3TXZ1rZuSThAo3dYpLCOAYPDVKC2WEioSp+kFRNHxAC3x33btd1Ibhbe4
	Q5P2/jxnXQNUGsz+19MVP+BzqKgGD25Qz+NwCJr5ZZzEulnSqVmu4=
X-Received: by 2002:a05:620a:29c8:b0:93c:6450:9ceb with SMTP id af79cd13be357-93ebd0c3781mr1856371985a.1.1791887428933;
        Tue, 13 Oct 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93c:6450:9ceb with SMTP id af79cd13be357-93ebd0c3781mr1856366785a.1.1791887428306;
        Tue, 13 Oct 2026 03:30:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/6] i2c: qcom-cci: Runtime capability detection and
 improved read/write
Date: Tue, 13 Oct 2026 12:30:24 +0200
Message-Id: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAIzmoC/0WNQQ6CMBREr0L+2pL202jrynsYFlCq/MRSaKHRE
 O5uxUQ3k7zJ5M0K0QayEc7FCsEmiuSHDHgowPTNcLeMusyAHI9co2bGECM3MtU2lZIV11oi5PU
 Y7I2eu+lafznYacnC+V/2FGcfXvtbEp92FwvO5U+cBOMM8dQJNK1UqC8+xnJamofxzpU5oN627
 Q36A0cyugAAAA==
X-Change-ID: 20260929-cci-imp-8ba384309942
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXzVvla+aGVXsu
 SNTx7LiqQqENThp+qQ0d/26bZPs8vVFrcSMbtZXzOuyHA6vl+6qQ+UAoH7igN3t0ywp0CmtpaJ6
 Wlep4C3unwHoMJa9iEoZmuElwV2Z8/OT5nIRbc4KJ9kro5BuDnYA7itS77+6lBRzALt6YaNmpXV
 mJqBpAd4YkuL9kmBMn9TQ1xJA4+hwGNBXt2FjYv9Fak/9jMa1klV26KOfgxjUuVSiLZT53DrJtr
 nGjmtDrGPUe6R4mvqXjLq4W5ZlajtqkpHQLKxTTj1Fe10lRbuuDxqBlks4Rb8W38XSZ8Z3fJYBx
 yP9mrf8DeqKnRYvule6F5wlMTcnLguSywVviC6rm6xy7XS6jjE2PiHczm42hSEzklrEtPxKewtg
 07/yv7ibnw9N0+zXCtUGQPgrLHjo2pGhxC9OLxFARMiy2oNIPa4WpY4TNZ0IEg6wxLE5SNmb8v2
 XMJwFk+pfsLOJWbu1bQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace0846 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fqBssBKcfzBu9c0AyzoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Okts8xsSWAwFOVfB9Hdu4Y5McCEBx90j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXwDUOQxL9nk8m
 kJTB9xidYklFuFst/+sGftxCmIH90LFMmSOYN/GvD1kF0RKrhAew/Zp/o3XPRzACBHYl2uTYpuJ
 QRKsP6Zq+uEyYxXIGWth/6Kpa54fmq4=
X-Proofpoint-GUID: Okts8xsSWAwFOVfB9Hdu4Y5McCEBx90j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

Improves the Qualcomm CCI I2C driver read/write in different ways:

- Capabilities (queue sizes, max transfer lengths, supported I2C mode)
  are currently hardcoded per DT compatible string in a handful of
  cci_data instances. Patch 4 replaces the static per-compatible
  structs with a single version-sorted capability catalog resolved
  at runtime from CCI_HW_VERSION.

- The driver only supported single-command writes, capped at 11 bytes
  regardless of how much space the command queue actually has. Patches
  2 and 5 factor out the write-command queueing into a reusable helper
  and then add burst-write support, chunking longer writes
  across the whole queue instead of a single command's payload.

- The FIFO read path hardcoded a fixed 12-byte limit unrelated to the
  actual per-revision FIFO size, with a special-cased drain loop.
  Patch 6 simplify the FIFO read/drain-loop and derive the read-side
  limits from each revision's FIFO size

- Add burst-read support using threshold interrupts, allowing reads of
  arbitrary size by draining the FIFO incrementally during the transfer.

Also add overflow and underflow IRQ reporting, as queue/fifo limits are
now derived from the hardware capabilities and exercised more
aggressively.

Support for unbounded write transfers using the threshold IRQ
mechanism is planned as a follow-up and not part of this series.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Split the HALT_ACK reset fix out into its own patch (Andi)
- Fix a typo in the "Detect capabilities from CCI_HW_VERSION" commit
  message (Andi)
- Use GENMASK()/FIELD_GET() to decode the CCI_HW_VERSION fields (Konrad)
- Derive the number of masters from the DT i2c-bus subnodes instead of
  encoding it per compatible string (Konrad)
- Add burst read support via RD_THRESHOLD/RD_PAUSE IRQs
- Link to v1: https://lore.kernel.org/r/20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com

---
Loic Poulain (6):
      i2c: qcom-cci: Factor out write command queue programming
      i2c: qcom-cci: Handle and report queue overflow/underflow interrupts
      i2c: qcom-cci: Detect capabilities from CCI_HW_VERSION at runtime
      i2c: qcom-cci: Add burst write support
      i2c: qcom-cci: Extend i2c read limits based on CCI revision
      i2c: qcom-cci: Add burst read support

 drivers/i2c/busses/i2c-qcom-cci.c | 429 +++++++++++++++++++++++++++++---------
 1 file changed, 325 insertions(+), 104 deletions(-)
---
base-commit: d6dc536a4c8bb99dd822bc349a9e801be7ea81c9
change-id: 20260929-cci-imp-8ba384309942

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

