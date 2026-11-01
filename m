Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571886;
	b=fIySS2F9ljgeEghpdgdBQIxVVYtQ23GJaRPYag/giBzwVsABKM+11rm50mSuu3xMnOiA
	 yxo6YWuY5Cn0vkQHMq3UfLCj1Yr01W1sYUU8zrjZ3I3lLH77ACrBB1H704Tg+msQCUYYU
	 Qcn0LU6MXcPhovS+oCJrF5Ui+BYZjxoniZ++B27Aq0wNlVSKnoajBC9yFPhkVPpm2aZYo
	 o0ae5khtbhLETpls00SasL41ippLjjK4f6QVkw9Dsca27ab09Cq/o8pJQ/8qpeo/Jpk8n
	 6B5yWqTG8xN5lCn13O0OpryL3e2yTeZ2V5rHtCnloyB54St8uu89eZwzjjJn2INYpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=;
	b=RqkgS4dVDl5C8LqrNgDbAT1rsAXJ1KHLVUZgs7WzaI2F/D23uou8Yti9q/IrUNRSC+lI
	 yW41Ozw8Pimf66erfPZis+z9L7CYmV5xI7KeD9WxKr6/Xvpj3oeBTF/B9jPw+ewZditNv
	 9tHroGk5MfPnA/nBrOjnz0Vr7JDs44z7qveEssK89z2fTHIvGhaIrGY0kPyGxrJDJMUcj
	 eP4QwdT8WzbZ2ZAXOFNUeIzwatv1BE0JJJmgZIwdEOzAxgjk2ntkXY5xsnzrrvX180weU
	 1tMT6sBqv0FkDEPsxSPblPBj1TrMuCSuw3a7n5+9OwMUfoO8G1EprbaI3c5YaWuhvvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOKqP4WH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMwfAmHv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196F606A6EB
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A196F606A6EB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOKqP4WH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMwfAmHv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KJsef2776943
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=; b=MOKqP4WHpUGsG97S
	+RbcfirgnZmqNu6ylxITEuLkP4hUkO2vRmBui5AparsJn4CbJIpwtM6O74ndlbLR
	hF6oFYDVFXkkzGcwuE49aqocjthBakWKBtqAyV7Y5MM642Lj7956KaJKNoaCsJaP
	pFqFo5Q8S7Z9MtLeG9Fvp4RjeOi4Z9XBas2et1/HEdrnI/zu/+hvs1zQ65pqiLka
	OGYq5XNgC7YC8fzvRHvbzWhiC1SANrkiH1Z2TCRfgjtg9j94Gs/uV72DFTTZmMdE
	nZvH3R4xOdbM+vJw52gTWGA9de7bjNl6IbZSlrWvJnrgpvQ0QTZ+gwq6b9gLmA7I
	4TIgYw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fvmhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:24:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so2443064c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571884; x=1794176684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=;
        b=YMwfAmHvPNyw4VxT/aqyojls14PsQQBS4ZH97i8bmWrcEPuZApoLHDgCGUZe/sK7U9
         jMziRPo7exP3cmTixvKHgNzrtaMJ42asFqbRfXgzSbZntOwDzhsc7svfjAMygwJJ/Epp
         8BxwPwvjYOVli0GgLHK6/69GsQMKXTyXiV6dhiDlPass9v10fo63RQ8PXbfYVgqeqUC0
         EaBJD5aXzIMNrITm0ge/wO5Hv4DyVlNMbTdp8X30LDSpsqE82+PI2870Mn0xme2bXWrn
         Pj2iQuXuWocE0XNCLxvY71iAFu2KbPGBCwuh56smefC5mpqhi0QgQqALAWvTV9JhbfRq
         zePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571884; x=1794176684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=;
        b=m9FNJlAhZEUFK1ANqHYs92ej4AfHcq0YpmeEGD9kPUWU/nJtCWXAhXMFOCgU90wpwR
         aUAHb8NaSb/h4iRXsmnD6mutC28zO1sq1nbAPanCvDhZGtto8bBiiTCXvvxqxA47zVJm
         goq6mwYwWOiMvScEeaXZeZXuyIqLOCc2KhdPPOICqXDSjatIUAQ0fpqBecAYHZygPCLm
         08WqjwhVddH0p3fH8HoHNpE+PdpvmYy19Ajqd0COvbgBoq7PrPfcI47/4dqPkzHywlft
         mo9n0PfjKrgMxL6iekN2Eyn95g04JH6vAQw3h/5HBZMM+pAloVGMFzumRFhHcBy3b44N
         xXkg==
