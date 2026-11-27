Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773874;
	b=XNkXyXLA8sMd4IzWyO4h2Y3DvZqtmWztW1M0/DwXh+jqyAzFWuLtdJ4T+u4iN6F06nDT
	 jNztVopaRDyHpTsoFmrGT+3FvNkEO3iAHaxv1Wc9x74DwE0hyovQISipAzrOA+PfXKahk
	 Gx7CZIB7Be8PYjRyan9v4yisVAUTL2WGvP2M9p3Rg7/2ytsz+8jMM6K59LDBQSVMtd0Ss
	 0cmcUHxqLo8g5hFWXLXpKjDuJjpduAZc0Y8qtmhiNoyvosDAEdR4T1xlpGUHRLi0tJRBs
	 aSAGA/DOse20m8fUcxDE9QAmBG4x3tiZ3VNij3UnjePmOSRYKmQuBYXA0OHVrC0shtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=crSCT2EstgNsJNFIMJ/PB7/a6XJ6ZtzNwTlJSmVt7QI=;
	b=5TXkvAhUek81b9IYT2+heqeokW0rdJP0Fte9vnLlWOZ31Ok5C70y+B4cprwHNMzlQjol
	 0HdibqLwYb/1SpVZE0okvlIktCvWT0U1v16LNkfps9rx0DYa5OJRrg/yjFLaqcrvktyhg
	 Mo/+HAjnX+L4M3bRCHyiMPwEqmUXK8ApflDUtJ2QW9sbetbCHrkoZU/kirLTCc22XgenR
	 152XiUsgen4pByNRB3t9FkY5p119rW0eckpQMuXlezad07Ca6rh3r/G1LTO+XBJYujp6P
	 9VDoaN0G8ZiQspCzb61JpBriWyS6rwNav+c5Qn4mMr9NtvfEh6zN9f+F0Z3o8B621zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=da+ZMpUe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g4/jr6E9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894B4606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=da+ZMpUe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4/jr6E9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gdll3983882
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=crSCT2EstgNsJNFIMJ/PB7
	/a6XJ6ZtzNwTlJSmVt7QI=; b=da+ZMpUe5WH81l/+r03aDnZ0TKA58g6AynAuFd
	3PbwG8JlvuPo0Usu3/EutVE+ZuEoD1WYA1MNnVovKM/M6eTqO/wb71QJcc4YpqWh
	SfTFPJ4rtyW+eUYdwF2noJpiU/kgp/ymQa0DM45Qsgw6uk7MWxVaOsgyWu5jVA3X
	kxcdRrXzIVhuAyD6uBf0vWfgTUcjkdEMMF/BX+D+zIu4Q0d8KubJYoKFw0dbFZBt
	H2v0yDCYhP5Sn1jJYLxNrZDhhq64t7GmYPyo8A+t/eKp/RU/SPmPuppbKF5gWGgB
	+wc74DZ/0m902XfeXhJRXM9I/L0eSznehOibS3O/h8Dlf/0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49af71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:04:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05c68629cso53687145ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773872; x=1796378672; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crSCT2EstgNsJNFIMJ/PB7/a6XJ6ZtzNwTlJSmVt7QI=;
        b=g4/jr6E9M+GFrTk+vA5n11H/h2ASkpwkZ+r8VasglB11bd0FqQFrw7eMwkcHDXsVhR
         JuQ4e707EZ1B49RwB9/en+M+Ohk8Y1XtFUgFeDcwp2FyvkhasE/C4vnnfO9LM88ExRpH
         MclefMpBDX7P6RelT+RAz3dA5I5hLC4G94OaGoi6g4BAoML04tLCdJhASUoiMd+Krb3Z
         EvyT2HJGAtT64/7ASm3VQuD8hbX2U6eSilCZcCYZUM2k7T12w4PqsNZ+b5nTmL3QNCUn
         sgV8MrttBnC1YAT1yVEaVbTNDv/BNB1IPgk3P0J9dULlbMJFpyb5tWxoNkco2mtImVW7
         NeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773872; x=1796378672;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=crSCT2EstgNsJNFIMJ/PB7/a6XJ6ZtzNwTlJSmVt7QI=;
        b=HV75ITJIzoM6JQ0A4QtU1TXtETGfE9t2iAcd9CDiGEguo4Pcwp0ZkviPwXL7gvm7JQ
         1bCJFxjP6a5jLL/Sp2w1goz7Vv8fvbgL7/3RUeo3JZVxcmUvJ4a9eX8eiWmBNijRkekh
         RNnAgHKTwJ5BmUe+pOiDYVJVPYtBxsoC5osiBBohEvbD6fIuh6lklSS2cmkBX1LVQeVK
         mcuOhcvtrtxd3kKOajIphFqpbRgo3rbLSfcCZPiVqgVyW8grIn9Hk+b7YrsEggqDyoTM
         xE+2oToCir01X8pwEcnuhayer4AugcxDhIKyH/M2LSuJFItdeurL0IRS/nj/E+ppqwuj
         6QBQ==
