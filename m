Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995926;
	b=yTLzdu6/0ZJLOc3pM6NItgqev/NIUf/rk09e/xzZopyti0NK+kpsjroTd0ZfZ+INhlqH
	 UW4a3B396eKf/df80CKseBLcg+7ngbxTaf0gW5vkVbeS9hWgTpqzmghrzelMP6fclMwJF
	 e/ReBsSljMI7t4AgAfdMGaFYUxlqDGF/bMO/UOLOrnWd0ZmynT0cKwGQlI33XN/yATwGK
	 6IVPIePM0SsVOFX3/3qYhdaB7fw+oQWLiyyijpD1sxOAQAPMZUccJ2yRM16W2Gre/JAP3
	 R0pw5f8kmmKrvS2N3I14pDm5orX54cTHg8L+9xLWw3EXgjE8LI7gXasMg/YoYit7nLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
	b=t333unCCd/GoXe6+KtB7AyxtGz4KnsELNGlru0U9PJhC5dG/wxztq2nRHkfyi/1LhoaD
	 8hWH71X6WGx/dGBr7g3uNXphRHZLHrcXcsksx96/sKXmTb6aQQrP1Oys2SLPJzk7e8ssw
	 xDjXPwZfY/CFjhxThTYi9fVx8bbjDcBDGtMZbzIRADVnrVX0Q/pgXjlEyxN0p59z7rOoP
	 YQiJALZhpup7X9j8BGu7++R8P12Aa7+VWmRfBmYOxRfhGwcQJuvHzlBYrJOKLobzAgpmp
	 NB47SrXOd4c3uBZs3lFHZq1KapX3wbkFGDlaxOq++0rs6OMgdqV4CY8Ohs1Qajz6VXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mdi22M0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1WezxPJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BB5606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mdi22M0D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1WezxPJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b5Lr1340503
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=; b=Mdi22M0D0/nX8L8+
	EgIDzXe9Pn4OtwYwlygs/rQOkwznYAJuyISW+R0zkTb09HRmG2w7+CB+dkJ9x3QR
	wROQ2NmY8nxl7d1yrZMAVqeWJtn+OzG0IczwEdfpNHwmuBl4EE+59e38mNe1lefK
	7G4heGBp4GKNN6l0SWxwhsd8B6tw59IiSHlRmZJwi2ajbD0Akb8X0fn6z97ssX0z
	/TOvU/98EJugFgGmR2ANrhqnvA8CA/ikTJl44fYLf2376Z6U8u+/5Ffdx/aQj1RH
	t6H72W7/4ug8+6iR81IVbR/hg9yJ/+ZD4skdctIaqJqMX9rPHhQssTIQZ59oT6XI
	YIo3KQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vwkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so4449017a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995925; x=1793600725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
        b=N1WezxPJXcVVRCG2le4phpp/rmEq1k1zvze7NpL0g7UctSh/xzyqyNtAQLTA+7tG1e
         SdKDgfHwUDdNhCcr9G2aathfIe546zfgayGhUKjPmbq6rJRPjgIEZ0A00Ynfa3rUcf3E
         t0nABwveSeCabR3G+UGWoXeEy6b74kdyH2eONRPhB+QCO0cH2xUDRxOcWx25CB1iXUWd
         W2rm2OKLoYY6S93AfV4sR95Q77MXg5k3TL5LvvHpsjj54Iu81iIQIWSfL85tioAYyM7o
         y2N1urkZyZH9+Y+XUKqhWjx1gGSv0ta21U+K8u68dDDk9rgrxthv1nWWEvmXifkpZq2S
         kiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995925; x=1793600725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
        b=kdQqyx05QIS439f9Ye3/KS/pnE7U5hXpR1zUdtDbuEISJL1wSFZ0GmWO7VcRTJi7Ol
         LnDq1zFnL+WMBcuWxh6PH3Y4Z5Tx2O2IsIwNr28IbTUqzZlg78Nvj53ubZrE11IZrube
         xcleyB3Bg4+L8kqX+2fVYHsTKvvjk6MckT44f0E6sryMOGIAFb773XJk/9RAEBxB1ZuP
         Cw49DA2FmEB5dfeT5GSEgB45Onpz9l1So0UqRS0hhU7lm5+P86C8zDtR1YALsylWL9Z6
         Ic/RZD9kuuxIz9ZdX/GlP8RPj7TsrGF4HGIF8mvObPmkb6DDQEVCO5BB8/qoA9teMfbj
         Y1Qg==
