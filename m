Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C1355F4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543924; cv=none; b=SBRrjx5wVHxBZK1VTC5cFI72M437DBAHA9TBwJ4Yx9/aiPlRFNR8EvKl5DS6xWnXhx5An4UumpvQqx121CbqEFIiW1Jup3mDA8p9gAEnLYwx+oB60sWsB7gP8xdilJQ/rA1B1ytjn8Oqc8UbtsyD/2C9I4dJSS/i4X0phPxd2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543924; c=relaxed/simple;
	bh=ZyrfuVHgzNC+PNVJXQV98WMFauqBlawhDtQ1dt6HL3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OKRL7sHxfBMYcsW6z6uwQUE7vd1MD5Okm685TtuPYOzs7DLrJEq5THCPWklsOFs0hGfw1V8AJ0xnC6nY/Le136cjWaasvk5PyDk4d2FzX+qcPUsFxjoamEEWy0LeUjvogcbGmKJ0DVJ+Yka8GMxTmxhQQasY/8uzNnCwOHJJTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6tFYu5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIA7RURg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6tFYu5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIA7RURg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69eVh1163430
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P8KKfo5sbLQxqOv5tsVd5a
	F9hIQUbmwLnJcNjmMKWlM=; b=E6tFYu5RTnjHy/yR2Xg2gpx6iuSZCbHwWErCqp
	RXrefFJX2w6can1u6qKKBm7O28zRH+4dY3/J5TES7GxpfakGI4+yjPvkymwvaZ5S
	RarpURDc4Q1dc4NPkaWg3+lChl9Q04mWPa2p9h6Oio+p6KTxVn+qN7tgwwsmj5Ex
	N7TpDBuHUuppBTssySh1t1kpNYOif+PkcHXpELJzfm09H1j9IyVwzbF/7bAyg70v
	ds8zQXBvHttBpSWWxxcLj98NoY7bAAhcTJz+Pps2uhhCHjdil2z8dUailEFkGnda
	3ohf7dC9fqOkcK4Yjso8/0J2xL/dkZqhPv7OrDQTvfYAHrBQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63dw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:31:43 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47b7f5b898aso2830870fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789543903; x=1790148703; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P8KKfo5sbLQxqOv5tsVd5aF9hIQUbmwLnJcNjmMKWlM=;
        b=QIA7RURgPUfdiKMpgs70MSzys7QmNOpWj4D1U6l/HdjBVgGnLDXc9KaI9+/GjZ6dSF
         AaQaNfJMkqR+Wh497NDM/NcNq2f/G3lq35C4s7d8nUhA+qFW/Nj1zzzX9Zker0EIZx+e
         zfXMkHfP3DlZY4DK6roE3iS+hbO4lMFqUGRzYF9q+eWgn1ohf5MgN3Afyhf30vo/rfWa
         e4zO4lXqfIk6a9ejLwxfAcFmnrydBF2zdJV+J6MbgywM1GOxA4qo4DM2V5W21OfJ3CW2
         +VhI3tJx5yQWLxkBv9qG1sRnEHFFEmtUrk53FvqKDroH0jlOP/mIl1IhH0i74EzPEz9O
         erVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543903; x=1790148703;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P8KKfo5sbLQxqOv5tsVd5aF9hIQUbmwLnJcNjmMKWlM=;
        b=LSUuxCFGtiRDsSLLN/X/bBnU0Rge3gN9x1rReq/B8adTGjRNbhKKiotHrToO5hKwCs
         H6B/7uBDuVfillWZFCwqJMZPvXUezvUQr40UdAEP8+Jtu9P1fYcsCLoYv5p1QyDAwA4L
         FywuYxfbOV0E2Gf4LIzEvB6AbrdPu1W0CRJi6wRXxaUgiVj2lCO781v+BewgecbWxV/5
         bO+t+XQSRIETvrF495w0IimqOznn34ETCaal3kj7eZQutd9smXGBq1bbiYqXKzjge+kY
         GhDjskC2i9/2CwdjUKEv/dIwTtt4je83JdP0x0duxfDF30Xf5jMDnSk8RxkXUCGVswfo
         rDRA==
X-Forwarded-Encrypted: i=1; AKwUvBzeqJUil+PkCblQZ9Zsk+R+203oQte1BvPUqB0XBOeP7jRt6Y2EbfC02sr/o9PYEdr1cuz5S3o3fvcQYSDf@vger.kernel.org
X-Gm-Message-State: AFuF++kTNym4oiZo0NoGF3ZPEurCLOXJhfzyJmSrRa/Gd+qtcH1fB2Ym
	w4b1HKMqXpOUX0UzTriFt7SB3cqa/mgNNPzu+3CUb60NFYdgg8sAJQ5tZTgUBYNLPlaJ0l/HH0G
	rlSXFmJxEpan0i9P1WvgbOR30BdrW/5ol/y7hE1TcFgx1z7wd2vTtu1OHVKdfCZwZKhBr
