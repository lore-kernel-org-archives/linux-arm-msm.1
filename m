Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076800;
	b=WXV8b86XItcuTfJ03+xK/4wVqa+wNlX13I/tTVLEAY96b9zv4kPtJtvunxiYsn/RH4tR
	 cEyGdHEtZJT6KW9Qj4g9hXfuhqWDYkGjx00k0cFT+HkO2o3OVIM1vM6sbfZnazFaYn3AU
	 PMSyWpwf0RY3XiVk+G/F0vg0T2BIMWbJdsNYcY9XsjbLPRHC3f0hrx8a25wb2iM7RdpHq
	 +383EUn0hIp497x6fdLNgr8Vw/u609AagCPfoX3LFUdDtxd8C9+MM1L1TRC2SSjJAqZmO
	 16EtEZwKcWzfFtNax82YghtUi6dm/qsQNEtOlCj0CDA/zDbmo+yOg2y9fYgez/vPW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=;
	b=D2vXnLykOXxgP2O8+YPnvyk2IZ1jHfgMDha8cU4DTObB7oqPxzwhWkg8cSbLtN0y6Hnn
	 sWUvuSWKqrZrestZJgOGRsy3Z9x5NkMnpTuGGkxZjdMOWFwezaudh9aF9OYrIxXFXirt5
	 PMTcd/PhWPKgXHL0G1LHSEa4ZnchMptqZikBfMJ+qvgi6f1TLthphH1D0qVD/qtUMnIaI
	 gtgHwhJpfbhliiuF3CD3Tip7/9I3vG3BcJwhKCsXPSQotBAsKnIlHn/AvyjvW0tCGupYa
	 ON3NwffGMWN2du26hws6gHqbWHLHS5tKadrok1x096aO6f6erud0jQipuuJjbrmpUoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqYNgnt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BPG/Jvjp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87900606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87900606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqYNgnt1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPG/Jvjp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ8KdIr1753672
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=; b=mqYNgnt1ihyJitfD
	o4liAA+Ong8B8jJITRvJjay0xYP6nRThep0pAOfItFKXRu1dQcMBpu6zLsa0F/3T
	QPi0aomJkXgTmCxvVMSps5noh37lZZDhH3/SCMqnWsfdrl/pG8NYhPSp4RrqgJGN
	UdvjkkVfc7UiQK6U3xF2JSkb05TBTMlXqSuxTyiBIFGiDPISNLrlxbF0soNYmSe4
	VODR+g+wOstLwU6vj3K0wPemNE1MGv33MfbwRp7Ecblqkd3mELEiaSCahicVSHMq
	MkrRtp9c9WjVP4cizrma1xNeOjQ8w6YipagYBF3gqjkgtI1yhsK8PDw8K6bw8vHD
	Alxmtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8gs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:26:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so525224985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076798; x=1795681598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=;
        b=BPG/Jvjpsp7HwoFHtD124oWw6txS0rzcZDYkylnRamqyLUObMKRLC7Zp7blOO5zPjx
         aXsF8pKiwd+d7yIE6MB8Z3DiqKvCwZ+o+brYK7k2j+8joff91m8fRTB58n5K1N1zGkKf
         CpIKGBREHxJcYxrptW+8ApohXvclPa77GrkXLa5+xEg1Fcm8Q8EzBfUYLLpLjh5XEPFE
         8ebl/QsRxEOJ7CQEtKF1TAbkELCc2z+JtvoRnqNkkORlpjsW/HBi6vfLUKro7uP3OYP4
         SNn4IrRj11d1XSQ8MrYSu/dPB7bWWMrnYQE7TbjIw0o4yzqiHIbWKe6CaFSem54an7/d
         Fs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076798; x=1795681598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmT4WgTDWT18+4Kh8ZkVb7GOYAc9vJhp+8b3rcFZwLI=;
        b=iP67YSBpz5PBTVMyWYYqWnfdnD3ZnS5cFGtFYAA1mcvJzqCI8ZOX8hsGJxsEP1SvmI
         C9N72q4zSiN2RuPoWJH5LEgC74jQa6W4FvrqD+qnQ3o0z3Sl8tDx8uFZVCvNqxJtQr1U
         MOMEyRnGp/BpSXUHStkDZ7LEmPBbbtGL+7NbAz5jYa6Ft1noSB5yNdZWGpAuKOW8MTyZ
         YVXcG81ijOMYbrEmttEz5O7zbQrNfrpgiiW4fqmQIzgaQWXAHPxvRjJgrJBwlU9PRD3A
         2gNX+jOBNavtrPUYnj3kENrC5+SQIK6GN9uOnMfcAVFsA3d4o47N7dNkMJAm1D16Yl3q
         zYig==
X-Gm-Message-State: APuU4Z8EWlEIVz+5oCrqJjr64jTUKrgGtuXztHmTgOJ0FpqEkKGKDF28
	zuzvkIfsYUTjfS12Q8QG+prgskUV+G8690OxTQ9d7jh30PJT8HHRjOvQGxRjVWUZ3MBqfqrH6tq
	9pAphFCtIP3+p8eImCDpWsjlFsS+e4Upf/OT7Wf2SL9LEIodME34cQMREYtgZMSWsoh8e
