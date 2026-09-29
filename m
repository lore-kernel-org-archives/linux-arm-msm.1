Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A13EB10C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656090; cv=none; b=buKnC6F5KbGJ/nk5mByjeDRgNG+Dht7C97e2bAZHkZ1yvl1pF0y9L3Qd5lGOh+MxzqXfygim70jCoBRsJVPsNHJNcSNbUE7YsiQ9J5nfpiz/jH55WAOA6LlXxTI5Bh8Dhc2UcKztkosqKq8aHfVOw+h88yv/eBhXB+iK43GLbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656090; c=relaxed/simple;
	bh=82JlyjBSKXtodVZFszzb+1Hgv/eaaH0tUVHNO5mb/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeXHv48DrFvso3idgrqDuHsgTh+SgRoN75dQt48CIW58xF+FJumDrrtllvUgjVyARRDq5YbrOTrqVcU3k7sULwAd4P/Jy2YgY5FLN0+E55/SQSAIOdG66VlSSAxl1OvFVaJ9AnrmadMBRYDbfwPjDjP8UyvMP2Wc4KrxabEIbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtg4Ce3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLGnH8+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtg4Ce3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLGnH8+U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47KVt3241635
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=; b=jtg4Ce3C+VddnagB
	y5yyxDtyLjA3367sOVMchEPAOl4ObiXbsO4/cvLLkir1bYaBo+iHcOaqIGhVEUVw
	R1SaLWYQrQqQGe/jL69J5DXjDcwOx2wNrM0QN3BWXM8A+rKJK72imewp5Kblo9y3
	wksug7aERHWlkIDRWivU2k24qpQbhS84nJcUSDO0S++aih+4LrbjYSQvgahkEVE0
	oAhgFbQ9e6KpjpkH9g7QJakT37kEkMXn9E6VW0P3MbRLttFc3hnMr2YBOG899C3v
	N4rNJUPsgrMb+WPmuQ11Qz1KZbPGmwJiYC52Q2+sA0z524VEwsrPmUO9+YyX/O3c
	MJYcVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s1kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530f65ddee1so89926851cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656087; x=1791260887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=;
        b=gLGnH8+UOBD61ApCJxb3qqYEHXhrJ4wAVqiIsC6JZDqMCxnvl/xp98+jzxokoCGdys
         Xq/DHu7HnvS8FrpVZCtW3tR/8T/66Eiaj4pbhRG6Ezh8tfifLP6cF2jp42z8IWxToMRw
         WeRbIWLZUycVFIEZsZk1T1rbEA3oy/HjdyVeeWaauCbBiQEwEMoKQQ7wfXkUXgniMYpo
         m4PKHxWEmcRVCzi0NbYHbnH0OuhHSWkJGjkH6/Wy2ljnmYUQJtBhh/nFRiKU/KZhOc79
         czQi5QlntWmvhY/UX75MsL3JYnOc/7UMQpWKJAUGd/l+HY/NNNjmMRUTvVJDzrvkXzxS
         l+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656087; x=1791260887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coR9yXfPqlPQFuihxmTff6nWiGvZ6ChE0ei8ghCFlas=;
        b=w6b6wxGe7whhZuER1KfSdLe3cUqRHrViS2r9VkkmT8S0H/WGlmPbgnDt5HWPbCHr9C
         xWEtVwJtBlGIDEYHgkkbvw9Cvj5biEGR0WT94fIdZPhywSINfu17TtEe7N3AfWiOiy2p
         h5n0IOQOvN8XRsytR7Azzn4NCe8GCL5XQX9YX//zL57A9jzeFZXa25feADSVzk0ULv9Z
         H0rf9pNnlSxNPse3zVRr7Q6GtjnTqRsBmIXVKyqKksJXiB5cpS0OHSn4rdtzkD2+TgQR
         /SLVS7oFIqp5zcTZ3l3C2HZFSwUUsJ+RekH2hMpZhdP9c0rD4IszaeHgkw9h34TYESf1
         fqTw==
X-Gm-Message-State: AFuF++mi+slh4P+DPPRnmkrJCZRPqKPO/ieXXaffnR17u7Gl5PGGJVRe
	JVMyTdlsgMfDmHHWUfbCxQnkICxN3lGDe1XHtOmfvhCFs5RDut1AeHV4Oa/R+GNOFejvoDElkqV
	X4O/p/F8/0r7aL0ER4kobx0DI18+0euZQI8kJEvRVzeXbhWSFxcv4xXNTkHHJU32f3YcD
