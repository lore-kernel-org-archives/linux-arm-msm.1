Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFF4A1E0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194214; cv=none; b=R86/hi9zyybP/X50CHFnN22DU4kM5PORLL4CJb6As6ROJDPaOcKqd04NgCY1xPxqsvr+03DnKyBTLscV85Hrx1ra4cVo0fqh4KOPx1ogQIPuOrhtqEBg7PbqGhLDAooSTvVsZklPM3lbQiJ0wKOvhIAPrGK+jmqXxBvHExyBgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194214; c=relaxed/simple;
	bh=xTpOhfVqaVWaoOJVZbGCxX2ZY6YXW6oOFEBei85ggi0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hCcm9gUqVt6qsNCfCBDb8hiC33QCTwe/BMapBsfAnJkFE13uxf/Un9CzoDMD1m8rZ5XF/MkWtOFlDN57HAim9SNm8PwfALIIcJj6e2zOqjygKcUKCaPPpkOmk6VTGlHlUrAGKjpZOJF9Lq3bxK/wVU3GfP/p5RNrsWCS1GBbDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDeB5fzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+xvANIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDeB5fzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+xvANIq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq9VK305911
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rqfzRoa8lzdVEVcPPhGUKT
	zLirYY2hrbQz5zAHTrgZE=; b=mDeB5fzmXNU+c62b++t3Wdhu/8Z838ZL7VTpg1
	NfziV25EY3d1RXRCyO0jNknPMtkp4Ymean83WXcD3VP+Tv2GtAg3LJXZb8D8/sdQ
	XxZAFtfxx3K2VuM+ufNCpfKur3wa6s8IYPqsSYR7GxfKUa+A/aUx+u4IJYbI4yFU
	f6znz1Sw7CsMUYzt5DygpfPfpjhVSw0N01ULqctku3VejE8e0cmBXtbpRAz+uHtw
	zQWd6V3Voes2rYvXUQgiSRh2ygsHgn139k+mTnrcoQB49atDanV1EfBWaYHh8WtU
	35hsMrVUdCtWehG3Ufb3TLGocFJx244KV+0ORa9TXcRFm2KQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pmahtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:36:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso6774979a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194211; x=1788799011; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rqfzRoa8lzdVEVcPPhGUKTzLirYY2hrbQz5zAHTrgZE=;
        b=M+xvANIq2Zdx+9Q27aGSK9pWng1gRl24E586P3hCzuEJXoe5RcyRsOQhVd3P2Zssaz
         lx5yhFWyD0HagOddNoXMerGeEBUAvQQ0PAFOgZSyECHVct6NmqY3bkc6zeY7hxqbXMdg
         l8GG2raxlvQj8IA7qD5PXuVB+IqaA+F3mZ9Uu5rQ0I7BNR/VDV8Hx/A4+lgQ7QS45fap
         6hV6IYnp0E9FEBvlepH3AOE+VxEdBAa9FN/dh4otQUNJH09FuSD7NZHwi7VNrGGWKVv7
         zCclt4u81SE/HqG3E9xpvz4RLu/KDXcDWhOOnt8Tj5SdZR04oDVNqIjR4qHxJ+rKTZd+
         XA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194211; x=1788799011;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rqfzRoa8lzdVEVcPPhGUKTzLirYY2hrbQz5zAHTrgZE=;
        b=IeWPxfz7ITUmcR+PFi0SGU4BFfIGmduNKBZHPU2Eo+L73eXFDivsnLwxAdBMFYOTRk
         n5lVlr9ghZyQIUvRmluBZU4BDmEZ4O7+v3+k8F94PWG6H95HLEig0/0KLMOGRWiMqZx+
         wzb21VWEaY9zzmoN3QwexBdiqYaykfeo4Y1AZjbSdSOYrY/c5LOrsEFmGGQwW/WTW8nf
         vI1DGaD/+szpxwFKGLQFBv+czCuqgtbhrI6mgrUMt6mrrklvKCl4JfjRPrHiU2mRI6cJ
         QVJ8cUpXhSA1DtZpbjGxLITqZshg98jKlbFB0cE6HJEBtCnz4eUYmyQiN0YIUh17jqFt
         LbNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeJCfS6ErS1mH3FMchLBuzVNuyM2KujgG/F9fBvPLmW90XWoEGX7l7GPB47GQ1yzHjpnQFtgvaCvJ/QAlI@vger.kernel.org
X-Gm-Message-State: AFuF++n+dC9hoPD5NjeUPaCXIiCiRb1jIw+s8rOUouND+66jyGG5qUP6
	O/2vtLl7o0M/2aNfQtSDI7/3kNNBZGtTuDuaqNSwGNHFTRCm1/+cCGPE8qN1M/oP8Vlwga4RgXE
	Epvig07fII9lTuw0RtKcpB2zHaF42i9M9iD7mQI0NPGkeoHEAuKwz95zk2WobJGp6tQsN
