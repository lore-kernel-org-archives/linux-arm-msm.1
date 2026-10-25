Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898252;
	b=gMFusAruZLvejQB/n3XqtF6t7G3k+68czbeTVuoldb8cU1n5tGP2DmMMBiK1KF34QrCE
	 Hl4Q/5v2OEdzznPbc77+4yqjkU4eB0jN5MC/FX8QjYWiCr5af0QryFAtaujqgY8vcKaMK
	 /IGV+9O7vMqs3IBuzB/GFOHSe/q5/g8FqyuRyWnCRc9JGFLUm/mZOPSFWhCnsiQYD8lp0
	 miI91TbOQtohYT1QPLGllu3KwAlvssgoXSdBSujmVF9zSCUcTYfwt8/Bz39vKH9BTpQa8
	 OtjB+mm7zHqW3uA5993ZYNu0RM5mVnsogOq+2LgSRtC9uKUEvFHlEpES0z+rYnQfn0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=Krbw+i6Bxy5APMqBwl91NKzuzQ8q+01Ku3bmOUW+/cFe9XkmZNPjRPo3OuOlX6IhveOg
	 EVPy5PVVvdxC/pEEj7E7aWEWSfcFHrBc+NEyW8knBasCbwDpPNW6xv7cYY9YSvgbR345i
	 +3bFTlCnbDF/b2HL/DcMHmlut8E7bYBKvOq7bUqdebT72KSkQu0y4Qz7zMpSa+zWOSokL
	 2ZMvVoilw7v4pmTA/s6aqhuuaalgUqybEkDQc9Z0yBS28d4lmiJ/If+6a65aaZIzUhIqb
	 SI99+SSdUmQSO5cEViicXWOWInHNMbcFE0FzVLfnxBI/cgqD8lH5+EjFqfCP6XIQsyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909460A3803
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C909460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16Bpl3664575
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=P1UHC1VebmLt6ZTL
	1Jqz/2iE2BIvp+dVY4Dt9zA5H03AqrVGPgJhnovYdsyEp2xOgN4+ob6DW5vX737J
	4M4S+ZVHq0E5sWtaEEo9lqI8waUYpI2CVjboEuQMDbQaR6tvttMOA1epXoWBNzpf
	W0OTtE6ZCrF9YGAaBY66fdE5slB3+/PaNj3+ha+byHZkBjGxeqb7WPyeJeQacYvQ
	dbLjcZ8V0j6dSrbjXNoUJqXGo62S+QUPngMperhZCq9gLQ0YO94yQJ91T86Kq1ik
	/qf/uHMlLtu3LBV5abzsIJ/kCWLz3dBQQiQlBQvCAx6Dv6fuSOHPvXeqcBm/A5vQ
	kBR9sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xjcbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3692c5b061bso7399541eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898250; x=1793503050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=dJOn0uUWLBn/+lRrbYlX+lSc2BjbQS8J0ysvoSiC0/4oEcNf1oN5cYegIHB43TEHoB
         urzoNsDAE9G1+VbvhNUiKd7ZKyxInzXT1zE2hjEcrntpXFDVREPG9HoWghLlZM0RLOtl
         wKLXdxLXZx0sB0NS/opuKh2c3pmMFwJ2c908j/O9IRXA4u0pCeRfru+IjU0Qu53Z2GCE
         6qMcY0bUbhd2WNP+T60pqRmk3sZKuz1XjijlMbtS6Tt/ozoEsStZxx1jqrN+d+Rj/k4D
         g/4TcsVAN+joHuKT7HR+bY0MpIAgwYQJL7qlxdiRpVNc1Uuk0xMAmyWVfsA2uu/PYanb
         CKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898250; x=1793503050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=1Jv/U2J5TFGlLU0qD0Bpce5RuQ8TCD5hJLbLNtyYnE59BOXUxn2hjepcyoU0hZoUMI
         QElOsnfDdCnCVyzrf9V0oBdU7EmGmTqcSXlb8ZUirE8bPfsMqi2Wp2u0STjDze43qgdP
         IO5YZD8l95JFvb5/0jFWPTszJdye09qvLbKU3baCRjL/vpp237GGppvxfFhcl35trnRw
         mZGrRMzP08lSZrkOxPVr8/UoU+D5E/WfnMdsQXZR+ysbXjQJcN1DBpQrZbws+QjXis26
         IqZmr1Ug/ehxen+c138vEbOZ33sIDyhQ1VPA8IKg2HLZhnVuXg/HusNikhvn82mJpa7z
         575A==
