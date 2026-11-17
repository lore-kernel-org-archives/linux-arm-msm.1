Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908395;
	b=b23siFObnvStCb7NtJW+PU+v3Fn3YOAVqUuNg4XMtpbalZRk+8v8/Td9KmydbE6rgbPa
	 CalNKm2zczdnSJ7IDMPZv8kAnueaqhIO82PDpSgs8blo9SvsD2NWf+PHrNzOWD4ZC6nBS
	 NBIH7H9hO/POLiIOz0P+9A5jBjhyA3duxcOD57wUYAlniLuxBNGjqse0+9iKJlLLTlWF1
	 wdXC9dQwhReGLBBqs3a7RoYP492MiTfFobCxrT1gmQgJGZZb0dEljG5nCGcs+naMPfW33
	 DNxv0z0HKgYUSATxZfPZWBN4yyu+Q2hsqaJ51yXf1jsBT6P7+NNcGhtS480EcPRXWYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jkwCDTDY34gysHX4eD/Jtbt83iR/Xm5caRAcO2dYSpk=;
	b=b0vNCpWwpQCPk0MtVeNPB3pK3s4QEOQ4Uqcvw1AEUktPF3q+mP6SUDq0ix5nGNU1B8qT
	 oj09GQEhCmrKJz9rDMYJlSrJamdLALCdsqZa74zMPM99i2Z1e94XpHjWq6aELXr+c/Wyu
	 oAaPkYGnK3w8Ps9J0fHeuXxAcxUzl+1ayF+L6Fi+5HvmBS5p28kLxFAGSFAhX5qh7zb8z
	 becOtTsccBcFKKboFeuYyYvNSrm2UbAZOO/2y09uwhXiuLKYSwwhpX+dw7S1fIbuc2Tx9
	 uOwVDpZXvVoBUKM71A6A/RNAYrYodstEXcyp54mrA7jioSCwPF13qDEEVYAg3KfKDpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MMCeIdX/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhMV3eks;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F5606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34F5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MMCeIdX/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhMV3eks
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53HlZ3458230
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jkwCDTDY34gysHX4eD/Jtb
	t83iR/Xm5caRAcO2dYSpk=; b=MMCeIdX/qLiJeARaBfQjBVicy9JDQqcVTluqTE
	G3JPO9FlBLxUM8656v6aNX4e3SuaC2KFg1tCW/bSeTg++o+DyYOrgxx1ZMYuzmbW
	wgzKlbDncDj6ZHri3BtcXa2fXw+p47GftulV/i0/vXDz1PAE+ploI357fKG8RLEV
	GcZIph2skaH70mhCiBxzCiBdPPqqh14vPap72N1uS2hD7ri2uQpf3cWC9ZtVSqWF
	Cbgk3AXQt3PYpAosLWehozKze9ZYqn6it2kTlqQHov65tZGpayzh8Ead+wu3uD+q
	WNIgJ1x1PD+I2eBqeEg0i6cN1qTWTtzZBFsctbYL+BeP9eXA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh9105-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:39:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so2731083a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908391; x=1795513191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jkwCDTDY34gysHX4eD/Jtbt83iR/Xm5caRAcO2dYSpk=;
        b=IhMV3eksm4T6ReBGPsQjEU12EKRUzidfFlqe5qA8xjfzf1tDa/3cO/dzk3ypRH5puY
         sobgOcCVSNaFXwYAkIiQosiFAvY/93kGjTD9AHkhc+ypPPGjWaldp2bK1xzj2xgPfuJV
         v/r1KUANFlSy/WJAd+G/Tj5ZJsg+UiQSb7fazdTQGeJ0ZEusBEhyJDAJ6d6Ppx+R0HaT
         RTKqIbmi17uxwYtVxCBUDYptl5FkChjnQWLJXZmHDGABRXDAb784hvWbi+qHGcWkr2BH
         czucNL2r4htUvbV/ffaPCoG+8GcZLqVZH/drMEkNuKApfllhH/rsp7BuT0Fqk+QWfYy+
         hB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908391; x=1795513191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jkwCDTDY34gysHX4eD/Jtbt83iR/Xm5caRAcO2dYSpk=;
        b=csoVrlflBpxgNcNhTqspzhmVPTv4SqzXx487AcInNnZ8/dS9pwXhS/ENNNtYn2aC9Z
         drd1kgKEt0aqBjZs6soH2MZjQTZhlQ8vyMSmpjxSEFLas6yaXxWa/niJYlEMAha8H5r9
         6S6l63nAwvgjj+cmm4k9/VXziEsDuiNsAyR7/u6RBJTK/HtfoVoPfofxnS14jz2EQNx0
         yiprZwQ9Ub6IENICfdrBp51V1qXmTrLtp6pESruqXUFyAszeiDY0R2JVV5teBrMdunDE
         mGMmKVSIf4QC0hCuTgoFWBPc+749T6EGg/RWu6QFv713pXzqtc8It1QLgzAtJ+rlTVn8
         x0yQ==
