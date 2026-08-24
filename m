Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14FC3EF0A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570912; cv=none; b=tCW3UKbN3Ok2EbgcvjF8hnpAF+nwhlMOX9gxSvWxtMF3edFem4Qu1Z6Z8piuKWlP07Xdn4KKwEv829IlWHfQbY+71jToOJhoL3a1bh3pmGo4lGgb0OVrVvojpo0Yrzn7rXuS65adblmIws8UuAxfq47slHHb18Djf+qsLXcLHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570912; c=relaxed/simple;
	bh=PswsC0kHCstclWvWwSDNMuzSq86/iBtX2wdJRtaS5ig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QoeT8SHvUlTiT+i7WYsKKjl8WWwUHzoycOQmeA3wDXSrNq50qdAzktYuckFCYB/YU2USM8KPMoBExQCke9OSlGzFv84Z3ppaU00MRuyr2qhm/F61rJ8/PWN7V9y4+hhxTVX9uCJkE5HGHQNu3kkhDCPxJZAjcrnzdntjKZCv/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkKc7P5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU4a0ziO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkKc7P5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU4a0ziO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeER2372617
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4CmRFowfZ47tSun/jApPDw
	h5aVgBOZwiAhT8GUQqJg0=; b=nkKc7P5TvknCYmEAa3ItX+YViPnb5DiIP2+Dv5
	7ewcO+RSndW1Sv4UCY8izU/UKR/JLcmyubaxXjXmFkp6QAhdoplhK3B8+oEunzoi
	tii5rqdRiLOd9EGE7EqFEzC+kapCYQ/o7I8XfQjiCRU6zGOmticuC4maxK8S0Mah
	5HGWlLB7sMy/ut3BPBSYvw4I8xo1gCwPa/rPhEbatWq/QqDBhcyMuVHT8DvUf0Az
	UvCTGOuzwS0dit+e9/r5MPLVTK4fr4H2WHK7eCSVHz46RR99auXfHuudaopxmySO
	N4PJ8SjhiAmnmhME9dQltJHJ4KVYuuAFgyEmdTvCTJBnza/w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshbhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso3392331a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570909; x=1788175709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CmRFowfZ47tSun/jApPDwh5aVgBOZwiAhT8GUQqJg0=;
        b=TU4a0ziOARGiBvtyUWmvdjwI/Rd9bzD6X3iqTpDNHB+gw7GvKOrSetqninipUSxRBo
         Ug/u0gSRcl9RZrl+bnZYeGI9rviYTd2L67d8/QhbPvWbbVPvzPRdkMg42LJVzDwkU5gl
         StTDrdfSdOTV7XNr2/sbrAFTerGpoL1HD2EnPfobz/jmh5fIS9BpykC6OAtyoxEVDb/3
         eLsDkTkmDg/tjKqFG+DuLOZvQclkSs0qSpoYQTG8XL9u7+2Z6oNDiUrjZAAx3SMOedLa
         YYAwQ9Qy4ZmXQKX0YZ0vsURF6VdmUWEi/sIGCxtEdIIxmY/67duyyn4HDFZwfOH4nr3Z
         MK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570909; x=1788175709;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CmRFowfZ47tSun/jApPDwh5aVgBOZwiAhT8GUQqJg0=;
        b=W5OGf6Zt0lRkv724dyc4G4M9cUXeD8gv9Tsos66v6RQ8SIdq8Z/WkMMUgb61V8KPM7
         qxpiGTQcd99LI3rwBPCTv4rcYCV7EUrkCujPLyw2hhuwAAjmrBP79buwQwPa7G9Nfnv6
         fzlAkhkxr6IjrASGtRqhyA28LKUtx4gkT/efJEEu762L/WKNmiwdJfmQx5ALzKRnpOpn
         SQs7LfiuNa3gTaqoMltPoSLw6uI53B/1M3kfd6u1Eh794SBnngn6ahu5jeXegStI+Q9c
         udLezGSpRFfYlIc58tgdC+tk4FrN9qp2R31vVRiR5dfC9KKmGC5gVwfoz+c835Y5/ks9
         YTKA==
X-Gm-Message-State: AFuF++neFvokRlRJXgwQr3uyt6aHilE7yFCU4rwk3mjA7fLivKIvBpNz
	vUiKILN5Nd+PrkrDq/IEB7EdpcnCQgTL7+lNAnJnX6sEW3WCg7IKwZioxC5SDYR+XaoR1LM8CSF
	Gem8+DR147mM3tuJ4Tcd+S2xfRPZ4/FtT51MJv9L2ZjuiunMCV0a5QoqhXw1lE3hpsJ28IZnVcg
	R5
X-Gm-Gg: AR+sD134V4X4Otg9u5BMEvtp+c2ZxpWgDopO+r0oBI0J+FH3UadcEaP2DEukbmWhQlY
	DvK8I5YSvIniqp01Zx4LTdg8G7rNXwSUoTIr0c6pqBpUwI1fOcugXQWg6k7tI2mBTz/nFna2BMJ
	N8XOxXlx+MPZVVKnCYAXNXQ5maP1JZD4pMgVacomOUIvgXHPbb/XWxgoAzj1ZyGAzo2UyQN2cIm
	9M9R53JGweuXvjsMS5r01UGo9+sxoa4sreJd5KfVfbPRWVxkMQs1RIQDucIaAxwXuFWo8Vg9hZh
	Iu3sVBgK5Bq4/l6maurZnJOjuOKu+HnLqb6+cMh7i3Uo35HdK4V5AubOziqcZWB2TgxBGsvnZxa
	FleyNPr3l2xllrQU3
