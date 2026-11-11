Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384396;
	b=I2SfqpJpPeTvM+TA5/6PlU7eDRsyatm1SlHm/S85EutUafeoVsO7t/gjBYfcT+APmwRl
	 1a9WrMu7ROBpKdu/tdf5dgK2tBahbA55ubong2psaM2JKmNeUvFprhIbg1aWemXzMiBWv
	 LENcaAg3F0SWJb1OpiFAd62GYQsLkJPlzS8IEG5aQyBorJp+4hguMIN9Z7MFdjDtmbK5L
	 X+FtX7WUuwwkUAMxlYHS98GWr/kEaJI2OmwFGrpvz1hQiNwRh+NM+M8kpT99ITDF4Eam0
	 n8CtnKEK+3GFBhwWZmkEd+2EaXzuM7mG2UEjUVwSbBbKUdH6yoluwaTF/C7WZPIf3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
	b=Pc2w6oAVToT1WQYEMwBKS4DqC5srpRdQRsgDoC30uk5UjiEHXei1YSBmdTdXJinqOkFo
	 pppG+ckE/oQef3yeX+FWlhH2xAGPqWeTs52+llk/zzbZEtIyxoc1smcLDR+/85ZddncfN
	 6vfqUUkFycvC5s9RH2Hzb89ahiAwhEosQe8zjJvjbeYTpnTM/h0JriaYO0ezbdhh18lN0
	 IX1n6ETq/BARb9VKLFtuZBmDpfAVbmAYI2yylm+CKBxMord/wdJL2HQ5f+EwXHxqf9kzt
	 ZNTuZBJ06f57FrH2WZlLy7m+tL/QIhUSiFvFNnGWfz1jSHO9L4qi+Fd0plVrpmkIaQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ahFmw8U0;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB560A5BE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBB560A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ahFmw8U0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4c9abc1824so408434766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384394; x=1794989194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=ahFmw8U0eeZvB6yv9lj/iRJo5flheWQupjk/oaf61Ec1dYOWMBk7CYVknnuBSe6KHs
         Q2aptZKfu2hDpSIqF/N3nu3smoEDel3zL/U6Zun6n5RxqvTTwmrIfpS4W63fmJK1hSUV
         ++6Iw4YuQn0dId1loASC2FBFFWhqATo09WL8qMb4Jn2Vx1vknwKS6Tf2onUn1a1lnCXu
         yUoN5nhZx9LNpant22fZNKo8jyb41eLQ9UCmyOEkdQPBcW1cLNI6gSa0LBHVJy2n2dM9
         K49xE1IMlTu4s9mm5PeaczQ61KX9BS3ZxTk4UrYdOMr91+YfUYETZwazyB84E/c8wyid
         Weuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384394; x=1794989194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=SdcT9W/qpmX8ydOeu9Ci2cJd8x6gH1DuQ0MQIO9zuJoa/7S6CFEL9z6ffwhnO3cTs7
         zKA+o3lJlHjpUFBeiMxgVq99pQ1Qp0mDXhquYSwPNM9zmnlG2coa4UpZWaZM959BFlst
         gvCxaoVkDaAVeIhBua+Ihf5ziQ0vKM3QyUivNS0G3Yf3tyXaz/IeJtGZDkwUQ7y4Pxio
         gv+2EuqKu6FdS7SH2Q1jnU6hZzV7Mt5G2Iz7NTfm0I1yLZVMB9AXdV3X1bI9qVxenw2P
         YjYPiABdWzEDzN2y5Mrj764qJHxgI1qiYsD+19zqmsGWYDGqtzIFygXPZtd6EvPMSRa+
         JdOQ==
X-Forwarded-Encrypted: i=1; AL+hErE/3QPNDxYFpu/g3epLG54JqsjPMY2TuT/9AwY/WdrYJgdYHoa7aQ3kgJ2U6UGEiyC89QzZtZOEYOHpL2Bg@vger.kernel.org
X-Gm-Message-State: APuU4Z8/lXecHPg6wRp5i+asYzJF6qL4rWEF2dQ/3pYGaAY8Cm+E7hjG
	7OD27yW3YmYx+EDMH/MH7DCVZAV3ZYkJHUwU7QBu/i5q50mOtnFDxCcwSgLsUFu6qw==
