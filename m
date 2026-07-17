Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFAF3D953C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326141; cv=none; b=E7w5x/FshBbP7HRWu+i10AAxFnigyasKlr4KEdajBFJk9Z++mP3WjHxCfSq5oT1CoG5nvWRq9w3X6k8YTHweiRYoUCAKiag8stgSv2oSPjHBdqs/wQQOlIHH/dmAu43qzUEK5rzxnTe36T3ZHmenJleH5H91xLxw2eeJBRSCGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326141; c=relaxed/simple;
	bh=sj2gFgGlkXOf7HmUOz2/0YiSYtXipVoVsXjVPqSBSH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnA9jIuJ1p4UspMoSN5/2HJxphr03stE+Ef7eCJSk0Akmpmnqgj/GdtM+zuWfFJ7YfloaIvFQnmXEK4wj3mTZLukLRKQT7KixQ0BdqaobMQQyzqZW7F6dzZu5QdQupb45khW4QDVOu3maKIn1meT6AnsrVyzpJIpNUnCcudl07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMjvmMY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5nP0AAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMjvmMY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5nP0AAr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtMjq2906085
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTHU+K66C/MTLyOO1XlHiv0lW5j5mAa4izNrPmhWl6Q=; b=HMjvmMY4s7Cbm3J2
	vUeTvV/9yTEppBGZyMC4fagMOXAwuDQmRECSt9nPb6OblOXOdpS82uzbYgP+NBQr
	ScpaGLDNRUFs8ZTxJX4QFEYs+HIzGVT1e5H9yiTy60Am9iHrJ88SmgVKUMsvaB2c
	t70T7LyM8LKynjegIxeRJu4FjFVMg14UCy1dGTMlXrPPThbR8kia3fADmZ6FGspx
	xXcukhBRrAp/UVyRNvpXoS2t8RK1iZacLpMQxbDaLPQwjGBgj/EGBiHZ5dBFC0wV
	fvKF5FZXfS8qRntObG/p/705N2jM36VTeQvrCQiHYeIydnWXo9S9msqIY8aEn+Zg
	iffg0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq90dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:08:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf44f2c49bso1062805ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784326138; x=1784930938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTHU+K66C/MTLyOO1XlHiv0lW5j5mAa4izNrPmhWl6Q=;
        b=g5nP0AArLMQw2UA+AlEbm/BaFNisy07yDaPgaq9vd7yv+RpcV2s2tBCa3fcL6dfoIN
         c2M4IG6NZX6Co0IBvtkfHy3t+lUy0arR2bGKlAnD47qKUEXNn8z/Sa3G7z2jD/los7i7
         jTiPG3o2/JG+8jWTXiEML7TpnT3Z6VAKIoyNX4oPLpPDzr60Ll7HctBT/7gdt8g0MQcv
         4eHAwH8px+pEk02JEduXGlHEq1TpgfAMahOur/IgGattctyjj6JVUk8ERY1MdIeqUtoX
         e2c7n7wfeEGCWuQkv/CLU7a6pETzWxmFErZt38x/qHBQEFqGUD3FhJJxnijYxqGUS7vn
         sv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784326138; x=1784930938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTHU+K66C/MTLyOO1XlHiv0lW5j5mAa4izNrPmhWl6Q=;
        b=EUuWLR4M/Jw0h0gy38oYmWk1C9oeCYFN84tjVW83FGqqfWGfAIuNJMscLQwh1pxkmo
         ekXejsPSj/RRCGTcMcAdhjOJdeZ6GOdSeGGD/Kh+oD/KB2j5mrf+Av9H9BUJB8EuaFjZ
         ErIZr8TCiEwxrj6zRQF0fdDDLumpPvElYfBF59agUHZv2kGjTsxzSAoJ0wYu8EaSHL/J
         7aAmnrHTJiUTOvaBv0WJcoTiUhFqdgEZpitvaPW0FLqwzWvUylLeRbSPnXFn3Un1/a1b
         HU7689cG236b6DY6jo5MIBkbAoPDFAwivHuTNmGOaHS8ocEnAOErQX3cde2C5qnFREZc
         6FEA==
X-Forwarded-Encrypted: i=1; AHgh+RqD4XmcPcPQVfxbdO4Z1BwSJrLrW25+g6lGiTJPb81sVNV8soal7YUt71t73w6U8t4e9Xuva/MamWSXuLHR@vger.kernel.org
X-Gm-Message-State: AOJu0YyTN+ZYprwSELVFVnZPAjZyKd4ULBtTHkp1bVt5TuRscLwEVki0
	w+N96DxJBzWmLJnfRAj2G3v9srGlbk1RY8axq7PU04DMRolec8/GYa2L0MTztCxCWevkM2JkzGS
	uv70CZrQR6Tfhc8WWCuBuFBQV8/xJXkHThB+MNCywJNUrTnvmP5ugifkiOAlPmTutYz2I
