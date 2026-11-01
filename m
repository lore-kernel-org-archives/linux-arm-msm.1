Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571800;
	b=YXOeQfcGzZlvZ45+5Qmz6R2pj9QeoR26b//S7mfkdwPL+mRYOzKxuAeB4RnOFmILeUAZ
	 6yjKRuIThmAQqzHzWePgzAfMeieO656DdRbn2SBJIt6udRaU5+gwyucaY6zmRVdbPTvQF
	 f9inYtE1D+uKRpEbyqaeFSNtoll0BEewde3h0o/eewmhw2a/Xz4T80iHTuEfw/lR8LB2n
	 ckkBet+FJ6HdBVb88JqnayfN55L6XBEp1OdotV6WwPLANOYHkghPHiEy+AgsKjsh8k+6K
	 otA2Zx598SGJ5PAgqyBUPrbqXCSXSTWD5aRdPQLALiu90hWLz9tUEl4WNXgjDnKKbgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6hAngQeI7IIDUofUouLeERpmTXQYuhAy2ws/sx5TtTI=;
	b=FmSBIGO2INY4aH8fd/V3wePYtgL3dUuBvDU0BFzfXM+sRGB5i7+NbbMqOp6L7AwAfWot
	 DXg8ddQ+2WigJTC/TNuVoNziKDt8flIOoShdVrzD4WmX5WurecpONVycukexrVjKBOOr/
	 ofPUzb/7SJPkHo6X5fWRdS2J1OgGgVA8sL3hOLnqn7OEjiEpwCwW/N8f0KuK+5rHzLkKS
	 36v8qux/3F+goK/LCH7UFtUtvkQ/zu6LnW7xVKrlWoxAtVqEA2sKzFbi3ywNPsFyJHxlW
	 fP5bjJ1zH0Q+qmphnZAvERAvnot7UBjJ8hMyc9W/Vk1i+zssvNZB26W8BGqoSQWg8AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/7dJLB9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYq+xwwa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2604606E533
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2604606E533
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/7dJLB9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYq+xwwa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KJuIH2776948
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hAngQeI7IIDUofUouLeERpmTXQYuhAy2ws/sx5TtTI=; b=B/7dJLB9Nbs0mm6B
	7UyTWyFD24MFQbl9hRLuwwJyvW2Pkqahy083MUmxegnsdXVSXB8xFSrdN25mr+eb
	3nBq2vKLdIn1lS+VmoOYH1c7dGA1VP28riBvKCFGMc0sqQT2cpptjZI14ID4Nphe
	H3qkuRg0Yl9nmEek6SJZyV8ZYzBLQsQMR4OP/LW8CF9t16HraC2lVineNf1OKIcF
	OQ+Sf5CXGRuPVbHSpWcNBbkzzEvJ/ObXlurazu26Q19ZxUEWIDgxW88U82YJm1H1
	JFVU42YG4N31qawRMcxB2iWRoMdP8FkPLAZdOvCol1iwFZpbAb4zUhpWobNQfv5Y
	6r9HHg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fvmf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:23:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so11106080eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571798; x=1794176598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hAngQeI7IIDUofUouLeERpmTXQYuhAy2ws/sx5TtTI=;
        b=dYq+xwwa+SJIl3pHGWktK6NPzWTRPhaJaC/KRUdXhmlSvrnDFh+KtNeztyb91rQRIB
         jJ2g8/kXpdKVSCyz1CKULiRRVZ2q6CHcnPjBmcr7p1MdlA4Bl6++n9gASb5h1jCcQrfA
         IZkdMrsxgwogaE4BjPkXgpOBSvgNg7ifpvDwmEuPQWWxgX9Tj9xdKx+kVU9N/+1f9PtJ
         293rKG2jKhJcgYzS9+N2XBLD2uxGbey+1MeO/W7elfIs6TLkySjajmXA9X3HwgpX/AYp
         1pzb/kyxK4d9UYPgAqZ8wr1Y6DZtpgSR//ZZZvRVnc50UYk7hUHz2DziDMtBlUUGhILy
         LEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571798; x=1794176598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hAngQeI7IIDUofUouLeERpmTXQYuhAy2ws/sx5TtTI=;
        b=CzTK2zpF05P3BqpEcTlBEttM44D06Mtx3lELIx1Cz/knXpofYdDSJeTqefBCJjQbaX
         EOgnXB6fBrObyhjnYdfejsGEU88q6IC2pkHtOXV5v38rWBoa5b6HtktRhzKYGFd6dP/A
         bhnt9T/kBJWa6lXuMo7px6qXspx4d/OHLP1CR6PI4iuYyZ59TvHJYCKaDvNM7AVA58Fk
         PSg/mLgHz2SVBJEqp3fobPcjd3Ezcp/0yH1pioanByo8k1fnvd39vi5z4oGp2IDHwqke
         nDkypvdpsrX/zXWRnO0drzUYEItNKI6rcPacCpmH/zvt7UxWJ4uODn4EnGblbNZ4Cm2J
         di9A==
