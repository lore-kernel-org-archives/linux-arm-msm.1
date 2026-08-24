Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CA440B11C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570926; cv=none; b=buZuic1ZAQfIzq+FsmslE4zUAjAgyHZ1oSMuIu7FsQivkOzmuIy0j8YQ9fZFT7s16E3F+REuFLUaUoNfrKTmjxhhi4ecMn5CdftwDplzSbtCRRtmYhubCi19q1IQ/weKPEGjHyVm3o50H75qjf41A/6TIRJZ3rC9vbHCRkTDlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570926; c=relaxed/simple;
	bh=Mk2iABepIE1j1SqlHuK8xywuEsIdXul0/MUc4PhM33o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQD7MBfMbizBUvGj/eH9vo2+1vhudCyUuU6ooJRIz+Bofi+d4YkWNrblR5bkWj0J94s+Apc1um8LGvtieX8kyqx1lBHr0FGLwtvFDmJD3av9BkpALGDogRAsduT+QjVUrJgRBqWiBB/wmOv4OtuQ1utgnAbN8L0xi0XOzf34T+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgWveR9e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7c7BgZX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgWveR9e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7c7BgZX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMPrl2743036
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLZv27GFMdz2STMsdvHGdhaNYpEqqU2M4a1flwXbgR0=; b=kgWveR9eOeTiZKf9
	JtBtq/rJHMgjCrLl3uUTfLmATdPeZn0AwKvmmPN97fAtMilH4Gxm7xK3y/nHWGfe
	XPIn7EF5PdYkyPfEFHyNspHDOCMSFCGe1PpA1QahHxrCvC0kEbTco7H2l24uQlKJ
	3j/kUV+uZkXdIj1g6VWKpa44WxmtGf7JqaeVI4xOPllPR8d6fmafJUQSZqAUel7q
	tQv8JVjkw31hoxsCshcK9zBIHyaaQi/JLtPnelTsaa3dhI9wxb5qIqqPnWPv3Ycu
	6c9BWKilvRtOrsR+ceHQOPObRGq1N7w1Qian/vGE/Ytz4djet5IooAoFtgYZUE4r
	0YgN7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0twr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so6142356a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570923; x=1788175723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLZv27GFMdz2STMsdvHGdhaNYpEqqU2M4a1flwXbgR0=;
        b=D7c7BgZXfpQb0BneiFeQChFlGYfMaEZsaO6BLhEKSX8rImYofheUvkt8YkoMo28vit
         ErnW8sMuk6+jQlwckL9vfZn98mneHo2e9G+fKaQ/2lFasV1nQKQuCZEQQf8gSV8fnX+j
         zOjI5tp7hc6BphjzzZQKFBBcLw9l5DW4eggJXxTzr4SHU8PG5xUYbJxVF7qcB/egoz+e
         Do9i3JkvV4YH+rf7YJOr1cAPqBoB7K4WQI/9vS5zYd6ftmHlRiANx7RFz0pGP3SgXj8S
         vqds4ReQYCcGhEnLWXGhL0RVpjEVpcAc+VEeSN77vjWWmyriSk64gXnPsAmz7yQyB7zx
         pIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570923; x=1788175723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLZv27GFMdz2STMsdvHGdhaNYpEqqU2M4a1flwXbgR0=;
        b=oDmlD/Q1YIGnYnb+rOK7ip8Yf8rLheINNkmwlg86Olyke8EG4Qh0efZEuhPLPSLIHR
         crJ81bGwZkDykFe6LaaiIDkswwtFe3HWtsPjo6DF0CShK/XJgvFXTiogmKoZyA5xNNGa
         PmIaRRJPocJesU7IEEmgzjR4piCNlsomTQKZpr2eRDw4BVzzG6qGtq3F8UBEGLm7Jtuo
         nFIZAasMaQv/qKUVKFdg/fSbVVMhYBkLI98OpDMYHs7CrqYU9jBzGMHI0cDKy9b1jw4t
         x/zHYYXA/Z+uXkoUPemy3xZLK4/ebtzv/O7X7IX/zbuuzawk7zmQ4uFK7yGHADNImUmn
         svjg==
X-Gm-Message-State: AFuF++llD/sCIm+8gIHZL+kRGjSA42843TgvwZauROJQ4nSb++O42MHt
	JzFjWEVu6ROgEosNnY/qSqZ02fp+/nuVPYZ0YTxkJIB377AIf2z88AHwW3G7vk8pfEQ0nWKu++/
	haIwg3Xrw4JEeySrV3Rg6YE4c4RqnjCBocAuMxdIad3Px4FTQ5YPvwpFyBj/czcZue0eb