X-Gm-Gg: AYBFou389pyqO83wrrbWuGOgwbCmknaXNnb3xsQJSvLAlO5LbbXqgALcJlRPHg0CQsi
	eiMTIpYWoxwiB6ZLMvcY0qYtcVj+v9DqRbp75X5pI8mTG0Ntd+pIeimZ7Th/VmYAMAmXfzv5KK9
	RWB88vvUC+WVsQGx1DGHONDTAjFvw3KjVkEarCcPQiOk25pVDhTG4c6Wgr9SHGhsoD12wSudnEx
	KRDlgskL0lo5DrDjxztCjC++KGWzwxVML07oXOWtfuOLHRGetgKUAD3bZP+9fhEaEAI2EY0nZjF
	jVw0Nw5xYkznzsHHYjlvdAHDRc1Vf2YmrvcOzZi2odETEL7KFtM8QBghpEhHEdHXflZrPwDxEVE
	OsJJ43vkv9OBIxA6XcocJ8+wOiHd5eRmO/SFovYdvyARj55B9QL1bJF+f+BkTSS/YDL/dOQ//ij
	xOmzHfJ7/1gGh/FbMzq7iH8+FNgUClRQL+ujAo
X-Received: by 2002:a05:620a:608c:b0:93b:bc51:b40 with SMTP id af79cd13be357-949994b44b7mr855110385a.2.1795076798001;
        Thu, 19 Nov 2026 00:26:38 -0800 (PST)
X-Received: by 2002:a05:620a:608c:b0:93b:bc51:b40 with SMTP id af79cd13be357-949994b44b7mr855107985a.2.1795076797565;
        Thu, 19 Nov 2026 00:26:37 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:37 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:27 +0800
Subject: [PATCH v9 25/29] drm/msm/dp: mark the SST bridge disconnected when
 an MST-capable sink is present
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
Message-Id: <20261119-msm-dp-mst-v9-25-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1383;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=smjaZ/vT/tQUxMxQD/7GfIpJhvqfExIMSEY6fhh3ViM=;
 b=lkf1jB2WLX8xRaINB/7tk5FQ4sYX3U8Xl/o+IjlQnqQmQtdC9BEDpHM+jn2CmhElZJgkiOz/b
 IuV6tPC3rl6ASvvkD0wKshj1a3LDEbbr8Zp/MemXPwzbibAq8REqvi9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: t7KOSgg9A35o1Q39vGYSOVH4s-F_WFJU
X-Proofpoint-GUID: t7KOSgg9A35o1Q39vGYSOVH4s-F_WFJU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3YD03Y4OtJix
 WZwBq9es1L+/s4WHR9GNC0aiaNuFz/N6b75W+i+QVFww2JgE6tHGxqC8hLDybIt3o7xyONFADpm
 pdVUhDg/1Icu219VITUSbsJ0rb0Jn3k=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afeb2be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E_DJWZ853T03DlUWG8wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXw/0bQhqrWrJ7
 nPkCI1oIvr8kCNIuRyp84Y1rYNhQ7xz7bLcppelWwfIFZlcQ+gLySakBXzQCZJ+CqLi3gA9+K8I
 MvOAl/HwRhCji/yLUaYfjjgPi7MUX9jm8s1KUYS9aJSphQt4aTYbuptGt2h+qexptObMFPHKWjG
 MlDXvQZ/8/XzhznXl5XFNp8i8o7OLV91zwQOhgBt3n0ElfQTeNUsv9NlN/3afHv4LQUf4Iq+83u
 JLnrd72SO+knVXZrM4cR4cPl0pNfPvJQWZZz33FEjg+3WnuKdI1589YWGIUCF2Es57wzqhy44Ml
 ambxsoND0THNDPsSf5Yjo4/d4odkCep9v2RHHsSJVizei9TeNoYx1jc7GsoKVqRvYNOhM440trd
 X3cBaTMH4WdXFvT2VlAEFirPKJr9UTwK4UQ5jaxz1Eh1YsZDmYv+4mWqXDqpeTj2dQToaN2+0Uo
 MpSaPEUPXMBxUyqn/bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

When a DP cable is already attached at boot, msm_dp_bridge_detect()
runs from the connector notify path before MST has been activated on
the sink. The DPCD capability read at that point already indicates
that the sink supports MST.

Return connector_status_disconnected from the SST bridge whenever the
controller supports multi-stream (stream_cnt > 1) and the sink reports
MST capability, so that connector detection is handled by MST
connectors instead of the SST bridge.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7f5247cbae03..6f1f9dd3660d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1063,6 +1063,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* Mark SST connector as disconnected in DP boot-up case */
+	if (msm_dp_ctrl_get_stream_cnt(priv->ctrl) > 1 &&
+	    drm_dp_read_mst_cap(priv->aux, dpcd) == DRM_DP_MST)
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0

