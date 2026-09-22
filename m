Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1B351C34
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047711; cv=none; b=Hb8EdOI6c85ZZfXo325JwaoN3xH8OP+R6HdCzRI6e2Ku7DtKL7J+J5BOQH3Lu8Y4rVlL4tVmzvXzezqHSjyX1k4oI60m6jaaZVjMi66Cw7OTKgLYRegwRssHPhb9M9u/7UYoOlmzXbtFmHGs+JFYy2Ju2qKYBbs4vb+7tkypE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047711; c=relaxed/simple;
	bh=Z1KhIZQh+4x3Q0ktYwIw8k26fIY2iehPf1reLJe/bVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lBR488kYzPIGaYDuHniMAxv0TAyOngOqUMea218NX4xIFA1mHe1jFyUepTu7uvn6lZXeSKLXuVvS5hnn4LSj2YF27bFZnXc3j47bIZWFEDugpJiWLZ+GIUgup4aKf11JIxkHrNfD8C3FMM7vIQzjbEo1GjwKdnp660tcg3qIjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J22od+60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/+mwJqy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J22od+60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/+mwJqy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Kde2673979
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jzs9EY5/pGvizLD9pD+AQ7
	uVVUr0coQfu87mP0icE6M=; b=J22od+60ACKaV16yWn095QkaQPq0dkmTmJvzLE
	jAlm1QzqeNPRhunQlapVROTZZeGy+6vl/4NV8uA1e9fg22l+3kDfWr/Exr1X5Nmy
	soESSK0ysd3gJXp2sPW+onAYPPghMiQs11f7YWVvpqlDCM8jAyrlQwDxyTw203+F
	E/ntjvqPlfq8QvC67hg+EJMz3JMRxrAek627twFGvKlsMAqqUIUnOUoNJ5AApnDW
	FjfcI9lgQ7Wf+VPlHP9MevcLuuwVq6C0Q4dOmVlnNpKm+9ObvyqetvlGfShr6NX3
	H3vwV5TcULdCPtputOnURy3K5o8eGbJrMBSvCdcgN68Z+PDQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7a0d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:28:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so1327504a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047707; x=1790652507; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jzs9EY5/pGvizLD9pD+AQ7uVVUr0coQfu87mP0icE6M=;
        b=h/+mwJqyn79AYcBU1QQkYDG4b63bgEd4JsAZ8h6o0LVJEUR3phOZhQQ6Yul6ITBeHb
         /FtN9zAKaRLEu7bbdnDk09/Ve7+f1iDcVF3oJVxRAb88dr816DnKqfzKckou6CAod5Vq
         wlugztlCM+awGuhcZ0QZci4N+F4w7+rcoowhmrmFz5zwzYHJ6N5XMYUaQFCmz1Y4pkZH
         Z60aWsAiTNKddl9Dnkaf5GMKh3Eatm0i6ADkTxk/5mebrDbePtR2UJT6RGSiXVhKuFxs
         ZSYil42/SK5PIRn2qjyk+1igBJxg6HLR09cSACDmElwvUQAhHjbn8ywehL1Gfxy8zwDB
         zpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047707; x=1790652507;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jzs9EY5/pGvizLD9pD+AQ7uVVUr0coQfu87mP0icE6M=;
        b=lEIQETKsPQMsu3rl36MvSAv2OFWS5x7JEnyHlWj02h5G+58pFe6tz04QmLzjXZMRQ1
         ZKZYOucTqcbf9SAI/ZDWMRY7MmfHgDoydyeu5Ljt7gE4dLa4X3nvgA+h08PcAyrT4wdG
         fcOhqWBRoc3PuU56u2WwIyVJfkd03WfsTEcyltWzAiJ0ZAvi9zT58vzTVXA0HyYCkmaV
         SnQIKmV0991aLN6MMCrG+JP/rbOvH1FF0ImHr9pyJRp1QZdk9hYkKuKo60yZ1y3R+RBI
         mLb7P47VatiMJrtD5N9VsAdmko6PzlO47VebR7rwxb/8WluBMkdSIGXvYW3Thhokz6WR
         +bvA==
X-Forwarded-Encrypted: i=1; AKwUvByNVIW+NsZpXcHauzw2Rxsv4zsXyuAxiDPwORHTHsQGgxFomKIldMvovc5Q5kbX+Imr5X6I6IYSvt3gpJQp@vger.kernel.org
X-Gm-Message-State: AFuF++kRLWpin4AM5hWV2h0NtLRRMu7JpMBDZZ/Ez0UkpTDUo5bYeQnr
	saue4pZR/S2zy+PbCbMSw6ElWVi1nszOLFn31bXBUzq9Z+6QbplLVK/CSNWcXIfPAjRXJad347P
	dREF1u1emdhi8LwPj1AVsgxpB/0vT+WMNhZPPXVyr5xU+huwg4354s+5vVVVN3wvKulhx
