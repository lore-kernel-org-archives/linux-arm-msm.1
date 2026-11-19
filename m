Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076692;
	b=FdgPYC7TU36j29UZOuG1d7g4ySX+uLFGWTZ5bL+MJnBQKokUoFPMVjEaFFJ9JqKb7SpU
	 SwZAoabSGTWnAmJ6+Qu7wb5RRCEHE/FU9pCHtguC2I+2GMmpOZ4HiV2AKLbxLhTLDF57D
	 pAXpJ1O/BTm0QM2JCjJTCn78h7DJw/kvu2cYdgoUtL3kcs2eqXXjUQTQpRZ0U3q+Z5j4i
	 NfYaAUSBcCJKTRJzF+7vc3X2UE1YcH9GHb1H03CtH0AFT+4QqBD7Smu+3kvAllkk1C88X
	 FuQKCLXEFX9ICqlMLVn/fkuJP5Ccf9LbYVQDqt5EnxF9kWEjn6IDUJEUjNCyUwDu05Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=;
	b=vhzlWiD9IHCNAdmoSRLcbI0BypLgnUS1j+yzy0tTSXNiToop/MwuBOnwcVGldNGB9Vcz
	 2cUmN0q2C3NhOhtTt43TM5U1wj7dbG2CbJMus8gmbkncKCB+6nSVAHzRsi8YN1OKM6bNs
	 XkXB++WURBZ3CdUp7PiCum39hOmfwaJEqLsYwjuZeeRNfBDaB0y6y1EThQW4BBy/p7jxT
	 SIG30qlI+GlnTbW756mnbhuFxt3x346jBg3LVZSkOVhzp9UIZ7EV3W7U75HYzRRD6pySX
	 tSJElGpqG+QuZPFwYJU8V5L58KJIxpmEdNS1yV9ODOFStRFbjYYdZrr3I1hqR81xEig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrO9xm18;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkwNltls;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44039606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44039606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrO9xm18;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkwNltls
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vEpk2935530
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=; b=VrO9xm18ONRb/NpU
	ylhuJwFJC18TsRYVQI8/SQj6MbM3eK+dw0JQw5HXlP9I3ifGujNNcoZeInhtGm3a
	/Qpg904QrZOZWGHr/amauHr7iz48KN12fEe3KC76iD+AsLI5VSgfzRdGb2mO9zoE
	f/JKGGaPzc54fF/An2cB94r+hpl8UBMcOYoT7ef7sEg95GennkG6eFYRpYyzS8pC
	IuqzOLjUM5ZPe96APeEYyxdkweg15iEdki/y6qmzIxK74S9p5NFkEhklztfebUK0
	LVI3o8VhriDGVo5KK1n4yaMDfCLwzkLen7mFH0eo9vomH9TAy28IFW26XsfUr/J6
	wT/87g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekcbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so384381585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076690; x=1795681490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=;
        b=hkwNltlsY/JIn9JCZmjw+v311sWazu4pJwzZrFS8Y+3JBkxLEGxy8MwS5OXlA+pw+G
         FzpH7L/jWCOBXn4bsakH+BniOz8LUxGFQkY86sXBPFiE+yqxI+o/DUSK017JQ/vXxpx4
         bqE2BFOmLsYQNMm0XPFS/pYGs87M89+LIadLNi/o3Zgzd50uLmwkuHRBxm8SsFILDWF0
         kLS4bIIqXRFvdh8zeTJbBWdbjaahF0uqHxFGiNgWstFNYEKQZiO74mGCeSbIsm2PpS6H
         WpFtKmMPQVbCo8cWC16omxVMcaKnElMhq0Zc0f03xi3/U20gWg5C2nUsumDVQRYilkou
         oc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076690; x=1795681490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmnV20EgYdZ6WHZOYmnC4o5067U+QHuhBOnh8ncnbKE=;
        b=GFTqtHDt8xLD7uUn4Dc0jPrzO3zbTlzjQlHc8x124b3YuxKwk8uk1MGCr90kCDBj5B
         7OjSmH8dcdTIWSzCy+0u6SlON1ThrLzGRGZ80MHaEtbCFvPz48JfDcuIe3dS28WBtzKt
         g+fcg5NuxGKp9mwRrD73zJR8Xx3qC61Tr3Yo5lcPA24fv/I2lz2GfONC/2LPeVn+s8K9
         UJEaqnc+CS1gDhHsZiGp5Auy4dHgus8AzEC017NqmsBLeTijLWj6nGA8vPHN/wuEuTwP
         MLKNK039CITYmklCr2KCYsZVgBg4nGhk0lfmRsGg2MqMUS8BvNG4rbX1edKoNHa6rFIV
         3GvQ==