X-Forwarded-Encrypted: i=1; AKwUvBzmbUTFP9LhbzobpVNoQgzr4dHPmY/I3oZt/KcbNvK3my2k05y3zn6RpOgkb7XwCQ+hQN+vFSN2t5/4rXpe@vger.kernel.org
X-Gm-Message-State: AFq9FYK2GL/ELQNqjyJnWnRJCWielZYwanmBDtqZUbxixOVwsfOkj8UF
	+x/+s2Pz+wBSbNNmNHjXPIMIfjbeD8z4H7+9Oqk7Z67ZmlWE3d1o8v4Cw+uoiftQLAu73dSb6Zo
	pkqjVHU5rK08peMkWtj8Gc8458U6b0SdrweIxsdmBaz4F+v7fQgzv5aXz14QfiWaTaAjl
X-Gm-Gg: AYBFou2do0p+WJa9T6T/oxss6d2AVioiXY1X4M+XQTcc/SZ3LTN5qfQNlOtgcTDmXXO
	1F982EbqWH5bPghNbsJBONZxqP2SjvXlMQvoG48deCRw2cgLpZH6XOH3DDvvN5GAiDjA8TJ7agM
	HGn6eUl47RzM9SzTmsJy/88hYoA+iLoM1VBi70ftAoixqkyf/DBJtCYxuEbGt+XLCSpBnWuzsZf
	raNTwYRqoIQdxI4PVoDdLHIXKokoupDiZwh8xSfd/K3g9mvm8OU+H8FGa8Hjo9xrsY6VK91ziBU
	aniTN1AvyJmCtcEpezvaLuKKkTSTsuuEQ1dovB9YnlSyi7TAQn/KXb+zHLyJSCVCuNQFWycnBIh
	26UimKoKJdzqbKxsx4BA27ghatdsnTpqak+AIEa0B5aWoIg4sn+PRGlaroiHBXrZFJDC1EHGiZR
	OMhju85Q==
X-Received: by 2002:a05:7022:eb50:10b0:14d:baf5:c415 with SMTP id a92af1059eb24-1ac5a0b4324mr13670500c88.7.1793571798058;
        Sun, 01 Nov 2026 14:23:18 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:14d:baf5:c415 with SMTP id a92af1059eb24-1ac5a0b4324mr13670447c88.7.1793571797517;
        Sun, 01 Nov 2026 14:23:17 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:23:17 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:23 +0530
Subject: [PATCH v4 10/25] accel/qda: Add FastRPC invocation contexts
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
Message-Id: <20261102-v4-v4-10-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=7819;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=OD3k7RrCmW9oauZ0PUx0c77NvqwBu0DZeJzvWifkB6Q=;
 b=kDCg0ffCmqyD731qeGMGd/ogCfQFcFX/x6TPDxuthnttChry9ql7CUHg/MsdY5JMh8/Q681bR
 WhZSe89JLa4Bq9hgQWpnb41kcHqH1r8F0FYTuiUMPJd8MTCydhpAkCL
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX/JWc9/V6tEl3
 3DehKAfVaSw4HKk7V/9hT82E3SYrXOMuk1AC8zNSex9VEzJ5b3whQdhuqxaaIEh4KTjrdwBlhVX
 TlO2auPeHUJds8geHD7ntTw9UiG5EBI=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae7bbd6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eymhiwfUR0HS8TxM7qgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vt5opV5t-ylhdySEgmM01kVClH0-oFxz
