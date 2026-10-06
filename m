Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC853B05A1
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278068; cv=none; b=HtJ4vu06cBn+f1C3758CoZ78f/Zb8QMsfEZ/EpcUDiy0PGuvkadRBvfKjhnrCVb0lth042haTUVsS7AE8PnP1F8XFWdtsAsZ2ZAgDcX4IO8KAgqynayQOoAw4tqoRtockhf35OiEmit6xib2b12AXdJsBEHPGJMpDWq1shd4DmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278068; c=relaxed/simple;
	bh=afvAdccsDj+LYlX8dih/LH6AxUYZ5OKQWcNPiIeVREw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpG7AJgAImWeOrTzBX2nH1Ax30QXStYzBx+P0AtNWKBot002uBUkhNO+NOi3ikmtjgN0aE0nApI/sMEuNPmfWJ0DAFPA4eVSPaxxCNlXRx24FqiWYbiZO8G6sR2NybI08kwUuUuojfl4x+QTxE4dKEINPMg7COQ7MgSI81McRp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiVsgql7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXp1HZMo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiVsgql7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXp1HZMo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eBF6095668
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iV6yZq6GjYXPIN/5wta3h57MIQW/urAQNkwlKYv4p70=; b=aiVsgql7LweEKqq0
	bvZaXElhMxeMsnZTwta3dgJQLjkbYCtvTbDUYwy0pE7TD6uw/ykTFI0zCX1PeOkd
	UWrqjCcAyfHU/lNvHCcJPODO7GcAo/iJu6c30Yl/GyPiPoOq6X5aV2AYr3isZ/ai
	SI8YIYyrelfepVI8ZIhR5pa+FmdvC2LBGbGQLvJ4VDbbl5FCuwXCSzWRkjQdbnuL
	ZbHyCvyWjuzyP1HkQleljYVKCye+I5ghGvLFEk9Ck35qKGoNQ3rvMnXpaM4vHbMu
	g6z5Wl7dY/6adP/ST6V5ISrPcZJ0fdRmIiD5SrqirWoHJ3QPhxg9Meo7G6oWfPGD
	3nfm5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jw1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:14:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so606414a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278065; x=1791882865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iV6yZq6GjYXPIN/5wta3h57MIQW/urAQNkwlKYv4p70=;
        b=OXp1HZMoIyt/IKUY7nolDVELdChgpw+KNifeS1wC2G673bJtLu4X+vjZPh2TeSXRV0
         aKDyODEJ3bfSOB7cpYBXHDDSpEICjUsa9HnBcwGCLMFMScCrn1yerCpEsNWkbkMNjxyA
         b2Zil8ZeGcKUrp22POUIfBem7/XkDqWidk+4ooEFM4mPyck7e44slilCxpOgu/V7fuJA
         WvbnbLupJ704Rs7v9rq8nkfl2NgzqRpN04emYK351ZG8WedQ97y7Ew0TQN7UKiBjEVBA
         Is3s9/e0nS7/YasuP+5azmxsUa5GcAlWH9c6gZFk/AFb/OT3Ke1uPHqJrqqD5iTgxHE3
         m6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278065; x=1791882865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iV6yZq6GjYXPIN/5wta3h57MIQW/urAQNkwlKYv4p70=;
        b=Jdc7RkCGZ1XMjCTXSZZjUYVVzHCzG3/nYVJ5xF/eiSzI4O54L+ak4BvwxPqqApjgZi
         6tqwPPpUtHqAVZ/36q+gobuHOWRNXDKZuZap+7UbDuae4eNmzhG1DUXVQ6VbCahXjmVO
         ZwJjkA4+eI5UmFMoarHiruIgY90RcFhgHa54I6Jyko3u+G0NBr/xUPzh2EAyvqUNJdPU
         499zTbBmcAlDlrCG0rO6c6SagsyW7Nho/cAV3rtn/h+CmzPGrDMuSG18ZEDd3qVFb+VN
         CM90E7te2O9PIJ4REQTWVVLwZNpNI/0kVtuTidzjRxvW9a6Cfpn4H/X9jzJShFz5yc0x
         tjoA==
X-Forwarded-Encrypted: i=1; AKwUvBwQMhaHcP2otTALBaQptXJSbDP93BUn8Eaow9SMxpgU4OD4wGMeWiciTjYu+Z1YNVFPkSCpLzN/oUb1ZVmJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJkKb3XIt0Y0TPrzxCpZu/Hao/6oTeL1WY2OMk2nuoFZrI8AmCj
	WMMkAFKhxDd+VtR8IbuFw/hxsGFiF+aEXJsRBah25XRpv9NQYQ6lij5G5t8tLOauiDz96/B/ski
	B36KRinsd+vYXfBRSwucAfX8TbvnEr8UD7bk37kScgGimvLMFSQckHOR+DZZaNrYYm2Dl
