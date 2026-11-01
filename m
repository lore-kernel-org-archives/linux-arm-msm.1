Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571908;
	b=K437r9ZpcizVQndwFrjPJMEL1Tezt4uuGonRMJxS+PvD0sV7MwOR3+6x8BMWmDBi3WpH
	 g4oycFr4OwzYZ54/4MZ0boa6gvlrviVKOIhAw2+S3LwK0q2rSx5XpAZfcOqNiS3d8OH4z
	 8IqPQ1VOIeAas8CIzFS0ZlsAvcYrSCY+T7+1hn4Y9CxtVKf6TCh1MzD3/tRtmCvseOkeE
	 F1h3STvlEswqWKhl1T6vjjpPJQ/fCKvvMiOmNF9aSsBLKrSsFKhpg/ylOs2z7pDkLm8Gt
	 algD8SgIkyi+QX4BPJyBqnLdh9PcNBPP7u4e8Ql5eBGIyqdyHt06gKPjYYnkbZAQfuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=;
	b=dKMJYTt94O4Q4D71UfW9xecoO+DDcU+dTQXvg8wfClROUp43L7zWIt1g61q82pgzrZOz
	 a0qmiLQ+59E1TwqDOJSg+Wl7qBojJsfZz9OuO7iaWgvUCjtSZ+Rp8xw7QNlX5O02Eb2so
	 30kN2Mq6uymoohWQ+kVo6oE1V4kezoar5L8bTCLF5SeiJYXG4/zixAzsfBD4JdaD/hln+
	 awuXVTCbQlobpiPZ1hhgWgWly7cqqgNPNzCbvGxc8q6GtauAGdcH+LlT8c4V2qGch3QSt
	 4xsW1Baml1oGJxwW7K6nzJycgBL2aYyFBFffd4CNGohqw8zHeWddV5OntciiC4RSNdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTsDdANT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XepIU/3n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85257606E538
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85257606E538
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTsDdANT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XepIU/3n
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK3jc1801279
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=; b=cTsDdANT+CVHpJ7n
	TF/0dr51+Vp1UOKcp3hMzxcH0SjtquH3VxObwlXrk8sXfjI5uk9Cfrz76gVYie83
	HuSmlU16MGwJcu1aOYl2LzcoDUVs2nUkVAqqn4uERduj/Q/Fr8tdQSkhqUqgLJaw
	NfPHoJc0GME1WGWhkI6kuvGeqTZk4NfAgusNS6EwlMEWp4vFPpPtL53ZncOjFmom
	hqvzkJmkCeTAi/aPhQ4agQIs3LqLk7eSfd7o7JLhqUaEB1LFNkxgYI7soCiPGDSB
	WCFJTuK8r2V67XHicUtZdvfQM95rPUbIXWIBOa1Eb+qTwCebxEVYZaqH9/oFKuHb
	j6wyDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duca6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:25:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so3356338eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571906; x=1794176706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=;
        b=XepIU/3naQQ5kiQsM8A2FXTXzseh4de9+yqWgYnjBWFyLFeIFoxRC+QXfMmI60MOHl
         uiJq1esxVG/h0O2PNgKistaeyuuEykeMaGzs49zzqv6OGvReja0RpW0SkoB0fM59kvIP
         b/hlyaOuedxati9vxm3bJs4GmKVEDLjm24zn9HylZhjEh8Z7oecj+3UQlgKbpz4uXJyZ
         U9AnCldwbYN2YrkfMSaf2d3VZHCkmYPZyB4HDP3XyRYmqKC1C0Fzogi/zTiiBk7dYuhb
         EbP4zeK8CW3FouILSH5lDDVRjHDFepQblu4J1caN/uc+ErLCJOfdbjLBwjUIUbCX0uTd
         KJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571906; x=1794176706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=;
        b=R6eRos0V4CaFfvlVCrTs7KrVpf8zvivcFMphUqiPBte89jCFA6c5aBeAgYCnb8I0Xd
         4zDfDD7xWcUvRFR+dR4vEG2eoEnzTElqpAvR5/6UHQ6xnqVK3ukWNPcRbpdlBsmSPs/q
         C9vUEETa9AGa15QDvKTKWRbj5CrBxIOwk4sZR9Y+3PME62wVka47CgciU+IJ6VwHtC7w
         lj39RjB043LegYvOZ8TavWzPv0E5GSkD1fr2fuwj9C0lmKofRHDHYyeyczS6qIxWDAQA
         Nyf+fL9cq35RQwce8TY8lph4+20wwqJaxbjK9c3Qjmgo7ibDeVbvDzcgkcoeyqrSxceo
         eE+A==