X-Proofpoint-ORIG-GUID: vt5opV5t-ylhdySEgmM01kVClH0-oFxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX9LJHkihqYSl8
 tiurT5WsSlg9nfOwE3fHUP6jwgazVThvaBSoeU/U68XCaLk8RB6Tgv9Y5KVA8pxhfzxHe8LQ9i+
 qK+us1gQDiJjw8MOU8HVLNRSharD4KZlMHLBrS10ntQqa9lBrFbCmOpnkEkCGhXFcwDT4mZlLKn
 mRUyhKtTM99eTSjmWewnK+y/H0Vk/PV8XLCzG0sRm0tmZnIYa3y2rECVVYtJpMIHfx7nRVrTrJv
 jVU5gYsYScjR6hpR1OFR3NnyBB7q+TN33JoYp0tfOksfxKl17rO5nu+kqVoQPqUjWLC6Ge2JpEm
 CNytfs/sWEu9eg6IVEZR+28ROwKF0ROhybYP8sLvAj1l4I/mKv8sb5OJ5FdaTcST8kS64/BChSf
 m6UEjyXCK02ypO93p/Iiei6KsHD8pG4y/PJxlSVubYPlMAH4u3YSsP0I3L9LLHPyqKmxTeuSjdF
 DlBz7UzA5r/U0Hd/JzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

Running something on the DSP means sending it a message and waiting for
the reply. Add the bookkeeping for an invocation that has been sent and
not yet answered, before there is anything to send.

The DSP identifies an invocation by a context value it echoes back in
its response, so each invocation gets an entry in a per-device lookup
table and the entry's index is placed in that value. The index is only 8
bits wide and is reused as soon as its invocation is freed, so a late or
duplicate response could otherwise name an ID that now belongs to a
different invocation and complete it early, with its caller then reading
a buffer the DSP is still writing. To tell the two apart, each context
also carries a sequence number that does not repeat in practice, for the
response handler to check.

An invocation is removed from the table only when its last reference is
dropped, never when its caller gives up waiting, so an ID cannot be
reused while the old invocation can still be found and completed. The
number of invocations in flight on one device is bounded by the size of
the ID space, which also bounds what they can allocate.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile      |  1 +
 drivers/accel/qda/qda_drv.c     |  3 ++
 drivers/accel/qda/qda_drv.h     |  6 ++++
 drivers/accel/qda/qda_fastrpc.c | 63 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h | 54 +++++++++++++++++++++++++++++++++++
 5 files changed, 127 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 0996e4ed5798..aee69cd7d150 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_fastrpc.o \
 	qda_gem.o \
 	qda_ioctl.o \
 	qda_legacy_ops.o \
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 21113deceaad..bdfb23c3c0b1 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -100,6 +100,8 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 
 	INIT_LIST_HEAD(&qdev->cb_devs);
 	mutex_init(&qdev->import_lock);
+	xa_init_flags(&qdev->ctx_xa, XA_FLAGS_ALLOC1);
+	atomic64_set(&qdev->ctx_seq, 0);
 
 	return qdev;
 }
@@ -122,6 +124,7 @@ int qda_init_device(struct qda_dev *qdev, int num_cbs)
 void qda_deinit_device(struct qda_dev *qdev)
 {
 	qda_memory_manager_exit(qdev->iommu_mgr);
+	xa_destroy(&qdev->ctx_xa);
 	mutex_destroy(&qdev->import_lock);
 }
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index c04f19e5a91b..b7cbb1667adb 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -6,12 +6,14 @@
 #ifndef __QDA_DRV_H__
 #define __QDA_DRV_H__
 
+#include <linux/atomic.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -75,6 +77,10 @@ struct qda_dev {
 	 * calling file to.
 	 */
 	struct qda_session *importing_session;
+	/** @ctx_xa: Invocations in flight, keyed by context ID */
+	struct xarray ctx_xa;
+	/** @ctx_seq: Distinguishes invocations that reuse a context ID */
+	atomic64_t ctx_seq;
 	/** @soc_data: Per-SoC DSP integration parameters */
 	const struct qda_soc_data *soc_data;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
