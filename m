Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076749;
	b=pIzDzgcFrK0QIlrkkRbAExkCRkzXZtBaeJ62rUgbrKxugnqhqrGXEgZ5D9i2lRjwX96q
	 xjncPXfN0bxPFIIaD00Qo27Zc6eEZkcAomi3foWDeLSCSbfz+YaEVbUld0/tea0elppz4
	 HfuLTS9LnXd02CCP8wrvPXLtGtur650UXppxnkb53BzZ6CsONtWcXc102zQGjPK5uiaol
	 MmCwCdGFTkKaqWvAFj0GSOTiLe8g2oo8DSlUYZWs2j0FvFFmBsPo68zGol+7nTnBP9e36
	 LC2vyAYGMDSYpsznvM+KNTP4ox1ANWIYYN+8v5pUQs/gb7F1JkBnw/zf0qyG5xOqiZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
	b=KYNlaorwn4A0qB2YXjTpRpP15hL/um5c5s48plsI/dDoeY+EavXuRzee+asaSK92oHhW
	 nsZelP/udFjbTTlyWJCX/0Rqd3ZJMeWPu0z+RfeJ7WpvuO7e6jIysTcn+BGEFl4IC8Ndk
	 VSxKGM4wqvDgwaDg2kbCSWLQ3mRTvfBZAtX7Vi8tFZ5eYhIvtDg67aOxbcP/bmPhUcRta
	 Go5A4olofdcfUld/bf4J88UWKv+J3JuNiRbtokoQo/Fr4nuadMQJ9HkSD64+5o0a0Xisg
	 oMIR73XRSm+7ZRktkNOtneiDFvd9wvwL9N4IfGLKsnlNJS9STbtcDFYWLloBvIrTL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KFhXYTCQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EOxOnwWR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133D606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3133D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KFhXYTCQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EOxOnwWR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWvZ2194938
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=; b=KFhXYTCQTzU0T9am
	L6oM9f1G5RQ6sARtwtFideE1kyur9o21yIa9sdtC5Zq+VG/Ike6NkZ61PhhcucNH
	cWcld/L6yvN//lclvNBM9SqahdS3sqrPfsnHCQ4JVGooEEEEyN0Tzg07jLExy712
	cpym1nc+LSb+sKC9d6kpMtmP7UnpDGx8SOG+07JCJmUdeP5sFwy4dbTq363ElvBQ
	axoOqJlAra1bua5b+coAmsNqtwQKk6A5hHkWmXt0ldEGHCoO0TjvPBS24DXZTSVs
	hdx41anuTnlg+Guw735+fG4nj4idVtQE7wuo91Gx9MCUONB7Ug2PL2xj69oX9l07
	Jg8Jiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5quyyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so344004285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076747; x=1795681547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
        b=EOxOnwWRiBAy6yfFPDuyH0DvKQ+UP2SzC9E7ADUmqO1ZRzP8jRNrg4XEQRQy0+7pfB
         AP3b+I0yw7tjuC0yUAkNWkPqmtTbKIxScQ17HO09qrXpvoqQJtjqUZGrdZUcZuKbEj/Z
         45NJbubCZJH7YnTruF8iQ8YjWvA3V9vJ+SVfHghb5wY2pmtERzu74VAdSWH5O5h0mfIQ
         ZYsy4RiR1d4rrKkeHlD3iANCUTE1jjgOcqU/PRVdclMi80CPsUAHonFd1EdFOs/gAtqq
         MogWJrxiDK0WxdLAppIddxa5AOh6PNt9pqW1pp+EX06o10GoeBWcMN61K7wBeFXq8bTj
         E4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076747; x=1795681547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
        b=NRi9iwSewRBfe6NpUWRXeJntYrqAYKL9FeHacCC9SQpXpqMJ1wax7YmfsWKz2+7je2
         J4S6XahNnxbJEnVMRTJsOlnthDkvhcQDbRM5jN5lQplczF4VctlARVg8ctq161essAgT
         MQ4xBKKJy8+fGDghZlwAg/kOOW0WJBCn+IwHhiXykdsvlk9nDWkhY0H5hhOQTJsHCne5
         okyuUb+JWGjDrK0tMxUq47zycb5PMDMy3vYu1QK1BZcUhwiLzDHz4V1wAmZ0NDB0s+Ka
         jDBfqYCUKRRSEwhvbrA492/1CyxoK/ONb1K6sgw5GNIIz797q3AKXCsXDh4RNUWE5luk
         87kg==