X-Forwarded-Encrypted: i=1; AKwUvBwTbJ5/hZg32ox1DuHdqt8UspKspfiDH7z94ogw9gelc5yPrxuygPcP5HkVfgUXo66xy2zw86q7W8UarSCw@vger.kernel.org
X-Gm-Message-State: AFq9FYKcjQKDCyNZxjr5Ef7pW/cjbBeSb96DKtDKCUtkxdDQe97/b8/V
	1IduwqQUOeN/qzdktEDaWGtn801TcsO8CBmyRPDa3YQB3l+PBa6gUkiMBAXQ5Db4x1BEc5V1xg3
	DmAzeLp53wS+7uFP1/aOwXG/0UqukWU+gSEdWY5EStmT4WyHEsXVVAiWtRRiFQF7wut4f
X-Gm-Gg: AYBFou0QswsbbotS0DO6ArfsLAIpvBa0hi7s9wCXItkCDuTU3kUW7udrVb15YbryPQU
	jVlz+VIzsZzAVbXD/04K2Fgy/C2pDfDY+AKRE6vggYuHDYC+tfegejt9CVRlRVrqh9zAQiQUoa5
	G5EyHC9xm+YPEP6SxUwzBJ1/KrTI+Q/0jeFegW79IHez2uDwiDjzEyqSP8+oNYE0/SXNCZw9ZIV
	kfTu8hiO1z4kmOT9bJikAC5s7qVATWYF70E0QTUov744Ep45yjBcvhI5IG9MgAtMQveSh6/anQZ
	Io9f1M2VQnxISjOYNxIrMs5UBIZpAyRSB81ZElhCIKTAM5QVkPDLbins9o1m0ixR+5NoMqojGm6
	SaAnICjVqIWK3LnDhMg3u/yspXjcSnx5grXL5SMEUdjREP+MDX4H/mYFfJaZFZsHhE11+wHy3kp
	sMsOOhqQ==
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10364560c88.9.1793571905401;
        Sun, 01 Nov 2026 14:25:05 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10364505c88.9.1793571904702;
        Sun, 01 Nov 2026 14:25:04 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:04 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:33 +0530
Subject: [PATCH v4 20/25] accel/qda: Add remote attach to root and sensors
 protection domains
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
Message-Id: <20261102-v4-v4-20-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=8348;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=IpYZwb3O28tUIvOFQ4pGq7xILpeDE1PdYhg3VDvGSE0=;
 b=OY1kuQblYQsTaKRNHoXh3Km9t9aloNB+ftcoXFkOIiNT6eldptBfN2TChamNI9OdRzVeVwEm6
 lXI1WUnY9ezDfLjm4sn8ZlWmBVZfwXfdhhlSR/2blbgoMy2j5w/vVXE
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae7bc42 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lFo-LjhiPMwFrTsBpIEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Ben0hrnd0A6uNGDeu1mW9BeHF_Mc2R1D
X-Proofpoint-GUID: Ben0hrnd0A6uNGDeu1mW9BeHF_Mc2R1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX4NVmJzii6cHF
 qfqfSBHO0yp3/HHXDlND4xetfotel3gd1hH7B8b1D1Yp7jrwOGOpF9rfbNoAvmRwCd6kFz39AH6
 kRdmv4RwCTiP0uUi12m2cSkdjkPiaiFp/B/WkUqVYas9NSk+b4JoeNATe5jvW98upU0ZF/iwCDT
 l6D8O0ezYVemFCVgufCA3lG/dhCi7lTcyii4bQ5rP4tnxxOifq5D3+2lJSbGO1D9Wv7+CZcj3Ii
 VTV+IqBDbrqt16RAy0ydHTE4XcMt2i6GTWtN/5FQIFqRPMkgghX4agKK7b+c6u0H9j8PMI8hpsn
 EcoXOCmEhkcjQvyVU7mVn4802CMaJ+rws8IdVByyfS8FIQLuLUcZgDzzeU69aJghVOyFbgfWpRS
 QtS0awBqu0+F1946At4qmKCDcDZB97gGBZa5PnexHZDAfm3+ZlyhQpy218M23dqkuFcq9KyaERB
 55tUb3AnAMokITM3EnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXwTNNrWJd2abK
 F4uP9/QXJb1hWVOgqyafLZxa6aBERVUmelAA2RZBgfosCza9M5C4eJhwIh0oB/ECnk3hZz2d2ys
 V1NjZvLxQLpEIfN2snoobVxrwe+xE58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Some daemons need to reach a protection domain that already exists on