new file mode 100644
index 000000000000..14d9da8c20b3
--- /dev/null
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/bitfield.h>
+#include <linux/slab.h>
+#include "qda_drv.h"
+#include "qda_fastrpc.h"
+
+/**
+ * qda_fastrpc_context_free() - Release an invocation
+ * @ref: Reference counter embedded in the invocation
+ *
+ * Runs when the last reference goes. The invocation leaves the lookup table
+ * here and not earlier, so that its ID cannot be handed to a new invocation
+ * while this one can still be found and completed.
+ */
+void qda_fastrpc_context_free(struct kref *ref)
+{
+	struct qda_fastrpc_invoke_ctx *ctx =
+		container_of(ref, struct qda_fastrpc_invoke_ctx, refcount);
+
+	xa_erase(&ctx->qdev->ctx_xa, FIELD_GET(QDA_FASTRPC_CTXID_MASK, ctx->ctxid));
+	kfree(ctx);
+}
+
+/**
+ * qda_fastrpc_context_alloc() - Allocate an invocation and give it an ID
+ * @qdev: Device the invocation is issued on
+ *
+ * The caller holds the initial reference and drops it with
+ * qda_fastrpc_context_free().
+ *
+ * Return: The new invocation, or ERR_PTR on failure
+ */
+struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev)
+{
+	struct qda_fastrpc_invoke_ctx *ctx;
+	u32 id;
+	int ret;
+
+	ctx = kzalloc_obj(*ctx);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	init_completion(&ctx->work);
+	kref_init(&ctx->refcount);
+	ctx->qdev = qdev;
+	/* Anything but a status the DSP could send, until it answers */
+	ctx->retval = -1;
+
+	/* ID 0 is never used, so a zeroed context in a response matches nothing */
+	ret = xa_alloc(&qdev->ctx_xa, &id, ctx, XA_LIMIT(1, QDA_FASTRPC_CTXID_MAX),
+		       GFP_KERNEL);
+	if (ret) {
+		kfree(ctx);
+		return ERR_PTR(ret);
+	}
+
+	ctx->ctxid = FIELD_PREP(QDA_FASTRPC_CTXID_MASK, id) |
+		     FIELD_PREP(QDA_FASTRPC_CTXID_SEQ_MASK,
+				(u64)atomic64_inc_return(&qdev->ctx_seq));
+
+	return ctx;
+}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
new file mode 100644
index 000000000000..face3b3336b6
--- /dev/null
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_FASTRPC_H__
+#define __QDA_FASTRPC_H__
+
+#include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/kref.h>
+#include <linux/types.h>
+
+struct qda_dev;
+
+/*
+ * Layout of the context the DSP echoes back in its response:
+ *   [63:16] sequence number
+ *   [15:8]  context ID, the key in the device's lookup table
+ *   [7:0]   reserved for the protection domain, set when the message is built
+ *
+ * The context ID is narrow and is reused as soon as its invocation is freed,
+ * so a late or duplicate response could name an ID that now belongs to a
+ * newer invocation. The sequence number, which never repeats in practice,
+ * lets the response handler tell the two apart.
+ */
+#define QDA_FASTRPC_CTXID_MASK		GENMASK_ULL(15, 8)
+#define QDA_FASTRPC_CTXID_SEQ_MASK	GENMASK_ULL(63, 16)
+#define QDA_FASTRPC_CTXID_MAX		(QDA_FASTRPC_CTXID_MASK >> 8)
+
+/**
+ * struct qda_fastrpc_invoke_ctx - One invocation in flight
+ */
+struct qda_fastrpc_invoke_ctx {
+	/** @qdev: Device the invocation was issued on */
+	struct qda_dev *qdev;
+	/** @ctxid: Wire context with the protection domain bits clear */
+	u64 ctxid;
+	/** @retval: Status the DSP reported, or an error if it never answered */
+	int retval;
+	/** @work: Completed once the DSP has answered */
+	struct completion work;
+	/**
+	 * @refcount: Keeps the invocation alive for everyone who may still
+	 * touch it: the caller and, once a message is sent, the response
+	 * handler.
+	 */
+	struct kref refcount;
+};
+
+struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev);
+void qda_fastrpc_context_free(struct kref *ref);
+
+#endif /* __QDA_FASTRPC_H__ */

-- 
2.34.1