X-Gm-Gg: AYBFou2lsQgBhXkmgJhqQIdfAun+udHzxwW2BilKVt5cWc2hCBZ218ClnDdMecK0QHZ
	kPC7l+A4uEgnXa/zVjIsyv6pmbHOdQBkDqnlCCUwV4hX5/PzCxcSc1qHwTYBsCfzkfWhKrDjqGm
	yeSD3igDFeVwPOjNhxi5iEFX1+vVwYEy2KzScDdnGHWIvBgml7j+1yu8DvAlIwzzUYTcgGROeBG
	+ShibI0/fuWBzp5sZakx1DtYWURnY7MLrWvgtoErEvn9npwVW7h8mSWG4IanfuAfa7tQjsg1q53
	50jwO2IbbO9hjxcrSJyiW9WSVO2xblOxxxj4sa7GfCdRyLVzF8mLoKqe8ENQ71JLW3Jrv50GZX3
	FLCJWFCYxMSAmqHc+tkP4TBaNANaZir/Ovvyg
X-Received: by 2002:a17:90b:1a82:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3a8726c51fbmr486378a91.3.1791278065483;
        Tue, 06 Oct 2026 02:14:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1a82:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3a8726c51fbmr486368a91.3.1791278064964;
        Tue, 06 Oct 2026 02:14:24 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm10199342a91.3.2026.10.06.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:14:24 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 14:44:14 +0530
Subject: [PATCH 1/2] mailbox: qcom-ipcc: Remove redundant
 mbox_controller_unregister() on probe failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mbox_double_unregister_fix-v1-1-9011ca208d36@oss.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791278058; l=1156;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=afvAdccsDj+LYlX8dih/LH6AxUYZ5OKQWcNPiIeVREw=;
 b=lZNYRvXvJqs6cbxNpo17xAVYd0Wu2Si/YHwTUcmc0ucwmjsZ1orY/ZP+SIugwXgHlU3Vh7ru4
 O7F/TQMQSaGBChpYFHLy21bOANeS59KsdcDfGKiACt9Xq9BjhnjBhVu
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: Ilth1jx3nQBXpfkPD8VLld-IyS53LtFo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX9NK8Ys5IFTNG
 ZraYP8Nxw1N/udvEub1/wFhAyqdcTpprY/O17tjC1L3w66+7jxIMUrT2FQVF49+dRfc2vrsiMUc
 hbzehCh8G9OZtcH5LRcSWXIgbBsBno4=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4bbf2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UIB2xnHzUC-C5vITtEMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfXzu7TB3edN6vT
 Z3DhYqohoYQdVT4qdy80Y9O07J1aon+Cun5KXMdIPmbwqOLG8O3XZ0sDEZkptaZGT+cgy0Rhf1Y
 NNVOlWH9TUOYqimzLbpFFXNyAfATP9rR9qG5VBUTcAwo9LIvX19ubHqLsVbzuTVnsHz9l4CI85c
 BevA8omNjGA3L01F5R6Kufx1uVAo/13UWUI9v/Fk+D9cxnG+WQHg7TpdgNxXsDHLrpbSLkMhVOm
 GbnK6mWAismDuSayBrOz3E68J96xXliutpNmCdJrdURGGsPNC89NytVer6Ut/fB9o9CXbmyxvUX
 h21JrkF3vvtt6JkVIBGF97jl9cVar3RkB9hC1EJG8JY7vG7YMTcQZr2MB1VOaO/oY4D5AyzDPbG
 sNdX0WptPNE0rpWhELryhuJ19d8+KgAaVHA7/2xbZs8HJsY3/Post5iOerZ8NDIhNpYgCNdu5dA
 NZK7OEnYi+j7x+WMEDw==
X-Proofpoint-GUID: Ilth1jx3nQBXpfkPD8VLld-IyS53LtFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060036

qcom_ipcc_probe() registers the mailbox controller via
devm_mbox_controller_register(), which automatically calls
mbox_controller_unregister() through devres when the device is removed
or probe fails. If devm_request_irq() subsequently fails, the
err_req_irq: label also manually calls mbox_controller_unregister(),
resulting in a double call that corrupts the global mailbox controller
list and causes a kernel panic.

Remove the redundant manual call and rely on devres for cleanup.

Fixes: e9d50e4b4d04 ("mailbox: qcom-ipcc: Dynamic alloc for channel arrangement")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 185b63f724d4..206ad4884987 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -336,8 +336,6 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	return 0;
 
 err_req_irq:
-	if (ipcc->num_chans)
-		mbox_controller_unregister(&ipcc->mbox);
 err_mbox:
 	irq_domain_remove(ipcc->irq_domain);
 

-- 
2.43.0