X-Gm-Gg: AYBFou3gy7+X0WoNbQ0lPna4IKHslx0/kLtrggybKt9cU1HY9TzkCGzggQYSar+K1LI
	nlRZymerJyD8dEE/dP1S3+I8HFEIKLYYu6d8jYUAl0OsBBKAJ1DAWevEizzmnsA7sdFLSR1esMs
	EuA3iCludGQq0epGWntIpc59jAZyu0BDX788wXtkwtlI4BVp+bpIlcHivcp0zdfnLgoo2XJIebn
	DJtdEKaJ5sPYihlv57P13ac5FdzfisPhFxOak32lrrnSQ3tPe2+5ln2wlzzg7l5hG3rRhiB6/Wl
	klHOnzOMx9tHP7lNEHfblL7J8d46aiQnmJQ3IM8zZT6fgDCiFAhBXo4YNuPcVzLxN9IHLIOQNyL
	D+l80gbzcQHBt/HhNCFM+vV8XwCsjU53eYVp1jw==
X-Received: by 2002:a4a:e914:0:b0:6ae:a950:9faa with SMTP id 006d021491bc7-6c7d15d0823mr1579562eaf.10.1789543902745;
        Wed, 16 Sep 2026 00:31:42 -0700 (PDT)
X-Received: by 2002:a4a:e914:0:b0:6ae:a950:9faa with SMTP id 006d021491bc7-6c7d15d0823mr1579538eaf.10.1789543902286;
        Wed, 16 Sep 2026 00:31:42 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm5696661eec.28.2026.09.16.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:31:41 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:01:36 +0530
Subject: [PATCH] mailbox: qcom-ipcc: remove stray disable_irq_wake() call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdFqmoC/yXMSw6CMBAA0KuQWdsEmoagVzGm6UwHHT/YdABNC
 Hen6PJt3gLKWVjhVC2QeRaV91DQHCqgWxiubCQWg61tWx+b1qAzkoj8JzzYR9GAT/ZT0jFzeBn
 bIWHsHHHvoBwpcy/f33++/K0T3pnGPYV13QDMntCxgQAAAA==
X-Change-ID: 20260916-b4-ipcc_wake_disable_upstream-28bcbd84cef4
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789543899; l=1453;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=ZyrfuVHgzNC+PNVJXQV98WMFauqBlawhDtQ1dt6HL3s=;
 b=OaTATW+9t4dQW4ufEg94XiS191mo0u4uXO+4JQKayV8CRmamhn6BbHrrCCGEBzbw9QF4x/SAx
 NRg/dOIB5QdAnCl0KYjqN5lYJQm4zKYJfLQcrwl7DLVl2imcsn42eUU
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa45df cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1FHrmId7_miOwZ4Rhn0A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA5NiBTYWx0ZWRfXyTYgEe95jXIz
 /RIWc/whEelrL6ZaM+hQiF+ESz+APfXDtj9Ao1LsO+UeD7MuG0yVqfDHtg/9aot2udYgD97YmyX
 Z1LKSDh5+aUWnDKV+6nNa2pgRmwcyVg3cTb2D6RY5X8bAY0v8iQRfG23Ch2wS9d4nKEe7vcXnqZ
 4LZr+j3lcJcELmGK59QEdiP+htJgSeKRP15AiS4OoPY4++skiq4tfpLaB1TFKciqN8kcR8svoOh
 m9zXPGU9Fh8c0mYLBRkGJrbVUMq/Q4IhuhUBGGGmq1Lpbxewa7JmfZymO+lpQxTSwbXDjvCF7uC
 eAMWdPXGUT3yChDMtMOlSoWaiBM0WOUv4lzKLBR04wZ9jshZnm9aNxsBo9styBMwaCV/vTU+mx3
 QPkaqX5LJ4vjhqcBpe0LD6q6IoAB2RXnlsAUkR12ZiGHxJjMV1G1/gVZw39gwDfip2+ICyvqvQZ
 r168TsCmlfKv1uVJLcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA5NiBTYWx0ZWRfX7+cHxZ0YxI7h
 +IIW5QrNf8Po3SY+EQ0tuuzTZDx86NL0cSTzjRHi8aLKaJK0nAe0b5YoxC34V+quWd1SPGCJDyY
 ToUfElLbiz8rF6GXhAs2KKtBaJ3TB1g=
X-Proofpoint-GUID: 66h1DGeHluyZnU8n6Jt_yQCir9ZuaDKL
X-Proofpoint-ORIG-GUID: 66h1DGeHluyZnU8n6Jt_yQCir9ZuaDKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160096

Commit afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up
from suspend") replaced enable_irq_wake() with IRQF_NO_SUSPEND on the
IRQ request, but left the paired disable_irq_wake() in remove()
behind.

disable_irq_wake() decrements the IRQ's wake_depth. With no matching
enable_irq_wake() left to increment it, wake_depth stays at 0 and
irq_set_irq_wake() reports:

  WARN(1, "Unbalanced IRQ %d wake disable\n", irq)

on every unbind. Since there is no enable_irq_wake() to pair it with,
remove the stray disable_irq_wake() call; IRQF_NO_SUSPEND already
provides the intended wake behaviour.

Fixes: afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up from suspend")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 185b63f724d4..759577055671 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -348,7 +348,6 @@ static void qcom_ipcc_remove(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc = platform_get_drvdata(pdev);
 
-	disable_irq_wake(ipcc->irq);
 	irq_domain_remove(ipcc->irq_domain);
 }
 

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-b4-ipcc_wake_disable_upstream-28bcbd84cef4

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

