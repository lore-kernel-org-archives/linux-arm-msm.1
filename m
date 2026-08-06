Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5363D0BF3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999864; cv=none; b=GQAM9XvNPSnlDiBka+sPCqWcsH6M9ryZR7EqCdxiaq3DDoRH5zNCxHEJgQXt1BXPY0yev4oywSG9Lc3oNZiuNVlNgTOeD0Uu2qhacyGsyopuHEdRsirSMFEmUq6R2DaLrw5ZMtoNFfpOTOTJ4EBKdmTRjzUDumVrD/IOgCS7FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999864; c=relaxed/simple;
	bh=xW9It4cRWgfNV8sZOQXYl4J18dlzbDHWlo1gBwfL6fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j18XWc6z8yJkCJkUFWDPTIhhXihX0s5NGm8S66kQfBsshudmH6YMoQFD6FhdVyOHgbQZVqc8J4tLV6QRktg0IVmZwc2e1S0J0pYj/XDdZPrMGR60p6gIJKP0FwKg7kSZY/Qeh4lgyG5kJa9ZN6Sc5ZaqxFV334RXr/rAnVeZrTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pafqk0Fw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnN2Yw3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pafqk0Fw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnN2Yw3l"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NbSbY3702313
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 07:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSC+Ja3GxB7onjnyHeXrVZErYQzuPWmeEzJrZZL3Fpo=; b=Pafqk0FwpoxLlG3P
	zoCjxBDke1jku4qS1y6spvwDddX67p6pLn+62/1jISeRrR7Kj6VJCcEpF6vH43vf
	xoMq6nx9fgid4qojH0a4h+4zW8//Bt/tWTls0NY66hX8ybj4nVxBpAIyVQbJV0Iy
	B6xVYbPDhynLmdwluhcUrB1cu1W2S7gbZYbdZXF+Rr0pp+noS4wkyjOcLoHs6762
	T6rbVL/bB0V4C13zoN0+D2eY2lN+eTC8j2vRntDQ2mTUiy/CjiZ3O9iRzLPTnhLP
	SnvYRRRvFQdMsE9ryl7qQVIqHCQ/oWbjbyToR9CsG0gjJP2h203GnFlSuhor0F6U
	2gju/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5atrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 07:04:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so3067821a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 00:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999861; x=1786604661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSC+Ja3GxB7onjnyHeXrVZErYQzuPWmeEzJrZZL3Fpo=;
        b=GnN2Yw3l2KHpWjAzQ4SHEp7smi1Kwyf+yPy/Qb9syWxWEox3woXSDJ8aNiBvbs8Qx5
         T5sAjUGy+vZIb4bJGsWuCAmz5GikodlrxhD4a8mGWPt4SOdtcSFqjBUc0GZ24g9er12s
         kh+Gj3hkwIVhrxUmZry7X5LeJfp29ribb/I0JbpEFGSnkHQ2jiVkPl80Xez5HeQdFGqj
         9Pk7IBjkMY7Zjmaz7ubXBuu8PHNSOOEFlWYQ73K9DQ0i0haEjTA2eOuB1DZpt8X8IxoL
         0IYRmTH42IJuEfvGcLLGXKW6eG3uvXMpXBb5Jxprk9QzX0Un+ccPe+5ZCzTnnb3E2x1V
         EJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999861; x=1786604661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSC+Ja3GxB7onjnyHeXrVZErYQzuPWmeEzJrZZL3Fpo=;
        b=Af0dCsXDy3te36BAz8W7mGZ9vMN+P3Ve9Zbqx5OBTHvUZnSLT8Un1vecO8bOuKL7eQ
         z9a2Z4MENQfzXLrO95znatOLw7JXqRs88yCQyy0Bqh3AMNEoWvtQwis5zm69ysWNEu4b
         Tl7zo078FePUcsZ1hv50tl55LRO0cO15VyFUlEUEop5dX96QBpBxB9xawZWv0PgQ0Hib
         ISDs92jj6YW81HmrAvmjxo/FwGZhJRPvPD8t46mTnqXIW1o3ELZNg/yQSIhui9RD5ns3
         iFON7MJCz8VQBW0N6ENDZxK493cS5Ud2LSYDiWdN6yVzsGbIXFGoFkZmU4TnF0wjWwm9
         bN4Q==
X-Gm-Message-State: AOJu0YznDBum6TShQrK8XMDkBHU9XaMNZ60uHP/MUvXjA5FCdWdfnXbA
	sp0fZqxuKSgTRUjsDSlnSU10kbZkukPzui83GW2wu+y8ttjTDw9nx0cYG8fWLIoMKI5zTyYEFQH
	ye/kQhttwvN8RqYkQ0S9iYsGp7t9auogAqGw+81v+hxyLZyQrcPMwkEYrG0AsHDvyFOsj