X-Gm-Gg: AYBFou3/HCtKSkBsDZr+OZZqzKz5Xw1fetyjKBBTd/++9i4+v9pENt3tWN7f/HTd1h2
	TAqYED/13GaKsG0EVlEzO+ePF8suEyoxVJizn5KSmHWv2DRj/BN93ormAU+0L3KprXFDZIvqT5+
	D+B1hZxHZeNrvUUX2xUVkt5TWquHjSxTR0EUL3A/6iXVKHzzEgGmiDDDe56WcpQK4AQVE616c2a
	ga55TUNRJGaD0UD4zWEavgdlHPZTrYCejoY4AaFvM6BnjlFLQhiRJhVPqIyMEkIsV1txUMsKL8i
	S7q6HIedRoP4GcDTPG3WOfwPambkQ8tKxVHbpMQCoJ2Co7hqS2o1N5F1aUXtKTqczCWQD8Sj4Uy
	vfvVprqojpOqx+rlEcQixLCH2F+NRebak3Q==
X-Received: by 2002:a17:90b:224c:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-3989c003c31mr24472870a91.20.1788194210419;
        Mon, 31 Aug 2026 09:36:50 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-3989c003c31mr24472805a91.20.1788194209805;
        Mon, 31 Aug 2026 09:36:49 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm271260a91.12.2026.08.31.09.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:36:49 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/3] dmaengine: qcom: gpi: Add trace event support
Date: Mon, 31 Aug 2026 22:06:34 +0530
Message-Id: <20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJOtlWoC/yXMQQ6CMBBA0auQWTsJVBTrVYiL0o44LGgzUwgJ4
 e5UXb7F/zsoCZPCs9pBaGXlOBc0lwr8x80jIYdiMLW5149rgy4EzOI8oS4pRck4Jo5oLQ23NrS
 mMxZKnITevP3G/etvXYaJfP7e4DhO8hCwq3oAAAA=
X-Change-ID: 20260831-add-trace-support-gpio-99eb54d42729
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788194205; l=1247;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xTpOhfVqaVWaoOJVZbGCxX2ZY6YXW6oOFEBei85ggi0=;
 b=95Frxty43ymUylU6j5YTJArM/YAiljzCRUdfAAIdm6roQZxJ33T2TqX/e48F2m6i62dODAzZU
 NKPKK3fBFs4BzlnXNky/J3IxpcExdaCEmQVqCPCzDWy795gULL/MMSB
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: DHIAJbHB3fPh1gZHe6hqvzIKKvstpX0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX3Zi2fcE3Nzz6
 PfpT4WT7bUxTHpzfMcltb7QJ+DOvq0gZ4d/wggxkF22j7uPrb2XLzlU0x543rKL8aJ4PHf0AA9I
 reNvCdwfLQxucq2EiQN9Jm4pjUclurSFP9GZjFouW4/aJd4Kn4xyBNcW/93WPX3ZvMfnwnfOdPp
 y8H1GLELuJEiqs5zYlCUJaV2RNdb9MbZ/yVylzc8ZE6qi65qfwPr12zoxUKy4GlKj+y/suvL8LB
 Y5lP2YsIMlWl4I1yptN9Ox+F0MsMyBsj5bn7GbsXmJr8hZjdiJQWUD4pjI4SV7PB7MYt8+AixyE
 lNL70bjAypNkPVoooTpHqWC1ThJbfD9TH4h524JYraSfdrFzP2IezE6+tnE0s89vqyCI91J/rWj
 erF70nAeWrXSwCdByQKNsE3T35Hcm39TrME35J3WPEvsjqcLjAaKlP7EdmVaBAiBAQlSnfBTqwA
 tIH0MY07NfMX/iDzrZQ==
X-Proofpoint-GUID: DHIAJbHB3fPh1gZHe6hqvzIKKvstpX0B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX9auiKqPHIZXN
 Nv/dzjEBKOYEZLqK1idBmSLBzz+vu8jRfCFSh3w7U6CxbKgHxzPXNWwtctbDsT498+JOyKjpvvQ
 0aYsvBiCRylIqut3kCqj6aE7HWEpXcE=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a95ada4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bEzAOnUhC74fLp94dtcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

This series adds tracepoint support to the Qualcomm GPI DMA engine
driver, giving structured runtime visibility into GPI DMA behavior
without requiring invasive debug patches.

Patch 1 adds the qcom_gpi trace events header, covering command
dispatch, IRQ handling, channel/event control state transitions,
completion event processing, ring allocation, and TRE contents.

Patch 2 wires these tracepoints into the driver alongside the
existing dev_dbg() calls.

Patch 3 converts the remaining dev_dbg() call sites in the driver to
use the new tracepoints instead.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (3):
      dmaengine: qcom: gpi: trace: Add trace events header for Qualcomm GPI DMA
      dmaengine: qcom: gpi: Add trace event support
      dmaengine: qcom: gpi: Convert dev_dbg() calls to tracepoints

 drivers/dma/qcom/gpi.c          |  69 ++++-----
 include/trace/events/qcom_gpi.h | 313 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 340 insertions(+), 42 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-add-trace-support-gpio-99eb54d42729

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

