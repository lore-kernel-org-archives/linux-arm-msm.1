Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F30E3D8914
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164368; cv=none; b=MXYz57B4iAhKnaqomTilPSazor6GId8bGckMoF56Z1soOopKuWsBmpbYJ9yrAp7SbEemb69y/aEsLLW5AVC3EBGJi5nrH2hxby+D/DnkJxSVVoWDmUSSMgyHWjcUm9qKa2dQZpDUwRBgZ6cn3U4ISyBdOR5zxGvOkXYF54CKWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164368; c=relaxed/simple;
	bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fo5X2G8McLRVynmZKieTTnP1av/8q5lWIwe7+LZmbncNw+y1keZqYpTGl77gJzaRl70TypHg01bDCR7CHBLvQdzmtBK2Uij7fiZqbcYv8NGmmHNvoZuLbSjSfpyq4qGZXmoSbyEcGLyaW1Dy9ocIhjAGfV3tzQ45D7VmPTKVb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUAgg3rZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdpzY3dF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUAgg3rZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdpzY3dF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xaIK2924392
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=; b=EUAgg3rZBgh67bMt
	n4V6hNOyPmFmvSHgoruagyasxqNkOHEyg1/72ubm32C0Z2jorDXBjJZ5Mkk92gas
	hv0clGJk+bXqMwbt1ifNqAnghIVvxqvq23dztsmCYi6tGQArxHe6VUhteGp+8JDc
	/b9f+8QEyDCLwXe0Apzu5Tfcru48AF+qXJkMabNNPCFadgSwr+rxwIOofQcQCVlJ
	IV8515sAWuQipEtj8W6a5ZKzArdOp111gwqCTsAU3JCFInopTWzi97ZP3C3WOLJy
	yfxVGoaUPcZdgtLDpL8f74IkLZSWVnGZi+NK65eCzKEpHcI4GHf+GNwIzB88pbyj
	PzJKPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9nrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938153538caso575160585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164365; x=1788769165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=YdpzY3dFRtEr6rI+tcAnoBQbEDxiHkKymL8R8OOSzKqHwDzTWyl65v2SVE5fmMhKVU
         o/CS5JxaUMfgo7eHO4yC2DSnZPzDZVr3np17rub5K4UC9RsD8DWUT1x6070C21U/mnfX
         FRhHydWHVwWYl5xVzxO7/PvLduHV6/7WrIEYnyqCrA5F+qA1XvGHhy01EWMW4tV/9hyp
         VICCYsH5f6p9tiqn08QlXqpEWIwikjLBW6Bzciwnjf0zSVDkvtBKr3mGLc8dPf9wbcKR
         POE2gu6oPuFO3Jih0iLx52U1PtHJfOl76CP8TpK7tQyZqZhyjdfuJ+p2hQfp+Hze0mxg
         /3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164365; x=1788769165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i86ADppHi1rPUDdBO+P0YYM37FqBEqSi4JIna7g85E=;
        b=DougVNx1cl4DOVMDlWcuBv41dK5ODVEkyc0pdaYn+KpPY4RuXwAx0hAzo+ytih4Pbt
         f8nR8nNtN7X7ifORgzi15IuWcHU7MjXa82Qt2iGnHjAJoeW7EX2Z+FEsbrvBCwZ51GtW
         Tc3y2wc7RFrhNi9TLkQbzA6Y7YFiSEKENSO26Ykn2VZym443vgn1xzdCsKaEf9ARPC3g
         66YOzx/R5tjkTr2Wkgz2ki2W0HEJqB1KfXCMooeMF170Hr/wQdHFJboyWVuAlfSYf/kA
         ABXIdgFHtvayTvSRULORAICpYjVIfFahH29vTqZHZSliCJfcNB+87uTM/XgiAvi4nSI5
         fQSg==
X-Gm-Message-State: AFuF++mcarb7NSvHenHu5dALClfvyg0oJkrmYukvQxnLmHlIsfJartCR
	S/VNTMufVTepq4ALoosLSae5RI9+cM7jSdoL0+uP/qnVtD8/fwjVlNJqit0SiphDKBNd6WJC3z2
	+BWw1BS/wBGWbNyZvm+BksWb6SXlNprPI36tqilSwByQiSLMRljqljo+1g7pbd6vUhCOv
