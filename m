Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE83B19B7
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999859; cv=none; b=GcQ1mjeiQWDt0iaX+rRjJFBbRoi66zaZ3Qyyg9ATnQrrE8AK28/GG3LpOFekrKczxNydFh59bNOQzF6ylErCmMx7+fs37jKN24tTMXH0XqIZZmaF1ka79NXD9QkYpG5IQZ52YsXL3GxRAvgIVySYa5o3xEgkTOPrpPhi80WM95c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999859; c=relaxed/simple;
	bh=BYfAIee57T5io1Zqj9+0qDuXvAu6FrFFjj5tJYNodcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JejEcvTNcO1358beRLvj6/LsWoU7CLhkbjr7YjqtyeEN9VVuPTcLWbwyavYuVXty+ZLEHdm0hFNVbJbUHS/LyureKYHnGELPUYq/hgZkCCgf/M6CX+OlhxfRg3pTf+B9+GQNokJPKYbxVhNjKPEE1JeMugePXaGm3yDzjeAketk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGynNq4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXQNq7oh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGynNq4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXQNq7oh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nb3SR4063342
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 07:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22uyTP7LDLXXvvcRrMs/fMN3tX7bdiG9lSsWhVhAkaQ=; b=CGynNq4sSoOdSsqf
	8sRIcqLk0mE2uodikEdnh5UxeS9VPcC5FrMAcCJj6QJnpcsjyVA1tYy+yvURV7JP
	q3F3+lHPQ40nICqkypQFaS0LxaKQtxy+Lc10II+pgnLF5jwFEEMwi1gF47Na6ICZ
	np/z8dY3xTwtVuSlM9uZpdVYLI4ZpInXN3tyxsh8z30nSxnsVHhQsYQaqu88pX+T
	oZ57NfjVUQ4xNJI60SkbLX5BALQUGu0CTX8wVsbutoViIzfaVdlonymJGp6vVnKO
	nlFcMEl82SHJTEo+WOdEsaSYV7BOUOEUHaJVCErG4q9qFLT+heB/nw2h8vfW62OD
	89sEmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5m35d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 07:04:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38827cee19eso2470986a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999857; x=1786604657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22uyTP7LDLXXvvcRrMs/fMN3tX7bdiG9lSsWhVhAkaQ=;
        b=YXQNq7ohAwuTAEB80xsfymU3wPp9qU/bMjmFVS/ZaMEyKQN6ffgpSjnFEOa/q4Z/TR
         fnNSCESSX7qURpynF96MPHIYUaZN0pJm8K+6uFFPOcKcsEEECE48HX1Diwn44W1M1dsd
         696IpSLYmFZYF+V5k2FoY2sPOZWWiNBvkePx+zDu1YJjDy8eeL1u3tyIl2WsY9kAqXgi
         wT7PGwnhwBPTV4ZcmF4EbYzHnG1El5T3t3wJqeyMORuEXvflwZ09KaDiUkC5I8OYRIZC
         joRjxa1MNVVCvNM2E97EOQ5LXGuMcrMbnlopUf+3T0Po4voKb3yVqflLktyPeUv9CHBZ
         XmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999857; x=1786604657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22uyTP7LDLXXvvcRrMs/fMN3tX7bdiG9lSsWhVhAkaQ=;
        b=on6c4CaHnf6ViFJ/wlvFXqarb3tDI6S7cD7Wvoknjks+cbUH07qAc+2ZdV2OOu0UsC
         wVvnAS49wiJp5Ow3QieK/lyMEjl9ZBXilwt8crGiLu222SXT8z6rmqEhlBoR4Zr64i2t
         xrlThFP75IUjwDK6ckaJm96XzqK4oM+7d8Fea79hWkvA7lCeAIFd/lOF/P8k/a+wk0bb
         e/38F56FjgFIoBoduC5uYx668ySkw/5dT4QAZMuGshZGff+W27UhkmiLWOwBAoFkL9/7
         Yn6mFMYyF3Oj14oEZj1N5sj4t9obeAXYBm+K4g7ffrTPYl5U2PxvhkNVvDnyef1UhPM7
         qvCQ==
X-Gm-Message-State: AOJu0YxyfhHyweSqTSs/orqRVNAlnY7qwY66RFpEk2oLuVi0c1jkwUvi
	HOMV5HZtE4nJov8N9srlJl50rDc+A3vJ191bKMXddr3QZKaVkJxlkl7xLNfOeJlpvGo5nhdz82W
	fIDhaN1+EM9kEEQP8HFnl23GFIO9HcIqBSGJ6Gzugk8pFyKFprKH1jUI840un/Zh0x7p2
X-Gm-Gg: AR+sD13MOt1SG8tNjZ51dpVNx59HPuugBHNTKTKintsCzxBq99jTNhs07n4z0WSAZeC
	6vIFHL6VKYJ4xG6KFb8Z0StAN9fKL9un5GrGJpacH+crVS9SHfaut2MJACNXQWK86zqLtja/ZOV
	bFh149TqGDuROv1MbHa6xyEgmhOcQvtj62bYwA9zpbkuo2uS6PDQnCa4nosCCpzIRhCqRzm5khR
	3WuHRGILO+tvy7hoCxehT2u5k+AO8J7lKSig+ZxDsamgbi1EajzNM4jNZfgBNH6Mg1xTE4vJApX
	oZwH/GFo+QIb7Sf9Ahf+azTUj637ISCWR+XEvDP1dZsZUOqSWl4Hz7KHdly6IbQ7PMpSZzD3Y3z
	9aihAd1AXci477pWonb2GQA==
