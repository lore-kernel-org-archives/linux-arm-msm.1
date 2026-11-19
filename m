Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076687;
	b=ZRac4GFVkbGYN4KCF9hhSTw674N4D7GK2Zf2Np9o4HbcFpj/viQ4/2ssxTXpMG8yDuNx
	 pKfUw2fZffR2PKnOYVje+U3IUwz29ywxXrQ6HPvnFoycJ45mHPsd29veMSArMk1GZkgHU
	 P8NeSWsUNo7iXhWZSjPLfyz+4zcZXAIjdIfU4BBLh91wxs8IZLEGLT4hwTsCYIWbFTrU/
	 2pRYSsb/wrlMOg3OauzawTOhEpylpqsyzpgY0IdmAeMQHLVXWHwaeiyIQfqda4vRATZ8X
	 ogiWs0ec0qLNo0qucRqMFn5jiL1duEbvKhUrXkzT0Z5UNMx0dXMPlmolkRFvBweMAqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=;
	b=rrdkXvET2zmWbsVmZPe12nNFz48+s9Z/QJNjMF3LtekIqqMQRVZFr76hvww539QxjF75
	 hSITb7cp2WkielA9IQVcQRx7ec+h2mihIssCzZcaNETlhbGyIClOKks0NTZcpkP8juPdz
	 ybfJeFBzcnIqxgcfUU70HXKfuPxDAc9nEbNQuXBolzQQdKb//fpFLL4zbNtHn9fm6Br4z
	 fe5I/LsqBdgshfH1aquFVtN05pGNZ2Kbn6SaJxYCjku4sjsAcd+MXNrhyMHt3TFO71K+D
	 Er57IoDGaYlSStPHvIPKTaNwktTKZe5oJLSaWoxWYp4FWSt2dfoMeBjYDXsIij3QHig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hL02yzLW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJxDUp5E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA06606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA06606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hL02yzLW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJxDUp5E
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWvJ2194938
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=; b=hL02yzLWQLQ8t6Ym
	fCgun6qT58zLeLa4SQFqCjQNPASvtjpkn8bq3gbOkjFIKR3EYX7+39lzCTWHo4Vl
	DL0b0pxyIkFlAOB/tx3w5gNWl7Cua7wPNr4JuFxLhm3XJ8XXMR5ENWca40VTcntS
	hgn9q2k68OQisbUZxnG1kjxuC75KTl9uJVqJBXT8OflGZWNnTDw7+H6XL6S2Tnkk
	4y1PqkXIC9yCbupR34J3Dg8+Nmg6woqpaPgUDQiJ1wld1GBacLTLBl8ZVTXt879a
	ciqtlIjoJzj0rqSR4chRndTByFqRigiM9oZ6BVVe0FiGnW2cwI1JrwCCZ9Pz3cuk
	xdkaXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5quyqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so519681085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076685; x=1795681485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=;
        b=AJxDUp5EtrkV+zKVlkAJa622HUcY3/X6zs83cd1jOuzL5u2mYAisZ3KN+nOViGxUGq
         CeWXg7Vlt7er3R8uOmIPD+5inb32CB3DfYCaSs67ABY55KBJKfOUZREB9O9BH6MAr4n/
         iVa7KOzcKJ/RvBatqJfHN20hNvo44zxX57z/wYjEYYKaXHNjijXf7IujDVyu34vmqemp
         HbMTjgvXWs+sRKr/rPHFR7jNGoR+A2tOh0D0m63BaFpxfcnb4QzjKZc8k2vMVmP/L2Tz
         s+h4jLSeN2Gkvj0PiCsexwuXF4TGSELA5//ZHe9bt4FV8C6nUT3lAvFUiKUQTOAIxBpl
         QrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076685; x=1795681485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=;
        b=zYOzFzoQA397Q6UPEW75jrqKy6qAatx4UhzSAMEiqAerHBrvBiqZKo7KZmFaO8ZimN
         fN5Mb4Fh3MIGgzUJKx5+ZZonJ9GOEmsm9JZQHZFoMwO1Y8ljHc+w9d8fntlJ1rMtgrxJ
         U9x69i0zizGF+rrzfN3WRSbuiViAXuYo3TYcao+JZ0y4AkMY2cMIZaGEu7em2uckRjGk
         nIwy+RSvdludILRIJdpNc3GUELoOZvklDyzFoKYSCXNvfrBGjGOPZXBa2x165UuiFg87
         H4x8xfSvHKTiBLjjj2+PUiDRQkA6ulJI5AtQ8bQPKVqaqJJB6AuH7zMM8/rqohrG7gLq
         gHQA==