X-Gm-Gg: AYBFou3awbKmxtsW1M5UHoZSEoB9TQt2xk7wYABN6JJr+VLRmpC/cNT7ktdxw3zReWu
	iREoYjXovebexFXnkL3dXZqXOZQ1DsCSuauwnBWJORhvNfrhKrDvjyDlWuzcWk+X6nJT6u2tzfg
	608MG63arEXnlGgcQRn986aejbVg78P6ok43dTB7EYtSWRaIdX9iqoBjPSqdq9ewg/8eUhL12bW
	wxAUBp8wxlKTYjlPQ0DpEdoLV8fTqRUWbByOsMz1HOALyJ41h01jff9E1rSG9/K2vRiXJtlVAeo
	1EeOfocgrjQ+Fe7GcjoS0wOf9VysANetyIJMLm911y/B/qiHjCi2u8XzvIxw+njh7qpuADtxE08
	Uz0tsihBdOOulWFTxm7SxTKkjIYTknDJvlJlI2Xf4YXAJrtFmiP9k5d3hAvu9mlI=
X-Received: by 2002:a05:622a:99a:b0:533:3aa2:d8e0 with SMTP id d75a77b69052e-5333aa2d9damr113330731cf.55.1790656087229;
        Mon, 28 Sep 2026 21:28:07 -0700 (PDT)
X-Received: by 2002:a05:622a:99a:b0:533:3aa2:d8e0 with SMTP id d75a77b69052e-5333aa2d9damr113330571cf.55.1790656086805;
        Mon, 28 Sep 2026 21:28:06 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:06 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:45 +0800
Subject: [PATCH v7 21/35] drm/msm/dpu: use stream_id to select MST
 interfaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-21-4b81473185e7@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2465;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=82JlyjBSKXtodVZFszzb+1Hgv/eaaH0tUVHNO5mb/CY=;
 b=75huUwdtfb27GE2zMYuYJme5I2ccgY0Sc4CV9nSVhK7uu9VmXXMVqxJgzh4uu8WVlNecHh1vD
 +CS8TqQbzqJACtDwwLmoqe07j0xZpdIuQ2SLXcoqvjzy+B4ReuGqQx7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXw/f7YJCqQWEV
 83pPyAQMI/DQUvryEQRsti3WxFY56AEdK96flf2bkf6jco0+TE55THInuRNDSD7uXe7unGfthqT
 Zeq11Oc8ElWTABpeSol78sWZKtsBwY7Td2UgWcizIacEatB6tINj61Jjf9MVE/tXsvQhllXUbKM
 NyoiOtb1SVc6QYYgNP0T5qfK59lfusB5haULmI/rXAYn4YvMJNMsdGEKfxWjemVdeQuQMmGu9xm
 qZ3v+rqbCORLvCHEagNljsf4wMFczMHxBaHNyz2PbR+MvZ6pZyY33l3DBOie50QxOci8lUX9CTB
 bT4tHHEAeOcnnDkugzGu+KUhW/EEpBGnqWb9VvxpMrQcrAayzPCKauImaMvYTFDaIlun8lbwSY3
 Nq6X03eh7i+9ZoeyWuyXxINMVmK5q/VCtTzwng5UvhXdPmnRd4qWYTFLfwOdTiOxHWPpPVWP765
 s3YML3xwjjAUHaIodOg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb3e57 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m4XVQ0OAQ8bppu2UB-MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UHwY1Wd1_9peoT1_iGmQDdPe3WIuqBkR
X-Proofpoint-GUID: UHwY1Wd1_9peoT1_iGmQDdPe3WIuqBkR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/E4mJXfyEvPP
 i/yAUiPE1ii5hdTKop+2lneSnzqp73tEcQq4WRU3ePr+V2rq0XamVxaW8TJzpotz6ZeURPtBlL6
 FiETwLHw62qzESURDZU+NfRwS6RHboU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

For MST, multiple streams can share the same DP controller, making
(controller_id, intf_type) insufficient to uniquely identify a DPU
interface.

Add stream_id to msm_display_info and use it to select the matching
interface for a stream.

For DSI, eDP and SST configurations, stream_id remains zero and
behavior is unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 91cbb0ca521b..004d5fc460a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1439,17 +1439,18 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
 		struct dpu_rm *dpu_rm,
 		struct msm_display_info *disp_info, int index)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
 	u32 controller_id = disp_info->h_tile_instance[index];
+	int stream_id = disp_info->stream_id;
 
 	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == disp_info->intf_type
-		    && catalog->intf[i].controller_id == controller_id) {
+		    && catalog->intf[i].controller_id == controller_id
+		    && cnt++ == stream_id)
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e7613..9972e209bd58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 

-- 
2.43.0

