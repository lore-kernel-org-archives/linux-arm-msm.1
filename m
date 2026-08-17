Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C43F6615
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999833; cv=none; b=tPby510G2mh7U5hbjJRfTFMLkCEvSfkC98Kfzsgr4nAlQRA//1Qw4fIL3RGjWJvo8vAfradIqJV8EaQiO0oQY+MkZQPUQf6zJlXN/mQXk4ktNpVMotbrGI96m5A58D4y3nw3oxHvPdfMzJAoCn/wHbqV5Bza/F/jptn7rlxCvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999833; c=relaxed/simple;
	bh=hiKDUR2ZhrnU0CbtL3/1omHFpuRmEhvjUkaedO7oodY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuLbazyyA3GFKIS1S466r/HMCy6sRUyDVwLk3BMgNxqZCb6lGiukzlw62dHdcNSUvyZEy1ojXaKtNmtWX27qXkW+Ac9dTS7ET6KB02wEvDtcYgivQHTo1jw+K0bX5NIcLsbEqk9ic4f0HB1jrH1m5H9V4+9JiylS+OaodcDdxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4NGydDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YroRMFX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4NGydDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YroRMFX1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIR1L74167757
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qp1qdf6reNQ
	mVusA1JNp5ojvSmijOCCDWcz4TPn1Yts=; b=j4NGydDMjkJ1RKj/JqtWCy7Knf9
	FAFLJqndYWmguSq08qaO9sY1Z0mo0SCp4+AgKvVSpK1Vda08uwRroJLmowwn6jCq
	MvqtXUyBg/9t5WlmRQ39yIEI7qjMFGAntZU9LY+1EHKAIuFNZ0rlDtK3tZJhB7wI
	7imMMazaTe8Gqhgh2VB00X5dbKDUEXTg4U+7qTmteEERRvHZK1QGtRVwA1v1KBof
	W2vXAclkmqHk10GakOMa0Qds36hFljSZ2Uzy+HUb8+qX5hdbOPnoXsJjZauT5BAM
	Sr8XcX91iTw2vP/PTrXQIlzTd/TWKRuXePybfjhhiIg7d0305Q9FixuQ5YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ktt48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:50:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936d067836eso402534885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786999821; x=1787604621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp1qdf6reNQmVusA1JNp5ojvSmijOCCDWcz4TPn1Yts=;
        b=YroRMFX19rAconwzupMtuhaLq1WrG5UBLK8ogV9uKK5BFfNwGj5uDArfG/mGMPIVIF
         dBu8SSiFfpVjhIW0eSoRW+pPPR//YtYubcefB8hnmvVWjQ31nYMVTD2T3fGFcrbmkvko
         MVDOBdSLz8bANIBrp3NmWjqUFBoUTKmRVvBInQh9xKJjbC3VJEy97nYr87VQjttYJWFB
         sKt4pTgMBSfKh+quQc5W21WSlFoTWh10bx9cTuMRkqYZc/+GJ7qbcbNkYKFeTs82hT4d
         /CXhL8wE0PD/x8Pa4uwOzz7puHTWPnbGAqHUdzLXm2wZj+0gGbzKVPWkY/3743NddcQH
         xlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786999821; x=1787604621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp1qdf6reNQmVusA1JNp5ojvSmijOCCDWcz4TPn1Yts=;
        b=PatwzQmg0PE8BBzhci3AXpeITRjBztWGAWtEFgpPBPO1HHsa3h/FZlADaPq5pQHDda
         wOrYBV13fodowjCWzUirbaSSt1EXU2x98e+4XZVGOMM3QLCJP82Wi3aDH/TnJTUKzL63
         Nj+Omofw00xVwbj0n/eiEpNaDmtTrt8G8rvDddLgX48Sdelzg/uvpKvqf+MP7cxsqana
         dbTy1w7fOeStiRwlBS09wvvKHNPleXEhkLpj08OMUBu3l0XbATj6LTwTv5Id0hZMfQJl
         gr0EB80UVabBMwn1JJw5dpYqclvfqxgYUbEKkMe4O0VxW+K6CMrS4RWsPcU0unpiobUs
         Pa4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqPOMMwfHnV3EML7830cMV0fQSU6QfmhR0iAR5iwGhIdAV2DYfTgayNmcL7/OtvUWhblJxK6u5Nd2+O1wyx@vger.kernel.org
X-Gm-Message-State: AOJu0YyaepI8uiMnD5BEB3iK/545oUo/7jtlGaGk5pcv2613lGBT4txM
	kmbjoyzrNiDAP9XVDXzQi4UJbMXjUz7fwYNm6ZgGr0I4N+BUGL4pMAqyLAVrGlnu1eBjUY8CSHp
	CLzidivz8rG/wuYAVZMJX/OCBWbIy1IJEcdq4yJb9sLodljUz3Nwb9jAQamgxjuJvQzBT
