Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1DA38E119
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570920; cv=none; b=VJp82MwO2SWn2X50JI72cVtnMJmTvTtMGAsmSt7/7QbhZc95Ica12DW1XVtkmKcryl5U+aHPN5yZ6xfccJ387Ze06p0/DR37RxaL1ovJp/YsgLzqzEdptPAW32gH4o0cLstsqXVgQYBoyEkBaZ4dnfYUld0TEi9NiMH0HJEqLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570920; c=relaxed/simple;
	bh=y2k61bLaxakC11xmIND99HCevfgEkScpEhGzbvIkkXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrwhJTb9/BAOD18mGLRfneJiQYTgPw43EDdThQSrDamg+ZVQxjRibYXJe1Cdrjx0oQwrYjVe1Ou3081uwU8cVXk45Zy2pfMCPlPLIqFkA6DGwjF0n7xCzIqWoS1VutCpP+2f+E5iPnXMWHiH0jg9mY58QJ7+1lA6118slgZ05dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrsQ/At1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1QYAzMk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrsQ/At1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1QYAzMk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYwF2372307
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYF8IMeScLS8uXOagtGPkjVovyxJMz305NPZ1OMf6D0=; b=DrsQ/At1BkqIW5SJ
	1Ug2h1z697x60kZ6pcWAdp9YIBS5SGu6qE3ugXMp74AS3EgTMN/sF24/6uTy7KGL
	noFUjjLxKbeLlVCvd5sJ8FFz6NlRHQE3pYoqAP81BkpKfEigkosbAkAuqYFrRvVW
	R1YvaDvey9yItrInIh8CITS6W1pbtgdf7WeR8tVXB8cPF5HH+FEzawFXLthNSMZJ
	N1BeLda4Ppo9P8J7leRZHlxXu5QvMl4Y3wsOBlPy/gDC3DznjamJx47gT+21tPXx
	/uOiI4caUKOhh6r0l+ZP/Ty174Lbsa9ZQCR1Us7Z16cICtj9phkbABlfZagFXLdm
	mgVdJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshbjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so7321281a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570916; x=1788175716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYF8IMeScLS8uXOagtGPkjVovyxJMz305NPZ1OMf6D0=;
        b=P1QYAzMkKl6ON0EelKI9tdSkg5X52vS/oXdKEH3rpnDjb0pA0It1hCS6RID/3NZzbX
         wcXfxaLEW4VDdDeK1LoBvEROY912buStkw9+Rwy1oKhOqLLgARDkRPxRg+E62crGpRas
         D3kkLjHLdNJDAIokujV83DvLcAh80t5iYiXYInlQaq1ZlncqffPv09nOrfbfctQW7LvK
         NITKfg1mpudXe0hTuLBF8OtTGNDnKajpHdlqQo7hrWe8WswNW+vunHK833ukjBVAWeJe
         A8CfzRGJIK7cJsSTGpDabvM8ovuKgvcU7xBbSEa+MeyaLM6xOSgt9ZqB0QsCFWLCFZk6
         ni2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570916; x=1788175716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYF8IMeScLS8uXOagtGPkjVovyxJMz305NPZ1OMf6D0=;
        b=Np6uXKjPNjpj8v/TCEVLVDvxkIWmsUjhh01g2ggfARgDTi4EJCeu9m/vyJhvw1ku1i
         0nZLE2ANrMqt2qtaUQ5ceRU+aEtGHJsG76pNWskOHOvbN58n50c0h7Qbn/Cs4QSwjBkX
         BMQW2405nLzDUk+X+vCKzSOxEByvEsRoB8NGvbM69DC4hW5C8iCaCHdA3q1//QW6CbGd
         StGQ9oKWf2VetAGJ526/50AEm7DHfWo6PxIemQ/txZq7a7OkaYiBunyU/Kfh49hnkUq0
         l3NWvWCoVP6z457KmysaZw7TlgZnx8qHwaAtr5NP+ZENQ7g7CHmqiwupXEI6wYKKccQ+
         47wQ==
X-Gm-Message-State: AFuF++lo5650vdE0UjMnz+Vo0rIHkp5jBu/AbF6MUQjYMhFfwsCUnWb1
	bmeUFx5Fj+qpgb7Sgn0svHJbbgYZ3EU6MBYDWVoIccD0noImMgfLJ7U5s1OQngPAn4bPPWIBpv2
	qA8meZuu2ZC3uGK2o3luZOiHurFAWLb2OO0wHb8cVXjHfIAEu1yhocLOI2B+arEiACxsG