X-Received: by 2002:a17:90b:540e:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-3903c681346mr14815945a91.21.1785999856857;
        Thu, 06 Aug 2026 00:04:16 -0700 (PDT)
X-Received: by 2002:a17:90b:540e:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-3903c681346mr14815859a91.21.1785999856377;
        Thu, 06 Aug 2026 00:04:16 -0700 (PDT)
Received: from cse-cd02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085e4a2a5sm933308a91.14.2026.08.06.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:04:16 -0700 (PDT)
From: Jia Yang <jia.yang@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 15:03:56 +0800
Subject: [PATCH 1/2] mailbox: qcom-cpucp: fix PREEMPT_RT self-deadlock in
 IRQ handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-1-d302a63dfb5e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfXzR7s8IpDNcnk
 4QtrYxneIWCuc0KkdM0WHkji18ZEy3VBmrUZ81NJE2WILusmBkje0TzN9jSA8AtxZYb6Np7QouF
 +hOSrS8E3TIbVkV+weMNt7qSGG4NVM/dZuatnszzJTHS3QElh5tqf6SLNhtEWdDb7HlU0YTacYl
 UdvENxsZPr4raCSL5lD25qmQbLTytwsmoXvUYQMxSu2ADlzIuYAMGnCfQt1ZnfBPYB+V0RCTpmX
 O90cHXUscVzuHfXKg5UiBVv9PorpzLxZ5dlpTlh1oj/2l8nzf3vP7MuUqTAboy8Wjayf/Yrpzzr
 z/qn69Fcjic3D7RNsJgZfV5Vb/AI7iRVJOv9ZOcxGn0yGxS+4saSThRXbFFpkVhjhKoi0t5EPSW
 A4cj8NmqqW6PtCm7ehIq4mriJ2tnpPUnbnykX1ad12IO2tjTDDvjnCt9gPo3pUvo5M5MdlzzvrX
 mnJY2VeuDNDuwcyrEoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX+IdcQ5mvUdV6
 Rvd8iQuX4YeDf1OcreBgfVq4yGMbHS/RAlgKsPrWqcnnIGJDFnMY8kwNUMQkujMkVrJsTpBogrk
 S+9ZqiMOmsY5Q7EbDQuEepxNj6me21c=
X-Proofpoint-GUID: opLEJe4K2qcBA6v1pFjPtFPPU4oY_I0u
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a7431f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-bbF8U2482To3R46JpAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: opLEJe4K2qcBA6v1pFjPtFPPU4oY_I0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052

qcom_cpucp_mbox_irq_fn() calls mbox_chan_received_data() while holding
chan->lock. Under PREEMPT_RT, spin_lock_irqsave() is converted to an
rt_spinlock (rtmutex-based), which tracks ownership and can sleep.

The callback chain triggered by mbox_chan_received_data() eventually
reaches mailbox_clear_channel() -> mbox_send_message() -> add_to_rbuf(),
which attempts to re-acquire the same chan->lock. Since rtmutex detects
the re-entrant lock attempt by the same owner, the thread blocks waiting
for a lock it already holds, causing a permanent deadlock.

This deadlock manifests as 'irq/N-apss_cpucp_mbox' stuck in D state
with the following call trace:
  rt_spin_lock -> mbox_send_message -> mailbox_clear_channel ->
  scmi_rx_callback -> mbox_chan_received_data [<- held chan->lock here]

Fix by saving chan->cl locally and clearing the HW interrupt register
inside the lock, then invoking mbox_chan_received_data() after releasing
the lock. This preserves the mutual exclusion for chan->cl access while
avoiding the lock re-entrancy that causes the PREEMPT_RT deadlock.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 862e45e8fbd5..0f7fe189e8b1 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -63,14 +63,25 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
 		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
 		struct mbox_chan *chan = &cpucp->chans[i];
+		struct mbox_client *cl;
 		unsigned long flags;
 
-		/* Provide mutual exclusion with changes to chan->cl */
+		/*
+		 * Provide mutual exclusion with changes to chan->cl.
+		 * Save cl locally and clear the HW interrupt inside the lock,
+		 * then invoke mbox_chan_received_data() outside the lock to
+		 * avoid a PREEMPT_RT self-deadlock: mbox_chan_received_data()
+		 * can call back into mbox_send_message() via scmi_rx_callback()
+		 * -> mailbox_clear_channel(), which re-acquires chan->lock
+		 * (converted to an rt_spinlock under PREEMPT_RT).
+		 */
 		spin_lock_irqsave(&chan->lock, flags);
-		if (chan->cl)
-			mbox_chan_received_data(chan, &val);
+		cl = chan->cl;
 		writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
 		spin_unlock_irqrestore(&chan->lock, flags);
+
+		if (cl)
+			mbox_chan_received_data(chan, &val);
 	}
 
 	return IRQ_HANDLED;

-- 
2.43.0