X-Forwarded-Encrypted: i=1; AL+hErFF4Ri8ZbuR1c4fgQGUtyNkqyvLggwqoz2ZweP+HAN+mOU9e0OzEtHy6xKiNQLBIln+stDLt2T4sl6sGvB0@vger.kernel.org
X-Gm-Message-State: APuU4Z9L0knJLUWOFPYH5ji8VemuE33sipFsJWJ3nEEbEgyA9mPrjN7A
	nmrQTqlvPuImvLF2EyWUDySS2YONHA2MUlpuwV7HnDSiaAO45LXUHa3DPpkZ2yPQi9phi83i3Vx
	wdaCIy8wmbUPGB92+zBfEgHOQjbAXkHBvxWOnVfW+SKyjsczTjYjcfEmUegGZl2zCZNFg
X-Gm-Gg: AYBFou3pXAGTuFtvmm6eM8sZDh5jmn5p+zE9yacAp7XBJJfZxVHzivCRDRxjhQOwIvg
	UEQWBnfJdJFrx41EjZxODO+tYtBDI3OXig5EyP7w/vRAQUk1qc9t02KSnXadyyW7YwLiyFZ4Dv7
	FqcIN6SRsQL2WgyF9YS5ClrQ71TwSju8BHj8nbV37hO3CDWNVxNt7u3uM94GYh3vBB9Loi2MkT/
	fVn0IqYuK/p6TixNoqscnszt3ZhQdqNtVYR3EAeue2WuC56wUUYyhcrnIbcnZ4Jibyz84HLSF1R
	69MkL2xMeWBSigsvqzF7Mm4pFURCsU1OdboKYhJbjEhyxrW4VKvezMixwBGws+spy+YfTlG6Nxs
	JbDno6QkuB0bGyuvkJFniPDQxzpEaDelM9r9CeUJsFLGRIRbyP+AFSPT6wg==
X-Received: by 2002:a05:6300:8189:b0:3eb:a628:10e9 with SMTP id adf61e73a8af0-3f7a79c61ffmr10478983637.39.1794908391466;
        Tue, 17 Nov 2026 01:39:51 -0800 (PST)
X-Received: by 2002:a05:6300:8189:b0:3eb:a628:10e9 with SMTP id adf61e73a8af0-3f7a79c61ffmr10478956637.39.1794908390903;
        Tue, 17 Nov 2026 01:39:50 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160bfabsm5299078a12.4.2026.11.17.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:39:50 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Subject: [PATCH v4 0/3] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Date: Tue, 17 Nov 2026 15:09:44 +0530
Message-Id: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOAg/GoC/yXMSwqEMBCE4atIrw2Y4Iu5yuDCaDnTDkTpxCCId
 zeju/oW9R/kIQxPr+wgQWTPi0so84yGb+8+UDwmkylMrbVuFLsAkW0NGNOOyw8qlmoyqCyaFrZ
 vKX1XwcT73X13j/1mZwzhH6PzvAARkmwQeQAAAA==
X-Change-ID: 20261117-interrupted-invoke-v4-f2e5be78eba8
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 4HYwyAGVgMrMIkg7Gs2lEqH2DQprSxA4
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc20e8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=-vHKDIwpwqHdDy8GyowA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4HYwyAGVgMrMIkg7Gs2lEqH2DQprSxA4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX/Hpopk4DP7Bm
 xExqMqhGQR2QaMp0wZhrMpMNIFhsKTmvpAzEsvkkVdRWF6R9y5umxbJZ3lwn8dYsPa/Uyo9tH4q
 Z3sSuic+j4RX3Uh4Zz8kI9FHRboNCpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX5iJOyx9oIhoR
 p7umRcw3VkITpWourqgNuCzbHNME3ypU3UMAj1qvVxPp93FSCA41gxLHC4/lLO67sTsXDo1I4Cs
 YVtEm2HX8Q2qMyj/6NlIrOg6vpZdwjvyyOVaW6Ial2vMoVAz0HcoRg7ztz6BdbG+jVL/30jGJad
 NZTrgIMDkJ0+bSljYDHl+KP1+2pfuKC3kjx6gZQeYQKy7PwFzrTWT18phsH+/MmhNrPQza1iYip
 ezl9WLcZq4W89HAKNSAN3f804o2X4N6pR0da10zloAWFnPZFLalY7WoDO3ALFxzjoe+ykH3XHh6
 c6qynjFcj3wfEGLPlq4OSkXU8X3mREYelhFT5ZRScSy4BkrugD9dJdoNTtqJtUcBXzWLExfG0Vr
 Gos0GpZEmeJPb5IkYZegDG6ASBEzDwtXWOPlPlccpScXpC1PzTatW+g2i65CormV8Qa66GsR2zT
 fpNgD8vQGhJ9GD2jbMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170038