X-Forwarded-Encrypted: i=1; AKwUvBzijrdHB3nXwamJnYSHSaHYPnbGLJHB4WLLJ230AqkI4WUBRDPI5H79JYX0RAFlbucbe+0/5KimbseuM1TT@vger.kernel.org
X-Gm-Message-State: AFq9FYIlOxHRQuxYijAUcYzK80/NF5ECHpqSW77wHpcgVsVRpn06xODA
	L0CQCkqnqq4R6sG7FmcwRsszqbEopfXMP8lqVipVWDFXsxGLeqr8QSIZtq5lZFG35n//tA2wSHv
	VQKOIv7CdjPpzsC4naeHve33yHAOSHjy+fEZtqVI05LVlK143O7BC9oWvMd2MeB8iFzsR
X-Gm-Gg: AYBFou1UX1Mq4IAsN1o7XP4euzw9K7QkIEMteessSVQTT7wJQs27w7Cd2O0jXHRC4bT
	Qs6CA2SQ8C3KYxSTmdHqg5Zmiw0uhnVkySHyNkY1IEhuvrQ4ryd6ttXIZU3oIXokO+o1Iq1TV4O
	2FngHdENcMvsCVkSC9LCpXwETQR0dzP6035MPYlhBEbtyj8lP59PQzoU6uBe5rBFH+FDVu6I9C3
	e876MsaVSIvR5WOIgUKxsBzymrtV5GJSfiLWGmN3bOAVVjYsXCZ7IUJFVDupG094U94gjGLpNrV
	rIOJoJphc84LLtHAEY2kaRdvXQN9zkATvbttiGs6ssBD/X6+KY9khrgMFUpXA9L5fgjWFSIMWQ8
	SyTjOuHkTQjt82g/iPFhpe3ozciIci7bchlViNGUsVjxCgdEMPK1VrWdFiglSR+WST0Z7XfDoUt
	pSEuaE9A==
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr13181331c88.0.1793571883955;
        Sun, 01 Nov 2026 14:24:43 -0800 (PST)
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr13181297c88.0.1793571883282;
        Sun, 01 Nov 2026 14:24:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:24:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:31 +0530
Subject: [PATCH v4 18/25] accel/qda: Add remote memory unmapping from the
 DSP address space
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
Message-Id: <20261102-v4-v4-18-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=10517;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=AWZQyFdzsOaF7etSPJghL5yJhJX0fEhF3SEzW9eDeRE=;
 b=wbP31vIPeLB5NewaMIgH4YiMQTC6PbubFXGit5A8McQrOa8OQITyBtgRNTs7S3TnueUrF/x0m
 3zGOcfNvkXQADGbYKzdxoc8uyyOIYjXWHSlotSqMdTQamPkhRyb6CyD
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXzAJ/bMIQhlTp
 GXHo1xLz61zIlNJpNxJvSQERZWYEt4GlefIMidl/3Cv/bVVmaQq2h/l+8wHG2nsz9SE21Su/yFq
 VHr4gd2tWbU5o+ZEv7fI3PzbClfDSp4=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae7bc2c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Up_xq6likoeVUbWbdXMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Hmkig9BzmOTgB9m-vvr4JrTUJsm1duta
X-Proofpoint-ORIG-GUID: Hmkig9BzmOTgB9m-vvr4JrTUJsm1duta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXwOvpmtcWO7og
 1W8FBn13uExp1ROrYtlHyvyBfORzS1yna8v+UUm6bmRV+Qj3epnJzXokHdLbTlB64IOa7Ivb5xm
 0hlepXJMoF6DyFQX2SUu5B2MSQQnfVQT4IZok/qUAmnGurv5vNgSrCMfLeAmb5MHAvLAV0LVM3f
 eVE0H8cClvMt9taW8hI+dixyjO3G6ToVmCfJbshFb2rnTrOkTq1ja5n1+kCDY3s6bVMIi4gfumT
 DFF5esgAUcOnzeXjIVGUiKsyQF0mnfZB3TGh4Q2WE/f0JzUrfwpx8OHGZl/M1qk+wSQIP+rhoKt
 zJbhYDXOWfCPtWkK2KEHsFZA98bm23kAgSOKVw0Zv+xiFDyyU1y2xLVaENcpTz6An4vTCY+8LtC
 yjW8RsIJAh2tGLNsNMvA0jpcvh0niQbdHritoGY8uECDSmosWX/e7uTysgopyPIKsPU58VgofMw
 HXlWrIRnLPB0+iiiPnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

