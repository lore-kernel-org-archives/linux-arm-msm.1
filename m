Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660175;
	b=tNSux6A9MgW4ZykbF8qqu/bzWD30NrQd9DtuMyAVDzC1FBoeEK6xichv3Cy2fxF5NHNn
	 95GU+3TbJsW65mPQU9Ix+D3BO+rjSi+phiVrziPGBMl9ejtN0SBYIpnX5LRR24Y9hxQFb
	 9hxRVoCdlH0iNP9xyqdQECudfdMw+j4gCy7UiEg1rU/qhqK5T8okhM2v8aW9aRcX6gpRB
	 p+nQRfDTTeVgEzosSfV6dm7ftl3xJb+gxdg2UBD/oK6H96uQYlgHoCQT5ssNjiBEJXBBF
	 gS+jkj90TySx8kwIWtXafpMF2LkgjSp0BK7nO9LlLKcmGLsdmj+cb8A/sZEuPq2drTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=;
	b=HUgp4chdO+tXtdO+0kg+MT4Gvr0Dtz+7EAQHppz6SAXQ9+YyLfgzdplgriZB0Vo+aZu5
	 YMe0nmlrQ6XR3SGnKyK/GHPuAuhu/RRfaDcS8hXXxDVaY9K3FvDL8bSS4eMYkBtEYTt4R
	 oBQwfsGxZRz//6hiFFX20tRUporP3MN8+UW/mBKI3dhdQjHgN9utq7pm0EKN7iAPDMUbE
	 XujXnYFiC5DMUrGCy+L7U4WLOTzmGB0vPO5FGE1UFbjYTGIHlBt7hME5IOLih/3Cijkp2
	 Y6r/ZVsxtddTbUaGS6fnVmeIgOmgbNNxrgn9Db2+f8rM6/DFVna3u+pic7/wrO4mlfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awUZGDvU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea24wtUy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D7606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46D7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awUZGDvU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea24wtUy
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xuL31560103
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=; b=awUZGDvUo381zakE
	6IlU2NFPZS8CF4z1toImlJP1v4c1Us3D8S8tMGlDHsaLjViCgF5tKaRlScW2sGNR
	nzmedS4PMfnjR80vijvCqrG+GaG9VAtgMPp61NXNNJ+RGPWnoUrwzavCYwRD9Fqi
	Xu94BxbDRb0fejtCJuA7qXSkwI800z1MI2kh4i77allNd8iPzTyOwc1uN4mPJvyG
	HyzsOwQKdSGYfdPjTtbmSVQJ9M5NPr42HxJ+UdPWqwgtVfKifdlqH+nVZWQnYBBJ
	eGs2OR9c60sSgnLWeeuN0rZli8aJruEX5nBv+Y6TGTDLvc39pLaVUWJWwRKTO1A6
	EIc1wA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahn4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1812674c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660173; x=1793264973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=;
        b=Ea24wtUyaW/1mp5kCSKxinV7weiADb7vlc+rbTVs4Rr6MVQ0Ktx7fQOHqsL4vjeYLI
         ReKEHJ3LB9QnoXMjsiIJlhjxwkDxYHwlJfZwe7ZkbSJqKckXJS26Lug9qJ4EuoE2+5XW
         oZqsGwWsFJb9/ixpUl5dHVTkLAfM3hjjA44K3fDZMnjjcJeAcCJLAqqIPgei0WwpIKfR
         f/lk+QftV703uCBVWBgIp1FExn91gyvvvKd0M9SjAMb6Tq9LVgSbmIq6YL9P7vLEI8T1
         FKTVyCZBstxtJlM0Ecc+YUnNzjqWwtigzAZnXB5MG5rFA0EUfewhvAtxAaGpHVwDhtQJ
         Ci6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660173; x=1793264973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=;
        b=lma45CkFtSQ/0B5eMty8aNJ3wDsSb2qYfm4/O/duBfDwg0SRm/+73tFezeKXuw513j
         Zjrbqc8+ZTJZK8aQLGl0Wl9Nf1KNu7xKjM5NCmjU5nPgNZVNBu5/XsjXa6/LeFDkZ7BY
         2GjPSVxR/exZGylQsWZw1XJ1hnKb1XHVlRXzwJOVKLh5TG/HJIbMlvVC31se3r3X23u+
         k+EXtui7UGtBRxxBCNNWRUolnaIKw7uGP51/gXX9fwYCgpVR9HbZcMEBRcYiAJgvG4PJ
         ETAoK+utPMRg+zj//DbWx1WIAY8RVu9tXx1zuqfIzdQlXHbEfQ1v8d/MY05DYnJAKc1s
         1tUA==
X-Forwarded-Encrypted: i=1; AKwUvBzQa2i7l0qMRSCKojAaOX9lgDewyEyz5Up1hxD4IGSIfjHpj0evQ6gDPhDP3vczLSKv58xl6RJaxD7A1l3H@vger.kernel.org
X-Gm-Message-State: AFq9FYIWWrF4qmmO2u51VtynAMulm4Spt7HjPuVUXjy4a5PiUD0GX9Sd
	yJ4/+PA4Fc2VQ4PMsTcP/HnCJos05XI2+V0jUnXYXLwmN5W5sAaiWdvKxCeqyVlugJPfoOPNKIg
	JgoXvPAmgqjiteN/WV3Jh6LjEjl7in3cVmWE5Qi3w3GHLkeGOXIlz4UTGaW2opRIwCEkm