X-Gm-Gg: AYBFou11KpvNI+3dl+XIgzLsFiUtx2ftg6eq7qUE2CwIDGqLbv/XUry39crTEfyu+6f
	7K2O2igWIZ2HwuPcpzrHmUTQlUmC3D9IBHGn+exNRuQcEK5TkoNKg5xRJpr7dTHKNbq3KKuIBIr
	OX+7cY3R6sNmVeXPho96cI8imo+zyKqY97VT0SgdglrwwrSFrHK+AiSNQJgoJpR+2pGBggXq9nf
	fDvn5bT5Qyt67w5OoF0bg8KFOaRV6B514J6H2SxV4oc5dBhLtoBYejtx9lm6K1uixGitqD2bAaM
	Gh70zn4rdthk8+oph8pqawnfXsUEOOrQ9s7BGxKwWwQpY2Ay9RjjPlcboTCOKOk17u2Ba/CKnil
	JCj5gxnMZkooZpZNqRCMLljdvD9erFmDp8cSt4r6qEkY8RfRBj0e1fVBpDDhjBsO8iNY+N4U2lh
	w=
X-Received: by 2002:a17:90b:3a50:b0:39e:6a82:afd4 with SMTP id 98e67ed59e1d1-39e6a82bbb6mr13645341a91.38.1790047706709;
        Mon, 21 Sep 2026 20:28:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3a50:b0:39e:6a82:afd4 with SMTP id 98e67ed59e1d1-39e6a82bbb6mr13645312a91.38.1790047706267;
        Mon, 21 Sep 2026 20:28:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574c49sm681817a91.8.2026.09.21.20.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:28:25 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:28:21 +0800
Subject: [PATCH] media: iris: fix VPU4x encoder line buffer size for
 rotation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vpu4x_enc_line_size_fix-v1-1-f0ee5556bb0e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANT1sWoC/yWNWwqDMBREtyL5biAvo+lWioTkem0DNdpERSruv
 aH+zTkwMwfJmAJmcq8OknALOUyxAL9VBF4uPpGGvjARTGhmhKDbvKrdYgT7DhFtDl+0Q9ipAC0
 cA+9405PSnhMW/V9+dBcn/KzlYLkk8S4jhWkcw3KvalC94tpopryUNcjWe2iMBz4Ak0wJ05akB
 9Kd5w8KQhp6tQAAAA==
X-Change-ID: 20260922-vpu4x_enc_line_size_fix-2c62a0cba17d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790047703; l=1510;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Z1KhIZQh+4x3Q0ktYwIw8k26fIY2iehPf1reLJe/bVQ=;
 b=DuCmYXfhQhuws9RwZ/nHHqEnvVP4KOhkt1h8EQ5S2P8bzBqijmg6RCF2r5sUXLRPxXmrF2Kqw
 +dd9Llg5aN8CmQUB2sWtj9euC7pFBO2jpnao5Vbh8xP5LQvjTh7HrFz
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: TTUTnh21-uWSouM4J2tIaE_YOzdVRtrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX46AznjLW58w7
 etymCtLvWWLg0EBMXwhp37H6fiUwqWgBwpdIaC/j84NZac+VKDrBiaJGPz/H0COMqY8kpRfLwUn
 2X+B/WbWI7HgbphbyrZ0VA7ycwgCS+e1x1AMmoaYSAYPwsD2c9dREBrB21dgOPYK4kPdfEya3s4
 mcRV4+do/bDnM9gwTH7/Z9dw4d79Hvu5r4TgOha8b+vGApJndAovQUjWINe1qiUgkHUXdKyjSf6
 eM+ocMGJIDX20SdtNLqhaxUSGCjQqQaaGcDk/80gWv1OYIDuClja1mjqPuSQhu0wJpXuWOVo1dE
 dJYubp5h06KK7MTzNBPuRC89p3zzk5d45w/DEAocX8A2D9BV5BomuiiFsL6XFmVZVsLg5ezr1H4
 4SygoXBPQW3gTREZ4s/nWHGokzfeNQoHqI+WTws/+35k12Aj56tPuT/KuOCPF1NgRe0/uSuAXJ0
 bOMC/SYDDhWPBX793wQ==
X-Proofpoint-ORIG-GUID: TTUTnh21-uWSouM4J2tIaE_YOzdVRtrB
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab1f5db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bmUCsug_us4eMR1eXtkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX7HSDBNePXkHh
 3ird+Fn3wKBSlrR8mzhJ8xxJZ5mggWf4tSP3dLnLeB827ayc84Z22bU6vjm+d0I2Bjpfv3RQ2VM
 8XUXdGa8aD+cwk5HfXaLFf2pQyEqXik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220045

iris_vpu4x_enc_line_size was reading resolutions directly from
inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
account for the 90/270-degree rotation case.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..b3aa495ab371fffa351c61b3410e26a50bd11a94 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2042,9 +2042,8 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 
 	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
 					 lcu_size, inst->codec);

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-vpu4x_enc_line_size_fix-2c62a0cba17d

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