X-Forwarded-Encrypted: i=1; AL+hErExDY/YTIBJ/n7bxLruOD6+fe/4EckWo4ph9xesozRJXTpmYTliUuKiS7yxvqFm9bj42ko/3cpuYl0qYNCS@vger.kernel.org
X-Gm-Message-State: APuU4Z/r+FwspzZx9wQ4wb1Cvf2BssiiQHSh0gnSOkYDMgicyfLIj4U2
	X5kWE02l57gMtGefHgyOx2XF+VFZuBmraXbwBWx9jQUCUAfjHAcwpe8qJAJMjgsmEG66JXeo6ic
	LInujG7LtASjXlD6cRww2tmVJC/kceE6dZUG0cPzMxUm7iwzcaEzSw54WNBjVdmgvKm7F
X-Gm-Gg: AZFdTZe3wxz2aYCDRjU3BjaCOkgk2hfE5YwlmM4ydCz8Uxy9yWCy7yAOnD/kWV7f1IL
	maSZItThoFiP+ixb6dY9k+B5C8YHkVvC97Z5qtY/JM/3uzCX/yBJG2k/Rg09fljnjg28diA8eYB
	MmqbAOd0MQZx/AEakLGC3C1LXAwkefWZcuIG5ykLzTeWBqWwuuvynaadMY+Ml6GmTWhZ2SoEbw+
	HcLb43ZVHB39E9UayoX5+8M1xTULe4i9e5jKj1S62p6k6gfJir8QujSE5bDlChEfaeDKnSh7Xlj
	1O/A5Yd5u1eSishkMzB90QIeKp7dJYZ46PUYo6LryoTVOnlrl44mDDNA0x1WRzIBptndLm1IPtZ
	5+GpFEctF18gP82dcWoeWNylZNHFz8Co/EiavNMXkmcemOGIOZ4fFRIr4+XqYDNLohnxdLaIJKt
	yi8WFeYg==
X-Received: by 2002:a17:903:298c:b0:2ef:d952:4a65 with SMTP id d9443c01a7336-2f03f1babeamr234436235ad.43.1795773871643;
        Fri, 27 Nov 2026 02:04:31 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ef:d952:4a65 with SMTP id d9443c01a7336-2f03f1babeamr234435965ad.43.1795773871108;
        Fri, 27 Nov 2026 02:04:31 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm119350235ad.6.2026.11.27.02.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:04:30 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:34:09 +0530
Subject: [PATCH] misc: fastrpc: make put_work scheduling lock-free
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
Message-Id: <20261127-fix-put-work-irq-deadlock-v1-1-3aa66fe4f2c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJhVCWsC/x2MSQqAMAwAvyI5G7BFKvoV8VDaqEGxmrqB+HeLx
 4GZeSCSMEVosgeETo4clgQqz8CNdhkI2ScGXWijlK6w5xvXY8cryIQsG3qyfg5uwrosbEmVVcY
 QpH4VSvL/brv3/QDk8rlUawAAAA==