X-Gm-Message-State: APuU4Z+G18pk1tUzvq33P99LuwIZF3chqwpZTkULk72vkf9++afIu3ay
	IHx9mwy8IPZMpJ9j1v4x+0IreQW9krAEtwTcDS2MEoif0ETeduUmdGlK+kRKq+dq0BGNdqMdIAK
	QptkDtw0Ux+NugfCIszUjZJkAJjo4heUnH45RKLUpn2JyjuJQDM16BR7GnD3F2MFkpsQ5
X-Gm-Gg: AYBFou2e8pky+qXCOSlXLWviMCjUlg17n9vw0mfQg9P0DZoSXwIGt6d/PaQuKUw64rZ
	l3eyKtkQ3iZudxBsdsQwuOqDp2SIt555R5xt3M6rOC6gIH4MWe/v1yVHqJcRrhY8XfR3SJIuh4E
	GSJUv7hCUijAI8J1wtEEuLxbLg5yoRzKt8f/nBvrL2N65yx2QgV9hmcTiI07qDpBIeY7MzLf7uF
	gnISyFEF/fsT81jyJwtg9bit2jScReoAFTGLgUW4vtCHFFLWBf3QgP8S9qS/Gv6QMieuRTe16mY
	ks3yZuoXwwPraiq/omgpY/B/rdnOBPpTw6lrMh157e8j8kvIHLbzcpgtkmBzLkzZf59bqbC97my
	YZBulNTejiMxzGkcPZ0ZYGEidVf9Z9gatWa0qFqzZJf3aFr0hIbTI8RP62nVPXLJJ+3ROS5ZDVS
	fQTIZRNkSZmLmtAfdIRwuYUYMApiYSQs+pBXmc
X-Received: by 2002:a05:620a:700e:b0:945:f0ca:436a with SMTP id af79cd13be357-949995f71d5mr967528685a.2.1795076747434;
        Thu, 19 Nov 2026 00:25:47 -0800 (PST)
X-Received: by 2002:a05:620a:700e:b0:945:f0ca:436a with SMTP id af79cd13be357-949995f71d5mr967525885a.2.1795076746972;
        Thu, 19 Nov 2026 00:25:46 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:46 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:17 +0800
Subject: [PATCH v9 15/29] drm/msm/dpu: use stream_id to select MST
 interfaces
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-msm-dp-mst-v9-15-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2469;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=wXTPAT6DXirv1p5bLwSDFrvILw5gZg1C+bWv7KYQNRg=;
 b=pGhF5oxPjBqKieRi1UII9nLYtUBklqY94eIK+ZbUT5+y/21cnuMDTorlDwTeeNkkKloGBcoKx
 NblVFGZ7aB/D6rwCDl3N1HOfEgsyOuX2VIUHLrAXuKYvDll1opId0OC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 8WTpnK3-ww1twhXap-hKPOfgh0muWdJS
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afeb28c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m4XVQ0OAQ8bppu2UB-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX7omNUeCJgpN3
 rKq/aBxyLlcDCjkXbaI9JBufFl0rAk1tCOLBK82nQNlvoIDbLSH7nyjWlRur8/WKiT5JXCSrTRN
 rVTOwG9wDxk0cSfTn4ayKx5qnF0uqCU=
X-Proofpoint-GUID: 8WTpnK3-ww1twhXap-hKPOfgh0muWdJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX6ywklLIsason
 HDzA6T8mRYVT7Rwx7xrP9wHsXPf5dn9qZm67jJ9ZUShLqdBsjTX0uFERwCtzls5tsJY1jSdJiTO
 7pAm9el2cqjv+W2kfhfDgbeqySitY+R//k11BkcpeS7+jY6ftTvqlPYN9iJuHnmSh4kYllWZUeH
 63ovHcz4IUGf0iiUZK3LEBTfaB6C5lCuO1Jo5cfm5ui9ua1HxiCSBbjw9RZIJTqtkabrswoIdl9
 W9HiD3ZoFT2nxKL3dr/cbFxUKu33ew2TEAFcvMY113M1J2HBfskyVHGU4g7LZmDuNk3BgSRFsuX
 iH4BB5x5Vcxpj/hm0T/n9Uy1mulrbMU/PzJwaBguaj/2Sm+Kr3LkDGAB708vL7RRH+TpmI8iueA
 nrTxpmHFmwV7X/I/YZJqo5WsPCKXaiHG8Xl3DD5gDgWkl0XCx5x2yTeFX4PHbR+b3Dt8EA60eJw
 D1vaGUQoCZOlR6J4jAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

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
index 5e1c98371181d..a8dcc8c684eb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,17 +1437,18 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
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
index 4942097e76137..9972e209bd580 100644
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

