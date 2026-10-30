Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391596;
	b=Y7P3Mnm2ymDDM8pnOzFVu8BWFrXvstZKnPMrkqF7eX6WTeqD++VxT2Hh/U6fjWO6sZuv
	 esnTjXpoZFBULOH2SxHM8Pi/mpTwfFUj7ISKb1axQ+SMSppiblf8McepxzG9Cc8S2Zkjz
	 OBWl2M8qG4PoqJUmGSTxjPW2t1d31wZsV9jw79G6B2ZIPxDJy8DKorJadaYeCyYVxTACN
	 OuOk+8ia1IDOeQr7I/6oE5ozQjksVuT577ejNjROMxnOukS+shmgff6UC+bz1UrGdBEzn
	 LrTQ4kmvM4v1zSrbfGW3dDEK+EaboGGFvP+1JdDBxT9o40wT0LOUswUJSbD2s7cM+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
	b=Abdu94cA4NbP6z3FbQbgYqf5PU6ikNwSdxwPSbpmDrK2SBIpytCEJBXE/+xlHtNQsBku
	 p1BTj8SG3RLNpTKmkj1xo5Lqx2qjKah7dCzdP+LxfkmrOU9RDWPMOKf+spAsJdocpn2XJ
	 eexh6Kruymf4iL90IcmmWmesOH7pW+bY9pwtogsVv6NvEgU3no+U+jXOwEpClTAfbIRZ3
	 EGR2CzgZaUFjDePc1kVVoozXMoQCNXtaO8osh+k3Ei/fqqb6DjdcDntjlR1DKtaRHYhtt
	 IjuK5XLRlJOGKZhpjl08Nkt0TVAC8TwoirJ8npg9U5AEaqcX2XLqRKEzXx9g4xs5WNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KHi/hL7Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfBdm2j4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4861606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4861606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHi/hL7Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfBdm2j4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIcdSl4118702
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=; b=KHi/hL7Qrdb3RLH8
	H2PwyMvxxHdNyzd/HCkNcYQ7v77xFqg/AhqMQiwZ6UFOGU5uXhLDzYDXm+c4Ngzc
	V66neTPztiJxr2tWfeEV+Tv304E/UWrBZqNWOqwrswVqHA5XdbhJTkQ7JVtpgm3f
	JPeSGwZwFo+4dilSG2e1aoJppwwChXKHTtdhaKuhkvuzHh6E9YbtOKdvgFqR4Odn
	0uC4RjY0EWT4vyzkAIgK/UHiGYx4z/fuQXRY6GTxMz+kusbH/qLlbdANv0MRXQ6c
	O1eBuz6YCYYQGx88r14WyMjAqprVl5CLUekw3qlxUVVTb7+MoNklXhSF/+/DkxZ6
	zPxh0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0pu89sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:19:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so4323033eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391594; x=1793996394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=gfBdm2j4zir9TDsSLp/K8Ff10mf5dW3wVc/kciv3Vp9l6u+zpxdn0QqmQ4CoLLhUS6
         XHQ33EEw9D818pQpmCnryXPNoHbr1q1Z1zE9rUiP5QdEjRHdzbKe+VSHg9HD64u/mpoe
         v84pGSOd/eayunXZZ3is1gptUjfuWiKfqTZG5+bd5P0T6XefLxYUfkJ+j3Njwt7IZoII
         3A2PMcWQ1/0mSlyolFolRekCF5lf/xSqj/VRLrk1nxERnxZhG2K53gAq7XRqZ+U8JH0I
         UO4Per497PWNB/vx55wEQv33tUXFEdtERGhZP8/F+iAZq7z2J+0QgIfCeTF2Hu37y+9u
         M07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391594; x=1793996394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=Y+/cM/ULtAMgbo/6IljzV6S/RuwEbVeW+/1nus631F+GBkbCWtg0RjQD52PxQUGw3S
         dni3H16zSbCp6CzrPcO0xBVz1RE8zbjV6ftGbaZKZzgyzZTpXjNN9axohV307ah9cB+g
         JBsQmH/hnh/4UApjcum7+WM6VIUlCgWYRr2EOCNrVReEQzn3cR85zhXaV7180IDCfrFv
         4bIbQOqOEvSo4J+/2fO6zSjsfGJWB6gpap64uK1EfuBZD11jvSzTRdgDMMbgH5KWxd/f
         8B60NzqCwQcMSbQIaLIOUraL6iMTnuFBN+MGg2eWsozXpT79I+wMHUBUDbY+jyykPfy5
         Ljzw==
X-Forwarded-Encrypted: i=1; AKwUvBzDic+j/umFrP+ySY/W+3+bGH//21GtZcFzM91yI7NE04OcJm2rTasy+yI4sx2OWTV4acOv1Hq7NwIIXQx8@vger.kernel.org
X-Gm-Message-State: AFq9FYJPh4wvxqS1D42lcAQdHYCbPJz8vMhVsCDfbIUQhxaaKe8qeTmf
	FBTSL4yTuAWjez6yxGnJfqqTaTBJKuJv67LvhZWoXkjt5w+HsuaGD+/+9nLMOSZdTdS/w/Oa9L/
	HA54S3dSn7JgHqIToODbh8LkKnqHEcTE8QX9dndI3N91MhXaq4lCjamfpQ1YV3kXK0ayH