A buffer mapped for the DSP stays mapped until it is explicitly
unmapped, so user space needs a way to take a mapping down once it is
no longer needed.

Add an ioctl that removes a mapping, naming it by the address that map
returned. As with map there are two flavours, selected by the request:
one matching the plain mapping and one matching the attribute-based
mapping, which also carries the DSP-side buffer identifier.

The buffer itself is kept alive by the handle it was created or
imported under, so unmapping does not touch it; the mapping and the
buffer have independent lifetimes and user space is expected to keep
the handle open for as long as the DSP uses the mapping.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 73 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h | 32 ++++++++++++++++++
 drivers/accel/qda/qda_ioctl.c   | 24 ++++++++++++++
 drivers/accel/qda/qda_ioctl.h   |  1 +
 include/uapi/drm/qda_accel.h    | 30 +++++++++++++++++
 6 files changed, 161 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 7f19380701d9..c5b41b869692 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -126,6 +126,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MMAP, qda_ioctl_mmap, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MUNMAP, qda_ioctl_munmap, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 744d7317cbe1..dbd14cd07cb2 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -1072,6 +1072,73 @@ static int qda_fastrpc_prepare_args_mem_map(struct qda_fastrpc_invoke_ctx *ctx,
 	return err;
 }
 
+/*
+ * INIT_MUNMAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_munmap_req_msg)	IN
+ */
+static int qda_fastrpc_prepare_args_munmap(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_unmap *uargs = argp;
+	struct qda_fastrpc_munmap_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	int err;
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MUNMAP, 1, 0);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 1);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, sizeof(*req));
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+
+	req = kernel_gem->virt;
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->vaddr = uargs->vaddrout;
+	req->size = uargs->size;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, req, sizeof(*req));
+	drm_gem_object_put(&kernel_gem->base);
+
+	return 0;
+}
+
+/*
+ * INIT_MEM_UNMAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_mem_unmap_req_msg)	IN
+ */
+static int qda_fastrpc_prepare_args_mem_unmap(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_unmap *uargs = argp;
+	struct qda_fastrpc_mem_unmap_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	int err;
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 1);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, sizeof(*req));
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+
+	req = kernel_gem->virt;
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->handle = uargs->dsp_handle;
+	req->vaddrin = uargs->vaddr;
+	req->len = uargs->size;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, req, sizeof(*req));
+	drm_gem_object_put(&kernel_gem->base);
+
+	return 0;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
@@ -1141,6 +1208,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 	case QDA_FASTRPC_RMID_INIT_MEM_MAP:
 		err = qda_fastrpc_prepare_args_mem_map(ctx, argp);
 		break;