X-Gm-Gg: AR+sD12KMthOctTT8Xf5euubS93ygHW4Q1bxuFxNVv3+wXvkqmy37+Q8rSP1lKMfxwm
	MxiZ4VNWwW2cicGIj47WJ4ufMmnwr/mCUfFIRUSJKQOOFxZELNR6HSYmxbkUcqr5u/qp7c2mZGa
	Op9JLU4Cxkn/LWmy+MqwZeIGnXXsBC2gUY0nKRnTqwEFg8z/8flRNUfqlw+Kd0ZwXQk4Tj37zST
	fBwQCxN/yLR2h8jiruOAdH+tQpaoK+l7Afld62+8CUF3g0n4iU3oRjKi7wt7E98crn3wPORWCAG
	3NuonAjKGQ8pxmNHhbJeWe2pPgB8S8sSLZ1HwuhfVmZK6xITJdcBSay1NE8eUfV9im1i1uaV1pv
	fwrITH0KBSbFKGop4d7g6eRNRX6YNMZhhsjAhge3EUgrFC7Fcci4LO8+3bltmJOc=
X-Received: by 2002:a05:620a:700f:b0:92e:5444:9274 with SMTP id af79cd13be357-939139477c5mr2842289085a.30.1788164365551;
        Mon, 31 Aug 2026 01:19:25 -0700 (PDT)
X-Received: by 2002:a05:620a:700f:b0:92e:5444:9274 with SMTP id af79cd13be357-939139477c5mr2842284685a.30.1788164365052;
        Mon, 31 Aug 2026 01:19:25 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:37 +0800
Subject: [PATCH v6 20/29] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-20-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RFTciPI+nxW5BGq7bvVuLZ5n+fGy2vZwA3KysuQPE2w=;
 b=GFCIg6TuUI4SMExx+M4fD8R46ivwwCdbuUkowW6DnjurVcB4pw1J1jwhP/VbhXftm601RKrUb
 /yHJSMRhzA9DD99W0+J4kq2dcH8QtATr5oKzfwXkpBlprMKrVjLJ28n
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a95390e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX/cmJnhgXeU4M
 EMUG2lTzqvKK4d3gg3jdhSenxC40Qr9+54UekvT9G/8YueeDIQgkElmzjsOhtSLxJGEMI+aGyNC
 g1Nh5Z2NRIpJtfEl6B70icBE75Cnalc=
X-Proofpoint-ORIG-GUID: S2D7I3C2kvSSX84cHAQP2pGDKRss923H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXztZnt2y1OuB7
 rl8zEx/NWa5nGqbaY6/3qe/DbUbbAUb0lhjB1VfQFhUlDwBj3QtKopIINJ67+RY2vTvHoyMLXxx
 Y+UlL/K5rtZ4ryxXa9/OvAC38PuncPk+4EUD6rZwIgrg9fTkitNCkaPeFzr2N23DYxHO0kVt+dU
 u3odhfqkCJVDDUUIHOyadUOdz4+QPii/U5khMoX7zcskWyPe0HmoZ8NRsVEqh/B8ZAOlh2xECwz
 d5aRzQEdLa+Q6PCvimoAZkoFlXURXJjYD06syN3dwgVHDOSDgcrjDbbru2j5LTgkcToNy7up4aE
 7pxCTOIJhXI9LDZHJJdmMr7Wk8/Ae/bk4ZamcoIOVKGq6P9rKVLnmRak9GcBxvaotzjoI5VfvQp
 nM7rbvqHrUp0RBDqGAl5aEEMLF2ksQHEI8WngiRBI4+mD6KTxQSiquZYuBPl/1Gwjhq0CCC/gSX
 lpCeVcwLFloR7jKducg==
X-Proofpoint-GUID: S2D7I3C2kvSSX84cHAQP2pGDKRss923H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..91cbb0ca521b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,15 +1437,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2674,8 +2675,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

