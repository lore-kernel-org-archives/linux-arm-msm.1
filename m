Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03343F0A9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656039; cv=none; b=df/UrVMRWM26TRSQbpySCjXc64v6669qdveYAIQLaAJgBi0VNiwJzc1Q8lZI4RJQnYMuwaMLdIgrLtAyYFPC8L/aOeJGqEVdInqVIMt6Zyvu5uuh+ZQgmili2BkesuvzgaQb65tQI4UjadXivV/NFclBKs5ViKiLzRBwmSFjLqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656039; c=relaxed/simple;
	bh=ep+LQunqvDuFKkYJshXFJLSFrgdqylN6OzBHcFg+RUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJ40XLpge1z6rFcjCEKNDx4B8vuDUb7EveN2PPCQxXiGptzkaJeFLyPDgsa5QyfwAaCcL6b91p7X+4e5KIAxkKAalKUS7Qbs+Dg0WCcyvBgnGjgKNbTcHidUqrgVAnFK8WDEk1lpDRH+17T0P4P7XcDfy1bOOE6iGsvrBSksfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8nIrBaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJeTXLSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8nIrBaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJeTXLSk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475Iq3390853
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=; b=S8nIrBaqZAT6zR0/
	ij379S8x35yUoJJr9fP+l+WLN72Vej9XCAZaYNjzjGI0ufr1YUKyV8LgGz33RTqV
	qapHgkCteKLLQM5ChCF9pJkQgqjaS3M049xn//ME/wfmZXURtD5SDrp44JR8XJsX
	oKPxSgxmNqa+0Y+2M7Ta3KUwVSRf4dsRlmSYgpa4YVB2dJn7KoSzqmnGJIX0fv/3
	bxYv3KzB48MIFxstr9DjWiuNxOWIYSEWgXvMExe/GUXu9Y3OOMgt3NHf+/Hnef0P
	qTxU2HGQjdV67wmhU8oUp/Nxvlq58n54u9lo4+H9ovACvMAeHiSsKQDB7BGqKlkY
	s0ws9g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkgvdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91064f6e75bso102350336d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656036; x=1791260836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=kJeTXLSkIceP2WPANr0rLC7gHjPuHAJyIsNLjv/zDTMPqbsd7pos49nWQhC3vkJj+m
         ayXnJkfr9jqMktB83GCPl8DjXoAiFV0zMRLW9nD54d/9wMQx53/TDTqGn7xGEHK9Eu7a
         CFQYPXHKvoJ+BPrW3N0mgVkxS5XoPsDcuc+zRms/zJ7B6Cpxt+7MBg1tSHSw8YG5twre
         gQy5kdmsjaIcA0P2TIBnSjLtit0A7o2XhAK7/cdYsj+P+D6eNgAYP6MoVTV1wPuCa5xi
         YX0FDDC+xAGKywZURETVq4hqWfKdTurBInQH1q2JK6mMHRexTK2pAoQOM2jUQjJBAxjF
         7RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656036; x=1791260836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=nHWWZc+xA4yJw56PUoY1bqoFXVmoDB+vf7DC85T9UeypliLZUYu6PwpMPGmDLN8cYR
         sfbfs3K6cQ+39Vuolb/XvUvfpm3DQqxNXoM4sWQ4F7ssSJO8AgmD1tQsqKLvfHQxAAIY
         I4o9Pv0RXpD9NtkgqtKht14PqPEjll+vF/QnJ/b7JvHzdL+t//6yPUQK5wmSq1ixiL6E
         wsau1j4LqD2uAwAjFnVu1AjQ1yEh5kBac/TQKEHC89ee/lzFwjDCFMbjhTc/GnTzqfzU
         aaXhZb2i+aITYDLggVeanNysNPlMZAs666V32C2dwICgZUvf9trwAkB+xmtLYBLKLECN
         GATQ==
X-Gm-Message-State: AFq9FYKeTe3hGmB7U92d2aNP7wJ6EiG+am9hmiiCVMA2jLM3t+ce0/N7
	L5cVeDNQSA3LQU17gr3gnrLPTZichZUWAqT8PZHgbip8q7FeAHtxphrJaEnlH2ZepkaKMDI+NT8
	9YUlyKySRjEqMgxEQYo/qSaKYNomjiOTI1PFcroQVFJefA1VFNkSln8FR/MYyWUNSVhXS