X-Received: by 2002:a17:90b:1b42:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-395c3a06ffcmr43323209a91.12.1787570908579;
        Mon, 24 Aug 2026 04:28:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1b42:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-395c3a06ffcmr43323139a91.12.1787570908109;
        Mon, 24 Aug 2026 04:28:28 -0700 (PDT)
Received: from [10.213.109.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af750esm9825643a91.11.2026.08.24.04.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:28:27 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm/dp, phy: qcom: improve DP Type-C reconnect
 handling
Date: Mon, 24 Aug 2026 16:58:03 +0530
Message-Id: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMqjGoC/yXM0QrCMAyF4VcZuTZQu9EWX0W80CxqBNvaTFHG3
 n1RL38O55tBuQkr7LoZGr9EpWSL7aYDuh7zhVFGa/DOB5f8gA8qdxwrTp/KhI2p5Mw04VnerOh
 6F0NMIaU+ghm18W8wYn/4tz5PNzt8UViWFcsOSW2BAAAA
X-Change-ID: 20260824-qcom-dp-typec-reconnect-fixes-030767868837
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570901; l=1578;
 i=saurabh.anand@oss.qualcomm.com; s=20260824; h=from:subject:message-id;
 bh=PswsC0kHCstclWvWwSDNMuzSq86/iBtX2wdJRtaS5ig=;
 b=6hEfZ5576SLS82wemytMrt7rkgq5oL/XkzUgPwLN7shjG/6Cy6MS4tVCkL1DRpF1AySG5dqmq
 tJxt5o1FNx5Cm7QOaCyFHEuWKB8CvWmj0YNHET+IENlHWB+ag7vhu0Y
X-Developer-Key: i=saurabh.anand@oss.qualcomm.com; a=ed25519;
 pk=AzGwbGUPO11yi5XTeGyJKOJWLfzXp5Dru4z+PCg/uXs=
X-Proofpoint-GUID: dXhsG7eABft1WTlFoTZCqaoKvBUO6d0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfXyLsJNWhSJMft
 viRUCojakxBvldraSKqoT+NkYTWnye6JRWkrQzrI/RQrAhVRy+wrUkLTMg4/IZ4abKuZO2mICXh
 G+uUI+L4skjT4QHKj59HVzF0Bdnw9EdOLzFNY5kP/H7cLgVuO8+MQE4FPfDhkDeVlYxT4gN1P1H
 U22Iumsc/XUBPA3qtzEt8HClhU4QWf8daaH54s7MPKUHXXBBR9Fiajq1XAUvGKu1avkMTi6Z0Z7
 kjbbJYQrAp04jEA/u4fuchLgjPRIPGtiuf/jlSF/4hhmnZQsn5EPVxqliwGbT+sbWE3Z94yRUSx
 OzsCQDWZQ5nFEGWxc6+n8Udyv+zFB/CUyQOrZdFHXHMtuYdmzpZRRtnRA3qh2oqCvoXljXiIf1n
 Sop9a3I9Qta144PH0lygMC8D8E15VmkkNh4nnxTr0BLEuzoLT0pO0mBUmyTUJu08kIMItrWSXv8
 3bshq2xStIiU9l6v50g==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c2add cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_V60umORN3TpBg0EziMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dXhsG7eABft1WTlFoTZCqaoKvBUO6d0X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX8J2KGRsjGely
 lok8ogb0AekbeRtyw+OFaloC2szEltJ/ZAApNTzkihfn9x1+Etg3Ltb2jwZdgtafvd5MZ1u6bYJ
 dJwInsDRWvumjTyt4uCI7fcSDqY8/GA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

This series improves the Qualcomm DP Type-C bring-up and reconnect paths
by handling PHY initialization races and link-training corner cases more
consistently.

The fixes cover races and link-training corner cases in the Qualcomm DP
Type-C path. They prevent Type-C mux switching while the DP PHY is still
initializing, avoid unnecessary retraining after a successful link train,
skip LTTPR setup when no LTTPRs are present, and keep the downgrade retry
path running across transient AUX disconnects when the cable is still
plugged.

Together these changes make DP reconnect and orientation-switch
handling more robust, especially when AUX link status briefly disagrees
with Type-C cable presence during reconnect.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
Saurabh Anand (4):
      phy: qcom: qmp-combo: delay Type-C mux switch while DP PHY is initializing
      drm/msm/dp: clear force_link_train flag when link training succeeds
      drm/msm/dp: skip LTTPR init when no LTTPRs are present
      drm/msm/dp: continue link training downgrade when cable is still plugged

 drivers/gpu/drm/msm/dp/dp_ctrl.c          | 4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h          | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c       | 7 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
 4 files changed, 12 insertions(+), 3 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260824-qcom-dp-typec-reconnect-fixes-030767868837

Best regards,
--  
Saurabh Anand <saurabh.anand@oss.qualcomm.com>