X-Gm-Gg: AR+sD120Yn2MhsvHO6JLk6KRrl2MT+efxMnY5dZVOa0cPmtZoz3gdP0zC3aqcMe1ZJ+
	pBmhYit5Sdb3U2wawEGoN5wq1q+IrUr1mEvufxRBFt4SNKktVhMDxeJQJwOySNEFK4eKRtraCCq
	WLqP5goM04d1A29IxV1GH/sDRqfmP9md+frr14+Tw/EoUbbPmfkA86VuG8QVZT+DYobiOJsrLxO
	aQzqNoNuu8F/GHGvz6HIlippyIhASxu/iffuPjN2UyBOIT1TqxST0fpjGWnVLL/ZWc8a3ftoj3v
	ya0HvI3nYOECuM8P/GRs0/e3kFDm/n3j+dLn2Daq1EMVmEV4nD9CLki3SWHGffbDbYHIHaUpWTr
	x02Zf0jZKXb9owEBd
X-Received: by 2002:a17:90b:580d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395df24e757mr34344893a91.9.1787570916294;
        Mon, 24 Aug 2026 04:28:36 -0700 (PDT)
X-Received: by 2002:a17:90b:580d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395df24e757mr34344681a91.9.1787570915598;
        Mon, 24 Aug 2026 04:28:35 -0700 (PDT)
Received: from [10.213.109.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af750esm9825643a91.11.2026.08.24.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:28:33 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:04 +0530
Subject: [PATCH 1/4] phy: qcom: qmp-combo: delay Type-C mux switch while DP
 PHY is initializing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570901; l=1390;
 i=saurabh.anand@oss.qualcomm.com; s=20260824; h=from:subject:message-id;
 bh=y2k61bLaxakC11xmIND99HCevfgEkScpEhGzbvIkkXg=;
 b=YnnBPYMDGOpuT28P13YjgvNgaUOm0REayyFOl+w9n1bbmuJYRSC7ZPy5YJYHSEBYNFN1d8YLv
 Rc8x5As6KkpDsdlwWZrEpgf+gGmLjqagkMCGtUsW2tIEzhikWNOlVr7
X-Developer-Key: i=saurabh.anand@oss.qualcomm.com; a=ed25519;
 pk=AzGwbGUPO11yi5XTeGyJKOJWLfzXp5Dru4z+PCg/uXs=
X-Proofpoint-GUID: vcMXHkD63ndUK3YVx98mpoJPwupJrP_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX1dci4BXuwy8T
 JNSlfbwwRN9DIQ3zI5+MvRbhtnerLWAkTYWG/vC3t6g5FME4a749PfzRbrPfY4P4rNuql3YOCZ8
 NsqWkNH+Iv7PErdoGpcqdn4LE8plvLNlxkdNoNHwiu8i3geqafDF9AemIg524iXkMl9FcZGNDeT
 GLQgcplv/bbhJTDptfiOPy4X+6doK0usD+LtX+4vr+UBJOdnlF0vxwLYsbVd1lFPYuVEjUJlhLT
 zPs5LGGB5vDawIoaGAyShBVL3zO2rb6po4KfXzumMeIBtIe5dMGJIx6xdLGMoR0z7oDVqtAKVUY
 Whia2WvWMBKkfTZmgbM5gdobEWlILQnL2JbOQ/Z6yJMSLMEbQoiPAA9LlTGH6fFu046UZKSBmjt
 C+Rcuh2HlzWbmmTrQVEDJZp7Uhjh+af7w3IS5/64zMI5QrxIZByrW8Vk1pCTLjzRUdKj1wCHpRN
 XswqDUbboKQ4+J4Hkow==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c2ae5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HxeoS3nH6iSbXD-5zs0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vcMXHkD63ndUK3YVx98mpoJPwupJrP_D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX3hxSoCw2InJI
 00C/X80zKc6dXnm8UFggghuXIxuFk+UWNBck0JS5YyqLlUbKajRO0tqEANQoX1MSRl0cs46Js90
 xx9Q44FIq4tk1lqcbUSZnrzPhdDGBZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

The Type-C mux switch guard only checked dp_powered_on, which is set in
qmp_combo_dp_power_on(). However there is a race window between
qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
is non-zero but dp_powered_on is still false. A Type-C orientation change
arriving in this window would proceed with the mux switch while the DP PHY
is mid-initialization, corrupting the PHY state.

Extend the guard to also block the mux switch when dp_init_count is
non-zero, covering the full period from dp_init through dp_power_on.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..f23aff79ca08 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4842,7 +4842,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		return 0;
 	}
 
-	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
+	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY &&
+	    (qmp->dp_powered_on || qmp->dp_init_count)) {
 		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
 		return 0;
 	}

-- 
2.34.1