X-Gm-Message-State: APuU4Z8gGto88SyZvacuF1M9ihZkGcIf+WBWG/bjSTgPup2Wtm+sU4yh
	Gw32PtRTj8CDR4Wa2oWEhF0u2jse2T30l41JlKToAzDgV59QxzPk1bILBJIMukLDmO/4fpv+hJX
	1O8pNLXYmBP4eY5SJ43IsiqfJrLMbFOgd13mgtHTl+UGJLUGkOY3Wgg9yhpg75fgUfXSc
X-Gm-Gg: AYBFou3E/iTR/L11KWZZ9BbQcYJiEG2f2DIC5k08+haM+ExhWRiwjOYqSjS/Bp/Qj5s
	YB/eiK23yuDrW8GQMOgax6KKJ+Hq1kpI+/PQ7Z3DKGW7uTADdJlT0dq74sylor6UoOrIFDa7StV
	Zxv8YXaq26E7W1lxEcz6/HuQOQtoFOXfqm1Kn/KpDq3k+RO/l0ZKF2u/BOIhpRzoEKWsncE5JKE
	2R5HpIbxoghitJ4b1Z9M6VcwNEXKhzy+g6LJRsa4M4b+HtK+LLn5i3xqTT6yFgw0eB0NzWO9jtG
	q7667BOMrJjAw1PgfUBnyFV2HFJpXLo2IvZacjheviPbVDBKQq5KGT5UA7PAByP8b4MGSIOCNSr
	YqFT/O7Svm/KOCAGIboAlkkqaP7DmPU07g+a5+2j+RJ7BP+JJF267DrV2x3MqsLpMfrp8hg0QUx
	+159XvOswPb5NgJJXgdmMsvBPoImeHEwyKEEbb
X-Received: by 2002:a05:620a:198f:b0:949:5cb8:6be5 with SMTP id af79cd13be357-94999635325mr1037947185a.76.1795076690439;
        Thu, 19 Nov 2026 00:24:50 -0800 (PST)
X-Received: by 2002:a05:620a:198f:b0:949:5cb8:6be5 with SMTP id af79cd13be357-94999635325mr1037943585a.76.1795076689957;
        Thu, 19 Nov 2026 00:24:49 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:49 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:06 +0800
Subject: [PATCH v9 04/29] drm/msm/dp: no need to update tu calculation for
 mst
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
Message-Id: <20261119-msm-dp-mst-v9-4-ca61be4edfc3@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1017;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TSeJBOLP1a7Z+WiBEdBGkjRZywx54RLAhctKfShmiQk=;
 b=TOfUhEt15F6oXulgckSfuYLjMgPa7VHHyJlfGqx/ohK3le0yLRWLeDePU9ls1G8NEqZi3FHuB
 11hVZOqIp9qDdhyK6ka0eo90NIkcG634zNnw0Bro+M66ys+2g/sMgwU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXw7epBhJ9jZW6
 CUpu6PeXZmtkt0Y+K8YeRkaC6O50wFaGG3G8AsOZ79+a3vqQ9m7dKwEL5vUPWBgWufwp6l5ETIq
 rWl1Bn8i4YHlvd9mybGxLR9LF5Xgy8n0i5k15r+85TArkDgMa/tP/89G3sAjZaCcuPpLogO2MfC
 GXHCmdkgieYF4YGHYV9dQa6uv6aYAT2XhCm9Mf/Ar1TE/fQycwh3sGf2zja7pbGX0yR4Sfm58Us
 dwDZ+qb9zM0z8Q6Pj/sH5ljHfUDy+5vLUUgWaRv9v4kPaju5PGwevKXZ2eIl2yXdGvVcAvK7YcS
 BbwGWkDY8cLQR2qpLxtYvIYWE1cB+bNZ11MDFXePmL2DM3V/bGu6zsi0sECLoA1tK/KMnJ6la8n
 6GK5OQBRzbCEWRfzMlPkYkwDmtA/Ep4vGy/KmUnagwDp5AxxgJUIrzVoSjtXTwinNCNk2TyUI4O
 p6jKWxrxTPqI78vVKbQ==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afeb253 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HKsPneCVYuXeWatzH5QHQ3jDggNkEOCJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2nGxeynXMEgD
 4U1LmZrkWVTEP4/U8MkVsj/2xl2YMXBtAZKzBDwSUVv9k/xuFhgXY0w16PDyink2ShR5tl24a1W
 uUn5jbHQIS6cRbpjeNR04+Mf5IK8tL0=
X-Proofpoint-GUID: HKsPneCVYuXeWatzH5QHQ3jDggNkEOCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

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
index 41c653652695..f3f97a800a73 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2712,7 +2712,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_mode)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