X-Gm-Gg: AYBFou2L6RU+05BEc5sZC8QYzww469p3lxLtPUFXVgDtVOvdNh61Enshy0Rm+RRJPPT
	zXMqYYc9qm1VeU2stiaJJW54ZjKivKI9hKNF0lJYitn2jRrfRuTAZRPq+NxEksgTjpUwrTlQN0d
	KJ2IpPNHV03BnKP/dJOpBiRaDJVVnU/T1rTkb09qKNXjzsYupB4hgp35j7FmHI0kka+HYj1aTEj
	x/mSVds378pn3gnIeXZTW4Tys+f9Dx7oV1flcvbFPaPfgu26DAuafrvb+9Y3gngoUBvzn9CEEyW
	svoWn3FWKSJDUmHXd/p3H9NA6QJRHM9ZvQdKadpycs2ltJ9r1Fyr9QItNoHCDZKESTmbeWI3jKU
	93thlV29Cng0p5lTLhQnM8CLny0LMM9DhzN0orff/JJFrx8bXBT/4UnIOQMq67meGFP8RaR0vDt
	mFllGSzA==
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr4616465eec.6.1793391593806;
        Fri, 30 Oct 2026 13:19:53 -0700 (PDT)
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr4616418eec.6.1793391593086;
        Fri, 30 Oct 2026 13:19:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:09 +0530
Subject: [PATCH 1/3] media: iris: Skip redundant decoder input config
 params
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
Message-Id: <20261031-fix_dec_seek-v1-1-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=2308;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J+3ZsNvdFp2OxHwNoqL05vud6cfNJiFhDK7G5hBgPFY=;
 b=6S571aqhfJ5YJwehy77XWoQ85ejcyXyUVLjoWWjhnPXbeza6WEjZz9CDIoLDe/8OAuoiY/cvI
 MaPULRwlQiEAKzD3uELQl5xhtL2q+d00mo1f5bIyUWLAVkAhSN/iGff
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: dlOINy9uiz0kAe7iyIvBUFmRztNRs06S
X-Proofpoint-GUID: dlOINy9uiz0kAe7iyIvBUFmRztNRs06S
X-Authority-Analysis: v=2.4 cv=O92sLx9W c=1 sm=1 tr=0 ts=6ae4fbea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX5FiO1k1jwb52
 rToFUSVy9e3abOHHhO/KMii9sSCGYWCND6D9FH4wl7IL9nVfi6QtNpa4+4nMwWjv29LjZUVNWZE
 pKyUVhj4jPP28YfIBGW9nyiPsR3qEW8aTP9TLBzJ54gJmZDyDmCqLbqR/94lk1pmzW+kmIimtCM
 wQCARDfatHFEFTUzEM03u/F+8Ji/rH2IEAMQPr9hLx/JJaLabktaVXaVLM/Tg0YQAKjvjLGOj1Q
 /QnvQc30exP+19g30UYeOOkTd6f3yZZf/GxXRn8BEavgWkgMvoRJF6qtgeSsISlIs8A8ZOhEdlm
 +ySZQPMXSczPzLqh1hQmb4tzX3UsTrfjAcHnp01WOHS+CCg1GTR9eGtmDEl/Up8OqvFQM+hKcJu
 GG6jSJ5BE9lmAoBuW23NKOShB/XK6EYz6BA0gaFvmLk4kKFcq+AcjNuG4FoWr3+zw5ldXVtGaIX
 AC/YijMzWdgoVM4vzfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX5I/vLpY1Ms2p
 +dY5wvzPaACiQ/5UNsWCrmsoD1mDmnSgNleZzO3C1ddG56CEipPZ9ZzrDW1bL/TGi9KhlJPKABP
 6Sxd+poq4eLDaVYpBcQ7tBWs4epb4sU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300080

The decoder input configuration parameters are sent to the firmware every
time the output plane is streamed on. This includes streamon after a seek.
Resending these parameters generates a port settings change (PSC) event
even when the input configuration has not changed. The client then
receives a redundant resolution change notification on every seek. A seek
hang was observed when redundant PSC events were generated for the same
configuration.

Skip sending decoder input configuration parameters once the input port
properties have been programmed. Reuse the existing ipsc_properties_set
state which tracks whether the input port subscription and properties have
been configured. This prevents redundant PSC events during seek operations
and avoids unnecessary resolution change notifications to the client.

Fixes: 025398e9121c ("media: iris: subscribe parameters and properties to firmware for hfi_gen2")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..fac61ece177e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -668,6 +668,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -693,6 +694,10 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
 	};
 
+	if (inst->domain == DECODER && V4L2_TYPE_IS_OUTPUT(plane) &&
+	    inst_hfi_gen2->ipsc_properties_set)
+		return 0;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {

-- 
2.34.1

