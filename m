Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286597;
	b=cHbQyg59cmXMXxeD5jxpSxz+ilqqTfeY2MtPuAAC4UAdAB97M0Hv0fMZ2dEvWWY9jHk8
	 a1oqZYtMy5AmcCFou9+XmQ31fx/HeESFRaPRTg1VmwDc0MkUEmvZc8c08vkDicXw/VdKX
	 52d9z94bY740evaePcXNSg4+JfB+HefMaKcJw/kYogqwpRK+cquWOXhl9QgPX0hs8KNXH
	 0jKXrC10MablHtoIQt+hpAA1BYBNDNaVSg9gVV9pCvfI0ejb2RsbAEU45EItV3ffshBuO
	 uRMXy3uDCId5cH4PIg/3UJjzfC+T2yNnvVH0D9GaQDfZ0YIIgz7EMJX4qRp49MV+Otg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=;
	b=jVg9o922xfzoGeM5C5LqsYSeVUO/Blv97w6Q5sWToUAekc4QQ9gmoke+sDL8EBepjk4N
	 4+UBrNc6yr1yL4z47wqbySx9WsvA1T5aWTiYoV0RQ6Mw0Enfohyu5GBT4XqS7eQ6VDMxl
	 1I3MlbN4+Lf0ggLWMegeo6fYn4KIyRI0ttS/ZJ8hROr+2GBJsH4u4mzf1mMAsKLqrBY8d
	 2yodqbRC/M9Apn7mLhCCM4Sjsw3rjBRkjFtKPlf/fz3VCP1hsBqDUDVVFgaPSAMHR0wF7
	 VFJmYelAwQ3qIfktgcPckB9Ug6yx4a/Rl7HW1NEAMF2cFRSdkGHcB7DEDp0pB1v3FyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj31q4mm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbeN7ODi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC1606A331
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15AC1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj31q4mm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbeN7ODi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9VG1207787
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=; b=jj31q4mmGzsllkPW
	oLUqZ2MbqNc1v9D2gFKfdPzle3uJghQPrHL2y5Na/tU6KwTFPUuAT+1zrgtGB9mB
	NPx0ngYElKDlccW8zp1Ms5CdwaBWdaP51zlQfR9IR8LH8PJrQhzGEc6pXGcEHngY
	zpT/bA8UyMkk9sowzhIQc6KKMacKI6u1p/HiWMqtITbE1fU6tOLu8hAxB0fRCTVc
	bj95zy7cP5De2M3NbdypaPbBQvvF10i/NKJOwXjq56bLEYxlvmrkLS5e6uATlU37
	WN5amoaK1sfiMEtn1hZUFA4mOFbJoI73OCJMUs5AoZWfAyYFnozRMS/O66eeDNkL
	sgJ5bw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhfbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so338756985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286595; x=1794891395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=;
        b=HbeN7ODiNMIjmPhriuNHn/OqXIW3mFyLt2/DYZdh8hIxvGEc4uudxfosUSKRZ0MGy+
         Q6xgFWt7youHCBxGLq4wdVc58GnASHEGM/Ogb2Sf6Q3vnY+5BBSMacQGLJ6w4gzZfKfb
         4EOYGe1Sz2yU0Up6uYGLlAqskblnMJJnjpvJcg0zkiPiuKXgIcUn7U5sGUnWX5A1ivxW
         5Axs1cEDINFIeby70RCKv3BM05fc/bFCPkEq+IPIzpmrTxPjdZPQJDu+IHPx5qnWQTNO
         8m1RF25G4bwnSAcv6T7aT+GfkGr9aNeQ314EsDe34mSttZrR3V4ltj/ZyXh7OCHELtpU
         K54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286595; x=1794891395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3S1qtCn7UxWFRWy87zfGVw+9PWRdpRwaQRgJeQkoggQ=;
        b=uHa79KrNLoenKCwUKrFuIX/xMgFiQIM6AtapWmszqqrZeXnwMaaCT+gbl38XJyl7Pb
         Co12ci1i4ha0Un6Xk7aVc7eGF4XYmxDmNyHDwwiCwyUr184YY/bkau8keCS6IFpQsXHS
         tJ3Mx56EypkDgsA6qRyWRsYtJBs8rvez4zY/ChA91l3eAnnr78JNpWw3zJPfSE6tMyML
         C9Imdm7UWEMhs6bzt0NTUc/gjZl0mvF4RMyHLBAXEO+n18n++q/zPK9gQMB8f/8jeVMk
         +JuinixqnHejm3MBNRhmQwUu/kG9xYDt0fshxgNEMzbh0Vm9+UiugQ9PpWr8HDZ+HNFd
         wGhA==