X-Gm-Gg: AR+sD13o40P2axxUS/rw7zErKAQG89DMBtVpmQRyrLAjtR5Q9EjlODDk4J5I8l0Wadk
	HmCM0Uquq5UWm+fVMUwj6AS8pEP4kwJs9/WZuu9HlNB+QLKh2RhwWiJRgYHFzfiotaVfhM0+A+y
	divBdAh2C6Hm8QdZjzHhn11p4B/tc0kwJignyMoLowckGA91XjbWYMKfFOMwnx9TpVV2YXNaSei
	+cnIOcIpzH95xejTU07XuM2Y6+3HPNJ2wbNxa/YA4yCVMsWxNnbrVKuE3I9jAMiU0aAxDVbmVeM
	rMKClu7GFab/ZhYdBNvQgeUHqCGde+mN3Xm+IJbuh+qJX9EFyvbFYPhHa7m9OPT68cbPfmMjpoI
	esvxjy8h7LsdzAfWiErRsBxnroPZwQjvth2buB+5VQPRSWOmvgnyICvscoMcnqsd7cA9op2Qsgt
	/bPYyf55RQykRiaD8=
X-Received: by 2002:a05:620a:3d01:b0:915:a111:86ae with SMTP id af79cd13be357-936d238c318mr1909395785a.35.1786999821156;
        Mon, 17 Aug 2026 13:50:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3d01:b0:915:a111:86ae with SMTP id af79cd13be357-936d238c318mr1909393485a.35.1786999820683;
        Mon, 17 Aug 2026 13:50:20 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7b854sm101745866b.4.2026.08.17.13.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 13:50:19 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_core: Handle skb_clone() failure in hci_send_cmd_sync()
Date: Mon, 17 Aug 2026 22:50:17 +0200
Message-ID: <20260817205017.56524-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817205017.56524-1-johannes.goede@oss.qualcomm.com>
References: <20260817205017.56524-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pdSnlCKAAeE5ydRlr2ct9opRxqSZ7SlN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1OSBTYWx0ZWRfX1EBca0d18HVD
 aC7PifWQxGtz/wg3V3KjF3CC3tTWCbcmZP/7kWK3wkNiiq63nhmB/h4byfEiHbl5RAOQNCGDyK4
 oQAYVWLk07BT+n5hnQIDcasURpQM6Kk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1OSBTYWx0ZWRfX3mggww9Xj6qR
 2fXWk3laB62KGlwif6m4W/kBozKWBMZ+GzQonxALRfxwLkNYBukSMc17kUzSR/YFGHoJEuy3zch
 ohbcxF7R3mA7nLEvH2W7YEvT2hWs1ARb1N9ZmThOOZ+/q+zcxGlgrBoGLrMlEMDDSc5h0t5rbIF
 LXoK2Zp3t5ryvsYqsPMLkRaGb2w6w6iaNRDXVGtqJuyuyOJmveHXiYsoPcJJsxqWfG3d+GKeP2T
 5pVo9N8Y+NC8Er4FzGgYZDSBrhf7EYLroeHR3xKFRd0iSdYg9pCEI86Qa04lKXraY5R4Nov73Kj
 MX9trqEg9CEcwLeDrgKYOIvVRnZEJbM+I7J4JAEsRYoSKcmbUcWsYjPN1Gw51cwP7edABpJ41Le
 Oc0Xb2Jeqn4tlY3/0Jy5Jds+JfRsDQotwWRJrRS0bhPsvwsMoBaJ0FCa+VjKsPIcVtmenyJrDOv
 62Xz+FlYkKL21A24EdQ==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a83740e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=XAmQ0-y-R7DJRi3rB_UA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pdSnlCKAAeE5ydRlr2ct9opRxqSZ7SlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170159

From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>

hci_send_cmd_sync() does not handle the second skb_clone() failure as it
does the first one. At that point the command has already been sent and
HCI_CMD_PENDING is set, so an allocation failure leaves the flag set with
req_skb NULL. The response then matches nothing and the caller blocks for
HCI_INIT_TIMEOUT before getting -ETIMEDOUT, reporting a memory shortage as
a controller timeout.

Clear the flag, cancel the pending request with -ENOMEM so the caller fails
immediately instead of waiting out the timeout, and return -ENOMEM so
hci_cmd_work() does not arm cmd_timer for a request that no longer exists.

Clearing HCI_CMD_PENDING here is safe: all code touching that flag runs
from hdev->workqueue, which is an ordered workqueue, so those paths are
serialised and cannot race. The one exception is the cleanup added by
commit ed516e3f1aa6 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when
dropping the last request"), which runs on hci_dev_open_sync() failure and
from hci_dev_close_sync(), and the workqueue is stopped before that runs.

Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request callback")
Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 net/bluetooth/hci_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 8aeb3024428b..9585b42e7970 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4092,6 +4092,11 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
 	    !hci_dev_test_and_set_flag(hdev, HCI_CMD_PENDING)) {
 		kfree_skb(hdev->req_skb);
 		hdev->req_skb = skb_clone(hdev->sent_cmd, GFP_KERNEL);
+		if (!hdev->req_skb) {
+			hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
+			hci_cmd_sync_cancel_sync(hdev, ENOMEM);
+			err = -ENOMEM;
+		}
 	}
 
 	return err;
-- 
2.55.0