X-Forwarded-Encrypted: i=1; AKwUvBx6ObnimXxKh8Q7mofR/yf/cFQkLRY/hYr6c8/7syre+5iNlfnWlodv4F3VRRFCWM+fpYyg5ykk9vWGlFy+@vger.kernel.org
X-Gm-Message-State: AFq9FYJntQR5Le93rVI0gm7369qj8E1Tobh4wD34hNZLaGs9/XddO/fm
	zGWuYeiLzR9Z6jlalWg851fhxuFl6ROFSMpS6KEjUER3Uhl/BXrLgtszo6vWF/wRO94anuuz67i
	aUtXr/wbpkbzte4P4XrBK745n5uB/asJ1LLbiy4/8+5mPMy1EkE6HEcpI4qppa/kdnCoa
X-Gm-Gg: AYBFou3BVReGitzQX0z+6SfJlWyXi6oVZOZkArxAjZIVSXAoa2liypikuOR7PXpaCoU
	rCwunU8SLdZSbf8MmPFPZ1EgSNuuntqJo6LP+aKIm/l6g3ldiqqSblNvwA9rQ66MbgW64nLXpb/
	B/iOIW0cvJp8bwgDBKk2CKNHXqm/6f28IB7mNAsWgZmRRM+6N2u3s/CmTZiNtUvoiem8dkzM/vZ
	hej9b3hslBmKgOPJblNsCKU+ITdrp60mkP2ykdXK5/x41H4nJY3U+yPQxvlkxkRL0VG5EbnuqLl
	ew0I1MKD5o+bhjvY2nIRQgvFLqApAG7Fgk21vUwC/bBXlh7ZbJNlgROwZU8z7OVUW8Py/OunNic
	F80rLUmjnX+/c/H6rVETLaOwWjyzXi6EPjBRhKDqJzKu8sYx2hRP8ndB6nEHjyq4k32E5sU2D0Z
	e9n12OvrLuXQ==
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254310eec.31.1792898249657;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254281eec.31.1792898249063;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:23 -0700
Subject: [PATCH v22 04/14] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
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
Message-Id: <20261024-kaanapali-camss-v22-4-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: JwuRaX1F_o2ujTOIVE5zxS0L9AwFGf56
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6add74ca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXyy/caBrMaN2g
 nMw+AO8th2oNNWZmmbt7E/7zmkTA2tHYd6yfcNs6mEXt3R+Jmg+Rl+4fpvzRiaDEDvQNUBRppeS
 gjypkPjEpCt4zf80t/H2XUmPNtr5QjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXweGbXgmFpFPd
 zN1iN33LTC1054NPz3hOXVuS1CXknC2SmHgSzQWgNLEzozYgpQrHO+mqV59cIgfT8ZWg9a9kMuI
 Qv19/7BKqhbpBJqyaaZ+YBMGGNzAsZ663k4+9LQwREqcFsX61oDgC3V60AhrKToUa1Vtjr0AXfB
 syzO4YLj8ltwGd8I36zr/TIVnoiatRgRGPv9uJHONnmTOcrXA6+hDOoLPWSvknpn8AK6R3h/hIF
 rwqWtHueat2GJCz2kq/0Ey5S+X4JdhhqNbbtz9XO+yDpQW7KFG8sY+E4Zf8AE1EHcP55cWzdq6w
 Nlpk6JN7IPFWyMVsVE9IoT5RXi0KvvQ1FaRmH584moQRbS70GbhR88ALuQDoE4/caH1+AOoBP3P
 Jqvmq01v0/IsAb0AmapIoT9bveCNLvpsR6Ekr8JR5T5bHyCZUbE2WDzttLJUURboGb3NUH15gxX
 kJSbLA8CXqqhRzl8A5w==
X-Proofpoint-ORIG-GUID: JwuRaX1F_o2ujTOIVE5zxS0L9AwFGf56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..4f8867daea4c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1