X-Forwarded-Encrypted: i=1; AKwUvBy0jfySVhlZZVhUrgT8sUmwJU96i3Nobxv5X6Yj+uMzivSo7BljILtasA/g8cC1OZfgWGmnbwFF+xzJ3fMo@vger.kernel.org
X-Gm-Message-State: AFq9FYKZMsrIBdfFGpiTzZRNCdIGfRd8EuWhHDZJpklh4z2toOHeBqKs
	25sqb3OBBSOliSUcuo2xy/22+uK1M6viBaVC7hkHNGYOTOKZOMFFqAdv+8fWGrKBp7f29d02KEC
	Y7Jfcb+KCh6YmCMTKiCyN6YppxJ7m/uUkxgfL+mY3lbFGY0g4A5lY0fAKR/qBuKF+NpdU
X-Gm-Gg: AYBFou17f99mWRBlNi+rEbI9bGidtXY63qm0JyQn3IhvwbnguCmARJMd5vPvctgsfjk
	ebngmTow4Cm9sooqoqA6QGDcrWRz2Lbn/t2QQCzgnZvvaTMqdz/EmMXrVYHZvoQEga/B+ymcYWT
	tJfF8UZt2IYpnt5v8ocfsctUeZwGr5EndvOCG6BsGJNxGG4xEM+np+VE/EKzZDk7DcV0r2wY58C
	0S/Vv8DpPiFsoFUEI8+EkoBnwFyE5jZ+KeFg/RG703EnNETr5fUEjhhSqEHsl8owxlPDmu0L8gV
	7SZEhPgN3Yxw+ALDRHVanbOSStxgeOY7oIuI929KFfkYKYmXh89LHvwpEBUeH0KHhKltecZ3ozB
	AB23/5MX6L0XUUOwoTSRPVbuOsAhRQyMM/w==
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr4744309a91.47.1792995924554;
        Sun, 25 Oct 2026 23:25:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr4744280a91.47.1792995924114;
        Sun, 25 Oct 2026 23:25:24 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:23 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:31 +0530
Subject: [PATCH v2 21/23] drm/msm: Support KMS backends without a display
 IRQ
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1124;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DKmn9i1vJXXvP4IBsacfVZJPAx62TejKYArKw6N1S7c=;
 b=vcNZ0ngyibDuHfRXl+gMTdO0b/EpAD7rv0lv4FUaHdf/+mqY8ImRpBvwiZcSIeoQwYeo9vdXJ
 yc8Y5UbPo6uDgvAYRMfqwFRHOii6CxjBVS2R+enurNuUEuwobPHtCor
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: HVbaSoxqHBt1wDPNiFKpzsDutqSItA7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX2/VSFVvST7la
 bqU6dlu3Unr2fINmvsM7p7hCbw/cXrsqy8Ih1Xe46RM+8Dwdk1gIbi6eStwbZcyMllUSvIVLRIB
 MA6GtxuKyQOYcWIe3ILw3CMO3VIziKfX03iMZKiAeTcTSMQy9IDudj0D0mBdap9gc3k2N2pz7gq
 95+7oo57S1f3yvVyg4Ik29k8OJ0cwGq0b9pMmEID55Y6i6UTh6QUMkmNW9pApgUJM33OHYCoQ2Z
 ntbDgwGWNYrUyGFhDLqIFk+JonQ+7t7Me9wh6DCb27p8GXSu/K5+fSHFZzBDd2o8uBwYHE6opa5
 pNfTg4JAOtXsmUQ5H/kv1AFU0SxpRIdHlTc8CFXgDQ196jfRtJczo02H2+uwJ2609IZBijiJ9XR
 olH17DQD3Uv6zVt3ebjC9QpPz6GtdK3aEmxSFgB6EvMyqKQQ5yopOMI7AXGE7g3lErHeKUmlM7/
 ZUiDe+YJoz8yp2oNX/g==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef255 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HVbaSoxqHBt1wDPNiFKpzsDutqSItA7i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX6irkgk3sBMFm
 pZxL0u5LueKQ5BNUS/VaYYiRc9eECRZpL/X4bT0hgvrK1vI99jJikF+vO/8vanE13oW1PjnZu/i
 qza+XPV0uj8/2FvoGVXwTPBK3l403R8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Some MSM KMS backends receive display events through firmware or
another transport and therefore have no host-visible display interrupt.
Rejecting such a backend during common KMS initialization prevents
it from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..1870a7008ead 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