X-Gm-Gg: AR+sD12+S9kR7gIm4eU8Fu+T16OjIko3bP4CnOz/zw7PGNgb0VvOnHvZd4KGCIM38gl
	SxB4D9oQPV6FBL5YgQBxEUWFp4PbInjcBqqwMlh1mMfh36olUMnwdGot+QQwxMxgHyDU0mYblk4
	5AtEtsF4By7+TQl2GImnJafQfKO+aGaaNaf5b/oaKlpHRQK9S8okY/3ih93++4BYazBkq4L/0UV
	Mpj9yMaEl3eOUD3Pposyu6rRLVL0bAKZp5azcr8RI1Lm9fXMUqnKWr6RckM2fNyUvwGQuZMabTd
	XocOWTha9TiW2YEGgmrVtNtS7vrq4uv+fzOjFf9U2+3SRcVwvKohoLm3nurjoM/X9MQMniVFIfK
	45oBtFqpSbiUrdzyl
X-Received: by 2002:a17:90b:4a81:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-395c34fed98mr40733957a91.4.1787570922486;
        Mon, 24 Aug 2026 04:28:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4a81:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-395c34fed98mr40733876a91.4.1787570922038;
        Mon, 24 Aug 2026 04:28:42 -0700 (PDT)
Received: from [10.213.109.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af750esm9825643a91.11.2026.08.24.04.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:28:41 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:05 +0530
Subject: [PATCH 2/4] drm/msm/dp: clear force_link_train flag when link
 training succeeds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-dp-typec-reconnect-fixes-v1-2-2825e5bf8a96@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570901; l=1035;
 i=saurabh.anand@oss.qualcomm.com; s=20260824; h=from:subject:message-id;
 bh=Mk2iABepIE1j1SqlHuK8xywuEsIdXul0/MUc4PhM33o=;
 b=xSb/4S4PD++J9HOE9OF1wpOpDqfbMO52EZhU9enL2AW1OLH6rpVrajVg5lZG4CpUFO50HQdNr
 tarYw9mrH7qDRnCK4w60xn724kYZhx8AlG7MKTQybAPWUvWyCxyQNPt
X-Developer-Key: i=saurabh.anand@oss.qualcomm.com; a=ed25519;
 pk=AzGwbGUPO11yi5XTeGyJKOJWLfzXp5Dru4z+PCg/uXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX/4jdo/NKa7uI
 lMwl/RFBY2k3KKFJBysn/h/v3gk8OOFBUAyduzPzgNQ7DEx8VL/4RBypMROPWNmnp6Jce/3HwVX
 LwxgZlXwesE1WrjwIQNoFtTlNe47iY8nZ0TPDzw29UOF9X9sQFjMVc7QN7oXIgFRFcZjFcLxe3p
 OYNIdOgplifZsHmvtHOas11H3wt+1+mnTvicZCe3bvVEzkypg8GOrNvBYqzB/krJZA+f3pr/4Wh
 M8YrB9bz/jY3bt7JVAXOgDAYAQCYp05/wnMKYxzHF2x6D2pCOmQhUbOTbw7z9ryRLO0CxHoQ9nE
 QZ8ZOW7FNmQS6NuR2yO4iJcfrEHrxwRpAcpSZblYn/KQOl6zTT/dOpu/Wa5+xrzNBs/X5fLQjXX
 Ovxp78B6gg7WQ/LWHz0HU2O0c1d2btgUbND949AIeOvGBpfAUZK84hfGjOju74gJnTCFUklt1XU
 kaTkFj8WxxLHwY5aO+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX/ZpG2skTkHWe
 nmOakF8/QTp5cROzGg6PeE28wIRIRMVWu0ihfxCNz1Chrbi/hQmnnLcaP0t/qGHO0Cc4b0lmbJk
 khADTeN/a50ToPv91kwCA9z9Ovtav+w=
X-Proofpoint-GUID: 2qthyrqBPuL4IWRTqPYkgs9pvQNJ6PHt
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c2aeb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rL4VQYfKDX0HzXWNMRkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 2qthyrqBPuL4IWRTqPYkgs9pvQNJ6PHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

msm_dp_display_prepare_link() sets force_link_train = true before calling
msm_dp_ctrl_on_link(). On success the flag was never cleared, so
msm_dp_ctrl_prepare_stream_on() would unconditionally trigger a second
link retrain even though the link was already trained.

Clear force_link_train on the success path so that
msm_dp_ctrl_prepare_stream_on() only retrains when the channel EQ check
fails, as intended.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..40e19d506a45 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -649,6 +649,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
+	force_link_train = false;
+
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 

-- 
2.34.1