X-Gm-Message-State: APuU4Z+U+/7hQvhf9bmwrCUiAcfmPe6uA6G5ifXs+0uC9UjDUz+jTquM
	FYkG6OnpAtToQQuB8rklkoZ7WhUORtLdEc0zIxEPlsxcodfvX4HNuifAlqjAVYm3y/BXBotrZPj
	0wt5ZXNfPqa91AJUPWxYinjBR/CmcV5PdAq2yxPfv/IciviC2rzl8bQ/MMuHKM4AMvrHU
X-Gm-Gg: AYBFou1O9ZKxegKJsqVujC+7JsgHNZ7K5YqDCJzYe4+XfH28YUCcXgyjbrlOged/k0D
	1155C4nmLfvhm7hTwB7bcbQvuLF22JnMNk6DEU2KQop/fuHZtxGFui1B0yfN/6BQtmWePYTOP6R
	6aurTDUDeG8oghZJwTVnkfg//BxsQve3EUvsgTDOVvAhxB3Zb/OL8Bpr3KqONTxechy+LJQHODk
	4ZaPi3GR8gCcu9ykxvL8YigLr48p9Qe8n8MaRpiD/cSE2s2uJEyPgtMJO+2M3atRR42Gm6ZbK/m
	u5V024HTTPTNG5hHV52tn6f6sOJQAXOM0c2XeicZ4ZcYeeDYG5+9vfC934kbqQfIgEE40wh4lOg
	HsoETTMNOLzQJsgrPykw74++W2wpCJ1p+Nx2Fpyu23BFbNbSNSf6vku+tVrapkdUBaiaWlbpIc4
	iKnRjPIhViO7+gQHCtQlP73p7nxbMpw9mT/qzc
X-Received: by 2002:a05:620a:2586:b0:93e:a51e:7ffb with SMTP id af79cd13be357-9479f1b9eb6mr278179085a.2.1794286595549;
        Mon, 09 Nov 2026 20:56:35 -0800 (PST)
X-Received: by 2002:a05:620a:2586:b0:93e:a51e:7ffb with SMTP id af79cd13be357-9479f1b9eb6mr278176885a.2.1794286595119;
        Mon, 09 Nov 2026 20:56:35 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:34 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:46 +0800
Subject: [PATCH v8 25/29] drm/msm/dp: mark the SST bridge disconnected when
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
Message-Id: <20261110-msm-dp-mst-v8-25-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1383;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bBuxzsx7BIcnWIcOt6s6iyCubG47bE57DQZDBblPLv8=;
 b=DLNzgPu9qOBxtXLswwJcZYEcAtSDIC4flSxsblLg7PLqOIqmq9F/2ZFaYh/pBACS4ZJ8d4IBT
 R57rPTUbFUMBpKiBRKDMAmu6VaDTETc3eU7/WX4vr9Kr4om62lqG6OE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: eF2nO3XSfW5082X1x9aIAV8rvGe5XXdm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX14cEKx/M1yBX
 z+HhPphvSQzVM6EyHKgPjZjWahItmPP0OqSwEH52YgolWl0DpiYNI8eDEMjaJZ8VosgBqnXbK4X
 9wN26+8vViZ2jRr0sdFYYfbIeixbvkE=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a404 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E_DJWZ853T03DlUWG8wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eF2nO3XSfW5082X1x9aIAV8rvGe5XXdm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX14UOpeC45LbL
 mJi36EkOT4JL6nSjjvhTRgmOYFgN3OoXueWNKyfCev2z4ARZT7OT7ZPSdlHH7jY84g0NSMyJ/G1
 IpjfefsfWJcf3WewmD3xqCtS90L6Gr1jJjSV6jwdflnxI0k7/TfkUS24ozZ6Nu2Q7ptM4ppw5Ip
 Njq+qa+vPyQBMr38DtSurTqP76kxxXX3eXLX9Q/nFG4VZdmjL7UHxc0c3dwZb363Fcwuz5JNvuZ
 6GswZqlRrTuOHf1HD3j6dA+CDO47esBA6FDgGpnfUisG32tVTtOH0k7Hhvjoa/vrhDjO/E6+4EA
 84xIhGRlzJ54d3SAGobU6Q+UA3HLsoPB6JKPMWUnjAsudrXkv4ueitUtcxs+CJ6R4+27y2CewTU
 k5QC8rrsNcbE2++7Ip4eksud4TeofLSo+paeGeXyW2OlW4aO6smLZ9m4ypd8JWJx+3vYn64/h6K
 CYDsERpANypuj6uLYWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

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
index eeb0e0494900..8ea3d258a98f 100644
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