X-Gm-Gg: AYBFou32+OzdOSC7MkF0BD1ugSeR6s0wcEXYjIxnQbNAzq0x8VIHMNcsOEMS8KA3UTJ
	HeYvkjHk2RquUV2vLU0IxeZ8YUTi48OgQVSSek1yfeUXNPmUUMBq163KNMtj0ki7vmFmsU0fgOs
	rZIYzBvFpuMXIrRr5Catat42inx4iKMCKhbWTmnNygAvxPvq9DuNL/ffuIUQZAUKTP3qIVsIuDZ
	0DLQ+UUqZilyxNd5wb555ZVSmCik91aI0hw4MtpoN1uuCAXLJ081He25gW1eSVHWmJxwK453h4N
	+dDRimGE5zSul9OhLnwKQqrl+E6iypfjaFKDO8MvXRlq7GDEII5qwS88UbB9zsvmV25kSqxyJPe
	SHBp27i0hhY3SHV6jEN81aoVoWjuxciSCul4wGvDSyskkYF9CLOFTriLq5DdCaEw=
X-Received: by 2002:a05:6214:31a0:b0:912:517b:40f8 with SMTP id 6a1803df08f44-914324b441dmr236159526d6.42.1790656035694;
        Mon, 28 Sep 2026 21:27:15 -0700 (PDT)
X-Received: by 2002:a05:6214:31a0:b0:912:517b:40f8 with SMTP id 6a1803df08f44-914324b441dmr236159186d6.42.1790656035287;
        Mon, 28 Sep 2026 21:27:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:34 +0800
Subject: [PATCH v7 10/35] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-10-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1019;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5ZzC8/kHjYiASM/nz9B0eCAoNtT2xRTSonPMA7SeVao=;
 b=3Kl91+chLdEIrP0RlrnuzXJaUuqTMx/dlvGg9HJoRZVD7BSv/O/EbvOkCnmi/WM+yjZbuDzYD
 Jr+qQA9M02CDbvjUoPiMjGicRy6AhGzrUTQTprW7GTrqxzd2Coqxt14
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzew36s6bRM/6
 K7HpvHTuOIvOnnfZKN6zcwsPHpsmAoFoVniSwZn4LuAilX3tVOZj2aUNFuukbxX4Iwc/FyPMzuk
 DANTv2r3tLsn+U8lKONLMDAZbjUT0IqUy+V29FY3oB19JMLJu7/C0MDq1KNvz2C0eglfEJm8ODc
 GlRs1/NKDx+7YE0VZnIviOWRflhrxvqeWMFAoLh8xcFtDVgjvazRKLvbEbAyZTtUv9hSloq+6Hp
 uuHTmvx1HzNR8zP3cgEcAx6nLoqr8RqFTGodn+mje/3o0mkVl+3tgbYhbUhNWCVC30j25he+LP4
 WzcVbL/4HKk8ZoL0IeytQqP1H/iYFg9KgBYRdsJhX+2ZqFQG2R30OIHWdKBYNKpyNITYzS4I+82
 Wce6IpkIoSKiLXT2A8Y/OQrJm1J/L6o+vpob7ihUVcDYA7Fvfmqr47PJuuT2C3igl3LpuT8eTPr
 iQ9a67T+dqvwehK3Hlw==
X-Proofpoint-GUID: -KQNiiLDTgCEe-rEY177GBpbY-4WkNbc
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb3e24 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -KQNiiLDTgCEe-rEY177GBpbY-4WkNbc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXyR+AR4RwNdhz
 gZf3wq824YhznfOKhi5GIz7WKYMLEXN1F6nKl2Dw9dBgQdyjF9MZinbYjAqxbGeefg/LpyuUkPP
 XC97RSBO+ZHRlYxpgyeQEEBGLeB6OHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cd6ae0d5372c..77506e840883 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2703,7 +2703,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