X-Gm-Message-State: APuU4Z8AOiG7ghLizo1WPMq4sIHUpccTxskvKdPtCiGz3nGS71xXaipo
	QZyLUf6bkDkNxaafDoUZpcfdArLUn7SCRWcG8/q9i4F2uBo/ac1auW+beqtHn3eqOPTTwCDsUvo
	GGeZp9UM/dl14IEDFeAHPiMD9HNXXSb84DMq9RpTCFsKITxd96nSogUyoebNeS8A/tIeM
X-Gm-Gg: AYBFou0cWHabNvEydxggXPCT19gxPi4C/HosIAcKBLUkE1P+U5pUveDB44XlrgqN2xm
	UOKxzdCHSlXbMZ9o55uJ80/ROm35k6g6bvFyYOUnkSZBBxgWkVxqttqrDS/2ZM31D3XPSgybDqg
	wZuRZBX9XooCffxN4XoVw4OqfU9DB70aDAfo8H3LssMTZ/s74eJv8ZwO/VBp22CIMnQBWQQcK/a
	r4HI/DftIVbw6QD1gVTwWqmcKjSOaxbYKuvuKzuv0Vn+pJAxexoXyhbDPCrbj9wfbSf5bN1j2Z3
	GVcvNVCJSqO5z6jyUHaJtbvv9++vCI38AKr/qpr+JQaT0xhTmdedVYF89jzvJPWXuLCskoBqc10
	Ah+ASdX+khs1eVgd8LHY6N0yErM8RUZIz0EloEH1yB4UvqFE5rY+kxCn9hrw7bYYwwN+1snO/Mh
	XHBo2WTZ5T6bIOUUQfMO43svqkl615pWM2lUjs
X-Received: by 2002:a05:620a:31a6:b0:93e:94a4:a97d with SMTP id af79cd13be357-9499936579bmr934125485a.0.1795076684963;
        Thu, 19 Nov 2026 00:24:44 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:93e:94a4:a97d with SMTP id af79cd13be357-9499936579bmr934122685a.0.1795076684327;
        Thu, 19 Nov 2026 00:24:44 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:44 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:05 +0800
Subject: [PATCH v9 03/29] drm/msm/dp: add support to enable MST in mainlink
 control
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
Message-Id: <20261119-msm-dp-mst-v9-3-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2559;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=SI7t4mGgwxefYt5oEm4+FHizneptrfaRYKYBLcB7QfQ=;
 b=mu7tfErkysXH9unfeTL7MVtpWwREec9rmRChsg5QNEKNPjrg3sK0Er8oobQu2vHUafSrxE6kS
 kGXpr0kJOS+DisNEGmnIl3w0DE+5kG8BEZhbPj/mLP0oJvuM//lPZCL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: I45BEkV8eqEnOPFD6AhMOyxnjtP-AWLl
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afeb24e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX98NrXE1bJ+f+
 Zk4QD9wTjGGeTPIgHWJfo/JQ9LI5Cwwlercf0/LOt89ECZk0O9CBiCy+7Ph2HX/pm60rIEY8sxq
 Jrc6rwDQDrp0JO33yeiClmY+jX5RoNs=
X-Proofpoint-GUID: I45BEkV8eqEnOPFD6AhMOyxnjtP-AWLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXzwKObq3cgS7o
 Gn2fRcjdO4EDAp9CLAaTDQTc7+dufJt8L67hximtXLPJ/BGBSTrK6bv5X1dDo6FG9cEsBeQYw/K
 zZCip2vCI6Hg2oVKUJe2awFiwZiYIPGav1NvaiA06scuvAtWCyS/nR7QqZMjm9hAMcwvHpRuHu5
 SuYOtuPYDl/kh/eWwHEf0uKuBfSTsVmPFyIHJ87djJyQnwkqtqWc3cfPfnpbmSYatN3kIBbeN2C
 JQlWsJccHBkHLIGayB6yMbjj77GIB/Gcy4FAjeW8AkxUaUoRKphsesl5x72eNK/2BO+wRnEDM7N
 Q0yJ/B7gI2zVh2ebsWa3j+0sEPlVcyBxMBK3Lx/kZIWP5BpM1aiqcM581oTYHIYDsBwOyBGSjPE
 egmLaYNVJcMZSUsRR4H7VR1kQH2FvapcmirjpViXEHEXeMTxBBujgpbthGDo9oeHKgUT8+wfTGs
 9mkr0ehsrBELWg1FjPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1b4aaaca0ad99..41c6536526958 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2689,6 +2702,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_mode)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2743,6 +2758,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c8..cc74b1ed628ec 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0