the DSP, rather than create a new user process with
DRM_IOCTL_QDA_REMOTE_SESSION_CREATE. Add an ioctl that attaches the
calling session to one, directing every later request on that session
at the attached domain.

Root and Sensors PD attach send the same message to the DSP, which
tells them apart by the domain the request is directed at. The session
only switches domain once the DSP has accepted the attach, and attaching
is refused once a process has been created on the session.

Attaching requires CAP_SYS_ADMIN.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 13 +++++++++----
 drivers/accel/qda/qda_fastrpc.h |  2 ++
 drivers/accel/qda/qda_ioctl.c   | 36 ++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h   |  1 +
 include/uapi/drm/qda_accel.h    | 25 +++++++++++++++++++++++++
 6 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index c5b41b869692..1e72dce769b9 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -127,6 +127,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MMAP, qda_ioctl_mmap, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MUNMAP, qda_ioctl_munmap, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_ATTACH, qda_ioctl_attach, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index b35604fce630..5bf55b7953c8 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -819,15 +819,15 @@ static int qda_fastrpc_use_elf_obj(struct qda_fastrpc_invoke_ctx *ctx,
 }
 
 /*
- * INIT_RELEASE packed layout:
+ * INIT_RELEASE and INIT_ATTACH packed layout:
  *   [0] remote_session_id	sizeof(int)	IN
  */
-static int qda_fastrpc_prepare_args_release_process(struct qda_fastrpc_invoke_ctx *ctx)
+static int qda_fastrpc_prepare_args_session(struct qda_fastrpc_invoke_ctx *ctx, u32 rmid)
 {
 	struct qda_gem_obj *kernel_gem;
 	int err;
 
-	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_RELEASE, 1, 0);
+	ctx->sc = QDA_FASTRPC_SCALARS(rmid, 1, 0);
 	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
 
 	err = alloc_kernel_args(ctx, 1);
@@ -1211,7 +1211,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 
 	switch (ctx->type) {
 	case QDA_FASTRPC_RMID_INIT_RELEASE:
-		err = qda_fastrpc_prepare_args_release_process(ctx);
+		err = qda_fastrpc_prepare_args_session(ctx, QDA_FASTRPC_RMID_INIT_RELEASE);
+		break;
+	case QDA_FASTRPC_RMID_INIT_ATTACH:
+		/* The DSP tells the domains apart by the one the request is directed at */
+		ctx->pd = *(int *)argp;
+		err = qda_fastrpc_prepare_args_session(ctx, QDA_FASTRPC_RMID_INIT_ATTACH);
 		break;
 	case QDA_FASTRPC_RMID_INIT_CREATE:
 		/* The new process is in the user PD, and so is the request creating it */
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 10a99bbfa383..29e1c3946d60 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -44,6 +44,7 @@ struct qda_session;
 #define QDA_FASTRPC_MAX_CRCLIST		64	/* CRC list entries */
 
 /* Methods of the initialisation handle */
+#define QDA_FASTRPC_RMID_INIT_ATTACH		0
 #define QDA_FASTRPC_RMID_INIT_RELEASE		1
 #define QDA_FASTRPC_RMID_INIT_MMAP		4
 #define QDA_FASTRPC_RMID_INIT_MUNMAP		5
@@ -59,6 +60,7 @@ struct qda_session;
 /* Protection domains a request can be directed at */
 #define QDA_ROOT_PD			0
 #define QDA_USER_PD			1
+#define QDA_SENSORS_PD			2
 
 /* Largest ELF image a process may be created from */
 #define QDA_FASTRPC_INIT_FILELEN_MAX	(4 * 1024 * 1024)
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 999afa9e70c2..9b8cccfea1e3 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -121,6 +121,8 @@ static int qda_fastrpc_invoke(u32 type, void *data, struct qda_session *session)
 	if (type == QDA_FASTRPC_RMID_INIT_CREATE) {
 		qda_session_set_init_mem(session, ctx->init_mem_gem_obj);
 		WRITE_ONCE(session->pd, QDA_USER_PD);
+	} else if (type == QDA_FASTRPC_RMID_INIT_ATTACH) {
+		WRITE_ONCE(session->pd, ctx->pd);
 	}
 
 out_put:
@@ -174,6 +176,40 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct qda_session *session)
 	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_RELEASE, NULL, session);
 }
 