X-Gm-Gg: AfdE7cmg5g4HjtfaGP7TelPcdCXZgnTmkPhTxOwIEzmS0yV9KEbu1w0xM9mIkibCX0D
	6KKjGmrnMkCv1mVlmyfJueHd80NE6yoUZY//nz0tT0cghFtJEgMCFDK2Z066+a4t/gKrGE5efkT
	UsTDA4mJf2WyH96nYGSY6d88ca8xYrKjNI+gzbx5TNRyWu+YRII72Dq7WM5SXoxyKtfNUSjUdPC
	Yh/q9pPfJuTFVzz80NmVh6vHntu0Fsl/Hycqh5IMo2kT0h8mrv4lVtz7MOajWR7wXGc7eyrIHFe
	Hw8DaCxg/kBT9LStYtm8qm+VdDsJhWwZ/NSk/y4Q6jq5pXfYxO8ZbRxeS8q7cPdBOeAJ+zu9/l7
	7BUr41+GyFWjJoaDSrooSgh480T9nPsOEVNxZ8r987B+EXYo=
X-Received: by 2002:a17:903:2301:b0:2cc:f4d4:29aa with SMTP id d9443c01a7336-2cf349f3d04mr34757185ad.6.1784326137757;
        Fri, 17 Jul 2026 15:08:57 -0700 (PDT)
X-Received: by 2002:a17:903:2301:b0:2cc:f4d4:29aa with SMTP id d9443c01a7336-2cf349f3d04mr34757025ad.6.1784326137330;
        Fri, 17 Jul 2026 15:08:57 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7668667c88.1.2026.07.17.15.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 15:08:56 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:08:53 -0700
Subject: [PATCH 1/3] Bluetooth: hci_qca: Replace HCI_VENDOR_PKT usage with
 HCI_EV_VENDOR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-fix_vendor-v1-1-f22263c1175b@oss.qualcomm.com>
References: <20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com>
In-Reply-To: <20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyOSBTYWx0ZWRfXwRVvhCU1E76V
 1DWYlgf/Ixk3ARCgaiC5/dYQ2GROKRm7ViIYQvr6fV3B650gO6Axe23rNb9fm+azkdn4aLPFfSU
 ITM4W3PClYG3jB2jqW5MRrJaAUa77nA=
X-Proofpoint-ORIG-GUID: _Xp1K31LHkwFxiJ5l2lKd5MBsZ8lBe6E
X-Proofpoint-GUID: _Xp1K31LHkwFxiJ5l2lKd5MBsZ8lBe6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyOSBTYWx0ZWRfX7VHwFIZutnAX
 sFqgaiAqPc3Zoi/TG1wufJ3qlH8DTmtA5UsUnmbfpFCe8p30KR6tsPQglWrf3pmvqdqOHgp1BI6
 MWFArob2+m2j+IDQcXxyYDMnWztEyJBerxY1IU2cI112wEIlo6BVE8Sfmy7l8pMXg0XPCcvYZ+S
 NJdJsNaUKjbmE3KsXUXyiqc/TaeK77KcVRUMARO7N1PtLLjiy7FtUeBxnzyeNcdBxbyFKw+dfqg
 1J3Njtcz3XK42M5v6EtRJzPjJgNFP01QxBrKY6u4yETgpoYRu4sI8Amb+tjhim8V2vacV+ngQL+
 OMtA5s9m17RZrtXLIVtWceaLJnvQsA3qtIdHZ6chIeEi8yep4gWDCeCfeQnkI7gRf1FS6IE7XGd
 z6rBMki8p7JFQPCKhZ/ZplzYy2QdX6hccRurdH+Mt1+npV1qMUdjWjp0n1IGc7AZY4j9+lA4m1u
 6CD55wiH33bQy8/4diQ==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5aa7fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SK-ELO-gduZh6qpZz3UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170229

The macros below have different meanings even though they share the
same value 0xff:

  HCI_VENDOR_PKT: HCI packet indicator or type
  HCI_EV_VENDOR:  event code of a VSE

This usage of HCI_VENDOR_PKT is wrongly checking an event code.

Fix by using HCI_EV_VENDOR for event code.
Also fix warning "CHECK: Unnecessary parentheses around comparison"
given by checkpatch.pl.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bd29d422c209..f978087612ee 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1240,8 +1240,8 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	 * received we store dump into a file before closing hci. This
 	 * dump will help in triaging the issues.
 	 */
-	if ((skb->data[0] == HCI_VENDOR_PKT) &&
-	    (get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE))
+	if (skb->data[0] == HCI_EV_VENDOR &&
+	    get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE)
 		return qca_controller_memdump_event(hdev, skb);
 
 	return hci_recv_frame(hdev, skb);

-- 
2.34.1