X-Gm-Gg: AR+sD13aJ8E9HxFLPd/iwISWC0iMTDyOxjknc+i6jle5jzyEBydn+m8OadNlijCvuRz
	fYV0gB7Z+1e0UVvksYmlIp1Uh2F3VH0adiqoLCNUtzfpO+nOrnTtLDX9In8qX64Dn8+A3M2XrJE
	DwjY2y/vgtCG0K9chuxd5r1/yLXChwY+09SuH+pqnYNbr8Y7fuR+VqnixxBrKIUSnoGO6iYm0tR
	T98FOODIsWwBK0XIJQl19TOvNlIFoHMd/R790amziuk4LgvQv5n+SXgGBTXKAK6nClxpDMXJrIM
	0/DeCPi4ufEcHiDg7bq6kX3j4v0pe2fe4yA7+l+MuNjyg1YEPQvrGoVbIU5/IEum2yTQA9WjbpC
	2JEkhbOOZMeFAfB59d2Bp5g==
X-Received: by 2002:a17:90b:1809:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3903c583c08mr11593190a91.9.1785999861483;
        Thu, 06 Aug 2026 00:04:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1809:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3903c583c08mr11593141a91.9.1785999861120;
        Thu, 06 Aug 2026 00:04:21 -0700 (PDT)
Received: from cse-cd02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085e4a2a5sm933308a91.14.2026.08.06.00.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:04:20 -0700 (PDT)
From: Jia Yang <jia.yang@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 15:03:57 +0800
Subject: [PATCH 2/2] mailbox: qcom-cpucp: handle NULL data in send_data
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-2-d302a63dfb5e@oss.qualcomm.com>
References: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-0-d302a63dfb5e@oss.qualcomm.com>
In-Reply-To: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-0-d302a63dfb5e@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, jie.gan@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, Jia Yang <jia.yang@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: DuoYN3CpkXZ4yJ9LBn4eLwzuuGPbX9mq
X-Proofpoint-ORIG-GUID: DuoYN3CpkXZ4yJ9LBn4eLwzuuGPbX9mq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX1Gu3Ks5UIoXf
 bf1SkKsnIvvxh2xmerAvwElz7oB5i+Q0uTDdYil9nK24Wd2hVIL6SCoLvTVEhEveYvuyZ1yGkuT
 F2HeEwphnuSAeOa0r6WZR/kcuFKDTiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX2nYRBoyFnybG
 S6rWE38MfkmptFmLHUWdyo7fCy6xSSVZ3mXkBMP3hTEd86/v8XJYCmpwt0qVYPajWmdaymCpI+n
 g+PhbRGIWR12F+LKBKZmzuLFcS8fKUMjfknhnjxEzoh31awiOdybwtzwf0ffIUtnmulZkSTmiGm
 aEBL0s6+hkhmQ5l0pWB09dL8RnEogz5brUuo0ZZmVSAFYmzJ9nkqJZGpALuop6JfEjppQ2frUQc
 WWiIjdd0PAW9sx4Ec/+Bk0jvNjhckNAeNQqNOys4gaPWBZ5v2eC7L9jGm6/uJ1kIzPgUuqu+05B
 JfkMowCpo0Td2gTAogGj6Dk+f63Z9mA/X9srz9THxWHQEwuimXrGAH8N3QifLfDBk9W9f+k/VYh
 EgIkRMinGb97KJBIx9XElpNSoPfJpymKqTX7oAAHAYXfNsLgzdnqUMdsX1lx+OqZqZM5vteg1rf
 NhwlJYrm+3I1718f5Sg==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a7431f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Et7Q1aUyyLuhVTyguf0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052

mailbox_clear_channel() calls mbox_send_message() with NULL data to
notify the remote side that the RX channel has been cleared.
qcom_cpucp_mbox_send_data() blindly dereferenced the data pointer,
causing a NULL pointer dereference kernel panic when invoked from
this path under PREEMPT_RT.

Add an explicit NULL check and return early without writing to the
TX register, which is the correct behaviour for a channel-clear
notification.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 0f7fe189e8b1..298b357c0f9a 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -117,6 +117,14 @@ static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
 	unsigned long chan_id = channel_number(chan);
 	u32 *val = data;
 
+	/*
+	 * mailbox_clear_channel() calls mbox_send_message() with NULL data to
+	 * signal the remote side that the channel has been cleared.  Nothing
+	 * needs to be written to the TX register in that case, so just return.
+	 */
+	if (!val)
+		return 0;
+
 	writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD(chan_id) + APSS_CPUCP_MBOX_CMD_OFF);
 
 	return 0;

-- 
2.43.0