X-Gm-Gg: AYBFou2HATHgaqjtjZKJEeu3V7/xm1fV7ybgo5g3wbLnmxdxhazliE6WkEyzkRBtu15
	CMwuMrkYKdzFU+Ug149dTJznbkKFB/GO0eCSYBjSziDT6sQnGcWPWV5Wioei0HMgcT6w5d+QCg0
	c/KeFUj8Idg/gN7X5k+TVd6jeQGOr7TWQWI0144eUmT/gBXfATK6uS13X5V8tbWhToSGMsfDTP4
	px/nk6ScvqUNLVyLPaRM1pU9AdO+XLVZOggbQXhYhAhKBPm2BAji0h4YimHEbTYFYrub2Ns5AOw
	YicaRxeoPT1PiFUOZKcIXY/4vTGU8dXDw5FQchV5fhIa+IQtCEY5wYc1SVclHbZzWr/BTjhW0FI
	+etrFfa5D9H4BeMRJyBWJsoBaSRqT61pH+6HozLnCpBpNvBWKfk9cXFEIBlURU+YKJH9JYwwNZg
	rZln1GbAKrWdzjbBzwALC03jbKGW39naeK09NEaSZHqLINZ7FbR7aUn1MYzZ3EupIEVz8PYjQKM
	7jzaK7dROrFmzaNuE+Y87yODP3rmSUa5aHLWtzPyBIlhKNNGqEt2aBPt/nOdCkZhP7ZRUC3vF0u
	+KaqWohO57RHUIroG91/BiXLh/3foQi+rfsGs8GVNpwj+jHNwDAw0R6dLApYJasoiTnJMGDqaqB
	9DRw2MKVeGM81SnNdkVR/rismsD0hYAhlpcv6+NMD08np62R93Q+vpvu6aQLO9GS+err6VInknI
	MxG6zpfPhlfS0sZbDkOViAx1dOlAglHKW8fhlNTpwM13P4MpEOxy/W65FIbWfUDDVIOpMXoGw9R
	eD2olVYnPaMlMg3oGYuRRjX9tN9kKu/XbL/sUuU5gs1zLec5KN9DnP7E3pmfFN6YbnliX6ixVYT
	XCMiWESD/p/dxKwoN2Y=
X-Received: by 2002:a17:907:1ca6:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c5066b338dbmr122198366b.30.1794384394508;
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] soc: qcom: qmi: Take responses and indications only from looked-up servers
Date: Wed, 11 Nov 2026 09:06:28 +0100
Message-ID: <20261111080630.244427-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any local process can open an AF_QIPCRTR socket and send a datagram to
the port of a kernel QMI client. qrtr_local_enqueue() queues it no
matter which server the client socket is connected to, and
qmi_handle_message() passes responses and indications to the client's
handlers without looking at the sender. The ath11k and ath12k
REQUEST_MEM indication handlers, for one, then free the DMA memory that
the running firmware writes into.

A client handle learns its servers from the lookups it registered, and
qmi_recv_new_server() keeps them in lookup_results. Drop responses and
indications from any other address. Handles without a new_server
callback keep no lookup results and are left as they are.

Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/soc/qcom/qmi_interface.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 16e2e24b60968..ba9d973279145 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -469,6 +469,19 @@ static void qmi_handle_net_reset(struct qmi_handle *qmi)
 		qmi_send_new_server(qmi, svc);
 }
 
+static bool qmi_is_lookup_result(struct qmi_handle *qmi,
+				 struct sockaddr_qrtr *sq)
+{
+	struct qmi_service *svc;
+
+	list_for_each_entry(svc, &qmi->lookup_results, list_node) {
+		if (svc->node == sq->sq_node && svc->port == sq->sq_port)
+			return true;
+	}
+
+	return false;
+}
+
 static void qmi_handle_message(struct qmi_handle *qmi,
 			       struct sockaddr_qrtr *sq,
 			       const void *buf, size_t len)
@@ -485,6 +498,11 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 
 	hdr = buf;
 
+	/* A client takes responses and indications only from its servers */
+	if (qmi->ops.new_server && hdr->type != QMI_REQUEST &&
+	    !qmi_is_lookup_result(qmi, sq))
+		return;
+
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-- 
2.53.0