This series fixes a context leak and DSP hang that occur when a
fastrpc invoke syscall is interrupted by a signal (patch 3), plus two
independent, pre-existing bugs the refcounting audit for that fix
surfaced along the way (patches 1 and 2).

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Changes in v4:
- Split the single patch into a 3-patch series. Patches 1 and 2 are
  standalone, pre-existing bugs the refcounting audit for this series
  surfaced - dead code in fastrpc_user_free() and a worker-reference
  leak on SSR for ordinary (never-interrupted) pending contexts - each
  with its own Fixes: tag, landing ahead of the actual
  interrupted-invoke fix in patch 3.
- Fixed a hang inherited from v1-v3: fastrpc_invoke_send() failure
  shared the same bail: label as a post-send wait interruption, so a
  message that rpmsg_send() itself never delivered to the DSP could
  still be parked as resumable, and a retry would then wait forever
  for a response that was never going to arrive. fastrpc_invoke_send()
  failure now gets its own dedicated cleanup path instead, without
  needing an extra flag to tell the two cases apart.
- fastrpc_device_release() now also accounts for a successful
  fastrpc_release_current_dsp_process(): if the DSP confirms it is
  done with the whole process, the worker reference on any parked
  context is dropped immediately instead of always waiting for a
  later event.
- fastrpc_user_free() no longer unlinks fl from cctx->users
  unconditionally at fd close; it now does so only once fl truly has
  no references left, so a context still awaiting a DSP response
  after fd close remains reachable by a later SSR.
- Extended the same unreachable-orphan fix to timed-out kernel
  invokes (-ETIMEDOUT), which had the identical problem on
  fl->pending.
- fastrpc_context_restore_interrupted() now uses kref_get_unless_zero()
  when reclaiming a matched context on retry, closing a race where a
  concurrent drain (SSR, fd close, or a delayed DSP response) could
  already have dropped the context's last reference and be waiting on
  the same lock to unlink it.
- Link to v3: https://lore.kernel.org/all/20261002-anandu-fastrpc-interrupted-invoke-v3-v3-1-31e90439d2ba@oss.qualcomm.com/

Changes in v3:
- fastrpc_context_save_interrupted() no longer drops a reference when
  parking the context, fixing a kref double-put that left the context
  under-refcounted.
- Restoring an interrupted context now matches on both handle and sc,
  not sc alone, so a stale/differently-shaped retry cannot be handed a
  buffer layout it didn't allocate.
- A mismatched handle/sc on retry now falls through to allocating a
  fresh context instead of returning -EINVAL, so a thread issuing a
  different call after an interrupted one is never permanently
  wedged.
- Added a put_work_scheduled flag, checked and set under fl->lock, to
  guard against fastrpc_notify_users() and fastrpc_rpmsg_callback()
  both scheduling put_work for the same context.
- fastrpc_device_release() now drains fl->interrupted and drops the
  invoker's reference on each parked context before releasing its own
  reference on fl, fixing a leak of both fl and the context if the fd
  is closed while a context is still parked.
- fastrpc_device_release()'s and fastrpc_user_free()'s drain loops now
  use list_del_init() instead of list_del(), avoiding a poisoned-node
  list_empty() check in fastrpc_context_free().
- fastrpc_invoke_send() can return -ERESTARTSYS from rpmsg_send()
  itself before the message is ever delivered to the DSP. This is now
  distinguished with a `sent` flag so only a completion-wait
  interruption after a successful send is parked as resumable.
- ctx->args is now repointed at the retry's args on resume instead of
  pointing at the original call's already-freed buffers; an
  args_owned flag lets fastrpc_context_free() free ctx->args if a
  parked context is drained/abandoned without ever being resumed.
- Link to v2: https://lore.kernel.org/all/805d5de8-477c-41e9-b192-d889d1cca9b6@oss.qualcomm.com/

Changes in v2:
- Fix kref imbalance: fastrpc_context_save_interrupted() now drops the
  extra reference taken by fastrpc_invoke_send(), so the worker's put
  correctly reaches 0 and triggers context_free.
- Fix -ETIMEDOUT context leak: remove the ETIMEDOUT exception from the
  bail path so timed-out kernel invocations go through the same
  list_del_init + context_put cleanup as all other error paths.
- Fix dangling node: fastrpc_context_free() now calls list_del_init()
  under fl->lock before releasing resources, preventing a dangling node
  in fl->interrupted if a racing channel removal fires put_wq.
- fastrpc_notify_users() now calls schedule_work(&ctx->put_work) for
  interrupted contexts to drop the worker ref on channel removal.
- Add dev_warn() on TIMEOUT and ERESTARTSYS for post-mortem debugging.
- Use list_del_init() instead of list_del() in the bail path.
- Link to v1: https://lore.kernel.org/all/20260525124222.3082420-1-anandu.e@oss.qualcomm.com/
---
To: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: quic_bkumar@quicinc.com
Cc: quic_chennak@quicinc.com

---
Anandu Krishnan E (3):
      misc: fastrpc: remove dead context drain in fastrpc_user_free()
      misc: fastrpc: drop the DSP-response reference on channel removal
      misc: fastrpc: fix context leak and hang on signal-interrupted invoke

 drivers/misc/fastrpc.c | 187 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 146 insertions(+), 41 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-interrupted-invoke-v4-f2e5be78eba8

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