X-Change-ID: 20261127-fix-put-work-irq-deadlock-940a4e7a166e
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        stable@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795773867; l=3329;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=OqkY2gJhqmf+SDUPxG1CDZcFBvDTgZchNgMudL7t/Qk=;
 b=5MKLE+sXxseY5XU3ASLaXjVtD7+w45YSQEWh56Pd300R2ItYC2ml9So0wQT8810n+FESrwQVw
 ODuJ8IBgwp2CLoO247S50g/la23I2d2cgUUSbleyt7gsQbCONtDomkm
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: yj2xHRXeMnQDdq-HpZWCsNPsV4dkawhE
X-Proofpoint-ORIG-GUID: yj2xHRXeMnQDdq-HpZWCsNPsV4dkawhE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX+wooCChIzSNn
 G+V8pEXBGEHvAwQ/D/QdKuTu+Virlpt2oV8rHqEXslNKP/wCgIC5+KM0BmCrW6jV8xF61vj3EJi
 XE2JV21lMoeUcDg7QX/YHLT/G4BqNMg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX2vcWYAtghrqs
 FPiNzDNoQluNA9tDtsOGYrvt0nbEZ45lXybpYjXpCtVdbEIbpttk0bLaeeXA65bkInrxodt58NR
 m2Ptxc/LxPzTonsxSVbNphdsjTKylhfHfpRrLc17pokczCpQiaaSV2VlCCYxLl3VcZ7GV70YZih
 wCgAPguBVmLhsc9IlaNihb0JH+6CjCkXM8in+RopgpoV8Za79rcDPhSD13elb3KVdVWxNVduXQG
 9AGRIJfnK6RBomo7vOKqqKFdaq2vYvZrBHUm35aAB0OsHKuXP+O7gbOUHA1BGpYubt4EpPx+Ckf
 llIyl8i2PSgR/uY8sqOjhunnc+GKrvlZlyVdShKchMnSel+0FRNfQURDUUYmu9FLq4tP4q7Ppah
 J3WjKB0kbdiRAvarEG34xt52mZBS7OFHDZr83IjmPVuzH1Utsntp83yDQDOQRz/nc6cE3W/erx/
 LE2Do6XE2ZmZSS7bphQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0955b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ME4ylVHw-GArSQJMD6QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039

fastrpc_context_schedule_put_work() guards the once-only schedule_work()
with fl->lock. That helper is called from fastrpc_rpmsg_callback(), which
runs in hard-IRQ context on the glink rx interrupt, while every other
user of fl->lock takes it with a plain spin_lock() in process context
with interrupts enabled.

If the glink interrupt fires on a CPU that is already holding fl->lock,
for example fastrpc_context_put_wq() -> fastrpc_context_free() or
fastrpc_free_map() running in a kworker on that CPU, the handler spins
on the lock the interrupted code holds. The holder can never run again,
so the CPU hangs with interrupts masked, an RCU stall is reported for
it, and the system is eventually reset by the watchdog. It is easy to
hit because schedule_work() queues onto the local CPU's worker pool, so
the worker that takes fl->lock tends to run on the very CPU that
receives the glink interrupt.

The same helper is also called by fastrpc_notify_users() while it holds
user->lock, and ctx->fl == user, so a context left on fl->pending or
fl->interrupted when the channel is removed deadlocks on the same lock
there too.

The flag is only used to make sure put_work is queued once, so no lock
is needed. Turn it into an atomic_t and claim it with atomic_xchg().
Whichever caller sees the old value 0 queues the work; any later or
racing caller sees 1 and does nothing. This makes the helper safe from
hard-IRQ context and with fl->lock already held.

Fixes: 3f645f6884b5 ("misc: fastrpc: fix context leak and hang on signal-interrupted invoke")
Cc: stable@vger.kernel.org
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5375847d8c9a..3dd9892b11cc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -279,8 +279,8 @@ struct fastrpc_invoke_ctx {
 	bool is_work_done;
 	/* process updates poll memory instead of glink response */
 	bool is_polled;
-	/* set once put_work has been scheduled for this ctx, guarded by fl->lock */
-	bool put_work_scheduled;
+	/* set once put_work is queued; atomic as it's set from IRQ context */
+	atomic_t put_work_scheduled;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -661,17 +661,13 @@ static void fastrpc_context_put_wq(struct work_struct *work)
 	fastrpc_context_put(ctx);
 }
 
-/* Schedules put_work at most once per ctx; racing callers may both try. */
+/*
+ * Schedules put_work at most once per ctx. Must stay lock-free: it runs from
+ * the glink rx hard-IRQ and from fastrpc_notify_users() with fl->lock held.
+ */
 static void fastrpc_context_schedule_put_work(struct fastrpc_invoke_ctx *ctx)
 {
-	bool do_schedule;
-
-	spin_lock(&ctx->fl->lock);
-	do_schedule = !ctx->put_work_scheduled;
-	ctx->put_work_scheduled = true;
-	spin_unlock(&ctx->fl->lock);
-
-	if (do_schedule)
+	if (!atomic_xchg(&ctx->put_work_scheduled, 1))
 		schedule_work(&ctx->put_work);
 }
 

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-fix-put-work-irq-deadlock-940a4e7a166e

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