X-Gm-Gg: AYBFou2vc689HOtjb4DBuHZs9xeX724rllitFHS1gPCixzsacLQFb2ZfBVLk/ZvyTgq
	D0/fIwnDFyhlq8cpHLFtarSVcNPEyOlJMqPdBhQSqOPX5IjPnSO2JrXXhEFmZATjiH12qgwGnZk
	ShuKLspC2QP5Txkd5h+o9grDPIoUXTzq3MfNc/DhSsjXh+pFRmJ/cWY/HvwDPDgGo+8oCM+VsHQ
	Dlm/2OUG2o2Fax80tbCOAp7hjJTdX9Q5SjygHPVsqj2WxNqxWklTSJTQDqy+/AZ5EhqApZ/H2bz
	FLiW0HUAjP9DbdPl5AiW+DlUQXtlQkYuFmX/wfaKl9AwIjtcMe+JsDe8uK/+zJK0+KfOWdgy5vE
	YGaqFmQv1cVyZ+w1Je8wYmMgTCq0+svqI
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr6565154c88.15.1792660173230;
        Thu, 22 Oct 2026 02:09:33 -0700 (PDT)
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr6565116c88.15.1792660172672;
        Thu, 22 Oct 2026 02:09:32 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm20475694c88.4.2026.10.22.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:09:32 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:38:47 +0530
Subject: [PATCH v2 1/2] misc: fastrpc: fix NULL rpdev dereference when
 session alloc fails
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
Message-Id: <20261022-fastrpc-probe-fixes-v2-1-a6b3f6f62571@oss.qualcomm.com>
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
In-Reply-To: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660163; l=2456;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=gXjATeM4mZmReR8r0Cip4k+l0pcgcK7OC7jL7Usz15g=;
 b=8iJBr+ATdJCU8iVTzYlUb94TGIBcH2KOuljI0XoPmBRr5XGtpiQDEOswWN590/Yv2vamfMEy3
 TbUqejlm+2lDL+f2YkKmWMu7HVv5HlkgMxM3BKl9mdpWAdKCNExxSM6
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9f7e1D41UHMz
 u5/g5QtyBFQ/4XvbU57hL+PII4Ti9Fu5fs53UfnPZjTxlhMcaEjs/fH4VHaX+goAmX45nncaoB+
 M6e7NjGtfFCnH6ylz7Fee4wAEidUkvA0e3hiIqeRAYG+MSVV+UzSBatENhQnQTWIqBdNVQNaT4B
 exdxbTuKW72V/A3QDJfR3VlkUIZo8mLwNc8aE/AcqdgECHbc6lOQPlNW7FDu/RPki0nuWKPFv/B
 ZHttaKm30SHvoBAoqpgTlQX/zudWbXG8UCmHnS6lEFxyAquEp2GPAneHyhMSVaHlV7DeS9+KMet
 uu5p83pnO82ht3OiS2IAfKGZAvxa4Atq3z24Jk/9Ka2tTivXShJm73khv19C9WhrhTyU69Bfq1k
 VJbyjJx4h0cvweNVKRq39ZX2DUbDJfe3dkIV1jh+KY8h9a6dkkTaW0V/bb2oGa8ef26Kida4ZQ+
 lNxIBp6zTu2beNRxs0g==
X-Proofpoint-GUID: P7U7U3FvBGicZfbopWCT88JvX8hcM2UX
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d2cd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HPkHAgnwbDoOiCnvmVMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: P7U7U3FvBGicZfbopWCT88JvX8hcM2UX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXyrMAhRxkGfoj
 Pj9d+ztWrq8voSzGW0ackzMnjx4cNA7/gSx6dauJNFeIrMlD0/aglcOKxqSW/PmjbnrsIVP6cZq
 LBl8TBjCMvLGajH9VZP5c6tCIbBN/d4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

When a fastrpc client process dies abnormally without closing its file
descriptor, fastrpc_device_release() is never called and the compute-cb
session slot is never freed. The abnormal client death on the DSP side
triggers a glink channel teardown which propagates up through the rpmsg
bus and calls fastrpc_rpmsg_remove().

fastrpc_rpmsg_remove() nulls cctx->rpdev before calling
misc_deregister(). If a concurrent open() enters fastrpc_device_open()
in this window and fastrpc_session_alloc() returns NULL (sessions
exhausted by the leaked slot), the error path dereferences
cctx->rpdev->dev causing a NULL pointer dereference:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : fastrpc_device_open+0x1b8/0x258 [fastrpc]
  Call trace:
   fastrpc_device_open+0x1b8/0x258 [fastrpc] (P)
   misc_open+0xd8/0x1a0

Fix by moving misc_deregister() before rpdev = NULL. misc_open() and
misc_deregister() both take misc_mtx, so misc_deregister() will either
block until fastrpc_device_open() completes or prevent new opens from
entering it entirely.

Fixes: 7c11df42d0c7 ("misc: fastrpc: Fix device_open when no session is available")
Cc: stable@vger.kernel.org
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5dd1990d3e2a..f280bff2edf0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2697,6 +2697,12 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_user *user;
 	unsigned long flags;
 
+	if (cctx->fdevice)
+		misc_deregister(&cctx->fdevice->miscdev);
+
+	if (cctx->secure_fdevice)
+		misc_deregister(&cctx->secure_fdevice->miscdev);
+
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
 	cctx->rpdev = NULL;
@@ -2704,12 +2710,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (cctx->fdevice)
-		misc_deregister(&cctx->fdevice->miscdev);
-
-	if (cctx->secure_fdevice)
-		misc_deregister(&cctx->secure_fdevice->miscdev);
-
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 

-- 
2.34.1