+	case QDA_FASTRPC_RMID_INIT_MUNMAP:
+		err = qda_fastrpc_prepare_args_munmap(ctx, argp);
+		break;
+	case QDA_FASTRPC_RMID_INIT_MEM_UNMAP:
+		err = qda_fastrpc_prepare_args_mem_unmap(ctx, argp);
+		break;
 	case QDA_FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = qda_fastrpc_prepare_args_invoke(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 1bd696baa95c..889b41dc20b0 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -46,9 +46,11 @@ struct qda_session;
 /* Methods of the initialisation handle */
 #define QDA_FASTRPC_RMID_INIT_RELEASE		1
 #define QDA_FASTRPC_RMID_INIT_MMAP		4
+#define QDA_FASTRPC_RMID_INIT_MUNMAP		5
 #define QDA_FASTRPC_RMID_INIT_CREATE		6
 #define QDA_FASTRPC_RMID_INIT_CREATE_ATTR	7
 #define QDA_FASTRPC_RMID_INIT_MEM_MAP		10
+#define QDA_FASTRPC_RMID_INIT_MEM_UNMAP		11
 #define QDA_FASTRPC_RMID_INVOKE_DYNAMIC		0xFFFFFFFFU
 
 /* Handle the initialisation methods are addressed to */
@@ -197,6 +199,36 @@ struct qda_fastrpc_map_rsp_msg {
 	u64 vaddrout;
 };
 
+/**
+ * struct qda_fastrpc_munmap_req_msg - Request to remove a plain mapping
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_munmap_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @vaddr: Address the mapping was made at */
+	u64 vaddr;
+	/** @size: Length of the mapping in bytes */
+	u64 size;
+};
+
+/**
+ * struct qda_fastrpc_mem_unmap_req_msg - Request to remove an attribute-based mapping
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_mem_unmap_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @handle: Identifier the DSP tracks the buffer by */
+	s32 handle;
+	/** @vaddrin: Address the mapping was made at */
+	u64 vaddrin;
+	/** @len: Length of the mapping in bytes */
+	u64 len;
+};
+
 /**
  * struct qda_fastrpc_msg - FastRPC wire message for remote invocations
  *
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index cd3cea72f50e..17d1b488b4a9 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -197,6 +197,30 @@ int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_pri
 	}
 }
 
+/**
+ * qda_ioctl_munmap() - Remove a buffer's mapping from the DSP's address space
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_mem_unmap)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_mem_unmap *unmap_req = data;
+
+	switch (unmap_req->request) {
+	case QDA_REQUEST_MUNMAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MUNMAP, data,
+					  file_priv->driver_priv);
+	case QDA_REQUEST_MEM_UNMAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MEM_UNMAP, data,
+					  file_priv->driver_priv);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * qda_ioctl_invoke() - Run a method on the DSP
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index afb3ed0e132e..9c053349c3fa 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -16,6 +16,7 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index bd2d0f4308b1..43598ddef461 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -18,6 +18,7 @@ extern "C" {
 #define DRM_QDA_REMOTE_INVOKE		0x03
 #define DRM_QDA_REMOTE_SESSION_CREATE	0x04
 #define DRM_QDA_REMOTE_MMAP		0x05
+#define DRM_QDA_REMOTE_MUNMAP		0x06
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -32,11 +33,17 @@ extern "C" {
 		 struct drm_qda_init_create)
 #define DRM_IOCTL_QDA_REMOTE_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MMAP, \
 					 struct drm_qda_mem_map)
+#define DRM_IOCTL_QDA_REMOTE_MUNMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MUNMAP, \
+					 struct drm_qda_mem_unmap)
 
 /* Request types for drm_qda_mem_map.request */
 #define QDA_REQUEST_MMAP	1	/* Map a whole buffer */
 #define QDA_REQUEST_MEM_MAP	2	/* Map a region of a buffer, with attributes */
 
+/* Request types for drm_qda_mem_unmap.request */
+#define QDA_REQUEST_MUNMAP	1
+#define QDA_REQUEST_MEM_UNMAP	2
+
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME		1
 
@@ -173,6 +180,29 @@ struct drm_qda_mem_map {
 	__u64 vaddrout;
 };
 
+/**
+ * struct drm_qda_mem_unmap - Parameters for removing a DSP mapping
+ * @request: QDA_REQUEST_MUNMAP or QDA_REQUEST_MEM_UNMAP
+ * @dsp_handle: Identifier the DSP tracks the buffer by (QDA_REQUEST_MEM_UNMAP)
+ * @vaddr: Address the mapping was made at (QDA_REQUEST_MEM_UNMAP)
+ * @vaddrout: Address the mapping was made at (QDA_REQUEST_MUNMAP)
+ * @size: Length of the mapping in bytes
+ *
+ * Removes a mapping made with DRM_IOCTL_QDA_REMOTE_MMAP, named by the address
+ * that call returned in drm_qda_mem_map.vaddrout. The request must match the
+ * one the mapping was made with: QDA_REQUEST_MUNMAP uses @vaddrout and @size,
+ * QDA_REQUEST_MEM_UNMAP uses @dsp_handle, @vaddr and @size. The buffer is not
+ * affected, so its handle must stay open for as long as the DSP uses the
+ * mapping.
+ */
+struct drm_qda_mem_unmap {
+	__u32 request;
+	__s32 dsp_handle;
+	__u64 vaddr;
+	__u64 vaddrout;
+	__u64 size;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