+/**
+ * qda_ioctl_attach() - Attach to a DSP-resident protection domain
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_remote_attach)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_remote_attach *args = data;
+	struct qda_session *session = file_priv->driver_priv;
+	int pd;
+
+	if (args->pad)
+		return -EINVAL;
+
+	switch (args->pd_type) {
+	case QDA_ATTACH_ROOT_PD:
+		pd = QDA_ROOT_PD;
+		break;
+	case QDA_ATTACH_SENSORS_PD:
+		pd = QDA_SENSORS_PD;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (READ_ONCE(session->init_mem_gem_obj))
+		return -EBUSY;
+
+	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_ATTACH, &pd, session);
+}
+
 /**
  * qda_ioctl_mmap() - Map a buffer into the DSP's address space
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 9b868189df0a..f6f5d64e36ce 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -19,6 +19,7 @@ int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_p
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 int qda_session_mem_map(struct qda_session *session, struct qda_mem_map_args *args);
 int qda_session_mem_unmap(struct qda_session *session, struct drm_qda_mem_unmap *unmap);
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 43598ddef461..59ad5b8cc997 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -19,6 +19,7 @@ extern "C" {
 #define DRM_QDA_REMOTE_SESSION_CREATE	0x04
 #define DRM_QDA_REMOTE_MMAP		0x05
 #define DRM_QDA_REMOTE_MUNMAP		0x06
+#define DRM_QDA_REMOTE_SESSION_ATTACH	0x07
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -35,6 +36,9 @@ extern "C" {
 					 struct drm_qda_mem_map)
 #define DRM_IOCTL_QDA_REMOTE_MUNMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MUNMAP, \
 					 struct drm_qda_mem_unmap)
+#define DRM_IOCTL_QDA_REMOTE_SESSION_ATTACH					\
+	DRM_IOW(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_ATTACH,		\
+		struct drm_qda_remote_attach)
 
 /* Request types for drm_qda_mem_map.request */
 #define QDA_REQUEST_MMAP	1	/* Map a whole buffer */
@@ -203,6 +207,27 @@ struct drm_qda_mem_unmap {
 	__u64 size;
 };
 
+/* Protection domains for drm_qda_remote_attach.pd_type */
+#define QDA_ATTACH_ROOT_PD	1
+#define QDA_ATTACH_SENSORS_PD	2
+
+/**
+ * struct drm_qda_remote_attach - Parameters for attaching to a DSP protection domain
+ * @pd_type: QDA_ATTACH_ROOT_PD or QDA_ATTACH_SENSORS_PD
+ * @pad: Must be zero
+ *
+ * Binds this file to a protection domain that already exists on the DSP,
+ * instead of creating one with DRM_IOCTL_QDA_REMOTE_SESSION_CREATE. Every
+ * later request on the file is directed at it. Fails with EBUSY if a process
+ * has already been created on the file.
+ *
+ * Requires CAP_SYS_ADMIN.
+ */
+struct drm_qda_remote_attach {
+	__u32 pd_type;
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

